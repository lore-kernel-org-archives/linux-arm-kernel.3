Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 03:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAwZxA7ShIucjPIntFm/sAYS7vKdodJcebhD2+JuHEk=; b=G7iSkptY7hwenJ+vxOW6o5Bu6P
	G5t6calB5LT2WS6eRh0T5URUx3guTtw5Q2R/ledJsE9GqWii3SRjpq1gdxnB+JIHgQgAv/zgbtgTE
	J0HoiWNyVPjvZKtaokFWrt6SLYIiOnufKIIZnefkkYJnfRuFrUpqYwxBOnBdR5YLYGKXrGw+l1r0C
	QNrYkB3xDllTSeMrfq85eusagQyxt76FjUHMqNBiZyEpBorlafdeHVhN37B7EYU48G3aqfCBPJocC
	JijMAhMcHvRkOVFMfHkTKS0vsX8aJdLkCYPW0UgRdDtocYn8ojLG7LsBcPNXyszizitto12tIPyOo
	F8nVuiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRo6-00000001jgn-2cPp;
	Fri, 19 Sep 2025 03:29:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRo3-00000001jgJ-3ED2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 03:29:09 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J3T0JL152846;
	Thu, 18 Sep 2025 22:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758252540;
	bh=NAwZxA7ShIucjPIntFm/sAYS7vKdodJcebhD2+JuHEk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eIM4olwxiAhDJAU+4jekd62Smb4AQO0w8wVorVpTBebJl9Izm60P1WrK8/9uLLkRE
	 tsOsFzkaabd3hS28YvQpW+XkVGwrcC1M1TR2+fvY5Jr8uWL0/Eu7BMQ9XYIRJwzRr6
	 bMMVMWMfPIFP2AdIICqdp66n+xffGA6zIWCc+vNo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J3T07c2591203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 22:29:00 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 22:28:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 22:28:59 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J3SwIh1901076;
	Thu, 18 Sep 2025 22:28:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-ramamoorthy@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
Date: Fri, 19 Sep 2025 08:58:05 +0530
Message-ID: <20250919032806.707926-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919032806.707926-1-p-bhagat@ti.com>
References: <20250919032806.707926-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_202907_860405_C0700E82 
X-CRM114-Status: GOOD (  12.72  )
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

Fix the PMIC padconfig for AM62D. PMIC's INT pin is connected to the
SoC's EXTINTn input.

Reference Docs
Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

Fixes: 1544bca2f188e ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index d202484eec3f..9a74df221f2a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -201,7 +201,7 @@ &mcu_pmx0 {
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
 		pinctrl-single,pins = <
-			AM62DX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
+			AM62DX_IOPAD(0x01f4, PIN_INPUT, 7) /* (F17) EXTINTn.GPIO1_31 */
 		>;
 	};
 
-- 
2.34.1


