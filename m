Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAC6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ep8qmI0zXfj+LtOdwloUGJBu5JebRS6+Bn3LdL4sFYM=; b=S3dHLHCj/hxAVtos7CXnx4uMo4
	HIcm8scO9JofwwLUcZH5MowQ3xSxomPAb3eLi3yrAgncJzSW2OSlIrCrXDKxi4fWDDdVIdJ3oR8Qp
	+qthg0kNcWgHO9abhXqZp33Q6WZI7INCpITKzj4VmdFtBwav5eYuryDiFNRqIUXp1sN+BYUsa9y5b
	g5ILpKpumQIBz7L1mgPk4UPvtI40c4Zdp7E0w4HBxZBhMyZczXX1FQlHP8ClWW3GhH/cGlzjLaLGx
	BKAadHtn7APvgxBVy5mKjxHTCMuiyi+MDtPxdI9FtyeCWcUpFRBQdB8SSoGOf6i1Uw1Bs4xslYYcI
	iHD2CAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKcx-00000003Ce1-0gri;
	Fri, 09 May 2025 10:06:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJtJ-0000000350h-3Cu6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:19:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JV9r1360986
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 04:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746782371;
	bh=ep8qmI0zXfj+LtOdwloUGJBu5JebRS6+Bn3LdL4sFYM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aIkOI6UFMxkKpGMdY/6FIN+PxT6gzaE4ds0jtey6HvL0ftMmYJPI8rS2bl6T+pQ/K
	 SFePRq9oFAlOnhFz2x5pdGjBKHvnPTG7OOHpZkIjOcQ+x3zSqZj5qjFOgk+MjHHY/V
	 AO/RvQyFxbl1evCDhncT6RkxzWbH1mo1apGLW7TQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JVdK027928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 04:19:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 04:19:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 04:19:30 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5499JL7s070287;
	Fri, 9 May 2025 04:19:27 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v3 1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
Date: Fri, 9 May 2025 14:49:08 +0530
Message-ID: <20250509091911.2442934-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
References: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021937_891750_7DB6767A 
X-CRM114-Status: GOOD (  11.82  )
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
Reviewed-by: Udit Kumar <u-kumar1@ti.com>

[1]: https://www.ti.com/lit/zip/sprr495
---
Changelog:
Changes in v3:
- Change vcc_3v3_exp to vsys_3v3_exp as per schematics

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 34b9d190800e..2213993acbc9 100644
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
 
+	vsys_3v3_exp: regulator-TPS22990 {
+		/* output of TPS22990 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_3v3_exp";
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


