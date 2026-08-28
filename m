Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA6FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogC3am52OybdyM/hOAq8ssO1SkodtsiJjSNQ0Inpxng=; b=3JfYyfFbmqS7FvWZdXIhfChw3b
	OiN3zSVZgk6U6DtS8MpHC/WnTZT/uoZ2qtlbuYOZZ/Jt42hSQHO+VEfzFwPss2BzfcYOZ15riTjDy
	O3ZwAZf+hixVvZ8mzI/NSNlWwQHN6ilgwFPw51+oVPu2NWtsjarXFBxtVCERkbWuwdZnB4KyjgXNt
	wmAzzBuzpewbRz+paj1t02FnniCqdJqhC3OFuhmhIYNmh0fVat/2V8Uo3Gw4KqPu3Y8Z4gaOKasl8
	4laRJ4VLakCdRRSTpN3Da8A/lKkyYRZHAgZJJ//Iozm0Mc5RwY5azI6aiX8XjqnO3CaHBUxsGQ+3u
	9/aBGpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxYQ-00000005yvY-2Ym1;
	Fri, 28 Aug 2026 14:27:38 +0000
Received: from mail-westcentralusazon11013017.outbound.protection.outlook.com ([40.93.201.17] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxYN-00000005yug-1G9R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:27:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKzvFxZGKAlPFvUJo6TeI52nfu8Kb3bLWm/2c7uWIXgY0zWT/K+hoRSuRtXfgxJxwfQMg/+FTim0SO3YxtloGlhINcMYFj25hSOdJCrZAtivxthLp3ceANxi1BFaoksPASYIr2Ev9ZdcZhPRmCo/31s1FYtD9cHzmz5241Dj/mKlO112gT0Z9BdMS+Je72kjPNpR9hgUdrByR31qI+Gr+tFoJWTPIHMP5dIXJxWYXBdVolo8xKTVib7gryc7/h1pUQhEADvD301Ytsx5sATmjXZY3tnUmStY+rTU8mRtH809sg/FBGj6HSflycAgB8FKyAepRbmu/jnBUHQtoSSfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogC3am52OybdyM/hOAq8ssO1SkodtsiJjSNQ0Inpxng=;
 b=FQGrjq+qcavliHae4lZ4MlE+jMOjzeQVVOTCjqIZk3ZIj8SL3zjndL4VgoI5f4ezpM7bdEU0SJCEO+wi+LXyaq8UXISGn7RdSOAkulL802mbKCnk+yvmHESiAJBm2WdgynQJk1xQVESEWvLdN+AEHJC94MZDQY6D6SmxY4V4bMhYFGq+m2Mf0j9RU6NO5lTIfGPNTK7QcDqvSTbgLPjSYdRI7ApQ2GiCN5HgMH3+vTdZ63iRCH4pWOrT/uE4+iCliQaifisPBFHDYdoe3pFdPSQDah3h2v9TdK0R2Cij2Ane98vt8SVLvUfp4uujlwhHaD7FmKEbpTTP229sCX8ZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogC3am52OybdyM/hOAq8ssO1SkodtsiJjSNQ0Inpxng=;
 b=eMx9WwCgOswg+8K75Pr3R0EszyDjrUXlcwQcSAfmy8KAV0ACeLBt9YCuzgiOHzompAQAtCNqMjXZIO2KWWIrzw/xoPSbO2X891V/wNIWCknhd8CsBCdqaCbEV51ZYIftuwAfdk5DQV8WFVPVZVruXFFdKJF2LF/CbkAaP3PaE4/ZDuZyeesD8G4QOA1KH6HTOVdVnvcBmuQgH9XgbpSclEgXEAAIVCd1KWmMLF3WhwGDYie3xa0RqAhJ9xesA+Xl07Ppb0yUYlLUKERQpeNOcvrCKEZcsQI1zj1/OxSy/bqnIWJUg+LfWsdNk/gHtBClRsER1QvUUnSXZMlPe+Ffbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:27:27 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:27:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/7] iommu/arm-smmu-v3-test: Fix OOB in
 arm_smmu_v3_invs_test_verify()
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, will@kernel.org, robin.murphy@arm.com, 
 joro@8bytes.org, jgg@ziepe.ca, nicolinc@nvidia.com, praan@google.com
In-Reply-To: <20260828125409.1921538-7-smostafa@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-7-smostafa@google.com>
Date: Fri, 28 Aug 2026 11:27:22 -0300
Message-Id: <178792724273.3808739.3948049389805346431.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BL1PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 8141b545-1371-4e3a-f966-08df05107b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4uzG0YbYop/bDoO7M1aCxPUy4OvPtqCv14hvAGMmoBa7qYnO1paCPAJauaKzjy7+lHozKABTZ1/XSreCF1J9XhVpEgP1/kWmR5AIDC5CWpyFFQxoh+DkDCNz+ovYpUh06M9oyFTi3rOb2BsAH7JErzEYsM/yY7SpsmnUNQwhqtJjACTHSxGAOY1TPRl0WPK5+7hQp1+MNM54XdYpfln9B5Alq3rlSLNbU/9X6nHUggahmzYw7YC8EtBnxisphkBpqxDtSh4HyLenV//I4wdKrqIKAWqWTHPHtyjwYLHLt0M8m7ksFPGr+q0NQLGGj0xdTrllsNgem9oxMfTXiW8tP/9ownV7FYtu1LsFOrgmnfKpwrOQZ0vE9n2YEFUDGu1pVWUvd0riPRoSKVFIKdvgcMvrx/7snEQAGZbFaBsWuMTEhXChgJ+0yGkGWoDbyoXjPuUD5ujAc0BSqldpydibO1PMDjj+uLBk8PZI16IJ9H7JGAvZXMAesFaNlbMD0VFmlpkttO3MChYRKB+FVRgP/m4SCK3sWXolmUa3h/qPEt0sdn11fUTP8e8jQENYZnac+9n8wfF/8E4TyfNNad2CQx/bJhvzXI20ZUXzuElQ9IZPAuSoKuXxGEei0ux4houWaYVPKxaIeVwRnMPyHLqbXVXIo5pCliRH64NJ1M7WHp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEp1ZFIwb1Fka1VvQStKanRnS1BZQk94ek9JSlVlSjVWcmFCK2hnMWUwSDJL?=
 =?utf-8?B?WitwMkNmQXB4RVZTTlprNlVMM054UVJhTzhNTldBMG9USkxQU2xLbGswV2ZS?=
 =?utf-8?B?NGR3RXNBR3lmTDlKUHpFMFRHNGRDSWRZY2RRaWQySGRTS0U1aVRSakdzTVJs?=
 =?utf-8?B?UUxuZEJHWlN5RFh5S20wSkxrT0dDWWN1NklreHpoL1p3cXFablNMdzdOT2Rh?=
 =?utf-8?B?NkRkeGp0dDRLSUx0NmhnQjNrME5RczRJamx0dGRyYkVvS1pZMDBCbDlkSmpy?=
 =?utf-8?B?VFJOYmt0ZWVFMFM1VUpwRngxRmxxdWZxOUx4TExFLzhCcDFOT2Q0NWhQN3I4?=
 =?utf-8?B?V1B1OHMvVWUxS3F2cGJoU255NC9raHZ6T21iSDBrTnlPdlRNOGdNQXVOVnA2?=
 =?utf-8?B?M0ZuVlNZMktDVTVjQVZXQ0hBUWVqQmNPVnI4NkJaQmJQWEpFSGt5T28rVEpI?=
 =?utf-8?B?S1JmcmFYM1dhaktybW5jNjY3R09JTEsrWWlRVjVBaWxmQW5qellYa3pUcjJr?=
 =?utf-8?B?OVNjVFpmOHR6Q0hBbTNya2hVWVZpbHhPVkFxSnZUZ1IyVHQydmVUWHVOaWFQ?=
 =?utf-8?B?YVVIQjJLNXU4TUhQUDNkODkrVlhmN1RMN1RscGQrZHg3cldzU0VvSzJFWnV1?=
 =?utf-8?B?dXFKRDhRc0p4QjFtc2RWV0NDZHBaSWttVytHN090ejdOQkg4cWtVaEo0Y3Rx?=
 =?utf-8?B?R1pRSDlLZTRHZ1lPVjU5blV4ZklycmRObkRNc3ZiQU9pL0ZMTGV6M0YzdU8v?=
 =?utf-8?B?Q0Q0TlVLZFFOZXBlTHpvTU1VdUxVTnB4bCtJMW80c280aFRKNko1UXBKalNv?=
 =?utf-8?B?bG1icVVpenkvaFpTN2pOR2k2N3VKTUVvMDRBS2s1MHhkSjR0SWZYRUYrM1pJ?=
 =?utf-8?B?K3M0ZFhIajBJdVVNV2k2WURxb3R2SUdVYk93MG85K3FqLzRKSmkvRmtvOUU4?=
 =?utf-8?B?elQvYkFOeUFDaU9JVXd6NXdWRzRPQVdjbG0zMTBPZkRiN0VUWkw1NDhrNDVX?=
 =?utf-8?B?eVRNTFRMK0QxZU9zT2F6OVFlaUI1VGtEVkhWdWFJQWNpVHJSaFFuOWhBTWlz?=
 =?utf-8?B?c1YvZkRzMmRrM3dJMVo4VlVFOXZJdFcrWlFZMGh0WFBpRVoxMnd4UVFYckl5?=
 =?utf-8?B?citiN2pWR2cremtjSGpsUFYyVXRKcGEvMlBoV1RzNitXQlU0czhoUlA3UFFp?=
 =?utf-8?B?d3RySXJyUVpnMDc2cDJNSzJxT2pHS01WM3ZkU25uZElZaHFuMDNhMUtsQlJp?=
 =?utf-8?B?dkFyeWZBYzZZMTBmLzRzMlpCL21OK0VETFIvNWVyRUxhNko4ZUtuZ0RBcFN6?=
 =?utf-8?B?R2xRdGg2bER3TXhRWWF1T0RrdWJhSkxDOEYyQ0lORGlRb0YzTW8wVU9HeTFk?=
 =?utf-8?B?UmdGeEQzYU9iV21iUGFqeXQ2ajlMUFdhOWVPbVlwV0JlbUFsRjA5dTdXcTBS?=
 =?utf-8?B?ZUlJZTlkVjRCNGwxN1BZTC9wTzk0OTFGWkxNcHA2cEtLMFNZU2NCWDM0RG1Q?=
 =?utf-8?B?MHJSSHRhTmhCUnFqbWdYT1pWQ1F3dWhpbkNoYzgvaW05NkQ5Q1dMRE9tWE9Z?=
 =?utf-8?B?Rzd4V1ZGSVM4V1EvYTVQYTQ3S3RPRXIwbkhPVWZxT3h0K2xtUi9HWTRkUmF4?=
 =?utf-8?B?OHc5YWRxUnRGZ0RvMmZQd096TW1rNzhHOVluSU5TWGxCOCs2bG9wWSt6M1hS?=
 =?utf-8?B?UzRlWXpvQmtJMy84VXNvRGZlaGpPU1RYTTZVN25wdHk5SE5rR3dnb1FBMlFa?=
 =?utf-8?B?Ri9rK0lBdDFSZ1JOSkkxcU16S1VMWm03MGpCTExiSngrSDhoWnYxU1ZlRS9S?=
 =?utf-8?B?TVk5empyY3FoekduYS9hbUpWeXNRbytJN2xJcWZ1clRJa0pBQVlDb2Fla0FZ?=
 =?utf-8?B?TTFWaWFZRDZITjh1U0RSMkZTajM1MGZUSm16NW5mTmR5eWtPeVpUTGNobGZZ?=
 =?utf-8?B?bUtWbGVLSTVVTWJxcEFUU3N4YUlzWnlibzhjUWR4eGhWYnFGNmdMeHJueThN?=
 =?utf-8?B?NnQ3UUovYnp4QklKakhTUUpiQUVtU2NKQ24zK3BxWVdCOVpTcjJ5c0JJMjBt?=
 =?utf-8?B?Vk1CeUtWVFVWeHVEWGh5cVZLejh1SS96RXhPZnl0SWFnOWd3bmNPZFcyZ2E5?=
 =?utf-8?B?T0gwSXJkeGVTZWcyZlJjMHJYalZlQmM0RmR3bUV1dnd3a0U4VzRNSTVhbjlN?=
 =?utf-8?B?bjAwWTI4dnMvREVmZnJvVCtXOUVLcExQZWFlMll6d2tXK3JibmZhTjN1bW82?=
 =?utf-8?B?YW94dThMM1lxR085TzBaVVp3VzJsZHg2MDBLRG9oRHVnMlNBSWVEN3M5cExL?=
 =?utf-8?Q?ylPTcr6pDnIPZUazv/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8141b545-1371-4e3a-f966-08df05107b21
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:27:25.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMdviW6Fe4nix8XiBFIPNFU7nj2au2HIboya1QpcoDJTrTJlA5nzuEw0stdzeutq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_072735_610002_121D4A84 
X-CRM114-Status: UNSURE (   6.59  )
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

On Fri, 28 Aug 2026 12:53:41 +0000, Mostafa Saleh <smostafa@google.com> wrote:
> arm_smmu_v3_invs_test_verify() validates the array bounds using
> KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
> If invs->num_invs was smaller than expected, the next loop over
> num_invs would blindly read past the end of the invs->inv[] array.
> Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.
> 
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

