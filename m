Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D215C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xekzjocdp1MXjxXlVQ4pboSffMwk3za4212Kt6FsTKs=; b=IrLCn2dxg/iu5UAT1Glu1u6MuG
	I9MCIlpjw3R8UAsy2OJysiW/Ky0mqxBrbLaiwNIVytRXBeo6oZnjsHjSKcAokxEQL5Sp+x346umAJ
	itvzYA3X2bAUCsynlQ/ZcS+QJ4wz+foxWlxfLIVNUOW26Fj67NPlAeTTPHsob1ag7MVCJryKJPhf+
	8gfk3aRh63hAliMvN9R0wLi4IniSF//wpZfpRMU9NHbZD6moMGos+s7kxo7BIytvDnkOMRzIHnNAt
	Xg1PbdkJexInLhV2YCDISyWQgsR36I5xVY5MB4a0Xu72ZqoB6WDFk6eNYfypzCKLE7AOjhg7XnPDT
	8+C788tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OXp-0000000D184-2FYI;
	Thu, 17 Apr 2025 12:40:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OQY-0000000Cy52-36BX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:33:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCX720012825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893187;
	bh=Xekzjocdp1MXjxXlVQ4pboSffMwk3za4212Kt6FsTKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rUjTaU6/Tlqmug8e6VhP/FwzKQhdunlEhqq/t3ZPkIFCfcZ/wVqPTkLs9XXgjSk+3
	 VQj34lDQlG5hTryikrKP7Xda0+NEr9AaA4AzoYxT2RbTQkWvbmzQmUYp3TNpo0ScYL
	 Oyps/6g0mZ30mwj4yUBip4jNep7IwPQUMdoXOBe8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCX77v094247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:33:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:33:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:33:07 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCWkMS038275;
	Thu, 17 Apr 2025 07:33:03 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-j722s-evm: drop redundant status within serdes0/serdes1
Date: Thu, 17 Apr 2025 18:02:46 +0530
Message-ID: <20250417123246.2733923-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417123246.2733923-1-s-vadapalli@ti.com>
References: <20250417123246.2733923-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053310_864850_F048059D 
X-CRM114-Status: GOOD (  10.08  )
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

Since serdes0 and serdes1 are now enabled by default within the SoC
file, it is no longer necessary to enable them in the board file.

Hence, remove the redundant 'status = "okay"' within the serdes0 and
serdes1 device-tree nodes.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---

This patch doesn't have a v2 and has been newly introduced in this
series.

v1 of this patch is at:
https://lore.kernel.org/r/20250412052712.927626-3-s-vadapalli@ti.com/
Changes since v1:
- Collected Reviewed-by tags from Udit Kumar <u-kumar1@ti.com>.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 0bf2e1821662..34b9d190800e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -848,7 +848,6 @@ &serdes_wiz0 {
 };
 
 &serdes0 {
-	status = "okay";
 	serdes0_usb_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
@@ -863,7 +862,6 @@ &serdes_wiz1 {
 };
 
 &serdes1 {
-	status = "okay";
 	serdes1_pcie_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
-- 
2.34.1


