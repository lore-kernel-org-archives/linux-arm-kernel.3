Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63405C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0CKgK3ovQK+3XnwU1cpQ9DqhxZBZUxnsENVeMbNExk=; b=zui9DdYr20fiLcpzs/m06t3hXW
	VSX8wqasK5c8W0Y0cX4he9ZHRulPgddusTmO5mV+aGULJYXGrtpQPA2YeIS3sRqSoXzAzu7iFN0kV
	ZcB6xXr6hXKuYvEnDronmBMog9UkLO31dTc7AyIxZZpgfW8b4xHDmniBySniOJrSBqC8ZPpQfDFvb
	PrtI/CqbstzjAYW/oI8tEKvQYNo5N9Qsfbx7CRkKKGGZzOss24pzxjH55GjrWeoaonBjKXW13ruVf
	LYFOvI+TDD4HDDh3AbhSynRK+ARRdbw28sazDesUBaeImDIVJecTJX61A0I507l3k6aeNYokRCQkh
	HrEhom5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9d-0000000F8KL-3B4D;
	Wed, 02 Sep 2026 15:45:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9a-0000000F8IE-33Nb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:45:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso12269935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363933; x=1788968733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0CKgK3ovQK+3XnwU1cpQ9DqhxZBZUxnsENVeMbNExk=;
        b=Rhc0cF7PrVoIjGaJcszW7FBHMfUYXqJRn9wK19+QG3qYphIhDbek+FMiwzR9QpGj8S
         tyiyTK4pLz9FYQBPYH515GtRlZ/g1PsrKPPfc4a9MRCAN6lvVXCXUL0ipTLidrVxMRh4
         UcUJHY5wTIEAlJaFhQV6zqFU4INbETXz0kya/4Kp/NGJvCMOVzR4seiciFzw3hDVsjFh
         VtOsxvd4sg5UG7SrPOAFi7MigkiEL3Wo6flbpFu4GXlAvcxk/8wEzY7qsJP09i6j8Iw7
         B1/vt9cJgJ/0hhh/YT7Soi470b9drMAOOWIFhMzvsGYwfkkkVRlgMWktuH9LKjWbZJPZ
         v1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363933; x=1788968733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0CKgK3ovQK+3XnwU1cpQ9DqhxZBZUxnsENVeMbNExk=;
        b=BZy8EYU702G5IMDyTKMXNPqypSNumlIp06RGUYitZOwEjyfYQIN7Vj4Kj+tuHpa69p
         bjE8BAQF9lYxY06NUm5MP5lT+/JwOKitjQGO5D7db0z6oSuVtnFtnIqujrWlM63Qj0Wj
         J+1k0OgCJwlkeir7OH1vZf294iGS5N020AXA1dqp2NE2YeO4WvvgFlcHMpRmCPDbR/Ak
         xBnz2zlLxJxjubLJO2rodOF7F0dMzaesfLrwOuG17B0SztN/pH/m4ZZH2iwJl0Bhymta
         k6EuIvRIHCG+ggAD+x6QbbLJmpJ+CKp/UcOazk6g4sMMMzovmiXSnOwrHAg5KAIUvTUK
         LsQA==
X-Forwarded-Encrypted: i=1; AHgh+RoC7vQd88LbYqFFN8xNuRlY2LrbhacQJaxclUL1+WQ50Vv/vUE0FiBHxN7OloumhaVOx/mg2BTtRJwzuOUST8CR@lists.infradead.org
X-Gm-Message-State: AFuF++n8NVCosZBM78BzrQiBMTZg6fskBsFatLJrQRoInBzsP97UjL6l
	wn4ql7QLGE2qXToEDqJnLzf+rprTStxEOhi+e4V2LmI6bRECDTOoyMcv
X-Gm-Gg: AR+sD12KekILUIZEbUSKRE5bMZpEXNHgUuv072EoyTBArqckAzMqUiGTnBxjgLrlnyV
	hk6K6d1ITD28fwpUjZ0fON/JMggYbP5SSaISgAw11Vu+dLf1PflaGbFASX8iFhu9qIhwqWHsJ/J
	bK434RPu4EkSEjXAReEX6GSkBJztfskYNBE+dG7cewZlr0U7rKW9LIxeRVP0aEyiyQI9l+EySEe
	+29pLRzuDmI8ERIAfcumSPrGw9K/MQfCjsSDEdYyzFZrtsxmOc5lj5QuFMXp/fT0zgpKj0QaZ1v
	QtGTU2N7QRoEeDQjIENDqshxuu3HrWsX2ZiBM4C4KnRTiw+Y7ZmYnY/GEDWy2lWF8HawacVWZ2H
	D6ZRPVKrITh7D68Rti9gh2jq137Rc2DbypZcvO26TyBpzhldt0MRLuCHexJa114LBxqKARYIYqz
	82lX9o0KpPAPACZQhHSqAPxITQxU/qI49AVGzwmXqbblSbPsFt/i+Fe5YzZDx/30hU+Q==
X-Received: by 2002:a05:600c:3acf:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49ce5810906mr113425805e9.2.1788363928485;
        Wed, 02 Sep 2026 08:45:28 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:27 -0700 (PDT)
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
Subject: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 17:45:24 +0200
Message-ID: <20260902154525.4090276-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084534_812278_983CDE81 
X-CRM114-Status: GOOD (  24.77  )
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

The pin index comes from the gpio range unchecked and the driver indexes
flat arrays with it, so an out of range gpio-ranges entry would read
past pin_regs[]. Nothing called pin_config_get through a gpio range on
these SoCs before; now something will, so reject an index beyond npins.

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
 drivers/pinctrl/freescale/pinctrl-imx.c   | 56 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..1bcb2f772d38 100644
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
@@ -312,16 +313,63 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
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
+	if (pin_id >= info->npins)
+		return -EINVAL;
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
@@ -426,7 +474,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
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


