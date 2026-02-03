Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACEAE8784F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsdORxck7/McMEoiyVqumRwmRBpv6fpmNsp6qMgoSEg=; b=cTRCSyi9NZ4mcC23gtE8U1ACYM
	7Sa9EApdsB+Xi7bziJq4LChEyAMTvnWyr8zW7Ezs0mx5eg2iDL5gBbzcGfebJONGLPZffQuqTL8Ef
	xvtnmAF9vxbj4gx8EARCwpkiuyPE56lzJbdCncBTuIR2zr4mLTpk9CeDMQyufyqOXgjL/O2i/7bBV
	fpJCdqvA9t42GykCyDGuxwy7K/7EwJVioxvvUzLuhOs5PPLvnYhZAY8dpqJ0T/R21g6LqfjZda40E
	Dstzm/dmV1cBrDIOf276Ge9ChbCq0msUAlazMQBEVolgbsXYNXd3syEHpwU42RXrTghyffiL40hXL
	AeNtQgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY5-00000006xzu-3gC4;
	Tue, 03 Feb 2026 16:46:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY1-00000006xtY-0yxG;
	Tue, 03 Feb 2026 16:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=ryd1GPahcy/PsDxXiKO4mGW1+HlN8gMHqgT5wZ+suWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RKfviUaC5lqc4VD7VxLnex+w9gy1yVFzPAb9hkcbGC99uhxvcLgq8eefaldb28M4Q
	 wNGlpWAx6WL0rPgu1LIlg/GqjbewL08W5eSZ4gU4O+XUhRISoeZzNcpBUOu8iySA1d
	 2r3tYZdIVe00dvjp07XCfLvE9brXo3Y+ScI9usBGYDrCLrsTetTLx5ekIKXJW1RMRH
	 HD90evYEMsiEjEdj532x7ctR5EAHJihzRrASG7KUkw9KYjtoK6APoiDf6WWGwRSnrF
	 dUCrzBVMn+eRnJjocnySvuQEXTH5e7uqkxiJoESK/6oCBE4YCKC/EdCzGazO6PZyj4
	 PrpZVEWVWssHA==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6C0217E35CB;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1C43E48002E; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:31 +0100
Subject: [PATCH v2 09/10] ASoC: rockchip: spdif: Fill IEC958 CS info per
 params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-9-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4I9xh2DKmGrP1vcbHGUmnEomckJYqKp7hvG1s9+J4gc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmmdSNeP8CxVXWdMUVs/dsgomemCxe2Iz
 WcINy2qe+1KyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaRoYQAKWntlVxrgKW4/FH3mQfkQOVryomh8cqJWu7S9RIDMyJV1hhM5rwaFuA0YCt0eKDstG
 BtYBUnnLqc7AEgGYMk/GbKIQeboApkCSsFQRMSMOFbsPyS5GzhSFmnGienflAxAmhOkU1yMofdg
 HBVjFVz/4GxsVVrj+eg9bNTiCHYYY1BRWrIV3G75n/jOJaKKC5Zk+EB80j3BPk8YtTepKRFQEZT
 nZKs2V1sztFjymA69Z559a4vbtL12u/7tIcWN6mewhjijDbAen35nzG85rcG0gDRwFDyy/AQIfq
 vdiNYm2dJHO/4GKrt/KEiD4aU4FEuyfwYBmETlraMl8IU9OGEpfXgMItyMIP3aKBq7/CICE8of6
 1xE0HwA/sizZD3Q/2f4ZASIuFpxRNi/Pmn3vEGlWmbRHFtOorK2xl0nucb3Z5SnEufHpsartzaJ
 WChNQ+0DrbO7mNrFwKQrSzxEUGQkxSEJw3vgy/Blks8qY/RtIvbtVCuPX2rmBG1z5uKNGdt3Ku2
 7tVtogeT9F4XyzArPwLdNLxHtai5NViEvxhlXbhpeCxcquLtZiz+RHRpt4HhmZaytL2A9YrF1vl
 tGMNksTCjmm/ejPEnNxcG7/v79ICBhfBbpu2LXegmWsNNNqKMPBoCTkLpq2+SMqUa4uZolol4xP
 rA5BllVwqoOsW5lAX0zcukA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084641_436561_0AFEE5C6 
X-CRM114-Status: GOOD (  20.62  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Add support to fill IEC958 channel status information.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/Kconfig          |  1 +
 sound/soc/rockchip/rockchip_spdif.c | 45 +++++++++++++++++++++++++++++++++----
 sound/soc/rockchip/rockchip_spdif.h |  8 +++++++
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index bd210fafe9fe..391ce2225fde 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -41,6 +41,7 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
+	select SND_PCM_IEC958
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF driver for
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d06573f22805..e64c24897f29 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <sound/pcm_params.h>
+#include <sound/pcm_iec958.h>
 #include <sound/dmaengine_pcm.h>
 
 #include "rockchip_spdif.h"
@@ -27,7 +28,25 @@ enum rk_spdif_type {
 	RK_SPDIF_RK3366,
 };
 
-#define RK3288_GRF_SOC_CON2 0x24c
+/*
+ *      |  7  |  6  |  5  |  4  |  3  |  2  |  1  |  0  |
+ * CS0: |   Mode    |        d        |  c  |  b  |  a  |
+ * CS1: |               Category Code                   |
+ * CS2: |    Channel Number     |     Source Number     |
+ * CS3: |    Clock Accuracy     |     Sample Freq       |
+ * CS4: |    Ori Sample Freq    |     Word Length       |
+ * CS5: |                                   |   CGMS-A  |
+ * CS6~CS23: Reserved
+ *
+ * a: use of channel status block
+ * b: linear PCM identification: 0 for lpcm, 1 for nlpcm
+ * c: copyright information
+ * d: additional format information
+ */
+#define CS_BYTE			6
+#define CS_FRAME(c)		((c) << 16 | (c))
+
+#define RK3288_GRF_SOC_CON2	0x24c
 
 struct rk_spdif_dev {
 	struct device *dev;
@@ -88,8 +107,20 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
 	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
 	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
-	int bmc, div;
-	int ret;
+	int bmc, div, ret, i;
+	u16 *fc;
+	u8 cs[CS_BYTE];
+
+	ret = snd_pcm_create_iec958_consumer_hw_params(params, cs, sizeof(cs));
+	if (ret < 0)
+		return ret;
+
+	fc = (u16 *)cs;
+	for (i = 0; i < CS_BYTE / 2; i++)
+		regmap_write(spdif->regmap, SPDIF_CHNSRn(i), CS_FRAME(fc[i]));
+
+	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CSE_MASK,
+			   SPDIF_CFGR_CSE_EN);
 
 	/* bmc = 128fs */
 	bmc = 128 * params_rate(params);
@@ -239,6 +270,9 @@ static bool rk_spdif_wr_reg(struct device *dev, unsigned int reg)
 	case SPDIF_INTCR:
 	case SPDIF_XFER:
 	case SPDIF_SMPDR:
+	case SPDIF_VLDFRn(0) ... SPDIF_VLDFRn(11):
+	case SPDIF_USRDRn(0) ... SPDIF_USRDRn(11):
+	case SPDIF_CHNSRn(0) ... SPDIF_CHNSRn(11):
 		return true;
 	default:
 		return false;
@@ -254,6 +288,9 @@ static bool rk_spdif_rd_reg(struct device *dev, unsigned int reg)
 	case SPDIF_INTSR:
 	case SPDIF_XFER:
 	case SPDIF_SMPDR:
+	case SPDIF_VLDFRn(0) ... SPDIF_VLDFRn(11):
+	case SPDIF_USRDRn(0) ... SPDIF_USRDRn(11):
+	case SPDIF_CHNSRn(0) ... SPDIF_CHNSRn(11):
 		return true;
 	default:
 		return false;
@@ -276,7 +313,7 @@ static const struct regmap_config rk_spdif_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = SPDIF_SMPDR,
+	.max_register = SPDIF_VERSION,
 	.writeable_reg = rk_spdif_wr_reg,
 	.readable_reg = rk_spdif_rd_reg,
 	.volatile_reg = rk_spdif_volatile_reg,
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index acf64986a2e0..b837b1f8d57f 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -21,6 +21,10 @@
 #define SPDIF_CFGR_CLR_EN		BIT(7)
 #define SPDIF_CFGR_CLR_DIS		0
 
+#define SPDIF_CFGR_CSE_MASK		BIT(6)
+#define SPDIF_CFGR_CSE_EN		BIT(6)
+#define SPDIF_CFGR_CSE_DIS		0
+
 #define SPDIF_CFGR_ADJ_MASK		BIT(3)
 #define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
 #define SPDIF_CFGR_ADJ_RIGHT_J		0
@@ -64,5 +68,9 @@
 #define SPDIF_INTSR	(0x0010)
 #define SPDIF_XFER	(0x0018)
 #define SPDIF_SMPDR	(0x0020)
+#define SPDIF_VLDFRn(x)	(0x0060 + (x) * 4)
+#define SPDIF_USRDRn(x)	(0x0090 + (x) * 4)
+#define SPDIF_CHNSRn(x)	(0x00c0 + (x) * 4)
+#define SPDIF_VERSION	(0x01c0)
 
 #endif /* _ROCKCHIP_SPDIF_H */

-- 
2.51.0


