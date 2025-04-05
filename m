Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D706BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfuHzB09gQzDVN1YPTwSbJ0e9xT70zByEt80tSecGcE=; b=YlCCChxeg3rOn1ivY0uXSk5iqf
	rFx3xySFtO4PGxzv94F6QEqLWvKn9Z3zih0j2z86lSTCCqKhvPHNSyA2nrw9iaVN5Mud6DSxIlbFA
	kAgRiFkT/mUYcb1WtmuwilerxpQBvlAa4+fWx6gZyvHISSXoa05xdsNGA2KyeeMRYklodGqNL7/9h
	dTL8GW19eehaaAKh2yVdeAaaqa+vbRL8uRGczGyGiZLL72PrQLoEDBnuMio/aFrTx0P5p/IIdfEpH
	b7kWUFaUbbxX1u3564Vg5G3lh8+uzvTteXsbrtcttrLMGUdUKP4OmuHEVbFV8O+sq7FOEdJBLhjqG
	cZvkPETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rGA-0000000DBTq-07LC;
	Sat, 05 Apr 2025 00:19:42 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rC0-0000000DAR2-3XFS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:15:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FI7Y3922102
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812118;
	bh=KfuHzB09gQzDVN1YPTwSbJ0e9xT70zByEt80tSecGcE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YANhNrHVHj4DJUR7MXUR0rke7qm5LsA6BzZAjWKxPX7z6b6wh67URXubJBSNCsNkV
	 aimEk9dMig4rUhaa5MmG/7BxgkVAfWoC5GJfFdkcgo4IaOQH1tHVznvUZHJ8LrXQcy
	 uyabcLZXBbnIIMFEw3tWgYWdQfqcr7iHorHvPob4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FIdD038155
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:18 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5a065952;
	Fri, 4 Apr 2025 19:15:18 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
Subject: [PATCH v6 01/11] arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges
Date: Fri, 4 Apr 2025 19:15:08 -0500
Message-ID: <20250405001518.1315273-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405001518.1315273-1-jm@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_171524_966505_7096F431 
X-CRM114-Status: GOOD (  10.03  )
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

Add cbass ranges for ATCM and BTCM on am62x device, without
these, remoteproc driver fails to probe and attach to the DM
r5 core and IPC communication is broken.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index bfb55ca113239..59f6dff552ed4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -86,7 +86,9 @@ cbass_main: bus@f0000 {
 			 /* Wakeup Domain Range */
 			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
-			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
+			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
 
 		cbass_mcu: bus@4000000 {
 			bootph-all;
@@ -103,7 +105,9 @@ cbass_wakeup: bus@b00000 {
 			#size-cells = <2>;
 			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
-				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
+				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
 		};
 	};
 
-- 
2.49.0


