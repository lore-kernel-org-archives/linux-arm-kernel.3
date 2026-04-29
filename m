Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2828FFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv/IfA1uvCZrEybx019SFJPC7XFBzzqteE1PliRam2c=; b=i4X4nKzCA4mPYRfveWUqGeRpzU
	5v17bW1gRblJf4FITHZkAhYkIqMTfZIAlIVzlmRoX3U3PoV2X2dBQN9L1AUTRSqXRZfNnzPPkSdhO
	WI4is5+vIRF1VZHZ1Yo7NO1iw8JMdmyMCxx9r+3lSQqZVh3FjjrZydvVyD0BMUUm8eg1wyWsNTlSy
	PI8CrUuh3esIvgNpX/enYiYLsMa/hf3i8UApzQbz0MGlIhAJzWNbF8HaVjaGjyuG2fniiHIhKlwXH
	8WIqyDVS4ZUjFdRRr4zVSwWJbIjyqS7SZ+SeqgR9V6SJGUBfQE0VmVr+dq+iDFAN7O44egKI4vCi1
	hsoo6Arg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHw1k-00000002t6v-1rrA;
	Wed, 29 Apr 2026 03:55:56 +0000
Received: from mail-eastusazon11012037.outbound.protection.outlook.com ([52.101.53.37] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHw1h-00000002t6P-4BI7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:55:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVVgirxLPT5DplccpnTgKD2vjUnvrvMqEgeYercnTm4I8WhiJDW4D9Xi2/rqXmqbJduyc6Jo+kHUpzJJaLya8r6XOSWppJ3xSc6GmBKgJJgHHDhIMldAH7F8ustxbaQv9Vwkg6JRiRFoHRT/RZVgp1tUZxly2Z6Hl74yWgH18uia6dum8gHuQ0O7rD8S+FE1lmzSynQ2WW7JMIVe14smubiA4pwTEEk/fJCOgxwsm7SZ2iMtoy7OFryrUGFq7XPsD1c3vAvnce1yUe047Ey+PxjgUKXMJf7I/6tW1K/HmF1wihGDg/Y66UNMkZAH1Q1nWFSQurfh//Nd9fRWTBuQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv/IfA1uvCZrEybx019SFJPC7XFBzzqteE1PliRam2c=;
 b=LWDt19/gIpOuQxRgcht0sKyLiMmY5pziOSwOfvQrhCGuzMXR3DUJDQzt53PEF4Oky5J5qWSALwX/geaFrbJP3qrkIY5CXki7rdveMIzUTuf/m8Y2QZMwLcqEeWxsxN2QtepkLfd4PNhHsL/66tqPnDTTfGx6H4Lb9VWtqVsIykE7CMnHEZ08WL4vFuCh7g468MVnfNlBufFLFWlWWC5/DCgSI3fFQqfjwdcAhtqA7YDVSDMgD2NP1Z008lCpPc2rh+FgYOeDDHX6gvndtA6V+FXOA765wFdHLfSYjWiP/NysjuRD5+SADyVYXULRM9Vf8Kf1dQ4CO64qZrIIrwrbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv/IfA1uvCZrEybx019SFJPC7XFBzzqteE1PliRam2c=;
 b=N/w6Jz09Ifuwb6gfJjSH6j5dQg9BnRP8vmJ8Jndkqg9DmAHvuVzzMBQSZVXrAZispyfMTpGXmerVh6s7aPvrD1JBTn/p1R1YLxokbqYFcbuE4Vv4U3aSKOUIqUpLtjdEPeKJUzqeMGuuOVvxqjeyB8WO4Yz0wxQqwnekQZfwJm2ODbycN5geThWGUIXt+ZS4eJhbdmImAwfMi91AxbQFotWMSTBI3CnfsN5/frtC8L2DDNZCjlUUZFnZq/aPMQWKLs8x8RqhT+h/KB4RjzmCmh63oAQheu0wsH9PeQyeFsjZXAIaEk0Zk0Q49zE5h3BRhi8hSbVMHaAGiF/wsn7gzw==
Received: from CH0PR03CA0099.namprd03.prod.outlook.com (2603:10b6:610:cd::14)
 by SAVPR12MB999143.namprd12.prod.outlook.com (2603:10b6:806:4e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Wed, 29 Apr
 2026 03:55:46 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::75) by CH0PR03CA0099.outlook.office365.com
 (2603:10b6:610:cd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 03:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 03:55:46 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 20:55:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 28 Apr 2026 20:55:35 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 20:55:35 -0700
Date: Tue, 28 Apr 2026 20:55:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH rc v3 0/5] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <afGBNcntmLjlT8vd@Asurada-Nvidia>
References: <cover.1777150307.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1777150307.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SAVPR12MB999143:EE_
X-MS-Office365-Filtering-Correlation-Id: b637aa3f-cc26-40aa-979e-08dea5a3317a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: mTcudfzmsH5ALe5bOxASIYDU+r4PiEcdLonmG7Hgecmin3vcNmdgkMwSh9pYx1rumoiqlEihw9h2RzPro0ud/ec6gskuIJXjxJaAMsbUwtIcEeLN42576/wl3zk6CXJ3d+RGRQnFCr4ZUdkp4G70rNtBBLiNeU4jyMZ4HrEPYBie+qTN+CCjg3GINzzSBHW+SaVpkX+5cDOfy+dBqfYfMsi8RD+whg0rSOXIClS7jVEWo0UqB54dDsntsQDuhj/160HAUDmIAMbcFsJOdi90g5bQ8/Z+rhu1NWRZLZYvQs8do+3BwoEnIUg0QvzWU+63cb2+sqQDTtg6UIBsc/vWyJ009XdnOgnuMJYZdAaUvcp1KDzPC3RDTwcTWkMmiHciApsMKOIDk0uc3puQocKws10uJCThro4CMMQnSkXaQObnXAPgvOAkLrWGyU2dDLP641tz7M9+DJgIrYAE0pR6E6BtAnej9EKw9jtNJjLIrnZLE4weAO4SRkbIhhS6ZlFPMCH19qV0d0UwhUzarr+ace6UdqzLT9Gh0yJyp7T1LP05YDl0hHD/mi80hBnCRmOYW024WBtE4MVaPGuUF+vZo3geq12gbJgF11SBeCzs5YGbzBCmYyfzXW2Jn9W+YsMuUeWspNWOFTtlwXGchRRk06rks2BtSBavGmPSuq+WsW8umbdvuZzbrgIIKzBh9gIkFCLDIxSADY6GmMIu1ajOP9EFBehfmcpxcFoXmfp0lLCXoOFSVhKRBz1g8NDu0y6i85/UEy48ZhfGDJUhxtVVYQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oTcH4O15e9vXAtu216ThpgDK7U1mco9ha9AagU3AGUJ/uJSHlK16d1RNstTv4a3OlRGQtichTZRk22Tq62Lf2CTzpO3lIEyw05dauzsxA9pMb6j/eNa1mIkQtvPb03pN5NnMsfhaOia4aFg22JgMgVyc3q/a66S2FeNpIeT8uJeyQlXMBG82dsuoHYGs2FIH62lcaf3ZM/dIze9RtLOXCX5eybJeEWiwXQJBJ+HrVx1nA3KBDxL8CZDVpOPIPtfHz92rx8LT4MG1o5o119AInTCvzTrNh17frQTu2NLkxmAvoVhTWdG9zVo2o3BDzmSZ3Q9YHNFpPwhuH3e1vyboaHkfLQdwb2X0JFzxCRo26w/VeKQtq+h1O/hAwtWEsI6dSsAOmnAXo4bwKU1zLE+G+ppNM2fwWf/fkUa/KSP1C+r2DlQ4Zb40BkcBh1Rv65QW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 03:55:46.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b637aa3f-cc26-40aa-979e-08dea5a3317a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_205554_071851_636E21D7 
X-CRM114-Status: GOOD (  10.82  )
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

On Sat, Apr 25, 2026 at 02:30:45PM -0700, Nicolin Chen wrote:
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/smmuv3_kdump-v3
> 
> Changelog
> v3
>  * s/OPT_KDUMP/OPT_KDUMP_ADOPT
>  * Do not adopt if GERROR_SFM_ERR
>  * Retain CR0_ATSCHK beside CR0_SMMUEN
>  * Clear latched GERROR bits (e.g. CMDQ_ERR)
>  * Assert ARM_SMMU_FEAT_COHERENCY in adopt functions
>  * Add STE.Cfg check in arm_smmu_is_attach_deferred()
>  * Fix validations on return codes from devm_memremap()
>  * Sanitize crashed kernel register values in adopt functions
>  * Drop unnecessary l2ptrs guard in arm_smmu_is_attach_deferred()
>  * Don't enable PRIQ/EVTQ irqs and guard the irq functions for combined
>    irq cases

https://sashiko.dev/#/patchset/cover.1777150307.git.nicolinc%40nvidia.com

Sashiko pointed out a few more comments on v3. Most of them are
interesting to address.

I have made some updates to the series and will send v4 after a
final check.

Thanks
Nicolin

