Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D342C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDkfZ1Ifl+OqWnCETYNtzQ3ha4KdaIwdmWopNeKkxck=; b=CbDWI80foV6ofFhWYxG0cV9wB/
	0Y5qZFc2I6o9ytpanAxUYWDFReDS+X7TthxnAlWERN1EF7EBYx7HM5OrBixB7yVnKD4z7pVRsCR6X
	6Rx7L9VG+nCAFBKDu47PtDCwpebu6F8qhpxpbJULN4KHvvmOd3f8awRNOIafKNXQ8De/Tkw95l02i
	BVemv1wxxpfSgK9+OvQyx4Ku7SCGAhZBuDtC/wX/jkJbQ5Ic3DTvDPSedm6epVXWhhaSm/Ykkef49
	ek22oxzOb1cxOGOp/IMVKrNMtogpvKvc8X4Nd3JwJtFUE1T+jTtE2E6oOz80cE7+I2cIiU/YPXK13
	/ipew+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyfD-00000000PWw-1NIs;
	Thu, 08 May 2025 10:39:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyYL-00000000O2s-1OmF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:32:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC40C106F;
	Thu,  8 May 2025 03:32:21 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 187BF3F5A1;
	Thu,  8 May 2025 03:32:30 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Date: Thu,  8 May 2025 11:32:23 +0100
Message-Id: <20250508103225.354925-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_033233_452651_8BEDF4BD 
X-CRM114-Status: UNSURE (   9.53  )
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

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 9e10d7a6b5a2..ff4e6f4d8797 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -44,6 +44,30 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "arm,psci";
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


