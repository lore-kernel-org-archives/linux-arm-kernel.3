Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9DFCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK/DeOZxl8mFChgoN3SNuXd/sWKVZiupB2zTkYuqcUo=; b=N0mGn+bJHO/dHRYfzuwQoQhwsW
	Fb9RH1HBwTf/AI3LrfcBmRDNeXva7icIE63bWHLVQXM+DzeBm0XHRb9EDQUlNtbDXAZKIMYiwWQa2
	IGOpu96UoeJdAklIRCiA1WuzJ1wa+dYzCHllB5hNP+zrLuo231bfpEyRywrx8ceNS09tyCG9bXAQb
	8hOI9VTVMDh+KKEREO/ExFfvXWRNYjp98j6qmN19nIQUQzhgNFjwcwPJB9Mwlsbz6CX9X7+k36lFq
	/p7Lm2BHUNcEpRlUXpg4CHfVaXi8dHYXruHJs8gZIE8fpmwOSRhIHp66lj7Iex8oOG95OMDz0pWNG
	34CrhzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSqm-00000002wE9-2man;
	Tue, 19 May 2026 22:23:44 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSqk-00000002wDg-2iXS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzQj4D0bOLaYmb6oHraBL9SlGvlh6Ge1kykz9W9QJCZ6XuSl/vCEMRZ4RF33eTD8c1jM4uNVH1dssTqX/2Xa2YqPduKkN9+2/cC+po/8hS3407SIwsceoTml1LwVcHidDyI77K1EAzG3YQ3luYWzjY3DmyQRDrvHBppSRhF/FIBFtI1kjbUlPG9UwP5eAkID6BC35FBPmlxcx+08gi82Eqo8enwE34pjg7G0n0SYJZIyy2nhgqUT7+nEq8IHvzLMsG/mXuIKJBEMNZCR5Ee+uiUoB5PaUhI4IZ56E6Pvuyuaz4KE1UzlY6hmJDJ1/T7U7HAuiLX4G1kzoR9BifR6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK/DeOZxl8mFChgoN3SNuXd/sWKVZiupB2zTkYuqcUo=;
 b=jeafDzI1wol5v/u/yKpTldKSJ1vSJcDfRmnX8JkPDoYeUoKAESy9h5FW9IULFQUaGh57dXs/ku6tTcFkmYlMf6gWr8oELdt7jHRrZiWQQJ0GrM5H2xTKBT7yEaZw3cRpxpmw7lVJM+mFtmlgEitXQ5cMq5APvYgU2Wyg4kqUt+UjZK+Sx30o1uz7f+Ns6H8wGLHyGUfOjuX+1qRU8L3cOf8URL+Iv63FNylR/R9F84Vdc+ajzVm8tsVDHKxoMXuWxsFhHLsYU/fAP+XsAo99RaC3sNM2kXisafA38ei1HiAIcD5M5tjXCg+mRK5KLvl2/EFvJKbJHHoAijVSVKiiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK/DeOZxl8mFChgoN3SNuXd/sWKVZiupB2zTkYuqcUo=;
 b=nO3zFiqWt4ScQ9keQv4vq1yndj301m0vGJK/vJo2hQZk4FmJSW23gO+e85AUhZoOPcQTUY22bultOKmwbp6s4n/ryzuu6qry3iUxPwC9P/x7LayQzXAqXNqNlhL9hw9AglUyv0AZy7bpMH+KofzTCLIYsrBgOZaaIJDTDgcoMDqIm6VRfvPtiyZjqZkH0fn8ujIWwR0Fr+8TL5WNrREJqxuzr2eOVRFr6nBGVpRwpV2dcQCtWaRis1rVhhlQfHBPO1DGE1aLeiY/5fUhtSIF2ODTugI0O3LUP4Dw1whg4cps2NxRwGpIVA+hrsrF5ef5hU3zMdMLniRVW0uhoN/59w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 22:23:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:23:36 +0000
Date: Tue, 19 May 2026 19:23:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, bhelgaas@google.com, joro@8bytes.org,
	praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260519222335.GK3602937@nvidia.com>
References: <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
 <20260519193649.GA715262@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519193649.GA715262@bhelgaas>
X-ClientProxiedBy: YT4PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea5da39-9b8d-4ebf-c9e9-08deb5f544e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: x2+shhaGcFVVCHrUvj+muhfdAn/LYU8mYVfshLrLi5/Scxv1huwnwjFrCMRKufllnmgRolknuvTLUKR3oGED2pUqWBdUPMJJY/wNqU+1EgQJ4trbiG+ZxCeWbCqe0cRU2nHvZlttsoF60r6qWO5wkPtkUp5myTEARJCS6iXv4BCRNp+EX7Cc2NMHzXVwfQ9DJZpZC70kHmRw6xCUfu91nXq0u8IDM/qlcjA5jNYKS2VHu83faxhXW8FruUIUTPH4a19369CCfOaensz1gYosseIMM8b9fLct6NQLlA+ihUjmktSUH1ynlg8la0CtgvWj1EGQatr05STE1DaQyb1xsd9DX+0ZPj40epDVJhjJGGr2e5S7etW/PNK7NGsD/Fye5hBVI8MNDn3wwAIujA14tRJScV64d7RguyR5rAf+YQ5WWNBudiTDlzerrXFZbhqg4NTD6sgeh1Xn/8j8huOy7MMcqQ7wHV5Awms4evJNeq4XP6XWruk5Kex67JCztK9YTJKYtxpxKsUcgq+RZGET6UyrxlM8ta0isqYfezCeOQE0XuX5juFKlfqAtpVQGeSfQXXNQbVVHPXHmKx6qeRrBxsTqMrwfFQwPXH97yrkg7zpgYFBJwdR2JoSmPLIBIHoqBlrrE7SyXEOSb4cFQTfE396cX7BVY0UySpAgHhh6VOFfSLD+Um92g2AWuoQmtxg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qcubIjF73R4LeBosEtSS4ZhMx7bcfo4DZDiU3/Quswoe1Excl4pkYvZRJHK?=
 =?us-ascii?Q?ptomx7VYJsya3UOFBA1VfqN4K4EwEpL6fAyCv7UfHtjjWIz0f54emvm1fyQb?=
 =?us-ascii?Q?YaCY3ghfwR90Absz2SRoZ3Ih/+qyG62ndSYMI1gZy+RGh29/Kl3Yb52q1wjg?=
 =?us-ascii?Q?iOV1lbG9+BG/ZkoeIXsbrxXQPuf4x7gyw/ayF6G7QikYhx13fh8+739CHW1B?=
 =?us-ascii?Q?jzLQ2BaRgwPOMha8EjTiLaGIqSOCB5Jn3uODsdjjW3ZB1ZSbJaC3s2a4lOaY?=
 =?us-ascii?Q?U/GMVUgcFgAYPWfkbf3bmPsZEa+IzLRz319rlx9TQjVe/XbcVn/UUj18SWgm?=
 =?us-ascii?Q?qA0elSWo3zrFi5Fb19FiSuLBCfmoV/YYXYB01wOacdUjnS99WMjaZfv3Ya3w?=
 =?us-ascii?Q?fmHc8/nIyeGvDmOyW5bQ4GafLb86iTcYdlkB+9EmDYk+bUKKwr1Fb03peiu/?=
 =?us-ascii?Q?vMfhQ3qq7WUSjkReIZFOW7NsoX6E+bq5vZl9mOECUJ1XqLvxJK2LyfiJH/pg?=
 =?us-ascii?Q?azJNH9NuzgkvbvR6mtacvOwaUIGzZgU//gqncgOFNkx/1I1cjAgujhybpZxT?=
 =?us-ascii?Q?SwF+S4aohmdOfsHZF/CwJqrXq86ma0I+7Zs8dvtu9Su3srLeKjzjI0lUt5Cw?=
 =?us-ascii?Q?NOEENIG7vh8KHGGpN39vKJXvUqHTDXuPPDZ5FhVfq1Q1eXjL3vDYpGujXf+F?=
 =?us-ascii?Q?HFljdulQIk/q31v79a+ASpGdNCgO+VzAtexJuJq7FK+lirX+7wshIrNnjSfw?=
 =?us-ascii?Q?R7mKk+7vvq/CxMcc7xcZjl6cI0T8QZYyp1NVjBztOQmZyav/qQLPXAfqhzoB?=
 =?us-ascii?Q?u88g0Qb18SIZ0/1VNk8n1m5Bsbplpd88IGQSuXT02b1exeX4zCo2SFXXxH91?=
 =?us-ascii?Q?QgSwD1ci2Wvhc1fTvMQVkgXwIFg1ElMsyCWspXn3UYSahenAT8Lwf4Yjodbw?=
 =?us-ascii?Q?hYzQA4e+YufqVMocWjAv2Y3HEVeRlAyY0ix9tcRMbfG8F7Z5DVH9lws3DwVw?=
 =?us-ascii?Q?B2bJSDgujGDphkE2YEaShOZrS2BA/n6adZAfDGQG6JYbqNYQYmPKwBUhgcgN?=
 =?us-ascii?Q?azPpBoJbIS4Qu5oGcMz7ewWkCOcJNMnQpNXeFTtK9GLVDNFLn3Sc0KUg1rMY?=
 =?us-ascii?Q?LfWhmIhD/61OeBvEr6Js5Wz8ZMKC1hc+fqr5bnrfbRGFZjAaAJH6cFR54C7o?=
 =?us-ascii?Q?1KO2ln1TzpczPY0we6b+56zrDgCD1zVPTIhGhCp3vou14ZzVcLw9Xa49gHqv?=
 =?us-ascii?Q?2DVY7G6GMjmNd1/LCcAQIgfBqbNFHyCbgZ+Ahe/jCgxKfzFLgTrnUXXKvtxP?=
 =?us-ascii?Q?DZNpDqheHWQknWk6YXlicNFX+fK1UCzLaJI6Y18JABcOPw//PNnNVFm15dxp?=
 =?us-ascii?Q?EWEAqgrTsAtl8sKIOIC6CIiOl3Y2GxWrp1n+TYpxcgrZQAvLVBCGm6kL+Yj3?=
 =?us-ascii?Q?Eg47hNtBFGyCrII7Tp82SbZAz04p8aqLEqWymbK7R8Y1uryXq3Jv2+f7jQoV?=
 =?us-ascii?Q?XZQNer5Qzh4vp9dVod1DXQMzosOoXl5I57Znov3FPI5Xyr1MmOGhmi8YPnPe?=
 =?us-ascii?Q?ugaK0nBI+HMdaGlrY1/LG0F5wEiwH0WG7xEZppqvI59273eU72ydhONQeP09?=
 =?us-ascii?Q?mFMoq3GlQwfQp3k8DhZYbnL4G6GoC6218H0P4zsI9IuY2FHAtMiPwYVPyzYt?=
 =?us-ascii?Q?1Fq+glyFnT59uTvgTg/OEYBf2PIqFZ+Jc13tGG/EgrVsD8Dc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea5da39-9b8d-4ebf-c9e9-08deb5f544e9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:23:36.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQb0TLWf2tw30P2tiwxktlVzzdwa0FBJTxHPEAjwd3eSfab3gZSFTMrVJxshwMyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_152342_688888_F0D7F5FA 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue, May 19, 2026 at 02:36:49PM -0500, Bjorn Helgaas wrote:
> One motivation for putting this in the PCI core was to use the quirk
> infrastructure, but this series doesn't use any of that.  It doesn't
> declare any fixups, e.g., DECLARE_PCI_FIXUP_FINAL, and it doesn't
> update any state cached by the PCI core.

It works like the acs quirks that are in the quirks file, which are
also arguably only used by iommu too :)

I'm not keen on spreading lists of device ids for PCI quirks to iommu
files, but it would be OK to move pci_ats_always_on() to
iommu_ats_always_on() that calls the PCI quirk function.

Thanks,
Jason

