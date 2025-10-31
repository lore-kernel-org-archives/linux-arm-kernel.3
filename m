Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436ACCCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=660/GUyr8+xiyQEE/ln7pRyZWtVdpwNeVJPsoSzCzFA=; b=fglt4rtLsuGY/1nffLFYTdXjMv
	YxiBChiy5ZrK5Mvf+VAUreYzltnN3aVjr6qQYYd63M5rRd5ZUgzp8btljEWH+5qIpePurAxoHXtt7
	KbaxR/Uos1hd6fNZCUeGxviQkPyrHt+CipdeaO0JyKguSaWZzcWXUp5/vFwAyorX2aLayKNBfZ9SA
	TKxmz03aMk+nS6/312ZuXcfa3O6tldlefN1EzAQo0CcXy5/54FNYb6R+toghQgloXhw2VjLoNfazj
	D35Yetq9cRpZgdZ4yqdyAQQ7EmtVC1knWE+cx8L9kgQRwsmtAGCMqAYiciuXmMUl8+vvTr4/RsMyn
	esn5bVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVR-000000065sT-3H5p;
	Fri, 31 Oct 2025 12:45:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVM-000000065ot-0uJA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:45:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4711b95226dso27866965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914718; x=1762519518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=660/GUyr8+xiyQEE/ln7pRyZWtVdpwNeVJPsoSzCzFA=;
        b=Nifod0CMQP1Z/j8nHWdzODafOACOr2lMHymoTNvlE+i2yMdBq+qAsmX+1KrGubZmTb
         vtVepE7s8hYnRGRz7509jpHTCpgtTjjXpoF3k0MNuPcPLq6CHGOiAl0yVO0qlGu7wl+R
         sVCdVtq/8Ue2G0FGzz8hyrRxkRL3EATes7/B//NRNLoYY84MYnA7y1ZsklpHhW1NDKcI
         r9aEA5oRa1kJHvBXKazBPJ7XOk6LgCwk81hgWKBgmrpysiNt3oT2RkHD7xffjGxYYggX
         BoAeD7EE1bnk0rC4yVxDM4Y9SeODhLDNgR8hbakKVCWo7yu32otCzqKVkt3LKzXvK6dj
         RDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914718; x=1762519518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=660/GUyr8+xiyQEE/ln7pRyZWtVdpwNeVJPsoSzCzFA=;
        b=LaN6wIb1CDEuKOKISIdHe8v8ogyrTIw1HyWusvdYRSkKQXZYtq9tutHWfbwmjG5EOO
         mXUHmcs+aLrRbJnqFOIyXlnkU12ublMK2pphpfY375G6rNQt+v7y6MRMzw4ux8qVfuw7
         ugPVqs8bCBv5Qk4QPoJjk8+EqwBg7qzRphRonhZYTvInFtP0rgoLxDfkeakfMtSZN4+h
         pFtB/00Tczdnd9owuaSYZJzBMw59g+6viejEQtc8k3OUCzeLZN2ewkNJTbW5zsluKbUE
         nZCWsNYenZpJ6NQLbVS544lJoNFbILp/XJIUmJDq+IHEoZXf8n5awP2qma+Z1s9KNwNs
         Jt5w==
X-Forwarded-Encrypted: i=1; AJvYcCUZbpKsGaKy+CNDKKAtv9sHcIBtYDV4yqf40i+XEFzVQJuTQgjTHz5i0pVCSV2UU8EIP8e3XDVcWo1XGoD7/8RF@lists.infradead.org
X-Gm-Message-State: AOJu0YzDw4IRs5IyAm9xE+UkJxzpWZ/hwmw7GYzXnhgdyRJ3zff5qqMj
	hJ1jwzhd5nwtHRQ3C0M6BnkzJ5kAHCnMtaaSgTASDXEkbjrK3l0fYvtHj6Dr3ezFcQc=
X-Gm-Gg: ASbGncviD0Jy2Bb95tnsr0p55XE4p1n9BBQdMxHUtnnTuX1/c6suNeOcQT6eAdZQU14
	440zuMyjuRPd0KkE7MEmt6OOziToZJIk/6uIA/BITT/6gO9brHchstP6JQV5hWvylOsS1UdB+Xl
	sP1ubaJMdi19HGxJn7S6cOynEIQIgQCI/S9gFIXA84qUm2bSvrAPpWO7PTPLqhfczBry4lYEwww
	RJliukthLCk+1aVHhlbFGvfcbUovAtE4yhXYmLcjqfEnuKQvjbNVT3lUJ8rV/j7FOYaj0jWnW1Z
	kTmlr1KsMzU3Esvep2x40hCk8j2raGCaNb0PqBTdIj/9OHsb/sJakxyxUnE/dSc8HxAI4Atxx47
	WxqniVILecGeJBBtzNo0aKBsQIwpNi9fxB/v3Q0Bv8gGhVWNhPc1WTIIdXJqdI/qbFjjTMhSW8E
	pUD4iukFWqNXUeMrBGRibf2VvHOJMTkzcxfA84fQsa5xbz0JUq1I4/2dFy3Uc2vIQ=
X-Google-Smtp-Source: AGHT+IH0gyK0WWDUF75+dz03qe3+Zyttu7Zg0jZFhbcGhaDg57ZydmfAmUHKy/Cjxcmg2bJ8GmNwBw==
X-Received: by 2002:a05:600c:1f0e:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-477305a24bcmr36164165e9.8.1761914718273;
        Fri, 31 Oct 2025 05:45:18 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:10 +0000
Subject: [PATCH 2/5] nvmem: add Samsung Exynos OTP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-2-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=5190;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=w0yfdSTm6gp3caPgxHc/5REqzvFvqbJrg1PSnC6Rs4g=;
 b=YcYEgJptfXhF94yOa4/Ab0f9sCdd4QntT5HeUNYAN73i4zFNGC6vPbnjwfZ9a76WL82ms///n
 VwtDhW+9XjTBzgLFrKzjVbzbdb/axrnQvjUKPYf9zol9IGWEShWS2Mz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_054520_301135_A580FEF6 
X-CRM114-Status: GOOD (  23.35  )
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

Add support for the Samsung Exynos OTP controller. On the Google GS101
SoC, this controller provides 32 Kbit of OTP memory space that can be
read/program/lock using a specific sequence of register accesses.

The OTP controller register space is of interest as well because it
contains dedicated registers for the Product ID and the Chip ID (apart
other things like TMU or ASV info). Register the OTP controller
register space as a nvmem device so that other drivers can access its
contents using nvmem cells.

Support for the OTP memory space can follow and be modeled as a
dedicated nvmem device.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/nvmem/Kconfig      | 10 +++++
 drivers/nvmem/Makefile     |  2 +
 drivers/nvmem/exynos-otp.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e0d88d3199c11a3b71cc274b2114e9554ac486fc..f973e009737f2fbdc8511e50f1aa9e6003286065 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -84,6 +84,16 @@ config NVMEM_BRCM_NVRAM
 	  This driver provides support for Broadcom's NVRAM that can be accessed
 	  using I/O mapping.
 
+config NVMEM_EXYNOS_OTP
+	tristate "Samsung Exynos OTP support"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	help
+	  This driver provides support for the OTP controller found on some
+	  Samsung Exynos SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called exynos-otp.
+
 config NVMEM_IMX_IIM
 	tristate "i.MX IC Identification Module support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 70a4464dcb1e25cf9116280a32f4a0f4f9941a75..920a536fc359a5a7d8f3aabba6a712e85c277ee7 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -20,6 +20,8 @@ obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
 nvmem_brcm_nvram-y			:= brcm_nvram.o
+obj-$(CONFIG_NVMEM_EXYNOS_OTP)		+= nvmem-exynos-otp.o
+nvmem-exynos-otp-y			:= exynos-otp.o
 obj-$(CONFIG_NVMEM_IMX_IIM)		+= nvmem-imx-iim.o
 nvmem-imx-iim-y				:= imx-iim.o
 obj-$(CONFIG_NVMEM_IMX_OCOTP)		+= nvmem-imx-ocotp.o
diff --git a/drivers/nvmem/exynos-otp.c b/drivers/nvmem/exynos-otp.c
new file mode 100644
index 0000000000000000000000000000000000000000..3bff9421e6f2b80a8f20533b490a289687d117e8
--- /dev/null
+++ b/drivers/nvmem/exynos-otp.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung Exynos OTP driver.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mod_devicetable.h>
+
+struct exynos_otp {
+	struct clk *pclk;
+	struct regmap *regmap;
+};
+
+static int exynos_otp_read(void *context, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct exynos_otp *eotp = context;
+
+	return regmap_bulk_read(eotp->regmap, offset, val, bytes / 4);
+}
+
+static struct nvmem_config exynos_otp_nvmem_config = {
+	.name = "exynos-otp-reg",
+	.add_legacy_fixed_of_cells = true,
+	.reg_read = exynos_otp_read,
+	.word_size = 4,
+	.stride = 4,
+};
+
+static int exynos_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_device *nvmem;
+	struct exynos_otp *eotp;
+	struct resource *res;
+	void __iomem *base;
+
+	eotp = devm_kzalloc(dev, sizeof(*eotp), GFP_KERNEL);
+	if (!eotp)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	const struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.use_relaxed_mmio = true,
+		.max_register = (resource_size(res) - reg_config.reg_stride),
+	};
+
+	eotp->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(eotp->regmap))
+		return PTR_ERR(eotp->regmap);
+
+	eotp->pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(eotp->pclk))
+		return dev_err_probe(dev, PTR_ERR(eotp->pclk),
+				     "Could not get pclk\n");
+
+	exynos_otp_nvmem_config.size = resource_size(res);
+	exynos_otp_nvmem_config.dev = dev;
+	exynos_otp_nvmem_config.priv = eotp;
+
+	nvmem = devm_nvmem_register(dev, &exynos_otp_nvmem_config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id exynos_otp_dt_ids[] = {
+	{ .compatible = "google,gs101-otp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_otp_dt_ids);
+
+static struct platform_driver exynos_otp_driver = {
+	.probe	= exynos_otp_probe,
+	.driver = {
+		.name	= "exynos-otp",
+		.of_match_table = exynos_otp_dt_ids,
+	},
+};
+module_platform_driver(exynos_otp_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos OTP driver");
+MODULE_LICENSE("GPL");

-- 
2.51.1.930.gacf6e81ea2-goog


