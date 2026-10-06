Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332CCCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcOil/NwtMA68u6bwhNQDlDq9DYU9sJ5Fd/m/3qw0dE=; b=c77xbfcdnDZwPmV+H1T4fg2XKa
	UAbeHEgVfIDkFzrvOLdD0DWOQdGzp0KtX3tZ4YZDlZLH4Uj7P0GSJbGEpn15NbfdWg2HVkkrTfwuA
	0XTyYweFpPr55pz5zF9amIJbcGr7rKSILwwsyTGOQeAX02fwfLKIFsSWbyEv3FnV8cGYOir11w9hd
	csM6YJFqLQ7/i5qwDuPXOE3f9CqnlKM3n3uXws6Bb0pI+RvZzpmdkfUhjwNsMiuGO4FBbjDtrTFbr
	+k+y72UxW7kgtTZOl5k3YO4efXXq5jE8yuAXGbs1OBsKhTYp0S1MT+PQuhbx6RzuZaB45fWyqROY3
	IpSrM3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1gp-00000000PPX-2IT9;
	Tue, 06 Oct 2026 09:42:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1gm-00000000PP9-2mZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:42:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eAgj3269398
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 09:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcOil/NwtMA68u6bwhNQDlDq
	9DYU9sJ5Fd/m/3qw0dE=; b=JAMvpwADuXrLTUegRGlnTjHlueQHFC0euuqJquGL
	D05bY9Eh3b2UpEWUvXHXhd1E9Vj4MEgiAGctfWGpk2XrscciFmQE/g19uhIEaz+U
	GzjdntXXpE61qJAJVHglA/OMGfvdZMWObm1xleHT2W53A5ikl0C9q4r76dbNMnJt
	O99AKPrtup0WIdbS8NeuVTZ5kFz8I7Tk/T4/s+YOcszJ/I/uq63H1QhtgFB0hEDC
	ZWfxnt7TUeS6R0OtYlaXu0z+JvRnW5eZynBwQuyUhkYCz3ndwVamAXEDP1pnFHCr
	CWgvuspiOk9fQ6DWhWal49RlYivZU2VmuN2uuNtaBERCyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukabx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:42:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so482084685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279743; x=1791884543; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcOil/NwtMA68u6bwhNQDlDq9DYU9sJ5Fd/m/3qw0dE=;
        b=Ar53jZDmwvFO3v9uoGZF93wko8j+QamxfbJWCypXxs5Dq/J9NE6nolv5RdvpJXBP4e
         Iz3+i/KVIv9d1ZVb8r/UNwlVHPtwTyYIHdClT8pXxS6vOdAZtlBMilinbdU04zwyoNjF
         NbWh0dyoUxNUurhlWAQfz32Q0OvAvn7TYmIJkxF0Pg43RoThYHlvTVHFahUz5zTmO7O5
         MB1tmk3tOvcoIRHGlxX4xkA45atJEcmygFpW2SZAftU4pWwK7ieTPWvUwuWt35ZsJQak
         UJxlFRmQ/nNyPvA3Ufny7mVgrQ2sjGcxDMn35zGC2p+zs7OtNnKQbl7L3gaB6ieFObFL
         aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279743; x=1791884543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcOil/NwtMA68u6bwhNQDlDq9DYU9sJ5Fd/m/3qw0dE=;
        b=B1wOfllDDLknd4fNwzDLQ1Fnntdj3gv0kLgKvXjA0VvK0xBobXZ0XEeDSY9vnR8A07
         f3IHc5KpRhJ3wlfk8hcIUZGJkJEnNtnnuxc0XIOb69CbnwuphexJvHNj2q6wfCklso+W
         xlY0hJHSJIPb8++xuA4mcbglJ41y8oPqucaaa0bEYXHIsSCvqmh4HoiHJeAZrf957MwT
         +CxHjealEYZW0ADU1w04HI7Kh3CdtZkUDcNXGi99B/A27oT6cVZnh64Avvmq3x8ioU7B
         hbR+pyeO9Y40aOC3NVW25vLfAxrpnUXvZ/sYcPZb9pmvux/fOavYauqa0ob9o2e20PDy
         qGUg==
X-Forwarded-Encrypted: i=1; AKwUvBy9hJWotDJfxzwA2WfxjSpJ0Lo2/8dRfxCvzHN8tE8I+8g0uo9dZkb9zduBtNRMS8fTsMX6ECoIktHo3e0kvdJh@lists.infradead.org
X-Gm-Message-State: AFuF++lRTFLbkEvHngfLnFul7xIr0fQshi5Ls58uUWrEgMd4vDtE75NK
	UuSVNFdEq9sa4Vz2sSrmZBBlIpwwEvcgtgnZyP8Woc8YFY2yXVKvRYuQiCk14osiIxeoE4w/C6d
	BwPSGMXYWv9AcHqxkt9HumpnNNjamW03oY1BiAw2wA6z+P77aGi/j/jM6m2lxmeGVdIRwGxFbcH
	Ye7Q==
X-Gm-Gg: AYBFou2Asx0j5E/xFNeWzgwo4/YxbnDXpTxDqL7A41u6ZMhVWFE/eDVoPC/SwsfYB+m
	/RR93ylaqS885v9IegqTPO6/aVbiqcFG7kHdENkSqN6pMPcdpgCzCnhUMStGhgLUW+mFci4xUBN
	Ptm2DP9VMSuD56ukQhFQoZRaxpFKq7LcMut06YGEKhCX7glIcPnmFq2gwuH5SkQrgUQuEI+HTTw
	equCu9WAztS3bAudLdx7vXNwtasc0AxQ59m48RBRIaQinW9mbDFOJ41AwsPf+lvC/kgJDFW+e8h
	5TQAAIXukYTCbYia3XybWndhp3ZtXKYXv6QgE5YJiE6wB6V0LUfp1RzgfAte9WRAAmRlKwtWQ/u
	wT0AO/BEXViv0gw==
X-Received: by 2002:a05:620a:711c:b0:939:4b31:4669 with SMTP id af79cd13be357-93e8f35d7a9mr140703585a.29.1791279742533;
        Tue, 06 Oct 2026 02:42:22 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:939:4b31:4669 with SMTP id af79cd13be357-93e8f35d7a9mr140700585a.29.1791279741909;
        Tue, 06 Oct 2026 02:42:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6f3a36dfsm639859f8f.19.2026.10.06.02.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:42:20 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:42:20 +0200
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
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <asTCfOqNsv7fhX13@lore-desk>
References: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
 <179114695065.1402591.17659606391395950626@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2Bgar8i1ZwHvrwxx"
Content-Disposition: inline
In-Reply-To: <179114695065.1402591.17659606391395950626@kernel.org>
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4c27f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=wfrYX8O7EWgUh0Dss7UA:9
 a=CjuIK1q_8ugA:10 a=edXyOhOlrqVGcbvKT0AA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mUnqIU6T06ysXwa0Gco76ZDnERnchN7i
X-Proofpoint-ORIG-GUID: mUnqIU6T06ysXwa0Gco76ZDnERnchN7i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfX/jiCOEPPN9mY
 RayKL+4BJctB1hQKGLMOB4RA8N/Spv9FI5rLq43OSlokyzmzcrJIrIczsrr/KnL4nT98mhwWdMj
 Emlp8NFY/yyqhaZorAE9m0GQoGDcGf0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfX7fYo+SRPkj60
 VBl9AJB15RGopp7+pHTqbN94RdSErNIg8pkaB4wASZSglZgpEqoplZT0+7bnldfP/m17TSzyRcq
 BGRnH7Tq3iuXAUp35FuwfuQRquz2nBHK2sIedbxpFub3G1xYjtpt25nyF9K9KY0EcMc6r1b6s4m
 rOZtnk8+wMxsnB+1s9QclV9zJX9plSLSWu8XIQT7G7jtwyUcHSl6LmreqtDhNPvlV/pxfELHglx
 lgIU3+kft0Zq3+ZsoMyRXCkSNZ7519CLEOixUTmuk5RcT9HTed6IkyNBTl9cD8XzfW6GKMa36se
 eVIqObm/8feyrx5+0rP/98BFJ9LH9Tn0IoaRlTLt+R8BMzFdg1jbCcJp2ymsaXH5VMo7tz694sc
 yMzL92F4f/8kWHOXy1g4Ficc1hou3vLPlbfnwvfMpRoZ72Zunxx4U0aJHOtpZNzDj6kZh0g06FF
 ItBGdKPtuWUoPehnR5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_024224_847557_C3357104 
X-CRM114-Status: GOOD (  23.74  )
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

--2Bgar8i1ZwHvrwxx
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

I will fix the sashiko's reported problem in v4.

Regards,
Lorenzo

--2Bgar8i1ZwHvrwxx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasTCfAAKCRA6cBh0uS2t
rLkbAP4wA6iHjzlqIoQ2A2AtB/Sq+wGDHsP23jOQzttMk/mS/QD+LC7sLvYYF00Y
1excpxc14pI3OvMuh5vX1oy3OHdsCgk=
=2/xG
-----END PGP SIGNATURE-----

--2Bgar8i1ZwHvrwxx--

