Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36032CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz/82D98eZoBGY+tKGqxEu2J24lF98TY0l4nYBfE6YA=; b=4u35hI0YUIxIrwiVGnWRhO+Mu5
	dEwG4xDWY8uywTQVy9ZtFqi43hlkyDmQ07yudtzCcRvHG++9ukVmwrpuvImuL4wfrFNrAl8J9kfSb
	6NcRNM7zt2hL9d2PTWErCSfMrggffUsiv6lm16/jenC7CrJkHyaOrUA1isihYXrxIDeAFkHC6MwNL
	Qp3ajPHg0++uYiWZOWwK76OFT6p8NIoDxTcSeQHm7Zxk6CDvGe9qnG4ihcfYswH4NKBuUNtSQPiDl
	PDdFmbQjOxCS/AQBmjG6rYXfBRC2KnAc+EthBG+kQ7sShs2xjWikLOgSqb3lSXg6f3/SzbKt2HtE8
	7kp5qAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKH2-0000000CKlx-3IJY;
	Sun, 07 Sep 2025 18:38:00 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK89-0000000CIqA-04X0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 18:28:50 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 587ISOAx3702489;
	Sun, 7 Sep 2025 13:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757269704;
	bh=Hz/82D98eZoBGY+tKGqxEu2J24lF98TY0l4nYBfE6YA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OLma8Lk9vD8z+w09qVZkTAjWmkgmN7AkULfErW9wJQGUiqcYo5knZV82wG10uua0O
	 1j9UV9vszBWXRwg7oqq2BWv0qJnhrfhPYxnQwuKBq/yhP4viIgLQsKCxypoHsG5sYr
	 aqhZBokIys5ISXai0iphHRkJTu2c177Pr/whH7vU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 587ISOwc2429729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 7 Sep 2025 13:28:24 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 7
 Sep 2025 13:28:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 13:28:23 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 587IS7US3565173;
	Sun, 7 Sep 2025 13:28:18 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-ravikumar@ti.com>,
        <m-chawdhry@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Update DSS EDP integration configuration register
Date: Sun, 7 Sep 2025 23:58:06 +0530
Message-ID: <20250907182806.1031544-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250907182806.1031544-1-h-shenoy@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_112849_098221_552CDA0E 
X-CRM114-Status: GOOD (  10.12  )
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

Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
TRM Table 2-1 MAIN Domain Memory Map.
Link:https://www.ti.com/lit/zip/spruj52/SPRUJ52-J84S4 AM69A TRM

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index fbbe768e7a30..f0cda14c2530 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2573,7 +2573,7 @@ port@1 {
 	mhdp: bridge@a000000 {
 		compatible = "ti,j721e-mhdp8546";
 		reg = <0x0 0xa000000 0x0 0x30a00>,
-		      <0x0 0x4f40000 0x0 0x20>;
+		      <0x0 0x4f40000 0x0 0x100>;
 		reg-names = "mhdptx", "j721e-intg";
 		clocks = <&k3_clks 217 11>;
 		interrupt-parent = <&gic500>;
-- 
2.34.1


