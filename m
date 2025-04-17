Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agOmMDGyX+AHfGFpR6U+k5uDlDebQriePJ9/mg+Opxk=; b=qNicET7i/PZbhE5XeZ6SowfYhf
	2FwMKKAzPx79Dt2weuAvlVuC4mkrG2/gUQmFKZz0wHs3cDLBCFPBNtWDXvOKSVH6CWG6dZGHjQyvt
	PJgjIjjE3bfFjVialWzxzDNaeegWvQJqRhKOBhXaYoP4YP8vYWda+l0KA33KZKvuz6B4/wu1B6qJD
	wyGmeHvMMPnnzTMHSy4DPRPdj7vmiUA7ry1Bn9aaeGiH6t7R3BtPoIfLTZUl8tmYQC49WlFeVDDjE
	TOlz/9a2lW3UFkQ33y42KwiQCB2XkHXzLorVQ2MzW6ufx8+gba671/HlsmLRWky0shRTK5D0xeBDb
	EQauHkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PlA-0000000DEFd-27IK;
	Thu, 17 Apr 2025 13:58:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OQR-0000000Cy33-2vUx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:33:05 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCWxfi691237
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893179;
	bh=agOmMDGyX+AHfGFpR6U+k5uDlDebQriePJ9/mg+Opxk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FLoWsdlu6LDrDvSkmCFFjmaetgueMKhbcOTIuu4q8QjrA2ngt9IXwuC9KjHId5Gm8
	 2ngoIo/HiTCLIxo8BEF8dLARkAtp3e3iENEq5XCR+LLWnr1eXW6ovVmuFrSUtffd7M
	 W6CjoXz6u0RIY0TlNoHKACF9uuVlMK5oSFid+2DU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCWxpt094092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:32:59 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:32:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:32:59 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCWkMQ038275;
	Thu, 17 Apr 2025 07:32:55 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
Date: Thu, 17 Apr 2025 18:02:44 +0530
Message-ID: <20250417123246.2733923-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417123246.2733923-1-s-vadapalli@ti.com>
References: <20250417123246.2733923-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053303_826599_F426A8C4 
X-CRM114-Status: GOOD (  12.33  )
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

Since "serdes0" and "serdes1" which are the sub-nodes of "serdes_wiz0"
and "serdes_wiz1" respectively, have been disabled in the SoC file already,
and, given that these sub-nodes will only be enabled in a board file if the
board utilizes any of the SERDES instances and the peripherals bound to
them, we end up in a situation where the board file doesn't explicitly
disable "serdes_wiz0" and "serdes_wiz1". As a consequence of this, the
following errors show up when booting Linux:

  wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
  ...
  wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

To not only fix the above, but also, in order to follow the convention of
disabling device-tree nodes in the SoC file and enabling them in the board
files for those boards which require them, disable "serdes_wiz0" and
"serdes_wiz1" device-tree nodes.

Fixes: 628e0a0118e6 ("arm64: dts: ti: k3-j722s-main: Add SERDES and PCIe support")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---

v2 of this patch is at:
https://lore.kernel.org/r/20250408103606.3679505-3-s-vadapalli@ti.com/
Changes since v2:
- Collected Reviewed-by tags from Udit Kumar <u-kumar1@ti.com>.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..beda9e40e931 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -32,6 +32,8 @@ serdes_wiz0: phy@f000000 {
 		assigned-clocks = <&k3_clks 279 1>;
 		assigned-clock-parents = <&k3_clks 279 5>;
 
+		status = "disabled";
+
 		serdes0: serdes@f000000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f000000 0x00010000>;
@@ -70,6 +72,8 @@ serdes_wiz1: phy@f010000 {
 		assigned-clocks = <&k3_clks 280 1>;
 		assigned-clock-parents = <&k3_clks 280 5>;
 
+		status = "disabled";
+
 		serdes1: serdes@f010000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f010000 0x00010000>;
-- 
2.34.1


