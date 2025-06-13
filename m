Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5662EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz345A6mFjH2HX9rE7in8ohiFaeDzLfhWDXzz2jheZs=; b=cd24TxHyoZ9tRqGpvM0pjjCGRk
	Nmwuq/5uwdemMWi4TK2qI9V8SFDeAI5K6VkwXmY4dPS1bv7rcSrZgIm+zVc5lWo6hWPbq7Pd7kKmF
	I78wUi3+stRvrL4McfqRspvMygjVvLWcKl6gr+IoQA21yGO+YHrJ4tUsBk5+SwDAuS+Xda4slfEvW
	mkVtfi+BidpkbUNW/KpZSDvs+8ZnA154kenvkmmuFF7WLv6vNOF9vVpXB0eFV5rA3rGueYpS+eETB
	5Oyv9216+A1ZocAzQcwPxkgKeO3V7PAyoTWfct6Sz8oVVSTBGLxLeQuCqSSgKqKWgm9C+9J2Z/xrB
	R0hRddLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBsM-000000007H8-1dUO;
	Fri, 13 Jun 2025 21:23:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBm3-000000006q3-3Vuv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 21:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=cz345A6mFjH2HX9rE7in8ohiFaeDzLfhWDXzz2jheZs=; b=cksen2gc9sjnLklZ9AbW9lFWhc
	TDDE7XdK4SfiujxvL1YJGy8QR3eC/LYJkw/52zoeKAl+t8HHn9oiJGBB9pN9GuDCpi2lopqJvkDx5
	cQ/Hj+DVYdYxEGxqxZi/jaI5n/qcNlhcGHBoVUWiaZYN4Sew9RGqn+6AXeNlNa5GPHcFKtogqf4ql
	52nLJMAEH5qv9+1loeJ1CT95VYG53B3Zxl3XAUOiWY7ZiGdCnUCH7+4tWRKqeCVbMdVJbBxX1hcAj
	QuaSMbJ2Ceq6lN9yJ4qX7jve8YN9jWFUjSprrMeTaIJn1OVIJ7J1Y/ayT+5HIckyTzKdi1WrWM6t0
	QTdWfurA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBm1-000000035hy-1r7n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 338ACA51AC1;
	Fri, 13 Jun 2025 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0304C4CEEB;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749849432;
	bh=Nv1fZdTt5vgFRyRvz6HDaxwRIK34luDzj13O5Rz5O18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z2UFRXnuvV0HuAqP+lAIEhYqfXRWeYzkNuRn0hHTd8Ibei+URS+5wtmyry1B7EhnX
	 lRhSTG/OJQXkERI5sUsjiGyUo9aHWRpmqIgiJZYNQM6pYM2CKVud/umpkvlbO7fubr
	 vyM6/XM339NOobyvb2eJA5JWgXyUWfW0Euwo6DeRxU70kGugyJyLGGsvBzvPqfWChE
	 ZjOHJJ3jAXZvwkUmgtOrvwvRUsEtlvDJWQzlhQ92UeJ7wtmREPG08QrGSJdUWlGAZK
	 a0TTi053PfI8XWPGPekLTwBuF1Cdld3U+iInOqk99evWjE29mpFjHPRQtiw7gaZYCf
	 ZxHbop+FoJc+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE7BC71136;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 13 Jun 2025 23:17:08 +0200
Subject: [PATCH v2 2/2] arm64: dts: Add Apple SoC GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-sgx-dt-v2-2-fb2b7d1c3ff7@gmail.com>
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
In-Reply-To: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749849431; l=9228;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=LNEGg5XDHc8p74YN3j3fHmCXpQuoilJu/BPjhAcYKSQ=;
 b=oDbpu+5LuPgGuGv4kfiFkaP9DQm+2xr+8YsXOJqzdtiCq6Lcs9r0dfiKGmCQe5A8+09VbPh5E
 zuMXFPkSMq0CZhP30XnfFNGtjKydx+RcW54Gqh00V8yMcfd3H1YIPPP
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_221717_830090_E74EF2DA 
X-CRM114-Status: GOOD (  10.96  )
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

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for GPUs in M-series SoCs

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 198 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
index 89c3b211b116e96ee0a5ea0c923c3ab824008307..0ad77c98073fe65ddde7736acaece9acd5f3111e 100644
--- a/arch/arm64/boot/dts/apple/t6000.dtsi
+++ b/arch/arm64/boot/dts/apple/t6000.dtsi
@@ -16,3 +16,7 @@ / {
 };
 
 /delete-node/ &pmgr_south;
+
+&gpu {
+	compatible = "apple,agx-g13s";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index d2cf81926f284ccf7627701cc82edff31d4d72d6..ffbe823b71bc8d9c0975524aa04efa9bf520a89e 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -62,3 +62,7 @@ p-core-pmu-affinity {
 		};
 	};
 };
+
+&gpu {
+	compatible = "apple,agx-g13c", "apple,agx-g13s";
+};
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4..8fb648836b538bbd9efdccd6cec5d08d868a0d39 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -300,3 +300,7 @@ &ps_gfx {
 	// On t6002, the die0 GPU power domain needs both AFR power domains
 	power-domains = <&ps_afr>, <&ps_afr_die1>;
 };
+
+&gpu {
+	compatible = "apple,agx-g13d", "apple,agx-g13s";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
index 87dfc13d74171f62bf3087401918d9d41eaac560..e20234ef213538f851d9da0dbd11b318831668b1 100644
--- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
@@ -11,6 +11,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -378,4 +382,34 @@ nco_clkref: clock-ref-nco {
 		#clock-cells = <0>;
 		clock-output-names = "nco_ref";
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			status = "disabled";
+		};
+
+		uat_handoff: uat-handoff {
+			status = "disabled";
+		};
+
+		uat_pagetables: uat-pagetables {
+			status = "disabled";
+		};
+
+		uat_ttbs: uat-ttbs {
+			status = "disabled";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..341307330bfaa17b276d9c23a87931dbe71bd186 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -302,6 +302,34 @@ mca: mca@39b600000 {
 		#sound-dai-cells = <1>;
 	};
 
+	gpu: gpu@406400000 {
+		compatible = "apple,agx-g13s";
+		reg = <0x4 0x6400000 0 0x40000>,
+			<0x4 0x4000000 0 0x1000000>;
+		reg-names = "asc", "sgx";
+		mboxes = <&agx_mbox>;
+		power-domains = <&ps_gfx>;
+		memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+				<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+		memory-region-names = "ttbs", "pagetables", "handoff",
+				      "hw-cal-a", "hw-cal-b", "globals";
+
+		apple,firmware-abi = <0 0 0>;
+	};
+
+	agx_mbox: mbox@406408000 {
+		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
+		reg = <0x4 0x6408000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1059 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1060 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1061 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1062 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "send-empty", "send-not-empty",
+			"recv-empty", "recv-not-empty";
+		#mbox-cells = <0>;
+	};
+
 	pcie0_dart_0: iommu@581008000 {
 		compatible = "apple,t6000-dart";
 		reg = <0x5 0x81008000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..531cfcd463ae6d8701dec67cde8c953b8865eef6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -351,6 +355,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			status = "disabled";
+		};
+
+		uat_handoff: uat-handoff {
+			status = "disabled";
+		};
+
+		uat_pagetables: uat-pagetables {
+			status = "disabled";
+		};
+
+		uat_ttbs: uat-ttbs {
+			status = "disabled";
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -359,6 +393,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g13g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-abi = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: performance-controller@210e20000 {
 			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..b41b9f8fa122b13b9bf20dcb7135049e11e1819f 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -366,6 +370,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			status = "disabled";
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			status = "disabled";
+		};
+
+		uat_handoff: uat-handoff {
+			status = "disabled";
+		};
+
+		uat_pagetables: uat-pagetables {
+			status = "disabled";
+		};
+
+		uat_ttbs: uat-ttbs {
+			status = "disabled";
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -374,6 +408,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g14g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-abi = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: cpufreq@210e20000 {
 			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;

-- 
2.49.0



