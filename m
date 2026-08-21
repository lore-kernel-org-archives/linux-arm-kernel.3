Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D0C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRueqje4IJ3kPASChGJACRh4P0Rf+dTxn53GV+MueH4=; b=m0TTEv4mEuRnxDZtWu08odMjKj
	NUsJBVpmVSI6DKM27ONJHz3mAlbYqvu159kQGAluS0laY/0ERQo5fgWcyM4Cx+cd57jbIq+VKlwne
	0t+tSnhR3p3J98DFmfRMne5Ih6CbW6WOEuTx6NDJtHOMWXsvNkuheZFmsqAWLQvSXXiieE3qWbuia
	YyvtomQviadJPzuyPuha5M4jISIGjy85P8PE4unkI2RenWPgAfiMEDBx7sMkwSkK3xAqfNA6JSJLS
	vmNy5d9Errp7gH/KCEgZ1b4OtqFE3GDQAKByQy/1tgjdQa5XezoEs3C6Vww9Q0ivYcgUORbh7mqTB
	2em4n/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSg-0000000E8WW-3aPb;
	Fri, 21 Aug 2026 23:15:46 +0000
Received: from mail-westus3azon11012053.outbound.protection.outlook.com ([40.107.209.53] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSd-0000000E8Pf-2oOs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uO7fa0gdXj866fqwfdlM2p78sxM+4IYsUd6h9Xr6xZciQPvrqRU/VgRaeKr4zC9ZRhZyCA8p6t+PvC2T0EHOrmk/6ni7KO0NCCL5QfcJ3fT1LSX+bXaQmCmJpeOmTLjYICXRmf3UjqBENtiKlQ7tlXVH4cSFddm+NWyQhKJK4yPw6D3JQq/RS5Enoyp7oqrG5clc+FGw6MKf39y9mEyPmT+fSll/Xba22KMU1DOUxtkCdtTAPuFs4ChLdvY8DF2hRp14Hdo40d9bpj2JGrFFR52oqP/MVd+bfQy5Vu4KuKbu1SoBQhoiWb9J69bg98aAiDv8wczGi5uanTOkPqKtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRueqje4IJ3kPASChGJACRh4P0Rf+dTxn53GV+MueH4=;
 b=MwPq8F192ipHWd+p35aAJBgqSmzBM9OYQMo7gA7qWhpn7AHMJ5OAmCseRWMZmWPr2e85+BHxPbx4QmvAtOXYhteS9yDW9asURkOz1UaXEZcuqTxMbGAfOJM4TgHOsHb9hWS7+wInLDxrgeMAC/KqHbZAiMOvms7W9ZaHX/J/CdaHpwFaLxVsmqly3nZbyw+5zvKKEkjSWIfKFm0lPNlFboPOlAOK3spu0tXVK6l6q4my+GwATO5AhGcb2r67Ft7yS94bBzHHp/1JH5wzmWFn4JO/nhbHQFflfF4DEGVpYA+plAT7xg6lYPgj9PteHIK4We56TGnYUtM99RWXH9q5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRueqje4IJ3kPASChGJACRh4P0Rf+dTxn53GV+MueH4=;
 b=aIkJhXe674avcpEwORmewnHBOqxPJwcIj5xl4PpJHQihF5suI9IFEN6ontukunbmC2IpNk+QyC39bQ9bHGcYvSHuM8+zfx/8YZz+oxqvR/AW0TCkowJK/Kbm9GXMXrtgFS7Kq5zZCl8ciDP5HLOO/CGCHRd5vPyz/BuLV+M1qdEB0A4S6bnTloT9ouN0m38GceshLRxToCXrhKl/8lMCWgdRIFvh5u+5bzn6K8mo+dFoYRseH67s2TDU6iMZVoY37vbIE/W7o7edHdWToKjqftysidW+f5VsJs114kTRTPOzDgAk2Wy0ZuQI2jA/te5kYemoUUYBz+wLb907L2zoxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 23:15:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 23:15:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 02/12] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in
 kdump kernel
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
 praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, jamien@nvidia.com
In-Reply-To: <c59f44f2b6982e3e8bd4013395f895cccf9f4a53.1784663184.git.nicolinc@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <c59f44f2b6982e3e8bd4013395f895cccf9f4a53.1784663184.git.nicolinc@nvidia.com>
Date: Fri, 21 Aug 2026 20:15:25 -0300
Message-Id: <178735412597.18212.17006591038244815148.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0233.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: d8174647-9c1e-4951-8146-08deffda189f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Am509l2gSrOobPr2Jj7GQpwHlVAb8kTBKp1V95Ovz78Mf8+GlzpwINqM0edSedZgXysN6vrLaZaZ5ViG4vCrNzmyo9ghP7g8odnrsVngpjO1gNcxQm+VBsaynUMBfoO3OSbHqKQ+ufQeu6LiquHq8uRIG7KA/dSW+vxqAD8WTk0C2pbq+TcLzppbgKz5ndqZbERU+/Vsc9bXfZAGIF3v6UN++hqA2cWkdWqonmflr4zcC2Q6ByEP/GMXihobjwm0bnHDD4rynSPkhQcZ2us3mM1cp6ARoyAyQFFWghiv0awh2KVZZJsZGZJIaKe9/WyrovViDAcjoPQVwvPG+AxhsqJRUptLfE40gqoV78Hf7P5MLOGD33lIWrc6Eds5406RPSwLNyipj1TiqR7wlnJTW/cTiOn4irs8hFbpQKAOzgAud1ykSecCHtgntYv2dJzixxXg5e8II+PMoq7H3V9aZx/2qTCOoP8GPmI3RJkKKMbnuNFM3jZ8EJ2iA7Agwqem3VMF48IWf1rUA9fgYs83Ewj1F3j5DDb5IEvqfBFPQ61qcYgY9cGKsAjqj75K5LY/8lC5tgiAK/OKKjOrrMLWMIiqOzDD6XBycq987bLsGtbOSfDgQWqCNkpWdzJtseBPe+V5izi9QwvQ/5bl+4kqLGCJhnwZ8N/no2S15sAB+lI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBvRFJKUG56TlhZWExTUisxUHVPQ2YraDNuUm14L2FvK1hpSEZDay94ODZv?=
 =?utf-8?B?UC9JdWkrVGtNemRGeWdTZmRXMFF5MWNNRGZ2SU9MNDhoendIeGpVMkhQaUNt?=
 =?utf-8?B?RGc2UlJRL3BSU0dNY1VNVDFmazZNQ1lPZEpRVU44TG5jelcrTDQwcE5BSU1V?=
 =?utf-8?B?aHlCZ3AzWkZCbk1mSmQ1UGRMbDJiUXAzYVB0ZGVoVWg4aGw0d1drTjRYMzZG?=
 =?utf-8?B?OVljajJBQTFBNXdNelFDRHhUUXJwYlpJK3VXa280MXpwbzBCTUFKRUc5c1B1?=
 =?utf-8?B?RFZsMHhTcG1VN2NpSno1c29WT1o4TDJFTHg1b083OElTcGRxSXBTeUd0NTVl?=
 =?utf-8?B?OWR4QXRlTW5JZjg0N3hVbm9PVVZJR2ZqMjBQM0IwRW9NdloveTJIRHdBSnZx?=
 =?utf-8?B?U09qWS9GSlQ4a0VBL2JuYmIzeWRxb2o5Qy92L1djRVk4ZzZ6bkV3SEkwYXAw?=
 =?utf-8?B?a2N6d0QxMXhUV1lQNE5UUWJveTlqNTc3aUVtTW9HdDdDT0hCMjV1SUdtUlI4?=
 =?utf-8?B?SGFuS1RUeTJtTWNwYjVjci9jTmR6a24yRkRYa2U5NGkzRWJHOUp2QmlLU0Jy?=
 =?utf-8?B?ejROZzB2cDB6TVVtdGVvMzAwd1R3enRrTXRVY0FvcGRLdmtZNlBUMDdMMHJo?=
 =?utf-8?B?RHd0dGtYK2JQemNtOE9BM3BHQzNHQlZUUEpjcE4rMFd4d2lobHVlWGZaamdk?=
 =?utf-8?B?bnNmdCs1WklKS01sZlpqSjhrZmc2UThqTlFDL0szM2Y2UWhXQXBjUnVwMDA2?=
 =?utf-8?B?OGFBNy9tdnJXMzdpUGZSTW9kRTRQYmorZWdYSTdBZmJRMzVKYSttVStxWGlX?=
 =?utf-8?B?ZkJsVS9Bd1MvclQ5M0NiV2MxZ2dNSmpHZGFMdDl4OGhnMXRhK1NuMDJ3UHls?=
 =?utf-8?B?cDNaL0lKK2l3bkwzUDVoK3JGcjVMZnVnV0VSQXRYUTlNUCt6eHFvT29ZSVMy?=
 =?utf-8?B?b3N5b0dYczkxcTRVbFNOUTkxOWlzQjI2V0l3dzBaK3JYN1U1akFZMzRUVU1l?=
 =?utf-8?B?RGRBSXdqT09XdldPN3B0Vk1sTU9lUkJlbjl0cDA5cW5UTHllb0cwZlVGOVo2?=
 =?utf-8?B?dGZnMnBPRDQ1SXV1VUtCbnVLMy8vaG4xZzdNWFZDWkdoemE2UW5UVmlQUmI2?=
 =?utf-8?B?YzNsN2cwMFFleGI0aVlBOWtpZXhQSEpvSWhaWTEvd05zV0hLNHlTUnJUVysz?=
 =?utf-8?B?YWdtUVFaRHRmUkFzOE5RSFVxcnQ2dEhsMktHaVY0ZGNvWCt5YlNudElNNDVr?=
 =?utf-8?B?UWthVWtJMkswalRHekpVOHdDa3duUFR0ZjhiSHoyNTU1VDJ2NXZPWENvL1Bn?=
 =?utf-8?B?MkZUNVAwMG1KMjhGcmVHZmM5WE1KUlZMaXhpVDVVb0gzZ1l1TmxmU1dEUzBU?=
 =?utf-8?B?NVZjS3kzdFFTK0hlWEpxdnpRcE0rWXFQYkhFV0Y2UGdkUnlQMFV6aFR5YVR3?=
 =?utf-8?B?UVNoc1ltd0JNWEEycG9Zd1RjRzh4ZkorMEhaNnozK0VCejI5dzhiU2JVMVk0?=
 =?utf-8?B?YWZWMHJzVWNKb2RtdnMvc1NuM0xzTCtEVjBCMG9heEtLL1lqUGxJOU41TVo5?=
 =?utf-8?B?SGUwYVhLQmRSeXRwbW14TmVVb1lMOVRJVVFRSmlVYUR2ZUVucmhJd2pnWnM1?=
 =?utf-8?B?ZnNqeGJ1aWhUMC9MNjlReUswNHpGY3hpWGFqeC9IWmhYTHZxQlVjaFJHL2hm?=
 =?utf-8?B?SnBlNmlhODB4TDRNWU1vMUcvMXovQlJEM0c2VUUya296Tnl2K3lvQnAzNXlo?=
 =?utf-8?B?STg5RVNPVEJYMHpZeXU1d29iOU9sUXNHclcyWUFwNndOMG9mUS9RMVR2MDZO?=
 =?utf-8?B?VVJpOFg3MzdEMEl3R3hRdzQwRmZ2dFVWQVhRTHN1Rm40ZW9WNy9sd0xSM0p0?=
 =?utf-8?B?bnA3NFh3SlYzdmpJMW0zZjRWN3d3TjIxTDVIUDc2QnFJR1cvUU9zYllJSUhX?=
 =?utf-8?B?VTRSeVA0SEwyeng2MTJXT2lGeHdFUnNLcFpacmJsSnpYalliMDdBaHVDaks5?=
 =?utf-8?B?SkRVOTdLNTdlR2d5ZXZDOWhSSnoxL1E1U3Yya3FTSmRJZURmVGxEM3lxVXFt?=
 =?utf-8?B?ZGt0MW4rcUZXM2tUUDA4M3IwbVVJWUtEWkc5bnYxcXlpVSt0VWRPVDdLYXpO?=
 =?utf-8?B?OExKTHVvb1BLemxWRkszUTZmSkVyQjdkUm9pb2F6a1dCYlFzOTZhd1B2emJV?=
 =?utf-8?B?QkNLejdVdFhBeitDM2VyUnRJNzNsamRTQkRJUjB0K3NEcW1qSmpmZkFhSjJH?=
 =?utf-8?B?Z2hJaGlEemFtVHVIUi9sKzlYUVo2dks5SUNEZW5NaVU3ZitDUUVJTGplK3kr?=
 =?utf-8?Q?7f6bbt+dlrxy0wCxQS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8174647-9c1e-4951-8146-08deffda189f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 23:15:31.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/R0G4ccgbACLh8wRLbXzV4TWcX8rnqouPk9EREdkFJAyVk4dFegb03AI9Ax9+tY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_161543_730503_3B214ED7 
X-CRM114-Status: UNSURE (   9.45  )
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

> @@ -4821,21 +4821,36 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	arm_smmu_cmdq_issue_cmd_with_sync(
>  		smmu, arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL));
>  
> -	/* Event queue */
> -	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> -	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
> -	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
> +	/*
> +	 * Event queue
> +	 *
> +	 * Do not enable in a kdump case, as the crashed kernel's CDs and page
> +	 * tables may be corrupted, triggering event spamming. A disabled queue
> +	 * simply discards new events, without raising any global error.
> +	 */
> +	if (!is_kdump_kernel()) {

same remark about a FEAT_EVTQ

> -	/* PRI queue */
> -	if (smmu->features & ARM_SMMU_FEAT_PRI) {
> +	/*
> +	 * PRI queue
> +	 *
> +	 * Do not enable in a kdump case, as we cannot serve page requests.
> +	 */
> +	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI)) {
>  		writeq_relaxed(smmu->priq.q.q_base,

I'm reading this again and wondering why not drop FEAT_PRI much earlier so we
don't need this is_kdump_kernel() here?

The logic still looks OK to me

-- 
Jason

