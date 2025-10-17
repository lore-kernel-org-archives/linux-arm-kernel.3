Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E33DCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqonKPjynlzAg2tpJmTeutIHA66gcJm6tk1HkkdCnUA=; b=JOdsNvh4AgPjLDjPj7VgJ9jCD5
	Sjl43QsTgFlbZd1yWbMRz2Ls9DJ4x+K+TtmhoR7PQBnXCDTjcpczbwUdTzz3yMqGwMN/QKCT2sv0A
	cwz0GgYdOHVnJlax6G5KSMJPoU4KjuX0hknZQRtDRYv92vm/UM8N1gI5Hj0loRQ34EUe0/vF4rHZU
	21OFa7w4aC9k30BUeM6Zi+zh4DTj3HPL+m0KdUwVNMc6A0Ay+MVNH7ajdn27Cn2VjWEAKTqxFJkhg
	hUuFdXpElYScguu7Fj3BDVBaAYIikxpEN7k3/y1zUTVvAH2CB40WJNi5ZuKljhvBEuxF3GnkNoDdh
	rreWs0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g7L-000000077HG-3kGr;
	Fri, 17 Oct 2025 08:47:19 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g7I-000000077Ei-01Ok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:47:17 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59H8l6Vm2228036;
	Fri, 17 Oct 2025 03:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760690826;
	bh=UqonKPjynlzAg2tpJmTeutIHA66gcJm6tk1HkkdCnUA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tIKmWjWWPrckJpT6AP4BauHl1WV5i42Jm9Za7VygCcGFPo4A4DxSxTUCGGfYO0AoQ
	 xxZUpEJKqm2s4lCnkJ1x0tqfSygCovRBdRpR0WvOx6IUYkidmMAkG4ke4g+1kofO72
	 yIdHYXdRJbGYkSPMxJQ4Ye3SkubSFWR7eisLCR4s=
Received: from DLEE207.ent.ti.com (dlee207.ent.ti.com [157.170.170.95])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59H8l6YA2271184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 03:47:06 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 03:47:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 03:47:05 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59H8ktEV1019203;
	Fri, 17 Oct 2025 03:47:02 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to SERDES0
Date: Fri, 17 Oct 2025 14:16:53 +0530
Message-ID: <20251017084654.2929945-3-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017084654.2929945-1-h-salunke@ti.com>
References: <20251017084654.2929945-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_014716_104156_5C185283 
X-CRM114-Status: GOOD (  10.40  )
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

J784S4 SoC has two instances of PCIe which are PCIe0 and PCIe1. PCIe1
instance is used for PCIe boot process. J784S4 SoC has four instances
of 4-lane SERDES. Out of which SERDES0 is used as PHY for PCIe1. So it
needs to be functional at all stages of PCIe boot process. Thus add the
"bootph-all" boot phase tag to nodes required to enable SERDES0 at all
boot stages.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 419c1a70e028..31a8dea2fa8f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -970,6 +970,7 @@ adc {
 &serdes_refclk {
 	status = "okay";
 	clock-frequency = <100000000>;
+	bootph-all;
 };
 
 &dss {
@@ -984,6 +985,10 @@ &dss {
 				 <&k3_clks 218 22>;
 };
 
+&serdes_ln_ctrl {
+	bootph-all;
+};
+
 &serdes0 {
 	status = "okay";
 
@@ -993,6 +998,7 @@ serdes0_pcie1_link: phy@0 {
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_PCIE>;
 		resets = <&serdes_wiz0 1>, <&serdes_wiz0 2>;
+		bootph-all;
 	};
 
 	serdes0_usb_link: phy@3 {
-- 
2.34.1


