Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BCBC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pP8Cl5vtG743+zFGiDdDmAPZfijOKT9a1e9k4JyOhAc=; b=xmKg3UYtCiUjn2fEcpcquAlpAh
	szXvsPo/WjkVpMMMsSMmyCvbFhHFdDU0+0Zyxf9GejOAOkdGJq6JGzyxUosYrM+RYQRh5+UPZFRn3
	4OHpA9/tLz4/mws/K0+Ga0sP/fyXwPk4/DYOwWe/nWx92KtyXMcTaYLi73DiuxDfAYQSA/BR8QsKf
	nN1QnGg2dqWMcVISbS1R7GAbz74bXE2yJygRf/CwBL3+gPiNh4HQneefPZ+Ga0Tp2bUzEgaWGp4zy
	7PCoh+OoJQX1Hcvq3b1grqo0fC4QL72ShGqL6VLo+KUsTLLWi9rHfQkqVEgTU1VolOozgkqjJyWR6
	lHeIE1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfSQ-0000000CWTA-44fz;
	Wed, 04 Jun 2025 04:10:30 +0000
Received: from mail-dm6nam11on20614.outbound.protection.outlook.com ([2a01:111:f403:2415::614] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeE4-0000000CMFm-2u2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 02:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtYIeWL72dsv/aIhcy1zFc4iSBwwQWAl2jJcTvcxjNDHqVBamPwxvbA3m1pJzIh6p2g11c5oFtUeF+sf3t1m76YL3fBV5nxnR/UsnbaIXqEsYHpxbQ3Z9E2YBIIQz1YKE4ELlIR/ApA0wlhK8Kj6DSirn6iWaGNha0E4Pg2bCD48875ykm/CYFw+VyhEMwJR+SsjTQ+VJAEjJhdFeOvDUJunlQp/D/Du5agmaqKN2cw3YgldUOVlOln82TxXeO5Qef8+yPJ073qwPWLfFJoLbwW77Ld1slMxa0CpcLlnNR6YYXlfeO51tFGukdaaji9AqbgPoEDHSxACLoveuzNuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP8Cl5vtG743+zFGiDdDmAPZfijOKT9a1e9k4JyOhAc=;
 b=FPmz/HM8xYZw+twuEMEbx4u1hJEau13jxvETt55Pt+CqZFeKmQsQeM+nxKE8zmC+gj9QCofJ0QFx119nD+Qzy1Co1UUmZCUDBiChGUzE7XGaPMN/3+fGnJek/iPf6fi9QF9+0nvY4Nw8KPp2cHVcPzDzsD9ZgS7HRCpsODFhDoWewS+UuHMrwclQAYSHqw028vYXgJhDaEMcvPH70nmDozjZpE92FkpOpkFEL1oTNZQHzu3rHPvMMjjeIDdmvoDRyoI3dKkYJafyj0NzmXeUa0Zx0BEft2ZTMcvZAM9qxtSTWwfdR+8KI2xeaNKRx8/G3nleYqjk7Q8XbowUt42lcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP8Cl5vtG743+zFGiDdDmAPZfijOKT9a1e9k4JyOhAc=;
 b=iFywt0qsM8D3aQtXCzEyD7obNWoEsyZNM4XzDlrFwdwFL/xsUgtTnzrLgJD+NC86S5J34rpLH7ruWoorflZ/FRk20W7F0VOKs+V1qDyVLWgzxa01sxEyS+jHaCse6KAcaLb2/DDQ1wLtHI1WUCYDZmRjPuFeLihJs97+FWOh9y+sQXD8Eacdzoy2Eyz/2NFi8cTJ21GAY3vm3pdpi40orucV59U14KTDXffBJUM1NXyXTAK8SbbRrNGQnSYEJFHJTtbFS9QvIvHqrvqVJuD+RT4Ysi7U7UX6qwRWezUiWyzAr42v7toiW2/kkiF4MfKeaxssuhd5WSJyfIq3b3RsHA==
Received: from SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::12)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:177::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 02:51:27 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::78) by SN7P220CA0007.outlook.office365.com
 (2603:10b6:806:123::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 4 Jun 2025 02:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 02:51:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Jun 2025
 19:51:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 3 Jun
 2025 19:51:11 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 3 Jun 2025 19:51:11 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Donald
 Shannon" <donalds@nvidia.com>
Subject: [PATCH v2 0/1] ARM: dts: aspeed: Add device tree for Nvidia's GB200
Date: Tue, 3 Jun 2025 19:50:54 -0700
Message-ID: <20250604025054.981087-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 925d4efa-011d-46c2-e184-08dda312b399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7JpXNUhDmIhUzDjZnoREcNxIyKh3dmC8gDBao8USGUmHvVYs6G1vN/WDVkq1?=
 =?us-ascii?Q?9lvs/t2BDqFpaPJg1sE6RXxtBoHsTYYhI92iOxw3iVvceJqioFXyrgvPYmtx?=
 =?us-ascii?Q?2EP3mjJg/JR+EQ8xWXVUO+vi6PZgT486NkdLmZSAGXLNI1JaDBtHjBBTr43P?=
 =?us-ascii?Q?wibbWWUAqQL1ThlmIYet+M6G8gIL76LxrpTD9H4nwzEhP41BgUWMVq4Lm8oB?=
 =?us-ascii?Q?8/sFj0eitxog8Tkn3tHoUDL4RZiHLBZPppHbX1h519barPWWXEIbtKdFGV3l?=
 =?us-ascii?Q?WnHw39tp0Wk+o7Aq1lCYzPkUyx2SGi89AHtD473Pk8S/yS81q8dyr4VDGeog?=
 =?us-ascii?Q?PVgoSAP3lyG9FGwq/wOwStVKroHwpkYwi/JxUre/9vy8UEy03f/9szaeGvk0?=
 =?us-ascii?Q?ve5lJ/oQsecIabdlMzLHzsaXTtCnYaj8ysUnn7kV17R6eYco956vwvKAyCTT?=
 =?us-ascii?Q?0uJ4ElBvxFKZY/mBYVBJp+lGCfQiPRCQCWigySUi5mzyyLECVF/LM3UaYuU7?=
 =?us-ascii?Q?XY6R7T6jtdJxNDk76O9cFfVIdyvmNwyudN5U8IMUHnpEjui3AEBj1Ph/hcoH?=
 =?us-ascii?Q?dl2r7u8wkedcFknbnc2IoMiyKbKAlQBIy6USrKw1qOEwuRonVvp7+oL5NGUy?=
 =?us-ascii?Q?Sr5noM4z1MlO6chMGWd+4fkbagR+un1Gyjc1Ujuny1sp4ffflA77NWA5fb+a?=
 =?us-ascii?Q?3sQPTDDsb82NbnU/Z2yqMkHfCM86EaYCeCL7jiXVrGYkxYR6XbYYOWOKa1LZ?=
 =?us-ascii?Q?ORWsa0VBl5RJgli+bwgnc6ZQG2Rv/DSm3vuxebnzBXZb7wiROntcnYstsI5h?=
 =?us-ascii?Q?OjlOgXsVW6jspYN1I3hNbNKPgaDyOKI/gnvN1w84FDKpG8SmPeFoNQalM6gE?=
 =?us-ascii?Q?yEIzNcdPKZ7ihTMgj2FtKKjSAnod/O7H3ZYy/64jjLFC1nwPo4UJ/jtH8Nyp?=
 =?us-ascii?Q?UoeTcEtggg95irgHPgekVkcuJzfO/l/2IfGHVzve+2iwJ7mP9Il0abgoTkEI?=
 =?us-ascii?Q?GmysRKo4hUle451VExHRUMwNtHIj5FikQhZVG6Dw4WQLnWIiiGpkymuZCRwl?=
 =?us-ascii?Q?R3aDgzi9OAsCeakRKuzlj1/t5D9UjVgKiRcW89dbBQrJQOM9AAF4Es6CTD7j?=
 =?us-ascii?Q?lGow9pg51GgQ/8KSyHjxOHa0kQle22IbT9+3yMEna7Q6Z5FWsoWigbzcK5Xk?=
 =?us-ascii?Q?f5HLfcz5zTe0WWpc1d50ZYK44KIKNuHk7ocFNaGSTYyvNHfNdjWLtk4EBJvW?=
 =?us-ascii?Q?UejH5R1pw1a4QvkCHVA4p+M1m9uK4mvRFEE5vpvURo5/fEWYfF+A/07ZdH/+?=
 =?us-ascii?Q?Y1UJwCK78jTGKmZxfTzkzMaFZ3QN2NQunkAt/u/RJWfq65N96P2h9tvMeCet?=
 =?us-ascii?Q?h9q1v126ACzvbbDaG4FlLpNw0+xmehV0eHzX0uJqhBm7ptZqZ4H9Jb28UcD8?=
 =?us-ascii?Q?n/bH+OTHcAk/ntSphyNZ4fHlloALgFTbuixb5M22wOuRYEO4zZL+O2w8zACU?=
 =?us-ascii?Q?oM6zLbeRwyPs+LKBbFfdCpYBwzLm6tDnWRrR?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:51:27.2876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 925d4efa-011d-46c2-e184-08dda312b399
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_195136_919902_D883BA26 
X-CRM114-Status: UNSURE (   8.29  )
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

Changes in v2:
- Changed phy-mode to rgmii-id based on Andrew Lunn's feedback
- Fixed typo from gb200nvl to gb200 in Makefile

Donald Shannon (1):
  ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform
    BMC

 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1172 +++++++++++++++++
 2 files changed, 1173 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts

-- 
2.43.0


