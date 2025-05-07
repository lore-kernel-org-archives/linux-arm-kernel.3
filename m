Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFD6C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbaHkQtQrQfve1siYsg8GFliEdoPcVYlup1lmgOUvQ0=; b=3Nw8GUez472Y/US/CZoyP9CbK1
	iHsft8XSPkCGjf5/gWJD7FBY/22Co6Ks99ErkJsLl4xUlc1/rl6JgeXNariXhKcOYU6jni6Uu3vME
	DVzaTJKRD04qD3MIVVdISeg7VPGzcx0jd7PVMKm54vWNQXODS9lLhgYxFm1ZuWCmU/9bMARoxfz0i
	BUw1kmP67zpixKvgmds3LPKLRH+VZtVDB90zguDQ4DNjp/DxrxqjxNbWZPNJOv/TZec11uEArI+Pj
	a4pl8AbxFEZCXeVVj4T9MJJNPUOgP9JEmtItR1nkRGmvwlfviPznpvvQdFC9kljNkNeiYzi1x1c09
	LSX1hY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgY1-0000000FwR3-1oiC;
	Wed, 07 May 2025 15:19:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfud-0000000Fok5-2ywS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1203051f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628698; x=1747233498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbaHkQtQrQfve1siYsg8GFliEdoPcVYlup1lmgOUvQ0=;
        b=m+XxQSkri66nirJ+C2UXNriw+dXl993W5XhFct+9ugKZZ9oinpMJX7vwFSW7qbM84b
         COtEESJARj9oKNOEuqnux86DbuVbMlF8F/zuW8HG01sEjBn2W7zS1ez1XF357320QFsh
         Vt1LKjhvwacpHIz4EDAT561mgWuYv8IQZ9yDRekSjX10f4OIuajtWGyBjFPjG2dnwyNp
         BRVAdVRN4+NFo4hZBBY6my9gyTgnUJlRa4mm3qgB92Ijaw+w7y3SGxkxJ6jhnSa/HrFK
         i7xJF4mUqiF//WuHq88ulRO0R6j/lX5dNg8ZGE+wSTnWk9HxxK/ZxgT9TH+3lns/G06E
         Bj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628698; x=1747233498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbaHkQtQrQfve1siYsg8GFliEdoPcVYlup1lmgOUvQ0=;
        b=ogFWIlP46HONfbjrg69oL9vx5nFbt3VLlK2MIjX8sIQUvL+/dEvI7QR2wc0Ii1NGzv
         tbdSREp7M2vGXAHLSn/F0saBJ8FgxCHeTOrzCpWOuXqMA0IL/QhFVdz2VoonYs6DJcf+
         GF6kS8wsg/n2PtU0yqpAsT5H5oNremqsBwIz+b55mz9pvkJg8CHLwxknto+knJz+UYuU
         RjGwDEIaaNZCcd4mdudx2lcgWDn2jZjP9RcwngbjXqsZBDj2fcCHhBENCuSYHfJfYhkT
         GT2S42+hnns8WmWLUA+cP4tBMs9bEL3vk8/vSNnjpca3pUHY96av9vQia7qV2H1FcSKA
         lqCw==
X-Forwarded-Encrypted: i=1; AJvYcCVGze6kDgHd3hUPV1utofY5Y5CBsfQgGEc3PNFnpOCEDTTIOok5fTzVgPPkoC9/EE7XceY8cX+3/9gQqfNnxlGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzikETmijzfARnoKgnq1mtHzRs6Wq0tRG0CYHZtX8T2th+ZofIQ
	ckQVmd/oeDU8+c5ZfO816Al1uJ230baOE0pakyXZrQGf74cpi8JX7a64eg==
X-Gm-Gg: ASbGncuAK18pCXVo0Gp/hhWDELIB0mbsiTMuvUSIVtfeK87JZByTOIedGlzpSmXk/V8
	bV1fggiNPl4eNcAVL+bURSajLBVFZiVdmTzJp+A8E4/wQSp7pFIDG/iEFDFSKkzhikRPrA1hHIE
	BSSLxEqtqLBALBwA8grfqJMuynkvVFAyzkOBx7FVRtrMz9AiftIVOMmiTX78h2aYFdyHnig0nC1
	uhOwYIU7baNcLtAVQe/NopS6BTgrm1Vy1gg+SkagLWychetp3egN1ZrEIYoIVHZPtygBawcrE+G
	RRPgforJErpEb7REQeHR4b+IlqMcBp6nqRECUzv1MQRAExi09ecyWFnUlcfb2HQoWNKk9ugunuP
	oxaptZIILqtZSFv9EbTDMZx0fHXVDVgKZ
X-Google-Smtp-Source: AGHT+IGYNKab8V1AgUhTMk5nBJpFGPuJZr2l6irKlge2al5oS+JLeYqJPgX/NhWMNzzKlRWrRNRQmA==
X-Received: by 2002:a05:6000:18a5:b0:3a0:b63f:c88c with SMTP id ffacd0b85a97d-3a0b63fcbcdmr1889507f8f.58.1746628698354;
        Wed, 07 May 2025 07:38:18 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b1ff8453sm4744868f8f.34.2025.05.07.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/8] arm64: tegra: Add p3971-0089+p3834-0008 support
Date: Wed,  7 May 2025 16:38:01 +0200
Message-ID: <20250507143802.1230919-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073819_755626_0A7AD1F3 
X-CRM114-Status: GOOD (  15.87  )
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
2.49.0


