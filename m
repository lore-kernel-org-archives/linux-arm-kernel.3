Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F66CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyvNQNNv23jI9L1LPvT3Avf3sipJVOOQYvHCz1X+IX8=; b=ylA40fLAXk9tb1Vshx4n08UO5X
	I1tqiRxf8rR7oewv3LLe/bDyykoRoLueouvmQavUMx7TygOAMG+TXZ5UGnh2WVG8akWFAvQhJOD5Z
	NnfO+XdQSPpsWOdFo9obhZhZosnh+jnurTNjeoJBdEvi42cNI04Rtpo98rcjN5SBKb9tCWTYE2VEo
	VFpR3xoxBgbidEvMJyK6r2Via0NoTsu1dOqqmQFVg2r2Rvmzz+l7NeuDykBTHCIX8c+qmpBYvYHgq
	VoTuJjUSFWgFu9vVcNs0J3w41KHHd6KAMvhFqFYTx6vlnr6ulBBRLZVC7rrlic19jHg2JCO88c5KI
	ZSh6QwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtme-0000000FckL-37A6;
	Mon, 17 Nov 2025 07:36:20 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtmU-0000000FcfD-0mIB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:36:16 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251117073607epoutp0269cba24c7b61ecd35172e32c01c5cdaa~4uxhEpeGc3063930639epoutp02e
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 07:36:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251117073607epoutp0269cba24c7b61ecd35172e32c01c5cdaa~4uxhEpeGc3063930639epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364967;
	bh=XyvNQNNv23jI9L1LPvT3Avf3sipJVOOQYvHCz1X+IX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEFH042lw9mT96Z295z57dfctIn79ezeNITxjvV53wZjK1hZb2/+Fe205fGdPRjsB
	 mGjgaeRHS1Szq7YliajWMSIYlrKJ1huH3DfYAM8dUrPxH0jt5DtGXynow2ZWzYe0ix
	 x4xPCWa14vt5pCAxGpoMQlDfMgQLd0cnBQAnNzFI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251117073606epcas2p1e409359c4bdcd3cd455c7c91105a79f0~4uxgsCKtp0038400384epcas2p1C;
	Mon, 17 Nov 2025 07:36:06 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.200]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d900k1Sfkz3hhTB; Mon, 17 Nov
	2025 07:36:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802~4uxfxFt7t0038400384epcas2p14;
	Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073605epsmtip23bf90ad7adf80795d0dc135df7adfd41~4uxfsUWf72920629206epsmtip2M;
	Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
Date: Mon, 17 Nov 2025 16:41:40 +0900
Message-Id: <20251117074140.4090939-6-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_233611_308048_F6B2593C 
X-CRM114-Status: GOOD (  13.40  )
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

The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
GS101-specific. They implement the generic save/restore sequence used by
Exynos9-style controllers that have EINT filter configuration
(eint_fltcon) to preserve.

Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
  - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
    exynosautov9, fsd, and gs101 controller tables
  - prototypes in pinctrl-exynos.h
  - definitions in pinctrl-exynos.c

This aligns naming with the earlier macro/doc cleanups (e.g. using
EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
makes the helpers clearly reusable by other Exynos9-like SoCs.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 176 +++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   4 +-
 3 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index f473a576f58c..3839256ebf80 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -195,16 +195,16 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 CMGP data */
 		.pin_banks	= exynos2200_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 HSI1 data */
 		.pin_banks	= exynos2200_pin_banks2,
@@ -214,36 +214,36 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.pin_banks	= exynos2200_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI1UFS data */
 		.pin_banks	= exynos2200_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks	= exynos2200_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks	= exynos2200_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC2 data */
 		.pin_banks	= exynos2200_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks	= exynos2200_pin_banks8,
@@ -710,8 +710,8 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7870_pin_banks1,
@@ -721,43 +721,43 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS data */
 		.pin_banks	= exynos7870_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 MIF data */
 		.pin_banks	= exynos7870_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 NFC data */
 		.pin_banks	= exynos7870_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 TOP data */
 		.pin_banks	= exynos7870_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 TOUCH data */
 		.pin_banks	= exynos7870_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -819,8 +819,8 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7885_pin_banks1,
@@ -830,15 +830,15 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7885_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 TOP data */
 		.pin_banks	= exynos7885_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1175,8 +1175,8 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynos9810_pin_banks1,
@@ -1186,44 +1186,44 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.pin_banks      = exynos9810_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 CMGP data */
 		.pin_banks      = exynos9810_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS0 data */
 		.pin_banks      = exynos9810_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 FSYS1 data */
 		.pin_banks      = exynos9810_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks      = exynos9810_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks      = exynos9810_pin_banks7,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks      = exynos9810_pin_banks8,
@@ -1295,8 +1295,8 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks0,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynosautov9_pin_banks1,
@@ -1306,36 +1306,36 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS1 data */
 		.pin_banks      = exynosautov9_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS2 data */
 		.pin_banks      = exynosautov9_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks      = exynosautov9_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks      = exynosautov9_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	},
 };
 
@@ -1715,8 +1715,8 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 ABOX data */
 		.pin_banks	= exynos8895_pin_banks1,
@@ -1731,36 +1731,36 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos8895_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS1 data */
 		.pin_banks	= exynos8895_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 BUSC data */
 		.pin_banks	= exynos8895_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynos8895_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynos8895_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1819,15 +1819,15 @@ static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
 		.pin_banks	= fsd_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 PERIC data */
 		.pin_banks	= fsd_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 PMU data */
 		.pin_banks	= fsd_pin_banks2,
@@ -1927,16 +1927,16 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
@@ -1951,29 +1951,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..a6dd0fa59230 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -906,7 +906,7 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
@@ -961,7 +961,7 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 24f85ff5ed30..612d9a7e8577 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,8 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
-- 
2.39.2


