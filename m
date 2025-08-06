Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F310C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg2JIcKnFAcrV+RWXxLZLn9hSinZbwzzUSvxWSgR8tw=; b=quugkyXZwI7m2ByDYwP5phdd1t
	6d76MMnn4qYyPfM9hBnEPWM4hvjzusK/dcE+2Q06G4g41Y5TSttQsm2hmeEHNRSPpiIprYu/Gvq4N
	wBfgVCq4SbFQ8kWfwVMPruL632jNDSDihIgOn+v3aiZTdRkSBdw5sXdAGlmtapoJOAkR7RhXFBfXq
	YKOZOZg1qRpTss1atuAzUJP3CC+gzVLaL5TOPz3XQhu775imK2D17E4IQMrfiFn26/56NYZewCz/o
	uIU9g0cigZ75oU+emm59r91JvMom3pvJf3hyf4RrpAwW7CH4bWkNklYcpybA3cOBjcG88QRVQzBkG
	Q0i17/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujd48-0000000F6n4-11ow;
	Wed, 06 Aug 2025 12:16:20 +0000
Received: from mail-bn7nam10on20619.outbound.protection.outlook.com ([2a01:111:f403:2009::619] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcbq-0000000F3LE-1s6m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 11:47:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7FCiCSOMuVPDPWNA5qSKHiQBgtQMIHvDj0y5/Rvz2IieopzuywExhQT2D00/H80h/UDixBLCp/kKrMPBVq0PtLCfO5ZKZRk3gy9NresFyIaZiFrDITg1Qj+h3D6Ea1AKF+o3aHsvpt9vIbaXYZhekI1uegxuRb40shHbWXvNPDgTnGkPGCPYs6JMG4+4a4gkH4ND+JqzUSl54bin9jXXwdvzI8bwF/4EwKZvAVYsJIW+nCsxeMnJ1eVfchqKKOyHNHZPMUcd6PZRbMy8bz5eUQ6vNbwFYOZKyACO7E+7iPRyN8V/gUoUvUoqy5g31RXn37bIJlbq3ar2d7W4Z666A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg2JIcKnFAcrV+RWXxLZLn9hSinZbwzzUSvxWSgR8tw=;
 b=sTNPgbX/U1d0bbOYn5twxJC2AUFdEsykwrtwENFvKk7FGyA3P27FHPKQvYTCXzOdAWMsYNR4OH7yCIyHFEDjdGk3a7qPd/B4MBs7lldxacAoRdVotnmz2QNc4TGiHaHf5ahZW83/5LBoYhCw26aQ1u7R/7s1bAvlMFJzsvjhObALJVqlID3Jhkb9nBrrB5vIMC/3dFfz1NDyZaSAKx+IRH4FycbAcd5tKLFtgnvxEaNEF1RXtPXthhmByW/3tdgVfW0CsUdIDa83RX8RoGdlf4MmBxB50mE6ESsaEnC8pGq1xKTRUB4wPlsDbGnJQx3rzrDI8g1jdQnzufNKlD6zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=debian.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg2JIcKnFAcrV+RWXxLZLn9hSinZbwzzUSvxWSgR8tw=;
 b=UfciBLm8TxceZBe1AZRbCXnxDeHmHLv+SGPMHVqrP8VBjqZsf8NxojA+M4bdSuu/3pfX+XDu+59vsCGvxSDIP0oPf0/OFhbckDsl6TM6vXTX4/l3qNMNACJDCSWO1P7QLW+1uZqmto6vr7ugSAz1XGyWzYXgzkfZVz87ousNaiWuwz3wokkIhmHMNqMQreG/xF9mwy/gxCMQFF7KJFAGZ121YiGHhv+Ltu2jELcoVHTqe8G2S30lN/bAi2gapD76+8jFtwYgTXukYzbS5Z2SnE4bsizhBHpiSmQj6IvMuPTHakFRKFZhRxmOkXc1GBQzrkAV2WikKspDj/FWfNiAgQ==
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by SA1PR12MB8945.namprd12.prod.outlook.com (2603:10b6:806:375::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 11:46:55 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::9d) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 11:46:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 11:46:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 6 Aug
 2025 04:45:58 -0700
Received: from nirmoy-desk1.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 6 Aug 2025 04:45:57 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: <leitao@debian.org>
CC: <catalin.marinas@arm.com>, <cov@codeaurora.org>, <leo.yan@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <mark.rutland@arm.com>, <paulmck@kernel.org>,
	<rmikey@meta.com>, <rmk+kernel@armlinux.org.uk>, <usamaarif642@gmail.com>
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Date: Wed, 6 Aug 2025 04:44:41 -0700
Message-ID: <20250806114441.1605047-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aGVn/SnOvwWewkOW@gmail.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SA1PR12MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0fbab7-8517-4c8c-8cbe-08ddd4def0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wBiSuFGCHD99S2LUEKmziR9mqAIIA2KYH7ugh3srEIw/MUQAIO5u/zpXTdWu?=
 =?us-ascii?Q?lS7y1QRnxgmie//JsQ1oMGLbwnxwUW5s0tCylo9hmJnowxpG1rE97hWAkm6X?=
 =?us-ascii?Q?/5IJLe1dM8RNdbr0bJ/HL+8Nt0L1S52Js3iiPiRQAaVtVnKWtB4SXedPG6hk?=
 =?us-ascii?Q?Zj3DaByNZdq1IyE0mB1AxvTjvpSH2Cp2YpdkeMUaUNo2D4pU2DVU5bRFdBW8?=
 =?us-ascii?Q?praE2IGBx3baajtA5fUsjaTC+8MoF9j0gL7EolThevpTph/CUnreYJgHoY06?=
 =?us-ascii?Q?oYajLT1ozm3fzEbhk/VYDExacNBs/pMWkEMkNZzhc2J2hVVbhg6FaKftz93i?=
 =?us-ascii?Q?v844w1MC1KgoqrG6OeJB0HyMErMryRni+O5Gz3cufnM+Uf7mEL8wxj1LNYPj?=
 =?us-ascii?Q?eJEC94gFTt/k8HEt3zBlZ7NPm66fyCebbzXEHcrEMs3T9hBuPrjgEOjLK27z?=
 =?us-ascii?Q?e5gW+A/5fP00kUMkVkayVa1T7Jmo9Vrwru4Hb2AYGx4jFxST2uG6BP27UxYD?=
 =?us-ascii?Q?Y26cwkA82eDwY92+Ot34eFhf8+F6ZgBbSToVDkeU8ZXar+Wt3qEWtRds5Wcn?=
 =?us-ascii?Q?3ez9blt5H6fjlZ3tR/8UwNxz6VZyeqGru1m4QjWeSnpEgCNUTBF7X9DuBKro?=
 =?us-ascii?Q?8KeQ1+RUzMLO+JwVptObOYd1FTgnQAGyzBUEnNLcsOt0ke7nquZvgXqzgzjM?=
 =?us-ascii?Q?igAKBZXsvQZuVVlZk/418doRW5PiExeeWX97XbGBtaG5vbspOhDArfkYegv+?=
 =?us-ascii?Q?o+ILHPiMaSFQf6IfOYx+Jc40WVhVsEtyDwHPSN0vCB/aYslXnAvdY6X4nPRd?=
 =?us-ascii?Q?MV3ZsFpERIuNxCb17wAgmACe4gkzHG1A4dZ52csf83GQS936zX6OuBEhK5rt?=
 =?us-ascii?Q?co0ut/AZ38TlPHfg1kqe5wXyReABYn9bvP9SteJdnyttqKJ39I+GcCEKon3l?=
 =?us-ascii?Q?Blywe/rXfnJLZLfifxBjDLTf/lg1llXkl/jKxOfTnV85pig8Go76i/9dPWnR?=
 =?us-ascii?Q?27zMKAkSXBLWehxzqEKMIOdvCQdHjbR0ioQcnKH7cNbPa0I6W8dsivoc1nDO?=
 =?us-ascii?Q?A/6NxVA3WmY79qxxOWRDlhLwlyMjSbBcAC/36wvAcr0k0pV9ttjuF1Etn61y?=
 =?us-ascii?Q?W1UxcDP4UdsJSbzD5FT1qtBSoc4eo3v1bTafWrNe0saVimqP+boWFM4jF+Sy?=
 =?us-ascii?Q?DbHl3+l8J58xpZ7tt9W/eQrYe1SxJbtsllQy1RD/ehO2rER2M/mzxWcU855B?=
 =?us-ascii?Q?KGsBHypPyl/JZ7Z2CLm9m3rZ9wwDYJMQ3TdJ7VzJVfMVK1DTZ4jF6VemsfDV?=
 =?us-ascii?Q?vKtOF5JSUUkk/9tuJxDrRGVA99adnFODo12BZUbY+cxN36BwPoAbP43CrEyG?=
 =?us-ascii?Q?Ostrsm/WN4ERDK9sMvJI2t+wfKb+YGsaWSyNOAnjjWMynG75QknHBA6xaQFC?=
 =?us-ascii?Q?u7OC9tCOel9fvvZqKdufC+C2o07lFG4BOqRFv5dGvHoly1o4GBzoG3l5Wqte?=
 =?us-ascii?Q?x27MKxVuK4LnwVmKg78kVa2hT8TXFUQKZlE4XJFXYSuO41yf2L2ZT3YUHQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:46:53.5627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0fbab7-8517-4c8c-8cbe-08ddd4def0b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_044706_481725_4A56ADD0 
X-CRM114-Status: UNSURE (   6.80  )
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

Hi Breno,

I tried the latest kernel which seems to contain a fix. Bisecting it led me to https://patch.msgid.link/20250604142045.253301-1-pmladek@suse.com and that indeed fixes it for me.
Could you please give it a try.

Regards,
Nirmoy

