Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218DFCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h56h6pNSAkohBNVz3YvAbtH/DQ/UmMvY90TTNPOXguk=; b=DsyojJB+jk2iqcM6OHNaXFCFH+
	Rm/MI5K/NwAoNwjN4UT5yRVyIomYCRJyyO0ltdpont7UQP2sXxuvFE7vd+vF5lLC6Chjw17t0/1Nm
	xXw30Pa7paM/un9tid2T4v2n5+nnoMk6BOtmyvlVefPrHGtXBs3jDACpmFxSzV01L05ag5ro/m7zE
	f/CU2it2dx5I3GoRMj/akHrYh6Tx9jUNz0k2VCo+nerAD2h7IPOAs8qIX3SGQPUi3RHiKJpgtoX1O
	CF05nDTtdrLPns6y/d12euqhKTbgHRN0RP9VK/DFs00yQ84J5RRxKpVwy6WPPM1cPRojpzRSUCzS1
	HrGiMjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMpS-0000000BUPr-3ECu;
	Mon, 12 Oct 2026 20:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMpQ-0000000BUPU-0aPY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:41:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN7mS080443
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h56h6pNSAkohBNVz3YvAbtH/
	DQ/UmMvY90TTNPOXguk=; b=jsOdSStN51RteghJR4I92yYZz6DYtmPDmrL93Dee
	ZbA/TvdRlCOl5uY/rkmYi0JmnVr2HA2hgWPZG3B+qNDFdm802ErcDOwIbesLQyrP
	OA7PUvYLnxnbReZi2WPViRmfqcz60LqNwxbCl6+oZHk5dsfhIbNQHYhpegiE8XoY
	ar/uS/IUak1jMX8DmGFoT+SEp+3wFfe3Rcj1UtnYV3vrrPZEtaothmQj8a+1gRM3
	QQ7gN7Zpvh3LvTbQiRRC0MYuf7zQWOnpFZbcqxibDXupZ91MxuKPr1HC+aBC6PHy
	WxYLCRYx+LYoWkTgp0svj9TJaiSuge5g0YKqohHaHjkJsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3kcb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:40:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46b4b700so412945185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791837658; x=1792442458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h56h6pNSAkohBNVz3YvAbtH/DQ/UmMvY90TTNPOXguk=;
        b=i1PS1nLrA9Fw6f4wye69kwLrE0zmDn+ZclEw76NpIamTyg6VtVydc087IXFcQ3kQH0
         7yCAkYk5DxXVDz2RYJXuwQNLF4O0Y9RBbTexdepquxTmwRJ6xTuxWmJ4RHhs8kOOdg86
         omKAiH17jYPZH38/dBLp+aePKv2ZZsd2J0sVqgBFMhVXZiPzVyFeuhV1Z4W+Es6LnqTg
         YHn8MDYHb0kw9TIqkMTvyj3fGsdeOejobmgVcslvha1U+RR741R/ebx0fvaAtuJZ6wlc
         9Xsbxga574Jgyc1Ck5XweqyXp59GGGGBoPw44K6DcmtQI3o0SSeqVPIWugICfLma55zr
         LwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837658; x=1792442458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h56h6pNSAkohBNVz3YvAbtH/DQ/UmMvY90TTNPOXguk=;
        b=R+pCCFDhWWP+PrbK5yIUl6LBCGqDA9JIKVeNndVfB1eiYMwMvZJ/UhhqdXrjwADP6B
         xyosv8eDvuzYOaOKZX6i8sYAbXR1FX+dg0s3ek4KG+5Vcs7nkUhp+SEyTDumZRxhEjkz
         spzOPVWDElkIDLshtjEb4UBdWq7ozXJECsN3DTNpuwH8wVCTVUlqltIaZJSztF+96ztX
         kOTtYUU9/6UzQHrhOiMC4IHtlTpYL2TMja6aILGh3NdSu0PhKAyYD0noOs4dsb6aXNos
         dC0muKGH4mKJwyL32kagsI4mgDARU61lC+DUqPiMt3s7Bhfd4CjpgP+twvc3pwodg9Cw
         79Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwert9OopOQ2AN6/0ZWch1Nd4kYvw1MY2EvtBz0gnok0Tgz+CkDTRJy292BSCyV62SIwUfXSMsJc/LSCaySTKoP@lists.infradead.org
X-Gm-Message-State: AFq9FYLEzgVUmiweDkry4ilnJiLeaRhmTyKABrc4mDV+7e387I44tOoq
	BScjbeTZeQz7SyivO9vOYu2g8oTsGsXKuxXM9sROamxwUTNd2J2UZ2JO/YunUyrUHHhwlM1tJWo
	B212Kn+Dtxgzh1Amq/VKB4FZeO137Py9+m7jI78r9OLlpc/scHIzxnY7Mvh8grWEDhW59mbk96n
	+Imw==
X-Gm-Gg: AYBFou24KZNQ3fxOeZ8pW5ROpLc3wCt/XMV1TagNm0ZM08uj9v4+hF45zSSutfmjH9X
	O2jY4vATyzTX62qaQCLA2TEb6cggsvC3tQmpbRJnFMLkc4myVhYZ+X5H/HIzplmpdLRmeKEQj09
	/zVyWei7hbovmTh2FmwY/hJ4PqSJ/pugPiwyWVHAUcBES9+gXIgdt89OuOBbRo55ueqR4jVcnHX
	fXVOm0grknD20mHQgn1oC6MjOm0W7f6FnDVpJj3cO8jYdBo2gnUxWR6t9IW2Jlq/aJFQglShHSf
	O3FclmWUeSSpvc5K7nnjcFX68QSJ+0LAnr9AOZqNgu2Af5tmFznf/f1UaLkpzqhAxWD7zNH4jG9
	iHgNv1u5vZd7FfQ==
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9b77 with SMTP id af79cd13be357-93ec12c9f5fmr1187246585a.82.1791837658170;
        Mon, 12 Oct 2026 13:40:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9b77 with SMTP id af79cd13be357-93ec12c9f5fmr1187242785a.82.1791837657603;
        Mon, 12 Oct 2026 13:40:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4764sm1152895f8f.25.2026.10.12.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:40:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:40:53 +0200
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
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <as1F1WL0zk_gC2bS@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <179182385023.2527009.17648648661045341604@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rxRsXlv5vC+nRl6o"
Content-Disposition: inline
In-Reply-To: <179182385023.2527009.17648648661045341604@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfX4RfKx+AYifVi
 AufCELLL++abqi8yUsq+ruY8ftT4Q6E4RhDM7pKoDufIqAC6uDbNIuIqFyRyCKXI8lL/jBRjIgX
 aot2TmtENnsHhYeAqivj13DBQ1923RhBKoWTq5pqUfTrrzYM/zawdCi/Y1Pp7XdhNWTmud0DsWt
 t9P5BqOrAf5m6RHiUAfF5qSb3pB3YGObI+g0BxJJKk4dSKByWtUiYupYNarD+CddWzu3/6Grqq5
 rp9RwfA/dt48+7P2az0RYmgPYX4+alvrYhGDx2kTUgZDZyd3Wr3UOvHXg2Zso2QfIGXP6a90Ngg
 K9JpdfDpL7zBKV1lq/3fn+RZKa8SvpbQLL56RD3JAfIajA5082MZiOH6wqv96LVS7ZeQsuDsMWZ
 Y0+/5MNP+OCED8A1u/bUI7nICeaag1gZsqHkiMRRBwRcklQZQAeWuHzGV/YIVq7fOfSmUaOv3FE
 MEmNSn3+XpuVhwow/7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfX2mNcTkRdfS/g
 p5+HtsD9q1HWhF+g5x2eCAH3H5Fqu1VKtySiw7w+1/XTqgnDkXiuLeiljv7IHSqzDcu9sxXZeev
 6eXpmu9jllI5D8SEMTFQRE/9tf0bBw0=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd45db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=dga_IyV3Fs-R8JpTthMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: forwRBmv7veZ9AJvRVVLA1bcU0FkIsxs
X-Proofpoint-GUID: forwRBmv7veZ9AJvRVVLA1bcU0FkIsxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_134100_188977_B17BEFE7 
X-CRM114-Status: GOOD (  23.14  )
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

--rxRsXlv5vC+nRl6o
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

The issues were spotted by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

These are real issues spotted by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested them on a Qualcomm Rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--rxRsXlv5vC+nRl6o
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas1F1QAKCRA6cBh0uS2t
rJOKAP9qqujrHhbYPapooWYnIlitqwx6Dp3BwcpZ/9MswxVuTgEAhgVCJz8M+1PW
bIVO+xMtJeXY9gyZzRBl9XNIgSCZNQA=
=uJCv
-----END PGP SIGNATURE-----

--rxRsXlv5vC+nRl6o--

