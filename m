Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9F2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5f8BNGzj2OByoPvskvqwGDgiUC9QQz7w6fWEEjqF/k=; b=0nr83vewyGrqHv9InZLF/7v5Ov
	nnxCsISaNonVrlNB91uGZYVCEUoxL+90XhYqmud3JQ0unjS9B1rqq+YQot4UXjKdWpc3Dj/SKgNVm
	sDwNtTbJ3aDbNjj6fNTzS0HA9CW7CQfjsgUH5A8OySZnCDFm1SEAVdqR+NAJNI6UjFeos+M563OQh
	4KWSdrMF9wOEG5efBYEWBb3neiGhuUNN+fuElMQ2YtvGl3zGN6ABiMlftBoXdXMgCpf3CkIAdgaBH
	Ma2uEczCsqUqAakk3UT87Z2S3oKzY0ES6ZO548Vwpt7Lz42xk4N2BOJS7bRZ5unQ4lby/w/5In2CU
	kZ88iUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4As-00000000jXf-0R4E;
	Tue, 06 Oct 2026 12:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4Ao-00000000jWi-1NY0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:21:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPFXA1707631
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 12:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z5f8BNGzj2OByoPvskvqwGDg
	iUC9QQz7w6fWEEjqF/k=; b=TcWiLFfdX0LJuVMZ18iuI6Jl/+QXSLur/mBnovyV
	CRNhe66+8ajLa+1HUeGAWRfzcfBzb7R7Jzmj6DFfPgk08AjLbETC6oclEDyk7loi
	6t9Mem04GdDOksmmRi9HepbGbwaLzfaOVSVC9YxSg0IqB/Na0D0fVD1UBvKQKHTM
	tIGBn9in2L8ldGopQlp3MUDNQlxqqFSFKwxXcAqGgj9AjaLgMfeYllVy34U1voPh
	Q7T8GUS6ZH6gntF+bqtw08YUAJ8SsCgZx52chvePGlL2qAFMJSqgLTSgImALRf3H
	Tnt9ipgraQ1iCqvvi7MXXTF24PwPBW3k3frxnHLEAbycLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc50hq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 12:21:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a556c43so67751416d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791289291; x=1791894091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z5f8BNGzj2OByoPvskvqwGDgiUC9QQz7w6fWEEjqF/k=;
        b=igLu0vQzRk3QygjTYMO9o4nAll/HQiNS8glyIkc+NTcQOqu7axG2jODu3m0J80/me/
         yiEKzIBzHMhPDXipc9Xr1pM1xF+1V1NxbenJDbPFEBut17qoFJnu+WnGxtsql7LnO9pX
         bguIbFTCnO84mEFurpbIQreTydEfhLwdc/jGBopwIi3AF52ncIl0l89SnfRDcpOJmF0W
         1E88ei7+/sKtruHjPJJoLbDoWZX0dIEWgeiK2JGuUMyVv0eTUcyCq4xR7FgRFmZo2AnH
         fbUSTGhW1tg1cQkrOV2wsHpMrOnkrF+kmZ9PItm8FREf2jGMIR8L94sJjdde1zQit1cP
         wEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791289291; x=1791894091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5f8BNGzj2OByoPvskvqwGDgiUC9QQz7w6fWEEjqF/k=;
        b=C9fdKL+TxqIH+Vn0VvynzPXo5B9tWdWoiP/6Or1AP0VoGrR050v4ck80zrW58BlCta
         z9JMuCyAffe4YPPL0+maA8DTEDUSo6wL/k6GxsOlxgvm4TFXN3qDzlT9b8yBCxvUsgU3
         x0hT7jeZbtlYynEEFLiFE242F9xMwdtpz6BQKN4JCopAvMvDu6wSpr9luON/+aFVVXL5
         3aaU5/zfbS9i+V+YjnZgRk2h5VatrSkFaVMdW+41azwM7k2jwHtuxtYTFASrF4cdWYy8
         lcbkYRxBodvWB9SxCniCCdlRqbxWIFBktmK8VL8enMrSv3OqMsBNdfRvev5Ti4M3owsG
         ChyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJLOBz9aNjtCMjkZXmAOWP5yiNxxTEdWu9kr7L9DmjbrDWUcFftSDjZuyWZpUjRZNkv9fd7k19MG+81624YnAt@lists.infradead.org
X-Gm-Message-State: AFuF++kZXB7eWpCJBNGRDXbmr5+UetBC0blHLzq9qs92urc0tI/acnr1
	u/JTXcIhymWVowIjnYUp4JTuFBj/ix9W5cTH+vbxGSoN7LyBp4MEM1waCIRiJ+ONAfZRsc3Ja0a
	DgpnEtbxSEiTclgB5FM5+VDLlOvD0/jteAfuIYb4mk3enVXmD7L/tE5iia0KmA/UhW8ehg0JyLY
	E1+g==
X-Gm-Gg: AYBFou1418OtZZO0JgnFe3e1T9eYFmxIPjTnSqc6Y1tbC05mHf0I/dyN5NlNx+Ctr2H
	ytfvn7lS2zu+ihOG1dycYm3+Nk2P6dERdO2qG1gATfsT+zjbRLp1cPLLjeeEmHl7HQEfO/p3Xk1
	X3fajSMIxKuZZSM+kftQ/ga+qe612rw9UOrHih5xe4JGsTaSNcQy4cl2bayuvE5F6TIE5rJv6el
	aSBYdauBQnSx3kC6E0ATAmwXZBrXUZB9znI2CCOezF/PD08b1XE+X/RJ72KZt9Ne8MNLsMQC3sx
	bCmtvHU4foA8hiH7yvBqvBs2bnppLekz0nrNZWwZ0+SdK4YcquPfmIv+kkROQy1h2p8yO7oOZf/
	Rhp7jalQzegLaOg==
X-Received: by 2002:a05:620a:26a9:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93e8f531b27mr198163085a.59.1791289290522;
        Tue, 06 Oct 2026 05:21:30 -0700 (PDT)
X-Received: by 2002:a05:620a:26a9:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93e8f531b27mr198156085a.59.1791289289924;
        Tue, 06 Oct 2026 05:21:29 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289e77sm10409233f8f.21.2026.10.06.05.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:21:28 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:21:28 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
        Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <asTnyCWBTMC-B191@lore-desk>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <179128376932.2231598.7510820392039419594@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xowIYDwRSgTsKp6W"
Content-Disposition: inline
In-Reply-To: <179128376932.2231598.7510820392039419594@kernel.org>
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4e7cd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=DvzmiShtAS2h_ptsr6QA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=41xhF3IbKvr52oIostYA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0OSBTYWx0ZWRfX+VNf9swREr3Y
 W8pU11HzPx2XMFOZAHc4DgcBn7T7UN3rdA5fhwgHgf6HRC6wgh/i+zzAkfqC2yoNYJBtSgP1Jks
 dyOzG8gVauoqm9ibGzDVOK7S1QTruC8=
X-Proofpoint-GUID: nbpVrjcS6uVTF7LYTtdkWHDB5ntgaoWG
X-Proofpoint-ORIG-GUID: nbpVrjcS6uVTF7LYTtdkWHDB5ntgaoWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0OSBTYWx0ZWRfXw/Y+cI6cvQlo
 iR8c68KyOHT7BiFLAkVz8X9US2Er+0j4wq3DE4MI4wo5EXeCAw6KIO/E+59bJsIBzUTWW7rWVCs
 7LzKiktk8b6UQqf7FqDTaEi7RL3L9X0sbL5rgC33jl6DoMn2eKg1i1F0zx6NO2dfHR0XuAyV6fk
 9gE33xoEnx4AD5C4BHj6Q/8WW3WG0e0sVPepk1D0n8r+dbcCoDy2jAvTI54kYgtH0otXJ0c49t4
 1qq9GeGrdW/ckgJhhDdmFbEMxFlwvYCMg2OtNQf4zWF1LZTz08InuGLxik1/qRQ/1AG4qGNA0dK
 5nW0/dVpZMPz4oQJUi6PmGS6qElfqBcvbwbXkxt4bMDIc67WLJHqZCZyxSIgvsfOCsJiwoFCwMT
 VP/RFyM7E9ClafeDvBUnTw+x3burIXdY2iVngyUBzm634mTUc8HcTrm41sq/+R6b+BUHmgFBgid
 sXLe1xSV5cyFE+sCr3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_052135_121765_B31FEE6A 
X-CRM114-Status: GOOD (  21.17  )
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

--xowIYDwRSgTsKp6W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a theoretical issue found during code inspection.

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--xowIYDwRSgTsKp6W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasTnyAAKCRA6cBh0uS2t
rMg1AP9v/VzOkL2KWMhFrdvcFRagaZkWaJ5iym10aMMZrYr2ZQD/ZuXdvASU16J9
OwpZ4BB/pQX016iaD7kKw/CX7SJWaQk=
=LW+l
-----END PGP SIGNATURE-----

--xowIYDwRSgTsKp6W--

