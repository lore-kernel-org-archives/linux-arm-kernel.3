Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E6D690F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiL/Kkkky5Z9+rxfUUpR5tWsnJN9wfuskzZ/cSm5CsE=; b=DR4p5Z3Z9giLbe7H92MzcJeD3P
	6V86J6iOa0KbnP2uo59gujQc2D31LSMP7L/CwRnQ4Bwh2i43U8/JxxOUixoQZPSL5FzGjjUGxC6pR
	J89SQg/u/PsROeO5B3FI/kIvIt8qsQfo8KHvKxOz2Or/Qznkx6m2mwxaKCG1ZrLrQtXjE0jaWXaml
	infT35PXPhUIu6h858VtUKpQ89S7utQzRwRaRjM8QfnefYWvegx2lfjEYCJZp6TNgEygfNgykpc0U
	4NYGZ69zv8SZbwhPsZOvYVGXQAeWWxVx+GKYJjr8SfsR3rwKUeYS0DXsXjuKDmrSSgYS7Ogjkph07
	VmKai6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcNQ-0000000FKLi-15XW;
	Thu, 28 Nov 2024 11:08:04 +0000
Received: from mail-dbaeur03on20620.outbound.protection.outlook.com ([2a01:111:f403:260d::620] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcMQ-0000000FKEe-1vKF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:07:04 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b7p1g9sZtplGIFDH5/P76Spo+z04AXK2OawU0oGmgwLX/wZp6HwAtha1vQffKRzupvkL3VDhxQOTdpiEP6Gq/iA88uG35GXrr2AKTNeqeJDdLfvyXWPl3WDhHl7TvenfLJAnm0eOV0MaAM3f957IoeHKrFKXMXvTLZzb0oeqDaa2ThaFitB2z5sr9eApThAzC/cDo0K297e/Ff5ltDoOrqtc1RtNT30VhsdDjuQbK8RGonJfGZNIl8C0E/WF23ToDihavatu3Q1hYA4DCT72HegjBrqcZrcWsE9+NGHrhEuAmd2uPIvIHSgb20Php8eafGHb66OUxajq1tN2cwtC/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiL/Kkkky5Z9+rxfUUpR5tWsnJN9wfuskzZ/cSm5CsE=;
 b=Z+nmxZTsqVgneH/vZ0dDgCpfka/vaMwQwSkqPYwB7ziUdv9/a/pfWwJZgpIN3KSgxpp2nYwrxJ7m7bqc0GSLLlppiA+FA3d2NjO99LAK5dvR/p3AL7dCwXmIRXeYCASZ41uKeicomrLFVdw6XuOAwAetVotWS8aeC+MqWtlPaFCfWS7O8UJY+HhzQ0ZNDYT8QBeR4C6TVOk5UIFbvLFaocGRHa0J0xGvowvGTbNLs2TjM9GftvWhZy+dfOEnbujJNZjvzlQnUzsAaUJIt/pof0ItSljuTWGvXkBWcPk3ploU5CSepiN+s4jLbav9PflxeF62o2RfRBfT4MjxfKGOGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiL/Kkkky5Z9+rxfUUpR5tWsnJN9wfuskzZ/cSm5CsE=;
 b=IdBZZ517qmRjGYLDJheAZZKITMe1zA18g/jlgadPCiTaFTfGcxpFiVhuIy7SsJOq9IFpB5V+M21vNgZ8H1zl5N08gfNnVjHrD6z7SB9EazDeYkS1yoi8QLfKynVjCDx7lhWhCL9D3jrxyOrPv4M9AjdXSjBHO+H/9JwzyixVEuo=
Received: from DUZPR01CA0296.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::25) by DB9PR08MB8385.eurprd08.prod.outlook.com
 (2603:10a6:10:3da::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 11:06:56 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::b9) by DUZPR01CA0296.outlook.office365.com
 (2603:10a6:10:4b7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 11:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 11:06:35 +0000
Received: ("Tessian outbound 4eb3d11e9250:v514"); Thu, 28 Nov 2024 11:06:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8de7c7b7362d5983
X-TessianGatewayMetadata: 6LcgoNYy9GPgbHMA3/xrAVuMoFk013RtqE02vev0GuPEj16xvn6aosHfd05WuQbdRsEvVtvRYTisMcGgadCV0jLe1wE+76XD4PCsCJy77GmnNoTE0jkeYIu5bRgnTSiA48rfWZS0blPq5V25H2Q9PTfKkRd0iRTzoqsmTblUSvQ=
X-CR-MTA-TID: 64aa7808
Received: from Ld3e2232497d0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6F5E40FA-66E6-4DF2-A1B0-1E67B318C981.1;
	Thu, 28 Nov 2024 11:06:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld3e2232497d0.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 11:06:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shX/DJlP+mvdB+ooiAO88O3oJT/Mn4eFQLbKiPLEBiZlXS5e4aMubMuvjsFf/TPqrB8n3gICb6va9EFcoYgaN7TisHTzGqIDgrEdNFgetJQ9dlcZCrCuNnnTx/phC3X1QuJNPN+KvDQK/7f3CsAP25I1/2R1m86MV+pTClNNtG8dbnuhB+UA+0ns4BXAzTXU4AL9pIMf6Q5RUhsytvbaZXfDf1jwt9uDheiBVXxURGA56DNvA0R/QFMfpAIzDZOKSaXiuKQiqLsji8tDveODVTGIeZo/jaj0Ri0ZySNRoS/NQ0WAfkeTrHuwc4k/QmN3oS1S6Rzi+9CrK9ikIZ6l0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiL/Kkkky5Z9+rxfUUpR5tWsnJN9wfuskzZ/cSm5CsE=;
 b=DMy4c42LlnedTBL7dHbPxJH5rLYB0ZAUktewav6MhXQ8cquRZDuHej2yphqbHoAHOZHXCz5uVk3XkfE51BX/qsJkvatz/utTT59Cu1C2fQQtqMAnSYkmnWvI5SOCG1ZA1KICwOBaqmIJ8A4LSUp9sHtFVsyFj+m4nolauGPMvu8DrK5EL6nBUqqcGP9F2F8hfxnG08os3QBrS2fi3gzN/ZWwRDg1pVUc4p3/F2SJ7EeC2bpQZxBT1uWRbIMpkY2Vln1Yhyr9X4xCjox0MTDHPUJ5G8KBglkfK/Z8PJQRgWLMsKcRiOFY8YiKu1gZ5yoAOaTCWClwxc5lsV0gBFwRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiL/Kkkky5Z9+rxfUUpR5tWsnJN9wfuskzZ/cSm5CsE=;
 b=IdBZZ517qmRjGYLDJheAZZKITMe1zA18g/jlgadPCiTaFTfGcxpFiVhuIy7SsJOq9IFpB5V+M21vNgZ8H1zl5N08gfNnVjHrD6z7SB9EazDeYkS1yoi8QLfKynVjCDx7lhWhCL9D3jrxyOrPv4M9AjdXSjBHO+H/9JwzyixVEuo=
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB9260.eurprd08.prod.outlook.com (2603:10a6:102:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 11:06:15 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 11:06:15 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mark Rutland <Mark.Rutland@arm.com>
CC: Andre Przywara <Andre.Przywara@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [boot-wrapper v5] aarch64: Start Xen on Armv8-R at EL2
Thread-Topic: [boot-wrapper v5] aarch64: Start Xen on Armv8-R at EL2
Thread-Index: AQHbQYU1D1ouDirOeEm4638KY1t76rLMh+UA
Date: Thu, 28 Nov 2024 11:06:14 +0000
Message-ID: <D246D077-897A-43AF-9B7F-38990A1800B2@arm.com>
References: <20241127102300.2822848-1-luca.fancellu@arm.com>
 <Z0hOCh16ThvfN-Jr@J2N7QTR9R3>
In-Reply-To: <Z0hOCh16ThvfN-Jr@J2N7QTR9R3>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|PAVPR08MB9260:EE_|DB1PEPF000509EF:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9de4c9-528e-481d-9657-08dd0f9cb9c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?WvJULBCKF9KYqmrWN1UY9kOugDnS0iV5BKWPR2oRuddZnDrxcsaPied7OtT5?=
 =?us-ascii?Q?8o8aagcs3Vx/fM9FswJNi64RQfEjAhxy4llwECxFba2cNUgHYsW9dQI+FrJ+?=
 =?us-ascii?Q?FHkWlLNJAQCFemZlavGPWgNJZMlDAqFaGHHfn+ue5R6hviTa4IxUqENgwIoh?=
 =?us-ascii?Q?+wgFGAXkNWBwjIOp+dkr+rnct5qa/X3x6M5qR82DTykbKRluyCLzK255xFZp?=
 =?us-ascii?Q?6FG7nqWi+oVFwGRWZwmXqW9F0lJSLfvFyOo7l1mgD0aJyqJyMK827Zm/T/UT?=
 =?us-ascii?Q?2AvgLJ4ViofsW8dFOpH563tgmMCTDPjlLzt6qJYB+27Oin1gU+qbdKiqbVrb?=
 =?us-ascii?Q?kK3Xky+c/Pjgv6e+g7fgTWm5h7IT7e9+HB8mPvkW2kdgPTzBd6+FnWKso5oL?=
 =?us-ascii?Q?jcRRfGUc1MjvnYZJcJ6KHups4oS7OU3Pw63Mnowl1gMouxnQrI7ru/73eF10?=
 =?us-ascii?Q?BsRwYEhn6CaGPbpYSgiEjZi4ntmPYmDV22CSG8rqk44si1bBs8H5flgKlxx4?=
 =?us-ascii?Q?6OA8Utu/KKMhDmuwLwv9ONmViro2j/F+eN2yLJNmah7H2afDHcq5wpsOuoNE?=
 =?us-ascii?Q?vgVY/CytE9kTCkckHSAWOD8rbWMrKUCMkeRoeyN2jybVF1Vb+wb4pbg+jec9?=
 =?us-ascii?Q?cQDskNl2N2Ltf93nPFQ2ENzmgfIqt3H/HxDMCewngIdZZqvDaQ9gXf2s4YhY?=
 =?us-ascii?Q?p5z/l1UQhbHtb8AfJJqXFAQdLS3hHExCavRWBfI8PAKceagEe7sE4RqvsLWD?=
 =?us-ascii?Q?7neFuAdd8emSU0jZNL+/5SjfaVy3rJGlYKH5IkCEhmD6NrJ7n1198HarLCZc?=
 =?us-ascii?Q?WvydMe9KYNhlU03GlbG5yhrd9f6FxiyA/B1Yuhv6hkWFPwkDHz8mI/VVJU7T?=
 =?us-ascii?Q?ozpPB21plXKyGgR2Mx91nGvlRg5kTORdHWNL5b49095Zj7BAp7VEq1vLxrbJ?=
 =?us-ascii?Q?t0D0vmVjcrug+CHv190kCQYUsU69xyUm0t7DTEvAezbq9FB4vCQGCF1/G/a6?=
 =?us-ascii?Q?Afov+myVq/zJLxAfkKHuESX3vKEzSeZF/gqGciWLlo3K+IJZ2yJtP/3bdgl0?=
 =?us-ascii?Q?sk0LAkOVKiG0tu9UbS36kx5Ji3WUc3EIu1whKgJSXJyaaqjIRNPHF/0waFIT?=
 =?us-ascii?Q?Xq48puP5dh2mhbetpcGv51QGXt0KuNgfyW7UAzbDApHpPsAJ6e77eRmeLxo4?=
 =?us-ascii?Q?OgseglFdF4qUF0WjuekbWwdhTdIM+mUKNVoaMIcFjJTmE4kvFO4VknTzicLU?=
 =?us-ascii?Q?sKPNPLFFp/akspI7ap4JnQ/p7UVb2YF1h6N0kiFZF44bFgOiYvBHZD/HFI5n?=
 =?us-ascii?Q?Q4ph+3ueaBfjIFB0zRjHkRz3OhblS5G6LdnwZ8CapCINq5Ns6SiehktPdKGL?=
 =?us-ascii?Q?57rBXcIA+7SBSE4Vw1k9DYfkEf01G2tmKo8+lWQVCsUG8x+wBg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBE36304692E684F8022EC3C289D9F51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9260
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49a08ef7-4b29-4dfe-edc0-08dd0f9cad1b
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ya/OOEpxNMmqxebj5XxmOFBdK6O2z4tcj1FY8yoatpohyp1ObtHJkkfuOkVw?=
 =?us-ascii?Q?onACeyW/IQ8OgKa/l9UKyImQ9xrFY6tftpsxs3zcqRE5uDJi4ugEAIMMkiMW?=
 =?us-ascii?Q?irOQiiwBNWJkhbNX/HpKV7SDP4FGQ+g82ZgH44vzE3OQQM3F9B2UX0TaDBdd?=
 =?us-ascii?Q?vyX9MdsvWb4vvHPEn1D0hymI+J5jvFK6Ls2npShXju8wdGffIag/6CAztKvu?=
 =?us-ascii?Q?4eSCzrlhdN9cWCpmX/otiSGXKU7OnlZGp/FLrZgjr4wZM7V3PCJ6kqcCWfVM?=
 =?us-ascii?Q?fHL6HpxZvGKi47wOS9CGUGtOtAGZOgThesPh0FwKafwHmMdH1rOj5fNP7T5G?=
 =?us-ascii?Q?J1R63HsB3UeW5VpnxemL5zS4ltRe/QeUxBq++hJdRaHd9XKfh+NWNYc0Il1U?=
 =?us-ascii?Q?s4qHN8G5/hvZZTRJmSUhrF8xYfz8v62/mPmoHkB6bHpx9cqOHFNQv14xgFzy?=
 =?us-ascii?Q?xpWKmn92tlzk9kj1QHQYfWOU570iLwICZSMa9OgCfuXKSxnSba/IQ0sqvAL1?=
 =?us-ascii?Q?OVkWfymg16uD6HvvMBwIV61Z1EM1+6NFDEjXf1ZOyjK/1lKRisrYIzp5uew+?=
 =?us-ascii?Q?c8DxQX1RwbH7OOIcQ/kKJ9ULObJYfUjKLstkA2alFKyf8AoJBDVDkXZaSnj5?=
 =?us-ascii?Q?XjjDPPccC72OOXLkA443IXolpDXVHoD/0FhKmJ4lcz4bIE8RTTQnvRg7Af+C?=
 =?us-ascii?Q?biBf61JBIaKzWnGTnmDrHoFz2p645Ypus9DBWg6POj75ySvyf6m+Xj4ZUYZl?=
 =?us-ascii?Q?iVCftOjLDaZJucaInZwka4dvwgUIJJxxgzOQTHhIcz3dHoHiDSJdOLA0t6Fn?=
 =?us-ascii?Q?cWlINzZf9RMd+Vv8XtDPizekDWdd97UNBp55J1GvO9muRVSU6aiMK8jZ+Dhl?=
 =?us-ascii?Q?Kf8rmRdydqWW5FaARtDgVGDDaQur8fOQTZSuei+0WXcjcOMnHac6Opf797P9?=
 =?us-ascii?Q?osXMxE6vowWqjVl0S8VGWevdut5XQYuEar8f7tKh9mvAef0Rh6N8McLh6eOL?=
 =?us-ascii?Q?YlgySIoMW60ZMCEt9eHZQo1u4WcBuClz3btFIkWzuEIzSTtpCyHlnqVjJvNA?=
 =?us-ascii?Q?Bcdq5c/xlIV6tAOysMe3EnZ9Lai4Ysd18eUoOR45SIvnLpJYdCSdglduRlii?=
 =?us-ascii?Q?QSmzZHGTLDC4kj62U2O+kb6Cf/75jkvsdUev5UmrLuMnEROLS0RAeOQWurjJ?=
 =?us-ascii?Q?tGMSAmGptR/D/nC/l6xeQmUmjcIt3S6raGVxg6s7SlUSTXzv/3c8bwhRz8Ur?=
 =?us-ascii?Q?JLDsdGMS70buqbLPKTMULj5yE0N7IcAV9Xn60kfzLqPpkh16aEIPzSnywwal?=
 =?us-ascii?Q?+htWHxAqAbRQzuWullsEEGcj9KrmNe0vlTkb9GS0eNsq7nvgK9dVdvD9t/7m?=
 =?us-ascii?Q?EnELiXc8PnszzFOgM8/jfXlQSrfma2rhaLAuzvu+X+12mLNiJ2jAOsqwZQ9u?=
 =?us-ascii?Q?2GQJiE+GzjR0dJUlZETkXHebJK4qoPuj?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 11:06:35.7880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9de4c9-528e-481d-9657-08dd0f9cb9c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_030702_648836_8E6F8547 
X-CRM114-Status: GOOD (  17.98  )
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

Hi Mark,

> On 28 Nov 2024, at 11:03, Mark Rutland <mark.rutland@arm.com> wrote:
>=20
> On Wed, Nov 27, 2024 at 10:23:00AM +0000, Luca Fancellu wrote:
>> When bootwrapper is compiled with Xen support and it is started
>> at EL2 on Armv8-R AArch64, keep the current EL and jump to the
>> Xen image using the SPSR_KERNEL as spsr_el2 value.
>>=20
>> The only available boot method on Armv8-R AArch64 when starting
>> Xen is spin table at the moment, reflect this in the build
>> configuration.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v5 changes:
>> - Don't allow AArch64-r + Xen + PSCI from the build system, update the c=
ommit
>>   message.
>> v4 changes:
>> - no changes
>> ---
>> Makefile.am         | 1 +
>> arch/aarch64/boot.S | 2 +-
>> configure.ac        | 5 +++++
>> 3 files changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Makefile.am b/Makefile.am
>> index aecda694fd6c..a8d5c1b96822 100644
>> --- a/Makefile.am
>> +++ b/Makefile.am
>> @@ -127,6 +127,7 @@ XEN_CHOSEN :=3D xen,xen-bootargs =3D \"$(XEN_CMDLINE=
)\"; \
>> compatible =3D \"xen,linux-zimage\", \"xen,multiboot-module\"; \
>> reg =3D <0x0 $(DOM0_OFFSET) 0x0 $(KERNEL_SIZE)>; \
>>   };
>> +DEFINES +=3D -DXEN
>> endif
>>=20
>> if INITRD
>> diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
>> index 565397823cb4..3fcc63bf2437 100644
>> --- a/arch/aarch64/boot.S
>> +++ b/arch/aarch64/boot.S
>> @@ -100,7 +100,7 @@ ASM_FUNC(jump_kernel)
>> mov x1, x21
>> mov x2, x22
>> mov x3, x23
>> -#if defined(BOOTWRAPPER_64R)
>> +#if defined(BOOTWRAPPER_64R) && !defined(XEN)
>> // On Armv8-R Linux needs to be booted at EL1
>> mov x4, #SPSR_KERNEL_EL1
>> #else
>> diff --git a/configure.ac b/configure.ac
>> index a433c89bd2ae..a16bc25508f3 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -115,6 +115,11 @@ AS_IF([test "x$USE_PSCI" !=3D "xyes" -a "x$KERNEL_E=
S" =3D "x32"],
>> [AC_MSG_ERROR([With an AArch32 kernel, boot method must be PSCI.])]
>> )
>>=20
>> +# Don't allow PSCI + Xen + aarch64-r
>> +AS_IF([test "x$USE_PSCI" =3D "xyes" -a "x$USE_ARCH" =3D "xaarch64-r" -a=
 "x$X_IMAGE" !=3D "x"],
>> + [AC_MSG_ERROR([With aarch64-r and Xen, PSCI must be disabled.])]
>> +)
>=20
> I'll delete the comment and change the message here to:
>=20
> With an AArch64-R Xen, boot method must be spin-table.
>=20
> ... since that's consistent with the other message above:
>=20
> With an AArch32 kernel, boot method must be PSCI.
>=20
> ... and it's slightly nicer to tell the user what will work rather than
> what won't work.
>=20
> Otherwise this looks fine to me, and I will apply this shortly (with
> those changes) if no-one objects.

Sounds good to me! Thanks!

>=20
> Mark.


