Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeaOyJCk9cex+e5o7JjHCxLWrioSsoMPLRXcs380aPs=; b=VcwbxPJYE9iXZAcuNv30gDw3MO
	HLp0hyJT6dkQzTsL4XqcdWkJqDTaXx2fIkIxZKPVHWqih+Y8JdGOwXXqxa6nwBgrOXi0OYVystvA0
	xRCfRXD61osbvmNxF0AsybwIFkhqErDUmUZ1U8xqkIZHI6M6so3kdwUikaa1HM4PzE5o83KRqqw/7
	veeVyUQqcIPmD3/GGy+dCNEox+dHI/Vq3qR8wFdSBFZIefJO5sUFnM2P+J/xlf8RDU5SWP+hQiVUk
	fEolz/mhdzNPNKP/CzNjzNKPiD/TwqnV0ituazQDmJt13KgBIGusA/mewM/r8b3Kq+C/L6M5sVNTx
	ZEduMGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ks9-0000000BRZQ-2T5F;
	Tue, 01 Sep 2026 09:33:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ks6-0000000BRYV-0MVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:33:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792aS705426
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 09:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qeaOyJCk9cex+e5o7JjHCxLW
	rioSsoMPLRXcs380aPs=; b=a4IOrlKpzE7t4dcemMBXOE9PzfcMJpttc5ennfqT
	TtNT/l+FIydPbLaECvLiWQfmkvvxfa8O4sGIgx7CebqtkqPN8rhc6ZKJzfV4vmEJ
	ocNq77spQ9pvGPByAkgp5ubWcrmD3NuIsmJ4SZtTe7kcbD791N1FOSGzXebSXBgV
	a0xUkINLZmWXEVP3gNjTR1dEZRW/J1ubJlzTcplZ1k6BASH5cxOmsFLTQ/8BgGfB
	dQ5diqo17IvRDrpSpaFByOUNJPEkmWnoavlQYfG8dKT1jxr+SJGGmdqUSeiIaN6c
	pdcRWMpx2+tMLmOe08ejjaR/34S8BjQ0YQFTM10p40lKqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh3mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 09:33:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1129361085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788255216; x=1788860016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeaOyJCk9cex+e5o7JjHCxLWrioSsoMPLRXcs380aPs=;
        b=TB5lftAS2cCZedjWJV7jeTV4rQ+oYYdFHgp3mS43WKOMGWqwrn+ZpcxDtDhQksvCl/
         sPEbHcup6r7EcfsJ568L0L5Bpx6bktapa9C0GgqY2AoK0RSTdq5JGKdZX5KaxGfer3lS
         j63Zt9zdOPkpvCCqFG0Q496buxymRjEP+MmAU+XrK+xWV/FK883Lha4vAEA5M/SeAdBQ
         PNysWCSSxYf95V+bgQvgpf8jnsjFAQdfzpdxHYRf9mZBQ7UEqQPx0T+WoIrvuxCHwcD8
         0NANiB0g+2n0619DJWc77PY+5dE53UeKYhTM/v4wzzP6SChl1N/e3uc7PNZEOy5IW2+C
         Mqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255216; x=1788860016;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeaOyJCk9cex+e5o7JjHCxLWrioSsoMPLRXcs380aPs=;
        b=h1URt39v+psNG+eq/Kt4U2TRqnPo7Xiw/JFgoEGl9QLSg0mEfdU2sAs2YTiiV6yhpE
         Z7VDvc0hAkKmlv5jzQIyyPhf7iQ5KcYjPuAvdn2sYLIKtJFugxdCI1UHGy1IW7Fs0PA9
         +C4T+FbcCh8sAV78Za/CxtN5WWWXK8C6EZ6FKzSB+66BYAzIiWA4kd0cYWUkMKV4zL4n
         6n0DKuRxBbWBFu12RVQN5JAGB0ucEs4faYsbb7BpyHHCSVqE00BNFXKmADzBRLatxCdq
         i19G0/acY1pHA96zd046rasyd8zymcdwO4ejMS4m41MaTv+c/+ZkVferxZlePwtyYVo6
         ISMg==
X-Forwarded-Encrypted: i=1; AHgh+RpuzPDp+NIsnIqinb4zbkjkwkdHi7wEpz16NyuDPrnHc2rNO++AlB7YvVAAHMSC+pM25CYBsfZxg2hMzq/rfnr9@lists.infradead.org
X-Gm-Message-State: AFuF++mb17birZ7n53/biQggW9nXohB295HfyyPdVltW0+gkB0VD4+T1
	D2fBs92Z6liXZQt6Zsa5Yrq2xcko36TMtwJzQ4XPt1H0hnn+GKeZmNAR8FKkMMgpHbgxSw40Cj8
	Gbo9AjrI6WsKNbWxgc+hUlToQWjckX0cJQi1w9ahtc4z3poewBCja6309+Vly1SRyrO/kMmCDft
	DyCQ==
X-Gm-Gg: AR+sD1036xOqPxMlOJJ+W+E89LBK8rj13OzCuoQ6MP7hF6UCO5NG/XxRfco9zSA2vG3
	GxIeB7awaqLDx7T0B4XN0qEfL52xG1A6riN7nrpVIc2E0iaH4uoVpS/V0Rrv2PKt62vikZISYpU
	obdPnqPwsdb7i1bGssqI6TIgTqnmoYidbLJUdhfznEXVdscS4swsbMdPgjYx9HDhb4V1afVnwMn
	yx5vC251FkWmWS0UkxUTbS0DlBrxNGNWwGhZqL27PlOeTwpC98C04miljUdYipISU16g69hjnvS
	7MXynX+DRzRmWzro7sgz+j++x0yhKNJPQdEWM4M4E2in2DkPQTwm51bz0KLmqlimYGISuMRQkN6
	bLFRUQkyV2LHiiQ==
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4366704285a.3.1788255215087;
        Tue, 01 Sep 2026 02:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4366686885a.3.1788255213973;
        Tue, 01 Sep 2026 02:33:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28ebsm532678066b.29.2026.09.01.02.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:33:32 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:33:30 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: hold runtime PM reference in setup_tc
Message-ID: <apab6tPGZ33OoXX5@lore-desk>
References: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
 <apWVBrXNt74gtUd4@lore-desk>
 <20260831172632.64aadc2c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YgACt2WWoxLzx2dw"
Content-Disposition: inline
In-Reply-To: <20260831172632.64aadc2c@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NCBTYWx0ZWRfXzFjoJZAVwMYL
 mfKVYrY3EbPOsuS1U8mgV3BicWt+JKeMsXDOHT6nCnU+J4g7zL8E8ImFnJu6b3occmh8Qbk9A+j
 RHNdOrXzfgSa4sEPEDf3FkHO9fq1tOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NCBTYWx0ZWRfX7Jw8AskRYYxG
 cuQeHLi69suxJ0fgwF+t8Sfu2nICRVvuDZgOrmdoJ+UPND0BUJRnNbrU74yKlBiXs3Fw0ScVHjF
 3QMaaD8EQcKySbaCnPwVzMGQqfwe5/xuJLhb7yVDouFWoYXhuELGgR0hn8AMy6mMkaO5LDhCixn
 5HoWbJGlbmH2FSdB+GhVM73MSOhACa0w/xQxbmytcr9f6Oohy+LpawO70Z+2MdIIwFGRXteIfEj
 mnpva6xt8TnviwVW+9VOiqzCrQxA2gq+DqB5kCn+n7sklOPfRWDX7UsQWsIpGTzSukfdJRXc14L
 dzReDSOtdXep9TJQvgHGtl6qFF1QYeybaTJIJct1m6uObdLArSXjfwFxGR7DANX+hvWU3vx6MWK
 /fNF5+IfGA0lKjKJ3erbUBCp39wO3MGIW7LMR85KeyObXG5DeDuj7DlOCH3EwvmaU1pEPR+RfPt
 I7OnSJjpEWQnIB1C+LA==
X-Proofpoint-GUID: 6bUvD1zNkJ5AaswF5eYce1xo9gP2L1NI
X-Proofpoint-ORIG-GUID: 6bUvD1zNkJ5AaswF5eYce1xo9gP2L1NI
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a969bf1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rNchZ6wNclprkupQ3ucA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=8FirTQ5JliGXrdKJnOMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_023338_130856_8AFA50F2 
X-CRM114-Status: GOOD (  20.10  )
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

--YgACt2WWoxLzx2dw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 31 Aug 2026 16:51:50 +0200 Lorenzo Bianconi wrote:
> >   - This issue is not introduced by this patch and it needs to be fixed=
 with a
> >     dedicated patch
>=20
> Looks like the driver has multiple bugs in handling of TC callbacks
> while down. Please fix all of them in one series, otherwise we may
> end up changing approach.

ack, I will do.

>=20
> Can you also confirm that the device programmed while down retains
> all the necessary configuration thru the open path, and everything
> works as expected?

there are some leftover issues I am looking at:
- https://lore.kernel.org/netdev/20260831-stmmac_tc_cls32_reconfigure-v1-1-=
21cb459e64ae@oss.qualcomm.com/
- https://lore.kernel.org/netdev/20260829-stmmac-est-reapply-after-open-v2-=
1-5e5ccb185e92@oss.qualcomm.com/

Regards,
Lorenzo

> --=20
> pw-bot: cr

--YgACt2WWoxLzx2dw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapab6gAKCRA6cBh0uS2t
rAzkAP9PVIHkeOY8Bd+C/l/C48j4rxhvXtwJQqY++nM4MzLxpgEA61NH14LNrjgF
+HHRWRLkq81brcUvd/opfeJSsuNzYA8=
=7Cq8
-----END PGP SIGNATURE-----

--YgACt2WWoxLzx2dw--

