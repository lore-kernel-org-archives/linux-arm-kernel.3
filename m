Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2PQNGbx1rAHwadKibrq3wCWuAbQcos6Zh7efS+DiTU=; b=jpnLIkYg5XZ22epbEs6G7ZCjrw
	oPzGEouARflwpZvUAfnwBVBnBAZcTAiA0Ow7wYvcvAwOBYaAfLOkqJxFev0XX25Wj7ajQDUbDACJ4
	uQ/3xfbtpA78ZHmOegKofFE/oTRc5q1lVTuV8DRuusySb+lssMj7Qtt7qKjQ+fGh/t28xtrtV5Z/r
	69xAvBRg3p1LHmt4KIhNMSSeGO/SW+0H2coMikT171r6J6ivJVXUwdiTjmlldO5o73Y1XsdLKXVL8
	lBLJQwfUp5PI8RcG1fn3WdggB7V875X5eeJ4Lq6BXJMuQIyWPF0ZHBh+p+hOp5xWmdiepS5E1eOHA
	LHiT4aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCjp-0000000F2Vm-2t2s;
	Fri, 10 Jan 2025 10:59:37 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCiF-0000000F2CQ-04fv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:58:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAvtwS3300797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 04:57:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736506675;
	bh=I2PQNGbx1rAHwadKibrq3wCWuAbQcos6Zh7efS+DiTU=;
	h=From:To:CC:Subject:Date;
	b=igIJdFlSs4VFIxAKyC0FVeSPRi9vfxYJAZdS/8aK1Oho9bN8oaDWIykrUI9JnGxrS
	 JUSsKgWpeFXo9r5nfy9iTiW8FPLsbb8oLZWdeEnPjj79CRP/lGf4mgXy/+hNMgl5jf
	 bkG+SLUzsJq+mBUp9Q6M69fJlQ1WcgIIHEPcCLTk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAvtQK068008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 04:57:55 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 04:57:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 04:57:54 -0600
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.180])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AAvrxo094319;
	Fri, 10 Jan 2025 04:57:54 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <s-vadapalli@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <c-vankar@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4-evm-quad-port-eth-exp1: Remove duplicate hogs
Date: Fri, 10 Jan 2025 16:27:53 +0530
Message-ID: <20250110105753.223049-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_025759_145273_B54F575C 
X-CRM114-Status: GOOD (  10.09  )
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

The j784s4-evm board dts now has the gpio hogs for MUX2 after integration
of audio support. Remove duplicate gpio-hogs from the overlay dtso to
prevent mux probe failures leading to can-phy3 deferred probe:
'gpio-mux mux-controller: probe with driver gpio-mux failed with error -16'

Fixes: 479112c9f531 ("arm64: dts: ti: k3-j784s4-evm: Enable analog audio support")
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

GPIO 13 and 15 are set to high in k3-j784s4-evm.dts in exp2 node
as gpio-hog and GPIO 14 is set to high using idle-state in mux1 node.

Log with probe issue:
<https://gist.github.com/Jayesh2000/861ba647dfaec2dd8ed745a5b8d002e4>

Log with this fix:
<https://gist.github.com/Jayesh2000/73d59504d52a36bb31fe49a4faae2693>

Changelog v1->v2:
- Add Fixes tag
- Fix typo in commit heading
- Pick up R-by

v1 patch:
<https://lore.kernel.org/all/20250110101855.156136-1-j-choudhary@ti.com/>

 .../boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtso      | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtso
index dcd2c7c39ec3..c1f9573557d0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtso
@@ -102,13 +102,6 @@ qsgmii-line-hog {
 		gpios = <16 GPIO_ACTIVE_HIGH>;
 		output-low;
 	};
-
-	/* Toggle MUX2 for MDIO lines */
-	mux-sel-hog {
-		gpio-hog;
-		gpios = <13 GPIO_ACTIVE_HIGH>, <14 GPIO_ACTIVE_HIGH>, <15 GPIO_ACTIVE_HIGH>;
-		output-high;
-	};
 };
 
 &main_pmx0 {
-- 
2.34.1


