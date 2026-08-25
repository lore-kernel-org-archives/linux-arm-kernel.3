Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45D0C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHC+B6POMRH/tnT7iPOQvFgVE84W4y82dQWvEJzKP1g=; b=giqyyQTLQ1NuaK5K1QiwrXJQiJ
	X1nRk5VduQSZZXrxi3s3PktepJ2SFkqsmZmGDBZn1iZbF9yvm1PTWCOE8reeJIsi9Kb+I9UOfGeSb
	5l3+8qKis5npqpLuvgcVyX7yE1TOHJ89VXTyviMaQQEvpiAWq4VRvehpSIbYuRTNoht1giluX77Mb
	jf+9/aNTx1pkf7pJf35t3uU6xR0WAj0V4wNykr0CMJxARGpry9Uoy6GJNAGgEu5jf+Ehw5CLvK9N5
	Ug2folht8TMKgqT88xSZVjgroABkMQM+MemnT6VKR3AiTAkGY9/gahjmH4LW93thy/8mgRiU62JHo
	8nNJNqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyu8Z-000000017TA-2Pch;
	Tue, 25 Aug 2026 16:36:35 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyu8Q-000000017Nk-0uK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+7Xc/SpzCfRbnb0WTtVAyZi1pNBvNBKQcotI610+CYK/Q4cjd3IE0lFGsgIq42LEdQjDVN+622NVyN+IOKm+MWyoHUKFayfHTvKYU7VyYz7naOmO68u1BjiYX0ocKEGflxMcN0tPpakxq48x77+lrLfTcypXgw1CkdVG33TIWs+XS/B0vvj/OIct6psH120FLeDbE+hqCnk/7OrOBzwsOqWk+7Tp+2F5cfTx7BaPsrxhqpKpKaZOnDH8Pl3P1eyCT2HOAC8Who0T98PtdDMr9n6HOVWlKbXl9drUgUoubisnq/y9YmOyN+nKu2rWezTPRMhlR6yFPttsn9NrOSibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHC+B6POMRH/tnT7iPOQvFgVE84W4y82dQWvEJzKP1g=;
 b=gD93UYFCRtZuHMJgANV9Ci7beowbs1TTItgI8JqkRsuMLTY4iJsvaU6EiVfNkqND+NumcukuAwzfnC6rNY2HsDUNuk4IostPdQd21D9NpbusZCSESR80n7LOJNIXaiy7+VMMBDXOKz3aEbXn8kgIW+QbNyIEC6bon7dDQA8jsvc7JRam5YGBwsa/hWJXkuAy1R38PuICL7Tp0wghvw0omp63puLx3j/lNzLHX9voRosPJmzOdGzxPVZlMnFOWXGJ68fvLiKCwUMXYmuLbcDw2AvZIdacgcOyQfOeV4OYJFqoBYowUHsOMAB/SIQXpotgIK7xie6TSqqlCay5g87KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHC+B6POMRH/tnT7iPOQvFgVE84W4y82dQWvEJzKP1g=;
 b=S/Pccl3fESQbQssI/3I8JJF7PFJ8fuSM2KokjkDhRPCMJK/Mk4yhxzeFi7A+gdCa6PTbQdHaweC3OWxKRC9/qtaHFWV8IGmskPXA1m07o6jgW1h8mRA1IIZix3gwjk3lQD4wYRBXggK+iDrThM/OvLugH5Me6Zi30+2o1uUE0rrGLrb35xi6uUJE8FBUi1Wtor5oeNOv9U2OCpAmFGXNdxxpKkgvi3nRtPmwLXhBFMVY5+lDN2o9wyu/LRp0w0NDvDHOLbEa7dt/E83V7hfLCC0zUnbz6ASSmK66L2UDOqBN2VZ5VwzyQOKlfjITPZ2sbxoQ7TMIrW0lyrm2ba/c/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB9466.namprd12.prod.outlook.com (2603:10b6:208:595::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:36:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 16:36:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260728210928.1050849-10-praan@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-10-praan@google.com>
Date: Tue, 25 Aug 2026 13:36:11 -0300
Message-Id: <178767577113.3356902.28128835506777632.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 10336d8d-942f-4172-af2a-08df02c6fb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|5023799004|4143699003|56012099006|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RpgukfMelfXfOcXV5NdgCtSwWC5k7qkwWl9bd4eEd69QUVhn7xBriLzLVK7k1O11v8U5n+aOlvcVPDOsJBk0KTzbsuDxKEjA+FFTtR01PDa6GQnzIy8w4xOOhSE0TPUYsV5h5040Y5A4ILQZ196zKkyJaMJcRLscZ6XtNyfBOBhd1FAw3ZAaeCE6QM+JUpFLAf1Ocqynb8RI9uUv5260YpZQCU1020GPHCy5EE3XFXLzltulQiDsIDfzlfYg69P2uxlLVxo83qZ3ruykuw0NOCvFsb5ViJyqMPSeu4fSFcKbK3mlndrRUlKOS00rVwr6VK3L0vduaG782IYKPQ1G80bXpzJyfRo0WIZ7SYmsseh/5k+MNpFajxr93IjDstBqmkCMy0CDs9606mA9JDdvnZm2hi2agaPzGhH/wOIdn5evIBUV0a5BucEQXmR+l4g/Pgn8eBoDx+XfQmQBtsGkxUd4SfnT/ErATgiGSMSq5ty7dH9rWoubY3dvqd2/oI3SHdZAEwR1q1U6sGXkMLJVoxzortXxlFUiyzK/6AKK3BT9u9TJYULdiKOKO69NBVlI8AAHhXcGecjGOCqBIfLreqaf66kM/fJLvR9MsExkCifpE9ZDuTIWanAZrSz0QhQba8QXGLSoak2w2CQ0Y+FLMPIJcqVTB2frUx32Gzie0Tk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(5023799004)(4143699003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tabXRIcmNLVnI2MGFqMU0zRXNoSm92VmpUY2s5MEl4K2MwQkl4WmppWFhz?=
 =?utf-8?B?SXdGc2FoNEg3WUpLNnQxRTBTcjVKVFVVTWNqS1c4dzdRVm4xZlpHT0hLRmo1?=
 =?utf-8?B?YXdCNVV3MXpnVzdPN1cvV2NHWUNHV3A1WlJHU2tOUDUzOElyb21SdUc2elJN?=
 =?utf-8?B?UmF6Sm8ybEN3R3UrV2N1MGU5VnIxeXFpSzN0d25xTkFNb05CeHYxSU1SVHBV?=
 =?utf-8?B?K2ZadjJMVWdRL2RBTTJkRlZnSjRnZE9rbzQ4cTk0Z1RvdUNzaTlOM0R2UFZ1?=
 =?utf-8?B?OW5RclZ4c0s4SmVPZysrUkY5TDFzdGhVZlZFNkdLbVF1OWE3UHUxalhQUmRo?=
 =?utf-8?B?UDFwL2FVNEtpM09QUmpGb0kwME55UlkvRXVWYVB0M0hGT2ZMZm5CU2VPckRB?=
 =?utf-8?B?ZmhQV2EwM2E5bGRwT2Rna3MvcVF6YjlaQUZzZWozZFF6UkZ4ejRrMTRKd1N6?=
 =?utf-8?B?ODFpYWp6NC9SNkFOUjlOd2c0VHFQdVJWUERZS3k4YUpTeVVVRk9sOW5VYVBK?=
 =?utf-8?B?WE5CYmd3MGJLOTVQVnMrNWdPOS96YmpCUjhvVFlwdEROZVMvSXVkcm1COUxF?=
 =?utf-8?B?aHpQRWFaamcrYmk1NEtDcHBaTUdDb2NJYWUxQ2RBRGhLN3NZcDRIa1ZnTEhk?=
 =?utf-8?B?SVFUYzVsamhtWmllZ3J6RXNWSlU0S0dJWE9JL3E1R3NSOTZ2Z1ZyOHdCU1Za?=
 =?utf-8?B?R2h6Y3VQVkgwTG5FelM4T1JTSzhLTTE4a3N0Nm1pandSWTdpSkdvd1c4bmwz?=
 =?utf-8?B?NmdWVm80Q2tneks3NkVnQW5QWjVQdzRoSzJUN1NtelBXamVmRUFIWkRLbWV2?=
 =?utf-8?B?WjB5OTN3cVZtWExXMWRncStkSktCOG5QTmQzN2lkWUh5VjduRWVSN2dQbG5R?=
 =?utf-8?B?L3ptamlTK1hBT2V3b0JaaGZEMEpHTVlWU2I5czNUeVpxYkpjbVRSZ0RUdFNz?=
 =?utf-8?B?dHdLZUlTYzhPMDZOTzUxMi8xVGx4MGh2RkZWelA3N2V2ODdKTG85bVFCL2hn?=
 =?utf-8?B?QkkzNkgxVE1xU1l5SjZLSjZCNk5PeWhuaktmRGNZWmVLcTVNWmRBdFNkeEY3?=
 =?utf-8?B?R1ZPcHJIWENwQVFDTmJaV2h2bFhuK0NGVFBoVXY0bzVaZUlQMndZbXRid2Rl?=
 =?utf-8?B?V1dwNkFtMHUvZFVyVDF5dUFtazQySyttcnprUktuNks4SG1PTlZZdzVaZkZ0?=
 =?utf-8?B?OHlGSXp3UldoUGI5OEc4dHM1NUlXVjJtUkJucWQ3ZG13d1M2VHVmU2NDazlF?=
 =?utf-8?B?SXp6WHhYS1dGZEdnbVNLaTJ0eHpENzdBb1RkRFRjL01tYmtZb2ppWGo2MklM?=
 =?utf-8?B?RGpPVmQ3dit2UkJXRVpoeXprMmdIcDBJVzM3SzY5eHZrMHZyUHVTbDRlNkdQ?=
 =?utf-8?B?STBZS2d2Q2dCOHhmT3dwTWVzdzN2K3hPd1dpcWFLS2hUZW1xbzJPdlU1akJF?=
 =?utf-8?B?Y3BJa25JSjR5c3N2RFVIdE5DV2I4Y01oQml3VWdzMDlnVlU2WE5GRTgweGto?=
 =?utf-8?B?TW0zenB2Wlp4N1BNUmdaYk0zcEEvVlZMODlGUGhISm50N05STVZ0aXRmQ2FY?=
 =?utf-8?B?enR3TEo4dDRFd0FVS0pUN2hrY0ZNWWRia283bnpsa3JrUnk4WHV2ZUJNSnJ1?=
 =?utf-8?B?WkpZR2tTUWRlTWVteE1SYWMwUmhQRDR0ZVpQbXdzWmlSNUNzU0J2NllFN2Ra?=
 =?utf-8?B?S2Uya2F1Q3gwZ2ZtbmZVWG5kTjduNFQwNDZJK05NTjh2Ui9nRmlRTnZERzJV?=
 =?utf-8?B?UHQ3Rk1nNFNOamhsV1plSkdnd0xvbGdKTDZ6V0l5dFplc3V5MzZoQjkxU2pi?=
 =?utf-8?B?N3E0QmhCT003cUU0WFY2RWRESHdlcko3b2htOVRZLzI3Zlc0UXFSTXE3OXlv?=
 =?utf-8?B?aGozRmpnZzNWTHVSZkNsWE5xVHNGT0xDQ3kyeTNNKzhpdDZqMEFReEoyR1px?=
 =?utf-8?B?aUx6Sk40c201OG5SQTVWODFST0RjdzdOYjk0UlR3YlJndERialovZnZCVlB0?=
 =?utf-8?B?Z3NOM0liZGxWVkdUNExrY3F1UC90ZENKd1A3NDNLd21tYVZpM3BCSVZacFJ5?=
 =?utf-8?B?MHd4cHNRVHV3dDd5VWtqMnFaNEY0YUVocUpwTVl2b2N0RHB0K1R4RndnUm5u?=
 =?utf-8?B?blpxN045TzgyeTMzQ1R6aklab0tvK2VUY0JvekIzTVRlbjJsOFVqNVcrZ2Fj?=
 =?utf-8?B?eXJYK1BGWW9DWjNkcEVqR2xTTkI0NUdsSHRBUXF0WXRsSVV3bHJLYnhUUFRN?=
 =?utf-8?B?a2phTWhJNERMeVBlM1BZWUZqZ20xNVIrOHJrL1M3ZkMrTWpSL3Yxa24rQWFX?=
 =?utf-8?Q?R71tq/nJSCWZbXk815?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10336d8d-942f-4172-af2a-08df02c6fb15
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:36:15.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeVk3sFXS8vs6w36CAhYYXBbzJg/xVttC9WiXZE5VZE0iFbzhA5EN+tLSWXRumxI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_093626_266276_5B6D99F0 
X-CRM114-Status: GOOD (  12.12  )
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

> [ ... 80 lines skipped ... ]
> @@ -730,10 +770,58 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  
>  		/*
>  		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> -		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> -		 * our new indices yet, we can safely bail. Once the indices are
> -		 * committed, we MUST write valid commands to those slots to
> -		 * avoid indefinite polling in the drain function.
> +		 *
> +		 * This loop acts as the Point of Commitment.
> +		 * The CMDQ_PROD_STOP_FLAG ensures that no new commands are
> +		 * committed once the SMMU begins to suspend. The synchronization
> +		 * relies on the following observability invariants:
> +		 *
> +		 * 1. Other CPUs observe the STOP_FLAG only *after* the SMMU is
> +		 *    disabled. This is enforced in arm_smmu_runtime_suspend()

 [Severity: Critical]
 If an ATC invalidation (CMDQ_OP_ATC_INV) is issued (e.g., during iommu_unmap
 from a background thread) while the SMMU is suspended, the command appears
 to be silently dropped here.

 Since ATC caches inside PCIe endpoints might not be globally invalidated
 during resume, could the endpoint retain stale ATC entries upon wake-up?
 Would this allow the endpoint to DMA into freed memory?

I agree.. I think there are only two options?
 1) After GBPA=Abort ATS requests are blocked, so you could full
    invalidate all the device ATC's and now it is safe to ignore
    ATC_INV
 2) Just don't perform suspend once ATS is activated

-- 
Jason

