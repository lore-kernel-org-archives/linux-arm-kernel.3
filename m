Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061BC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYFZcgedsHbKEWgnA4wyqEy83wP02Zn/Bu9CLJkHjjw=; b=Qdk/gsd3L9j3pWQyzx7KTqEFqg
	i1kvMru216O8zuDXk+wxNkXFa97qCh2zPmyRHRyoGAdbrOg9jaYG9miXedK3o3YzmispNQB3FI4bf
	Hy3xKDQs6U2l8d2hVu7nBZG7qjwxS1bA3S1+Z1SU7L5GihU0G/IwJDVDRQwN6RK13QqSk+thoyunu
	IwG+I7CyuJoYbF9w3v/IXnI+8pcF4Z1ZNmzZro/3Mc2zISLlzVNv3Fjbz1SzS3FgklPjNmmmUaDAW
	Vc8SLrlfAnO8Yr4FNdrWcERY/626SFA5oZSS9UXF65/iWj8xyzF8cfFYqJNDHFfz731jtOmbETAv0
	1+DbHjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5l-00000009cvC-1fcG;
	Wed, 09 Jul 2025 19:04:29 +0000
Received: from mail-vi1eur02on20717.outbound.protection.outlook.com ([2a01:111:f403:2607::717] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWRP-0000000970m-3KFM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmxKxho2lSBiiQqzNrcmgU1N32j3xCutirZBVgS6EnO5xZw9ZtxqgwDgviIhgb+Ziup5DXq5TMb/KEOErTsmnvs8liZ8aMRPD4+Bk8qe3YdGjxC/QhgXw39CRtJiwiqx/4WOPllcz9Taz+VB4Uq/pXIIy8/H4gV1XJFn/4ATfrfclmFRbtINdFwzmT/omm1pBKWk3DZkAbag13WoCmthjNnthQUYSCIxcTHhqL/HuGrVmQAu/FfAmpS3GysKOThSV93UVKLJ4V3eXAEqpdPzWS8CkRUrPYR1t2ypBFW8aQQBRlXSyxXfjv8ccffNvLe0eACGhTwe1g9yNQ8aJEOlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYFZcgedsHbKEWgnA4wyqEy83wP02Zn/Bu9CLJkHjjw=;
 b=wZA2RDifY760bSNoYev8OkM1VHhc8RvcS9hCZ2rL/h/mT+8x7flNLWttmnoaMHMu94leielxK92UDjuUeRirI5TydwoXZu/DItSA+l1qeayv4RaZWRxNvw9byovQcskyKNDMD9+cT418bBsQqcPYQ7Xq3Onaugl7InLkp8HTzCn7evUBD221/2gB2XFCFi8MVjvy6WK6Ry/+XV9EUMndL5SP+v/YKRll1sa5FNxKgnubR3Srr3QaUPSezdyy1zchG5iWhoLwaB3VRhmYomG3dRzzM2D2yRo6t4eaiMHPnbHDi4kzkTW0OXZ3+H03nd5S584O4NrtSuJ9p+FpB7gl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYFZcgedsHbKEWgnA4wyqEy83wP02Zn/Bu9CLJkHjjw=;
 b=ZfoP1crcOWL0NpQHuCTCh55h1jfUqSKOAfIlhwFlS6h79PjBw5rrwU5jPKGDAtx/a5IGjsD7bLGPSDvZGDfeHvnacbO7oPo8ZGhR7Z+7sS2JDWvy5Oz7rxoS4vayZ3JQ2BT0H/038Tl5rAGCAeXtqPjHtIUommgyiAsDM3bbDjo=
Received: from DB7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:52::37)
 by GV1P195MB2638.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 15:10:14 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::46) by DB7PR02CA0024.outlook.office365.com
 (2603:10a6:10:52::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 15:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:13 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:12 +0200
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025070917101244-208 ;
          Wed, 9 Jul 2025 17:10:12 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 02/11] ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
Date: Wed, 9 Jul 2025 17:10:02 +0200
Message-ID: <20250709151011.366537-3-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:12,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:12
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|GV1P195MB2638:EE_
X-MS-Office365-Filtering-Correlation-Id: f2223a7d-4a71-4634-b639-08ddbefab4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/9rJKIaQ4aZPMgOi4troZAvoJUe9MsjcwKrK5PjT4qZbUrJQiOOibB+KuXsM?=
 =?us-ascii?Q?i716K7jnr3vXvBvk+NSKT9SoJwgoVgWYUaAek6yNpqpMxSKmtV7xr0cU4KEW?=
 =?us-ascii?Q?ARKpDO4TLWsY8YUIbHe6NnOSmAaQjF867FA0fFc8zvLcrz4faUg1KfXInGFv?=
 =?us-ascii?Q?dey89I0NFfxR/HaVeLedcoEpmW/xOZXzhuSeQ8c92JhGyMLZ/XcBBLtCZDOe?=
 =?us-ascii?Q?Tf7cfpPOjvgU1ILz5MJoVrn7uodqxHOpn1YWzBSj+/4gk1SJlIPYEjJoV1TS?=
 =?us-ascii?Q?e1lcwwv3whgyALqPQlWsTG0fD5+j4BJcnVXXQFioQTDo0eKRiS9rQz6tEjwI?=
 =?us-ascii?Q?vlPgwDfVyQMoWWZEXUfZhelY72hrPEkpeBS0R6ulzC2HEfjBjwmGT4mBh4AU?=
 =?us-ascii?Q?/uV9AQjARqjTmv+mMUVYRzRnFOJHwRX27zw01TxmlA0aQVAuEqRWc71eiQSs?=
 =?us-ascii?Q?TiiGkAeRG8wDIIJiOK47fCqbh8SDTBWfwIzAktNQHMU2gbP1Ps9bznFaX6z9?=
 =?us-ascii?Q?wXN+x5Un08HyQVHsxlZkbWWQ9ZlpNmD7DQsep4joXnqTiwVi7dF29YGEeLUT?=
 =?us-ascii?Q?sLgNggOwYVGFVsUhGmlD+9G/hSs3tWN7AZuMXHgn3LCxQWoi2ON0ZfMTwFoy?=
 =?us-ascii?Q?JDqZxHdHAkM8dTXv9MDDBCmsBd4FESoF8U6++BgGzN3dwwy9oD70umFgkF3x?=
 =?us-ascii?Q?Kos2Kk1AeuOKc/Vb+GrUccAwgfNMg6VyBPXSh37MyKx5Qf7cy768xK2nIC+X?=
 =?us-ascii?Q?zQBbP/Oi76utEGAx8k/f1jvashswecMRX/y8CVdi3RxVlugQ1pR2i6M1obed?=
 =?us-ascii?Q?MP3ojB5K2YMHi2nXFQ003uJ2jO8Ar2KF1H3cDhsTJSeTy6dflX7V991ffYnX?=
 =?us-ascii?Q?9qpFssqQle/74gRFaCnPMWC9fQDcghv51GUsS/dmzpMKC+DYAo15KDn6c2Ha?=
 =?us-ascii?Q?h6nsDhP0U/cSqMDGnZ2uJFCoJhKsNduaVR4a989y9X1n1HPmJf+rQ2ui42RH?=
 =?us-ascii?Q?oclMqKUXszqbBOObK+aTi3GltexX5O3ymhDFdr3VpPM8lZDiuueVxUrIUBPt?=
 =?us-ascii?Q?KlbEnhxKRxIC6EpCqqq9Xhcj4pr2rInAfHadUOkJtZqHw/AuH+MiM5r4TIYB?=
 =?us-ascii?Q?V4CYt++mMVcXtRiFt6YYzFjKFz209Ps0yf77slUDWVzBURiE8SxuGtUEh5G/?=
 =?us-ascii?Q?TUqUkJ0KIcbkFlwzbsoesUFFRgPxvmjzt4ypUmmkYNYW40PnfxxxfDgcsda0?=
 =?us-ascii?Q?Msq1/+UkJAokJQkBiDPeLJHJ//Si1nMPvHQjnC7lZgkgXTvAWDNrWGhGtQQa?=
 =?us-ascii?Q?xK58NCT4OL+wZu0AHJrZHy6qew/6LABpzLzHpH9s2jCSGYxniRAaDO0pY6hk?=
 =?us-ascii?Q?bB5tNftqKHGXx8W7K+X91ZDx8ZOzkG30to7ZhPaC4PONHzgZPthJgufplE+D?=
 =?us-ascii?Q?BzN5y4/pBZiPJDbl/HQXS2lyah0ZkDLrsfAp+sOWpY9GpEu8NcuehGHI8eu6?=
 =?us-ascii?Q?8fhbm4+UlspSqnGzV6ibExGABTEiEDGvTeKW?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:13.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2223a7d-4a71-4634-b639-08ddbefab4b6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081036_255883_E069531A 
X-CRM114-Status: GOOD (  10.95  )
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

Add stm32mp15xx-phycore-som.dtsi device tree file to split hardware
features between the phyBOARD (baseboard) and the phyCORE (SoM).

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |   2 +-
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 317 +----------------
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 329 ++++++++++++++++++
 3 files changed, 331 insertions(+), 317 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arc=
h/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 26995eb2a619..48adc3462958 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -9,7 +9,7 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
-#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15xx-phycore-som.dtsi"
 #include "stm32mp15xx-phyboard-sargas.dtsi"
=20
 / {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/a=
rm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index ebbb82c09a1e..2fdab99fc562 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -5,23 +5,13 @@
  * Author: Dom VOVARD <dom.vovard@linrt.com>.
  */
=20
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
+
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/leds/leds-pca9532.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
-#include <dt-bindings/net/ti-dp83867.h>
-#include "stm32mp15-pinctrl.dtsi"
=20
 / {
-	aliases {
-		ethernet0 =3D &ethernet0;
-		rtc0 =3D &i2c4=5Frtc;
-		rtc1 =3D &rtc;
-	};
-
 	chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
@@ -42,48 +32,6 @@ key-enter {
 		};
 	};
=20
-	reserved-memory {
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		ranges;
-
-		retram: retram@38000000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x38000000 0x10000>;
-			no-map;
-		};
-
-		mcuram: mcuram@30000000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x30000000 0x40000>;
-			no-map;
-		};
-
-		mcuram2: mcuram2@10000000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x10000000 0x40000>;
-			no-map;
-		};
-
-		vdev0vring0: vdev0vring0@10040000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x10040000 0x1000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@10041000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x10041000 0x1000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@10042000 {
-			compatible =3D "shared-dma-pool";
-			reg =3D <0x10042000 0x4000>;
-			no-map;
-		};
-	};
-
 	sound {
 		compatible =3D "audio-graph-card";
 		label =3D "STM32MP1-PHYCORE";
@@ -93,44 +41,6 @@ sound {
 		dais =3D <&sai2b=5Fport>,
 		       <&sai2a=5Fport>;
 	};
-
-	regulator=5Fvin: regulator {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "vin";
-		regulator-min-microvolt =3D <5000000>;
-		regulator-max-microvolt =3D <5000000>;
-		regulator-always-on;
-	};
-};
-
-&ethernet0 {
-	pinctrl-0 =3D <&ethernet0=5Frgmii=5Fpins=5Fd>;
-	pinctrl-1 =3D <&ethernet0=5Frgmii=5Fsleep=5Fpins=5Fd>;
-	pinctrl-names =3D "default", "sleep";
-	phy-mode =3D "rgmii-id";
-	max-speed =3D <1000>;
-	phy-handle =3D <&phy0>;
-	st,eth-clk-sel;
-	status =3D "okay";
-
-	mdio {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		compatible =3D "snps,dwmac-mdio";
-
-		phy0: ethernet-phy@1 {
-			compatible =3D "ethernet-phy-ieee802.3-c22";
-			reg =3D <1>;
-			interrupt-parent =3D <&gpiog>;
-			interrupts =3D <12 IRQ=5FTYPE=5FEDGE=5FFALLING>;
-			ti,rx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
-			ti,tx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
-			ti,fifo-depth =3D <DP83867=5FPHYCR=5FFIFO=5FDEPTH=5F4=5FB=5FNIB>;
-			ti,min-output-impedance;
-			enet-phy-lane-no-swap;
-			ti,clk-output-sel =3D <DP83867=5FCLK=5FO=5FSEL=5FOFF>;
-		};
-	};
 };
=20
 &i2c1 {
@@ -222,176 +132,6 @@ led-2 {
 	};
 };
=20
-&i2c4 {
-	pinctrl-names =3D "default", "sleep";
-	pinctrl-0 =3D <&i2c4=5Fpins=5Fa>;
-	pinctrl-1 =3D <&i2c4=5Fsleep=5Fpins=5Fa>;
-	i2c-scl-rising-time-ns =3D <185>;
-	i2c-scl-falling-time-ns =3D <20>;
-	status =3D "okay";
-
-	pmic@33 {
-		compatible =3D "st,stpmic1";
-		reg =3D <0x33>;
-		interrupts-extended =3D <&gpioa 0 IRQ=5FTYPE=5FEDGE=5FFALLING>;
-		interrupt-controller;
-		#interrupt-cells =3D <2>;
-
-		regulators {
-			compatible =3D "st,stpmic1-regulators";
-			buck1-supply =3D <&regulator=5Fvin>;
-			buck2-supply =3D <&regulator=5Fvin>;
-			buck3-supply =3D <&regulator=5Fvin>;
-			buck4-supply =3D <&regulator=5Fvin>;
-			ldo1-supply =3D <&v3v3>;
-			ldo2-supply =3D <&v3v3>;
-			ldo3-supply =3D <&vdd=5Fddr>;
-			ldo4-supply =3D <&regulator=5Fvin>;
-			ldo5-supply =3D <&v3v3>;
-			ldo6-supply =3D <&v3v3>;
-			boost-supply =3D <&regulator=5Fvin>;
-			pwr=5Fsw1-supply =3D <&bst=5Fout>;
-			pwr=5Fsw2-supply =3D <&bst=5Fout>;
-
-			vddcore: buck1 {
-				regulator-name =3D "vddcore";
-				regulator-min-microvolt =3D <1200000>;
-				regulator-max-microvolt =3D <1350000>;
-				regulator-always-on;
-				regulator-initial-mode =3D <0>;
-			};
-
-			vdd=5Fddr: buck2 {
-				regulator-name =3D "vdd=5Fddr";
-				regulator-min-microvolt =3D <1350000>;
-				regulator-max-microvolt =3D <1350000>;
-				regulator-always-on;
-				regulator-initial-mode =3D <0>;
-			};
-
-			vdd: buck3 {
-				regulator-name =3D "vdd";
-				regulator-min-microvolt =3D <3300000>;
-				regulator-max-microvolt =3D <3300000>;
-				regulator-always-on;
-				st,mask-reset;
-				regulator-initial-mode =3D <0>;
-			};
-
-			v3v3: buck4 {
-				regulator-name =3D "v3v3";
-				regulator-min-microvolt =3D <3300000>;
-				regulator-max-microvolt =3D <3300000>;
-				regulator-always-on;
-				regulator-initial-mode =3D <0>;
-			};
-
-			v1v8=5Faudio: ldo1 {
-				regulator-name =3D "v1v8=5Faudio";
-				regulator-min-microvolt =3D <1800000>;
-				regulator-max-microvolt =3D <1800000>;
-				regulator-always-on;
-				interrupts =3D <IT=5FCURLIM=5FLDO1 0>;
-
-			};
-
-			vdd=5Feth=5F2v5: ldo2 {
-				regulator-name =3D "dd=5Feth=5F2v5";
-				regulator-min-microvolt =3D <2500000>;
-				regulator-max-microvolt =3D <2500000>;
-				regulator-always-on;
-				interrupts =3D <IT=5FCURLIM=5FLDO2 0>;
-
-			};
-
-			vtt=5Fddr: ldo3 {
-				regulator-name =3D "vtt=5Fddr";
-				regulator-min-microvolt =3D <500000>;
-				regulator-max-microvolt =3D <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd=5Fusb: ldo4 {
-				regulator-name =3D "vdd=5Fusb";
-				interrupts =3D <IT=5FCURLIM=5FLDO4 0>;
-			};
-
-			vdda: ldo5 {
-				regulator-name =3D "vdda";
-				regulator-min-microvolt =3D <2900000>;
-				regulator-max-microvolt =3D <2900000>;
-				interrupts =3D <IT=5FCURLIM=5FLDO5 0>;
-				regulator-boot-on;
-			};
-
-			vdd=5Feth=5F1v0: ldo6 {
-				regulator-name =3D "vdd=5Feth=5F1v0";
-				regulator-min-microvolt =3D <1000000>;
-				regulator-max-microvolt =3D <1000000>;
-				regulator-always-on;
-				interrupts =3D <IT=5FCURLIM=5FLDO6 0>;
-
-			};
-
-			vref=5Fddr: vref=5Fddr {
-				regulator-name =3D "vref=5Fddr";
-				regulator-always-on;
-			};
-
-			bst=5Fout: boost {
-				regulator-name =3D "bst=5Fout";
-				interrupts =3D <IT=5FOCP=5FBOOST 0>;
-			};
-
-			vbus=5Fotg: pwr=5Fsw1 {
-				regulator-name =3D "vbus=5Fotg";
-				interrupts =3D <IT=5FOCP=5FOTG 0>;
-				regulator-active-discharge =3D <1>;
-			};
-
-			vbus=5Fsw: pwr=5Fsw2 {
-				regulator-name =3D "vbus=5Fsw";
-				interrupts =3D <IT=5FOCP=5FSWOUT 0>;
-				regulator-active-discharge =3D <1>;
-			};
-		};
-
-		onkey {
-			compatible =3D "st,stpmic1-onkey";
-			interrupts =3D <IT=5FPONKEY=5FF 0>,
-				     <IT=5FPONKEY=5FR 0>;
-			interrupt-names =3D "onkey-falling",
-					  "onkey-rising";
-			power-off-time-sec =3D <10>;
-		};
-
-		watchdog {
-			compatible =3D "st,stpmic1-wdt";
-		};
-	};
-
-	i2c4=5Feeprom: eeprom@50 {
-		compatible =3D "microchip,24c32",
-			     "atmel,24c32";
-		reg =3D <0x50>;
-	};
-
-	i2c4=5Frtc: rtc@52 {
-		compatible =3D "microcrystal,rv3028";
-		reg =3D <0x52>;
-	};
-};
-
-&ipcc {
-	status =3D "okay";
-};
-
-&iwdg2 {
-	timeout-sec =3D <32>;
-	status =3D "okay";
-};
-
 &m=5Fcan2 {
 	pinctrl-names =3D "default", "sleep";
 	pinctrl-0 =3D <&m=5Fcan2=5Fpins=5Fa>;
@@ -399,46 +139,6 @@ &m=5Fcan2 {
 	status =3D "okay";
 };
=20
-&m4=5Frproc {
-	memory-region =3D <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes =3D <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names =3D "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent =3D <&exti>;
-	interrupts =3D <68 1>;
-	status =3D "okay";
-};
-
-&pwr=5Fregulators {
-	vdd-supply =3D <&vdd>;
-	vdd=5F3v3=5Fusbfs-supply =3D <&vdd=5Fusb>;
-};
-
-&qspi {
-	pinctrl-names =3D "default", "sleep";
-	pinctrl-0 =3D <&qspi=5Fclk=5Fpins=5Fa &qspi=5Fbk1=5Fpins=5Fa>;
-	pinctrl-1 =3D <&qspi=5Fclk=5Fsleep=5Fpins=5Fa &qspi=5Fbk1=5Fsleep=5Fpins=
=5Fa>;
-	status =3D "okay";
-
-	flash0: flash@0 {
-		compatible =3D "winbond,w25q128", "jedec,spi-nor";
-		reg =3D <0>;
-		spi-rx-bus-width =3D <4>;
-		spi-max-frequency =3D <50000000>;
-		m25p,fast-read;
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-	};
-};
-
-&rng1 {
-	status =3D "okay";
-};
-
-&rtc {
-	status =3D "okay";
-};
-
 &sai2 {
 	clocks =3D <&rcc SAI2>, <&rcc PLL3=5FQ>, <&rcc PLL3=5FR>;
 	clock-names =3D "pclk", "x8k", "x11k";
@@ -492,21 +192,6 @@ &sdmmc1 {
 	status =3D "okay";
 };
=20
-&sdmmc2 {
-	pinctrl-names =3D "default", "opendrain", "sleep";
-	pinctrl-0 =3D <&sdmmc2=5Fb4=5Fpins=5Fa &sdmmc2=5Fd47=5Fpins=5Fe>;
-	pinctrl-1 =3D <&sdmmc2=5Fb4=5Fod=5Fpins=5Fa &sdmmc2=5Fd47=5Fpins=5Fe>;
-	pinctrl-2 =3D <&sdmmc2=5Fb4=5Fsleep=5Fpins=5Fa &sdmmc2=5Fd47=5Fsleep=5Fpi=
ns=5Fe>;
-	non-removable;
-	no-sd;
-	no-sdio;
-	st,neg-edge;
-	bus-width =3D <8>;
-	vmmc-supply =3D <&v3v3>;
-	vqmmc-supply =3D <&v3v3>;
-	mmc-ddr-3=5F3v;
-};
-
 &spi1 {
 	pinctrl-names =3D "default", "sleep";
 	pinctrl-0 =3D <&spi1=5Fpins=5Fa>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-phycore-som.dtsi
new file mode 100644
index 000000000000..660cdc260963
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
+ * Author: Dom VOVARD <dom.vovard@linrt.com>
+ * Copyright (C) 2022-2023 Steffen Trumtrar <kernel@pengutronix.de>
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Christophe Parant <c.parant@phytec.fr>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+/ {
+
+	aliases {
+		ethernet0 =3D &ethernet0;
+		rtc0 =3D &i2c4=5Frtc;
+		rtc1 =3D &rtc;
+	};
+
+	reserved-memory {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ranges;
+
+		retram: retram@38000000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x38000000 0x10000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x30000000 0x40000>;
+			no-map;
+		};
+
+		mcuram2: mcuram2@10000000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x10042000 0x4000>;
+			no-map;
+		};
+	};
+
+	regulator=5Fvin: regulator {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vin";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ethernet0 {
+	pinctrl-0 =3D <&ethernet0=5Frgmii=5Fpins=5Fd>;
+	pinctrl-1 =3D <&ethernet0=5Frgmii=5Fsleep=5Fpins=5Fd>;
+	pinctrl-names =3D "default", "sleep";
+	phy-mode =3D "rgmii-id";
+	max-speed =3D <1000>;
+	phy-handle =3D <&phy0>;
+	st,eth-clk-sel;
+	status =3D "okay";
+
+	mdio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@1 {
+			compatible =3D "ethernet-phy-ieee802.3-c22";
+			reg =3D <1>;
+			interrupt-parent =3D <&gpiog>;
+			interrupts =3D <12 IRQ=5FTYPE=5FEDGE=5FFALLING>;
+			ti,rx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
+			ti,tx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
+			ti,fifo-depth =3D <DP83867=5FPHYCR=5FFIFO=5FDEPTH=5F4=5FB=5FNIB>;
+			ti,min-output-impedance;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel =3D <DP83867=5FCLK=5FO=5FSEL=5FOFF>;
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&i2c4=5Fpins=5Fa>;
+	pinctrl-1 =3D <&i2c4=5Fsleep=5Fpins=5Fa>;
+	i2c-scl-rising-time-ns =3D <185>;
+	i2c-scl-falling-time-ns =3D <20>;
+	status =3D "okay";
+
+	pmic@33 {
+		compatible =3D "st,stpmic1";
+		reg =3D <0x33>;
+		interrupts-extended =3D <&gpioa 0 IRQ=5FTYPE=5FEDGE=5FFALLING>;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+
+		regulators {
+			compatible =3D "st,stpmic1-regulators";
+			buck1-supply =3D <&regulator=5Fvin>;
+			buck2-supply =3D <&regulator=5Fvin>;
+			buck3-supply =3D <&regulator=5Fvin>;
+			buck4-supply =3D <&regulator=5Fvin>;
+			ldo1-supply =3D <&v3v3>;
+			ldo2-supply =3D <&v3v3>;
+			ldo3-supply =3D <&vdd=5Fddr>;
+			ldo4-supply =3D <&regulator=5Fvin>;
+			ldo5-supply =3D <&v3v3>;
+			ldo6-supply =3D <&v3v3>;
+			boost-supply =3D <&regulator=5Fvin>;
+			pwr=5Fsw1-supply =3D <&bst=5Fout>;
+			pwr=5Fsw2-supply =3D <&bst=5Fout>;
+
+			vddcore: buck1 {
+				regulator-name =3D "vddcore";
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1350000>;
+				regulator-always-on;
+				regulator-initial-mode =3D <0>;
+			};
+
+			vdd=5Fddr: buck2 {
+				regulator-name =3D "vdd=5Fddr";
+				regulator-min-microvolt =3D <1350000>;
+				regulator-max-microvolt =3D <1350000>;
+				regulator-always-on;
+				regulator-initial-mode =3D <0>;
+			};
+
+			vdd: buck3 {
+				regulator-name =3D "vdd";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode =3D <0>;
+			};
+
+			v3v3: buck4 {
+				regulator-name =3D "v3v3";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-always-on;
+				regulator-initial-mode =3D <0>;
+			};
+
+			v1v8=5Faudio: ldo1 {
+				regulator-name =3D "v1v8=5Faudio";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				interrupts =3D <IT=5FCURLIM=5FLDO1 0>;
+
+			};
+
+			vdd=5Feth=5F2v5: ldo2 {
+				regulator-name =3D "dd=5Feth=5F2v5";
+				regulator-min-microvolt =3D <2500000>;
+				regulator-max-microvolt =3D <2500000>;
+				regulator-always-on;
+				interrupts =3D <IT=5FCURLIM=5FLDO2 0>;
+
+			};
+
+			vtt=5Fddr: ldo3 {
+				regulator-name =3D "vtt=5Fddr";
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd=5Fusb: ldo4 {
+				regulator-name =3D "vdd=5Fusb";
+				interrupts =3D <IT=5FCURLIM=5FLDO4 0>;
+			};
+
+			vdda: ldo5 {
+				regulator-name =3D "vdda";
+				regulator-min-microvolt =3D <2900000>;
+				regulator-max-microvolt =3D <2900000>;
+				interrupts =3D <IT=5FCURLIM=5FLDO5 0>;
+				regulator-boot-on;
+			};
+
+			vdd=5Feth=5F1v0: ldo6 {
+				regulator-name =3D "vdd=5Feth=5F1v0";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-always-on;
+				interrupts =3D <IT=5FCURLIM=5FLDO6 0>;
+
+			};
+
+			vref=5Fddr: vref=5Fddr {
+				regulator-name =3D "vref=5Fddr";
+				regulator-always-on;
+			};
+
+			bst=5Fout: boost {
+				regulator-name =3D "bst=5Fout";
+				interrupts =3D <IT=5FOCP=5FBOOST 0>;
+			};
+
+			vbus=5Fotg: pwr=5Fsw1 {
+				regulator-name =3D "vbus=5Fotg";
+				interrupts =3D <IT=5FOCP=5FOTG 0>;
+				regulator-active-discharge =3D <1>;
+			};
+
+			vbus=5Fsw: pwr=5Fsw2 {
+				regulator-name =3D "vbus=5Fsw";
+				interrupts =3D <IT=5FOCP=5FSWOUT 0>;
+				regulator-active-discharge =3D <1>;
+			};
+		};
+
+		onkey {
+			compatible =3D "st,stpmic1-onkey";
+			interrupts =3D <IT=5FPONKEY=5FF 0>,
+				     <IT=5FPONKEY=5FR 0>;
+			interrupt-names =3D "onkey-falling",
+					  "onkey-rising";
+			power-off-time-sec =3D <10>;
+		};
+
+		watchdog {
+			compatible =3D "st,stpmic1-wdt";
+		};
+	};
+
+	i2c4=5Feeprom: eeprom@50 {
+		compatible =3D "microchip,24c32",
+			     "atmel,24c32";
+		reg =3D <0x50>;
+	};
+
+	i2c4=5Frtc: rtc@52 {
+		compatible =3D "microcrystal,rv3028";
+		reg =3D <0x52>;
+	};
+};
+
+&ipcc {
+	status =3D "okay";
+};
+
+&iwdg2 {
+	timeout-sec =3D <32>;
+	status =3D "okay";
+};
+
+&m4=5Frproc {
+	memory-region =3D <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes =3D <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
+	mbox-names =3D "vq0", "vq1", "shutdown", "detach";
+	interrupt-parent =3D <&exti>;
+	interrupts =3D <68 1>;
+	status =3D "okay";
+};
+
+&pwr=5Fregulators {
+	vdd-supply =3D <&vdd>;
+	vdd=5F3v3=5Fusbfs-supply =3D <&vdd=5Fusb>;
+};
+
+&qspi {
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&qspi=5Fclk=5Fpins=5Fa &qspi=5Fbk1=5Fpins=5Fa>;
+	pinctrl-1 =3D <&qspi=5Fclk=5Fsleep=5Fpins=5Fa &qspi=5Fbk1=5Fsleep=5Fpins=
=5Fa>;
+	status =3D "okay";
+
+	flash0: flash@0 {
+		compatible =3D "winbond,w25q128", "jedec,spi-nor";
+		reg =3D <0>;
+		spi-rx-bus-width =3D <4>;
+		spi-max-frequency =3D <50000000>;
+		m25p,fast-read;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+	};
+};
+
+&rng1 {
+	status =3D "okay";
+};
+
+&rtc {
+	status =3D "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names =3D "default", "opendrain", "sleep";
+	pinctrl-0 =3D <&sdmmc2=5Fb4=5Fpins=5Fa &sdmmc2=5Fd47=5Fpins=5Fe>;
+	pinctrl-1 =3D <&sdmmc2=5Fb4=5Fod=5Fpins=5Fa &sdmmc2=5Fd47=5Fpins=5Fe>;
+	pinctrl-2 =3D <&sdmmc2=5Fb4=5Fsleep=5Fpins=5Fa &sdmmc2=5Fd47=5Fsleep=5Fpi=
ns=5Fe>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width =3D <8>;
+	vmmc-supply =3D <&v3v3>;
+	vqmmc-supply =3D <&v3v3>;
+	mmc-ddr-3=5F3v;
+};
--=20
2.34.1


