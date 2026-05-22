Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366DCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=; b=hsC3vkODenSoUiZC3VY4cjEntV
	i+EzGJVWEdwm2ZDcDttEqG4wf02RxaALftKunJD7lmX0wACkfEG6Z3Wp/WHPQEKlJexd7LpzGEc7/
	9ExdPCNHVEiYGc6eKFEiorB7W28bMDg7i+rpZRuYBK1N/0Cbgo96j8CgX96/J/mSKRo8itI2JPrKf
	04e1WBsNoeAoz19AV+wN3bJVe0MOonJu3jq0G6thwilqt5zHYbxQ6HjAa0Q/JuZJ6wqwim6hnp2Nc
	FpXgwQU4SBE38fw8YMM6qSu2xFCvUrGWOOtVAboFalcdzIEKWhr9PQcAadaVwZMmFxBGPoz/GaF7l
	skLtCg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTl-0000000BNxJ-1JMK;
	Fri, 22 May 2026 16:12:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTe-0000000BNq3-0bOA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49048e043e5so3863535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466316; x=1780071116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=PmD+sS9vvF3FIOw7WxnsWBn06YYqQAQ4SH0ODWuw8MtcLisH87rMUSk7hETqj88PKX
         p751klofvIl7OyIJArlqvYSuBxfsVx80LoMv7ZmPUFauX84fUZNW8+j5B/A8g70nn6PP
         AY0R5T3bs+QFgAPrihe++rVxVAOBLbq0AQOLTGKu2f6pjCC14d6KeTUMekGkH9Crj+mK
         yiCzRM0zUe1YyLDjEfZi3xppmd3JABmLQAikLqTJYnYAwxkfOpAKGfmap6Y90U7KwrMj
         rddNHW80xaTuPz+k0/Sbk4KQE6GWpM/G0ynHReLd9dFR/LmdHZnOdB++/CfXeIIh4Vew
         kFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466316; x=1780071116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=glJiKQn6VjQrhme9I8p+ri6iuymnneeL+RarK6S/VDBJOdHNqBR/immC79S0whBRm5
         Wd/BULsfm4LEg+josrw2nXblr2LnuRcmYyalQepb9IQ/FSfTpjcnQNMTbGfBOU4OdaII
         tTOC/yfgAE5A43uk055Gk1kQ9LtxpgYgNJ4NIjIvWG5tfAny9+86fifaXd43VbUMKS6Q
         KHSPLjc+c28ume3EX7cvfRhPSy21L/Wvr2hn52j/jwNDIgWLQn0X1QHK5WuZBJjEGzbO
         qceRYSYFeoDL9kiM/rcmuwJwKMUersVNGW3Wd2Qdw51rguUYSlSq49kJi8caoYBtPZxf
         ywlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JWGnscRuPI/VwIuk2oHKqxl4s8VQyBIhIGVmyvIo8DAoUqm9pkv1ft3ZKdQLLQG8M359IVNee/eSheDWN/PQl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0TOkl2X4vfd+qqtm03/b4pUEOSpmVp2Jq2Ws4d0j9bgYMTI5k
	W3/5pfYDpg0ydJLiubtdza+DdPYDhCwZios1zVzqzPhXKDhAwi5ai5o+
X-Gm-Gg: Acq92OEqEewZjOwXoeVC3VwnbxXgwutH2Lp9k6gX0lyY3/AAfykzs++0qZzXudiKTR2
	b3VNkog9XetTfkWAKASk7hk8sQpZ6elrGDEYdEjzxryaglQChXZWcTEa37T4+bfgatyb4B2nhI5
	EdF5lT+F4imBCRbwfWwi+5ieG6yMNgzSGo0jLPe8B83dgGNF5vfM98gQG75W8lpDLr0CMhQuKeB
	iiCzJjvd1p8u9wzmnqk+RveQNAPP2EBvr5FRHv+zMp8kdTLTa7YP9AJ8mtoR4nkz8tJO9RylKsV
	cjLRgI9wUZMpc4vl+8dqFWHltK3YA9GA5BjbYy1idRYMQLXN1TXWCeef4SOXTCfw2H+Q9FmTMuY
	fBnz1eHgGxEG1gPZBgQ8m8RHhOSqY7etk1xuvMTNUuuhEtu9FJkj/AhJ4h9n/1ycBmAhpnp2sT3
	zAsVrIVbvawY3XGerGXN98v9dIx8F15BGbQ9LI5uT7Ig==
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-490426adf66mr50035925e9.13.1779466316275;
        Fri, 22 May 2026 09:11:56 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:55 -0700 (PDT)
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
Subject: [PATCH v3 10/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Fri, 22 May 2026 17:11:14 +0100
Message-ID: <20260522161105.277519-23-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091158_198685_4DCFC5FC 
X-CRM114-Status: GOOD (  14.61  )
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


