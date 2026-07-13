Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F78FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xCUAaF3E+q9DGG0d5+j0bvgDxHGS+6lEf8jecnHXHw=; b=Rhy8cFM4D/pWsSa9QcaVaNuVw3
	0FQ2yoC19waJm+eLMoXeiORHzAYH9oBPQnZNAk5BXpQ/cFuJCsI1/QH0A6nPkPY0E7wys13RbqXwk
	IxcWuuRrXOi0oetxpDBP/1pm4V7gDlDOkZ5M2keaa4bEK3nS+Qn/Gaf5WnL8R+LVLiycppWWz7PTA
	dzC7u9FqIa3s1PkjDM8Rh4e0LzhyVG3jFbRsJFAx3HmQIPNzx6re1jtrHb4AdjQvhcEEcTdqpmc+B
	9esC3aiQzjbeMyuT+9ddBGOntvY/SX0Jtsa4g/82hAaHqbpnTffoLxyq+m8nFKgRQagWK2JGe0bQn
	L5QcMqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLkE-0000000AEuU-3b1j;
	Mon, 13 Jul 2026 18:51:10 +0000
Received: from mail-westus3azon11012031.outbound.protection.outlook.com ([40.107.209.31] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLkA-0000000AEtw-1v3x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5qD45F9BwKJ2BbYHE9hi/rb8VzrDlCnR/wj50NVFBe9DCuojKRIi3ewP9y3h2HoRgCoWx15z7T8Ka8PI/74TyWXkQ4b+LyW7EGB2VPSpBOO0IW+WmAma6VxcHQPJGKWpufSrmbfcKxP981XJ3aL1ESLtS/h+ALx5zo3e9vezItsTg+Y1CFDns8DFdDQciPXSapcLamO5dM6t1FmjRD2M8PGN5k7+S7kv0I0cIicXfD+LnkW0iWGThI5cp9bRorDzFKa+ZJEZ5Y2GTn3nvPCrn1fKPALu+47OeEqBZUBCWlC+SQwqtv3L5fuRDIA9RUeWvy4qwgCy0J1rua/2gXkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xCUAaF3E+q9DGG0d5+j0bvgDxHGS+6lEf8jecnHXHw=;
 b=g1rvG+KKlgwJ1XYB7FbUIDDaX8zGet5WX3GBIWG3qOijiuEs14mxOrUi1YfCI1/lGupC4povrQmVAgACFtFaIIlvZHBjyfT7Hu+wGKaFMInLLIa1zrl/DRlBhuFQXDu3mg76wRD2MtMp57fT5POZchCi/Iob1I45+y0qKbpBHFnfqf5MKPU4S3zXUwWpm4jAgfXN8eE47WdLbgahACuQsXOHx10wiApNQOf4cdLY7jcH0uw7AKii2hkkHcxvaoupC9HVg8zpJhyPMON4iwvnyHx2YNO86za4eyUh4Je/os5WaLnfqxyKX7Tm1xiAtLCdD+/P4Sy3+SbPAXWPFwXPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xCUAaF3E+q9DGG0d5+j0bvgDxHGS+6lEf8jecnHXHw=;
 b=oETTL/mn1khXGHHdQEX10Mr0AR+Rl7ZBhdFAPSjX9PiGwmC5dSRKtMRObrc4sIlhQzMPfUQ1d+HqULH28IdWT6TC3NSNdILi6vZk6lRzQRgB4SBEZYZIEtVNSoI5at5ZE2MpXgJ3U41+eeGVuxNz6E+r5YsPbuEddJ28hDCs5ttXT4Vdv/EJo/T7x5TjDoHetGpw272qwcv03Qc86d4mbg4pg260OiIP2S5gJEsFUBxfWhzGw6tzqG1Jf2s5btQfg5+PuciDJ945TFIpBkeXGOyg6YuSBBdW7I6G/G9oqGrctsxvGEXhSI3SCZDYioLFpE559ZOHaOZJMhlDWfbHbw==
Received: from DS7PR05CA0083.namprd05.prod.outlook.com (2603:10b6:8:57::29) by
 PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:50:55 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::8b) by DS7PR05CA0083.outlook.office365.com
 (2603:10b6:8:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:50:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 13 Jul
 2026 11:50:40 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 13 Jul 2026 11:50:39 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Jul 2026 11:50:37 -0700
Date: Mon, 13 Jul 2026 11:50:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Len
 Brown" <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>, "Mostafa
 Saleh" <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v5 18/18] iommu/arm-smmu-v3: Block ATS for a master upon
 an ATC invalidation timeout
Message-ID: <alUzeyRh5FnzMiQ4@nvidia.com>
References: <cover.1783044582.git.nicolinc@nvidia.com>
 <939885143f3064811685b3f31f6f30f8a713c89e.1783044582.git.nicolinc@nvidia.com>
 <9a85cccd-29ed-4c51-b9cb-140631966d20@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9a85cccd-29ed-4c51-b9cb-140631966d20@linux.intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|PH7PR12MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f400e3-6169-4edb-0c08-08dee10fab34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|82310400026|1800799024|36860700016|18002099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: ASxgbWdqTuZobAGV7J22zT4aQdD9OCzmimID3DtlttfZQxrtkMT0x6pSTaMs1s8O2sC++lJCxbhTsWOif/TH047sdr6Q3rUGwZR5d8mERUTvyc+5GcdD9QjVqMpcmWPUjrOgPkEcNwNysdU4u9cjX2NMGAwXUCaFuyMiuKLUyu/tlx4iQa/abUzlmjL2iGNfbg1+CG2E85FSYhqyfCCr1gtEPYJzpZ99es0HKt67fXw+tou/W1Rqpv6NSeU5Stp59wxeL993xBnCdrzZsUmcRnAAnlW/xtKsmLJO9HDsT8flybLxw4fPnmJtf6B6kXSozNTP+Em9R09AuIVQ7lDOuSaJUDZSWhdHmpNHwUnyebdb7uj68k+X+l8o/Mj28OlovaS5C3ownAAewwgCPMWAxRE5yCcfe7/ZpzJM30vErwwqHsSiuk/4pg64ficiXsyw1jTt7KRuL27eHuqDyqri6uWxqXCNsTodx9Whi6dh+0WHADJs0kzNbkiyFrDAWOhGe8KTF5BSaq/GmlWCvNHiPHv4FHdopUoLlkMXRKVTcteZJSS0O9uq+mQDskKeqlOb7afPJy1+o4Qboj9X5kTkbwmgLzcTFRJKyZOpuB2RIjAQdLUSRK/OxUzNvf5Ahx1H7REMG/iZYF8+FcdvDuakdF1NqXay0Yo3fxpjAiHHTZcBleMpMhoAGaZSG+Vwabyp+f3jHV1/6v74awktKNGcmg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O0bZ6NkaOvW7NvRp4oJwjvIrggbpn3epr8qkauqprYP2XF2iaDsqQbL07UGxtZFCXGuWUhGmxht7yTOJHV2ZeQiO1JQqAC94+b/GvL3vmLTMvnVXybdatCvUAZFs+NTtz0eId0UKnwCl7yJnMM9+54UwYqju0tvL9mZCCObaVjbLaKVchvAzo7Vzn+KRgpsQ03K5+FjLcaZ3WY7rst7PRuePZS/1gh+O2I8Z/dsh1Jjd9pXicCtTaiNfU2l8sffFTmhipMWEFBHFCi0sukpCiUWseOyBVE6xgiN6xUxG7VaUmLz7xXYmwFxZcaIMBlHbvNitYpVHfh4Ed3ry54BUWQaOjsLHBLi1L60iY+n7NZv1utOg06xMRS/pJP9zFMBVondDWE9tLlXKltV+qgzZ1jgcptwY6cOatfr8HUeHbTeUm8Jdwm2Gux14jCmvhiij
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:50:54.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f400e3-6169-4edb-0c08-08dee10fab34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_115106_502853_F3A8DB53 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, Jul 13, 2026 at 08:20:29PM +0800, Baolu Lu wrote:
> My understanding of the sequence to quarantine a faulty ATS device is
> to:
> 
> 1. Identify the devices that encountered an ATC invalidation timeout
>    failure.
> 2. Have hardware block incoming DMA transfers and translation requests
>    by clearing the corresponding bits in the device's context/
>    translation table entries.
> 3. Have software prevent the driver from submitting new invalidation
>    requests or re-attaching a new domain to the device.
> 
> If this understanding is correct, then while steps 1 and 2 are hardware-
> and driver-specific, step 3 seems completely generic.

Step 3 is kinda driver-specific too for a few reasons:
a. This is in the iommu_unmap() context; called right before that
   function puts the kernel page. So, all the steps must be done
   before kernel reclaims the page (potentially to a new ATS for
   the same device whose ATC is stale).
b. Invalidation can be an IRQ context. So, can't use group->mutex,
   which a generic helper would likely need.
c. Given (a) and (b), extra driver-level spinlocks are required:
   streams_lock and master_domains_lock in this patch.
d. Step 3 actually has two small steps: disable ATS at the driver
   level; disable ATS entries in the invalidation array, either of
   which are currently driver-specific.

Jason has a view of moving the arm_smmu_invs to the core. So, maybe
step 3.2 (disabling it in the invalidation array) can be generic in
the future.

Nicolin

