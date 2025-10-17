Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC20CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9a2L6fDOfn1ihmucqn3ZAsprxTkzN4huoeiwg5B90Ds=; b=btdl2HJ1iQieiYe4sm+qjOOgsC
	ajpYWKswA5UkvhQoGRc4h26gXOwSetu4raAKlHaR6faCRYQccab3J6BHlYk6xVT8vE2eYooTvov1N
	UlnN/TSz89C5GCFPtg3/3JmfTrp4YDMwhS2iZ53zAaNfUuWCHTiShz3vXko60C56F1cb/iUWGkBz3
	quOHwFVp1qBPJ+lXX1ZszbnQD6uWKa7KpbwS6SAB/wazUYnupTaBSCz1AoRBNK997VCCy86fBw8S/
	A9qiNNe2x+E7dp3UMvZPvhsyt3MrNiHIjvoW+C86hFKiv1LF3VQco7e+UtCY9dUXGMfvTnbTCMQNR
	oD/EUJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g7M-000000077Hu-12Pp;
	Fri, 17 Oct 2025 08:47:20 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g7I-000000077En-169Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:47:17 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59H8l92U2320881;
	Fri, 17 Oct 2025 03:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760690829;
	bh=9a2L6fDOfn1ihmucqn3ZAsprxTkzN4huoeiwg5B90Ds=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FfuNIUwnt+2vZjJRHTxSs87EfOpWeb5y3XwMqmqGdWpetnmimnNAMlhZd4MizybsB
	 tyO1KSQQjpuTclGmNVfHsVrBdvzrDuTxkE+UMC2Rd91vl+gbr+y+S6Ucu1/HzU5zwI
	 Ata9KP2bqd/WIzmEGMegPrTKFtW68Tr8VRq53xDQ=
Received: from DFLE201.ent.ti.com (dfle201.ent.ti.com [10.64.6.59])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59H8l95p2282517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 03:47:09 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 03:47:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 03:47:09 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59H8ktEW1019203;
	Fri, 17 Oct 2025 03:47:06 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to "pcie1_ctrl"
Date: Fri, 17 Oct 2025 14:16:54 +0530
Message-ID: <20251017084654.2929945-4-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017084654.2929945-1-h-salunke@ti.com>
References: <20251017084654.2929945-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_014716_368261_618C50FF 
X-CRM114-Status: UNSURE (   9.38  )
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

J784S4 SoC has two instances of PCIe which are PCIe0 and PCIe1. J784S4
SoC uses PCIe1 instance for PCIe boot process. To configure PCIe1 at
all boot stages "pcie1_ctrl" also needs to be present at all boot
stages. Thus add the "bootph-all" boot phase tag to "pcie1_ctrl" device
tree node.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 31a8dea2fa8f..3a6e69f88126 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -985,6 +985,10 @@ &dss {
 				 <&k3_clks 218 22>;
 };
 
+&pcie1_ctrl {
+	bootph-all;
+};
+
 &serdes_ln_ctrl {
 	bootph-all;
 };
-- 
2.34.1


