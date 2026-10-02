Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA5BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKdIJ/v0JRCkX2ewj0d9dXQZqyPU31WRE6qg+Xr8wXY=; b=DpOZ8W+lLUPs+bV6hVEGzCootB
	dR4KpROWGGOfuBEcWhJb2sAQIybkP87QVTcg/7Zz3R7aM/PXq4vFC/OEzkrWIkUqo0xlNPBT16wnr
	CPDnSJjuEYW1GU4tcomAdxI1AlYi8qmwbDE15TyZAi37vf1Xnibx+Gg6gmjWhOqGi20Q9D4F1Y9Jn
	JfNSUAgXX1GAaUsxEnvJcLY/gt3yhMs1gTjPA7Aw7gW1NslzOiPfnQkVGXvU4wSZ7k+T/duOWB9rr
	3G64ZYkd9M85skwbusPTj6KNN/H1Lcb0mGcd6NQfqfXasvUrDRlXTPGEo138CzAZ/kC0Yy6BHk6f6
	1Dnkrfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb1f-0000000BPdz-12Y4;
	Fri, 02 Oct 2026 11:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb1d-0000000BPce-12Gs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:02:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQkJ2061961
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKdIJ/v0JRCkX2ewj0d9dXQZ
	qyPU31WRE6qg+Xr8wXY=; b=J+Vn3VsZwEkg65qq1oQ9Hc8AVj5ctExNmtQfHLbi
	ROYntezQe8j5uEhHmz+TG7f3LzhfPO/frh6c5fKi6A41rPzuh/ErRXmOKt/MnTbH
	zdwBcg0PHcDstwMOBdhtHnaSRQxwM1M/wpiUoSvUZmYK/NVRTuJftK2owEsYm7cm
	c10CTC7J6Kp0Ou0jR5AQ7O0w+skxMD5lZ7HZtk5eQIsCYxKqBKPzMnxDMq6AsheC
	ZGIHHb+wkC68hiFvA4Qk5zknCV41Ol0AMpaai638j0+jo5kDcyZk9mq09snnKKkC
	eTz8TTrTztFoSkwkkoB+31c6B29AT8+zf+xp8pMHj6A2fg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256ms6a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 11:02:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7be35e6911dso1910067137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938920; x=1791543720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKdIJ/v0JRCkX2ewj0d9dXQZqyPU31WRE6qg+Xr8wXY=;
        b=Qvt9V2u1oBN0/xCFM1LSO1ukU8kdK5CIHzz17FoMiyo9OJtcbOqtg0FUqS4j90O2ma
         8BQ87sqB0Rf9Dg0l/X3NgNnc5aOOdsCyoicz8yO1yfraxGNROXienjTWWRQdoyPNisTQ
         fDR2UKgzY62HvXFLJiac6ylad5FGOlN27Js8v3zKlwj5fUGwuwZJ3WmwnPymguTKjxGL
         Rzvb2D9GopxCJ/1vkC9HG20YQ1VoJSkcOIYo5fB4oZLSzgnRStEA3cBxypwybmepTXJs
         x410m1q9I/9I1nTzlPd06Y5QJly6jbiTMDP2UaTSwUn5kLY2KJOEHy1h4Y0nu+CFDOE2
         zxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938920; x=1791543720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKdIJ/v0JRCkX2ewj0d9dXQZqyPU31WRE6qg+Xr8wXY=;
        b=I16irivlKyp2rG3Pw0l5A/jVVOVeV3VpfB2Hnj5WwmiRff/t/ifOQxHmIW2f4jvmtd
         gVDe9ieNiXecqP3X7DnSNH82gaCdQKQmv0xnD+RWlo2hcBwh2LMJTAkpAH/5QVxQMfWU
         tRGeYEHU0BflztHgt3m7DCK6CTbdsBki24viFIE9bNJpOJdRw0p2I8Ne7HB4S0cwTb1g
         J1O+fOveUyAnvQp/TWokoqW5iBgoK2CLs7vJpQXNu/SXlKl3q17MzHGVlKpL9MD3RGZN
         vaBiF0SlUuQOVmR643TMis8yfcSeT/x2/LRdgR57uhOpvNi6d4BIGnzdoABBGCw/aF4f
         RidQ==
X-Forwarded-Encrypted: i=1; AKwUvByBIcC2ni6vnbmNlGHrpUamNKZLBo9LkrqursrFbCZO3Mh4PAHEi9t58UuuXE3vx9MCTuYCQDVyx/hueansgbsm@lists.infradead.org
X-Gm-Message-State: AFq9FYLBbS1O62bzV6EtjmZejzihWJpumoHSN1gc8m0C2KzzP42hbg6H
	uDJahWM8bZeXYuzZyVlbsy+KCjTDQHnUQLzSRgIYKYYgkWCsjiGnPh3O4ZSz1xixGsNSnG2yrWl
	Q++8IFD5lAHQqChI+4Rmtk0kZOqpYH681pkMZj/bk1jhUB0IUzzEshPFcHMWttRPv8nMPqFASDV
	Zs2g==
X-Gm-Gg: AYBFou3ICIYpTbBLXNGfx04iPF2+Xx9OYj03L8jDHXD90yG+D9TCFmpzhcPXJtd5cGC
	Tk5NawxsobhP2duclLy9+iGhM2R4Ds3GB/rz300YTWvMIacifU2MNNIXMhbI9o4+dg76nQb4dvt
	CCpShmaBvnAGvMNJM/wPYZRv6xJrM6iSIJBcemnUttWeL4DeuFu+7flBghEPeACVmIzwiCADeMU
	2/6lLCpZeFZr04BKbZsBgTSSn2SYkv8crLuYa1EVTu3dazyo5DUv/4VPSAKbNC4GXi7rualsMD/
	xNCq61k+m+pwQLivE6LLP8Lx4mcyCKltY1TV1swHmzmTEpU/Srtxsdfc42Mz1mlobxWnRV9ZxKk
	rhnFxbVlDP/jH3Q==
X-Received: by 2002:a05:6102:54a7:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7c0f4d9aa1dmr646950137.14.1790938918896;
        Fri, 02 Oct 2026 04:01:58 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7c0f4d9aa1dmr646929137.14.1790938917927;
        Fri, 02 Oct 2026 04:01:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm59659315e9.13.2026.10.02.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:01:56 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:01:56 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: serialize PTP timestamping
 configuration with priv->lock
Message-ID: <ar-PJPMxGGZ0-jl8@lore-desk>
References: <20261002-stmmac-hwtstamp-missing-lock-v1-1-189ce151a624@oss.qualcomm.com>
 <179093783778.1402591.4305443516462782245@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PPH0o41flN+L76U/"
Content-Disposition: inline
In-Reply-To: <179093783778.1402591.4305443516462782245@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MyBTYWx0ZWRfX0CKDrYnr7VBI
 EcVvYHRYPIW5MyzQRbmFPYIS+e2AAkGCULrME0MWOtBcfwFFlKHMcBP+Ni+MYioRIgg0qH5Ab/j
 bWxh0IVO8ET4aird+udt/cGwh8Wjl28=
X-Proofpoint-ORIG-GUID: asenoeCPDduVpXVYMHCRTL6RkFApQnuy
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf8f28 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=5rDVVPiX1ZP2Va_hm84A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: asenoeCPDduVpXVYMHCRTL6RkFApQnuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MyBTYWx0ZWRfX3HpFR9xaj+o7
 dNtCKSgzk11hbES/zAga+QHc8yM6jUm3TImVmPw6Nax0uO/MHF796S0XtwBoymn1tJsDi19giSc
 OGC9yLNY396rxrg42HAMtq/fkj88/gfGchtAZ5e5nOwpO/4HzwBrnk8UMbpktho8eHO3ej/FZVc
 34C85J6mjzZse2Mktx1/IZOuL44iFdQ0QS/963qIMKG8BIioaoOTVw1K5MPTJg6jGEh0FfTSZLw
 49T0KIpzk68TebXtuo84Tzy5untUUbbF8u080WyZQwwzKrDwILZMXGZt5a6GP6GG1CP+9sEcgwJ
 rg8tNPX2OMh1wqrLlcK4Okio1SHMvuDibpFO3VmTHAdqpgjn2A0EqCuWHGY/dloD0njo8qZvOOJ
 aP1lL3Y7NIvMOaQZ7hy4HC37nexfD/8ZWmqVl2tbbBTd9tcBYRWmt4ZNxxaa8sh+NZCYL7HUoCi
 AV9WRnNVjEiyhd++iIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040201_302427_CBB5BC3F 
X-CRM114-Status: GOOD (  24.51  )
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

--PPH0o41flN+L76U/
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

The issue has been reported by sashiko

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a theoretical issue

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested it on a Qualcomm Rb3-gen2 board.

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

--PPH0o41flN+L76U/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar+PJAAKCRA6cBh0uS2t
rB2pAQC9fLgohVoDohP4ZFqOu35UI6l3+z7mlsf0z/4QHjm37QD/dubaG71YJkpH
To/1ZEezcU3wwLqk6fIEPnW8Vz7UjwQ=
=Sd12
-----END PGP SIGNATURE-----

--PPH0o41flN+L76U/--

