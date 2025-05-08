Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ABBC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULufjYrRgkBA816dXtdEiDgVGfjh9gA6c4+JfoefvJU=; b=ao+OJ/RJ6UTN03uV7IfboLCcIy
	34kdtDDzymHIk/RinZiMgMVgbVsAVVHYcUrvxDnN7eLQpKsnzCaOmkUazDsKiaVWYTCIbhAWj6hPq
	qE87goYoANRYrhfgSaBWjT8FuM5DEjFsmanPJkPQ+nVqawAjOxjxW6xopPN2T+NWFLdZ8ifvtyCNw
	hDJXGNxKhF/KXoXCf8dW/0UQGthkkY+oB05IQDdvzVtdSVWXpZWyhUtCmhSc/xsb/Dxfg+b0wahnp
	dYIqqBDcGjW9VIh29/CjnjSgN/tqWQmC3/FfqDucdhJyBpJmWqkW3XEV7SPPYUj6zbMIu7neUgCWW
	N0z4rwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyhB-00000000Q0B-0Gjz;
	Thu, 08 May 2025 10:41:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyYP-00000000O3t-3pt0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:32:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38411106F;
	Thu,  8 May 2025 03:32:27 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 717DC3F5A1;
	Thu,  8 May 2025 03:32:36 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH 2/3] arm64: dts: fvp: Add system timer for broadcast during CPU idle
Date: Thu,  8 May 2025 11:32:24 +0100
Message-Id: <20250508103225.354925-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508103225.354925-1-sudeep.holla@arm.com>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_033237_996897_6237BCE2 
X-CRM114-Status: UNSURE (   8.16  )
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

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index ff4e6f4d8797..c1e22ffca623 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -249,6 +249,20 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	timer@2a810000 {
+		compatible = "arm,armv7-timer-mem";
+		reg = <0x0 0x2a810000 0x0 0x10000>;
+		clock-frequency = <100000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		frame@2a830000 {
+			frame-number = <1>;
+			interrupts = <0 26 4>;
+			reg = <0x0 0x2a830000 0x0 0x10000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


