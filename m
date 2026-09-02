Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFxjyshR5Gj0Fri/Nz5n1/KkLMrahfjaF4DTCzQtdSA=; b=F+9T3moPUV+gq4v3qvSZrTJ0c4
	ERVdDedxBxkAMIqazEPu/wcyg8Bw9o+yEo8SHfXR3zmC9noJu/sbhHxgkZYXD39rscfC/OGujcIcI
	NqSIkYjpkkxQmW2QJNeirCkdmgyerEZNp+djcbYQNuoCfMzR74ohykrN8SjiGuvIq/ADMg9X5z5od
	SZto2Pp8rGFyHzebhqq8zNGtm0/yM+Bw7IRE1Inal5xPmXe+jGtmEUGnBkbBvNJX6cE8kcMrcdLFs
	spvM39/kad456frIX8cE2XqVuwPUJTuuAsYv0+tUliCIVm78sc1Ur4dyTbwFFD/Zeq+p8Fkmhddf3
	zZ5cdoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkw-0000000Fk3h-1FXA;
	Wed, 02 Sep 2026 19:36:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkp-0000000Fjzl-0cuD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:36:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e257a23aso1097699f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377773; x=1788982573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFxjyshR5Gj0Fri/Nz5n1/KkLMrahfjaF4DTCzQtdSA=;
        b=Dhvty+wAK3gq8/nxijHcyAKlurqfRgyG4gy/zJqp/owbyjAZg5LVKyRm898wT49UbG
         agYLwko5sUhpZ+KsgKL4bcbTNTsaxi3B3qFufXre3lozT/sgu/gpAbZDF93Xz7HzL15T
         UYzEYt6uptrynQNaxqoGQ6ZDWg3FLWwHsA/cW0oy1mcjYIKnwTC8vGdSzkcD+mpni7ak
         DYhW2q2BS9DcteHoG20cXxMybBw0P+NHEm0/GJatpQV9ynfCp2UdpaJqvlBDPEbmy7x8
         s/HIw1ijHdOTeHroB+qy7XVhbQH7d3eD8aK1kXr1TLyWFEycjG0svoYo3imPLmWtH+ZF
         S1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377773; x=1788982573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFxjyshR5Gj0Fri/Nz5n1/KkLMrahfjaF4DTCzQtdSA=;
        b=MCQ6DQMItKu0WftZcmQD1lsDfcP3yOE4CXfHYsra+/+tAqlEtLSE8/0S62IKuQsLqU
         bwQHTfl2vc8qos+Ik0PdJkt6iJC7TkDK3XQ6re9ONH+qS3K6Mec9utZbP7ZN+7UiWBvi
         VGFVVVjiwEXS4vcI0qm6GUuIME0V+ZaAtwhuBzOeUykphFyJtqUlrhv6NNHJI61LsNpf
         lmrrXjG7TbyJ2BXezEBukY+qEsBLL3GR2D0gApli/ZgZW5QCWg8XMbI4O/dPhQgUkKzD
         wNvIf0MjGRktf1YPNY/IUY3F4p82GeCMFzMYprojftjL9Br4xL7iz2GAP8YhcRQukytN
         m/Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwGvXH7Qc/coYBzQEVUK0Ux8yX5FisLQwau1kkm6rbE5eeLBQU7cZ9n3h9W8xnAuOGDyWtsYFY7Yz32xTxGC4rl@lists.infradead.org
X-Gm-Message-State: AFuF++nk2pp+KxXTFYizRz8ovy2xDqLGcmTbomGPfsV48YeMy2BexVeQ
	ZOPoIPNoI7+wXJj6Db2R881mAiW6wDK7z1IzMS2j9bw7Lv5czv5UIdrf
X-Gm-Gg: AYBFou2vuDAA9oVHo6yeoJwsrLSn9cFVHbtPwIb2Qv1kluEKj7WmCHow+z93SZzWk57
	TxVr+LarSoUe4BWj6GqPpxaoTb47VybExdXK9h5VgRcM9JqwX0r8qhJ7f2Ozvv7F4Te82xajEMh
	axV/P/AloRnL/gh0A8txBgae3gEPqx9r7BYo9wnvpAXYoijh9sHvsh5gXFnoYNPZ3pBqvtNZcsG
	NGuAs3uYb/Y2VQtfBLUQHbdvC9323YRD1eCCjkciw0qokFV47dwn1jB4h5Bcy7zlp5PwXQs2zL9
	mVIZDjcBFGO+9CIq20y7+unPAI63xPMp0umlM3ufhW1Z2jJOPErVWsUaBD3/niPi4veNfwDaGsz
	OhDXNuQTTfUvwKsmaByyy9bK5hTYbBppwSerMo8SKQ5QJbxNtKTrpVvCrMYSwVb/ZEyt9y7aKDQ
	XDbk/FjNVJHCmUaxr0EYNWwDP2rGSNKmLx4ASnPwirL/cX/J5lmrMVDTp2AQ==
X-Received: by 2002:a5d:5f8a:0:b0:480:c5:d635 with SMTP id ffacd0b85a97d-4847b6295e6mr14936972f8f.0.1788377773399;
        Wed, 02 Sep 2026 12:36:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:36:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Wed,  2 Sep 2026 21:25:45 +0200
Message-ID: <20260902193351.185771-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123615_235395_930B9D97 
X-CRM114-Status: GOOD (  18.96  )
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

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
 2 files changed, 152 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..b19d5792bd89 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.0


