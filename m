Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCE1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGPo16mSphfxbc3aNmKamBwbL4h4Z65tWk3KvEu3074=; b=2Du/bL9nyH+Id9uotD4Nkn1Us9
	UiwiDVwCQc6u+h+NvZgwf0z/Ofy7KMrheJKGRAkXXoyCYbCqSmMyVcI8xz7giv+D7AjmSYqX8eLRq
	J6qwuKzzNvqRgswRCISowcGy08zPlYQ0YIO3/Y3aEw768CY3E3NxsDLCcYQvIv28w6T9Ae54fqSJz
	kQVvjqO3M9pCw22KNQsN8g/dUmPv4xOu3gtLhfexGmGZXTBgudpRg2s90y/OYr+2Rz/UiMaEtdXbG
	yB3HyfB6C79bidV1lSMwo/ovsaYcIQzTe3PADno3yGDc0E62YtcuiD/d+PfcAOytXbBqFP0Qmkbh4
	FlxxSMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqO-0000000BlIt-10Fg;
	Wed, 23 Apr 2025 19:33:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fcI-0000000BiQx-17Be
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:18:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224019ad9edso2562625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435922; x=1746040722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGPo16mSphfxbc3aNmKamBwbL4h4Z65tWk3KvEu3074=;
        b=XB3nGsbtUu/mf6nYJPIr9jEnQsuMwWmY/cefdNNwCo+H/6KsFN1cY7WahnCpbGTa5a
         GmJXbg7ncaIzLMmNW08DJJabq+NkwaIIafJO8xnlUA0jpZ7JYBU4DD2NoN3LD6UJnqRm
         rJ9gcGM1FW5GLfLPlpgl7PNyqeVGz55b54Zb0TPreW/ssIXdfh6GMQkoBIH/cGiAJHj7
         Cujyfd87PXFMVpGgcZD12zg7SXFpLH96tjEOjscR6+XXn9AU2i5ZwKKAp50U/qXIW+wW
         ctZzfpUIaf+SogOVfen+JMauX/e+ucgrgnL9R97j8wvHMT19WZJFEnDHmatt7TDcDmbu
         fiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435922; x=1746040722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGPo16mSphfxbc3aNmKamBwbL4h4Z65tWk3KvEu3074=;
        b=K7B52OTKZ67KojH+t7paTl+0Hi+rz5ce1Swcyx2zM2rmJ85pgCT0teE+LN9jwya1mS
         Go4mbGaMTwvdOD5cSQWPzueXXakkfwRxGoCDzMTGM0qVzGARnIxRungT2fwXZVeWCCip
         lOUqUL+Ev5RujvQKcmZg4eDtmxNqmjRhyFEYdg6Pkt/qfOGv6Sz4Hk2z/bG+R5f0X8Ko
         faZuUiqaKKWs0ANS8ELQU9HjahUcTzLfuYd1tMjE89wtdFkVr7hmR110tON5cnw96gRs
         hFWW43CG2IWJ6UkiL4nd77eqksynY6op2Es/0bpcrgI/+F8VH/ijJCwDRce0CqM0z350
         ojHw==
X-Forwarded-Encrypted: i=1; AJvYcCWJF2X2nvHZr3GMr27pLof4YWzT+TQlHr9vphKn1tsHJnxk7k7m0KEehXGF355nC2dBskE15xJiYGrBGG+GNL1N@lists.infradead.org
X-Gm-Message-State: AOJu0YxYlUnOSAcL3+o8qPfiNZEPGvHGnhvMeGiK2A6cOvgZfoo1KwLV
	5WdTH2jpAAWFRyGb0w2dHpidmHLfg0XHtPPybCkNF4qK3Zz9UmKO
X-Gm-Gg: ASbGncs3U2Hujou/QYGyXGJDbEns8bSNLl0evTm7SNhbDBWVl9gyMa2WPqIFrr4TPuX
	9qRnyg+IhLP07ovkZBXL044Kd2IwQzNyQglltgONYAxjm9WDbFQARJQdVtAq09lQmkhu59wdf5/
	myg6HszxAMIET3QIMS43yUG0z3pIt6O6wIBfv252cENb+bTbtNAJtqSThf0C/l2uFpxh/IQQ6el
	JFehRAH4klJYZrqVnQdJwCVqN5hjKwCJFgzsCSH04cAr5jDgvrxCf6m/fx6WMVJoYvDQfKBcrgu
	JltZRlGNZeJkdEys6ONns6Lx3OlcGmBTehf53RXMuyDgWbbpcdD8
X-Google-Smtp-Source: AGHT+IFEvoxvIVnkqXQwSw6RMLr+CI8H7rnlskB3ZOddu5ASGlBOyFVAWwonlx4hYUUL7O+wc3NSrA==
X-Received: by 2002:a17:903:904:b0:227:e74a:a057 with SMTP id d9443c01a7336-22db1b3fe85mr9138715ad.44.1745435921710;
        Wed, 23 Apr 2025 12:18:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:41 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:32 +0400
Subject: [PATCH 2/3] soc: Add VIA/WonderMedia SoC identification driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=6371;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DsaNBg7kkCyMfyjSK+lMewVbgSsJc/88OwBkVoIMDfM=;
 b=DE0AJQzoN3d0lr5J/TlpMJOJnWCf/lankDlc7MJI71gwaU5NW4o0GUBO3lv74bEUeN0M1dmR2
 hfmZhBD39pkC2noUGj7WdwEuOuYaF9FVPF5MqEpEICR1YrVcZpTDg2N
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_121842_326129_E155EAA5 
X-CRM114-Status: GOOD (  21.24  )
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
 drivers/soc/vt8500/wmt-socinfo.c | 121 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 145 insertions(+)

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
index 0000000000000000000000000000000000000000..81dd6f722ede35150289a0d87cf09b95d9446948
--- /dev/null
+++ b/drivers/soc/vt8500/wmt-socinfo.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Alexey Charkov <alchark@gmail.com>
+ * Based on aspeed-socinfo.c
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+static struct {
+	const char *name;
+	const unsigned long id;
+} const chip_id_table[] = {
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
+static const char *sccid_to_name(unsigned long sccid)
+{
+	unsigned long id = sccid >> 16;
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
+static const char *sccid_to_rev(unsigned long sccid)
+{
+	char letter, digit;
+
+	letter = (sccid >> 8) & 0xf;
+	letter = (letter - 1) + 'A';
+
+	digit = sccid & 0xff;
+	digit = (digit - 1) + '0';
+
+	return kasprintf(GFP_KERNEL, "%c%c", letter, digit);
+}
+
+static int __init wmt_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	struct device_node *np;
+	void __iomem *reg;
+	unsigned long sccid;
+	const char *machine = NULL;
+
+	np = of_find_compatible_node(NULL, NULL, "via,scc-id");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	reg = of_iomap(np, 0);
+	if (!reg) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+	sccid = readl(reg);
+	iounmap(reg);
+
+	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENODEV;
+
+	/*
+	 * Machine: VIA APC Rock
+	 * Family: WM8850
+	 * Revision: A2
+	 * SoC ID: raw silicon revision id (0x34810103)
+	 */
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->family = sccid_to_name(sccid);
+	attrs->revision = sccid_to_rev(sccid);
+	attrs->soc_id = kasprintf(GFP_KERNEL, "%08lx", sccid);
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->machine);
+		kfree(attrs->soc_id);
+		kfree(attrs->revision);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("VIA/WonderMedia %s rev %s (%s)\n",
+			attrs->family,
+			attrs->revision,
+			attrs->soc_id);
+
+	return 0;
+}
+early_initcall(wmt_socinfo_init);

-- 
2.49.0


