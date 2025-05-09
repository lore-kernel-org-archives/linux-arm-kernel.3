Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85224C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx1fhnQL42oZkBZVeQS5CZ3yd2oe6gwVetdLOT3dsMs=; b=LpJQeObxkRa6Sn5HtflRKjrZBS
	FU16x2QfnTAaoR1lB7hRxxEFPG+tc8F7nLly6+k82gqaNnLqn0bixom39ahhEmf1d5xvMvZ51UEbN
	hBsKXWImqrIE7d+5uX2jFEsGYB0ZpOkrolbeov82rX1AQb2B1XM35Gu8tEzSf6teYJjyEvZxsQEFI
	Wl+4RHouFmDkbInUle3Cedezf22054ka3lij2RQKisbC0pwabg7nUE94sADekm9z6DZ0tSRU8+5ii
	FuvnJeX0Lk4dru/+sXr3pA1WvNwDNHZSDnjFSGGSBRDQmbO3Lcf0i9vtsgtPOyKJqMmwMKNeNVqws
	pv82XT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRx5-00000004VHl-15tb;
	Fri, 09 May 2025 17:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPvy-000000049Rl-2qYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:46:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7D61AC1;
	Fri,  9 May 2025 08:46:35 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 357CE3F58B;
	Fri,  9 May 2025 08:46:45 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 2/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Date: Fri,  9 May 2025 16:46:39 +0100
Message-Id: <20250509154640.836093-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509154640.836093-1-sudeep.holla@arm.com>
References: <20250509154640.836093-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084646_821394_6080962A 
X-CRM114-Status: UNSURE (   9.97  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add CPU idle state definitions to the FVP Rev C device tree to enable
support for CPU lower power modes. This allows the system to properly
enter low power states during idle. It is disabled by default as it is
know to impact performance on the models.

Note that the power_state parameter(arm,psci-suspend-param) doesn't use
the Extended StateID format for compatibility reasons on FVP.

Tested on the FVP Rev C model with PSCI support enabled firmware.

Tested-by: Leo Yan <leo.yan@arm.com>
Message-Id: <20250508103225.354925-1-sudeep.holla@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

v1->v2:
	- Change "arm,psci" to "psci" as in the schema

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 50b5993a2460..755b1407c4dc 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -44,6 +44,30 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <40>;
+				exit-latency-us = <100>;
+				min-residency-us = <150>;
+				status = "disabled";
+			};
+
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x1010000>;
+				entry-latency-us = <500>;
+				exit-latency-us = <1000>;
+				min-residency-us = <2500>;
+				status = "disabled";
+			};
+		};
+
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,armv8";
@@ -56,6 +80,7 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C0_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu1: cpu@100 {
 			device_type = "cpu";
@@ -69,6 +94,7 @@ cpu1: cpu@100 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C0_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu2: cpu@200 {
 			device_type = "cpu";
@@ -82,6 +108,7 @@ cpu2: cpu@200 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C0_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu3: cpu@300 {
 			device_type = "cpu";
@@ -95,6 +122,7 @@ cpu3: cpu@300 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C0_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu4: cpu@10000 {
 			device_type = "cpu";
@@ -108,6 +136,7 @@ cpu4: cpu@10000 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C1_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu5: cpu@10100 {
 			device_type = "cpu";
@@ -121,6 +150,7 @@ cpu5: cpu@10100 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C1_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu6: cpu@10200 {
 			device_type = "cpu";
@@ -134,6 +164,7 @@ cpu6: cpu@10200 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C1_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		cpu7: cpu@10300 {
 			device_type = "cpu";
@@ -147,6 +178,7 @@ cpu7: cpu@10300 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&C1_L2>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 		C0_L2: l2-cache0 {
 			compatible = "cache";
-- 
2.34.1


