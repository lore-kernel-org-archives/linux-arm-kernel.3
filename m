Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D23C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWIe7G/7fkcX9co8suO8AJv+we8rXUPiImUac+7exj0=; b=Fe6uiBjCy0N0yCYvrrfIei5qx9
	qnGh0/R4QFkdkYT3psOSXwl95DzekQ6estNtKssUCzfrgPbI22tjqWgxbPi8F8Q0XPBE9uKx2F3lk
	pI48n50g6T17qtMZAwUIVZ8bbNP8iXiAjYuVf5dj0wGKUGFaPh5A8zF58iLE0u+GsKAynwtYjoP3N
	2qZsc6FLvk4E0kJAmXxsGo4Q4BfoF3f/EeTlKaUMxRQy6Gtlc+52vOCzi7APtmehnk6gdDsEWZmgO
	Mo1hTAPuzbv/GuTXnzEoKmTRggzYmyxEAo1Vp6yumkdMoTUDKwo3NyodNy/upnIgl+GpYTJoXXA0A
	blPGXayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVn-0000000GT8q-30xv;
	Wed, 08 Jul 2026 07:16:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVm-0000000GT6K-0i0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DE3543F5D;
	Wed,  8 Jul 2026 07:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECF24C2BCF7;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783494961;
	bh=T2hjJ4VW2vv/BzLonzPN9qyF2cwvwXce9kLJVx7y2NI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fn6fKnGuJBujzL/KyGm3delqzpXmsKW5dP3Wq3eESKOtVlwlaqpdIedUcj3AuW2rF
	 KgUul1NOxy9OL71gCR9ZWwBoVscieLPJWKgGRwz0E36GpAXUB5RhyuokztQrqCb2vw
	 M8cdhTuehgpBUhUdN9jet/gVFt/+i+vfhKXzE3CQrylP13HvK0OLGT4luzacu82mi8
	 ZPKFHV0Y00NLMozbs8tVFUYUXq9XVR/cw7hmUN4FJDd3Z6RntzTVCSUXr4kbqLbn+C
	 ZIBnsBSZu5OOm/kLZPe3z6QztDtkx29JWyGu6xn3NuazO1AUay84AYmXIcCAzNOfds
	 lY5AlYcn9M/1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F26C43602;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 08 Jul 2026 09:15:42 +0200
Subject: [PATCH RFC 6/6] arm64: dts: apple: t8103: Add PSCI and CPU idle
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-efi-psci-v1-6-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4506; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=T2hjJ4VW2vv/BzLonzPN9qyF2cwvwXce9kLJVx7y2NI=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ5bvT91/7B+f1b4PCA9wehDms1b2+923e2YwzGTVqba8E
 tnh8467o5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRS+UM/zSFc+T7pFeZbvEw
 ZXvzfb5XeJaBj7ex5MnovTJzT70MLmNkaI8yWerEprTO85ndrj4Nxdql25j5Ahw4f65xPjfJxqC
 JFwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Switch the base M1 from spin-table to PSCI and also add two basic idle
states that we support for now.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 51 ++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..3dbcaa698a90 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -24,6 +24,11 @@ aliases {
 		gpu = &gpu;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "efi";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -64,7 +69,8 @@ cpu_e0: cpu@0 {
 			compatible = "apple,icestorm";
 			device_type = "cpu";
 			reg = <0x0 0x0>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&ecluster_opp>;
 			capacity-dmips-mhz = <714>;
@@ -78,7 +84,8 @@ cpu_e1: cpu@1 {
 			compatible = "apple,icestorm";
 			device_type = "cpu";
 			reg = <0x0 0x1>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&ecluster_opp>;
 			capacity-dmips-mhz = <714>;
@@ -92,7 +99,8 @@ cpu_e2: cpu@2 {
 			compatible = "apple,icestorm";
 			device_type = "cpu";
 			reg = <0x0 0x2>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&ecluster_opp>;
 			capacity-dmips-mhz = <714>;
@@ -106,7 +114,8 @@ cpu_e3: cpu@3 {
 			compatible = "apple,icestorm";
 			device_type = "cpu";
 			reg = <0x0 0x3>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&ecluster_opp>;
 			capacity-dmips-mhz = <714>;
@@ -120,7 +129,8 @@ cpu_p0: cpu@10100 {
 			compatible = "apple,firestorm";
 			device_type = "cpu";
 			reg = <0x0 0x10100>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&pcluster_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -134,7 +144,8 @@ cpu_p1: cpu@10101 {
 			compatible = "apple,firestorm";
 			device_type = "cpu";
 			reg = <0x0 0x10101>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&pcluster_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -148,7 +159,8 @@ cpu_p2: cpu@10102 {
 			compatible = "apple,firestorm";
 			device_type = "cpu";
 			reg = <0x0 0x10102>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&pcluster_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -162,7 +174,8 @@ cpu_p3: cpu@10103 {
 			compatible = "apple,firestorm";
 			device_type = "cpu";
 			reg = <0x0 0x10103>;
-			enable-method = "spin-table";
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_retention_wfi &cpu_deep_wfi>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			operating-points-v2 = <&pcluster_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -185,6 +198,28 @@ l2_cache_1: l2-cache-1 {
 			cache-unified;
 			cache-size = <0xc00000>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_retention_wfi: cpu-retention-wfi {
+				compatible = "arm,idle-state";
+				idle-state-name = "wfi";
+				arm,psci-suspend-param = <0x00000000>;
+				entry-latency-us = <1>;
+				exit-latency-us = <1>;
+				min-residency-us = <1>;
+			};
+
+			cpu_deep_wfi: cpu-deep-wfi {
+				compatible = "arm,idle-state";
+				idle-state-name = "deep-wfi";
+				arm,psci-suspend-param = <0x00000001>;
+				entry-latency-us = <5>;
+				exit-latency-us = <5>;
+				min-residency-us = <10000>;
+			};
+		};
 	};
 
 	ecluster_opp: opp-table-0 {

-- 
2.55.0



