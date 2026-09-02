Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32294C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=; b=XV6aeDEEhon0GrmJCHRG90nAEZ
	WtGBr4hnexT4TUOXq6pzsQdSGOpJkJVdFIJ7TzPCysPfqR5jBNQjuxU0BiQAK9e7jqk7DTql4biDZ
	kdlaylVfXeVQV5PHM1cRjihQ8h4OgirVWWEMz5XTJQ5sY2zLOCIVoy4i3JuoAkRBaC3xyE02JdosQ
	CoCchJwufUU3lpUuK6wk4gAuAIG5vJjuGYltohxMGg8/crSmFA0bjpIpKnlDCdC+VdCT57Y9m5wv1
	6cHwi46py5me7zLybMVmIl0kpvA9JdcUPkbdE2aR8y3KV+qk1qlGOhPhV7kXpRs/y37FM/GHymKQG
	1ystTOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO7-0000000Dr3D-1Pbr;
	Wed, 02 Sep 2026 06:23:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO5-0000000Dr2C-1QXz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:23:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5012185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330235; x=1788935035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=AkpxvmwVkzKcYzzCthfNNemVhzq+iRECcsOFxqHU8ZrP0RhTGRcdKbnDZqJ7c8z2Xm
         q+mpVoqoeHEnlXYXk6vKuulXMUQB7MgIRbuFmBcOkHPo/6Pp89lPQ9ktk2j2cQIkq3Nk
         GbpyAby+u/ERX5IpfXaWbPPztavR4/P3dzygWvJEpfvCI/8s9TowAqn3S+yQO6DdkbXU
         5NMfsTtkElj7KeeCy7rgyjvOobCqaTl+4QMMWUmiME2shjvwN/8dWvaVOsw2jPTpCtlV
         jsHkhhrgm8z6d4r8zvmIHwg6//q8okIQYqKGyNws2MaaTJMROY3BbQVQH63LzVLdjWo8
         UT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330235; x=1788935035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=XCN1ZHPryKCgvp1l6eT2QwzWvcnHMFGfmsgsiRBkiM4Q9yBrfOkvD1ZajbGiv2U2LA
         dTCvRHUDPq2IAaBeOuvp3l+aQrm3BM/Vbv4cz+tmMymvgqcqLWWuEwObHvBMLs0sVNs2
         A8qPeKtsLlEiXNGFCtocUPfsuuL3IOrOj2Q5rSvJTiSvpHUYUOC0ZWfn67BPBH/VtN0P
         7YMG7E9Y63kLFpMmu3moKbtt6iKOTMxbY0Cj9/tQdMXWT64Y8CEum8Ta27AbdLMfzeqx
         76G+9P+I0O/3JF6Q3Te+m0Q67vubZyLCGE1V50eBqThodWSpV1cfb5ZgkgoBf6w1Mbp4
         8NOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+JrxtSbDqaUq8pzTxWhqGhTxUUA9pnuBnXc/xQdP2EMZm1KUnrKGotZR9iZ6xeoYj91rVLxL/1JJLjgOuoYh0@lists.infradead.org
X-Gm-Message-State: AFuF++lzGC8Pc2dx66osePpQcawG5oBL/2CUPUOn93ED0kjT6hYODE3j
	MCczDC2E+KpGmnZ1vxl877qxD3TKSU4JwuYhM+0oHgQXCN9p0mjr5MEG
X-Gm-Gg: AR+sD11TWoAtfwLogQ0yzqM2g3M9IW1KV/ucIWAkmSESELLlRMWIQ8OySgtAe+IlruK
	2QRxFGUZlNmPK0LpUQhiydg9NaY0FjwJisE+Bg6sapkDVVWJSKwCv7NDZtLOcHcJj9IQGXEyNqP
	MasqaxP2VdrH2a9QI7j5NZxZDnTel5HBVV87io1+oeRdhOUsbb5XZPEKwAcqGEeR/fFkLyFAEfo
	HuSQ0LXEQdNS9tSIg2SSRzf94NNzuojc0EXWDJoCYIO8HavuZfgY/vtadPcO63f5L1OPBsbtfBB
	hjdu4eGlLpz3bKHhwNLFVmMBuEVXx5nlSYqg37Wm66G2lIJxpqn8rnG1MqJtjP+FDj28208nxH1
	8r7U3pIun/tJgfQMan6CG7fLuehXzql2Q+gguTeQ8AyKuJwYthQp7dI/DsVElXobxVAEXTBo37x
	iVRFoOqqjazjIk2vKlSBSw+FoyI5yJQUQlgUwFdTd1yBllkvKLqikb+jiIjPQyWSqeQl8=
X-Received: by 2002:a05:600c:4592:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49ce558ff08mr36761315e9.0.1788330235172;
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
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
Subject: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:23:51 +0200
Message-ID: <20260902062352.3600368-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_232357_519953_47359BCB 
X-CRM114-Status: GOOD (  22.23  )
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
next patch) expect. Pins the device tree never configured have no
register offset and get -ENOTSUPP, without the error message meant for
configuration attempts. Other parameters keep the historic raw-register
behaviour, which the debugfs dump still relies on.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..5da1a76b0141 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -297,6 +298,35 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask = 0;
+	u32 raw;
+
+	/*
+	 * Only OUTPUT_ENABLE/INPUT_ENABLE are decoded, and only when the SoC
+	 * declares the bits. Everything else still returns the raw conf
+	 * register, the debugfs dump depends on it.
+	 */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		break;
+	}
+
+	if (mask) {
+		/* pin not configured, nothing to report */
+		if (pin_reg->conf_reg == -1)
+			return -ENOTSUPP;
+
+		raw = readl(ipctl->base + pin_reg->conf_reg);
+		*config = pinconf_to_config_packed(param, !!(raw & mask));
+		return 0;
+	}
 
 	if (pin_reg->conf_reg == -1) {
 		dev_err(ipctl->dev, "Pin(%s) does not support config function\n",
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


