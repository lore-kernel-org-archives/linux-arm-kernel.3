Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0E4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpBAcyCN4P10EAu/CJbWGD95dsGLpgeNcWvqA8BQ/SE=; b=Wjq9EoLaoldG/5pXrLV3RddOH6
	9sVcxxGFFFe636q4OAXehAR9kn2JEptYqEpA2Uxmj5oHLRXpQqBXzyniRazDKiWxxXaYfF3b6sfaY
	hQPl04shIXt14l2mgXvLGFiPoyM3Mf+F+8luQItVCE6u08ThcSYwVb463zos8yvLzOOLPNNVTJPy2
	Zk5QRlkyokxYAi7Q95nOk9NlhJD9l0KTwjUGxqns2vlu2+HVdY42abVWh6w9yYnYXw3izOqaYV9gD
	dGUy9+1D5TFvWkrRwMTl5NA1JA9Zwn8CZL5iOfk+axGHj6weXrnIOEKfMc+ciygTFkoQMhWNKHqqM
	cbUnTSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbT8-0000000DfXi-2AYS;
	Fri, 04 Jul 2025 08:08:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFM-0000000DcxD-1v1t;
	Fri, 04 Jul 2025 07:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615652; x=1783151652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IxQt0PoKk8BTvmWimbOLB4rG5iTXBM6oigomry2CjPY=;
  b=D92tnGd2m9P53WqJb0niLhfIsHbgwKtc8XcrDKbH483z+Cc/bX68KsL+
   Itm/mEtg40fMrZRI/rwdy5Wv65cqtDrnKsRMkJo8bTLL1s6TCVC5lEWuK
   VmLKGK5ztxNRgiAJciHAQt2K/wIrA8VbZR0kS5yDmYlM5lqZtk9z1bGIl
   CrgpzW9xY1A8lVczapq8jGYbRP2ZNT+rOmu+FRZ3dNfwjvQXP6xrj06wc
   krCIwVi1oR3OPzoOgUks7NRBmtcLseYSkap1VP6G/aR2isgCqUIVTw4mD
   nsesNMChZuXKM2rXJKnfK5AqGNGVHxIWfA5ezBA0zGqZOnUIVAP8WcqnD
   w==;
X-CSE-ConnectionGUID: lscCBWMqTYSdhIdfROClqg==
X-CSE-MsgGUID: EFGlNN9mRoW/7dZyVOuCig==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494516"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:11 -0700
X-CSE-ConnectionGUID: TZWybnM3T2OaX6AYFlRSrA==
X-CSE-MsgGUID: EyGJEJv5SXuqPS0vZtHSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924166"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:02 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 18CED4445A;
	Fri,  4 Jul 2025 10:54:00 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Hadar Gat <hadar.gat@arm.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marek Vasut <marex@denx.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 05/80] hwrng: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:59 +0300
Message-Id: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005412_541218_A2A9B6E4 
X-CRM114-Status: GOOD (  13.53  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/char/hw_random/atmel-rng.c     | 1 -
 drivers/char/hw_random/cctrng.c        | 1 -
 drivers/char/hw_random/mtk-rng.c       | 1 -
 drivers/char/hw_random/npcm-rng.c      | 1 -
 drivers/char/hw_random/omap3-rom-rng.c | 1 -
 drivers/char/hw_random/rockchip-rng.c  | 3 ---
 drivers/char/hw_random/stm32-rng.c     | 1 -
 7 files changed, 9 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index d2b00458761e..6ed24be3481d 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -80,7 +80,6 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	ret = 4;
 
 out:
-	pm_runtime_mark_last_busy(trng->dev);
 	pm_runtime_put_sync_autosuspend(trng->dev);
 	return ret;
 }
diff --git a/drivers/char/hw_random/cctrng.c b/drivers/char/hw_random/cctrng.c
index 4db198849695..a5be9258037f 100644
--- a/drivers/char/hw_random/cctrng.c
+++ b/drivers/char/hw_random/cctrng.c
@@ -98,7 +98,6 @@ static void cc_trng_pm_put_suspend(struct device *dev)
 {
 	int rc = 0;
 
-	pm_runtime_mark_last_busy(dev);
 	rc = pm_runtime_put_autosuspend(dev);
 	if (rc)
 		dev_err(dev, "pm_runtime_put_autosuspend returned %x\n", rc);
diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index b7fa1bc1122b..c89171df7635 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -98,7 +98,6 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 3e308c890bd2..40d6e29dea03 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -80,7 +80,6 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
index 8064c792caf0..aa71f61c3dc9 100644
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -56,7 +56,6 @@ static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 	else
 		r = 4;
 
-	pm_runtime_mark_last_busy(ddata->dev);
 	pm_runtime_put_autosuspend(ddata->dev);
 
 	return r;
diff --git a/drivers/char/hw_random/rockchip-rng.c b/drivers/char/hw_random/rockchip-rng.c
index fb4a30b95507..6e3ed4b85605 100644
--- a/drivers/char/hw_random/rockchip-rng.c
+++ b/drivers/char/hw_random/rockchip-rng.c
@@ -223,7 +223,6 @@ static int rk3568_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	/* Read random data stored in the registers */
 	memcpy_fromio(buf, rk_rng->base + TRNG_RNG_DOUT, to_read);
 out:
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
@@ -263,7 +262,6 @@ static int rk3576_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	memcpy_fromio(buf, rk_rng->base + RKRNG_TRNG_DATA0, to_read);
 
 out:
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
@@ -355,7 +353,6 @@ static int rk3588_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	/* close the TRNG */
 	rk_rng_writel(rk_rng, TRNG_V1_CTRL_NOP, TRNG_V1_CTRL);
 
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 98edbe796bc5..9a8c00586ab0 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -255,7 +255,6 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	}
 
 exit_rpm:
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
-- 
2.39.5


