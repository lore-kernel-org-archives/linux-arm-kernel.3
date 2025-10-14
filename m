Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98300CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms57JPleUvDWyECsqts6yAYPpcNevUGPOcO3spd4CSg=; b=SPHPw6OuvX20R+UPOFNZuv20Ml
	uUd9sMt2cNiU9FmS/5PjO3mh0NEKOho+OArNKxodj1C634QZtmJ3vC3hUOAlbE4PkljXIYbYedOzL
	/KgmRTxo+Z3KdqxvUJaSgCjSk6eN+k2ExqSlUHFHo4tyywcLGh5gGmTayayx5s6nJ+G0LQrLwWbgT
	EIgoBZQ/hZwEQO2VU9heHDnHL4Tb+P607A4zkDbvWgwX5OWv1ZwVvMNnWkfViEQOD7FrffnJzZeSZ
	bjUtKnebQfd/fUBz9ey4KHKd3VUcpSCb9nPeeJwRS64P0kuaMrw8wVCl11eP4Zu2DsBe+3CovJ8c7
	ainhNTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXT-0000000GJRI-1d2H;
	Tue, 14 Oct 2025 12:54:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXQ-0000000GJPC-1vkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:54:01 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ECrwxY1070454;
	Tue, 14 Oct 2025 07:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760446438;
	bh=Ms57JPleUvDWyECsqts6yAYPpcNevUGPOcO3spd4CSg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WSOMeFM0rhoWftgdNcLgxDBhblmAON/d4EqV1wMuvSdYr7nPi72l8f+KdaMhCy6YL
	 nIyyRc9BvGsyTcqTuye5SAlFhQ4rG+d3nAdEYdcZ+zmt4xt+QD/77K9xwDopzdztc0
	 +mD+L3A/SAoHreVGI+v5SaBdOwKnGHkI6eMd3Z00=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ECrvKd030354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 07:53:58 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 07:53:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 07:53:57 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ECrhPW055621;
	Tue, 14 Oct 2025 07:53:54 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 3/5] arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in board file
Date: Tue, 14 Oct 2025 18:23:41 +0530
Message-ID: <20251014125349.3408784-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014125349.3408784-1-s-vadapalli@ti.com>
References: <20251014125349.3408784-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_055400_691857_2D76C727 
X-CRM114-Status: GOOD (  11.74  )
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

v2 of this patch is at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250611114336.2392320-4-s-vadapalli@ti.com/
Changes since v2:
- Rebased patch on next-20251010
- Reordered 'status' property within the node to follow the ordering
  specified by:
  https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Regards,
Siddharth.

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


