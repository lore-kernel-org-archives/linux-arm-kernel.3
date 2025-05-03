Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41676C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqT9icyH5L3HVEZ++wzzfeTDQafQM9FU6JdKrhZWgZg=; b=UfB/w8GI24SmnspQVSwm472Hqc
	0lFFXXqH19JR0Aldg5pQ1b3doQNLZp3OMO0aCQ2Hoe6PLALliEbX/+YvoMo7eizxB2l1YPGi2/lPK
	LzC9Dr2WxJdCx48hyMGIR88gXKcfTv11IUC2cK74qqZ1qdsFdsK0nTVLdrSq4awSJh5A8lSjqe8Sq
	b2Nj75hMcgvBkjkm5jNx3HEKzf87yvm2qNhpGHT90QXb4fijdjrJretw+zWGx6nFdj7ZXR/LPuBZB
	abhEI4tO7McmZ6drBpJqrld7vsZdmLSxfkUA3eVl+cEZQZX79IEAm2e+KWQG6vYeU16tvQe5Qbz2x
	ZSaJ7rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBVr-00000003qFs-1TlO;
	Sat, 03 May 2025 11:58:35 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBQM-00000003pfX-0BnL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:52:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so3922381a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273173; x=1746877973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqT9icyH5L3HVEZ++wzzfeTDQafQM9FU6JdKrhZWgZg=;
        b=iFUUbIcNRZHSRPJg6d6wU0yy4rviOQ95JG36UP9bW+y4W61HsWlhXN2Lbv9l2Qub6k
         Ci78jFWyhs8BCsFXXdxNxazEwNpBBpIHxnhB+2NEZrl0hFNCaP9hMOBBAdty2uoLEQt7
         Su54QB5VHAchDvu+Q/x19cFwtvsOaAljCrNVp6NbQHJC+/zF7Lp3ef1JGnEoD5ymfF/9
         kP6u40SjXHh3dHQvibVn7EOj4x5iE3SaJSoEYF4mOZPrYwoijS6sp7KGBM8msVtGglFb
         dwG3OCPfb8wfy305xZbGgMQoSGm9cbr/anNhtxLh65O19f7E5uXAjVtKFJYK9Ous/Fma
         eo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273173; x=1746877973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqT9icyH5L3HVEZ++wzzfeTDQafQM9FU6JdKrhZWgZg=;
        b=hKm1DoZCIYmOuH6ZOW+6smhzOXmBi1fiYYNM434I9aATTBLuJXGPDZycRVlkNVSDkT
         tD+S0mXF3olBO4fwcR1DIe7aUyo89C0jvUQl/6fvgxXc2juJYgTv8ZJcBN1spQgZLo3e
         BFkraXpdC4ERdKtvYjCecU1mJ2Wo5oh8u3z3eNXO0d4QuDutW54YofoiyziYZKCWnPA+
         wxqYEV5sKr/GoMQ1qcEPQP0tAtwMVc3d+ogQtewbRBQO70DzGpdbAyxT27KtusYMehQd
         BdrX4WToQZ8Lkr499UOGmrz8rpjxWU0Pd0KmWRoEq7DcfKClupCIbHKr5H3OxiVHfGwY
         2X8g==
X-Forwarded-Encrypted: i=1; AJvYcCXWm7TQ17Yv6jKUVWcuMdAnnGXlJJBasZPg9YnHOTM9T9D3Ka7YkGUv+mjAAJOQWfNYRpmo0wkh4260n9O+7VQZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw88K04jdO8WqGaCzXTmbfi3TCog3e7x7em8DVqAbphobDA5EWQ
	z0Z0DsGJZVR91e2tJgD93G+3nUNNT/587SV+vhXYg/Vs5WjD3wMa
X-Gm-Gg: ASbGncuRWn7ZTXF1M/7PErIqsbmxcbaNYDfxrqrM3YAt4hd8IMfgd7BUDoeI6+liV38
	mS5Q9ZuTzjhVdSuD5VbbxHfpB5bui6gjAWMFQoZUBSaXf9oFb2Q8ex5pl3pnnQ0feZS93NJoVeX
	upHhM3/NQ8dJ4NgnSjShmfqPx0IqR1uYwsQ++nA0gsqcQTz4hsLz0/bO6rFtcHYLlnB/l+ifkZF
	AU1wIThJIsVZbe3JU9yXYCdJiRb+b8yuOGQ8sDETLBGIptvezMuOehn0fIMn7zn8P6wli6umwX2
	VRE5rxm8PM+cyNII/+Zh3CmV8Y70wXi1z8g39zNgIYpjNv/BnY3g
X-Google-Smtp-Source: AGHT+IHQhvoRErDN2QCfzbLkAlmsUP77fmt4s0T6uEiLCc40SI8a0i7UcGlUXSUwhazGx7urCpWHGA==
X-Received: by 2002:a17:90b:2550:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30a619a1991mr1084307a91.21.1746273173005;
        Sat, 03 May 2025 04:52:53 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:52 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:32 +0400
Subject: [PATCH v3 2/3] soc: Add VIA/WonderMedia SoC identification driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=6618;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2eWns/mvd2DOjO4WQsDwacWvY07f8ZzkBblZGzu9jjc=;
 b=je2W2HPA4ou65jbIZvmq1kg8oZAW69kfNCMzwVGRXD7ac4c2cPuIJOyp+RC7+uaGoBK+llxSZ
 KfinPCF0hlnBh2j9ig/N/l5fzhHZaJD3vbjo4vUdxpyCnfYqYjWaDr+
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_045254_078528_73F3F968 
X-CRM114-Status: GOOD (  23.72  )
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

Add a small SOC bus driver to parse the chip ID and revision made
available on VIA/WonderMedia SoCs via their system configuration
controller's SCC_ID register.

This is intended to select appropriate sets of on-chip device quirks
at runtime, as it has been found that even within the same SoC
version there can be register-incompatible differences, such as
with the SDMMC controller on WM8505 rev. A0-A1 vs. rev. A2.

The list of SoC versions is compiled from various vendor source dumps
and not all of them have corresponding mainline driver support.
Some of them also have been seen with varying on-chip markings while
sharing the same hardware chip ID's (as is the case with e.g. WM8850
vs. WM8950). In such cases the selection of names to use here among
those seen in various source dumps and chip markings was arbitrary.

Suggested by Krzysztof at [1] - thanks a lot!

[1] https://lore.kernel.org/all/14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org/

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/vt8500/Kconfig       |  20 +++++++
 drivers/soc/vt8500/Makefile      |   2 +
 drivers/soc/vt8500/wmt-socinfo.c | 125 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 149 insertions(+)

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b96cd29d56343b338a423140b89896..37ca3f094f8994c7e9c7c99c3ba47d168d41ce30 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -28,6 +28,7 @@ source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
+source "drivers/soc/vt8500/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb2898659a434803dcdfa2d95b1dbd6..777255401252eab554f56bded7ff8ea5611704bf 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -34,4 +34,5 @@ obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
+obj-y				+= vt8500/
 obj-y				+= xilinx/
diff --git a/drivers/soc/vt8500/Kconfig b/drivers/soc/vt8500/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..2b2350678c3f70297c51f94eb77674c01be773d8
--- /dev/null
+++ b/drivers/soc/vt8500/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_VT8500 || COMPILE_TEST
+
+menu "VIA/WonderMedia SoC drivers"
+
+config WMT_SOCINFO
+	bool "VIA/WonderMedia SoC Information driver"
+	default ARCH_VT8500
+	select SOC_BUS
+	default ARCH_VT8500
+	help
+	  Say yes to support decoding of VIA/WonderMedia system configuration
+	  register information. This currently includes just the chip ID register
+	  which helps identify the exact hardware revision of the SoC the kernel
+	  is running on (to know if any revision-specific quirks are required)
+
+endmenu
+
+endif
diff --git a/drivers/soc/vt8500/Makefile b/drivers/soc/vt8500/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..05964c5f2890989c1d794af4f5af10f849a497bc
--- /dev/null
+++ b/drivers/soc/vt8500/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_WMT_SOCINFO)	+= wmt-socinfo.o
diff --git a/drivers/soc/vt8500/wmt-socinfo.c b/drivers/soc/vt8500/wmt-socinfo.c
new file mode 100644
index 0000000000000000000000000000000000000000..461f8c1ae56ee367dc2c84a58ff8fada0dfdaed0
--- /dev/null
+++ b/drivers/soc/vt8500/wmt-socinfo.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Alexey Charkov <alchark@gmail.com>
+ * Based on aspeed-socinfo.c
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+static const struct {
+	const char *name;
+	const u32 id;
+} chip_id_table[] = {
+	/* VIA */
+	{ "VT8420", 0x3300 },
+	{ "VT8430", 0x3357 },
+	{ "VT8500", 0x3400 },
+
+	/* WonderMedia */
+	{ "WM8425", 0x3429 },
+	{ "WM8435", 0x3437 },
+	{ "WM8440", 0x3451 },
+	{ "WM8505", 0x3426 },
+	{ "WM8650", 0x3465 },
+	{ "WM8750", 0x3445 },
+	{ "WM8850", 0x3481 },
+	{ "WM8880", 0x3498 },
+};
+
+static const char *sccid_to_name(u32 sccid)
+{
+	u32 id = sccid >> 16;
+	unsigned int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(chip_id_table) ; ++i) {
+		if (chip_id_table[i].id == id)
+			return chip_id_table[i].name;
+	}
+
+	return "Unknown";
+}
+
+static int wmt_socinfo_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	char letter, digit;
+	void __iomem *reg;
+	u32 sccid;
+
+	reg = devm_of_iomap(&pdev->dev, np, 0, NULL);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	sccid = readl(reg);
+
+	attrs = devm_kzalloc(&pdev->dev, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	/*
+	 * Machine: VIA APC Rock
+	 * Family: WM8850
+	 * Revision: A2
+	 * SoC ID: raw silicon revision id (34810103 in hexadecimal)
+	 */
+
+	attrs->family = sccid_to_name(sccid);
+
+	letter = (sccid >> 8) & 0xf;
+	letter = (letter - 1) + 'A';
+	digit = sccid & 0xff;
+	digit = (digit - 1) + '0';
+	attrs->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					 "%c%c", letter, digit);
+
+	attrs->soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%08x", sccid);
+
+	if (!attrs->revision || !attrs->soc_id)
+		return -ENOMEM;
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	dev_info(&pdev->dev,
+		 "VIA/WonderMedia %s rev %s (%s)\n",
+		 attrs->family,
+		 attrs->revision,
+		 attrs->soc_id);
+
+	platform_set_drvdata(pdev, soc_dev);
+	return 0;
+}
+
+static void wmt_socinfo_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
+
+	soc_device_unregister(soc_dev);
+}
+
+static const struct of_device_id wmt_socinfo_ids[] = {
+	{ .compatible = "via,vt8500-scc-id" },
+	{ /* Sentinel */ },
+};
+
+static struct platform_driver wmt_socinfo = {
+	.probe = wmt_socinfo_probe,
+	.remove = wmt_socinfo_remove,
+	.driver = {
+		.name = "wmt-socinfo",
+		.of_match_table = wmt_socinfo_ids,
+	},
+};
+module_platform_driver(wmt_socinfo);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("VIA/WonderMedia socinfo driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0


