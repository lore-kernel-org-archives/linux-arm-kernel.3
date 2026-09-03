Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B17FC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=; b=mWLFrJzFXLUxjJU+Qs0VZhoqYb
	A+BDqD/OQUblcLS8ABUfHFm+5IICoxYBc40XVLOGtPYygyvLQXvsIaPSMGk8Tq1uebvSmg7SateLS
	IGy71oGu9oI9Wd4ezKfmN1clY/sXBvgI2sXdXPMIyDFKRD/7Wm74uNa8PLXcvss/vy0IuayteSODf
	Dz0zUL4F3ZvMW4WVn90HdUKGkiZzjS/7xYXsscc/l9++TsKlVcqIpwAwc0AbCf4nununToSKEgGLE
	FvyQxaHR4EaDbsw4ro8pKM/Vi17LAqEO03FAGOjMObfI6KUwChU+qooNDGpw/vuukvqFCPdUejXQZ
	xsVbSgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vW-0000000GZzd-3rqr;
	Thu, 03 Sep 2026 07:32:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vJ-0000000GZwK-1KLn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:31:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so16321485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420707; x=1789025507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=;
        b=fL2fRasNmGtj41X1mxWOPABdjXkr0tEDmHgVQ09ZYsQl8xeMl9AeMtAdrPhtiOP07s
         Ialhas9iRrRAd+F/GTRy9Q+1RVtm+xRDQcCVMK/fSNZ0n2PDedwH739/rBSr+vlWTlhW
         NiIU3UXK7r/tOdcS09k8QU2dfw1LtQP6H3g01SYZou8zq+NrjUCcFH3AGLF+OP3PU44B
         2/oz4TpS5skaEgKttuVFdx907q3rMg+nDCt2eKlKXTo7bZgDswLqoKoejn8s5xZoo/Ls
         40B6iTio2AFGq1jtKY5dW4zsqHEMcuafECxlGo8ruZlPUHH9YKesHsdHSzIuqbv1rLI1
         cmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420707; x=1789025507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=;
        b=Ju2Gbmz6g2PNM36oc7jkvQuk291467n8mSfHIVqdgGbP6hUlQ12AOdSwMqr0ZJ0Hfk
         6ugtlmczggJ3TyP75AqfK8cWuY4dt6FejvwuAYUK/rCha7GMW2fcyG/ox6HEM/VAeGjS
         VPS+H6mqImKW5XKLLTY4mUgsdk0JLnznvgqVoH4Wn6lO6JWf9erAigSQFrM530WLMmiU
         i6Y8artJOzRbI34uQBG4L40+UA/iNxsVDzZSnQ8PtRpbo+4tLXNiT6V/UJ7ine7Z7/uC
         nt2Y9eYyW5QOB4ecHjEqwYpb6jxYXIJbQ/TLoxRinFyqhWOQ5hIJ5Bth8F+B46QumRkp
         xZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBy0VVHTxQ9lbnurpE2bs39BeSRJdpiK97YO8Ha/oF+1CwhO0QFCDCAygY7ZqI3AnmfCEHsoax3uS0wF4DTT3AMM@lists.infradead.org
X-Gm-Message-State: AFuF++l6EOKRHdnCeMJQjbK6TO/OgkCJ5PopWMUrDk+Yp9Oz6XHnde0d
	LNAzWFN9KLVw21a5B7JT3Mz3NRG5vwHoQLtNFxh97DRaQiRIEraIyc3X
X-Gm-Gg: AYBFou3Dvxg7PvxBuux2D+Iu8+GPfAQooO8k3OIdmqBdJWgCQhrF7FAvwDjSObB96c0
	BXpsrKD64OrK6PLS48IlnnpNe3hBPHokIBz7SDJd07H7/kqM2+OXxsKKJxgMa40sdmsV4fLdacb
	JDH8PnLtflhg6yDTd8YuCPzSqoSv3b5RHlzoiQkwqdcESnk6IU8J4te1AU0Q8rEmz3xRSjjn4/o
	qcQAYmq7OHpsn4B1WLtvERLuba4r77BwbJLLY3UfR+F9szAcCMY6zKl7E3YD9irY+ZzD0suetoP
	+6iqKPu0O/tYYpryIoc/Fmldan4cK8EMPtzz32UaLJvVuNkll4KTM1NHrhLIY9FF8V8RNQorMOv
	Xtd8Zz9TGZtDPvQF4xVHkJswLsysMFlwuoa8ulKZVI0ZF0DflDRAWhT2tUaHfiRLckZyIAD7lX4
	Raf3zsEyZFylXodwKxFtd6PGZY8j6sCq4rZ3F6TeTw1TCleivYo0BGSXgNR4N29CsmZw==
X-Received: by 2002:a05:600c:6992:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49ce58034admr192721335e9.7.1788420707039;
        Thu, 03 Sep 2026 00:31:47 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:46 -0700 (PDT)
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
Subject: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:31:41 +0200
Message-ID: <20260903073143.2068494-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003149_525968_A7DF555E 
X-CRM114-Status: GOOD (  23.48  )
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
next patch) expect. Other parameters and the SCU based SoCs, whose
firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
the device tree never configured gets -EINVAL, as the raw helper already
does, so a caller can tell "no answer for this pin" from "this
controller never answers".

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

The set callback is not touched: the fsl,pins binding hands it the raw
pad register value and that stays the only thing it accepts. Nothing
in-tree sends generic parameters to it on these SoCs; making it
understand them is a separate change.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..f08ef52bf4f8 100644
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
@@ -312,16 +313,61 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
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
+	if (!mask)
+		return -ENOTSUPP;
+	if (pin_reg->conf_reg == -1)
+		return -EINVAL;
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
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
+	if (info->flags & IMX_USE_SCU)
+		return -ENOTSUPP;
+
+	return imx_pinconf_get_mmio(pctldev, pin_id, config);
+}
+
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
 	if (info->flags & IMX_USE_SCU)
 		return info->imx_pinconf_get(pctldev, pin_id, config);
 	else
-		return imx_pinconf_get_mmio(pctldev, pin_id, config);
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
 }
 
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
@@ -426,7 +472,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
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


