Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C27CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n12Xnknm+lBM2YcZiqvTunVXJRCLAC2S7kCe9p1yz/A=; b=Mm+OZgBPfE1LdpMfA30o+RfQhY
	L/4HyIurhXeAl8GyR5ngxST2zDk3lw9feQsgm/Us4tfvYztxQo9/g3I9+pifU0HFBV/zZY1v2gqM1
	jg7kGJhlie6WqxYKZ9C1YA5nLY78T6NjQfSmSzb5+1mYjKTiBYf1+bE2vdRPxsI1jczAUgIMUO75S
	UVxO023NuQB/R5S96PxTZ0hLWcWBDdtqAnUcXHT5/3sdc0fRgEegTGk53ZFt11QcKvPHSbideErwe
	kxPFK4XRDYF9CpWOoeMR0v3v3+Y1N37iSmUY2vp8CXRCSignSezZ2+xodkUX4XP0JEgFQs1BG+B2y
	5MJJM3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zSH-00000001OIu-0Gpz;
	Wed, 15 Oct 2025 11:14:05 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zSD-00000001OG6-2q2t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:14:03 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FBDrx11303409;
	Wed, 15 Oct 2025 06:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760526833;
	bh=n12Xnknm+lBM2YcZiqvTunVXJRCLAC2S7kCe9p1yz/A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Bj3UWOIURMFPKx4k3F0jMIuePr9Foxo5KZFmZO4g6LAwICD7oRznDKljWjZEiaX13
	 5YzA6UJeAST8TByoMV9yIe7WGl77XEEp1zjSCCyvjflG8h1gi+y0I7X3m/yD1jEPJy
	 Ilj24RzRiepB19aEbm2AVC45TfUXDuipTfp3oTH4=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FBDrCB770650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 06:13:53 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 06:13:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 06:13:52 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FBDbHl1809909;
	Wed, 15 Oct 2025 06:13:49 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d.haller@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 3/5] arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in board file
Date: Wed, 15 Oct 2025 16:43:35 +0530
Message-ID: <20251015111344.3639415-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015111344.3639415-1-s-vadapalli@ti.com>
References: <20251015111344.3639415-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_041401_843566_136A5A88 
X-CRM114-Status: GOOD (  11.71  )
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

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "mcu_cpsw" node
in the SoC file "k3-j7200-mcu-wakeup.dtsi" and enable it in the board file
"k3-j7200-common-proc-board.dts".

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v3 of this patch is at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251014125349.3408784-4-s-vadapalli@ti.com/
Changes since v3:
- Rebased patch on next-20251014.

 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index f684ce6ad9ad..f03a15edf954 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -323,6 +323,7 @@ &wkup_gpio0 {
 &mcu_cpsw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
+	status = "okay";
 };
 
 &davinci_mdio {
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 692c4745040e..fec1db8b133d 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -432,6 +432,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.51.0


