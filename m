Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AA7C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cuSitV2YuumtHVL/ZIXcZnkk69oD+TSaZQMjbMoWuyY=; b=HSyOam2CjVUTU8EhhkjCn2MvJa
	LBz9QqJ4m165eJqYy8k0awjVoAt6mT/xEvwO8z7YugScahjkypXlLPccoQd/oDJGsISzJpcBrjvqh
	qdFloyIXt6wAu2+y7ugHKHlYmzmDLkuwtDFZ0aUC/tMIjXN9mktZcVOWxbHFkDBLSt7j3jYfK9+Ne
	y5imzaFcIP7aiyMZgQQyh99ZhIdpkKLwEUjZkOpJ1G8SoWFDsVVfuWDRs5Mg/nsLo+n452lnTs3Lf
	vAne7o0mGNnlWz43WfFctZ0hHeaIejz8sFyUkA59jMyb0qM/i98W4Es1OiYpKlJiDYghqS0lSfA6Y
	tGGgnr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6AlP-00000001Vp7-2lN0;
	Sat, 19 Apr 2025 16:09:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6AjY-00000001VjF-1mDj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 16:08:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2506084f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078879; x=1745683679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cuSitV2YuumtHVL/ZIXcZnkk69oD+TSaZQMjbMoWuyY=;
        b=Ty7Hx4UXwY2bK8BnvkuZvay2h+U2gDqgHGdMtyy4VEGaWvf9b3LfjI2MfCRXuSo5+Y
         6ljPakX+fElocDmGcgW+E0lUFsKNQKZDNEbYVwBa3zjB/x8N3YDFXPsJAJqa9UgKq0K1
         F6kpSx49+KuC/1UlWcqMTYmSrGxuDIEBATs79yj8dGn440VcwZRy6o/RUJDkPqQ9Y4Qq
         XP2euFZD6kYHHuqBJesdTVdOvY0ur5DZ4S8FX3Px6fzvezhh8kg/CcZnprlS+DKPbtX7
         0ZwZ5Ib5mKvKyGbVtdGreqBQRUToDfWG5ZM6ToQ6joVpIRnbQsqGDz0BfHdswJXI+NLD
         E6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078879; x=1745683679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuSitV2YuumtHVL/ZIXcZnkk69oD+TSaZQMjbMoWuyY=;
        b=jhuvbvN3RHdL+vozxq/h1auTDnDAL+vf07oYlR6QWdJ2dK0bqITZzbEIkQDiENAzcN
         7zOWen4LtIt8PnenYmNW9Zd8OqI2lHcHI6Q1gAu2s6+ubb2i28RRyLmiB3XOL5Br0Mmo
         d3xgkSmCwGGGj+BYkH9u8Gu8ry5L5j/iN3ia1F8+aNiSftcbm+4OTem+CRrivmQ42IL8
         c9BeZR6Ce3CKwQf8jL547kheJ4A/MlD96Y7wM4AeA/lyPxmwaikVERQu+2UCvk/JLzL6
         iL98tFC/gyWfLItJVcUgMt1ZN4QnpVWKdT1irSvrsg1FVGeNFhziD5WrIbgMfcxRWWTM
         7Ptg==
X-Forwarded-Encrypted: i=1; AJvYcCX1at9lrnEc5MnQJ+hpgZbTyO7d+VTKrMPv40PrAzEGYKiY6E9GrdYEvtWPN+A3Iw3GmOd4zO+hBRDOtfx7yKhX@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZEz3ox3KZo2RNDdPxpPN9Hjs6MezCwof48mhJXsSxAZ1zRoQ
	plE2+cxi+9x9nyI/P3AnCrNfxMoEbTwzOUEB7t/jNpuwQ4FFhCVH
X-Gm-Gg: ASbGncux49i6nXjyT63ETy2dQXbdUEMxKlMl52AWmY3inZoM8tBCjMqWx5I5wDanGTn
	TBMIH3ycSvIQX4GF2nfpexHJ7v3ExUDlaYwznPD43S7KPKgISXexpiewGLj8Ru5snHYUd09I2b0
	D/j3yG0Nz9EHdc3I6ExqNk8hL7ZxVVnvOu63tDYFfrDXOEoBiG1qq6JJVIv8RWuVb17Nc/1QC0m
	Fiwp7EW4j0aeMF/QW53Ymk1nlumqFf7+8D+Pdbw0GU3Ph7Vyv5a6ouhxquXjCD88cgSbUKyVXfq
	eG75aeuyQkataGiJEH7rZfY7EDDs2+CprqrSFpql3kdSTPEVRdt2cwyLOB4GGnjugKRxBHmV37x
	Vn/3snsex/+WQXVndmPoj11X5EsXoyKghXqLEpTD1GTAJ48o07b1quLbIVO3GKH7eCfrP5XJL09
	A=
X-Google-Smtp-Source: AGHT+IHAPN9N64rdCZ+4Ferq3InaWnzLIdPCLXl/1Ga5fibN8lrQi8XSSi/NSOcGDYUSoS8vjr2zdw==
X-Received: by 2002:a5d:6da8:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-39ef89b5d1emr6024998f8f.4.1745078878880;
        Sat, 19 Apr 2025 09:07:58 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acce9sm66571445e9.13.2025.04.19.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:07:58 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
Date: Sat, 19 Apr 2025 17:07:46 +0100
Message-ID: <20250419160751.678827-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_090800_522452_82DDA488 
X-CRM114-Status: GOOD (  16.59  )
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

Add overlay for the Pine64 Realtek rtl8723bs WiFi
module that works on the Pine64/64+/SoPine devices.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

I've looked at overlays for other vendors, such as available
for some of the Rockchip devices, and I believe I have this
mostly correct but would like some feedback both on if I have
everything needed for Allwinner devices, but also what's needed
to be able to use a single overlay across more than one device.

This is dependent on the following [1] patch series.

Peter

[1] https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobinson@gmail.com/t/#u

---
 arch/arm64/boot/dts/allwinner/Makefile        |  6 ++++
 .../allwinner/sun50i-a64-pine64-realtek.dtso  | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 00bed412ee31..be991f8d8110 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino-emmc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-realtek.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.0.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
@@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
+
+# Overlays
+sun50i-a64-pine64-realtek-dtbs      := sun50i-a64-pine64.dtb sun50i-a64-pine64-realtek.dtbo
+sun50i-a64-pine64-lts-realtek-dtbs  := sun50i-a64-pine64-lts.dtb sun50i-a64-pine64-realtek.dtbo
+sun50i-a64-pine64-plus-realtek-dtbs := sun50i-a64-pine64-plus.dtb sun50i-a64-pine64-realtek.dtbo
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
new file mode 100644
index 000000000000..51b57a46e23f
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2025 Peter Robinson
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&mmc1 {
+	status = "okay";
+
+	rtl8723bs: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&uart1 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+	};
+};
-- 
2.49.0


