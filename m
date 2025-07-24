Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB047C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VpqnVHPg85eREOdigF06VvfI57tksBRXUjYq3epe8Y=; b=eKIudkkQMryrN/sf4KaBZ+LFtr
	faYlkAMT/yCYZsNLYhKVTBebVPg3gsIIPacEzsyrez8Pc1DGwXVqTM5867R/EEHEWHFWeKCbjXcks
	vIrU0Zob42FRzmNCHywqPaZg5jfKbITz+ZIyNANjCVLqxUZ3FqEfPW2E1B5MS7T8QjFsJhOvpwc6H
	jxinztM7TQ3OfVJUffG8FElwZ5m4BJjQh+14LUf/w9Urb9qXlOc78pxI55MWR17BQdZIyF2MIgD19
	55QA3loyRgDZDtZGMhIzX6S7fOWMH13CiLBowXMb1krxJicdj5/VE/GFWa4xeg5wwOoGwAuDGgHuZ
	yvG6Bu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoyK-00000006Z6o-25Vy;
	Thu, 24 Jul 2025 05:58:28 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueou1-00000006YkX-1FfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:54:02 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724055358epoutp02612b4425d087f75bd0546ea662cdf98b~VGjNyTeSY2457924579epoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:53:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724055358epoutp02612b4425d087f75bd0546ea662cdf98b~VGjNyTeSY2457924579epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336438;
	bh=4VpqnVHPg85eREOdigF06VvfI57tksBRXUjYq3epe8Y=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=r2Bb5hGP7PIAj8SUUFd2BGkGbGc7aTmJ0Wnd0y7DcwVEoRiWbQtdf1HYxhvH7fv3a
	 rCpGA23gcw4AtATodDS79IuMznGhuA9O5S8zg4Etg8lRye+et8SP3czr1doVGoLn+x
	 Zf1eKXXc2TTdXODdZibK9Jqh2fUCLLd5bl3Brt6U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055357epcas5p494818deff8960287b2cf448ea0ef871f~VGjNjNx1W0942409424epcas5p4l;
	Thu, 24 Jul 2025 05:53:57 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bngDP01P7z3hhT3; Thu, 24 Jul
	2025 05:53:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724055356epcas5p391e77debb0c329635c3c3eb0475e5c6c~VGjMOrrf01947019470epcas5p3C;
	Thu, 24 Jul 2025 05:53:56 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055355epsmtip182e0055067acb8ab5444187708a1e627~VGjLLM4HH3049830498epsmtip1y;
	Thu, 24 Jul 2025 05:53:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-3-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 2/5] watchdog: s3c2410_wdt: Fix max_timeout
 being calculated larger
Date: Thu, 24 Jul 2025 11:23:54 +0530
Message-ID: <2b5d01dbfc5f$57d9dd30$078d9790$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgKHMZfiAsMNadizxZtLMA==
X-CMS-MailID: 20250724055356epcas5p391e77debb0c329635c3c3eb0475e5c6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055857epcas2p18cb516424b84f972970eed1ac5726c54@epcas2p1.samsung.com>
	<20250714055440.3138135-3-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_225401_654051_E98D517B 
X-CRM114-Status: GOOD (  16.02  )
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



> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-watchdog=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; Sangwook Shin <sw617.shin=40samsung.com>
> Subject: =5BPATCH v3 RESEND 2/5=5D watchdog: s3c2410_wdt: Fix max_timeout
> being calculated larger
>=20
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the
> remainder is discarded during the calculation process. This leads to a la=
rger
> calculated value for max_timeout compared to the actual settable value.
> A ceiling operation is applied in the calculation process to resolve this=
.
>=20
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  drivers/watchdog/s3c2410_wdt.c =7C 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index 95f7207e390a..31f7e1ec779e
> 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> =40=40 -411,8 +411,8 =40=40 static inline unsigned int
> s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)  =7B
>  	const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>=20
> -	return S3C2410_WTCNT_MAXCNT / (freq /
> (S3C2410_WTCON_PRESCALE_MAX + 1)
> -				       / S3C2410_WTCON_MAXDIV);
> +	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +		(S3C2410_WTCON_PRESCALE_MAX + 1) *
> S3C2410_WTCON_MAXDIV);
>  =7D
>=20
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool
> mask)
> --
> 2.25.1



