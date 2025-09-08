Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E6CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5FD+MoRxRPOTyFKx1rY9IYjAvYQnJl2/VowkMUFuJI=; b=f18MxkqVr1+hFslKFwdCiGv1mf
	yKlr6sIAO6n+YEzSKmref1ZF7Gf8tkLBZBVnuADmS3gRcm4FhEKv6zn8bN/mMnDgzYFCye6kkSmSl
	7LjhO1QcOFOLKVnn5fbBBmclJSzKuLAwau1GoCRBrQcxV254N8tY60UMaxIT/plZO4sJQ9AshV2lx
	64UdCuA2F/EWWVFust2DriVxp+OuoWeYE6xGRsuwM9IzBSP5MruJBfnW4zsG11fxLFMKxx6y2xC3J
	9mYnwPCteE2PVXRsLAX3u5U1ri0js0ebPrikO5XKGQCXPTL0tWKrAQKA52UFlskRGIitkxTF/nOsQ
	+qj7l13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPJ-000000015wy-3HqX;
	Mon, 08 Sep 2025 17:11:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcrz-000000006nt-3hsI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:29:25 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ETKVN071249;
	Mon, 8 Sep 2025 09:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341760;
	bh=d5FD+MoRxRPOTyFKx1rY9IYjAvYQnJl2/VowkMUFuJI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XADLn1ZFBhcH83k13mFr5Ec+1zsFZJ9uFKPammxpXtFZErIgTzK1QwAfGh0Q/ifZy
	 PjfDU9cPDSJeVRuFtdUgML3f4x5Q/Z6erc31ERW6vCrCr0aoLglpZM2BCCQR4d4RnD
	 Ms34CXfrxay5tqeJO+OCGI6E/MhlNX9cdT7Bh7t0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ETKdP3063609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:29:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:29:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESeci1037553;
	Mon, 8 Sep 2025 09:29:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: [PATCH v4 06/34] arm64: dts: ti: k3-am62: Enable remote processors at board level
Date: Mon, 8 Sep 2025 19:57:58 +0530
Message-ID: <20250908142826.1828676-7-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_072924_009720_EF4C1E77 
X-CRM114-Status: GOOD (  10.15  )
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

Remote Processors defined in top-level AM62x SoC dtsi files are
incomplete without the memory carveouts and mailbox assignments which
are only known at board integration level.

Therefore, disable the remote processors at SoC level and enable them at
board level where above information is available.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
Tested-by: Wadim Egorov <w.egorov@phytec.de>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---
v4: Changelog:
1. Carried R/B tag.

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-7-b-padhi@ti.com/

v3: Changelog:
1. Carried A/B, T/B, R/B tags.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-7-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 21/33] to [PATCH v2 06/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-22-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi      | 1 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 10e6b5c08619..dcd22ff487ec 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -407,4 +407,5 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index 6549b7efa656..75aed3a88284 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -128,6 +128,7 @@ wkup_r5fss0_core0: r5f@78000000 {
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <121>;
 			ti,sci-proc-ids = <0x01 0xff>;
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 13e1d36123d5..840772060cb1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -506,6 +506,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &usbss0 {
-- 
2.34.1


