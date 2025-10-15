Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctceTll3xAGQoau/JHLiaRcQEETQnVqO+VnzBBxC17U=; b=cbqYq5R7MDFb3CxTMzeSgfTKn4
	vpMGx1dxbq2gWgXnuwmASd5Nu6XFziAS516+ymysAp+IaiTU7ZWp9HcKFDWkWQ2IepeBISb6hIpur
	VMzFhhAxp61QIn285pRIaXdsoGyl8BVQS18rIOw6WdYucuec5Hl632SklleV+DVnGShAvdVw5rj1Y
	Dua0MVwG/F1PYB/3ACyBtOWOSIaZW3QpPsEA2qF7izGZWqak0MlZgzwBtFtLbampCHDut0uH+SLkd
	MhsanDj0M3jo/jUiuYVMMXXwOrKH6Y4DJfDT6l/eH/xARKN3+Uj9zi/rgpgVOkDg+ZC3y8m+yURum
	YKmKjG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zSH-00000001OJc-1f3P;
	Wed, 15 Oct 2025 11:14:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zSE-00000001OH5-3V05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:14:04 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FBE0Ms1828485;
	Wed, 15 Oct 2025 06:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760526840;
	bh=ctceTll3xAGQoau/JHLiaRcQEETQnVqO+VnzBBxC17U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HUd1DMjygZA2jZ+QvEZXrtxLSI/3oizjKnvZr/nQEuJqYr44CmJBLSchTnu/tgRRR
	 V/jCTQyoB1bB70xiGr8NuPG+qxN554N5NgOjJEzVXjzdCtIZmE6jSY3lR1K4GKWbaF
	 hSpssW3EGiyGfTaGbiDXSIWYO/n3kF8GpUo7WuU8=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FBE0e3362488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 06:14:00 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 06:14:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 06:14:00 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FBDbHn1809909;
	Wed, 15 Oct 2025 06:13:56 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d.haller@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 5/5] arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable in board files
Date: Wed, 15 Oct 2025 16:43:37 +0530
Message-ID: <20251015111344.3639415-6-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015111344.3639415-1-s-vadapalli@ti.com>
References: <20251015111344.3639415-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_041402_965011_E2D513C4 
X-CRM114-Status: GOOD (  12.53  )
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
in the SoC file "k3-j721s2-mcu-wakeup.dtsi" and enable it in the board
files:
a) k3-am68-phyboard-izar.dts
b) k3-am68-sk-base-board.dts
c) k3-j721s2-common-proc-board.dts

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v3 of this patch is at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251014125349.3408784-6-s-vadapalli@ti.com/
Changes since v3:
- Rebased patch on next-20251014.
- Based on feedback from Dominik Haller <d.haller@phytec.de> at:
  https://lore.kernel.org/r/df6acbfe5d30956ed66e2768fa595c36d2ebe98a.camel@phytec.de/
  cpsw has been enabled in k3-am68-phyboard-izar.dts

 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index 41c8f8526e15..381880cf9d79 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -422,6 +422,7 @@ &main_uart8 {
 &mcu_cpsw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>;
+	status = "okay";
 };
 
 &mcu_i2c1 {
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 75a107456ce1..e44542b1584c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -692,6 +692,7 @@ &main_sdhci1 {
 &mcu_cpsw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
+	status = "okay";
 };
 
 &davinci_mdio {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 9e43dcff8ef2..3740596576c0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -457,6 +457,7 @@ &main_sdhci1 {
 &mcu_cpsw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
+	status = "okay";
 };
 
 &davinci_mdio {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 837097751c18..2a7f9c519735 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -552,6 +552,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.51.0


