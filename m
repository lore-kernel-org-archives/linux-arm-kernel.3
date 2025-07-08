Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB9EC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mxl6kC3SyfXYPZI+86oINoVU7EXBLmnBKdgbQsXZOjA=; b=He88x6jrzLHZopM/xWWDDjW96r
	ufN76w2KWd1WghIKbamtXiPOE6INWghI0a6+TWINug6xwP2eU/BjkpDOVUr6BYC6FoDRxNmhWKyeJ
	8TxFyoyWr5jkQVeHoiby1dbsqjFpICUrXPmxw3bzpeqlpYjL2so6acrOY9WiDSkKLGrliWZj5BZIU
	JHJBAILMWmW7dZBFjOnPSjIhVt53DBVfdRMLrM7pQ3C3Xp9mPy7bkcsR9c4h6GtDZ7PDK6lQZ/IDN
	zM/150hzmoZ09MPa3k4Ym4mbMPC9p6TDPUCTTRblPb8+mfQlGcLZjqsMZ1XvfvwnOciuG0JZoN3Ru
	84dC2WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6yx-00000005FIb-3IpN;
	Tue, 08 Jul 2025 11:59:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6fw-00000005DQ6-371M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 11:39:54 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 568Bdl3m499007;
	Tue, 8 Jul 2025 06:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751974787;
	bh=mxl6kC3SyfXYPZI+86oINoVU7EXBLmnBKdgbQsXZOjA=;
	h=From:To:CC:Subject:Date;
	b=BWou2GPZiXLNX6iFcYbiJ66NJeRYAT2o/7GJQcEGFjh5LF+a948tDU0EpgTuQOcZ7
	 /JzM2QaHJoxKVQmKDnuCgM5MmwWVVqMlpSlSGqjj7odxSM6cz5RFb72tgXHP5ifWGH
	 swdoKqvMT0HwKdnWMsj/SEfG9c+yJygkvUf8Zbmk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 568BdlZM3229883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 06:39:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 06:39:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 06:39:46 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 568Bdgqi1700412;
	Tue, 8 Jul 2025 06:39:43 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining SERDES instances
Date: Tue, 8 Jul 2025 17:09:42 +0530
Message-ID: <20250708113942.4137917-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_043952_909606_F95A361E 
X-CRM114-Status: GOOD (  12.51  )
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

In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
"serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
property. But "idle-states" is defined only for the lanes of first two
SERDES instances. SERDES lane mapping is left at its reset state of
"zero" for all four lanes of SERDES2 and SERDES4. The reset state of
"zero" corresponds to the following configuration:

Lanes 0 and 1 of SERDES2 are unused
CPSW MAC Ports 1 and 2 mapped to lanes 2 and 3 of SERDES2
EDP Lanes 0, 1, 2 and 3 mapped to lanes 0, 1, 2 and 3 of SERDES4

For completeness, define the "idle-states" for the lanes of remaining
SERDES instances.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
26ffb3d6f02c  Add linux-next specific files for 20250704

Changes since v1
As pointed by out by Siddharth, setting lanes of remaining SERDES
to "unused" will cause regression on AM69-SK as these lanes are used
by CPSW and Display. Updated patch to set the desired values for
remaining serdes lanes.

Rebased on current next.

v1: https://lore.kernel.org/all/20250609115921.2380611-1-h-salunke@ti.com/

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..e803fa139b73 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -1294,8 +1294,12 @@ partition@3fc0000 {
 &serdes_ln_ctrl {
 	idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>, <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
 		      <J784S4_SERDES0_LANE2_PCIE3_LANE0>, <J784S4_SERDES0_LANE3_USB>,
-			<J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
-			<J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>;
+		      <J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
+		      <J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
+		      <J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
+		      <J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>,
+		      <J784S4_SERDES4_LANE0_EDP_LANE0>, <J784S4_SERDES4_LANE1_EDP_LANE1>,
+		      <J784S4_SERDES4_LANE2_EDP_LANE2>, <J784S4_SERDES4_LANE3_EDP_LANE3>;
 };
 
 &serdes_wiz0 {
-- 
2.34.1


