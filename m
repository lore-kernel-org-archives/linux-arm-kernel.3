Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD4CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UzLX4K3QU48n4tRtF840g1d/e/od+5AkDbktZ05Cyo=; b=GfoR9sYQVJ83No
	dscPB/pAmyDSqVliFJ0SHeM6QwwBu2J+nYazjn1hBwiPWEf1BGs4QmW+OL6671q3HahjC7k2pGfSi
	FsDXSZmY4EjvUrMRQjNV/s9NXvSUim8gWBOIj8SojYvp2KRXyf4O2fq2ZLUVPjr+p0I9edwscpwNf
	C+QaewXM9NNHQ52S3RLphe4qyeZWQ9DYn64FDcpElBPEjdXdyBOirwP4/UANdMvqmBd7/UUXc32H9
	+LKJ4MVKiLLd6gsMHJJ4dp/XXSFOux4+T0giZ1mRhUhp6Z5ZobnnRCzF10U4G4TcdK5WnQv89q72a
	d4IU0T83B4NouqyxQikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIp8Y-00000007IB1-3prg;
	Fri, 01 May 2026 14:46:38 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIp8W-00000007IAW-0CFc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUXW4JmbQUXBnrs9CtWGRcYyKIL0oxPuHr+KOAjFq10j2LwiOAjFXJ6qEIfAlrCCenIh0ekLxAuAS9n3QbG6/zOZV8GdzyblFxjDHoBcOvHTvOsw+YClDHVd728E6ckg/Z7vrjEdFYqwtEcOXZwF2GlYrQLIblkjifK/WoCLza2BZCIC7vp/fTYrb0aFABPXNu8GHQ4mBBuraB7fjurgFxvYv5nKKE50PRRnlhSAN8NBsHjSNAzU2JK1eiLO8HitLyZYw6tGDVGWHUvA9vngk2gPujFEzsQp5vgyzT08uuiMocIrRZ6pACuYmxp7YzTRsA2a+tKgAZgjaLmgxzvd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UzLX4K3QU48n4tRtF840g1d/e/od+5AkDbktZ05Cyo=;
 b=GIOLP9VwImQy7PGVAbseU3MtOOjTTprzsxTXD7s2kLM91LJTNB0lEz7W8w7HNaAgEKCUBqdGrJYpUC+9z5QxHZBff0jJX4Wi2DSIARNPvEz938r3+UZAN5AUF5VsntvuIhwFbXRBcXO9E9BpbzSARF59FRX6RP2qI682XMxhadjSa7iheU6GhCIGYdggpZatLwmYBqfkEmKJ5GIKmZZQeSdikD4Pw+2g1UwBQRSTfx23hHmFlaq+B89PtIXFDBRsctww0ekqAnoIwWryvhYhEwcFydZtLz46JcB20pvtKaoZT7HlqNuwgf2StWcAINICG5Y/pClVPv9GXDVO20Qb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UzLX4K3QU48n4tRtF840g1d/e/od+5AkDbktZ05Cyo=;
 b=dP1N51JmCOEbMqxjUiPzOiwt4uHsgI4WqufO3VLvA3pHVSqX7+4Q8HZKl/MbP3KHDc5LRkKccaM9bsRirY8yAMKglFU2DzmQDOMSPhSMOHR3IhN6BrgudRUcFt4RaoTfryiJcnJ7aiQNCqa+8uJwyNdefwLL5y+P/L7HX6P9nlk=
Received: from SJ0PR13CA0126.namprd13.prod.outlook.com (2603:10b6:a03:2c6::11)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 14:46:29 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::9e) by SJ0PR13CA0126.outlook.office365.com
 (2603:10b6:a03:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.8 via Frontend Transport; Fri, 1
 May 2026 14:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 14:46:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 09:46:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 07:46:27 -0700
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 09:46:27 -0500
Message-ID: <1997464a-26b0-4384-9dbd-4000582896c8@amd.com>
Date: Fri, 1 May 2026 09:46:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] remoteproc: xlnx: add auto-boot support
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <ben.levinsky@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260501143707.1591110-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc2307a-a77a-473f-8fee-08dea7906d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: uELI8w3AZdZN7NCsf2TaHc6eZpo6Dl8BBuMesp19xiN2K6h4/9asiP+KXq0/FqUZXm4pE9p10bZm04tCW5kuUIs0aXGEyIT9UsPfR9Z8r7YUVWlZWDlTMwaqc7bkKun2tjsv/CtVWIPU7OvG+N71rBl2UCWQWHU1mkn2kpCBwl666pT5l+/wtGPmSqwVCbT0SXqurqstKwwduGhCIE4y75s4cpLPsWLnQ+KT+U79g0qtwoz0xB3UehAzx8senv4fJEUoN5LXK7VRBWy8jJucC1fFCIPPWCWS7Koz4yfj0vtYPF8tS3pM0RvwxOgUC4QAP5OJnYdOMRnL1QowaERo63uW0uaXSGkUpjrMP9ucQFmG3cr3t20kScfyzUVKGn4+AR5yN0p6vcSYbPgBEe54qaDcO3dnJ5r+1WLF+oVSsCFswv70gbB/wPSzJqmEqKE8Ba73R+KHXRug+ZPhp5F8RtgyPVgyNGHgfQy3Vt7jt1n8zRlg3V0pMODCOZjtTofq9FEuwIt1VhA8y+UoFM/mSVyxNAjq/QS5pE1/RzMEVVhmJfMAEv/Vmet6FlFRuD9+VOxXr343qC6YSzgYxJMZGkN8hMiwKn37JfYmKUX+tbfrysjtHG6jCruovHGcxPPdfljiEjVD6PjR2yV77oLHxcLDPAmwkwINPM8PxgFkAq3be1NuTyMx/eMX1k/q63oAZDIdbqd93f0jTJ87oUnKJIMgx91MQolG7WekRg5A4IY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wNTnyG/lS6Nnr6OXPevmZVoxTyvXGC4/V2bIBw74uDn+e/gnRN6mOvVrvAFt4iwg7+9XqkO627maXpxG4EGhz9wexvtxdGjTGuwmswsUE13sHTf54qDOZhK8NkbvJr9IOtEWCvnwCPrMJ5JkeIy1Ig9Jh5+v5IuC1TkbUYP/YOCuwgpDK8D5ncJlweyJK7A5Qxq6mtJRVvQR0Vs1a05HgKg9T5T4nbCszsIHB9qw9cdLQH/4nCjMWPcJy2SCvtnqkfm8Hbo1856ouXon5i4oSIsFMJv1NFfoQfvr32S+4nLfwWTuMRynNSqSkReGuGHxwboopEr0okABniRMwx+NCXS5kKI0YE/E+MKKJNBUwxFggvqHPQiXAtzbXfsJAVzib087ChGgBCoMGZPHyumjRMEnrDiIdZruMmKIzYxcxPOKCeYdR0CByfr24aeQRkWm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:46:28.6513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc2307a-a77a-473f-8fee-08dea7906d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_074636_114587_14343C9F 
X-CRM114-Status: GOOD (  11.35  )
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
Reply-To: tanmay.shah@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 5/1/2026 9:37 AM, Tanmay Shah wrote:
> The Cortex-R remote processors on AMD-Xilinx platforms can run
> before linux boot. Add auto-boot property to notify linux that remote
> processor is ready to be used, so linux can load fw and start it or
> attach to the running processor.
> 

Missed the change log here:

Changes in v2:
  - remove the auto-boot property from bindings patch (1/2)
  - rebase on latest remoteproc for-next branch
  - refactor the driver patch (2/2) and detect the auto-boot runtime

If needed, I will send v2 with the change log.

> 
> Tanmay Shah (2):
>   dt-bindings: remoteproc: xlnx: add firmware-name property
>   remoteproc: xlnx: enable auto boot feature
> 
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
>  drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
>  2 files changed, 38 insertions(+), 14 deletions(-)
> 
> 
> base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd


