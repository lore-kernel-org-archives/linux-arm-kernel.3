Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB7FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifIZS36bPmBp16e6k20HHvVOE/BgKCs/pEKPzQ6EFhs=; b=A/S9F8zc7PKHC0I3c8SkCM3fPH
	VLE5bAspGqfjY70ThDq4PJyYKCFpGtbUrGLQ6oLM5YB/M/dUanW5aIQm2cxHr8bMBEulGUif3VY3r
	e/LfHqpgblIU05naeZg2MIRD5/OcwiY9LOzU4RG4EzvVsEYG9p3KO1C/Pr/dzh2zrKew4SbLnP6L1
	HbfjbWHiQuCfLb6WIaW7GQ59EEZMsRAAlpREzCMaXk/06LQ1PHnIYb8TipfPTR1hx5ryBN7T8lZI/
	QlnO5LvV27s1yHZKmLMjzPeuMW+wgHzBoRUr+3g6BjNh+dvXbGGIXce1v3juNhXX/Zv2Y5dJUeJ9D
	kXf49UIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E8B-00000007OZz-3EMG;
	Tue, 22 Apr 2025 13:57:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cnj-000000077o3-2jJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:32:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWWYQ1209463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325152;
	bh=ifIZS36bPmBp16e6k20HHvVOE/BgKCs/pEKPzQ6EFhs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i+Wt4AXY+fvWCNpUqCKrKx8B375RdoStLSlVOpXm4oEFc98GMjiANe2MDaQR18Ggi
	 f95fSAB9o/RmRRvLPYJA8uh38Y3ZvOCc/ovSbcsVw6tPloC9k4pbSHbyV/mth9ep2G
	 8LCjOMqN71rN9HyyqYoKaljb0D+0/pOBq1sER7UA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWWv3042976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:32:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:32:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:32:31 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCWIKv117965;
	Tue, 22 Apr 2025 07:32:28 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output for PCIe1
Date: Tue, 22 Apr 2025 18:02:18 +0530
Message-ID: <20250422123218.3788223-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422123218.3788223-1-s-vadapalli@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_053235_774859_250DF763 
X-CRM114-Status: GOOD (  13.04  )
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

The PCIe reference clock required by the PCIe Endpoints connected to the
PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
and J742S2-EVM is driven by the ACSPCIE0 module. Add the device-tree
support for enabling the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

The previous versions of this series were a single patch. Based on the
feedback received on previous versions, the SoC and Board support has
been split in order to allow reuse for other Boards based on the same
SoC.

v2 patch:
https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
Changes since v2 patch:
- The SoC and board changes have been split across:
  k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
  respectively.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 2664f74a9c7a..fa656b7b13a1 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -5,6 +5,9 @@
  * EVM Board Schematics(j784s4): https://www.ti.com/lit/zip/sprr458
  * EVM Board Schematics(j742s2): https://www.ti.com/lit/zip/SPAC001
  */
+
+#include <dt-bindings/phy/phy-cadence.h>
+
 / {
 	chosen {
 		stdout-path = "serial2:115200n8";
@@ -1407,10 +1410,13 @@ &main_mcan4 {
 
 &pcie1_rc {
 	status = "okay";
+	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
+	clock-names = "fck", "pcie_refclk";
 	num-lanes = <2>;
 	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
 	phys = <&serdes0_pcie1_link>;
 	phy-names = "pcie-phy";
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;
 };
 
 &serdes1 {
-- 
2.34.1


