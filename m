Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtdkWnLr/kObxk9d1OZrWr4jX4hdZNVEJy/OpGU79kA=; b=Gd1r52EVcEPMwgiQj+p4wMOFb6
	C0iNOrrUIefSvq2Fz9Fq5jdGdMM0vT0tcDtGUZKLe1RgTpTQRy4DQrkxSR4/nQFi3sjeiVyhkbMTg
	roHsD00WW24K0mVkhb+0y5xoFZdlJRMd9hqM+/y/SlJfaD+IHRy5KUELPyrsmPNMyPxRlLRvRUbo8
	C0FUCsIAdcVnMtUvfyzbu4GfdUdZW650IPOqIKs12RQB521+sswssuC2LmeFuDBB7SQxMnJ4KWEja
	RrQiigiYWcPEV+fGXCfZil7ogkKF1btWBvld1V7T6FNttHb1IhlqoYSw+Zy60W9LGe0zRHCgIpisY
	u7xoo8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKx7-00000006l9G-0jZR;
	Wed, 08 Jan 2025 01:33:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsQ-00000006jzx-1wcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:28:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2161eb94cceso168844895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299733; x=1736904533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtdkWnLr/kObxk9d1OZrWr4jX4hdZNVEJy/OpGU79kA=;
        b=nMHNpxJh0J74eINzQZ4QRLv2zB3GG5WxruJ3O/ud2TK53OuQLeO/CrW39QZ7R/q0QI
         h4WgF7mU5Ud9I5mSOYh1lyYkg7kXm+bjTotjb8QkdjJYGSCzg8fXqxbsoLnENHPV6xe6
         igoyu+UI2/nkbVAVKsdyvQNs3LVfBLZASDyfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299733; x=1736904533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtdkWnLr/kObxk9d1OZrWr4jX4hdZNVEJy/OpGU79kA=;
        b=vCAxDzJlp8zutyq4gMaPPb9a16oAFRzBYgwIy+o1G00H+5SQDwBUD3NYWeTPd5fRUJ
         8jBQk7ydFDe0Xvxlo6mArjffZrxJLaazvKtWnS+c4ss0hleT3UxorDzoJhyQYF+UAzG7
         VdaXWDeD63UdNY9Hw2T9qzoUgb+gx1Y8Rby/pa3msViOmqOHDwSfIYRuv2rwJuO3pGKy
         lMgCsE8rj4haFEOKJCzhtiZa6CR7CPb6ydCxdFwzp6e7kOu2ch10CxX7s+FqJ9ev5uov
         b6QY3iFI6yx5iOBZBL9bGwTthf7VDcQCK84epVHo6RE8aj2oHVTxa2gvF6qBw+PIp7pb
         +R+w==
X-Forwarded-Encrypted: i=1; AJvYcCUu5jKxxkJAhYYcL+aWGZe2Te6kjKbN96Iucqft5dLm10EbNyd+ATjEnJa/73bPX1EvhbgC/nfixCCYR4uFsPgv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LiZ8a4PWBlBqSXK3C7J4NMOXj/CbrTEEHPOxgi26h/iPBayn
	DVagdq1fa7SnXl9901GwwwXpRms+Ygr1gV9Qpmjg+wmtHcCOmLE+rj/vCsPJWA==
X-Gm-Gg: ASbGncu5a8juH0GtRWJZjabs46yjgkar2MFpqxCoOBzp/dGC4Be78CJ6oaR9WLwBWzC
	9EetZ5ylMBDChnwbe7rmd7IkpXzu1HcCxBp3JDF99Uyo+CmVzplD6ds3fwn/ew1seOrSTRfxr/k
	fpE8gzTH/+Oh9bnhj2ZjDVP6lgQ45yAUBPxDiDQ7bUbKCCq/1wL2RA45l8oDwgR+4GQ4A56euYb
	2HJyBHyZrB7oKY/iua0Q5hHYGye0Mh9PefjYkQFBbptaPHizXCGPvFEpbq70PKY2cW1A6cTuSMU
	84ifpEYnmsHlFeZ6Z/Xy
X-Google-Smtp-Source: AGHT+IHT5knJwT6WWg3ma5G8rT/UQQorba0QpRS5VpGWB4gpjmUniZb797RHNFR9BYNyRf9SZQjl8w==
X-Received: by 2002:a05:6a21:339b:b0:1e0:c432:32fe with SMTP id adf61e73a8af0-1e88cff3d1amr1835597637.26.1736299733617;
        Tue, 07 Jan 2025 17:28:53 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad834cecsm33982127b3a.70.2025.01.07.17.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:53 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 3/6] bus: Add basic sc7180 bus driver
Date: Tue,  7 Jan 2025 17:28:40 -0800
Message-ID: <20250108012846.3275443-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172854_503466_48A7F0E7 
X-CRM114-Status: GOOD (  20.68  )
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

Add a bus driver that does nothing besides populate devices as a child
of the soc device.

Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/bus/Kconfig            |  3 ++
 drivers/bus/Makefile           |  3 ++
 drivers/bus/qcom/Kconfig       | 16 +++++++++++
 drivers/bus/qcom/Makefile      |  3 ++
 drivers/bus/qcom/qcom-sc7180.c | 51 ++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 drivers/bus/qcom/Kconfig
 create mode 100644 drivers/bus/qcom/Makefile
 create mode 100644 drivers/bus/qcom/qcom-sc7180.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 7c2aa1350578..69963f0f02f3 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -284,6 +284,9 @@ config OF_SIMPLE_BUS
 	  symbol if ALLOW_SIMPLE_BUS_OVERRIDE is set and there isn't another
 	  driver for the simple-bus compatible.
 
+# SoC specific drivers
+source "drivers/bus/qcom/Kconfig"
+
 source "drivers/bus/fsl-mc/Kconfig"
 source "drivers/bus/mhi/Kconfig"
 
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index f3968221d704..796dd0515578 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -40,6 +40,9 @@ obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
 
+# SoC specific drivers
+obj-y				+= qcom/
+
 # Must be last for driver registration ordering
 obj-$(CONFIG_OF_SIMPLE_BUS)	+= simple-bus.o
 
diff --git a/drivers/bus/qcom/Kconfig b/drivers/bus/qcom/Kconfig
new file mode 100644
index 000000000000..f4c5d05ec9ca
--- /dev/null
+++ b/drivers/bus/qcom/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menuconfig QCOM_SOC_BUS
+	tristate "Qualcomm SoC Bus Drivers"
+	depends on ARCH_QCOM || COMPILE_TEST
+
+if QCOM_SOC_BUS
+
+config QCOM_SOC_BUS_SC7180
+	tristate "Qualcomm SC7180 SoC Bus"
+	depends on ALLOW_SIMPLE_BUS_OVERRIDE
+	depends on OF_SIMPLE_BUS || !OF_SIMPLE_BUS
+	help
+	  Support for the Qualcomm SC7180 SoC bus.
+
+endif
diff --git a/drivers/bus/qcom/Makefile b/drivers/bus/qcom/Makefile
new file mode 100644
index 000000000000..5d41ad61fead
--- /dev/null
+++ b/drivers/bus/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_SOC_BUS_SC7180)		+= qcom-sc7180.o
diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
new file mode 100644
index 000000000000..a615cf5a2129
--- /dev/null
+++ b/drivers/bus/qcom/qcom-sc7180.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SoC bus driver for Qualcomm SC7180 SoCs
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static int qcom_soc_sc7180_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+
+	return of_platform_populate(np, NULL, NULL, dev);
+}
+
+static const struct of_device_id qcom_soc_sc7180_match[] = {
+	{ .compatible = "qcom,soc-sc7180", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_soc_sc7180_match);
+
+static struct platform_driver qcom_soc_sc7180_driver = {
+	.probe = qcom_soc_sc7180_probe,
+	.driver = {
+		.name = "qcom-soc-sc7180",
+		.of_match_table = qcom_soc_sc7180_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init qcom_soc_sc7180_driver_init(void)
+{
+	return platform_driver_register(&qcom_soc_sc7180_driver);
+}
+/* Register before simple-bus driver. */
+arch_initcall(qcom_soc_sc7180_driver_init);
+
+static void __exit qcom_soc_sc7180_driver_exit(void)
+{
+	platform_driver_unregister(&qcom_soc_sc7180_driver);
+}
+module_exit(qcom_soc_sc7180_driver_exit);
+
+MODULE_DESCRIPTION("Qualcomm SC7180 SoC Driver");
+MODULE_LICENSE("GPL");
-- 
https://chromeos.dev


