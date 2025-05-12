Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20B1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UlIw6OxGQtC/a4H3YUVhYjhKLtPrp27t5h9R9p4p3dw=; b=1VAbrUDEh7ugu4RhPnGotadqFo
	JB6aCjj/ylSBoPjC+alRPG+nI8gb2WwCoiWastDpHSJF1R+/Yt8e46QEjgTNuaWNsW9y5KUmNuAfQ
	5Jvlz5O04LqmTVKQveCB5ieJr160YtpNZLx6rr0HNUBbFriHXYh8xsGckL6l8Stme07uT26weGCdw
	x/qh7EdVbpZKSgfoKjoEyOMHkn5kjKK+AcjFBf95+2Ehhp0pY7TV0PcJhQBbMS1DfJFL9VJ6TEgfF
	pTV171JsW3Tu0nlPZh8nxLyKt5xCUX2W0XvkhMlAFo5Q9WX4wUvHIq7UgKHVG12qIb9t/TDNQDkg/
	oH6P4Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVJu-00000009vEo-3i3b;
	Mon, 12 May 2025 15:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUoz-00000009qTx-1LVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:12:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AECE114BF;
	Mon, 12 May 2025 08:11:47 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 56A8A3F63F;
	Mon, 12 May 2025 08:11:57 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model
Date: Mon, 12 May 2025 16:11:49 +0100
Message-Id: <20250512151149.13111-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_081201_410047_3AC766FB 
X-CRM114-Status: UNSURE (   9.23  )
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

The FVP Rev C model includes CoreSight ETE and TRBE support.  These
features can be enabled by specifying parameters when launching the
model:

  -C cluster0.has_ete: 1
  -C cluster1.has_ete: 1
  -C cluster0.has_trbe: 1
  -C cluster1.has_trbe: 1

This change adds device tree bindings for the ETE and TRBE nodes.  They
are disabled by default to prevent kernel warnings from failed driver
probes, as the model does not enable the features unless explicitly
specified.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

Changes from v1:
- Removed the property "arm,coresight-loses-context-with-cpu" from ETE
  nodes.
- Updated ETE node name for compliance with the DT spec.

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 9e10d7a6b5a2..a71098f74609 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -227,6 +227,60 @@ spe-pmu {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	ete-0 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu0>;
+		status = "disabled";
+	};
+
+	ete-1 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu1>;
+		status = "disabled";
+	};
+
+	ete-2 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu2>;
+		status = "disabled";
+	};
+
+	ete-3 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu3>;
+		status = "disabled";
+	};
+
+	ete-4 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu4>;
+		status = "disabled";
+	};
+
+	ete-5 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu5>;
+		status = "disabled";
+	};
+
+	ete-6 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu6>;
+		status = "disabled";
+	};
+
+	ete-7 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu7>;
+		status = "disabled";
+	};
+
+	trbe {
+		compatible = "arm,trace-buffer-extension";
+		interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_LOW>;
+		status = "disabled";
+	};
+
 	pci: pci@40000000 {
 		#address-cells = <0x3>;
 		#size-cells = <0x2>;
-- 
2.34.1


