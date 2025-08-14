Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F55BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NBs7RKwRufRSxBBCqcPJwdIIQf5V5X3kn7DC3EoZuk=; b=TwzayO+4Kb2kqPhHiXR05VyB8h
	dfMWYj2u8CXxbtvx0yryay/Vg+sxVTLljSGK44kLcxicZItaZ965Xx0T2W9bj4MXhgn73Wcp0tTq9
	KpaD3CJevQVszIKYyrrNOpQPjrR3990EQK3TszeR4fvub9txApqk6wbmRxSFZ+uMga1P7PtFA8Y+1
	xlIsC6UL5BAPsPisdQYmiTthLt8Uh5WCPoc1DgR57pFhcouItiuJowfOH2F6wsg/lJMpSP7wnMdzk
	sV2PDuyPxLrxjTdbfA2RnqNIRsf9k5aHza+ukwIxl9N87RaQjQDZf9DWv/Z6mF8qwyyw9JXp3Ivpa
	vs5w76pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYjK-0000000HCQT-1xDZ;
	Thu, 14 Aug 2025 14:14:58 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIG-0000000H62k-08j5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:47:01 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDktGa1942951;
	Thu, 14 Aug 2025 08:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179215;
	bh=0NBs7RKwRufRSxBBCqcPJwdIIQf5V5X3kn7DC3EoZuk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eJRZKCQPduENzaLjUnDw9FTwXUYH3Zj+AsR3qRYo/q3u+/tRlAQrfFjysUeIkY3vt
	 QHwH1LSa5lj93J7jFwFPRDM9qIdRRV0A1HeR8qL2u5z3XtB2Lzi3EBEhhGevB+Qc+2
	 6J8up6I3i9DA1DWMFxJMC7i+kmXA1ijV4b5i46yI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDktPg1748928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:46:55 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:46:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:46:55 -0500
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDkrTY3995919;
	Thu, 14 Aug 2025 08:46:54 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/4] arm64: dts: ti: k3-am62*: remove SoC dtsi from common dtsi
Date: Thu, 14 Aug 2025 19:15:27 +0530
Message-ID: <20250814134531.2743874-2-anshuld@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814134531.2743874-1-anshuld@ti.com>
References: <20250814134531.2743874-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_064700_158792_C8A22B66 
X-CRM114-Status: GOOD (  14.29  )
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

The k3-am62x-sk-common dtsi represents the common hardware used across
am62x EVMs which can be configured with various DDR sizes or none (with
DDR integrated in the package) based on the specific am62x SoC used.

Therefore this patch moves the memory node and the SoC specific k3-am625
dtsi out of sk-common and into the board dts files. No functional change
is intended from this patch. The device-tree inheritance is changed as
follows:

Before:

               k3-am62
                 ^
               k3-am625
                 ^
         k3-am62x-sk-common
                 ^
  am62x EVMs (k3-am625-sk, k3-am62-lp-sk)

After:

        k3-am62
          ^
        k3-am625    k3-am62x-sk-common
          ^              ^
  am62x EVMs (k3-am625-sk, k3-am62-lp-sk)

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts       | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-am625-sk.dts         | 5 +++--
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 8 --------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 4609f366006e..ecfba05fe5c2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -7,12 +7,20 @@
 
 /dts-v1/;
 
+#include "k3-am625.dtsi"
 #include "k3-am62x-sk-common.dtsi"
 
 / {
 	compatible = "ti,am62-lp-sk", "ti,am625";
 	model = "Texas Instruments AM62x LP SK";
 
+	memory@80000000 {
+		/* 2G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
 	vmain_pd: regulator-0 {
 		/* TPS65988 PD CONTROLLER OUTPUT */
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index d240165bda9c..1c6812a8ae9b 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include "k3-am625.dtsi"
 #include "k3-am62x-sk-common.dtsi"
 
 / {
@@ -23,10 +24,10 @@ opp-1400000000 {
 	};
 
 	memory@80000000 {
-		device_type = "memory";
 		/* 2G RAM */
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
-
+		device_type = "memory";
+		bootph-pre-ram;
 	};
 
 	vmain_pd: regulator-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 13e1d36123d5..bf84d392e60d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -8,7 +8,6 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/net/ti-dp83867.h>
-#include "k3-am625.dtsi"
 
 / {
 	aliases {
@@ -29,13 +28,6 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory@80000000 {
-		bootph-pre-ram;
-		device_type = "memory";
-		/* 2G RAM */
-		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.50.1


