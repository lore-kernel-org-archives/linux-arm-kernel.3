Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FEC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=; b=lqQuCwrT73GUZJKY3Z6FUBAmFg
	xdxe9TRUlebdq0CxuHSLPHSsfIEiL0AzVaseCBmQDIPse6BQokTgGoe1fO0kFq8Ml37V0R9wBxJPA
	SONY0ycxUUk6XxSlKdCair/ENR6rdsGL9llHq9H9Jbavkb3Bc3Qtl/IvZKLIRNada4a3V6lbmhRzb
	ljvdWa6rgU0Hwtt4XQMZw2306urWq76PfSdCSLkE09n0cNP30B2P3PU5QbAM8TR+CdFnzNMWvgMxN
	oeDoaUEDt6WUzE3798jTRTZyS8Q5rTEUaGtKhYYyacYvMA48j3YHIk63KkdtcIEvyM5Tj9+8EyZke
	rXGaMcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAH-00000005ZMe-0iF7;
	Tue, 15 Sep 2026 08:05:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAC-00000005ZKF-06qD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=; b=XEL4FfovxyhLvYC0kQz8VYJDXn
	3IfSJ3xbwAQ9KoVT611JfEsuptTshoWrpAF085biQklWlQJPWy+4r7IXZ8ZLFNhisqnsM1ktB0U/N
	wmY5BbOGmZa2+hk3dk6QZnsj4QuN9cxVluGD627SsJov1zbiyREseV3w5lKZr0k8I9mkva6FsWP9W
	+v7yB3sIjPwSJzmsh5yakAtjpOaEwjpRWpw1aeR0zALSOd2NMxi9KPueIhNqzgJtDSfPTiTivRWLY
	8HLTmd2r6+vjS/KEX639MEfpAjMuLTFMLVi8Pvr5vqgvhko/UN3dkykczya727IG59fTp2WfT7jON
	bb9QgakQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OA8-00000006PQf-0RfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:05:10 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so10791f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459506; x=1790064306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=RGwnQk+utUXpM6j+CZZhIAmG6U3vMVEtvj4gKzo0VTtsUoWYub1WHffA6v5wkLzyTp
         bM0RZ9KLlFPwWHD85t8LW2LxFAHpOBE5Hi1u0kGz7phz6BKXK1wB9GeFwvhdUhmz9ND4
         5scBaVJTUaXRQ4nQngqlhzc1/JKcqd3/MXabrEKuwj8oqBgalMa0WNZs193Xcw9utDkh
         rtGSX0h0Yiaf3lRlAF9s/z48m4wlJYYq13COA5vEgh45XJhdwKNHxhhVNnsjBcYUEa0t
         D+s0zmAyRbNGuqNyE6tHk4xcXZWSBqJmoabnt3v67H+yzrvxLPcDEy5ervWs1vD27IjJ
         iShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459506; x=1790064306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=ECo+NHI+8yyhFFulLjO87GvWPAsiya7dn5Y70BJkC2ny8d1GFo9lhtIwqD5O9DpCIV
         MBQSLpmIofRTuHJ4D+VbxH1AcIYFDiGT73C4XPSN6wn4MNhueRooL5P4n1otpjQopWRk
         vfPrvbsHTQeTZE7ezg1R6DWP5VWyUKL+hl8fjNimVrD56N3dAK6JzLkhoyfXNE2m1Z2o
         /k8yhtXHf0H+6KTbWMDeH2+qDj/j+JK/RC58E2g8RGpKMJuwoOBBM4lwnu50+mK33xBE
         CkYQAE4+tqoKU52c+pnKNR7nkYt2Ule1sztBh0Tz7kmxdzNbOOTQDOBCReFqZ69s98I3
         glkw==
X-Forwarded-Encrypted: i=1; AKwUvBxwzX7kTkkQHJGvX9voBo/fPLCI5gPgPly5zdOHdzQhVR89LCZA56pEBPv9hhFaC1934Nx4+RQKckElNvkm2tff@lists.infradead.org
X-Gm-Message-State: AFuF++mawZraGCfKo8EwEXPBa6RyOupl7x1QxH2W/FajioFJk5aqyEwR
	ablxyblyKJRiUaLiGRYQfCQm9uAuNsCoikpG8B1OVOt0m0fE4cB13krs
X-Gm-Gg: AYBFou0UdZiuaaHUxZGg1puQexBIPiti+FkCPzkfk3QqlzxT5Y3iaKUeGtDd+AmK0RV
	wGRGaHZix4a68df+fPRk/hbbYr/bcShiz9Lr4n+onrh9n64zFImnRpAOTq2E8UCREvHLweH0oC7
	czqCRoptpxNmrarj0GMPfMqIJEqUjKHIaFMCgKc+YrzuRG1VEbnpI9Y15LTEMmThpAj22ghjFXc
	qA6yMWKs4AEiCRoGxpwD9Rbjds7M6Ys0Cq8PksSiCELS2MJTg6zV4XpkypRfo9q8mXa+cxTBwby
	T3SHYdiZ/CBVq8OIDti/8gZivG68p8NYr/rke6cs24RnRnvFg0k5SAgOILtsBU6dpQLu0V/zSLh
	8Xj4gkzSCahSx6Z+4mRq/ur37xY5yn4XoLkBj50Nis6IuVT+s+kBthAB3AU1G5m6+KHQVV+KFIX
	4MagtasIpXmae1ThoHvO/XU6Xqo3dV2jQpW1yynUfqSJWm2TOulKWsPz6m8qrDzS8GmPiko2uwE
	teMNJ6tfjTWnU8=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr1619135e9.2.1789459505886;
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 2/4] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Tue, 15 Sep 2026 10:04:59 +0200
Message-ID: <20260915080501.329424-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090508_458256_79750663 
X-CRM114-Status: GOOD (  23.73  )
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
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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
2.55.0


