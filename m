Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0576BCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=; b=1eqjK9XXKXZk+TxRziU2ouljfe
	Zy/YXchJF+thYxbRIaQNEu+bMGy6Le3lxE0RoozmghB8oqhcHTD5c/WpFE4JSGAckrUWGl+VMfl8n
	aS6m5ujIZve5L2DPwHg9UjUt+n7VLV0I/qPgc9FWnuBXNfGi2yJFyQEv0tNeB9Fa4pRf9V0xvvB11
	3Q8sSu68cMJaNH+0b7bmcEbt9YWK5hyb+shjQ+7FNiGlAi/V/dHf6Oiw+tKPfXOJgNwz1vTA506Se
	uI69tHOYk+Y047YXRsPlvY3TbRGhPpQTrxNN7NKIGlT5JpGWNSdCrGLJ+V6cR3prpvRqSbthj45Cb
	/JygSlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTl-0000000BNwi-0Kik;
	Fri, 22 May 2026 16:12:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTa-0000000BNne-35eV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso39072715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466313; x=1780071113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=T/rXtR6FQr5xaXDh+MNK7G6pFhgFb9MV9kWWRGdSl5tKScdXe9jIdCr4KaWHkel6gi
         e4MB+dD6VHc+HxNPpJ7URim0CO1WRC/EvHrQbFwa5rOSVNQqGmMeYb162VJCtR1OcEzS
         SKlej6tVzldB+Q+t1WHtoYXJPloRiu+GH6cmLb5NAzqQwBnNNl8PHx4q4wIc7LxnuD0Y
         WS8xtZfJqkRB6At+0g8P/rNjhJS4sX5JllzE2o2fKohaEwHY23EGX7jF9uuSg9BaatUz
         6+JvpgUnGGiXSn2N3lrO5mFMW6RtZR82TCoZNHRV+cHlD5fsgcC0VOBx/9qaPf9ozfdc
         CZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466313; x=1780071113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=E+UXfxEGvDpQHOTLDt63jrH9YGGdmQ3eQW+YRS3OcJHcw4uDld4FLlZiEPxaHX3yM3
         wYAvhWJsZtRpMtoNdM9OXHGJnRH6H/Gb4zj2nVOpCkG03We45SfDNlPmEQ2DT9wGN9RX
         I90SX4lViipg86tKMlGKs6tJGkqLC4VHeylVz7+qibbI6em82/jx3N8HaRYqLzzfstCd
         ThAcmBxfz8PyB3+4uOuXuaEcv+0ECNj/X4i1O91S6L7OfPnYBpANvibcQUFRStlW3omM
         l8c8oAMeLUKUNJwBk6KFg93pSsJR3Z8Y4DoflcvgX43p2J4UMku9UmYVgzjx4plaEBbN
         4ndA==
X-Forwarded-Encrypted: i=1; AFNElJ8xWzzOzPviv+fXRJi8O4EugXpj/gLuKC94GiLc7IfmOVZ5PuIoBI/WPmFiZNu0l7q7n+ChfJZHvkPfkNJr3qqT@lists.infradead.org
X-Gm-Message-State: AOJu0YzrN25LEhqIIR7imdhpRhxMhPgRlgk614/ErkFy5jriGzzRI4de
	DamL0/GD1lRLylt2eT/QPZTbrYZStNHXux5zBfGD6/1qHZagSl7FDzyY
X-Gm-Gg: Acq92OFn+BjKXVUQU0oTmaK1D0sYSMUBZ3WQn3WFgOmsbhZ/d8xG4z4ByreVo6iTfKp
	aOya0Tbi/WBNYSTAvAd30qREK7/rNmJwl1dsVoa1UYATSbvzhRenqn54xuiJbEBtQGOWLbhYQtx
	Y2/nsKorrIO0L9DmWiA/gqaHSsSLRdlGExowsMgUEQkhtP6DBGf8os8pktJAQ0YGTAMkr1B+mdB
	In6vmRaEilW007gjVgFq0bpEbepu/ROZdWXktJhZB9KQ1HZ9lsxcSDmW5U1q8U2typ1CyHV98dA
	mMGLyJjPsZvNXgG1zEyOtmAxJkMPrfBAEETM1Jcob0MUeL2I3I5UALH1LTYcwpo0gwGP3xrgTk0
	eyfcRfFYe0/g9P7hr5vXtEz/xKZQ9qG3kfdxZn1wXjCMc/HEmKrE/5xqETRN+GUqh6TAotjnHDW
	aFEzjl8lgWPnCeKqL+qIdFf9cTbB8xwax9jYeyDvWBQg==
X-Received: by 2002:a05:600c:3e0c:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-49042489c30mr69866695e9.5.1779466313046;
        Fri, 22 May 2026 09:11:53 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:52 -0700 (PDT)
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
Subject: [PATCH v3 08/11] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Fri, 22 May 2026 17:11:12 +0100
Message-ID: <20260522161105.277519-21-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091154_787840_2C3F4ED5 
X-CRM114-Status: GOOD (  14.12  )
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


