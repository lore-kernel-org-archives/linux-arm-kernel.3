Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E18D3B9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=; b=lSrWpxAThlx8GLH1XMtKJjDmlr
	KQBMawi2cakfEwNfsQA+1Te8ya/4KTTBRrY2MTZ1PO/6dXeg/H41RJTNx7bWQa2LB8zsn1zsN3Yem
	6BkG5odB5tjyRA0IE91Gfnj5nPJGV+icmZaI8J1T2wesqAs0xgERofW1nquGuL5m4o1AohpVHvVzN
	ys8x/aj/Qc7d+K3UhzzZntXCOShaxwqxx/omkP8O90V7PFObF3beFZt2wWoD7oErNoFTbJPOAi49w
	r4r3T2SJPgeQpWHNrcD6iax/tFkPwFdFJLaci7Eu8xnTR4mZFOyCvSkCIuDvVkLBedx0RklKiyyMn
	PNK8uKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFN-0000000FJej-1ucN;
	Wed, 10 Dec 2025 10:16:37 +0000
Received: from mail-westeuropeazon11023075.outbound.protection.outlook.com ([52.101.72.75] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFG-0000000FJVo-1slI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhYTkXOV+ZfNBob3C/zMcc+CcmEfxjECvTiDySjcDEqReU4A7+F1j3jSl28uGytQpDD3foCRVshzOiJtazX1+baXFN0bDjXM6BoUfOn0ZbsdWBScCFDES6LGrI4gvzy9M0kcBE7i5ssvE4m3egE6aEugHO+PAr5G4u8CaJMI4+cyiZRgkf/78FJw3ZHfwgj/aGC9YcQTwRG4onpT2uafGhnzasfmbdxs60PbQ+xfVJQuP8M12o3T3Oj0t6wfQOSdJ51OnBGYVWI0LLYzCCIBf8dimPA1j1LvtPnMCwiCArMP3V5+JA352v+OD3b1DYdn5eq/bzDxd9hfMmyC09ZXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=D2e/RHohI/1fvbKNSur9x2szNVB8J1hV17ClmvJORbh6TW3N46lPlFfaIS9c8Z61M7pFEkUy72o0o0UPAZWh9yMWj4K7/9r52TiM+tTAVU2Lo71guWr2Z/uCAqGVj699wE5IAb5ImfK0GAB5PIvs1a+r5ZvYNk7K3QSoJAw/0DOCPdXxx9n+2gl1ChSEBy4MILhJkqbvBUZYyp5DH8BXd2a2/Swq/Zbs/JGI5V9BCzYPA/skMM64WGtUq5cWM6RluN1rkj2MIeGlJIYtqQm+OyB5EAE2I3Vj57EKXBN474gtfH4Ir0ST8KRojA3KUVS4KIb7d1Co2t4Cql/xjT8xQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=KXolupK9rO98ho0Yb7AWn8m4j6PeeSBxFt7EZls7SSO4QQoNiZdhUaZ84j8Xg7ui8/41jqkbMjXE3CXYRWXGsv32XVai37gVrEcmO0+Bm2Ecg5Od0ds7dBF1u7NuUspPmF4ptkAdcBDBBlFp3J9uH44E6fPqPsFPnqnQJfhG5B4=
Received: from DB9PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::19) by AM0P195MB0756.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:165::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:22 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::89) by DB9PR01CA0014.outlook.office365.com
 (2603:10a6:10:1d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:21 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:16 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161644-319 ;
          Wed, 10 Dec 2025 11:16:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 10/11] ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
Date: Wed, 10 Dec 2025 11:16:10 +0100
Message-ID: <20251210101611.27008-11-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:16,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:16
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|AM0P195MB0756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b95ad7e-c22d-4066-8f30-08de37d52ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oDOZTP2oYNUMFGRIwpcpM7zxopt5SqM141dMLVezN5QTPhzwoHaqmT+7KcD8?=
 =?us-ascii?Q?meEDtLbj5B+PwoTiydhojVuuVuJovKEELeW2LmIon+N7XF3pEf975yb8nBb9?=
 =?us-ascii?Q?nYqIJNqLY1b7fTATibhDmbTZJjhXTcP2r90ZrsjvWkUkyKhP1DNeXdB6kLwS?=
 =?us-ascii?Q?xBg/9bW9YorNXDxW2E5h7yJCi8BpQM49g5KezwqmytboQ7irkxRS3ldOpFkW?=
 =?us-ascii?Q?RIGQkFTG+ut0z+37cP9ZmhmLXeUoqFfAVkn3DuRsVdR3s3eBCHv9rDNrnv08?=
 =?us-ascii?Q?WSzP44CDSHo8DRC6uI41ZeDprlLWQASqrLHLg38wSn9dr+VhebBpSUjOR3q9?=
 =?us-ascii?Q?3Zhjr2ukTu7Z6kYo74w77OfSuQcWB8hx1zmgnWa+BIPDxHkMBjXpwWBl0MRN?=
 =?us-ascii?Q?cwOjwg355j2qiFrVcrvR8n9jVrmNjKDJqzeLLhPdnbIIluUpBB/nzSgYQRE/?=
 =?us-ascii?Q?m38PuUuw1LE7zJk5FnCmQlIeTjkjdAKMbP+8OGdjCerbhgjiyYwPUn6b888u?=
 =?us-ascii?Q?XqkAHLRfKstu2J+6OOx3zdGPpGY8HzHIK0HNNj9dcZQyOjk0dOx6ApnWo1jQ?=
 =?us-ascii?Q?2iIu7dVVtJZYNE7nc4RrhBmCkBFL9UMWlIAV10bZ9iNlqh1lK8h3fXefFo66?=
 =?us-ascii?Q?6njPvhxyHpQwhXmJwEE1qvk+0XvpPsUJCllAAHIrqcdqho5is/O4JVLuSNyp?=
 =?us-ascii?Q?sjx4WAM2TKi6LxnYzEkh/etV+ZWNsKIz1Npt2ktZ+WHFIqAaB19/KSGcZ3Eb?=
 =?us-ascii?Q?7vOCWjOkdjmWQPCS/5GhemQBuhQjzcStBxQgyhgXEqzTjtpRIFt30psv+i5L?=
 =?us-ascii?Q?03zSXCUpRhHpGP0aAox9RYKfsXBUDx9Lbao3iCkwc90TB7NpmyOZ670+qsCv?=
 =?us-ascii?Q?BtOA0OuETfTxSY6MjDgJqpfRn4LorZ92LfWtZeHGgQqTiNc3W27zbxXBdMCa?=
 =?us-ascii?Q?uXAA4iCZxkUTd739hKZ/vachVmIQNXLJ/hEmOfPGyhrzGae8akh6ft9EFAZd?=
 =?us-ascii?Q?ElPKtuPnNyGI2pMtDaQtXyDuJnqrVkkqjWrmTxPPMVS0FLvInj+D9ENW9N7+?=
 =?us-ascii?Q?XIFdPYAwTAHcUwA3yBhTeOhCZ22FxeQ6wElAe7t2wFnzp2eEf4WGuRei/360?=
 =?us-ascii?Q?gbEwl2hTNWe0706VpIb52q8pMsiucXhSsAU9QOT86VQrYVRVlwDwgd3Q17aL?=
 =?us-ascii?Q?9mGTmSMrmR9Q9x7O2XJoJH/3zR8vN1CccOSED5j1IcEtyTmYoSKv0cboXK0P?=
 =?us-ascii?Q?eoCSSrJEscdcFdvxVChBHAwUYK9k1eyk4Y+sg0fm4PnC3AvtQlC0vjAqcQDr?=
 =?us-ascii?Q?zL1q2OePMDG15+xLDxw/uCvu6RU2FKeE7Q2GFur8zhKPjkQSllXuX85DAwIh?=
 =?us-ascii?Q?EucUy1S87sPUU6nr7Q+TJltL+fi4FNf2+nO63l5u3Piyjsm4LxNwHTs1vi7n?=
 =?us-ascii?Q?jWpqZe+Woplu6FxRkaCGPnBeYM/l36RPRvYqLY+K0ZTlT/wjA+eDI0Nn07pY?=
 =?us-ascii?Q?KmcUktGNxawE9BYX6bB60/wptFO5O/m8UVffvpaqNl6NCLzGDLA4Tc+6Vbnf?=
 =?us-ascii?Q?o9LroVrKH3S7DKV98Ss=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:21.9717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b95ad7e-c22d-4066-8f30-08de37d52ae5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021630_666242_5FD54221 
X-CRM114-Status: GOOD (  12.42  )
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

- Remove "stm32-pinfunc.h" include as it is already include in
"stm32mp15-pinctrl.dtsi" file.
- reserved-memory: reorder the memory sections (lower to higher
  addresses).
- Move vendor properties (go last).
- Remove useless compatible values:
  - QSPI flash: remove the winbond compatible. jedec is enought as the
    NOR flahses are detectable.
  - EEPROM: "atmel,24c32" is enought.
- Use uppercase for regulator-name properties.
- In pmic node: use the names from the PHYTEC SoM schematics.
- stmpe811 touch: fix dts schema to comply with st,stmpe.yaml.
- Fix one "multiple blank lines" detected by checkpatch.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  1 -
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 13 ++--
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 64 +++++++++----------
 3 files changed, 36 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arc=
h/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index c90b12a479c9..c18a37266083 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -6,7 +6,6 @@
=20
 /dts-v1/;
=20
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xx-phycore-som.dtsi"
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/a=
rm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 9578e78bcc1d..20684b497c99 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -5,7 +5,6 @@
  * Author: Dom VOVARD <dom.vovard@linrt.com>.
  */
=20
-
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
@@ -101,13 +100,13 @@ touch@44 {
 		interrupt-parent =3D <&gpioi>;
 		vio-supply =3D <&v3v3>;
 		vcc-supply =3D <&v3v3>;
+		st,sample-time =3D <4>;
+		st,mod-12b =3D <1>;
+		st,ref-sel =3D <0>;
+		st,adc-freq =3D <1>;
=20
 		touchscreen {
 			compatible =3D "st,stmpe-ts";
-			st,sample-time =3D <4>;
-			st,mod-12b =3D <1>;
-			st,ref-sel =3D <0>;
-			st,adc-freq =3D <1>;
 			st,ave-ctrl =3D <1>;
 			st,touch-det-delay =3D <2>;
 			st,settling =3D <2>;
@@ -159,10 +158,10 @@ &sai2 {
=20
 &sai2a {
 	dma-names =3D "rx";
-	st,sync =3D <&sai2b 2>;
 	clocks =3D <&rcc SAI2=5FK>, <&sai2b>;
 	clock-names =3D "sai=5Fck", "MCLK";
 	#clock-cells =3D <0>;
+	st,sync =3D <&sai2b 2>;
=20
 	sai2a=5Fport: port {
 		sai2a=5Fendpoint: endpoint {
@@ -195,9 +194,9 @@ &sdmmc1 {
 	pinctrl-2 =3D <&sdmmc1=5Fb4=5Fsleep=5Fpins=5Fb>;
 	cd-gpios =3D <&gpiof 3 GPIO=5FACTIVE=5FLOW>;
 	disable-wp;
-	st,neg-edge;
 	bus-width =3D <4>;
 	vmmc-supply =3D <&v3v3>;
+	st,neg-edge;
 	status =3D "okay";
 };
=20
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-phycore-som.dtsi
index 3f60f184978c..0689967b8c56 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -36,18 +36,6 @@ reserved-memory {
 		#size-cells =3D <1>;
 		ranges;
=20
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
 		mcuram2: mcuram2@10000000 {
 			compatible =3D "shared-dma-pool";
 			reg =3D <0x10000000 0x40000>;
@@ -71,11 +59,22 @@ vdev0buffer: vdev0buffer@10042000 {
 			reg =3D <0x10042000 0x4000>;
 			no-map;
 		};
+		mcuram: mcuram@30000000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible =3D "shared-dma-pool";
+			reg =3D <0x38000000 0x10000>;
+			no-map;
+		};
 	};
=20
 	regulator=5Fvin: regulator {
 		compatible =3D "regulator-fixed";
-		regulator-name =3D "vin";
+		regulator-name =3D "VIN";
 		regulator-min-microvolt =3D <5000000>;
 		regulator-max-microvolt =3D <5000000>;
 		regulator-always-on;
@@ -102,11 +101,11 @@ phy0: ethernet-phy@1 {
 			reg =3D <1>;
 			interrupt-parent =3D <&gpiog>;
 			interrupts =3D <12 IRQ=5FTYPE=5FEDGE=5FFALLING>;
+			enet-phy-lane-no-swap;
 			ti,rx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
 			ti,tx-internal-delay =3D <DP83867=5FRGMIIDCTL=5F2=5F00=5FNS>;
 			ti,fifo-depth =3D <DP83867=5FPHYCR=5FFIFO=5FDEPTH=5F4=5FB=5FNIB>;
 			ti,min-output-impedance;
-			enet-phy-lane-no-swap;
 			ti,clk-output-sel =3D <DP83867=5FCLK=5FO=5FSEL=5FOFF>;
 		};
 	};
@@ -144,7 +143,7 @@ regulators {
 			pwr=5Fsw2-supply =3D <&bst=5Fout>;
=20
 			vddcore: buck1 {
-				regulator-name =3D "vddcore";
+				regulator-name =3D "VDD=5FCORE";
 				regulator-min-microvolt =3D <1200000>;
 				regulator-max-microvolt =3D <1350000>;
 				regulator-always-on;
@@ -152,7 +151,7 @@ vddcore: buck1 {
 			};
=20
 			vdd=5Fddr: buck2 {
-				regulator-name =3D "vdd=5Fddr";
+				regulator-name =3D "VDD=5FDDR";
 				regulator-min-microvolt =3D <1350000>;
 				regulator-max-microvolt =3D <1350000>;
 				regulator-always-on;
@@ -160,7 +159,7 @@ vdd=5Fddr: buck2 {
 			};
=20
 			vdd: buck3 {
-				regulator-name =3D "vdd";
+				regulator-name =3D "VDD";
 				regulator-min-microvolt =3D <3300000>;
 				regulator-max-microvolt =3D <3300000>;
 				regulator-always-on;
@@ -169,7 +168,7 @@ vdd: buck3 {
 			};
=20
 			v3v3: buck4 {
-				regulator-name =3D "v3v3";
+				regulator-name =3D "VDD=5FBUCK4";
 				regulator-min-microvolt =3D <3300000>;
 				regulator-max-microvolt =3D <3300000>;
 				regulator-always-on;
@@ -177,7 +176,7 @@ v3v3: buck4 {
 			};
=20
 			v1v8=5Faudio: ldo1 {
-				regulator-name =3D "v1v8=5Faudio";
+				regulator-name =3D "VDD=5FLDO1";
 				regulator-min-microvolt =3D <1800000>;
 				regulator-max-microvolt =3D <1800000>;
 				regulator-always-on;
@@ -186,7 +185,7 @@ v1v8=5Faudio: ldo1 {
 			};
=20
 			vdd=5Feth=5F2v5: ldo2 {
-				regulator-name =3D "dd=5Feth=5F2v5";
+				regulator-name =3D "VDD=5FETH=5F2V5";
 				regulator-min-microvolt =3D <2500000>;
 				regulator-max-microvolt =3D <2500000>;
 				regulator-always-on;
@@ -195,7 +194,7 @@ vdd=5Feth=5F2v5: ldo2 {
 			};
=20
 			vtt=5Fddr: ldo3 {
-				regulator-name =3D "vtt=5Fddr";
+				regulator-name =3D "VTT=5FDDR";
 				regulator-min-microvolt =3D <500000>;
 				regulator-max-microvolt =3D <750000>;
 				regulator-always-on;
@@ -203,12 +202,12 @@ vtt=5Fddr: ldo3 {
 			};
=20
 			vdd=5Fusb: ldo4 {
-				regulator-name =3D "vdd=5Fusb";
+				regulator-name =3D "VDD=5FUSB";
 				interrupts =3D <IT=5FCURLIM=5FLDO4 0>;
 			};
=20
 			vdda: ldo5 {
-				regulator-name =3D "vdda";
+				regulator-name =3D "VDDA";
 				regulator-min-microvolt =3D <2900000>;
 				regulator-max-microvolt =3D <2900000>;
 				interrupts =3D <IT=5FCURLIM=5FLDO5 0>;
@@ -216,7 +215,7 @@ vdda: ldo5 {
 			};
=20
 			vdd=5Feth=5F1v0: ldo6 {
-				regulator-name =3D "vdd=5Feth=5F1v0";
+				regulator-name =3D "VDD=5FETH=5F1V0";
 				regulator-min-microvolt =3D <1000000>;
 				regulator-max-microvolt =3D <1000000>;
 				regulator-always-on;
@@ -225,23 +224,23 @@ vdd=5Feth=5F1v0: ldo6 {
 			};
=20
 			vref=5Fddr: vref=5Fddr {
-				regulator-name =3D "vref=5Fddr";
+				regulator-name =3D "VDD=5FREFDDR";
 				regulator-always-on;
 			};
=20
 			bst=5Fout: boost {
-				regulator-name =3D "bst=5Fout";
+				regulator-name =3D "BST=5FOUT";
 				interrupts =3D <IT=5FOCP=5FBOOST 0>;
 			};
=20
 			vbus=5Fotg: pwr=5Fsw1 {
-				regulator-name =3D "vbus=5Fotg";
+				regulator-name =3D "VBUS=5FOTG";
 				interrupts =3D <IT=5FOCP=5FOTG 0>;
 				regulator-active-discharge =3D <1>;
 			};
=20
 			vbus=5Fsw: pwr=5Fsw2 {
-				regulator-name =3D "vbus=5Fsw";
+				regulator-name =3D "VBUS=5FSW";
 				interrupts =3D <IT=5FOCP=5FSWOUT 0>;
 				regulator-active-discharge =3D <1>;
 			};
@@ -262,8 +261,7 @@ watchdog {
 	};
=20
 	i2c4=5Feeprom: eeprom@50 {
-		compatible =3D "microchip,24c32",
-			     "atmel,24c32";
+		compatible =3D "atmel,24c32";
 		reg =3D <0x50>;
 		status =3D "disabled";
 	};
@@ -312,13 +310,11 @@ &qspi=5Fbk1=5Fsleep=5Fpins=5Fa
 	status =3D "disabled";
=20
 	flash0: flash@0 {
-		compatible =3D "winbond,w25q128", "jedec,spi-nor";
+		compatible =3D "jedec,spi-nor";
 		reg =3D <0>;
 		spi-rx-bus-width =3D <4>;
 		spi-max-frequency =3D <50000000>;
 		m25p,fast-read;
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
 	};
 };
=20
@@ -342,10 +338,10 @@ &sdmmc2 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	st,neg-edge;
 	bus-width =3D <8>;
 	vmmc-supply =3D <&v3v3>;
 	vqmmc-supply =3D <&v3v3>;
 	mmc-ddr-3=5F3v;
+	st,neg-edge;
 	status =3D "disabled";
 };
--=20
2.34.1


