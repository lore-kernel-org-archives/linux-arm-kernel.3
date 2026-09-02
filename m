Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E198CC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=; b=WDQg4lD6Q3BmCSTX/yaBCIykRZ
	TPfZRl5t8EZ0BGEligmrXVI5bqoWYl2icGBwC9TnF3IVlgl+DsaX3j5Zv54+LL/fbpd48fLVCx/rp
	/x+Rap7WrCRoiSuehEE2W6VpssJ01djmmhy5oxdVP3h8MD4YjKKLuTw60+WboDSh1v9/7tpLPfTU+
	9y+vI8qsr6b4ykja+sysIz3bwdNpkgDTHMIt5KZuAiBBPeXRx/hV/8Bqx3TriqWxwaKl0iFveYYnW
	2k4lG4Dt9VCy0vTYPcJE/hfzHta/A/i/JdEuO88DfEWCRMiFumutJxJbltHtSecDyhU3CnE2wLlgP
	xIKb0FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1faJ-0000000DyA4-2Iaf;
	Wed, 02 Sep 2026 07:40:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fZX-0000000Dy3S-20Oi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:40:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47fe89fb333so443825f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=o9+Bc6S4AnERfQXBZCfIXGMo5JpI0yZRbtc8lg2t66rVB50J8V94yg5DQ5DWHAjSYp
         r3vCO+m9Y4tIFVrPXPpVulyZwXBQB6WCUjxJJ6VtKEdr3PXd/KFTAYshsIhJHqlFIzHF
         Osri0tW3T8NcAexT+mAyycl4ys3tiN1DMCCctnUbpAUIhy3r9bITwqju/NSdFnYi2+BZ
         mXQAWwnQtf3QPJ4tAdOVBAK+Hxo6/lboOnZhxxHOOHUJPV8LT6VuGg7HTjH6r+1DBoev
         oKMgKO8lINmhOk9hm3HXD48SfDzpJks+mx8+sikmKqPoQrSt66HMMrF4ejPbthQLw7E8
         pziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=g7CfFNGlMyZIGF/sRg+9tGSrNa0NScLyoujXDyYIWF0gRGfazVBJkEsmyiG3piPJ3i
         QJF7wfpRkpubbOxpceb4VSh+Db3KiOUWOpYGmwfnIh+fPXIrreH/c6b7qstbtvIUao/H
         f4p1NBhjS2FSYZ3VnuG2c+bXo1kp3jo2hnhrmytRmju2uQUrRmovO73DsiHVh8W/edDw
         TU2QYXq022YrzUbcqTJmvK6o6S6ApNGuHzIYYS1/kT7Ni+oemPU0F59HU/gjtIbMrADG
         qp9Ul7sq3JbEuNN05OTmxVFVWuifWrDCRm+b/fZvorgpOc8QYRxPN9Yy1Rwwc0lDaMsq
         zV2A==
X-Forwarded-Encrypted: i=1; AKwUvBw4NZ/oyIwc+G34CRPqO+RGEPWStqdVXYEyyKwSZjzi0p3y3p8ZaKTIKy0jU9sF1COpyIj0s5Zvews+GYL0/03i@lists.infradead.org
X-Gm-Message-State: AFuF++kyEVB1apcB4aKEtmDifFsMh2aLYAsg+aknzzacssH2VWJgWRhO
	YaOl08qkJvKuK0kmkm4sbjGdJxzE+kPMfHHHmeUhgNtqwfMUwSaXwCxj
X-Gm-Gg: AYBFou31R33Es1ubl7IMh8w+f4WXOYGp28m8j5SnF8Edf7WGGnVeepmOajz4IOMq8Ng
	8BR5TQO5eblgQuMYRhrXCUJmF4OHMoJT+LwxXs5GWcWw2xUE7mnCNxlGZfvP7ZpJG+Np3Xm1S3r
	dK1VmaK1j/eevWHdqy94v+m4jfCZC3pBuwefJf7nhNnYyUy9PzKpRzqpOdZbsHjK5StZotFeZ9G
	y4JB7F8AvdUirq9Rf0x+3hwARLjobpFXMLaT/k78T0EJqXBZhkJiJ3+Sb190rQC2rcfkYyYogdk
	AuVu7bTxWfzVXS1RBrXGp3whCUf4oeLL/uyRLUM3WTmGrAfMvb7JmPtHYQpsZhPxJnZLmiTsob/
	c96N/F8Qk84j6jEmcVeIXE7JimWURoEzx2WyVsextRGnt6Fz65GEDRbKTeU3Y1BD2HCJv8Xj8O8
	pTn1VizzWZHk7eW+L8n1zvPcMvzTRhqz68nGBr+/UtBIZTBX6/wVHPt1mVtJFknAQzbg==
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr4552916f8f.8.1788334789361;
        Wed, 02 Sep 2026 00:39:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 09:39:45 +0200
Message-ID: <20260902073946.3709080-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902073946.3709080-1-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003951_556140_58425F28 
X-CRM114-Status: GOOD (  23.06  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
is 0 with the bit value as the argument, which is what the
pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
next patch) expect. Everything else, including pins the device tree
never configured, gets -ENOTSUPP.

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - the pin_config_get callback answers only the parameters the SoC
   declares and returns -ENOTSUPP otherwise; the debugfs group dump reads
   the raw register through its own helper instead of calling the
   callback with an uninitialized config (Sashiko)
 - subject prefix pinctrl: imx:
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..506ee6627c82 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -291,8 +292,8 @@ struct pinmux_ops imx_pmx_ops = {
 	.set_mux = imx_pmx_set,
 };
 
-static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
-				unsigned long *config)
+static int imx_pinconf_get_raw_mmio(struct pinctrl_dev *pctldev,
+				    unsigned int pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
@@ -312,6 +313,38 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	return 0;
 }
 
+static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
+				unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask;
+	u32 raw;
+
+	/* only the parameters the SoC declares a pad bit for */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		mask = 0;
+		break;
+	}
+
+	if (!mask || pin_reg->conf_reg == -1)
+		return -ENOTSUPP;
+
+	raw = readl(ipctl->base + pin_reg->conf_reg);
+	*config = pinconf_to_config_packed(param, !!(raw & mask));
+
+	return 0;
+}
+
 static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 			   unsigned pin_id, unsigned long *config)
 {
@@ -324,6 +357,18 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 		return imx_pinconf_get_mmio(pctldev, pin_id, config);
 }
 
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
+	if (info->flags & IMX_USE_SCU)
+		return info->imx_pinconf_get(pctldev, pin_id, config);
+	else
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
+}
+
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
 				unsigned pin_id, unsigned long *configs,
 				unsigned num_configs)
@@ -426,7 +471,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
-		ret = imx_pinconf_get(pctldev, pin->pin, &config);
+		ret = imx_pinconf_get_raw(pctldev, pin->pin, &config);
 		if (ret)
 			return;
 		seq_printf(s, "  %s: 0x%lx\n", name, config);
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index f65ff45b4003..8fa7e1e2521d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -91,6 +91,10 @@ struct imx_pinctrl_soc_info {
 	unsigned int mux_mask;
 	u8 mux_shift;
 
+	/* OBE/IBE bits in the conf register, 0 if the pad does not have them */
+	unsigned int obe_mask;
+	unsigned int ibe_mask;
+
 	int (*gpio_set_direction)(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned offset,
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index 76a4bc0181a0..77d077618782 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -319,6 +319,8 @@ static const struct imx_pinctrl_soc_info vf610_pinctrl_info = {
 	.gpio_set_direction = vf610_pmx_gpio_set_direction,
 	.mux_mask = 0x700000,
 	.mux_shift = 20,
+	.obe_mask = 0x2,
+	.ibe_mask = 0x1,
 };
 
 static const struct of_device_id vf610_pinctrl_of_match[] = {
-- 
2.54.0


