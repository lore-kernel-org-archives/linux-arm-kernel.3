Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ADEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBqRq38yx/+pxy1Y9dDlCxSkwDtgl5J8R+SOrGXvcSE=; b=3YI/UHaHujosL2GyXbRSpr7Jkk
	MwcJsnT8Kq/sZcASjPckvwnsDR0hDd1KZt13ovVglIqR/u4xjc7qhkyefOPJ7/o1wAN9w6xi2RrLF
	pXWB5LnpUb3M/IdK4ZLV34xs4zSYaxtIL83tlZHPmrjxEwNfPrV5jm772NoP/oUZzbK13JBXXZ6iE
	+QM9Qf5IwkK6OLtvn7CUzo9bJsA0oNngYQcY3yMNlT8nA5PdjhSAwdLL+dttvUbTkWqC+wYu8iQV9
	54tX4QlmTLSZxMejMzhNTkxUU767BzBfaQTIA0h2kEcq4Zc+syKXRsw9y7m4Q28q2YEHSRSQlRJHT
	lR6QaQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRv9-00000004V8z-2Wll;
	Fri, 09 May 2025 17:54:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPvw-000000049Qa-1ygy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:46:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7D97175D;
	Fri,  9 May 2025 08:46:32 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CC923F58B;
	Fri,  9 May 2025 08:46:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 1/3] arm64: dts: fvp: Add system timer for broadcast during CPU idle
Date: Fri,  9 May 2025 16:46:38 +0100
Message-Id: <20250509154640.836093-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084644_553139_20A3E205 
X-CRM114-Status: UNSURE (   8.56  )
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

Introduce a system-level timer node in the FVP device tree to act as
a broadcast timer when CPUs are in context losing idle states where
the local timer stops on entering such low power states.

This change complements recent CPU idle state additions.

Tested-by: Leo Yan <leo.yan@arm.com>
Message-Id: <20250508103225.354925-2-sudeep.holla@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

v1->v2:
	- Dropped clock-frequency property
	- Fixed #size-cell to 1 as expected by the schema
	- Also update the ranges property and the frame reg property

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 9e10d7a6b5a2..50b5993a2460 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -217,6 +217,19 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	timer@2a810000 {
+		compatible = "arm,armv7-timer-mem";
+		reg = <0x0 0x2a810000 0x0 0x10000>;
+		ranges = <0 0x0 0x2a820000 0x20000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		frame@2a830000 {
+			frame-number = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x10000 0x10000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


