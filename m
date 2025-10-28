Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51580CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rcnIsmt13EeE/K4Hhsj7PACEg2Aynr5NwpnJz5DQ0w=; b=CxkQMBnT2P0oZdqTSLHTsU+HUd
	PxeZK/O+djnPyvWydJF0Jw6m3oI14UE7f9lXKW2RcBg1iT/ogylaO7Es7UtWCl0ZlhvsdtFUe+C9H
	HzjbMUoTTe109iGd6Hgfd0/MjEz30bG75Ge6cP8CsHuFiYOX1OrsTZVD66EWjcElRFlrWBRmxuIfM
	ph4SOQXxoyUbszWFOtDGKoGNJqUGbvKgo2vUmEp0vGU4annN5gGwbgD7zl7vzc08Zg6to6krOTN0G
	Ot4kCK78LHkfACV3FJ9+xjmlY5VuNwlhB9LiXlu2SeU2Kk+DBBAE4p1V1Fala0pH8Dl01Y9aLxpKX
	mUk2AkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbTc-0000000FD42-21Wl;
	Tue, 28 Oct 2025 04:38:32 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbTY-0000000FD3O-2WAw;
	Tue, 28 Oct 2025 04:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOPCmRv0nvL7UpHX9+Cmxeh5CFAzGRGpzva0dqMN3xXlarT7MFv0IiGzdXgPIGxl/PJFgQMsBNZ5U0QFD/3SIgFUYLgzsyz4LwxHtXkbXIwagR7NmXU0mQJjh8USj6lq0jZIyndbaw1NmPVQsZq2LmdQhxf/dWsgbohN5uUDD82ufFTxbvlWP8+ToKLsL3q0dNCSZrKlgy5vgqrmmaQHveP7dfpAsQdnXnJybF9olmikqqYtuwYUjwgloY/OLSV86MqI9Ar2VnTREtsCnCPCnu/rSRpJoBRTzBy3knSzNMiI9gh8tv3p+0Ym09U9YEpX7lYofMvwV7X3vSa8YGMhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rcnIsmt13EeE/K4Hhsj7PACEg2Aynr5NwpnJz5DQ0w=;
 b=Qu3rfBczlKZod8WS1FKEfwE75VhmSnhFJZlTtOAGAv91Ix/INSIE71knTZa2/ip2I6jBBThfbcQfu99DJaNrjWDOw5Vwl5ZCNMaWgexx+Kyw4xYUY4t7PogWXQw8CVe8Eiytiq00U1a1PFZQk/jc4k2WXDWsRPvF7q5ZfY99xZvOuCvugWBuPMhfMnQ3aHoe/RtIsFJMMbqF8qU4ovHVOt3djYAjLdulSb5J/gx4yfcX0fAdm6ZwFUienmg1dKSVVn9ixW+ibic71cLeeLPTrZAPBLwChYapGlvJVb5ooA8BvJ3SZyoI9V7FYVqwyzukzf86WjfylrWLdc3RjmmC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=csie.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rcnIsmt13EeE/K4Hhsj7PACEg2Aynr5NwpnJz5DQ0w=;
 b=Cson4C2NV34yk8exlVwOxY2P3SvQ0sJ0Agtd0WgezjHmcEh5idWa3xz6u9QX8k4QqimNhVsgqnwwtjebnQUEXTz6Kxdq0NV25vjRC7OKvbY3F/nCoIv+lDjIv8/Rp1bLHoyWy8ksCogKaUshA2zZpi44bVX964g+xOoN5iA5xKPzhXRf6FYqoEpDnrwotL46bCUIAzrayqJqk4sxyXM00B1bw610mblzuOQx8r04Rl5GERLQzUMBOmSzGsiHSJ+fdRuSeDnM68bfuEvG0WJ6C+lGB+6tsQiJ30P/yHVXnZB0g3+TODg2Z359P9ZOR+c17vjnJrvgjUkYLQO7OKtNTw==
Received: from PH2PEPF00003857.namprd17.prod.outlook.com (2603:10b6:518:1::79)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Tue, 28 Oct
 2025 04:38:19 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH2PEPF00003857.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 04:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Tue, 28 Oct 2025 04:38:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 27 Oct
 2025 21:38:09 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 21:38:04 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 21:38:01 -0700
Date: Mon, 27 Oct 2025 21:37:59 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <joro@8bytes.org>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<sven@kernel.org>, <j@jannau.net>, <jean-philippe@linaro.org>,
	<robin.clark@oss.qualcomm.com>, <dwmw2@infradead.org>,
	<baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aQBIp/0UW0/UiC4Z@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <20251020162736.GW316284@nvidia.com>
 <aPaExVobV9evs22n@Asurada-Nvidia>
 <20251027232310.GD1018328@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027232310.GD1018328@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fafe8b-2017-48ea-ee1e-08de15dbd15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0OOmIVsDj0UDsplfAhftFuYD4Y5yuvSWQ+kLjkOVQ4sV75Qkb+GkEaW3kmqh?=
 =?us-ascii?Q?l+2AeVqZPyUuGmBkurk6ObYcHwVGfovCgvQWCsJvt3xhuwGJBrgaJsE/ejBD?=
 =?us-ascii?Q?SvSWczobMGUAXG9Cxca1S8kQnvdXjI2l9wPIpcK7YaGq/qZY+MIdt8/gmby8?=
 =?us-ascii?Q?CtbghHKKGtxKbie804L45IQUyIXzeF0Ei5wefXX/z6Y/9B4OGXYezVwnv7hX?=
 =?us-ascii?Q?x/d9S0X8bSkh7JHkznI7PMfjUhidCKPetb9ibG4PgqvvmKOZLnBEFLBQgAiC?=
 =?us-ascii?Q?5WTsgJun2Cd9jp949deyIXd3s35Xl2W8UrNac8zHssMF7QybsOYRW7yjpkJv?=
 =?us-ascii?Q?RCghTVXWumjf+7XkuKr/i2dJ2zRQN30/DiJ9ll/bxkZjAMHx4tui9r15EBjz?=
 =?us-ascii?Q?u8R4tyHAFS7m7ojgEDBwEMU28HOysLVEEZKLRjt3SSpNFIVBN1DfzmeRjAVE?=
 =?us-ascii?Q?4kFAPBFiBFFrEoePLdfaxh2WhDBbkqHMXLFTOieDRgiZ7UV0F4hlwteXPrVy?=
 =?us-ascii?Q?7SgVmWN7L3zddQ1e4KGGNrM8J8JIvaoExYfElu+r6fsqlQSPqqxSak3R4RT7?=
 =?us-ascii?Q?BqLlwnxi7nuRdnTddkeMnWdgQF45kBVnDYcmC3xSa4Y+A5p8fmXSG2A6QoIY?=
 =?us-ascii?Q?42DLrJ3jGmzvElTXznCWtwWXVSSynb5Zj3/4Yecr+Zc5qDss27fNfifSpaS/?=
 =?us-ascii?Q?9UWaRfvsJ52L8TIgDSaJq+tw+d+YalwrdIgPMPO6KYm66wtPO1mD5TtpqIop?=
 =?us-ascii?Q?N7+/EEU0cdWELhyeuy4WUY/UWSICMONxtztgX8qcD0n/eoaclXNMm+aaOlGB?=
 =?us-ascii?Q?o55rv04gjl0q1EY/mUJG21kXgZr0ocaDMKaT1QD/jg+L2Kb1tZ63G90eFeS6?=
 =?us-ascii?Q?EfE/NyFy3sKBwWRyyECJZ9Rs81HM1KLyPs7gGncufz5tq1WMCGEYrAbYX+ek?=
 =?us-ascii?Q?yWcHh4z2BuHOMpaTlODMzUjF69le+DQSfzg6ZiUBgI/OqyZNxBTRAPCtiyj+?=
 =?us-ascii?Q?SuEWa1Ts9F0A6UX5e9aN2CXGnpKOi0bZvBHcJxk97+2JgzI65aRyC5LcgPFZ?=
 =?us-ascii?Q?sBWuXbIa5QYPDWs5TOwwMa22SFBTp2VyaGlnvMSWpHEse/TBTMtHSiUtxEVw?=
 =?us-ascii?Q?5eEPp6h2Iq1U4c7dSHUL3D1TFXDPbtPWZ7coHX70Bz8y3zBHXruWLSU3Be5K?=
 =?us-ascii?Q?3PWb5NUcQGiFZ8NQ+ztWBM+H2aoPWPyu7xG/8l0dd7hWdKmcDW6oyY34mEX7?=
 =?us-ascii?Q?iPq+6w5yUtcxsUHABisdEOECScStSUd7KsBnkxhKmOLYamwb2ZcJFBGpNnpj?=
 =?us-ascii?Q?KC6Ggf0wN9Wu+cJPOiW0kOsKwXWi+9WolXap8Pvh8tZHHE7T6iA+Bsao7Dc0?=
 =?us-ascii?Q?9s9ap24I3nw6nCYmH/ec3jD/pORKiUTgv6EYkifpTAWA1/D4ptQ9X3rfp0wf?=
 =?us-ascii?Q?tgl3GDzkphC8K1uA/T5GgDVxRQbPp54sDcOKdhLVf0Lqw/uL4bAtnwUUuEDp?=
 =?us-ascii?Q?Ou6nNM01dlg4dWluLKo6tFw3auz0f/3/pgUUYosQMhjsPOoDoOSQ/CCrUQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:38:18.6686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fafe8b-2017-48ea-ee1e-08de15dbd15d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_213828_701868_D67684FE 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, Oct 27, 2025 at 08:23:10PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 20, 2025 at 11:51:49AM -0700, Nicolin Chen wrote:
> > On Mon, Oct 20, 2025 at 01:27:36PM -0300, Jason Gunthorpe wrote:
> > > On Sun, Oct 12, 2025 at 05:04:59PM -0700, Nicolin Chen wrote:
> > > > @@ -751,6 +760,8 @@ struct iommu_ops {
> > > >   * @free: Release the domain after use.
> > > >   */
> > > >  struct iommu_domain_ops {
> > > > +	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
> > > > +			ioasid_t pasid, struct iommu_domain *old);
> > > 
> > > Because of the starting remark I'm skeptical that old should be
> > > included here.
> > 
> > Hmm, the followings functions sanitizes "old":
> >  - qcom_iommu_identity_attach() drivers/iommu/arm/arm-smmu/qcom_iommu.c
> 
> That shouldn't be copied over to test??
> 
>         if (domain == identity_domain || !domain)
>                 return 0;
> 
> That is just optimizing away the attach if it has nothing to do
> 
>         qcom_domain = to_qcom_iommu_domain(domain);
>         if (WARN_ON(!qcom_domain->iommu))
>                 return -EINVAL;
> 
> That can't never happen
> 
> >  - iommu_sva_set_dev_pasid() in drivers/iommu/amd/pasid.c
> 
> Its broken, you are not required by API to detach a domain before
> setting a new one. Keep it in attach, hope someone fixes this driver
> someday.

OK. I am leaving them alone. And no more old passed to test_dev.

Thanks
Nicolin

