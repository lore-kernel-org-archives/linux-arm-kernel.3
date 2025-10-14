Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB0ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bocl/cl/PAclFg1NfVQoER/2tIMqCbVC3m7dPbUq0Mg=; b=N9vnW7eqIbLp1cmsTmj4Pu9qFh
	rXg/uQ/m586FQpdHJTO3vnVud7ktdzNe9ISiG4Pb+V8k4ROTLauP3Z3IiAsw6nlRrlIfkzbjfpwcf
	UhTp2oVNL1y9+Hw8en3zM3e2cUb87rUrHwsmeEGNh1zbR5nDToFs8uy6oc5bSDx36dAbWP8N3Jv8O
	ajNysLEr3vw2vQSiToHR7euKv8SVUUVPwwbp3krldZjd96KEBpL50yxHleCHKGNYb/Fnadym0vMC5
	FKLU7LzhPgNfG5yAvMATWpJ7GQ83nyG3R8T8UBu/jftPXR7NPUX6B6b6mw6Nr561uvLImHDvFG6Ej
	KnU3S7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UI2-0000000EvtJ-28cM;
	Tue, 14 Oct 2025 01:57:26 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UI0-0000000Evpz-1XWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 01:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2OybgoVYUGPtXL6UGSbgdM+21/Ao10nbQOqdz64CEm4SqhIM4YtYviE4fI+1AKtdFDbf32PvxaWE1ekFe4PcReCvGQ7EeXL4I1G1KLccewLrDO6lBvDf5lUAvF4MSpm1U+7WbfqJUbY22TQ/jjOd6kXz+JIoVr8w35YljGShW/IcduYCZU3u8XJOQInNjljvvwxIZereQjIRzb5yhNkJckhRfSQn1FQkvk3C06Sj+4E6eoYF3pNiSsVDj1kyKVCmhklSoAFziy3/+5wv7mScGNw1cXxaEuX6UJteZKP0eH+3XncpTBjQUUmGcfqSD7Wpkkt+2P+BKUdOUTS5qzaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bocl/cl/PAclFg1NfVQoER/2tIMqCbVC3m7dPbUq0Mg=;
 b=dUSWqAJeSygStzEImA7Cyba7XQdPKyIlZRvhTzu6SEduhYc8WjVcOswM4gsLbyc1Z1bjt4nEcmHTmHd0lcWIvoqGMW8Q3898sT30CFs4rbw540ntVt2i1rLZdkLwM2fNOyc4RVQgjbZ0NSMLxlMMruCOoEduoy1jKoCmJSBi8JJCbHJ26+ieUAA6xcCLzGxdYZwypE/FheBlmRY5dZISUDjvgrxrXE+x6dtXzYXkrBXSzDxAuyOZJBMUGpwITRZF0OrRt5m7lv7ixkQmVnGkdZ1e7M+6qV9PX1X2NZ33w1EtOaFlRZADE++VLW/yNJwk0/1wZXoRI1x9UKxWX5nRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0043.apcprd02.prod.outlook.com (2603:1096:4:1f6::19)
 by KL1PR06MB6555.apcprd06.prod.outlook.com (2603:1096:820:f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 01:57:13 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::a4) by SI1PR02CA0043.outlook.office365.com
 (2603:1096:4:1f6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 01:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 01:57:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4B71741C0152;
	Tue, 14 Oct 2025 09:57:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 0/3] Add pinctrl support for Sky1
Date: Tue, 14 Oct 2025 09:57:09 +0800
Message-ID: <20251014015712.2922237-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR06MB6555:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de4af0b6-e5b9-49d5-de21-08de0ac4fe60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T4w45ZFhHtUT1kMU7zyDSS/boORFeiu2kEOiB1jdiAdn81XBfjvOtFVkHGVt?=
 =?us-ascii?Q?oLlEf5Y/IOC7HNU5yv7H2AM4KqeLPAw8kwyFMOMBvFOby3P1HrSGWqbfjCXZ?=
 =?us-ascii?Q?DH+FwXXbuL2Dyy0Le3+aQO1oEPYLkQEXj1NhwPuw1zo9wgglHgptavyde+K8?=
 =?us-ascii?Q?bAglu+fwCefSI2j7AMH6kju57mxW1X6A1W3VrTadwhMYaOD5UUok0g+vZsSG?=
 =?us-ascii?Q?1/SEzwGSXDz833uJwBUaVI5AwgRQaFto93K4MVE+lcR7J8bPlNuAa3fvc2L2?=
 =?us-ascii?Q?gsuHms2DFh+34v8NpW+2J13qn1AUkGXsJEPnNEKqAem3dCe2/bk/YnenbM6E?=
 =?us-ascii?Q?KJgV297uyhM6+D5XbKaEGUWwIsFfChoERrSy8q53Por5HrlnYkv6jQbif6H8?=
 =?us-ascii?Q?GLMrTsygy6RcTLRkeq/1wkBSwP0kB3KWo4wyaLJDmmSt9IoAcZJQ7cqPe4+1?=
 =?us-ascii?Q?uW6dgiIDNfaFlEgJ5d+8+ME0vzU89y7nlaK4VRzFaeDlPE/OMV4Q59T5dcpM?=
 =?us-ascii?Q?QUdWDaR2+quaqwc2TKvMOEGqtsJOkVULLgaVTogUjYBgh6+nrLQQ4DLhyKql?=
 =?us-ascii?Q?U/sb0cSXgPqUYM9XcuOvPK1TVXEQQV02X0/FS/pqO5dGAzH04K2axgwR7gyD?=
 =?us-ascii?Q?sKQ++ZgRtk3eeI0rCENpUzbKr58yf+CNhaHS+3bF2/sHqcxFnnE/lWGTLWzU?=
 =?us-ascii?Q?WFfvYdCW9GJVjZD0QIdp5VNMrVispRk6NCP7KmBpI/ohratJGDCvQ5gHtcam?=
 =?us-ascii?Q?kz93sm/RPHft0AGv+P62Mq/Yp90ENEjTVGpV9sDdIW5oSrzEEeCJQ6c7yLee?=
 =?us-ascii?Q?JAsmsGFq5Ll8TA0ciCF0deq/kwwddxR/5geiF2WYlrPbjFRtEwajSDYaTO4V?=
 =?us-ascii?Q?xwBftC2KWYeKP+Tknwno4h0PtzDWfGwcYWmnXwm6qPqjwJ5LfGOQunwoXAnV?=
 =?us-ascii?Q?7m/ZD/p8K7+aDSVa7ae59xaXHhqotLMhz9nDZ+6hY3XJvjPtMuQZjd2zYoT0?=
 =?us-ascii?Q?Bh776d4TOZCQjqrChrF5mhCXqr1rlU4elLQi6JaophvxRao8ULIexDi0l0Xv?=
 =?us-ascii?Q?B0J8mAR8KJaAecbKGztOaMRYOyTeYEvOpTcZ4l/OexIwZ88dqpCYkM5WbA2X?=
 =?us-ascii?Q?7CpP10D1p8MCRW3AzX0eYZ8UhC62RxMpY/HMS+Ssm7E7EeGbueqS1w+K/NV6?=
 =?us-ascii?Q?+tED0Xn80WeiVXGmINCnHNejyG1i4LFi6Y37rVe2AllGmf3/Y4RGC+35gr7e?=
 =?us-ascii?Q?iuCAOzNDTcZdaztinjfRSgrIEwMvZnUTo4NDIWR5V9SnaBtA1E8VtMRWrKiO?=
 =?us-ascii?Q?zBhihY8xpp/s4ziUbRGbQK3HNJZAsBpOv7SAeiRx1KMrG3JsxoEA0eWHsOKm?=
 =?us-ascii?Q?ijP5heUet28bOJl9318xz5I4/DdZRgaYdpB2EpWMY9c0372cLGpE0CTM9hxT?=
 =?us-ascii?Q?T3VHiz0dhjfjFaW6RcU5FNGBXU4lrnTrssnjT+DpFJM2jX4TrbjOQ7k4Bksz?=
 =?us-ascii?Q?RFzUMjJ6BJLf0C1FAl/5+fRoN9gYiU+Our1dfZ8re/rYEffstbNBA3FLr57a?=
 =?us-ascii?Q?tx0bgmK8+qNzOZPvCtA=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 01:57:12.9028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de4af0b6-e5b9-49d5-de21-08de0ac4fe60
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_185724_404730_96E64672 
X-CRM114-Status: GOOD (  11.61  )
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

Patch 1: Add dt-binding doc for pinctrl on Sky1
Patch 2: Add pin-controller driver for sky1
Patch 3: Add pinctrl nodes for sky1

Changes for v3:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move dt-bindings to the 1st patch.
- Refine the pinctrl driver with SKY_PINFUNCTION macro
- Fix warnings when make dt_binding_check

Changes for v2:
- restructure the pinctrl driver to support pinmux=<..>
- redefine pinmux macros
- move header file from dt-bindings to dts
- fix the code-style issues

Gary Yang (3):
  dt-bindings: pinctrl: Add cix,sky1-pinctrl
  pinctrl: cix: Add pin-controller support for sky1
  arm64: dts: cix: Add pinctrl nodes for sky1

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  84 +++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  32 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h        | 417 +++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/cix/Kconfig                   |  14 +
 drivers/pinctrl/cix/Makefile                  |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       | 558 +++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 559 ++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |  48 ++
 11 files changed, 1728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

-- 
2.49.0


