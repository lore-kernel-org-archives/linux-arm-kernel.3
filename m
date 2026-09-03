Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC9C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=; b=5CJ/FNQX4I5ysaU4zv4cDd51g2
	veAL+Tp49iIIVKNVmU62zGuXgTu1IQgGYvA+MzNZL2H2cCEpsh3h3FQ0Y9vI2FA1OHNoc1ksvYrXJ
	l01TlOFfeFQm06GmLdfqaxs2QFCHc6df2+ZhXkate+dyEtwpTiGVaPMG6DDau3Cif2joMkNKhMPok
	yEYN3LVxE0X1WG1X9x5yypBDd1DTQq+Cg6++xqflNWDO6QJe3Y+hzgCuW97A91eQuwGETaUKgvfnd
	tLPHLyT1vZ/DXb+luJUJhc8KUs9wAK8unely9vhXEfRejTx+u/b7+D3EUSvmv/ud7vpvtl9Exx7m2
	E1F0aSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MO-0000000GiZk-1KG4;
	Thu, 03 Sep 2026 07:59:48 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22ML-0000000GiWo-2cd2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:46 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso16107895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422383; x=1789027183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=;
        b=lZ+wrDdVtm1hxFHCKWSi5PBGz8Zzr5vuA70zX85so8VgmUzvv2PwvUEtPfMUV7/EX8
         5qp0//RUlu+WiijKG2JO3lFm190n7b/KNVwNzPvcXRZFnjIcp0rTdqNMVH/Q3zjA1WLF
         JEEJptpMKIehagOAZRtGzOC1Bqtgu4xVcmXcw9ddZKx8DWt3U8kQR0WM4nkswlc4ECLT
         2gKlyshw/9FOO4/Fj8OY5YNdNVfzg1XD0fLuMnSHZNF9zb8LzLo1vGDC3aOvs+3HL8NK
         nxQ+wYmRuqCw8+V1kW8VEDLh7KCF0dU2/RNJbhN+LUqZ8hIsqiZCVC3aZVBxOVaVq2M2
         I++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422383; x=1789027183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbqs3+P/ZX13vEXv3N3Jwum7K59Zn0Nb5bqVSfKORxQ=;
        b=ZYGPGx3nJ/M3nxAKInRH0i8A8wHJh10D2EVa0mj7KbPyMoQgihmcDeSjaXTrcJz2DM
         4XOJAYtUOCGckLD+Sym2ws/cDwLcrMQcK07Fty5q/dK19F1NwMlex4J58vfxHCXwroTM
         89R+/TyDjpftMb5whhMntrBlI9E3no8kVlIHSjqupa6Vquu+XsY15+BVKunjOY54Bngk
         NyzGYTo/CV9XPXw+5O2aDMDV6QNLSVoupwXzwQ5BX9ln8RO/zQKIPdZNW13AJJ44UTQv
         BDIc0zmkTvS5gdno79oFlHeEI5yKJVJdDBCEfT37KuiHT2XPOsYmmD48LT97ENS8JuYs
         aWfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSEPyTNfTn5MCbJ8viq0Ux3OOHqTMgIv+OvBksVLqYUb7MWtrBJqnEdRl1jDK+JvrpiLhRXg34SVI+JNkcVFac@lists.infradead.org
X-Gm-Message-State: AFuF++kjt4d4QB5yuZd2zSARvmvVUOVFErwel4rtszjgxxkVPpx0MCbX
	HaZSfi1kpkL4STS6oQz8S4Z+WYaX1a6TWV4RTS8FcIfcYnIQS7nZvMwZ
X-Gm-Gg: AYBFou3XzgzficLqPHnpSuobjHVOKl+8sIcn7FxKo8aNf/49E/DpCxzdOnkl0SwZsm+
	hddn6u+tlGjd+5LQ2iImPAWkYKVRUWT/OonEKnmg7Ch3qFQw+tw3cmmvCTO21I+UmQafsmkzM/e
	ql1ys9rT2aoGjyO0Hg3le8bQCJVJios7+weFv+8a+tzNPo+OksfkIuWuqOqtPp1cuDCpXKLNYyj
	87UOiESjKwrEC8o95eCOPD8hIkzX27o0RhyD2ETNv/o956S7fYVnz3+gkJEHCjqQll8soG+SmnB
	s6q0v+nzlNMoGv+c6Q7Qlllj0zBulMRXdJdqVD0X4yAPakCgWyauqGyQJYR7CEWKBOmji46OOYM
	Dvp3Kq3gjvVUKKt0N9VQyEMMZyLhssxhzp5lye6sb5Ci9QdTWqNj6Mxhsb/p6aXeraNrG1o8+Ya
	wQ03n4k0nCMcZi7pEMokvmGAWclFENRa6R29p+Sm43aE8hDbP5LSt1zcpNPFDuE4UAe0wkHr/Lz
	R5+
X-Received: by 2002:a05:600c:8a17:20b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49ce5808d4dmr147334595e9.7.1788422383246;
        Thu, 03 Sep 2026 00:59:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
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
Subject: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:59:38 +0200
Message-ID: <20260903075940.2089367-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005945_690526_F1B96386 
X-CRM114-Status: GOOD (  23.61  )
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


