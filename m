Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F822CD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=; b=TjseUGMdvRQxT4Dp7dy1bt8cOx
	+BKYpDZ3nGm+sW2fiig39nwE5iSWsApk2Q1OX0/+iSFnFwprkB3OyuHsxhlO6XA7HcDEu/86WrS+j
	bTl7ruXyOhZPuEuaMMFfUMHeQZ5MN9Ls+mlpfirIk5hrauv+LQLSDEUbQ79pNPLR1e7D+aqXuR7Lo
	b4mc188IFvh5qVQ09CRdMW2O0iofb7ogoF4zX9Mb3GsRq32W40+J7526jeL5rjjtRFfatkCHk1fGF
	oz5kGWDBCx6HFjErm4/D10djNxqMTE1ljlhCMFakb86Qhl5skx2m4V8Kpw0eqV13mEeGBPQKBPHOM
	ONMBYucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tx-00000008DhZ-2Wfk;
	Thu, 21 May 2026 15:01:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tp-00000008DZH-2hLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48d146705b4so69128115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375684; x=1779980484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=TLGt9zQD5nclSETWwYbaEBOfcRoOyvt61Z+DWTRPmGpq4lUXOLWWtseRefnQs4ED3o
         DFQ32+K0OyV0dj/hKpu7yQbxUm1gpNVXjiWW8QvHhLwR4WtpC2zsVv0sDKGyblEi8O6/
         zYY+h+kYao1PLS7v+MGCJ/OliBn5lb0MMnJKNFxlwXAgSbgpOEDAncmhsz3kckeHFsHS
         BL654HrUeKWOzkPYkB+wgmK/UiwfqbgKD6kW7voPGlBV+H+WlR/4HPbOoMH9+cnSmtmo
         YTElmvFkX3MQG6kUHBrhgKQf8DwfENx6oOO3Zj6Ce2em9YugB/8NNAUzMjxRxmRygcNu
         95/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375684; x=1779980484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=VAkr09Z2QiiPSpwuqB4pXmdlzzq+DZppovp15s5KvrDn2wzceRYfGxbU1iHtWUh340
         7In4mv9eTuShnCzjGskwvA5apXYPznrY3MOYV/HdEZlYyWQqs77brAlHQIM7CopDvOCX
         kzptT2evIY9gbGdcLU3z+oem03Q6eaL+fVoFRAy+nvjpQ+gmi5miIWc6GG3q+a76s6NG
         sAaq/lbzLRzm+hRupZn7jCWB/3ZBF1BiGYIPCok1SLBWtyLfr0HWyflBiMcQxrtE66rN
         FFnDFDhr0brJOX4e/OCfN6FpPjBH2MRdk6O1VO4E1LvSZxi+j3maPscKmXV5RrVKEYBF
         lNQw==
X-Forwarded-Encrypted: i=1; AFNElJ9ncs3vYyf5eeBIEDiZHE5434MtrtfsEGhhYeufGpWnNDMTX0xbwA4XfmhVFT7COaOtDBHhdRpz+vu/PU2iJXFB@lists.infradead.org
X-Gm-Message-State: AOJu0YzbeqPkg1ageLeI00nWo+V9naRcHl9PFfX9cAf+Rlqh5cmqr39y
	3BNHthGF3oiQvaimXpFpfQQmE/FBUrgXyuUqT0oRnPMnT8wdH7IMAacD
X-Gm-Gg: Acq92OHv/o+CDY+3DaylZ3xoqz7ynMjzhnDwPaz2lsB2DhZaiGacL9km2HGXF6dHUFB
	rzwSDQNe9FPh+MfEjlS2ToYQGSGdI7Hm9/CncuzUNMF9TSP76e5CXrwiUvKkxCgcu0O5a1j1m54
	DjmZUgz/6qQUZfIj+yPwgRmyckfonDug9DZ919Dx+hr7rZ8PHTRNWLcdZNQ5KqHoVP4vDJthC7O
	0ikYN64wcPYb2W+zrQfGQGbcBGo9ubMihojLoWRxR3uE5BLxNbU13tunvGs7rXLAqY/wdAuSrXS
	nWPQuEwVI/FyNLLYKAfZ7M1i7eLwZjG7mNaU5Il7ZA6sfHYpWNWlhiCpZG4llYAZ7dHzXadb1F9
	51hTc3Ws870NT8TutKGVYQhJhDvmBAaNo0HX0eRXq1yKmqawD7j62j+puZG7V65EogPsIy83Xcr
	7OkJE9DXNg4phywZlZuW8M1IAu+k1Te3+yHY+g8Ja57Q==
X-Received: by 2002:a05:600c:c0c1:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490360c495bmr39484555e9.24.1779375683441;
        Thu, 21 May 2026 08:01:23 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:22 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 11/15] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Thu, 21 May 2026 16:00:47 +0100
Message-ID: <20260521150038.103538-28-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080125_714603_174B8B6C 
X-CRM114-Status: GOOD (  14.64  )
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


