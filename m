Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB83E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKCYMmIFPGTevk1M+TLdbDXaK0IumqN4N8D9eli0/eA=; b=eCIWynWeizEzkQOpGKeyrTH/LZ
	/HBUeBFtBMH7Ce8fZhA3HGiGpucWumqNtTBQs4VppL7yXkEH3ChZPhDWMW5TBtyeTdstR9avYYCC1
	HolbtLptJ6Tt8V4yBSz5DG/fQHwlYR6mcJOLr/SVIbP8B4hhwXakDw0HaeS9Qbh7veA9QjvedIZXZ
	QFnwAMp3MNGwds387uI+Vorhi22m1/ACLNptuKSq5EPV/SzOHuDKIOHoreS4Sf1UTrjp8AP6Nb3t6
	+l59rllJeqq6kc2rIlLF9L1Q0TLHV2bvLm6P9S1On8fSZOmm7GD5k59Ea+1l3SLCvM3XITVcqkzWz
	NZdAYv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCHD-0000000ExYC-0GIJ;
	Fri, 10 Jan 2025 10:30:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWC6Y-0000000Ev7e-13lw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:19:03 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AAIv1f086443;
	Fri, 10 Jan 2025 04:18:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736504337;
	bh=UKCYMmIFPGTevk1M+TLdbDXaK0IumqN4N8D9eli0/eA=;
	h=From:To:CC:Subject:Date;
	b=DRvAv0b5grdp54++pvQYPvIsXqAAMCVkRWo1k4nvcmP5k5L+cSPqUGK5KStBRjg+A
	 DVr8YoAuq5hBlgdlPeoFIEmq6IqDf3KMvt18KxbKu6ZS2nDfrOb9xeCfTa73utF9Od
	 UiIkJVp/ELzAwSb4ahP7ohN074ZArrEcQZLCDEnk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAIv6Y103098
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 04:18:57 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 04:18:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 04:18:56 -0600
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.180])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AAItBT056820;
	Fri, 10 Jan 2025 04:18:56 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <s-vadapalli@ti.com>, <c-vankar@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j784s4-evm:quad-port-eth-exp1: Remove duplicate hogs
Date: Fri, 10 Jan 2025 15:48:55 +0530
Message-ID: <20250110101855.156136-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_021902_420705_31E3DEFA 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
of audio support.
Remove duplicate gpio-hogs from the overlay dtso to prevent mux probe
failures leading to can-phy3 deferred probe:
'gpio-mux mux-controller: probe with driver gpio-mux failed with error -16'

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

GPIO 13 and 15 are set to high in k3-j784s4-evm.dts in exp2 node
as gpio-hog and GPIO 14 is set to high using idle-state in mux1 node.

Log with probe issue:
<https://gist.github.com/Jayesh2000/861ba647dfaec2dd8ed745a5b8d002e4>

Log with this fix:
<https://gist.github.com/Jayesh2000/73d59504d52a36bb31fe49a4faae2693>

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


