Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4302CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 04:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0Q70RU0uYBQg/+uwi+5X/TGP+8jGSJKZRgQ/tzfc9g=; b=LCHDUnIPKeFjJCVKs2x20bKeNw
	/J2QFS4y/FNbK7G7SAMcEiqgOANu7IwbuqGxIdMp4TKpmk4/puUKjoyJFpbxikbO00hwrNGh15neT
	CfV6C39ML2Gp5HTwuSWE4hPOEFsmiKerMbTIeitQrgpAectGIS+QQ5lOU6hujR9rwderVbGL1M//P
	nCe32XylLiRZnckjcIJOJJtxMtFzr/Ct8Kj3A1QlkJIQR6bXbMggthY+FJH0qeu5KLrnOwEYyeVsy
	z6qUdDB5f/PkTSPLagyVTNKTsH1z6gg5DU/wTM8VLd4z326OXUohotXBGRavDMaD5NJre7FqsbYal
	1e+RlYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5tu-0000000GBrN-4BNG;
	Thu, 18 Sep 2025 04:05:43 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5tq-0000000GBqs-2wno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 04:05:41 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918040533epoutp0129f666926717157ff6d512e75149342a~mRMinQ6Vr2707627076epoutp011
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:05:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918040533epoutp0129f666926717157ff6d512e75149342a~mRMinQ6Vr2707627076epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758168333;
	bh=p0Q70RU0uYBQg/+uwi+5X/TGP+8jGSJKZRgQ/tzfc9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hmoZb8R3LCuvedKPi8BAYXPwXrQp4Dmpnse+4b0fBJskmhiDMrnfXnh4nFclZr+Qg
	 PHbPegNliEDVzRJtutk0DK6HO0ToQoRH2U3KumdThwlX5RT3OXZEZOXEdQSWtn31Fl
	 pBer+JDuvsSy5S4V6jB5BvgxPCyKi+lp/QqMrzhc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918040532epcas5p324a33bd2cab43d0b1c2c12d15a5a9eec~mRMh2fg3m2562225622epcas5p3H;
	Thu, 18 Sep 2025 04:05:32 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS29R48JLz2SSKX; Thu, 18 Sep
	2025 04:05:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918040531epcas5p35526c46a3c0390d6066ade0bd6a90505~mRMgvFOYJ2562225622epcas5p3D;
	Thu, 18 Sep 2025 04:05:31 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918040528epsmtip14e0f3f931fc7e6f7edac39c9ef268c95~mRMerpD-V1171211712epsmtip14;
	Thu, 18 Sep 2025 04:05:28 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-6-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 18 Sep 2025 09:35:27 +0530
Message-ID: <06c701dc2851$796b7620$6c426260$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgDSjL23AYLihPex/lPgkA==
Content-Language: en-us
X-CMS-MailID: 20250918040531epcas5p35526c46a3c0390d6066ade0bd6a90505
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4@epcas2p1.samsung.com>
	<20250818021826.623830-6-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_210539_237779_429A79B8 
X-CRM114-Status: GOOD (  11.52  )
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
> Subject: =5BPATCH v6 5/5=5D watchdog: s3c2410_wdt: exynosautov9: Enable
> supported features
>=20
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


