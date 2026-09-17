Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FFCC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0ZOP0Yw/WONd2MaPzjS3OZNsmbzgPVfLO/uHIlT6Ts=; b=j75Mymcx+6RFCFgrpB26IWINA7
	FQEG5vuQjCafS3mbXMj1Hjr06JysXsWdvO75ADG3cMICRl+dTPF3nj4WkQfbmhrAXr5/1yVQp3mO3
	iQ+DXMW5QtK426fPQokq5P3KSudItzsUQ5cb9LlZJ/bDHGyfeEt/gDmka7Zrg2WSHdV8ynU7Ce4wW
	JtBdBwbF1jVg8pRSGUZoJDHu613acQqsE1OZ+AaS3XdlQAFjYCBx/GC+dhedbrcsQTTkz0ekH5VC+
	GI/mjC3GhiLhtRt+RUL4oZLuWR0I7leahbVquDEIzeAjL2LQb4XbvT6hHQg7DdhzLcVCECx/jHbxe
	oPmE0fRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ETy-0000000BmWs-1shg;
	Thu, 17 Sep 2026 15:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ETv-0000000BmWK-3U5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:57:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F86C413AC;
	Thu, 17 Sep 2026 15:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346F31F000FF;
	Thu, 17 Sep 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660623;
	bh=f0ZOP0Yw/WONd2MaPzjS3OZNsmbzgPVfLO/uHIlT6Ts=;
	h=From:To:Cc:Subject:Date;
	b=g8qX6gmbZQpEq5eT71AJ5gbmxXa19dxWffSxyX9o9TjpZ8w0Tfk3p3RCh2re0xVt6
	 kbouqQWxgZ45GwgVGaAuyeNdp3iIriXOra7LnafrrhwEvagSrnSZP6e7s980O5vtYo
	 jYzzQT4nh09Js8TvECdCRI4nNX4EisYM3H6FzFCrqIt2CfukNNkrbUjiSPIpfhwl8p
	 nAzm2Z+DSAT/fW2G/MAshmAHNGN/C/3NKU5G/lC3zT1hknaTOK+M7p+V5Ipd8Qs7wg
	 /6gFHEGHhr/nraKAeAtIdKPgFNWmMh9T5+SgP5IgbX1gNem3i0yJOTBiMKS70kJgP8
	 PwqgYADb7bPvw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: gadget: pxa25x: prevent ixp4xx + pxa25x combination
Date: Thu, 17 Sep 2026 17:56:27 +0200
Message-ID: <20260917155657.2200191-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The USB gadget driver is one of the holdouts of Arm single-platform
support that conflicts with a multiplatform kernel. Trying to
build this for both Intel PXA and IXP fails with:

drivers/usb/gadget/udc/pxa25x_udc.c:144:9: error: 'UDCCS_IO_ROF' redefined [-Werror]
  144 | #define UDCCS_IO_ROF    (1 << 2)        /* Receive overflow */
      |         ^~~~~~~~~~~~
drivers/usb/gadget/udc/pxa25x_udc.c:141:9: note: this is the location of the previous definition
  141 | #define UDCCS_IO_ROF    (1 << 3)        /* Receive overflow */
      |         ^~~~~~~~~~~~
drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error "Can't configure both IXP and PXA"
  232 | #error "Can't configure both IXP and PXA"

Until recently this was not a problem, as ixp4xx was only big-endian
and pxa is only little-endian, so these could never be in the same
kernel image.

As this has changed recently, an allmodconfig kernel for ARMv5 runs
into the above failure. I don't think this is an important scenario
in practice, especially as pxa25x support is already rather broken,
so prevent this configuration using a Kconfig dependency, and
rework the driver to allow a combined ixp4xx/pxa3xx kernel that
only uses this driver on ixp.

Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/Kconfig      | 1 +
 drivers/usb/gadget/udc/pxa25x_udc.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 7ddbc2606686..5142f70b6f3a 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -126,6 +126,7 @@ config USB_OMAP
 config USB_PXA25X
 	tristate "PXA 25x or IXP 4xx"
 	depends on (ARCH_PXA && PXA25x) || ARCH_IXP4XX
+	depends on !(PXA25x && ARCH_IXP4XX)
 	depends on HAS_IOMEM
 	help
 	   Intel's PXA 25x series XScale ARM-5TE processors include
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 594d67193763..7e158ca73fa1 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -140,7 +140,7 @@
 #ifdef CONFIG_ARCH_IXP4XX /* FIXME: is this right?, datasheed says '2' */
 #define UDCCS_IO_ROF	(1 << 3)	/* Receive overflow */
 #endif
-#ifdef CONFIG_ARCH_PXA
+#ifdef CONFIG_PXA25x
 #define UDCCS_IO_ROF	(1 << 2)	/* Receive overflow */
 #endif
 #define UDCCS_IO_DME	(1 << 3)	/* DMA enable */
@@ -228,7 +228,7 @@ static const char ep0name [] = "ep0";
 #ifdef CONFIG_ARCH_IXP4XX
 
 /* cpu-specific register addresses are compiled in to this code */
-#ifdef CONFIG_ARCH_PXA
+#ifdef CONFIG_PXA25x
 #error "Can't configure both IXP and PXA"
 #endif
 
@@ -2230,7 +2230,7 @@ static struct pxa25x_udc memory = {
 
 #define CP15R0_VENDOR_MASK	0xffffe000
 
-#if	defined(CONFIG_ARCH_PXA)
+#if	defined(CONFIG_PXA25x)
 #define CP15R0_XSCALE_VALUE	0x69052000	/* intel/arm/xscale */
 
 #elif	defined(CONFIG_ARCH_IXP4XX)
@@ -2282,7 +2282,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 
 	/* trigger chiprev-specific logic */
 	switch (chiprev & CP15R0_PRODREV_MASK) {
-#if	defined(CONFIG_ARCH_PXA)
+#if	defined(CONFIG_PXA25x)
 	case PXA255_A0:
 		dev->has_cfr = 1;
 		break;
-- 
2.53.0


