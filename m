Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C1CA1014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 05:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ePqsIFvvYXVPKunzCWZj6k6JrCoCIdpXe0VE1H9j9g=; b=E06FR0pDsN4D7kuhVa4W4/hNOx
	7KoPORIWv3huCvpQm6au+ZG40AOszAC0GIGDVH+BVfWxONgV485sbgSwOi/hG/RTAPeajXTkHB2ap
	fdM9Db6/GSkcDfcvijadktnIT+2bss7R1R6ZHHVpCtMhhaXFaDLTHGDyu2/bcP/jIGRz8mGdgFpl2
	KxPLl62wn/sFUShwPHJlkXZn70ThC0MaWKa3uEygxsjQOgOUm9N7gHVAVa1+U3H3uuTph0HpsWPrx
	VEW5QLBbE1NtNRao74AQqClhm9evlrJLhmvbozhjjPSGoVXO06mGIM2CmMygA3goVKZimPSNoDY8N
	M2WcHKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2HM-00000009Ay4-13Ku;
	Thu, 04 Sep 2025 05:13:00 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2Ec-00000009A8Y-1IPU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 05:10:11 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58459kqr2998806;
	Thu, 4 Sep 2025 00:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756962586;
	bh=2ePqsIFvvYXVPKunzCWZj6k6JrCoCIdpXe0VE1H9j9g=;
	h=From:To:CC:Subject:Date;
	b=EwMy7hb6LPeas8NhOMzBlwbpr1jbEbdzD9Iaz5h3PyHSko/zNEkTsu/9HttRw0hlC
	 mzE7pgRYgyZK0XOn9IUbjZsYhbAM5eP9OCritrAPuaIeCVgAgaS5WczexQL3BaM8WM
	 amGfb4Lq6FvjmJ2qKM+larVywwVGr/RCf0w3xT8E=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58459k7n4067249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 00:09:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 00:09:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 00:09:45 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58459eOw2720567;
	Thu, 4 Sep 2025 00:09:41 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-ravikumar@ti.com>,
        <tomi.valkeinen@ti.com>, <a-bhatia1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <aradhya.bhatia@linux.dev>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>
CC: <h-shenoy@ti.com>
Subject: [PATCH RESEND] arm64: dts: ti: k3-j721e-main: Update DSS EDP integration configuration register
Date: Thu, 4 Sep 2025 10:39:40 +0530
Message-ID: <20250904050940.2913567-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_221010_432106_37BF45BC 
X-CRM114-Status: GOOD (  10.59  )
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
Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM

Fixes: 92c996f4ceab ("arm64: dts: ti: k3-j721e-*: add DP & DP PHY")

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index ab3666ff4297..3fa7537d5414 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1863,7 +1863,7 @@ mhdp: dp-bridge@a000000 {
 		 * the PHY driver.
 		 */
 		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
-		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
+		      <0x00 0x04f40000 0x00 0x100>;    /* DSS_EDP0_INTG_CFG_VP */
 		reg-names = "mhdptx", "j721e-intg";
 
 		clocks = <&k3_clks 151 36>;
-- 
2.34.1


