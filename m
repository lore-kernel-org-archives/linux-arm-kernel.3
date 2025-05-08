Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ds8i+akhV/SW+ZVMMvbJbXyYF+130UGJm/eOzoXwuk=; b=LCT2vFC8x6YdqgFUSug9moyoLn
	4uIOAW3LnNArcrBwAxbHvbMsBAHgcBTmICCwkeXB4EDUhoao7gor5nieiOCVYoupUY1HkSO9EvQru
	jwyQKE7H+aWt1QRxUxuQdjrJnLBbkCXkcE5JZNbR74WhyhdgN6X7FYvoOh/uq8xEJSkBB7+cnhc27
	hMCYSBqJNafRCdQDLZskcphfZYels1dYPfEwqkAUr+X0c2qyVLXGW7tsLD1w3tNLM6JbJsMgYJpi3
	3yTaOdM77fqF73rscnoLdxWQtxe85eqli+LJgzq1sANCUiguPMhRmsG3/8eiaLOt/uajQ+F64S+J/
	nkDfDaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vm-00000001N3b-2eSD;
	Thu, 08 May 2025 17:21:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3yK-00000001GON-442S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B141E2F;
	Thu,  8 May 2025 09:19:33 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF97A3F5A1;
	Thu,  8 May 2025 09:19:42 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model
Date: Thu,  8 May 2025 17:19:07 +0100
Message-Id: <20250508161907.1152054-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_091945_050981_8A8E3663 
X-CRM114-Status: UNSURE (   8.13  )
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
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 2c2c9f45b3fe..d090badbdbd7 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -273,6 +273,68 @@ spe-pmu {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	ete0 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu0>;
+		status = "disabled";
+	};
+
+	ete1 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu1>;
+		status = "disabled";
+	};
+
+	ete2 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu2>;
+		status = "disabled";
+	};
+
+	ete3 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu3>;
+		status = "disabled";
+	};
+
+	ete4 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu4>;
+		status = "disabled";
+	};
+
+	ete5 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu5>;
+		status = "disabled";
+	};
+
+	ete6 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
+		cpu = <&cpu6>;
+		status = "disabled";
+	};
+
+	ete7 {
+		compatible = "arm,embedded-trace-extension";
+		arm,coresight-loses-context-with-cpu;
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


