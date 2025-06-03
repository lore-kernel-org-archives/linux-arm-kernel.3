Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE064C61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjFksz4giACDkWbdmrY3vhdVzo+lQqMzUrTjqZlWHFA=; b=3dfC56DMFeYCouH9fQ+xoONuRZ
	R9SxfrhGPmG6kzgHrBvlgFA/IU1TK7e8n0vRkn4tcfQDsLZNGO1AkXxYezFG6qYY9vdS8oV2R2CpS
	spnAaLKA/Yv9GU1Iz54AYPqPXtXOEBX+OJ5+WDVQjQ51sJ3ub6Brj4jkgQ758br9Omq43DgYFQl+G
	clmihd0Eli6TDUalupRvYmuZ0tLZ9lY1SCYTb1dBPpq6djaXW2smSOO2RFLoswR7wyauKCV6ZCSnl
	gXP2TRgdMTUSJaFf4sVX6XP3F1NoHrrfJPgUoMD45iybWJDkNyyfT0AbzovRUl2Q4PkDEDLdqWU8J
	MXCtp2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBG-0000000AhGG-41Jj;
	Tue, 03 Jun 2025 10:47:42 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMONa-0000000Acyx-2mLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:56:23 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uHaG3473624;
	Tue, 3 Jun 2025 04:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944577;
	bh=wjFksz4giACDkWbdmrY3vhdVzo+lQqMzUrTjqZlWHFA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jUJ4wmAqaMs4xXK3lMSZKPbN3GZRLZVrla9g9OrN9O2W26Nzz7SHssEJ+ypKv92XM
	 viG6eeYlFf/ZAUjofsnb/5xmokatNMXWojGklL+Coe6dRFMnnuHrh4uI6sy38Li1tQ
	 q0Z5fET3aShrksOKN9JHwC4mcDpFMmj5+co0pbGw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uHOQ3661775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:16 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uFGq254860;
	Tue, 3 Jun 2025 04:56:16 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j784s4-j742s2-main-common: Remove "reg" from "scm_conf"
Date: Tue, 3 Jun 2025 15:26:09 +0530
Message-ID: <20250603095609.33569-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603095609.33569-1-j-choudhary@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025622_747655_ABAC7245 
X-CRM114-Status: GOOD (  10.46  )
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

Remove "reg" property from "scm_conf" node as it is not needed by
"simple-bus".

Fixes: 7287d423f138 ("arm64: dts: ti: k3-j784s4-main: Add system controller and SERDES lane mux")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 363d68fec387..9fcfa403824b 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -47,7 +47,6 @@ l3cache-sram@200000 {
 
 	scm_conf: bus@100000 {
 		compatible = "simple-bus";
-		reg = <0x00 0x00100000 0x00 0x1c000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x1c000>;
-- 
2.34.1


