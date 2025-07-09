Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50932C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbXL/S0flV/EERwUX8pQUxtS3ncEMTjhJUUaajeXmYg=; b=NEaiQBWp3OGzsmhB2T6ZmXKSwb
	Tb2mPlaCJrLMLm1DAOMFJVr7wAeP57DwxNXDbkczDH7lq6spiXXBoTk+FAgYyYXQ0FXRHI+E+919F
	o7H/8AHP1hfBNpE8KL7+C4/C8dqeEs1r2w2cbMdoInRYep/vEmEg2Up6jkLeWYlnkyclZ4M7yc6+1
	hveAcS1xGCp6hTroCyyukme6LwydbPFnOWo5pBHJxxlc6G6K2lyyeHOfG0k/xIiYfKTIeNf0pmf9b
	xO94L4kdesaGauciz5NQVFmaTMuvaeU0l0a8uj2TDL89zOxzwjGsEO96J2cM+5/n3cRkL7Bm2NTeC
	1I0QLG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZe6J-0000000AExl-0g5t;
	Wed, 09 Jul 2025 23:21:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdzS-0000000AERP-3dZn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:14:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4f379662cso387625f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102853; x=1752707653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbXL/S0flV/EERwUX8pQUxtS3ncEMTjhJUUaajeXmYg=;
        b=K3DWxiN+Sq3P9WP6c3KSP5kHDbTTiozM2IsYGQfBIHLFZ7J362B3+ClWE+B0vVtUuM
         fI8VTGgouImVoeF/8cZ+RZav19k4EdH5a02PY9Gi1yXoNha/r5KR2z9wTC07fGIcdLIE
         GOn67Wqey6Yn7ENv51MV237+IQEGmaf7hA9ZrNHXmmcZMwQb61+Ps/iy9f/uQvREuh2T
         2DVHbwpWI76VQ223Vlr4hYJyFOlVBBrPgr+p55DbE0h3uP/g7TVAah/5KR9IoTZ0d9vN
         FtndOxS+xFEi9nSslyeHClTKRDtLRKMdSZBZ5a2Kv7Lj0Jz4RV8n7Aud01P9Hf5hVzTM
         HkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102853; x=1752707653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbXL/S0flV/EERwUX8pQUxtS3ncEMTjhJUUaajeXmYg=;
        b=MKbwB7+x6/Xz53viUSBFfRh1VtUwwdmechvBZS2+Z7eGTNJ+Cc0PT8iiYrsVS2d8mu
         by2BatBqbva8pUW+nSHwqD2tT8s/hanRfNGe5cbPdvCvPznVbG3CkRVN1hLnrVIt1X5E
         /hq4TMNm09wHD69wItl6s34t8Xta4Eb9ac8OEAtQ2/9k4kD8e2WOMcsaHMXA9cq0BDFk
         iOXL+i8cTWpT1hfss+dDhV8n8bDWfsQfAGGjBcePa00s54+XMtfIUHCgMUHii1V2slXf
         Nv35klMN2+YlvGf3WeJdy/t939zU8g8j+GHYt+HBTO8Z42Gg8TdA54raoW3i1uPVS4YI
         9saA==
X-Forwarded-Encrypted: i=1; AJvYcCVDga9Phw1iXkisYlLMGCn5BCX9XCh8jfqWno3HbXD9ha0srYLqYfklE5wfeJpau8qbywXaqJIBPuBeSC9IQ5BF@lists.infradead.org
X-Gm-Message-State: AOJu0YxWK3AX+gW9uUPWvOpb/klRp1gd2m6XP4mYPhH2FuWeCQb7hHcL
	F7C+5ALwPA5knXiRCmxjgOf1fXf6wS59o67fC/rVoO/IYMo4+63Q0CU41qOk6A==
X-Gm-Gg: ASbGncuxm/NbIeRFFet/f8B8JOzmhYlEd9SBf4eiWTUYe8vh6DkkYYg2VhOwcapHhye
	+UWCEUOunM6SHGEI5T/sSkCvXkZQ5G7IaWoz5bKqsKmjM8kYIUcKrrSAOEw4NMhBamDQmq9KF3d
	Yg4eNia4w55Y0ty6Yz+v9oPx9yL+e0DgtNPbEQHnpzWmyqrOZj/loB6vtEivX+YyYbAG4U5A6e2
	8BaYh6s9LIL8JLdOknbO1GQoUVBpwMrFbRFWijhd8+/U7tszp3atlwcl/STeHRv11qMgo8bSTt8
	UnFK3OoPhZAHMFNHmSmX8KevgfhJwaH5LGgn5kGVy3G5UYqGvKQTRuf2agfJ52+AUwouHxzpdQ5
	oTX/tv76LhNkpCDLqXOVtPJDoR6FL6hiynHHgPPmLFYNel4Chic+c+Q==
X-Google-Smtp-Source: AGHT+IHJeSZcFJN2vEousoLxhSuB/8CQ4ebukITBDnvU7lDlxRGB5m500Ny2GNYptWz7HSlFjF2XYA==
X-Received: by 2002:a05:6000:42c5:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3b5e86d242fmr242863f8f.49.1752102853197;
        Wed, 09 Jul 2025 16:14:13 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1792sm216936f8f.13.2025.07.09.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: tegra: Add p3971-0089+p3834-0008 support
Date: Thu, 10 Jul 2025 01:13:59 +0200
Message-ID: <20250709231401.3767130-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_161414_906365_3C878C5A 
X-CRM114-Status: GOOD (  15.95  )
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

From: Thierry Reding <treding@nvidia.com>

The P3971-0089+P3834-0008 is an engineering reference platform for the
Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |  2 ++
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |  7 +++++
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 30 +++++++++++++++++++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts | 11 +++++++
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi | 14 +++++++++
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |  3 ++
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  4 +++
 7 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 0fbb8a494dba..171e08c94d5a 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -12,6 +12,7 @@ DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
 DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
+DTC_FLAGS_tegra264-p3971-0089+p3834-0008 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -31,3 +32,4 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
+dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p3971-0089+p3834-0008.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
new file mode 100644
index 000000000000..94ace6784749
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3834.dtsi"
+
+/ {
+	compatible = "nvidia,p3834-0008", "nvidia,tegra264";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
new file mode 100644
index 000000000000..06795c82427a
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264.dtsi"
+
+/ {
+	compatible = "nvidia,p3834", "nvidia,tegra264";
+
+	aliases {
+	};
+
+	bus@0 {
+		serial@c4e0000 {
+			status = "okay";
+		};
+
+		serial@c5a0000 {
+			status = "okay";
+		};
+	};
+
+	bus@8100000000 {
+		iommu@5000000 {
+			status = "okay";
+		};
+
+		iommu@6000000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
new file mode 100644
index 000000000000..3a6f4b7e6b75
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+// module files must be included first
+#include "tegra264-p3834-0008.dtsi"
+#include "tegra264-p3971-0089+p3834.dtsi"
+
+/ {
+	model = "NVIDIA P3971-0089+P3834-0008 Engineering Reference Platform";
+	compatible = "nvidia,p3971-0089+p3834-0008", "nvidia,p3834-0008", "nvidia,tegra264";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
new file mode 100644
index 000000000000..46cfa8f1da1c
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3971-0089.dtsi"
+
+/ {
+	aliases {
+		serial0 = &{/bus@0/serial@c4e0000};
+		serial1 = &{/bus@0/serial@c5a0000};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
new file mode 100644
index 000000000000..e8576cf2a0b6
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3971.dtsi"
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
new file mode 100644
index 000000000000..6b6259b7310f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+/ {
+};
-- 
2.50.0


