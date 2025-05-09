Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7998C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoLYLwLT+B43IHFMa2nHyDWREdBWwB5fKOnCamiqucU=; b=A6iiUzQxRB08u83FypgcptoXpQ
	n2gCejee4MdsGGWuoYYD4GzWqjQ7Tg/iNaNTKxId81TQn8gv+fa9amUUGGmFggrnwvM3uRWMRpYXq
	iBe9w6DsdEEsIayZSzkmaK+O1Ea+LJrExm3BWXTCe+mwmdWdfXi9pqms778I2xkf1k3VPyzdGzcDw
	5P6M/fpf6mxfxqEj/0Y8FtooD/4hMHBaegu/QIJufpW/FsRFWlbv8gK6SpzgY6UOC7IGWezt3PRLf
	4GbhNt2ufMRp4WpRsVYYmUo1hRg/PL08khc7FWOnTjNzNF1QF8mziOhhZWWeQb1lVwi8NmjKqVELG
	PXCY0Mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKgq-00000003DKe-2HuH;
	Fri, 09 May 2025 10:10:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJtO-0000000351w-146T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:19:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JalR1350858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 04:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746782376;
	bh=uoLYLwLT+B43IHFMa2nHyDWREdBWwB5fKOnCamiqucU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aq8crRlOozvzXWdkVEMmwV5dHUC2KI6NuR0B/OilGzFFaMeu3tFrGkeE1QgzskiZ3
	 CmROepyB2prowXN+sfNwHu07HJjnoBHjuSsHQ4C+Iu2sxCb68xNL5F4W65T6X2d7Lo
	 4RFVIHnblLDPU5Omw6NBkRuelcsJvMxP47RgfNWE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JatQ123911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 04:19:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 04:19:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 04:19:35 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5499JL7t070287;
	Fri, 9 May 2025 04:19:32 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX
Date: Fri, 9 May 2025 14:49:09 +0530
Message-ID: <20250509091911.2442934-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
References: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021942_380703_B93C5533 
X-CRM114-Status: UNSURE (   9.96  )
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

J722S EVM has the CSI2RX routed to a MIPI CSI connector and to 22-pin RPi
camera connector through an analog mux with GPIO control, model mux so
that an overlay can control the mux state according to connected cameras.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
Changelog:
Changes in v3:
- Change "model that so that" to "model mux so that" in commit message

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 2213993acbc9..a47852fdca70 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -266,6 +266,20 @@ transceiver2: can-phy2 {
 		max-bitrate = <5000000>;
 		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
 	};
+
+	csi01_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
+
+	csi23_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 7 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
 };
 
 &main_pmx0 {
-- 
2.34.1


