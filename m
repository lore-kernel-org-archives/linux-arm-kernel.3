Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE0D3B9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=; b=e8rsceTbioq93OD6DIIV5EDTqN
	TOudiGwxy8QUaAaAVqiVLsgHuJCDb/EJHHiqPJpVAtJnYP8a7xz86tBcSJPNK6xWsD7hjiXqFsZF9
	XkvYlO7qBr5GzJq3X9UojqiUNzCmG+Oni4zcH6/Jym2loAm5JxEhaumyYUMsHVQ0bfzg0nDs3lKb7
	plw+qnI3mLt8NMrephigB98AMAqqV8YRRluv9X/0BUx+Ey5foUMRGS5keopVB1Ylr/SFXkq5zW0Cg
	9GIoA8KmtNgPiS+donALoVcNXlRl5VrtwhW8gFdBRClUwuxc3MX3gVJ+S7Wnilmjo8QjH9Auxp5Qb
	DFeokb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHF9-0000000FJPt-2Xss;
	Wed, 10 Dec 2025 10:16:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHF6-0000000FJMd-31bk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcSYg+geZY6m63OG4ldP2+umY8CkIdouNGYSmpykCAhMGepjfqd7PEJTwLsoIvdEjxiseIR+lzjoUNMC9gbPKM1wu78U10HCWwLUwEJhkZXIrVDB4wJF9LvcPDC5De6Pv/lvsp+du6CZP63IPku+GWK2jRQm9IkNZmB4eZMrjKjrFx2hnNCSgy3T+PaS12O1CbENW8SOQy+hP003lyCrfoTDeKWXudSbNsJRUJt0VWAdas+6hGp3u+hs68N5+DP/PizlZtm0TjSGiWJOHLkUCRhaz2ZAvmMZbuesdoKNDJbPZa4O59TtDRm6UAc1+AWDSC1VkB2kkoU1PEw5kSfvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=d5s7i6Qh9wjEEm7cWJtfDAuqUBZfBSTktJ55BZ1/8v5C6WDIuivIpbUo8s9OhbDnxDC8xaveTeFVWWFrMXbnkzrii/QIq9qr0rKGKgMWZ9HkhG3LwW2mTxEFaaawQEKexFhBP2XMeOoFtm4Wv6WoJBRjzXBVsdHxbW7g6xb+Cl6n4Yz2PcQaBD8fkRPHKY+ZjaifOBAvfG6LbD3Kfqq0FPHAFhDdMifGiddQa0QHmFZIKF1Yc2oE7ZX3VN8OWfRdcvm2tiP+VfO3SbVdEflNEwXKDZxwxRKbe99JNXIe3tbvins2kuX7evAbrC81pJeoBhjj7jzuQyk04M/ECmc5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=DYxumWJf4IO/CPfXBEX5MDAF6Hw4t6/LbUp68hxf2bOcqErkTUhuBqW4uWEDZOptn1eBEUrSEYHrHD8P9e9VEKF4Te3hN37TMGKLKphxpiP169e44zvbcG/J7+HM/z5FPZrKIW5qGv3Aw3BpOQijCvmtPnm8CCJC/N02CQy7PbE=
Received: from DB9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::9) by PAWP195MB2606.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:46a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:13 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::d9) by DB9PR01CA0004.outlook.office365.com
 (2603:10a6:10:1d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:12 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:12 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:12 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161222-310 ;
          Wed, 10 Dec 2025 11:16:12 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 01/11] ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
Date: Wed, 10 Dec 2025 11:16:01 +0100
Message-ID: <20251210101611.27008-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:12,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:12
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PAWP195MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: ea15f9f6-f59e-4cdd-f4ea-08de37d5258a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MgkipbyAIDJgR1eAbJvVJV1WKjsvM+hKQnQJzI9BmlweOyBx2lrp29YRgqWD?=
 =?us-ascii?Q?kCPINNczKVH3ZjD/tzauJkU8tMXmAHalPB/eJAhbBYjS8GU4hbTrYPzZmYPY?=
 =?us-ascii?Q?B5HfFSU/LEA3ydswKY9g2jgjgz2fv9ExLzqWEwIVnUG7PXbPMRcVOOwKXSOj?=
 =?us-ascii?Q?S0K4lEEUXBZfAPOabXV8n3Yl269FNxqCW8kiqeaxIuG/DO0a7cqaIKgzRKPM?=
 =?us-ascii?Q?u0JXyMus1C4mYntUU4XAGX289vRsky3PlYPdnelkqz0QUqmUVOJvzX6+Lxu7?=
 =?us-ascii?Q?OWTq2voq33qOlXtFEAfMqRJfYEkn7u/lD9G/eJyXg4xQI+JXdNfhiPfWhxLS?=
 =?us-ascii?Q?iOpoTg7QxCqS9o9C2gACSHp3czEzvRfVZu4Jw/y1pmKzsPUcB+WBrNN89tFz?=
 =?us-ascii?Q?qCMltL6ltMpmWPzgPwb35Jr2Ft2+iNNQhxEBPfsjbwmkK8LogsHPvMac2mNw?=
 =?us-ascii?Q?dAJjlTd6eKrFeQ5yLjz5i3sC4nOI/EKO5zVkH6qdeJM0iQjCUEiNtNKMzZOv?=
 =?us-ascii?Q?oA8QYJlzzzAcuoJAX2PukQ60d8MPoF+VkrUBo8Zp/mX8B27fABdHC1TBYTNp?=
 =?us-ascii?Q?YHSo8tTjNWtYnOMtWOtBtfAm+sG4U6q8n6KLzgFyl7JqDIe5NhvyD+gj5VCy?=
 =?us-ascii?Q?rZK2eCtGmN4ShVhWXlhReUHEykiD6P8dVKuVZu1nvJIfXGBrV+SXL4ZjHdQI?=
 =?us-ascii?Q?0mYwmawZeJ/l7mwBhK5DnPecukQWy7ae/0d98N2odVF6YuV3buNk5PNbchku?=
 =?us-ascii?Q?R6t+wtp0k1XrBRsaI3lvZk/TXRj+ECqFltPVPLZopzr0mEPQsM8FJ4UZyHyf?=
 =?us-ascii?Q?bpkEYChlfVPT0E/lUhewiwEbW6uDX+TTRCmJIK1r1rzzH9flVA2iHOQKblFZ?=
 =?us-ascii?Q?xLR0BbjXiUr+CRPODxIG98LHnLYDj6Mofw4jCtcuc4ohxMNudfoq81diPt17?=
 =?us-ascii?Q?anR1DaxGnYVGaq572fz6S9MD8A/UHaDvLDMcV+5qZPDkSZ4BSw3/EjUA3jFN?=
 =?us-ascii?Q?OSRJf9Hkm9x393dqbmCQRNx0nCoya/rydsZjBOOFjATqlIGAAarrda7i5UlQ?=
 =?us-ascii?Q?erYyCuyyW0VN5g4/HUkCYcNSbdOl0/3p3CfXBqO1D0HP+B+wyjjkxBh3dP5O?=
 =?us-ascii?Q?bQ6ng8K+xkYBjYzUsaKa9oFwTHZV+y8LmuR2HCFCiyq7HdJyEgad5RdZtZcq?=
 =?us-ascii?Q?Ii1d1sKFtaieFkmgAibKos/nOdRoNglV3IcZ4755zkNi0jhsBm/zOqtlU48t?=
 =?us-ascii?Q?hXmVEg3yKTeMQp7T7XzBoGmBp/tSCK1FnAR/uvo3J5S0g3kfbqORx73bqySN?=
 =?us-ascii?Q?DjrtCnT5m6frjs2hf0Jpu3wGTx1yd8U7pzzqNpRQgVn/kMGRhD52xq66XgoB?=
 =?us-ascii?Q?c9LkjGLWhPlDDVc/0lQiAeIgxDDnTkPmsdltKI3Q2MQn6XN9ygJatdGECdwI?=
 =?us-ascii?Q?a17/bwqYaNR+VgaxfU1bFmBalGHiVW0uEQ2icBzUGasaeaZppe0QZu5WrbQz?=
 =?us-ascii?Q?Dq+7Ol686SwB+95ErgxJrE8OlWmMe+e8xrzMDoNVrT2/y2W1WEEOhVoJsJde?=
 =?us-ascii?Q?wAjq/1Zf6eRRdaljcSM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:12.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea15f9f6-f59e-4cdd-f4ea-08de37d5258a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021620_767228_34C568EA 
X-CRM114-Status: GOOD (  12.25  )
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

Rename "stm32mp157c-phycore-*" device tree for the following reasons:

- The name of the dts should match to the phyBOARD name and not the name
of the SoM ("phycore-stm32mp1-3" was initialy coming from the name of
the yocto machine from meta-phytec).
- PHYTEC manages different SoM configurations with different STM32MP15x
SoC versions, so common dtsi files starting with "stm32mp15xx-*" should
be used (as it is done for ST boards for example).
- Add "-rdk" as suffix (for "Rapid Development Kit") to match our others
phytec boards dts names (imx6, imx6ul,..).
- "model" property is updated to introduce the name "phyBOARD-Sargas".

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/Makefile                                 | 2 +-
 ...ore-stm32mp1-3.dts =3D> stm32mp157c-phyboard-sargas-rdk.dts} | 4 ++--
 ...re-stm32mp15-som.dtsi =3D> stm32mp15xx-phyboard-sargas.dtsi} | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts =3D> stm32=
mp157c-phyboard-sargas-rdk.dts} (89%)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi =3D> s=
tm32mp15xx-phyboard-sargas.dtsi} (99%)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f..099199f3e5f3 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -71,7 +71,7 @@ dtb-$(CONFIG=5FARCH=5FSTM32) +=3D \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp157c-phyboard-sargas-rdk.dtb \
 	stm32mp157c-ultra-fly-sbc.dtb
 dtb-$(CONFIG=5FARCH=5FU8500) +=3D \
 	ste-snowball.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts b/arch=
/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
similarity index 89%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
rename to arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 28d7203264ce..26995eb2a619 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -10,10 +10,10 @@
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
+#include "stm32mp15xx-phyboard-sargas.dtsi"
=20
 / {
-	model =3D "PHYTEC phyCORE-STM32MP1-3 Dev Board";
+	model =3D "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible =3D "phytec,phycore-stm32mp1-3",
 		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
=20
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/=
arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
similarity index 99%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
rename to arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index bf0c32027baf..ebbb82c09a1e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -16,9 +16,6 @@
 #include "stm32mp15-pinctrl.dtsi"
=20
 / {
-	model =3D "PHYTEC phyCORE-STM32MP15 SOM";
-	compatible =3D "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
-
 	aliases {
 		ethernet0 =3D &ethernet0;
 		rtc0 =3D &i2c4=5Frtc;
--=20
2.34.1


