Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F4CC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 20:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wut3vFO3mMUbsVpsJj+Uk+mcbypGXnlAOsPBjvWlexY=; b=uejTHChc/r9kscpyyzMbA8sig0
	aB/6ItzOZLSm3GkZJ5r67gP77cLy8QdXyE/4Ua13zjKTqiUbHOixYMLQGyXdbR/t1Z4scZQDgUiqp
	AcKW8DyAGh7Cwl6JiVsu+a3PDVFC11Vf+2kFbGRwygF0R/WMM54Xs/lhd2Aag9YyGir8SWnJoC52d
	N1saJ/IKJfN2FuAJTPBWJoTJrel5xVz6NYt2tNW0BASmEBxYdw7W/+NVErpiOROhZasv+1/gYZdUT
	wPWq4lQ+WUbCxK8raDZBBucgHhaZtQ8+UABc4ehIyYqVdI1XArEH/TMSA3thwQ883ULfMEvjf6D18
	f7HjD5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Vh6-0000000EGGw-1U4p;
	Thu, 17 Apr 2025 20:18:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VdP-0000000EFoQ-0Z5X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 20:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF1B74A4D4;
	Thu, 17 Apr 2025 20:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEFB1C4CEF1;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920893;
	bh=cL0NbqoPrjxln+M7eg5VJqlhg4NHXso2/3QwkVlw3u4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RbUWdE1Kk3F0m64YGHn2DU3QVcsO45kku6DKPv3KNNBWvL2GqNjiSbK4P4rV8PXig
	 700l5bF+9c+eu46lnGf7ZuZzD1KIqdBJqP1VpKKxF6cKYg544WS89IalcyknI89/Ci
	 d7tylv6wAuKVnWZwL4jLPb+1eT9H/9ZB6Lz6udKvW3CbXuEmfoPjaohlR90kG9NaqX
	 PFwC8wVzHrskfpP/PBgyJpj+93UUR66xb0puI4fHR3VmU7eX19Y2PTZg/eJegwlO8h
	 m9KL+fxqo0j0JNWZ8tU3dck9rgeGpR59t9D7iZ6WZ2hIN6AD3U/1RmpAzS2FJUad36
	 9xy0/L46wyOWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3397C369CB;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 17 Apr 2025 22:14:51 +0200
Subject: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744920892; l=6119;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=r3FXIrQkL2BPaLQ9NPi9PQxQaHbfYnGD3KEb4Aoaexs=;
 b=In7D/S1SqE8ML03r0v4/Q27rhkgpXJh+W6qeLcyT2U4yunqQzRLkOktYLajotf0lvnibKIzPk
 mKpCH074UH4CAC0Rei2siOEs7n/dfIWsdyMQ6BG12Egf9EmuL80KQ6g
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_131455_223937_6FFE6848 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Add device tree entries for NVMEM cells present on the PMU

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
 
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
 
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 4c224e686ffe5602329f7f394d3354559c4130ab..fba01727ee8bd67990cb001a5727d5dd2d01e2ee 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
 		reg = <0x2 0x920a1300 0x0 0x100>;
 		#address-cells = <2>;
 		#size-cells = <0>;
+
+		pmic1: pmic@f {
+			compatible = "apple,maverick-pmic", "spmi-nvmem";
+			reg = <0xf SPMI_USID>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				pm_setting: pm-setting@1405 {
+					reg = <0x1405 0x1>;
+				};
+
+				rtc_offset: rtc-offset@1411 {
+					reg = <0x1411 0x6>;
+				};
+
+				boot_stage: boot-stage@6001 {
+					reg = <0x6001 0x1>;
+				};
+
+				boot_error_count: boot-error-count@6002 {
+					reg = <0x6002 0x1>;
+					bits = <0 4>;
+				};
+
+				panic_count: panic-count@6002 {
+					reg = <0x6002 0x1>;
+					bits = <4 4>;
+				};
+
+				boot_error_stage: boot-error-stage@6003 {
+					reg = <0x6003 0x1>;
+				};
+
+				shutdown_flag: shutdown-flag@600f {
+					reg = <0x600f 0x1>;
+					bits = <3 1>;
+				};
+
+				fault_shadow: fault-shadow@867b {
+					reg = <0x867b 0x10>;
+				};
+
+				socd: socd@8b00 {
+					reg = <0x8b00 0x400>;
+				};
+			};
+		};
 	};
 
 	wdt: watchdog@2922b0000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index bdb1cb9e406a441e458b1c735359b0148146e91b..3892fbe6a955513cad2ae836acc3e83009ab7cc5 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
 			reg = <0x2 0x3d0d9300 0x0 0x100>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			pmic1: pmic@f {
+				compatible = "apple,sera-pmic", "spmi-nvmem";
+				reg = <0xf SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_stage: boot-stage@9f01 {
+						reg = <0x9f01 0x1>;
+					};
+
+					boot_error_count: boot-error-count@9f02 {
+						reg = <0x9f02 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@9f02 {
+						reg = <0x9f02 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@9f03 {
+						reg = <0x9f03 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@9f0f {
+						reg = <0x9f0f 0x1>;
+						bits = <3 1>;
+					};
+
+					fault_shadow: fault-shadow@a67b {
+						reg = <0xa67b 0x10>;
+					};
+
+					socd: socd@ab00 {
+						reg = <0xab00 0x400>;
+					};
+
+					pm_setting: pm-setting@d001 {
+						reg = <0xd001 0x1>;
+					};
+
+					rtc_offset: rtc-offset@d100 {
+						reg = <0xd100 0x6>;
+					};
+				};
+			};
 		};
 
 		pinctrl_nub: pinctrl@23d1f0000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 950d1f906ba3023c1d118179207a2099345aae94..325e2ac22b3c88d863b2270c39a0a05d625e3f10 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
 			reg = <0x2 0x3d714000 0x0 0x100>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			pmic1: pmic@e {
+				compatible = "apple,stowe-pmic", "spmi-nvmem";
+				reg = <0xe SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fault_shadow: fault-shadow@867b {
+						reg = <0x867b 0x10>;
+					};
+
+					socd: socd@8b00 {
+						reg = <0x8b00 0x400>;
+					};
+
+					boot_stage: boot-stage@f701 {
+						reg = <0xf701 0x1>;
+					};
+
+					boot_error_count: boot-error-count@f702 {
+						reg = <0xf702 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@f702 {
+						reg = <0xf702 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@f703 {
+						reg = <0xf703 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@f70f {
+						reg = <0xf70f 0x1>;
+						bits = <3 1>;
+					};
+
+					pm_setting: pm-setting@f801 {
+						reg = <0xf801 0x1>;
+					};
+
+					rtc_offset: rtc-offset@f900 {
+						reg = <0xf900 0x6>;
+					};
+				};
+			};
 		};
 
 		pinctrl_smc: pinctrl@23e820000 {

-- 
2.49.0



