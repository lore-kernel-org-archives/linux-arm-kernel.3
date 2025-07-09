Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB4C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j6T7w0eYNfTYqc4qhSaU/I8/p9X2ebFodkFIaOfiUhY=; b=4TH3eoTzfYVt3+/7voXNl7Fq0n
	f7jBS3tRY1HXiBPAC5Df2YOj1BLPXa6TbJqSDkHGR4IjV0ItcRzsd4MornqazqR9wYShJtY2zXjku
	aMEobc3QTXCIun4COY3kV2c6mPtImPq0TacVSLk6yDRMTsrFY3juet5pFaO7vT+2Uz1auWC0FnFGz
	OgU769B5yGGo2dwRyjTSRxT6saGvaBjIiIOqOHjPUKxi3j6wWZCqZFQpaO0BJNHOv1wNzgERKGQ24
	obRKsoZ3OqSYfXX24RMQ/gFATK7ybE/KjqWRTkbI03lxhnjwvGYrp1zwcT/vRJ/nM8O/+LNB4EIn0
	7vg62WcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5W-00000009cVE-2J8d;
	Wed, 09 Jul 2025 19:04:14 +0000
Received: from mail-am6eur05on2070d.outbound.protection.outlook.com ([2a01:111:f403:2612::70d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWRD-000000096wf-369n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS1SynzyMydOfaVxpDS1PLJ+KmPS6ZwOPLyBpUKtBz5jtwxu0Hh3W4k5UqOx3+LMU7vmm/O7B0pzHGK4dJNTDf6i8ipxyt4ds9eRYL0yF8CTDv0Awnyzr1aZdFJswVR1oD+236NW+0le7MroPCZ4OjZZeZ+iEx4hT17c7wrvWp79vtDXwianIQN+ZvCGhXdseQI1mvwRCcI4g51KZRqcYyPFbH0m1Xm4wRQA8NjhWOZLe7cUsU+jEr9PQdngCRW9ztGBgvJEH3dkN13hmeekoQMCaOgvQyMUts7TfcmEdb3CKsS7IKwmS4h/AdXdf15z0yZbwwBc6lxJ247Vsm8Bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6T7w0eYNfTYqc4qhSaU/I8/p9X2ebFodkFIaOfiUhY=;
 b=Kh510I46W96m5ga5ci2Zil7wTtCnqOxZv4QTnVNc5D79ngTfmGYh2+/CEwuxwKuzQMBzJlDf/XRy4MXtjGhJlbPDW/k170E4gPU91/Ud630Kxx21B63cMNEnqelTyhE+9alUYXvBPpetGvBze+P3JSlDALnJcFR/t/kt4hyK9gcRZjezd3ziryXros+qkLnytuJyyd4HP9xQ/24V9IOuDEwZ0L+BZmGv4aUIug8srhYbTzvSWDHPdxtdRAq24FtXI4h0RGnwN+SqMs2pUbVa0584ryrshzy9iW5SzyTMaUt3g6vnIAJ3bNgx2ZyOvEBCCsm/+oesjFrBJlFRQDhHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6T7w0eYNfTYqc4qhSaU/I8/p9X2ebFodkFIaOfiUhY=;
 b=ryNibjF27gCUxYYzm7G148RL6cu4PjY9PE5hKlcPgpILBSFjtPk9fEsxIkxEwsw/XaAJDBiapkhWnl2PVv0g6RCyuTh0ROqlSvAFa8G/eFGdyRhXlrlA8I/tkS3vFc07kJqVjvgGQEtCRcMyBgzcsq/w4DS/MZEgGy3p+zhQwl4=
Received: from DB7PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:10:52::26)
 by VI0P195MB2840.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 15:10:13 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::d2) by DB7PR02CA0013.outlook.office365.com
 (2603:10a6:10:52::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 15:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:12 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:11 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:11 +0200
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025070917101153-206 ;
          Wed, 9 Jul 2025 17:10:11 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 00/11] Rework and fix STM32MP15x PHYTEC dts
Date: Wed, 9 Jul 2025 17:10:00 +0200
Message-ID: <20250709151011.366537-1-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:11,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:11
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|VI0P195MB2840:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b162ad7-e7ea-4b6c-f52a-08ddbefab3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JsziYAzM85Icns3GgAh8ALRrP5T9pl98SvWcwyfex729qSHVOL3P/ytTIMRA?=
 =?us-ascii?Q?SHsjLDaNKmEYmc/KZ/IlkZ2tbXB3pAMwEPSVaUpq3i3pJrd5gcWrVhSdz2FZ?=
 =?us-ascii?Q?v+x9tIEFRPdPbWbfRU1AM4r7cS3U61GutkdTz0UxH7WA7TgVs404g83ae1WG?=
 =?us-ascii?Q?TVAN3VEz9hXs7qLcA3Yed1B4hHrJZPNlCZf6/qX8qcuvYSXQGzfVDttr1Ogl?=
 =?us-ascii?Q?TKE113bqOrAv1ZbUxjxPuLgCKwUEHtZJ7SqXcxC32BtaT04/y4jm1/ujZQAn?=
 =?us-ascii?Q?jgnT/2lpPIodoKQRPXAxrSMXnTm0altQl0nLeeTTePXPFGl0LP3b+D0FsqZD?=
 =?us-ascii?Q?ANWXR1QbM4PoI933jFcaHxtKUv54Wxc3u9/oObVhkWhic9k/7ldb+0wmWzVO?=
 =?us-ascii?Q?OlxFR6VmddoPPavAvHVpRDkIZiNlSaAL6sY4pDxfqkITfHHrsEvfQrlSIfPn?=
 =?us-ascii?Q?JSzJly+ukghQIi2W4VgWOR4tCoCNHNX/IeOEMXn8LtBIaa9DySn8bAPFPfMG?=
 =?us-ascii?Q?1wgKkCRuTjZwmTKG5UcSD6bXZF1UT/Xk6GzStELAZXt12KMillDKY8OX7f80?=
 =?us-ascii?Q?0epNkKqJqzscQ4imvs3mV+Hj66fw8lTChfe3XTdVj5JneCHywjXEcHgF4DKJ?=
 =?us-ascii?Q?pZZc6sM0wzyJNGEVNPIFfXDUEyVjWlW4vwZNd8So5mV/4dd5CcGmwqWuv0Ya?=
 =?us-ascii?Q?C03NIQSSh/8K9LGjNW3fQ7TGbc4Uuk3txSt8CiUNJ1SnPUeQ9dLbSDBzu/pi?=
 =?us-ascii?Q?i9ukxPZA6IOlhB/p/jbSRInDQd2beb0jRqEBXJY3VbAoXTdqz2L/kvAt9ni2?=
 =?us-ascii?Q?GhARq4uS3/oSmSy3evbtsEiwyVpGD8jD4StmHIvpl83SkFNY78IhjgnPKxuK?=
 =?us-ascii?Q?x0VOFx04PXOoOp0HhTSkGSkr86dMWQDfpC0XmtRfzPzL++9PWzReTNf/KkhA?=
 =?us-ascii?Q?GweA7r/mlVgk4oX1ld9V2D4b43zFQhvHAlUNwpcTLXDE2HXdrQmYlMQShSix?=
 =?us-ascii?Q?wAG/Rjek8vqWDIpdCwNPJZG6tE3gwjtgBbSe+aeiMMamyFihAc25Ghf0sXe0?=
 =?us-ascii?Q?o/FCEwhTNs6nhAjpsRR7TZ/SFW/ko8rX0FEFDc01HSDqk8CGcAkVBZLT+XUi?=
 =?us-ascii?Q?celffMz/qNu+y62Pbte6CnAjN8qgttl4pzXxcSmhOoWA7/5ZapnmlR+W9EDL?=
 =?us-ascii?Q?2AIA775p2o0CAe4IcXJdgm/YNk2d+jTl0Cl9QfpdBu1cifDVa2/rcyu0bUdZ?=
 =?us-ascii?Q?VvldDVMRXEjf/vxGLpAdOHjCC3Nd+p+Xq9Rd8xiDMXLU+9VaNqKzb3K+KLqd?=
 =?us-ascii?Q?sA4ydysK08hsA11eWSZ8gQXNoqn+etMuvnniSTgbhQQR7u0vmh8PwT+Caknd?=
 =?us-ascii?Q?FZaFOgebh/3WoqxgAMzgWoWvZHq8ZvH2707k0ZlloZiX6LcAXQGFDikM3FiV?=
 =?us-ascii?Q?lQDmyrqkG6v7hP2eUDtnC2s5pr8RH886NYOyjHXvWwLmZHnxBVMt8LN/QRqE?=
 =?us-ascii?Q?iaF9HLqfPaL+DmhPu4ZHXjS9FJzPCnn5ZyTk?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:12.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b162ad7-e7ea-4b6c-f52a-08ddbefab3e2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081023_786494_903A6145 
X-CRM114-Status: GOOD (  10.05  )
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

This patch series rename and reorganize the STM32MP15x PHYTEC
baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
files.
Indeed, the current device tree naming and organization is not really
consistent as it does not align with others STM32MP boards (use common
dtsi file as much as possible, use one dtsi for SoM and one dtsi for
baseboard).

The series also fixes some important pinctrl issues and minor one (coding
style). Additional pinctrl is also added for the optionnal interfaces
that are not enabled by default (FMC, LTDC, DCMI, PWM).

Changes in v2:
- Rebase on v6.16-rc5
- Rework Patch 3 (stm32.yaml): for board description, keep "compatible"
string identifiers as before to not break ABI. But use "enum" type
instead of "const" for the SoM and phyBOARD indentifiers.

Christophe Parant (11):
  ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
  ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
  dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
  ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
  ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
  ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
  ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
  ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
  ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
  ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
  ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +-
 arch/arm/boot/dts/st/Makefile                 |   2 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
 ...ts =3D> stm32mp157c-phyboard-sargas-rdk.dts} |  24 +-
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 285 +++++++++++++++
 ...-som.dtsi =3D> stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
 6 files changed, 525 insertions(+), 302 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts =3D> stm32=
mp157c-phyboard-sargas-rdk.dts} (58%)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi =3D> s=
tm32mp15xx-phycore-som.dtsi} (53%)

--=20
2.34.1


