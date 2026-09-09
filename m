Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA1C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm02mYmefBY4lkLeV8kIU03z+mqCcflWpKKJpaWHZ8w=; b=HhPRzqy7jMsluErHaiaLLO2I+3
	ZL/c+n7bZPgVypK/pAUzPkJu16zxduk02f6yp+Fyu9jDX+DxEdDERCudJzCz+Mj42wE+A1YJqHlvF
	oi/VnAH5ejDBMm0WaHp6UQoHYXV5dl1vA2IJ7/HvUcCDfBntFjgiougwDd/HM1LafSXgRUEDnBJQb
	Q3c5oHL3sbg1iuOFjWW8d1gknV3beS4nS5jkTLU0Gu4y25dqaMkFPMaidMOI1DfuU/h80QSMw0XAQ
	eBCNwEadhpuQFEPbBpviuR96hxGZD28Xs+gC+dmfoaC25CMnBQGXvHCjx9gwYiTcLR5ixJVRH7PrC
	bMbpGDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H3j-0000000Bdck-0Xje;
	Wed, 09 Sep 2026 12:05:49 +0000
Received: from mail-eastus2azon11010046.outbound.protection.outlook.com ([52.101.56.46] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H3f-0000000BdcO-18XF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5/Sd9BWoZ0kaE44znt2sFnJfDKE3MCcyLPyKQ/G+mDddd3O3lBzolRBHUaj0TeNN9/tvY278v1ze2GLVj5I2uaCYwY8I8muBJ12Q9iqKMH3cKfcFokm8nw9T2XMGI/QstBHs5fWl6jkzRtsBMOoPVpYrBhltFOctdE+hfUbt2tN7bqqD31JQzot0I8EbosqFcKjOisWbcZrxtnYkDLAFSR2ND8tnlyzQe7+cv74tKbZbdWcff/wHk8RxCMxlPTK9oXkmcbngxnDlBkQIKOA69WZD6/ewKwtJVKQZ9bnWQvoDwGChn79Ge9BMpHsdunwIJEM/KP/WeIrWuJiGQOTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm02mYmefBY4lkLeV8kIU03z+mqCcflWpKKJpaWHZ8w=;
 b=ffbEIdhXJYss0O9L9Ai3IE/5Iv8tp+EQbHoA+6ZI0tUOSwDAptJFGb0iS2Z1UDd2Bwtbhe9V9kjhSKB69o9Y5JL2Fg2uIk/3glI4E7h2R06TXcMZSWTN38zVI2RVcA2ajZ7Gnb0CcqVRW+TaIr8M5CF2P+uQwDwHM5M/b+V0SvYgFiKnI1BPBgpDR8xtZKvZReRo54h3R9ctAeklu4i0BC3Cripgjx9ByXfbMtNgk9dvNgKHWPrtDsxTlndBxIXYuGCQTihiQr9qMk2d+1dhlsgHpizH/RZyuCYhAuKS7AU+rgqMUbFjxSdHAwRBQFR3j5AyKSKf7JinyTHLzYeJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm02mYmefBY4lkLeV8kIU03z+mqCcflWpKKJpaWHZ8w=;
 b=GthFjt9zGIJ8TEs4UEtFDEoX25O+PbFQM8ATHc45A32Vbh6m6o+zxkMpqx5UbiB7h9z0xvtBLlZHha4akIHWd9ybnfF++3B0lNi6KTdZkZOltCrX6betaHm9j4Y3bI+hONepXRhpzF09I/rMRjzagZNC5HjqDrQW0rDGKGGYloMDd0nc534RJ+jt8JMvG7gX2NGsTLii499gNn7w3ttlltq/JDWRh56ngWqiBJ0sGO+XBTZI99Uzr59pAGhB6GKeAeDxD26aTTougL2wlDplrJ3galK7kgShfvtmaIoAUM6/aN5GCHb+1e4Ig9HuFvAQOUEo/o+d1MrKQ8/fMX2h1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 12:05:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 12:05:35 +0000
Date: Wed, 9 Sep 2026 09:05:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260909120534.GE2779763@nvidia.com>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
 <yq5atsnyeuz5.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnyeuz5.fsf@kernel.org>
X-ClientProxiedBy: YT4P288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0a9c93-568f-496f-ff31-08df0e6aa7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h5ImWJS/Y6CRgGl8Us+OdKwPXGHh0cxnXbifH6dFmY6z49FQpIOJgSIy1h2P8q1ApE26ElvYG+9wMXirWvuhMY5NScEW7KZ8ximiN+3QJGfOv8r5Nd4yWL71odhBw5SZkqlHl+BL9V2JiXg5DUhzEf2ehn1Beiyk2GSrrI9MHzyUV91p7rLKreRTPCPEDXzg8JHEDf3gKnbEavmKWVP/i5NuYfGroUd9eSTrBrJwqkQ3dRYitPIdpuZVQU3t13eHLyYh2Hl2iB9cCEFu7JaksqoMwipwGYBEQRSNmj1S/aoknvuSU3PG46/3Pa2ZXvqnWR1tuOdTRnEE29oO4MWpPudPpCEptFxXGgJkn84a2liU3AcmNmf/rfkCtGAVFW+XpGI2s+ZPDth69Z2ppCX0ilidVudhkteJGNFGlctLGGYEoqGGJFgIIB5+c1Z2B3hkntix+YVvH3n4UbNZQN17reOUT7SZbojNidOaSDl08R6dbGBBfCfi9BdjF6ETF9jRc2kFob/4f9VFwdZzT9BLUIb6q5oExQYoqSnpFHkQXsh7yat4uvFdmPF+oUBkJWKVNNHQDyjjVaj63Bnd0EJgClCPvDAD+lloL044P+mGh5FmuY8kbXaUR8MvtD24zizWinUfiSTiAHAY71PPqh1y4BMO3tipAnnsJJ/j7MNck3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2gW3GBO1Az/XvPVm4kx/kpfCR4uCAJfydUE28K63RyNTa0Wf68pNLPFE1G3w?=
 =?us-ascii?Q?8Yu+izPUzrHH/ba/hvtH+LJbmMgs4iSztvlUcNWHWrXA7IQ9eSKCNlRP9fc7?=
 =?us-ascii?Q?reVaR9UJgUUUBU6eFowGIPF58ECI8HdlIY1weq0T4biMlIwfcDDTWK9pIb99?=
 =?us-ascii?Q?ZjUDYZznMy1iTP6SxgvTIUPNXXMQvdWqKL4el1NL+L+Yx4SjhMXhz6XNTZOg?=
 =?us-ascii?Q?kpbIWWWwde3m3NQZdkQPSqKLaS9L6mgLy0ZCDTiZOC9TniKpk73Gyy22i+3f?=
 =?us-ascii?Q?2LixlK7SYMHDuzMIv5OVnGIpNo9nhNylTuwGqB5n/Ko6aGJ5pzqKtyWIVwZS?=
 =?us-ascii?Q?cC0uwWxiX9M8shglzsdayxZTTuPv+fcl4JDp5nyAj/VuVDkV8biNt1/sMmiV?=
 =?us-ascii?Q?NOTnPU0Tap8lu0MX5E4VqjMUtoDXSO/I0x1SARl6A8uibx5bryIsrOybU8mr?=
 =?us-ascii?Q?vF9SKsnUs7bASFG5oeLyloy26Rq2nFlXT8F//8zwOhxsgGucINTOKljFdYLo?=
 =?us-ascii?Q?sJ7tmFizKt9f+JFndXN33MTFQR3EQFJeghfGtSz1hHQ8YYveb4VUb3BGoPKk?=
 =?us-ascii?Q?BIi8FUMtcm4OVzfJpcV6dDTXH4ubMwivO3+Xr2w+naqh5zHt0kUJ82aO1Frn?=
 =?us-ascii?Q?saUkEhBbUIZV7QCe3vyIZO0PASJBOexWJJatIV6MXNS7ZIh08kydZG1grxBn?=
 =?us-ascii?Q?jSzThgmkInMUgRHCCUQU6iP6M+gpULCRcrTvialatYLtPMPNoyjLxFwczqrA?=
 =?us-ascii?Q?DIdfHiJvLQxUs2VnIZPzODg3uBLDmnyoGvriY7iqrTnMHCCnlopHAjIL7RG9?=
 =?us-ascii?Q?Vc1fTu1R9Z5hXeHSFjAnXsTX64a0UyEfxY5ToA42F1aS8P41v4mM6DCamlTu?=
 =?us-ascii?Q?TXLYwGh+CpWivZeYeV5I2pVN/e68qtX6s2SSHc284UNp+zjvBnE/hl4bD1JD?=
 =?us-ascii?Q?X/lru9x1FwgXPbHEpCyVcHSLjHpGppWaGckKgpHot2I2PigmI5TA8xV66vax?=
 =?us-ascii?Q?wbJeFEx0BFVapaC395gZ5PkdD6Jm+9tzz24gsRUGZhzs4WyZepht1OH8fP0W?=
 =?us-ascii?Q?CuQvkCLBYBokWQqJ9j2EVsHOTP6jJ0TrLkk0+3kow/rNoB8PG3kcBYVv0DOy?=
 =?us-ascii?Q?r79ZZilfFNrLxua0rDj6SdYBCqsceSuipve90/DWqZhwlmxwVujYdD5eXG1R?=
 =?us-ascii?Q?IypFJa2TSUBufUQMtOJn2DCkVfVjO9y2+yozT1PnJbwjtp7UYfYdU0RC+mrq?=
 =?us-ascii?Q?j+0Np0Lj7U87iyiOxZhxYz0+JBIZq9KWxNhFQccLhGRA+nnEVuuS/kmrqtlh?=
 =?us-ascii?Q?4qG5VDaw3DdNoDD/gUQcImzr2wIb+nfjHAu9pw+wJ1ZHRIjf2BmgqxwuYl4S?=
 =?us-ascii?Q?R72iigT7dhDFBWVgN2HIC/XGI1wDFTTb/esKn4D+ElXJaf9noAi+iNUJ2T2T?=
 =?us-ascii?Q?w1zH6nQsrMnjMUWRTX+1ez5goi8iWdVtUdBT6jdHUGGcgKm2F2LmVhukU3iu?=
 =?us-ascii?Q?VOQjXhhxJqBDcnIg4GHHLsd9ahIGu1WNuS2APLIlee/qvB5aoXcgIH0pPu2G?=
 =?us-ascii?Q?PKE4NdB62vsE9KB4NlxoCy/93sG13aZfxQ9D06nJENrCA10iWLaN27qBSitL?=
 =?us-ascii?Q?lNLuFFh4tvWVVQMzIPTm562O/ztyyQc8Jf5Fu1UlfmlMm3ft2bDNQriME/zg?=
 =?us-ascii?Q?ndlKsgyY7jKugtf7250/bTREKHLT1EZjqbt6ejJdYZn+ch4G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0a9c93-568f-496f-ff31-08df0e6aa7ad
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:05:35.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvzZk4d96LCNtkJQkVOGEULr6JIJ9MSVP5/HaTtQsjzDcMF4+Yh1Wq1fQR0vAWoK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_050543_327016_3944086A 
X-CRM114-Status: GOOD (  14.02  )
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

On Wed, Sep 09, 2026 at 01:07:18PM +0530, Aneesh Kumar K.V wrote:

> > Could this also leak kernel register state to EL2?
> >
> 
> Should we instead do
> 
> 	arm_smccc_1_1_invoke(smccc_dev->func_id,
> 			     0, 0, 0, 0, 0, 0, 0, &res);
> 	ret = res.a0;
> 
> There is no standard defining how the various SMCCC VERSION calls are
> expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
> while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
> and x2. The only consistent behavior is to return
> SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.

That seems safer to me at least. I'm less worried about "garbage"
leaking out but it maybe could cause something weird to happen in the
FW.. It might get confused and return the wrong error code and not get
discovered.

Jason

