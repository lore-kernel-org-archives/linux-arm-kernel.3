Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70EDFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA3bf/imBxC5EKrXdfA68ek5E3GmwUyX6xt/N+ElqDw=; b=r5nIeF+GubYTwnb4fQsT0Gw2TX
	hCvmksVXJu3rOx2+iqCXdj1Uk6Ct1z+d4x5oOo1ifuh/4X/wgf/KOTBy7tmVfuxduL0yCDLJmz7As
	pmITuZqORdpnRhKXcw4uoBFoIfFEm4L02IbkCEpTZLY171xNaM5McYjF6DvJ13Kt42ydwPvxe1OmU
	f7C3JOWHfvUKEGAhYcYUQlt9wn9nCOaK++dn3qFt+YpW3Y06wJRk/hcysuvX1543I2DN/yZW1O+9D
	2W3L92cx5c7oSyFXnsRNDllmJw5w2VtDiiV1k4Iyal2bk1Kn0m2V3v4nFqSvqOxF87D3xSF0l+dw8
	y5OkKRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNFJ-0000000H7zt-3C5x;
	Mon, 27 Apr 2026 14:47:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNFI-0000000H7zX-3eAA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PA3bf/imBxC5EKrXdfA68ek5E3GmwUyX6xt/N+ElqDw=; b=hF/Kg+eipQV6iewjDodSQr0E5M
	uLJktkf9g0oeC/ZR5kMgmh5jj7hjKuINsPbdm8Fobh0hdjgiFRLcq0IU6LgIIMTsV6zEqdhuMwoBP
	GiI1Q7tlxTBgJb9f0DkGiJxZK2Cu0NQhnqA+ofoU867JNwx7+mg6bi0/y4LFgQEADPqX+2Hn12TOy
	/W+raLTz4s9Xx8mpFDbg0Rg/2Q+/hbOy4hOTfPJv47Kn0Y01sOC5UrmnRLEpy4CohHpVlKfTshO/9
	3L+4ksvcZWWhIu0+E6sg0B0+0C5VHWS4gMRUQUZBkyC5QGO3lRL+KU9fMrXi+r0VT2WfsYXOVBuXo
	v2ARSnOg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNFF-00000000r9S-39zf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AF89440F3;
	Mon, 27 Apr 2026 14:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A6BC2BCB4;
	Mon, 27 Apr 2026 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301252;
	bh=Z483jaq0PLbsnfulejve6EMRSqLX8gYSbFxJJPyN+J8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGE/TAFGP3EM1iSaHiXOvAVrROZj0Wr7WKrXXtoP4nNEi9T+nHTZBN7vnwD0wp8Zi
	 qdvWsLRkfev7pSaALiZ2bbElfC1CBn8eTFeu0w9RZBhxMwRIaz40BKA4+e4zyHc/nG
	 FFkLaeSVx32p1R0Uz92O3pHxsgKmLbRPf2K3aaEm9RwPMtdmCWQ4sgg9VtHV/mn97Y
	 Ly3OVFNae0eHxq/hsIEGHkMFBltJSRsQgRq7TaACqDFD7QQ3sYY3ynNmagm4PaBjGS
	 MJNqkJdv4+3Jd3kVkANI54Txbe+2HW1vTPRy0fHjUi2B38V2rgjRJ1dl0mbS5/ntzZ
	 r+U8fuliu6TnA==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thierry Reding <treding@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Date: Mon, 27 Apr 2026 16:46:30 +0200
Message-Id: <20260427144658.3609647-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260427144658.3609647-1-arnd@kernel.org>
References: <20260427144658.3609647-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_154734_306517_BF501A40 
X-CRM114-Status: GOOD (  20.47  )
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

There are no remaining static platform_device users of pxa2xx ac97,
so the rest of that code path can go away as well.

Since nothing in the driver uses the gpio number now, constrain the use
of the legacy gpio interface to the architecture specific code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/pxa27x.c             |  9 ++++++++-
 include/linux/platform_data/asoc-pxa.h |  2 +-
 sound/arm/pxa2xx-ac97-lib.c            | 25 ++++++-------------------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff6361979038..c588eeea1485 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -58,8 +58,15 @@ static unsigned long ac97_reset_config[] = {
 	GPIO95_AC97_nRESET,
 };
 
-void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio)
+void pxa27x_configure_ac97reset(struct gpio_desc *gpiod, bool to_gpio)
 {
+	int reset_gpio;
+
+	if (!gpiod)
+		return;
+
+	reset_gpio = desc_to_gpio(gpiod);
+
 	/*
 	 * This helper function is used to work around a bug in the pxa27x's
 	 * ac97 controller during a warm reset.  The configuration of the
diff --git a/include/linux/platform_data/asoc-pxa.h b/include/linux/platform_data/asoc-pxa.h
index 7df78867db49..0d5eaf4b100c 100644
--- a/include/linux/platform_data/asoc-pxa.h
+++ b/include/linux/platform_data/asoc-pxa.h
@@ -6,6 +6,6 @@
 #include <sound/pcm.h>
 #include <sound/ac97_codec.h>
 
-extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
+extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);
 
 #endif
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 79eb557d4942..4913c8818ddf 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -29,7 +29,6 @@ static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
 static volatile long gsr_bits;
 static struct clk *ac97_clk;
 static struct clk *ac97conf_clk;
-static int reset_gpio;
 struct gpio_desc *rst_gpio;
 static void __iomem *ac97_reg_base;
 
@@ -140,10 +139,10 @@ static inline void pxa_ac97_warm_pxa27x(void)
 	gsr_bits = 0;
 
 	/* warm reset broken on Bulverde, so manually keep AC97 reset high */
-	pxa27x_configure_ac97reset(reset_gpio, true);
+	pxa27x_configure_ac97reset(rst_gpio, true);
 	udelay(10);
 	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
-	pxa27x_configure_ac97reset(reset_gpio, false);
+	pxa27x_configure_ac97reset(rst_gpio, false);
 	udelay(500);
 }
 
@@ -328,24 +327,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		return PTR_ERR(ac97_reg_base);
 	}
 
-	if (dev->dev.of_node) {
+	if (cpu_is_pxa27x()) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
 		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
-		if (IS_ERR(rst_gpio)) {
-			ret = PTR_ERR(rst_gpio);
-			if (ret == -ENOENT)
-				reset_gpio = -1;
-			else if (ret)
-				return ret;
-		} else {
-			reset_gpio = desc_to_gpio(rst_gpio);
-		}
-	} else {
-		if (cpu_is_pxa27x())
-			reset_gpio = 113;
-	}
+		if (IS_ERR(rst_gpio))
+			rst_gpio = NULL;
 
-	if (cpu_is_pxa27x()) {
 		/*
 		 * This gpio is needed for a work-around to a bug in the ac97
 		 * controller during warm reset.  The direction and level is set
@@ -353,7 +340,7 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		 * AC97_nRESET alt function to generic gpio.
 		 */
 		gpiod_set_consumer_name(rst_gpio, "pxa27x ac97 reset");
-		pxa27x_configure_ac97reset(reset_gpio, false);
+		pxa27x_configure_ac97reset(rst_gpio, false);
 
 		ac97conf_clk = clk_get(&dev->dev, "AC97CONFCLK");
 		if (IS_ERR(ac97conf_clk)) {
-- 
2.39.5


