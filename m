Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAD4CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=; b=yj5HJxWd1iORlZk3dZmBma0B5X
	hdZVjE3w0jNl2z68EUmUUPSjNIQY4v7cBIckZU7j+0Ts7OEcn1dvulDW0XxpcEpo2gW9KOJE4g56a
	8szlLxpdXqQdcUnV0nlX7xxXeRj3vFVY8i3Qy2jlCR70BR/tQKB4dzOZ5tUlZdmZpXqpBSzuuVx2E
	shoTGw1hXAVhQv39XrzhqEdo+wk9O/BFXtjxMIwBB2nnVPmzPYcMJbLoX9Nf9HZ1eOIPQNfZilxHK
	oFCCNomLemtxJj0hC3/UwaMt/HuBUUf/oe3+vHCOSi6SGWpHVx9Wlh8BPVWO3OChfetxNVE7EXYMV
	JfuKVO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoL-0000000Awcc-0a6C;
	Fri, 22 May 2026 13:21:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoB-0000000AwTW-3Juf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=; b=La+QHxHJsS+XaudVxYoWFcjNOJ
	Xc3AG3ip9gPK0nSasv5JFLe0YbZQThwd31Gl719E1f+t6V7afulvSFcNxvDMT22iRozC/Wv5JQBaI
	8NJmJ5suu5q1Kv/kOv/8eXeLUaqRFYzToIWDwsEA5VodRdtQ56Ra4OiWP9ayl3FYRAQPD+ktJ0CbA
	s20dlGahHYry2KgrtKm0ET2NejM4YTiarM47OxwLRzFLAJzwrJvb/4+Bqgy80zWLwlSfC3bTXuXwJ
	H2Q9+PZVyXuQIA1B1q8/L/sAuWqO8yEu68dvDq5paBgn/j/H9dYkYK7/NVraOpq9e7nkx8Upjv0MU
	VTJVTsgA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo6-00000004QKy-2YZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so41036725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456053; x=1780060853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=UhtqjLddpjokgc2DR1rOVrQB/2rTxF0KykLE2Ll2m0V4ZT7oY7YAZkZj4dbxMBDOvB
         VLnRRVQWHgQJiaY0xia/fGqSL6hxsnHQUjsqfXltUr0C+rj7fYt5KWJep0HsrINdfpk2
         0qkh08TTqnyD38Ahj4BHalQZZ6SbNRsCO1GzBrpFyYpmVUvQxqH14M3enA8EISLB0hd4
         fEKw07XygZF6npfMlRMoCXPtjtDG1PYV67ldOrSJaMT6pzKA8QoermQfwrjSJhjBuOEF
         HN5sSHO3PDC3fqYJ4jhWfqhxiNI9aS94HAEInA32DnZ6HmynaSiFe+ib4gC9UwN00IPV
         I1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456053; x=1780060853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=f0c3Lw+KiBa5XcZvygmOP+mZs6KKsU683lHpKyWGXrn7mOt4mEWXPp4AXQgnXheoOH
         dTtxSqTRVU5wwgIYy3O5WLaMkKZnGyfg3423xfskHgeIEm4X9IpgMnWN4dw2IUDQQe9w
         v+2PproOeSSZLjIEgEeoIcYIfT+pFg4yg2rtPwjEl47Q/QHsQFWEdXfVBraakpskvKWN
         3ePGtU3/6TGo1ReMw7xvTj4x8OlAj1DbKVyzzgzvbldDUwHQa0A0lsYSXmXyOhwK6iPS
         HDDpB0byUAmiAz9i9itIc+PYKsZ7W8b/t84ivnZnDBZyWI4mo2ai7nDI1qbGJ0zDv0Hg
         gclw==
X-Forwarded-Encrypted: i=1; AFNElJ/ibllIXELyBVtlLFnb26l/dG7btzDCqxielLChj1jXfVRhgBfFpiklxr711MrfDlHHl6MVOS0JDP4LWMAREGh4@lists.infradead.org
X-Gm-Message-State: AOJu0YyjovZS8lu3QmBZL/ND+vv7PZ189sVN0VFLOSW9Ord7yUo+zhDd
	DK1XeTg8LAx2mcCCAisC4MWNJoQGz6/0tyLoOoz6g5Xb0aqqmxKiwzjB
X-Gm-Gg: Acq92OEgYXImz/X06qXrk5AGypT8zEbvnELB5CeYAUcT8g/VKVv71dN9koPSW8eH7W7
	Jy1CJTthx5d3rTlv1kvZvNNsAR6Z0Z7BURZ6QZNmRhoiGxcqbQg0oHvHlmlaWyPYv36tZu/Bz+Q
	iPCviGFg/2CvaGX+ZhMlQnWZOHnNnhigk5NSBB4EuaRtMEOsIKAB/Gk3DdZV71aIi0MOeGAXCK3
	XHMpSlzkT+Q5j7p8m9qUFe3YyUD30ILbh6ElYujRoleb1RGnnD/OtV+emU+5cJ8SpRbq3iriAM0
	cKj9lF5SQ555POCxVdNpdffGyFaULWHdNGPp3WqFTu30MSNVObrKzxJHhK5VafnetFo0oks/wZP
	r3rR+hbvb9GZIq+Gfgeuvjx4gcW5iHxGAwdFipIelAz8Yj3diSWJ3dniye5OmLCFRCZQxfGXX9Z
	MVoP2JvJyl5+9QbouYkQAeJnLN87nwVhA8MnIFOnh/xA==
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-49042480f2dmr39029315e9.10.1779456052918;
        Fri, 22 May 2026 06:20:52 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:52 -0700 (PDT)
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
Subject: [PATCH v2 10/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Fri, 22 May 2026 14:20:23 +0100
Message-ID: <20260522132014.226721-23-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142055_107278_8C446B6E 
X-CRM114-Status: GOOD (  14.56  )
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

Add a device tree overlay enabling AM62 MCU_MCAN1 on the Toradex Verdin
Development Board with Verdin AM62 Mezzanine expansion board. MCU_MCAN1
is exposed on the Mezzanine CAN Header (J13), Pin 3 (CAN1_CONN_N) and
Pin 4 (CAN1_CONN_P).

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  4 +++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 60844951c9ce..90bb3b0522d3 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -228,6 +229,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-can.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
@@ -344,6 +347,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
new file mode 100644
index 000000000000..7ebf60d27c3c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable AM62 MCU_MCAN1 exposed on Toradex Verdin Development Board with
+ * Verdin AM62 Mezzanine expansion board on CAN Header (J13),
+ * Pin 3 (CAN1_CONN_N) and Pin 4 (CAN1_CONN_P).
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-pinctrl.h"
+
+&mcu_pmx0 {
+	pinctrl_mcu_mcan1: mcu-mcan1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x0040, PIN_INPUT,  0) /* (D4) MCU_MCAN1_RX (SODIMM 116) */
+			AM62X_MCU_IOPAD(0x003c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX (SODIMM 128) */
+		>;
+	};
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcu_mcan1>;
+	status = "okay";
+};
-- 
2.54.0


