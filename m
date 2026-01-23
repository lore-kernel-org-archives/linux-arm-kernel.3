Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A2D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3hsaPJFvNn2fsX3eb+xBqkGb7J53yx2y3qR/M4mw6Q=; b=0VbLRfb7THuhmp5OXoMc108Yg1
	LA9/1SfLyzQe47M+5WDTdulrwHSjP2dqzMibk6AcDHWLDO0/w2BfYLmEIw1uh6/lLuDryhJjW640E
	uyEtG7kWSq75dKfda5ukbLAhbYIBqKupEkkFklQgetw4Q9BkKF95J3XPHLUReh6PNzaX8IPv5neGs
	DcOsFnMbrzOQxbwsidDihdsOd2C1Nrtc/1P7pzHwCnCN/DIvs1bhEhLv+BXbmS9QuC7GFF9gw1pTw
	TG6OtVqSR+rM/NIQLEG9Y96uXjCk3zQaWl8pIhRkyWD7QTizzfanfXCAhY0EApMyu/S/mS7cOQQMB
	IIdLsFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeb-00000009OEM-3YqQ;
	Fri, 23 Jan 2026 19:17:09 +0000
Received: from mail-westusazon11010018.outbound.protection.outlook.com ([52.101.85.18] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeT-00000009O8w-34s3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSa73YftMVwI2czgEznza680WM4kJfqD14IJXQGOn30Tw5nlg20a3fLj7FpNepAjpNdKnwd2cWEp2Npj3XmhCTBdKnrcIAKQ8mP3yfv0H6kk8i92MxgYvvY4zVjAEeZ97rTQhfDyTDTkEYrhikpMRl7R0pUjOp7/3f9/EaZ03yJMWCTDSrfY6hEFsT/Su6VFUKbfxVy1pCaWiUUHd55GnPZS8jK9uX/a/xcfvqX8bxA4v2I37kv+4DyQXNTRO+36RclKPDS9b0Nq2sv9He0VoSIZHu8sfP0RcIb1bUBA41bsuhZv2AbIUTyr5ZzxPxqkoHaNiZQhXGlUB3T9L5iLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3hsaPJFvNn2fsX3eb+xBqkGb7J53yx2y3qR/M4mw6Q=;
 b=YnrHhQN2KOR4SeCGOjsqogdSY89/W/fpVoecwzheKpajh6t0EwJP7MQEU3FEwydBA6qGxKruXx74n/8r+9wY4XRvVsFyNu1t8THiCyNLOF1dMxOEZT+Qmw+63LIwqJT267DIFl907XvwQYB+9ou9cwCGZcx9HVmxexLpvIXBTMhXh3XCDOLu/izuMOGTbE8r1KIfIRPB6Sd8D0Oy+vhvoEljKhH67IL79CmF+6dAiT/T4PDTrtXNIlzbnZK/Z8gZpLsH0c9QH2S8J5sEXQ57regOQmGynufxpxfKSCxpbB2Z4WP50OZ8Ouz3mxtii1YXR7HBTNrAwUzT/bWWWMNt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3hsaPJFvNn2fsX3eb+xBqkGb7J53yx2y3qR/M4mw6Q=;
 b=SKgclKy/fAqBiFJXrgkEaitZTFW7wI2BqcqGugrpfGTgZlkZCTq8uodnSBBpqu/r47y1xloCdwX6atdgetR5O7rUENzhGA2iFG4mRywAE8YU1BoFep/qZ+k4555ZPRI2wtZ8Jsd4Itknjzs/oyHVp6QV0H8ESHi2kZADI1jiaM8PbhjkpIBchoiaHlQnCFLtkpanVsqx1/jnRcvQ5o4wZD5qMSeQOz4ImQ2vVWrSA4zAQWNJNSRPwifkmgu16YTEinM2UZ3d/8TAr0BHVejfvC4rnI4sR/rOdNKIUhqOYaBJ8OQqw56WYVpb+LR8e6RhLNDqYmAr2fbtzwxWMyBN2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 19:16:55 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 19:16:55 +0000
Date: Fri, 23 Jan 2026 15:16:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <20260123191654.GD1134360@nvidia.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
 <aXOpzjkAgODnh2HU@willie-the-truck>
 <aXOxfi8ZQAkr4zHU@Asurada-Nvidia>
 <aXO1OLrOsCkep3V8@willie-the-truck>
 <aXO2MY6gzs/lxT7S@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXO2MY6gzs/lxT7S@Asurada-Nvidia>
X-ClientProxiedBy: BLAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:32b::32) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af464d6-f9bd-4174-088c-08de5ab3f8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ll9r1deaD0Umy5ss5FHH1hWAVA8YY0k23besIPOsySYUahxESUjJkjiIHAEc?=
 =?us-ascii?Q?ECQlgni4VNsT8BqpJ/kOK35cDCAT1PR1HPr5by+Nx88/fhWSr+blAl9Rm95q?=
 =?us-ascii?Q?w/jsFyMxqQCgBvGGU9ybmoee6V2lGieUj2UQBYRznug8jacqynmMj2vUv648?=
 =?us-ascii?Q?Pl3lj7FLw2KIOcr7Z/T1ewGF1Xd3CUJsnwQVSlxEsqScpIAFyYxvzBMoehlI?=
 =?us-ascii?Q?VxOefczQhgc5St6nbeJYuPLZeYUrhYRxGDxP2Lrt2kyq/dRKFKwMBOgMw+wL?=
 =?us-ascii?Q?8sRpC803a8f/1zhx+B5WfqEskXZDz7DdNGJua9YqnITAX+DnrhHVBWlvGmUd?=
 =?us-ascii?Q?VfPit2fpmbCbnfparrZCDNxtRUGO6toqhLIeFOKFoPLCStgHAOKjLei5xXk5?=
 =?us-ascii?Q?80kVXdVkqIJYPCNepp3Rdsc+Fw1mcZEpjbMWdzfCAj80cylXI2asEYyqWA8f?=
 =?us-ascii?Q?+efyPoRbDYpNZMcwsk/Y3X6RBu6MgFZSwDst8GvQ+HXUy2qNyecxBWD+sSOh?=
 =?us-ascii?Q?GOuWpra/Oq0KVgyBk3Kx3C50/FPCS3zHwVDFZ/EmQIf7uFEuMs+/6n7PJGl2?=
 =?us-ascii?Q?Zi2GRxcZHJBZL4rmiwf96ImckbdhYmUtRcEDD9brzDDR3P5W6hIfmqjGrdzz?=
 =?us-ascii?Q?bC6ztQV+8eWY1ECsNoSEE+QLmDnHmQN8DOZzY0jSH7FlRmivWeqHAvhIKbU2?=
 =?us-ascii?Q?vZuItedC6yh9C8YxK/9Fp5Oeh42o7cQrVep+IkC9R0SNYrsooavFXMpvbuXB?=
 =?us-ascii?Q?I2W5Xtw4Bm6oLSJi+kf0WjM6w6nC/XQHqBAsTt05Dd+2/DEn5zIooc6U8Eqq?=
 =?us-ascii?Q?nGJK+drHqb7sKI0mcXwQGyNQRZEYXwAMyAwERG/Nlq+YKlSSXYyrh5ZFppDv?=
 =?us-ascii?Q?NMOekctQqxFrKcQru0aZR6NhlRy+Fj164xDic5nzrCaBsl01JVoaqLqz8Ec+?=
 =?us-ascii?Q?q5FPdgu4Cet6JfkQNplU7XcM/ZuzXSAnoZXoV4voYBFTmg7T+D4Lrrmt+/Nv?=
 =?us-ascii?Q?Z0MUEzX0O7CiAiFrL+B5lTWFRXXDR0yK2dEyvNqjGuexDMs8kJab0v6G+VtE?=
 =?us-ascii?Q?ZjnXTFkisZhRhsY421B51bdyMAftAf7dwavQONPZ7uGWXCh0PwnwoTlmwznJ?=
 =?us-ascii?Q?yQKo+fZJfHVc0cBPT21Kux58iBYSrTdBBTUetaPwYejgsXcNppfyBdU3ENeC?=
 =?us-ascii?Q?Zqv4PyhnpvhdrntNeSRboCQAKYECopj+1+wOfdJ9K6yVNcIXP1MC/rOGIvnb?=
 =?us-ascii?Q?PIZux0ebX3ndcCprCcWZjXeaW6F/ONqd84Vou0Dul7oGWnplIvxb08a2Xwrb?=
 =?us-ascii?Q?5qXKnz5ek8AHJ2d4Xw6d1NYTZ8SjnjO7gg6cKC6PbDs22Uf+uVDW1Ej7xyYu?=
 =?us-ascii?Q?dXsUBTGVkUklXLAeVLX/eSO2mGrC0I2+0nj1ExBVRK1bX/3+lPQbfbi5Ub+D?=
 =?us-ascii?Q?qmOVwT4iDIhrJMvGbTsMi3DkMctWXtQEBd101X2LwHYsDBSC/6BB+cpKNUGH?=
 =?us-ascii?Q?a/Ap68MJl6o5TN5t0g3jlg6a9XY4LL7nFFaUMRXD6YtgrTJgOal+992EUIHU?=
 =?us-ascii?Q?318shIfTE7LweI9bSWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWdoTdzhYs/wtMz/0MwzVqdPkhCvPs/ZnowL6G4ptbO/I9T+IIGPMchNU0ib?=
 =?us-ascii?Q?jK0zxMtNgyLbzo+50lKZGClBOhCdcyLu2b5wqOXmPwz/yVh4Upms4C7syo9M?=
 =?us-ascii?Q?dR6Bc+Q8rNZFhasI0B1t+URUUX1MXpv1OG8bfcPm6501fH1yaYSWzAsx1VMb?=
 =?us-ascii?Q?c6UO7XDnOFHah+/+Kyzn46i+XJA8gMGaAaZnHR44oi7UyqULVjlPLSotOVBH?=
 =?us-ascii?Q?cGAMCTSiQJwl22CE4GUocNM5NxXvWUJG+ZHsOGBF09Mb8SXXvaJBRZIUixtV?=
 =?us-ascii?Q?4aIa7FNFYX23iqtWEv8lTq1HQcyCEdght25/b2wFxyBnCtKYGhkpHeaOBiMy?=
 =?us-ascii?Q?lBhGOPVX+rymAlMLiGVG6go62K0QQAB1BiD/2795cAoDsdkxHBlH763AO1HV?=
 =?us-ascii?Q?oGW0k1RFkzpFl4W+WyqHmucn5hUOJjBk8QdHP3FiJt8fwH0Yis8/CibcGPX2?=
 =?us-ascii?Q?L9p2I6kZLlIwwlJTE3M7HBfH6v6T7dOm2yUB0+68IQkPfbcA+2L8zia3kOWd?=
 =?us-ascii?Q?vgs4ZtFNWCyc+xlYQf3hPcOmGMTKLQFQUvegGDe+ffKK6x62cmNewMSycj11?=
 =?us-ascii?Q?ySK+Qohsy0Ddk4ijPODN8zAi3Xg152/2Wn7g4m/sgywMxTRMK0qBHHqmVbnx?=
 =?us-ascii?Q?oeuS3EwcxZR00JxB7k6wS8NTv7m5jXYBx5jKJwNW3Us6JfztNNLBmN9Mu82f?=
 =?us-ascii?Q?AqzQapTsFAOmcDOsKY0rkxam8kWFL8aq9kDkdkH0w9sMkO9ka9fNu24BT6xZ?=
 =?us-ascii?Q?sexaFook/Jg7ABEVtmzYFFxuSp6olQerzPGnJMF16ZwOwrCdTCMankuw6rnW?=
 =?us-ascii?Q?HFvM92/wpFz3ca4AlWpuxFVVCwNudbVpcXJ6Z/q7ZjAvBELW7NOcaHQOlPFc?=
 =?us-ascii?Q?rYpv0uJ453mCnoQFs9mPm5ni5fMfE1+GotSV0yFAp/WkAKeeoVuYNYNFf50N?=
 =?us-ascii?Q?3llwV/rtIStUJYvFpaUQcUF2JL8xxdc0wTMEaQqW95EhfzDYlvdGvVjJSPEm?=
 =?us-ascii?Q?ZW+rPfNsferX6DirVFY2gdCAz4J8U1j8q91YC6ILzEqw+MNjSiYtv2Hcjqcm?=
 =?us-ascii?Q?KvRDGB1/EWoApTxgzrCHy+H5NQwhmJiThWSkkcQRNf+uftPoYoFA526CsVRT?=
 =?us-ascii?Q?zZ6EvzcEit0oyTM9chhg6JVrUSw4YTn3eaPVD5XCim9Jtqhx5ECkSrTnEbX4?=
 =?us-ascii?Q?aSMqsSJX5aE8L1xByu7JUQ3+i6falESSlqjigaBDvNkefDjOwStOw+fyEp3z?=
 =?us-ascii?Q?pZA0hRxuHJZHp38ag4b2MS0dSETn7JEW/kvZjRpExp8zmVJk8R0q/xmpA66p?=
 =?us-ascii?Q?D1oYrvQmAU83iyekVaVy5E8LN97DxpRoPx798QAT19jG9XOWk0uQ9z2EuVXm?=
 =?us-ascii?Q?7e33p3PisUHRMZwb3DIqPk6fHjKcJMEg1RoZllgXXAFmJS5IjTz6K0ugCV5X?=
 =?us-ascii?Q?oX+8/C17FsqNDdGDOsQQcrpna5+f+Js3+6++o33vF3bA2BcQGKSTvMOTxhJa?=
 =?us-ascii?Q?s5XITOOlRNrgcBtTmq4wfIO+3EeCBKJXzon2F+Ea6np443Y47VjGF+fchcm0?=
 =?us-ascii?Q?aBYx+KRgP2An6MlrWIDK8Ab4leAUQ0iAorq669Zpc5U2FvVBavIQ0UPbGV22?=
 =?us-ascii?Q?DoVbS/mwjbusTB9BhjefLvcVL1fcLEr2aklcaHveHfud8KXNvarkmfgbP8Nv?=
 =?us-ascii?Q?GI9t1QAQ6jw5151ltIsGO4u/1M3ZikeEUlf9BJrbBEkBgKRv3twPSbdUdqWM?=
 =?us-ascii?Q?C337r5togw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af464d6-f9bd-4174-088c-08de5ab3f8c0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:16:55.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYR+vHrUOQh3buYtc7L2jGAp/aFFdJ3RhQpEzt6BGHc17QIsg6jUJf7vDIKsYgv8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_111701_776363_4FF2842F 
X-CRM114-Status: GOOD (  21.44  )
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

On Fri, Jan 23, 2026 at 09:56:01AM -0800, Nicolin Chen wrote:
> On Fri, Jan 23, 2026 at 05:51:52PM +0000, Will Deacon wrote:
> > On Fri, Jan 23, 2026 at 09:35:58AM -0800, Nicolin Chen wrote:
> > > On Fri, Jan 23, 2026 at 05:03:10PM +0000, Will Deacon wrote:
> > > > On Fri, Dec 19, 2025 at 12:11:25PM -0800, Nicolin Chen wrote:
> > > > > +struct arm_smmu_inv {
> > > > > +	struct arm_smmu_device *smmu;
> > > > > +	u8 type;
> > > > > +	u8 size_opcode;
> > > > > +	u8 nsize_opcode;
> > > > > +	u32 id; /* ASID or VMID or SID */
> > > > > +	union {
> > > > > +		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
> > > > > +		u32 ssid; /* INV_TYPE_ATS */
> > > > > +	};
> > > > > +
> > > > > +	refcount_t users; /* users=0 to mark as a trash to be purged */
> > > > 
> > > > The refcount_t API uses atomics with barrier semantics. Do we actually
> > > > need those properties when updating the refcounts here? The ASID lock
> > > > gives us pretty strong serialisation even after this patch series and
> > > > we rely heavily on that.
> > > 
> > > But we can't use that mutex in the invalidation function that
> > > might be an IRQ context?
> > 
> > My question, really, is why do you need the atomic properties in this patch
> > series? It just looks like overhead at the moment.
> 
> Hmm, shouldn't it be atomic, since..
> 
> (might be IRQ, no mutex) __arm_smmu_domain_inv_range() reads it.
> (mutex protected) arm_smmu_attach_dev() writes it.
> 
> ..?

It doesn't need to be a full atomic, you can use WRITE_ONCE/READ_ONCE
instead for this case.

The general argument of this scheme is it doesn't matter if the
invalidation side is doing extra invalidation, that is supposed to
always be safe except for ATS. For ATS we hold locks and then it
doesn't to be atomic because of the lock.

So I think Will has it right, just use READ_ONCE/WRITE_ONCE on a naked
unsigned int.

Jason

