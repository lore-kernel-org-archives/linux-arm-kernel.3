Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86921CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwAVVDCRlRix98sQkEjepCstOH1RiFvVFbweyqzpRZc=; b=KPdoqdjKUAZgRazOVqtVBSOa0I
	jYqEb9kmDn2Ifyhy88WePsSC9sZPqYMd6/9aU632Wwm9NM7yBQZXARC1X4rNmCBz21mqbb4v+H/oT
	geQc0EsfYrrF5Na5S05N+DJLrg1eZjvk/VnUpxI0H9hUCd8BpCtrur6VaxGq0jkr48GhGVqIm6uPJ
	jVFycZtk8eTtQMqjRXMewG1OvzDsJKlKvUakaLEik0iTgc/exvFKUVatMyPtxff84izAUzHfhJwPd
	CUccBgvtlrwsyltYmH7SW7YlRd9JMoK49qQvRv0XUsW/DVQofYtAq/XKfjyXRUI8DQ+3cQEE5oZU4
	L+psS+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMet-0000000BTMU-3uYt;
	Mon, 12 Oct 2026 20:30:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMer-0000000BTM0-0gXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:30:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJNa8L3230021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mwAVVDCRlRix98sQkEjepCst
	OH1RiFvVFbweyqzpRZc=; b=GA9ZyJox15J5NJie40dVRCpwKUtWlh6tcoNuBh63
	cmpinXdeADUTGHRel5O3OeZWlN+FgjDysfflNdUJlxOUcy1GKfbysr6KeyKhD99p
	AgrEfNVocbw4NSJaCLhB8BQdWLghFIq6CYLS+lZezFWIE5QlNF61nsF2FJgFT1QQ
	TXOTw84r19D94h3/ciK6Kmo9FcyHjE2Lm57GcMRuBrxcbArCmV8Em7ARcHmLrPps
	sQmapk6mQScWAZl3i2rc2gvgYAhMFGr/MK1Mhymn913cBhlNGAueq6Sz+hF6Kf/Z
	zDegDnt7URXd+PqNWeBjK/J73orDqtHhAGo7o1jyM0haNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjs77r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:30:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so532131885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791837003; x=1792441803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwAVVDCRlRix98sQkEjepCstOH1RiFvVFbweyqzpRZc=;
        b=Fn2s70kM00mYZWXcJdwbkLGhKj2vRvu5pxyT7neAENJVgMErkAT1Nu/rbGO24Ogiu6
         5fhpNJuTbimvB7kEbjI1KP7cNOPaAfJEDNuNzKDIdZxG35gFfuixKZkLe7YMzFnoOREt
         YuxNtx/3fxxPZF4XoyOvkqhO7EX/03OMSjO4luALIQpeeV4Q0yKm+yg/Ckr9Zqa04trz
         DWCAbq1o2uY3JLyysmaxD8sB8R7/JdHszSDTWVmRiRXymQu+wMAGZ5Ic5/ziD4+IGIRR
         X+El9Xy0v4EloYQ8khFb6eWW/G9rkC2JBb4jP7FPyLN9IbyEOQ09s3eCDKK2HFmH1txa
         8Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837003; x=1792441803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwAVVDCRlRix98sQkEjepCstOH1RiFvVFbweyqzpRZc=;
        b=BvEPjDH3UQGo5cVh6Yhw0QTFnS+eH3d/KQfS3WmAI71lEulWiLYLH5234lEBJMS5MF
         F+C4KOD2tlTAAREcxvsXK0v816g/KmUR10VU7ajuqqlvYr4iFaXjfFOmmuAStS2wTjvy
         zYhmcAB1T63SnwggT9DFa/LnmpMLh2vmYVrM4bEcFHzRA/nnW6A0blvGvR87BDzm2gT1
         hNOUoN2FfOH4kkgQ9u3gPi150f7J5+vIcBIbxgEQaUfbSbpEsGBZmG9dsRFoTAELaXv3
         cq6iYdYzu4R/f+FLXGdQ9tZRAeAtJf0it21MLLiB77tzWILXIb0OB5Hbi4tkQZawWqEj
         L9uQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+8YHgfBNUAh8ArfV11oN17WNzxNE6ESzEEBdt+iBI6dw7PqXLKnzi4870xaMb0UThwBEsFnN8buHO86kUk1pg@lists.infradead.org
X-Gm-Message-State: AFq9FYJkf4Pu94UkzUQF8x3/DGj3cJjBn0Sw41AUh55LgKrB+iqvNIcc
	xa76ij5UvIM8RO4koVDLKXdHyYyx8ZGcNeAvyeBtLpscpOWxKYZ7Z808NJY8VJPWI5oNCp/qZ2V
	BTqOFnO+Rb0I6auupCGXcHkEF0qg1vAJ7VVqayo108IbTHLJZzs9AZs9S7WgS2+xcXUBC45kXVr
	zfng==
X-Gm-Gg: AYBFou3yEqjZhfbmI5MburaoAyFrYPrFUTXRdzocFvh9mgq3WdZbMblYhjRTlISvoaH
	VisxxyY+FibXa0bZdGwT/S01XTQG9gLGO3sp+qlgOUl5yph9kPCAn52krBbSpvpZ6UBdj+6K82F
	nntBc0p3yKlNbzEk4gQ6NHAVFm6mHDUI3WEPQKmp24CfGyo/tT9P0+ymu4Dt3BSQvyeqe/d9OL0
	OHIqsXE/mzo63jH8FDFyYiIr6XZ62y+1avGXiiFjSwN9GFutka6lgok3uxv7CLBhMRVyEf8YeLV
	SaXNIDP8ZhfANFGdAC/Qc+wnuYQ/murzrK1f9qVtZ1EippSI2h12jlBIjApKoKuUkUeHSJfiyy/
	bkZY5XpuVxlR4WQ==
X-Received: by 2002:a05:620a:19a1:b0:93e:653e:698b with SMTP id af79cd13be357-93ebd27d873mr1663643885a.55.1791837003290;
        Mon, 12 Oct 2026 13:30:03 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:93e:653e:698b with SMTP id af79cd13be357-93ebd27d873mr1663640685a.55.1791837002753;
        Mon, 12 Oct 2026 13:30:02 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de096922dsm1001134f8f.8.2026.10.12.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:30:00 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:30:00 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <as1DSAxuXDJ9hIIM@lore-desk>
References: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
 <179154182368.2527009.383686573505818394@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKjh0wB5J+VbIG+m"
Content-Disposition: inline
In-Reply-To: <179154182368.2527009.383686573505818394@kernel.org>
X-Proofpoint-GUID: rJg9EwRcPjVgQsELoYHG13JL_QrnP-iZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4MSBTYWx0ZWRfX+mySKhlIseF6
 d3QCyg1c5Rf4u2VGz8koFXVKEZpMXWRj/+QaZ3bm3aPxL5/ZzVOuoVTBexOa5jC+ebzDWG+75WF
 jWBRAJqxsq+qgLCA3m/L4+/TOsyohMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4MSBTYWx0ZWRfXyNBbQQW9/Yy0
 GuC9ujrRQz1H+tIxB2q18tGi9rPaFguo4wVsMHjj+z4G7mqUV0gIDq6YPFal0z0eezJv4lfrBHS
 UfEjoI3BqOFZsAqKlF+pq1lWXfD53zd8nYPJzccK3xaO+rVSSqRog8bvTOAIlTBCniJHRK7LxLW
 iYhR9uEHXVYLwoW+Kye+QX/KwIadkKONcMMU/VfTHkIwWSsdrFlMA5JlcVjUnAbZUsCJWtI6s8K
 hWZLuEOv26uQT6dzq/2v0AHWOZGmN5Wu7NJdJcBL2skLKanYks8Hz0DvLInenhV2QUzgxjmTcfP
 FC+rygdQ1v0zlyCbTMuf1uo4HAylj740WWq57EZaPtW72uf5kMp94Er8Aqy7KxDpBbVR2MpWbt1
 eD1rECrGVaGYIc41nUO0v420Yy6sFyr+f8Oj6gSzqc/oU8+l7yR4RFPrkrhQ9nSa9mXo/LMdBqT
 Uo3V62saOTh0i4EjPUg==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd434c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wfrYX8O7EWgUh0Dss7UA:9
 a=CjuIK1q_8ugA:10 a=2sSK_cnNksaZuBzH8zMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rJg9EwRcPjVgQsELoYHG13JL_QrnP-iZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_133005_331292_D5112A39 
X-CRM114-Status: GOOD (  23.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--kKjh0wB5J+VbIG+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I will fix sashiko's reported issues in v6.

Regards,
Lorenzo

--kKjh0wB5J+VbIG+m
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas1DSAAKCRA6cBh0uS2t
rKejAP4gV7duzIkrdPWPXvIjqkWPfXtxyWImDmCZVcRrr7dkIgD/USVZbJLTAVU+
+L4mMOrD5VRwd1aTXUsiPcjZwQbL7gE=
=spw1
-----END PGP SIGNATURE-----

--kKjh0wB5J+VbIG+m--

