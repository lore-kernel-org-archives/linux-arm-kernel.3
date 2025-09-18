Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162D8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 03:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0IujvRvkNRRrQi1nYXL9ScFAz9W9/2gPqXwVoql+Gg=; b=KBen8UHfBj+DWbiwOyN0sAKtx3
	OfFMju3JtmWqrZvHvPErzV4kWKuR5YBiwxk3CClupmRQbKD6hgH0VaeTM1CnqV7X2DERLaafWneeu
	TSCgmWsF39qO81R1mrQdkvfPAPAmEubaFECtH7Mu2OhIG7pipBaTILBvlq2AtzDgg/beZ7x9H6XN0
	PK24uovU4tU6Hb8Y1wcT2fvwikyebhLjtH4gFsrpNl6A3mULpuGumXImBEAZgj7gr1tWba08Uese7
	8JF8TSb3vJUxr9w7n75aGk7va1uArdbXtJCWG3qjEWWbk0cfsmsYeOMiOz/msO7OoBA0ir9P+Mp4R
	FMDF1heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5X3-0000000G9cG-3nw2;
	Thu, 18 Sep 2025 03:42:05 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5X0-0000000G9bd-1lwX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 03:42:04 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250918034154epoutp02c44d2bb31e0b1f2849600d040f0da96f~mQ35RoQff2426824268epoutp02y
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:41:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250918034154epoutp02c44d2bb31e0b1f2849600d040f0da96f~mQ35RoQff2426824268epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758166914;
	bh=Y0IujvRvkNRRrQi1nYXL9ScFAz9W9/2gPqXwVoql+Gg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qA2YIUHWbfr25lMKWKtQ8K1Zjv0JgVJjYlnvdUGfivIoUm982qwRkBLKIXe/iLGge
	 +NqgWHvjyWWDHL53DKtCbbEYhkr1C0OE0kCIxu4Pc53poxizUuATgJQN8LSdXFBy3D
	 NcAqLTxScBf6IkH0n1CJPl69hvj0pkyMwVIYpuRo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250918034153epcas5p2178818bfb332b0581f9746026ef7f45c~mQ348VSpN0288702887epcas5p23;
	Thu, 18 Sep 2025 03:41:53 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS1f90Vxmz2SSKg; Thu, 18 Sep
	2025 03:41:53 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918034152epcas5p3d165b46374d5f8f95c14e7e1d3090841~mQ33o4mpy2935529355epcas5p3G;
	Thu, 18 Sep 2025 03:41:52 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918034149epsmtip2b8fa50045b991065e8c1a0b516cb3682~mQ30-CFna2486924869epsmtip2g;
	Thu, 18 Sep 2025 03:41:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Thu, 18 Sep 2025 09:11:47 +0530
Message-ID: <06c401dc284e$2bec2a50$83c47ef0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgFR01/4ASSqlWCx/USksA==
Content-Language: en-us
X-CMS-MailID: 20250918034152epcas5p3d165b46374d5f8f95c14e7e1d3090841
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
	<20250818021826.623830-3-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_204203_108286_CBBFB8C7 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, August 18, 2025 7:48 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net; semen.protsenko=40linaro.org;
> dongil01.park=40samsung.com; khwan.seo=40samsung.com
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-watchdog=40vger.kernel.org; linux-kernel=40vger.kernel.org; Sangwoo=
k Shin
> <sw617.shin=40samsung.com>
> Subject: =5BPATCH v6 2/5=5D watchdog: s3c2410_wdt: Fix max_timeout being
> calculated larger
>=20
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the
> remainder is discarded during the calculation process. This leads to a la=
rger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation proce=
ss has
> been adjusted.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>




