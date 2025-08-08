Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D2BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl3QejqPun2r+LOsmnN/PgiHG24NsWIeEiLN8ztW+jA=; b=QhqINe8JOCFift4WHn5zUz/Fg6
	QfAtL6wor8xDtP5bQsWlrZsABBSQFSrI6+IkT5n81g7hgW9FnOXPULMNoCmCYb2SrFK8qb6lG8vhd
	uLxW8MMnwakLUwUeIs/XHiSIdXhcMbb9yOjIwSku7VWLruHKi7CSrpbA4qOBu8J0DMg2rXgBNUluW
	PiF6l3ssJexE31CsmZblkceTo8zCW7UMGbgkUqLx+4QPvmN+KJzlg2f6um9UTxFy73+rWwZEBSl39
	Vr0t11/qHl6RvkjNjWqfTrWPYcY6yv5pCu5UeaQ4SB8zsxAauwdyxDo/pUd8BLtzjHCqV6j4GUOFU
	nHWu3GOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukXEy-00000003vIt-2IvG;
	Sat, 09 Aug 2025 00:15:16 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukWTX-00000003rlD-3bGI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 23:26:17 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578NQ315695282;
	Fri, 8 Aug 2025 18:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754695563;
	bh=Zl3QejqPun2r+LOsmnN/PgiHG24NsWIeEiLN8ztW+jA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sMIbK83Ab2o6pce6IRt8cSr9ECtZDbR/t7qh2sh5ojhHGWkpaHl1SQQIgnsrQukeU
	 xq5G5ld1lm4kz8kBQpGUVy2gVxqivCvg4xEgBuWHI9wbnfhkNg7wYdOuWH2FcnEVPd
	 n6Ae6P8yKTBaaGYr4Y9RMdEF5qWyBR+/GjI8KQ20=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578NQ2RV1922250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 18:26:02 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 18:26:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 18:26:02 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578NQ2Rv3452261;
	Fri, 8 Aug 2025 18:26:02 -0500
From: <rs@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <d-gole@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <detheridge@ti.com>,
        <matt.coster@imgtec.com>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the bxs-4-64
Date: Fri, 8 Aug 2025 18:25:22 -0500
Message-ID: <20250808232522.1296240-3-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808232522.1296240-1-rs@ti.com>
References: <20250808232522.1296240-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_162615_943451_862B896E 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Randolph Sapp <rs@ti.com>

Add the relevant device tree node for Imagination's BXS-4-64 GPU.

These devices uses a similar MSMC configuration to the J721S2. As such,
they also require the use of the dma-coherent attribute.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 7c5b0c69897d..a44ca34dda62 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2691,4 +2691,18 @@ bist_main14: bist@33c0000 {
 		bootph-pre-ram;
 		ti,sci-dev-id = <234>;
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 181 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 181 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };
-- 
2.50.1


