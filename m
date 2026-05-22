Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF51CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=; b=DNZ21ZpXzl6XUVXFo17/ddSvt3
	mnHq8khy8nclEJ03Gyov/yL8bJmQPCrViDKAwsdvMAvSdn449ysh+X1f4AeVTQK+ZJ+yFk3d/Bi1v
	gZAH0HJE1W5S7HTZPaBnRcFfT4l6FmGdwQxwml7ArLRcmDH1mwiMI1DC17GlNswSbPdF53rs0LK4b
	83Ewe9yXkhLXKyaxAcjZ6kyVhOTj1gUfCa3d1v7w+F1kjA6eajttZ65CZoYpEPwfEOrRrJ6fzO4fq
	ViGE1r28UNebSmX3eiWkcVxociDrJ1IwptZ7Ll43H0oOVmRRtar80I68J6wcVUa83IxzLSHt6LiTk
	s8837OKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoK-0000000AwaR-1GJX;
	Fri, 22 May 2026 13:21:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo3-0000000AwOj-44jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49040362e4aso13421975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456050; x=1780060850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=TNjNpuJ6ZHALpXhmaSSEK9tfvkAl2SDX1g6icAoG7EUHxEcjZLPlCM3pIj9NUeJBIB
         rINMDQraY/DU9Zf5nRErdLGYJah6tk61bRgY9Je9C22vYiLhLLKxWQs8QGpi/o0wI6UD
         zHJIRNOw7rBxYOr69EO3IO1y2g0wuLUn2LszazENlcg5WNRYkJl9sPKzxJ/Ex7q8fh46
         p7aAjm6SJQ0K4dcTKYZTvznIKSQhddAJ8+L9yfalsd0nDVrplT2ciS8TDjK6qG6RMAnm
         LYDOZYP3s1cnTbnNmB1NgzP+gJ9zyWolfBR8R6R9WeQABSBjhqkfIefpn6rXYkQTvS3t
         pQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456050; x=1780060850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=IjFNBKu3D8VayaKQnTGvUwf1zNnAmIobctNlAg08LI3WN9fOxMOIf8P9IbLEdT9KFF
         1grByGiY+JREzxXt7eVfo6pm/x5xgnFRAOLq+o+tpJJqynW9EQ5Q4s6hzk1Usol5NQ+I
         Bf4Q+f+GBrdgZkVlKDAaA5nVsj6mynw5kdBHUVROyIiVSH/Zl2att9Dv8QNPHWKWAWbz
         58ImShJz77oakp8hWiN7idphm9/iAY/d78VcHe1qi1snL8E92+vLMeOlXDlhxsjxvXmm
         ycuDV1umZ+Pq0D4tO0RbJXL+htMphKLKOBlYgRE5/f8feEYpIDPFvO8h99TUwiRg7RW6
         nxUw==
X-Forwarded-Encrypted: i=1; AFNElJ9BiPq8E8ejJbmMG+EBc9l0rAbQ5Z97MRf9L1ULGH2mluTQk7R22YYx5qoqRDni6/hMknwYMmkgSoCxEK8jxR9U@lists.infradead.org
X-Gm-Message-State: AOJu0YxK4ry7zfw/xI3BQk+I9xTzpzxPiVCBynZidmpvh48Df2ZZ6aRp
	3OOr+4NTTEASD8VmY/+8HqUtJlwnONFmKF2mYvhINJkX3EvTd5fz1+XF
X-Gm-Gg: Acq92OGklOA9+uWZPR4aXn/02AQI7Gkkt00gu8/he5te2a/ZCS+e5HVQUtLFbfwrc0p
	0J4q+JT3YeUlx8hhPQaT0ar33NGeFbLNuUeqMY0scpaX+Nv05WOuX5JbMdLhoepu557iq5tjvxz
	Xzo+QZFeZ5i+LH8D25Orme7KBdlez3rf9O4+S2DtT0dj0ckpWM901DQXeL/4VkKkUCfSoIYPD1y
	oo89ICATDZz1QPdjXQWJpcKn1LBvBP3jtnItDE9BxzQO/SfHMwOT7uftFuC97Ds+dj7PhH5YQO1
	jJA9xZ5R0i08dIjCWAfkbVlvaoN/qqptWCJkXtrUahJZnFeGCBMzgT6ndOl5CLEGFyk99FBkqNz
	/GiU+h5H0bH6+YmzDoqcd59G4WD+w13RG2HzyQuXlFVsRv6t6J3asisTcL8SXxsJS3rsWz5a42H
	39dJ9z51v8OQRqp3wPGCWHzMVjC1uFCkHhKYf03AUi4A==
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr49601195e9.28.1779456049615;
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/11] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Fri, 22 May 2026 14:20:21 +0100
Message-ID: <20260522132014.226721-21-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062054_524507_A1325425 
X-CRM114-Status: GOOD (  14.09  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay reserving AM62 MCU_UART0 (Verdin UART_4) for
use by the Cortex-M4F co-processor as its debug UART.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso      | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a1083c0b2502..31c9bc1d48b1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -230,6 +231,8 @@ k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -337,6 +340,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..e263809cdf74
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62 Cortex-M4F debug UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0


