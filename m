Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E0AC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GcFhXK9O0fm1H52F4QkBlL0xR5AN1MAaleWB111VkOQ=; b=QQQjTUHmRZUO8VJQ+A2bizgjSw
	pqL0Ixr0VP35OSerTFioE1X+bvL04vi3gdaL/6pFWo9MW23VIF4eDSMWB9T9rBqiMEX2RMNw1DdE/
	cp1wLeFQ7hBnaDbVP24fdvUKdDY6Hm09zT/2cWbCpmaN4pMdIj37BJT/6AhQ2ZEd6Ic0SiVJSMQd+
	/r8wysLnvxztOkhtLkU5LaX4W8rRxb+ErFrZgoDvk9a47mKYi61szYRSfIB7y4Z4oPx0LF4kqVGYd
	hf2THJ5qaDRxjD+vgu8TscqOgOfkajsmGqijPrE8vYGdS+n+u1eLUJ4EO4xet6H7oOGQJPg5vPfcO
	l7lV+xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8MP-00000001Rbj-1YkQ;
	Mon, 03 Mar 2025 16:09:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7rd-00000001LqM-2ORW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:37:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E16B106F;
	Mon,  3 Mar 2025 07:38:04 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.67.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4151E3F5A1;
	Mon,  3 Mar 2025 07:37:48 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: liviu.dudau@arm.com,
	sudeep.holla@arm.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm64: dts: corstone1000: Add definitions for secondary CPU cores
Date: Mon,  3 Mar 2025 15:37:44 +0000
Message-Id: <20250303153744.376419-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_073753_656003_1C8F66A4 
X-CRM114-Status: UNSURE (   9.26  )
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

Add `cpu1`, `cpu2` and `cpu3` nodes to the Corstone1000 device tree to
enable support for secondary CPU cores.

This update facilitates symmetric multiprocessing (SMP) support on
the Corstone1000 Fixed Virtual Platform (FVP), allowing the
secondary cores to be properly initialised and utilised.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts | 24 ++++++++++++++++++++
 arch/arm64/boot/dts/arm/corstone1000.dtsi    |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
index abd013562995..df9700302b8d 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
+++ b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
@@ -49,3 +49,27 @@ sdmmc1: mmc@50000000 {
 		clock-names = "smclk", "apb_pclk";
 	};
 };
+
+&cpus {
+	cpu1: cpu@1 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a35";
+		reg = <0x1>;
+		enable-method = "psci";
+		next-level-cache = <&L2_0>;
+	};
+	cpu2: cpu@2 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a35";
+		reg = <0x2>;
+		enable-method = "psci";
+		next-level-cache = <&L2_0>;
+	};
+	cpu3: cpu@3 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a35";
+		reg = <0x3>;
+		enable-method = "psci";
+		next-level-cache = <&L2_0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
index bb9b96fb5314..b4364c61901c 100644
--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 

