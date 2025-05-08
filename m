Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A47C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkRgnerI36b6HY4HkOyt64j/523Zu+/FuRNnOX/SiVU=; b=XHWFh+L4llO62j506/vPMCQ0eO
	VRY6ixGYtVCQlkpuFHMEmQ7rppOgUiwro+4QzSc06v8vd+zZz6b60RVZGDP56X40wwlUOAiuNPyH5
	fpaeh3nfEdepJ+0ko/4gmI7auRndf+bWaF7NygUOM7Q/CIq0EMaIKqaTkIJdG6SCprYjbumKJt80m
	qtfHPFPPtX8W3pMGuzD8EG+wJgrktUBN3hwsuzPak7Ny0AsXhFBnaKKpr4xZsaWRtyd5LbwMt4eM6
	Sly2oiG2XSgrKuYzCQ9ikgCYHPWtl3n2E9D8XfJDSJNt+qnzZHVxXzgmSRIEd8VKH62Q5I7BVbdCd
	fnKxVC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vW-00000001Mji-46HU;
	Thu, 08 May 2025 17:20:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Xu-00000001CFH-39XD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:52:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqDse1703887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719533;
	bh=zkRgnerI36b6HY4HkOyt64j/523Zu+/FuRNnOX/SiVU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YHwFXXnr4fOELaKYHk/U08lGuFNTXHVKouN4qlQWfFLD3HTEGnQA+SxmgR4YArG0a
	 NkgYTuc+qxstuKAAN+Xhu1PCKmvgu9z2Kd8LFwZtrdPlBYa/aQFmGi2RGkt02lqJMG
	 kInUO9MijHRiyPJq6fnPAZLl6qnGFMei5Zgwa6Jc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqD6x027835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:12 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oL050794;
	Thu, 8 May 2025 10:52:09 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
Date: Thu, 8 May 2025 21:21:31 +0530
Message-ID: <20250508155134.2026300-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085226_880285_7153CCB1 
X-CRM114-Status: GOOD (  11.18  )
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

Add device tree nodes for two regulators on the J722S-EVM. VSYS_3V3 is the
output of LM5141-Q1, and it serves as an input to TPS22990 which produces
VSYS_3V3_EXP [1]. VSYS_3V3_EXP serves as vin-supply to CSI RPI Connectors.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

[1]: https://www.ti.com/lit/zip/sprr495
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 34b9d190800e..0f18fe710929 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -141,6 +141,17 @@ vsys_5v0: regulator-vsys5v0 {
 		regulator-boot-on;
 	};
 
+	vsys_3v3: regulator-vsys3v3 {
+		/* output of LM5141-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_mmc1: regulator-mmc1 {
 		/* TPS22918DBVR */
 		compatible = "regulator-fixed";
@@ -153,6 +164,17 @@ vdd_mmc1: regulator-mmc1 {
 		bootph-all;
 	};
 
+	vcc_3v3_exp: regulator-TPS22990 {
+		/* output of TPS22990 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_exp";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_3v3>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_sd_dv: regulator-TLV71033 {
 		compatible = "regulator-gpio";
 		regulator-name = "tlv71033";
-- 
2.34.1


