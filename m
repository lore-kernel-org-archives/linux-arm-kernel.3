Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29AEEE6B48
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=; b=jtAKU5xivhgyDWqN16Azy/t5oB
	tS6FMJr6/zVERcv5+9oJ8u8DvOPD1G0Bgxnhu5xyZ8KY90RS7OmB/5kxvPOQH3fE/OrqlM67iT45d
	NUf671tUJAwLjsfcf5zvNTrtAvpQDahBwbIjHbeEe+QfIVJsTEkYP8PXzRWrtpwUE0hlz+uYf0kzn
	J0ZiPVb+jufZnAnQKIYuKKGWxvuc76cO7zN0L5+CZja4NB6jLLPxQy7qqox/5RCAaazsdkJy2+cr7
	YLgF/+UfuiBOaczMtoCjSqZcY3MjEPggyohJLAIkOH12JlW+BuCiskeQ2iNJcCUgP5d5i6a/ODAxW
	OHyDHjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRoI-0000000BlC1-2o21;
	Fri, 06 Feb 2026 19:48:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRoG-0000000BlBg-2H7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:48:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35305538592so929879a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 11:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770407287; x=1771012087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=;
        b=eXlnYons/ysvsNRtIuZQjncsyPrOrV2UdKZV7r7YAzJVLvHlVaYtR3DPQPlnWtdctH
         6PxHgtR+F0aa5L3C5eW+TZLzzBgPgxwoEoAy5Z1/1sfwB7OyWI2R/Ge5M4t0UtPRddN6
         K3MNiFCXqR5GeD1ljISJpzcJXesSJHSNmWjEeToMokoMmrsTxfkMmEbDnqPa8Oa3bsHw
         LRMcCXAR0V/nHfvSCNR/IzamcQwk2xhwbwrX9ETQtuujgKEM+ihpY3Dw89+xNA6hHlpN
         V4araZ1HS8ZuIX/GcdP99sWjuewiz18RMXCD/A/ACHwE6ujcbmq0zwG8DTbEBNcawdu5
         PSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770407287; x=1771012087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=;
        b=ghxWXyLD39Ll2oAV+hxGZx5rnIVYl2Mv2wXwBYrXwKxwACQsckdynAVZwwY5JhYuFg
         KiF0X7mw8vapXB/1yyKB61x0U6H3qWU6ZNPXu2KnUJ/ifesOqw2yyHn/9c5RuoeTq+Pn
         5qKY9IC0aw9vdnHvCW2d3sY+FP5eF5jyh5pNARjQ4HjKQyC69TemPClgfAoDrfkTUS+w
         pPuic7bI3+5hPx5TY9G2AboQNH2GwnCc4WKceQAv6SSxAbwmsZxxy+joGueZnl/dPx4r
         NxjeMcg7SWoxgporSXTQ01lXZ4hayKZ87AxWmpOqEogwLpCycMqmOw34cf83jq0NS/KR
         VRpw==
X-Forwarded-Encrypted: i=1; AJvYcCUPHwE/hCD43UD0B6Sfui8Nxdf1HWv1/73cL1rACV7AXMBJxcQge1mU6ZBecsvY2ocML7+VDf2i67Jwri59Zk4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrw643T/7EKNkqez2SJgV8jAONNZCZjWGALT6Lf70PvYTAITnR
	Q6eBT+1Q9amk4Us5EqHbhCqtpZX2W4zE5VWGErIyXVoq3oIthxal1Xl3oRrYUg==
X-Gm-Gg: AZuq6aJpT55FkRExNphjqJQlxQlxPbURVYLl4kUN6fsMC27ivU1yjoxyUnljNCxJhJW
	2CmFfg5d5kLcD04UdsYkOdkDH80NNNfY65hdbnTdmCQlx5m/QzLzajITl3KizvNWpo6ANHJUAQ6
	S9QmsNRTOLk59iOlJztN3bQWJNG+klvLB1E+jMcUKxuT2pEwkpIvXQ9GbZgCf2bJNR8MEPrF2DL
	dL44RQdRe6hGkd3EB3+vlGa1yzGHJEt/KLmKeywKhUDjMTgeEkok+iokhbZNKYmTIwEYvKScI+U
	WLhHouCiN2Iu0F9/ENbMlFcRtnlfnGTAycONaXZxMa9IYbYqVMHpQL3lgR2hhIfW9Lgo11FPl0N
	xyOqgkKqc26tfiOU5jHbWVgHly9RhNNIdbSZAEvsZ6k0X5CDwFh/+LTLi7CP6qTqqcOhGKye9os
	a28KX2ZY1KMZ5U32pmQeNzVHUf
X-Received: by 2002:a05:7301:129a:b0:2b7:1243:7790 with SMTP id 5a478bee46e88-2b856a531admr1468477eec.40.1770401633925;
        Fri, 06 Feb 2026 10:13:53 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:53 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 11/11] ARM: dts: rockchip: Add Onion RV1103B Omega4
Date: Fri,  6 Feb 2026 15:13:09 -0300
Message-Id: <20260206181309.2696095-12-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_114808_804125_EFA37108 
X-CRM114-Status: GOOD (  18.20  )
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

From: Fabio Estevam <festevam@nabladev.com>

Onion Omega4 board is a board based on the RV1103B SoC that has:

- 256 MB of RAM
- 256 MB of SPI-NAND
- Ethernet
- USB OTG
- Wifi
- SD card
- Camera connector

Add the initial support for this board so that it can fully boot into
Linux with the root file system stored in the SPI NAND.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 716f5540e438..d8cd5df138cc 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103b-omega4.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
new file mode 100644
index 000000000000..512b063bceb1
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2025 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include "rv1103b.dtsi"
+
+/ {
+	model = "Onion RV1103 Omega4 Board";
+	compatible = "onion,rv1103b-omega4", "rockchip,rv1103b";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0	{
+			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+			label = "sys";
+			default-state = "on";
+		};
+	};
+};
+
+&fspi0 {
+	bootph-all;
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <75000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "env";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "idblock";
+				reg = <0x00040000 0x00100000>;
+				read-only;
+			};
+
+			partition@140000 {
+				label = "uboot";
+				reg = <0x00140000 0x00100000>;
+				read-only;
+			};
+
+			partition@240000 {
+				label = "boot";
+				reg = <0x00240000 0x00800000>;
+			};
+
+			partition@a40000 {
+				label = "ubi";
+				reg = <0x00a40000 0x0f5c0000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer_pins>;
+	bootph-all;
+	status = "okay";
+};
+
+&wdt {
+	bootph-all;
+	status = "okay";
+};
-- 
2.34.1


