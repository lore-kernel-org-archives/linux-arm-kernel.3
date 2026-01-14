Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5441D38FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LkgPeFSu+Kgcj1bXucXNn5KLIgT/kigFbUEtkEdDnkY=; b=xdXAH8ubXP1C4OO4j93yp0zL2R
	L7SUx1enCVKMHRlOdjF8Xl9BJyDCKqB5jKf7IlDLqMInsLE+hxF8pAO+y8RhVsOvzBGD7u9XFYqoc
	HkOLybC18r+mXh47akORl2RxOR6CuzPGb/N56Zn4LBMaLRNLM56bxjr+bSIAwouu3oNvnnNC+ZeCh
	8ur8KY/Fgye+rhDyewmkvQvFfNPZb+m0Qo9Cuv6Dy+cHlrulgNY52ztXR2nInx5rtDCct7MAhzaTq
	1MxVEtKcZJNAThH6BSw8+kKEDqiyfpXNmDfIpyyIU7hMkxcvqYbAtF+w2BEtMqXxF0Qzkk+JUzt7n
	Qrg3r39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4n5-0000000A9hn-3UYg;
	Wed, 14 Jan 2026 17:36:19 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4n3-0000000A9gl-1dEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjykE3g5PrwcMmNSZm79Uy/cfNS5uaxAJ07dSxQGJcJh5jrCpeJX2gbNktLaqB8WOU3cip9c9vFWzYDD2Af49IviB58MJYcyaEXwn4S4QhdsXs3BcbFcTfGZKm0LbYkZQtD409EHZHFNsSAX9Sxht5ZeeKxPPzDPUEG+qPht5X2qXXRknO/wkZ9L1LYkCo2rLaxMBRqRq5+O3J7iSJnPvoO4k9WeHLgouFT2WRTLILRdrVMbprPwdgL9SI5bqvflXd70HNjFFigQNdtIQ6KIzlOKLnlpfsE57HdyJT3AmkKW73owNX0PevJhuPYg5IEVBXjBkonEhgLRPs5AqOjyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkgPeFSu+Kgcj1bXucXNn5KLIgT/kigFbUEtkEdDnkY=;
 b=g6lGM3GlHBKtDHe5cNZt/Kynv2SDtFF/YZuPfs5axxia3Rb34KbSZYokPgXSSQqihln5OJP4uymGJmc4Te6bg7HJYbk+xHMmkUKQN30Z90N/CMJzzSRVLvMAAHu/3p3NGwtsu3eAUYuXs1o3jqcbJppp/LYyKZmi3SeKRaAHfyycI/wqi8as0MEGPyIbve5z7IutdQAQ8+XmFNyC2nDehhqG6tuKqCIucVtHJrNY6Ky1cMuTSe68DP89GEhCwyQpJcJFKMquKrrDOp/GIBBHC7jbEpxJim3fsfCbVREbXHnLcKcVDfFxDGFx0BECugpg29pNn51WsSEavWMJg8DR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkgPeFSu+Kgcj1bXucXNn5KLIgT/kigFbUEtkEdDnkY=;
 b=n+m9MAXGrzi4PEfVNmfbnziH919XwZaJnr+e09i/NXT1OiAP+s0UV50R4Lunb500VkqdjF+PULphDFBZ95ve+fshRo6NxQGxn7PdNlWyPbFduhkGbaMpSHI7JGw3Be09/HU5fOvpHYJJfljg4OBKDBjymDRheX+HJIGHXYCSWS4=
Received: from MN2PR01CA0059.prod.exchangelabs.com (2603:10b6:208:23f::28) by
 SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 17:36:10 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::7e) by MN2PR01CA0059.outlook.office365.com
 (2603:10b6:208:23f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 17:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:36:08 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:35:56 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:35:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 11:35:56 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EHZpkM040370;
	Wed, 14 Jan 2026 11:35:52 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/2] Add TI K3 HSM M4F nodes in device-tree
Date: Wed, 14 Jan 2026 23:05:49 +0530
Message-ID: <20260114173551.2545088-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SJ0PR10MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 614538f4-ee97-4e28-30f3-08de53936707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZgHwKtrI2VnP0S+waYGlRFKL9qw9Z2melNJmZ0Z62ngRenWheNOMjDKi46R/?=
 =?us-ascii?Q?3nCxZ04DSlZFNYLci5TLdWA19gCcxkStP0GTR5M9v5GifRTLM0h/x8o1dOj2?=
 =?us-ascii?Q?7yoQ9TpbF3Z6yevuHc073uGtzvqRTk22GqW4vDwpxFeupIZd5zaE/WO6u/Qg?=
 =?us-ascii?Q?KSj9Mq5C+tW4BlfYQpG3v1cr272tPkPGj4QEVtqN4Yw+OIR3Bk1ua96/EbJw?=
 =?us-ascii?Q?ToHf8i1V5cqvRxxjIKglQfVBxvG+5o+44uDiUQoukXCwzvFntBVHD+GPk5fi?=
 =?us-ascii?Q?IQTXBcFqDys12o5q3hi0zN7kAtq1rtfHN14Qi3WiRTCdquOP34+FEgTqkPyW?=
 =?us-ascii?Q?TeY4k/FKm8LgJQrwRCe3MjPiGMgWF3KxBAVxbdWxB/ZK4LJd+EWzoSaEdA5J?=
 =?us-ascii?Q?ogIgzieYwXU3GJ+oyNpvHJrJY5ig4HObwCHBdxOCfsA8b5URds3V9Rq/3puj?=
 =?us-ascii?Q?TCcenAUZ5GbWRaq+1Vc1ejwezaBjpjonaGvAGLBNuOzA8vMYbpH8wEgeo6M4?=
 =?us-ascii?Q?ND5ObpMID4H068bEdSjBU26MEyUDL25eQwXvxj0bhNgsqjYIour8q+pzoI0f?=
 =?us-ascii?Q?Pcg239+y4eCXLsSJATWEIygswwMw93VdRKLljTWLMY8YEIhakSoG7oZrsNo+?=
 =?us-ascii?Q?wDMrPaTgD3emE2WCflFKxTXlL8ZSW9e7m2xy9AP33VrWnUVA48S3r4w9rW2B?=
 =?us-ascii?Q?L2P8ax5jVZ6pRcPTywV11Wh53J3e2mzUujX/cOPMTPJS4nqQPvDutLl315yF?=
 =?us-ascii?Q?I8ohiPGqJ5LkKlDXQGOJJxXyP+OMbKcd1u6FBkOu3OHH5KScOszMN1J95Eg5?=
 =?us-ascii?Q?0VVL6W8Z86ZCKamzIDpyIwf110S/N6+WzlH8RFLCtkQUXs2QUoDcw/3kbVLh?=
 =?us-ascii?Q?0tGtKwXc4jDAk1JwX8wZIxu8kFwd9Bz0ShHLGG4XYCorJMiTMp195K59e21M?=
 =?us-ascii?Q?z8Qbk/+3M5UUc2omvqsBQCu1ND1mDBT9tQcPAg2Hzm/FmL6qoPw2t1TFI3B/?=
 =?us-ascii?Q?cGECY2uqYDTNwfBWjKxyra//N3wIJLwU4p85RQDnWzpiY8LACLe6ZZDmOXrP?=
 =?us-ascii?Q?KoUWtwr6V2XgOHczYG6+TG3BnJGwPRnc/44JVgoo8yKhcK6+w/j3rxR28t6e?=
 =?us-ascii?Q?nWUJATxCefbsA0zDd+fbjSH25+ZZKwnEuHraDz3xIHN4N+J1jW7TabnhELFO?=
 =?us-ascii?Q?zR4lOyOCuz47Rnl8PxdgKxmW/scDQu4fDk5SH03T45zvPeucCbfI30ReYtwO?=
 =?us-ascii?Q?zgRu3qmm9hEyH+sa79rdezQLag9rNCbvKBxxA5nGK6fnFrXl41DnbF1eE2CT?=
 =?us-ascii?Q?SglqUc/E9IOic9s03aqtWLYjFutdN2xhV2Ds1oXNlzW9CAjC+NfZ5JkZRNDo?=
 =?us-ascii?Q?hy/MqL5+V0XmtAHhWfeBvL0ge9g3c2TiiC4dPZGHDadXB28REWc8MiKjsvJI?=
 =?us-ascii?Q?BZq53MxllURpuiV3q/03bpGGQgX7H+yUQTY9jlFZH/Tzva0Kk+O8Asrm+tWk?=
 =?us-ascii?Q?r/lhjX8REMgJvBr998ySU7hPQtgmP0fdNJ8jv5UYV4gHUtJLm7q6MwglNYwf?=
 =?us-ascii?Q?9vYoURhVDu1YcpKVCvtYkJ/ZDT3WSB8fVTq1bhwHxLNdkfBwlvy0dOYDH7f1?=
 =?us-ascii?Q?VlntnR9Tvd0fAwKZ5pgGow3tTlAumQsMqLnCoQkjtCEiyrTNESpDp0M0k04F?=
 =?us-ascii?Q?jznnFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:36:08.5719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614538f4-ee97-4e28-30f3-08de53936707
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_093617_501902_57425232 
X-CRM114-Status: GOOD (  12.39  )
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

Some of the TI K3 family of SoCs (like J721S2, J784S4, J722S) have a
HSM (High Security Module) M4F core in the Wakeup Voltage Domain which
could be used to run secure services like Authentication. Add the device
device-tree node definitions for this HSM M4F core. The bindings for
this has already been merged[0].

The HSM M4 core is typically booted early from the bootloader and the
driver for the same is posted in U-Boot mailing list[1].

v3: Changelog:
[Nishanth]:
 1. Use generic node name 'remoteproc'
 2. Use label 'hsm' instead of 'hsm_m4fss'
 3. Add a comment for separate SRAMs
 4. Change firmware-name value to match existing naming convention
 5. Change status to 'reserved' and add a commment
 6. Re-order bootph-pre-ram property before vendor properties
 7. Update commit message to call out rationale for putting firmare-name
    in SoC level dtsi
 8. Dropped [PATCH v2 1/3] in v3 as it is already merged[0].

Link to v2:
https://lore.kernel.org/all/20260106104755.948086-1-b-padhi@ti.com/

v2: Changelog:
[Krzysztof Kozlowski]:
 In [PATCH v2 1/3]
 1. Update commit msg to remove redundant "bindings".
 2. Update filename to match compatible.
 3. Remove "address-cells" & "size-cells" property. These belong to the
    device's parent node.
 4. Drop description from firmware-name property.
 5. Fix indentation for DT example.

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-1-b-padhi@ti.com/

[0]: https://lore.kernel.org/all/aV59SdFU15HpLHeO@p14s/
[1]: https://lore.kernel.org/all/20251231173621.1069988-1-b-padhi@ti.com/

Beleswar Padhi (2):
  arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
  arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi            |  1 +
 .../arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi       |  5 +++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi            |  1 +
 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi |  4 ++++
 .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi  | 17 +++++++++++++++++
 7 files changed, 62 insertions(+)

-- 
2.34.1


