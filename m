Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1261FC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEEAIeCyJkEDyGcp/d1oPVMySRbpHPSL6nnCxUTU5M0=; b=sW9FAwKG8tCAuOHTnDU3TK8LoB
	hr56Z09v609A0oc+rEJPZEEVuoBTlrdCahTNr8qNlducOapaUV2u68Yge0cWVKaoifuVuU24FdEZL
	10obKvWI7DiYmqyn6NsuH5eiVMP/6t2C00odtQVWa1Brlc7j51ots3t2AFk1iFe1wLAECAsUCMaQR
	e6xTd/CEuBa5rl4J5CdSsyNkoP6d/dG7mfrXb7PGaojqGH2D+Y2TKprifhVSeDFHeZSCQTL7xuDjZ
	4/6GVwZazk6PtcQHi+abZRkMLh/wDEgzUHhLFeqezomrpLk8n3TBRBnTMmn1OpY2mvagNiyONp6+t
	ERPya1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyerx-00000004fvU-3Rr6;
	Fri, 06 Mar 2026 23:46:09 +0000
Received: from mail-centralusazon11010039.outbound.protection.outlook.com ([52.101.61.39] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyerm-00000004fuX-3FLJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2X2dssDDjiRAbySW/8nwTf+YP+lGO62HC0GO85aHcjiwx7f4IfENGV949KxjMQaKdcfa0ZmECqq3+QBFiBsz1mTwugKbb1nZakhkdNF4yAWTrQ1/YC8E9T7i40msrCAUR55lh7jYcuu5LkxVAyCxdYs/KxdN8NWQL7pW+k5QO1cHu+DOohhULXd1oDwe/ZymsdQhxhtENE4Xzx0wBG3XexRjPsPRTS6DE7bx7MyPmeWlGrSV+S8JbfgP/BYGYm265D19f1jEN1dX2zU0l79qJPTAZBD6WEYzc4Fn53xYU1Xr2PGaYLfjgtDIYvVhnWxS/NgxQGwKQIVL139KnA7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEEAIeCyJkEDyGcp/d1oPVMySRbpHPSL6nnCxUTU5M0=;
 b=NNWnFsPI9ON0ui94gRYN3rN6ZnHT4Q5NwbqxZMnqWm6Zc36KxwIsYmB3K/ScC1MyYfSzm0sThYk7Lw0SJRJL+H04+ZoBnEnUyxl6in+RxnV3WZCObpEZPdLXWVpNS6W/w+ymHEkmoJwe9yvhnPNA+EnYLuDUhCCmdHVJAbuEDKvrDszznMovdZvADQCq8ytw+R3WGEPqekrA7ydm1FCMb9avS+ntf2Y5Z3C46viU/rVrvV0qFXDXXbmk6X+8t2hGfatkTHC8Bgk7kyyNtyCActQ1JUMfnen0vbQ6HAv7DFMINUiQhTTQkhVH1o8PKYmAReqGl3jDP9AkMK7tT7BNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEEAIeCyJkEDyGcp/d1oPVMySRbpHPSL6nnCxUTU5M0=;
 b=jVSr6dLUKeD75k0yOLodVHPWUhjkHnAKP9hE4V0XS9ug21QE0id/vU8IEPlmbZ0nAONd4PosfA2bI6sySDyUz0NSerWcG3tqlXtlLx7hHcD1n5++p4M5ldf+anqI8LTxpv3MpHjXOukuPz/8qE6VziBRGbggNe4gwphI6/KwblwND0wDhRn4pk7QSuE4hI59x+pocBD/VpsS4vEWZuNBakWwP9vhWQpm+3vTig7SShP+Pjohx4UajHIhdCBRd3IzcyQa4Mqz80GuhkwcrNMGFrtJmx5SrazChBryOB/XDXVsvEbZ3jIpZuvNZSI4zYxOXA7ICruhp/4O5Izc0KZGpA==
Received: from IA1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::17)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 23:45:52 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::53) by IA1P220CA0013.outlook.office365.com
 (2603:10b6:208:464::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 23:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 23:45:52 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:45:33 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:45:33 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:45:32 -0800
Date: Fri, 6 Mar 2026 15:45:30 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <mmarrid@nvidia.com>, <kees@kernel.org>,
	<Alexander.Grest@microsoft.com>, <baolu.lu@linux.intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFTv1 1/3] iommu/arm-smmu-v3: Drain in-flight fault
 handlers
Message-ID: <aatnGpNroq8b2uq/@Asurada-Nvidia>
References: <cover.1772568590.git.nicolinc@nvidia.com>
 <c8075912c23542c9e9872408658dc496063ee3a3.1772568590.git.nicolinc@nvidia.com>
 <20260306231213.GA3717316@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260306231213.GA3717316@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: d412c050-2d81-4bc6-5ad7-08de7bda80c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: gYy4nbunRMKVkrpbAwDbxMg3eFcffDvXUOrONQ+ONnHlNTk6UzNlxXZAAYaDQbj6lLk9qB1AckJRGUjI9kh+KDn6MLgoXO43/IgYqn2P0ir2K0bOO+qBtO2fItzXwJXgJlFNF6YafbZRYkGdq4aJx1IvFz2oFM6ybntNwVAwEYEkSozmQsk7Sel8NenRJpBHlGhcOvjB0b2iS2naKp5hJtOEn36a8KLz3mkDIZmkgAUMrmIGtO0TxljvkkA7RwmPa8QbavU/fDvlE2krCNTHQ44q1t8/W/53EdmX8xfp//BTqIWDIRYwD14elCvvMHMUjG+0dRvXFdCEwiKh3onrqrBbbOnoPWSISN33xbCyvI94qMYdjvavCAIIL/oqik0iuQyXLB2oIvzwVGboV0Dd7gQ7NfQx1EGNC0f3xNP+ZRV6PV5lLvYVlYxRWaLtZlnFxnFWtkvhXYndQ73C7Al5kqF88mRSbxxOeQb6UHU8lhwLivYnzx0XXBw2t9RUPnyJaY3WIAdKokbUvO7CWv8wt6KohhYpZuZmyoSd4o8B7jJtMcvgPoyzmR2Gcr/JIM4dvNNNacyy+Yt5mVVB9E6DDA9J2/pnvlJO4h+dPKkCpcN9mU5gCD2ZCK4hGG5uyfVB5N4L4RFlCxIMspYdFGDNHz9WQyta/tU6oe/9KTHd2TWA96ihLsZn5BZz/+ZgtLTzeljMaDcBD4w0Ad73DmHaDtZamvuk9X1yywJhJi2WpPW0X+Od01uHwG0DuvuFiczOpkSePvyNfTM4rwyazdSQcQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5lZLyKVy6+NscKpeFlpLf164Yb0IHGm1LdYjwdG1VAGCgLEvlnz9ydyGZMpfuI7So4+UwB//EU9y5VmvGlqH5Fh2/cuUC7lW/WrX8INoa10orWWCMkl18abkP9KTOHJpe+d9dL7fRhKQ6iskwY3yG+fBR3ekopYgsFuPrWVhetG2PRa3J9swHh4izBfJRPsb8BggM97VM0BET2AWsRPPlkjmWRVSaVIaCYlECE4aGPoYDsDF4siNWphGlTpIjUhSZhquoZFV5sPBKg41tNDJKsgD0if3dE0KiTOtZV6zrstENiJyTJpJVD1wnnXQCEaxy+Tt5WdgpTvBOC/LPyLC3vX0mj5JTQNOTnKo8otooT51qXfg7jLdfGK4SdQ96zBWMF1QryT/mvT2WTDtXkg4oRi7gTj9jKKYdfSwfo3fop8gbQLpVSs+4liYnFUPIACJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 23:45:52.4760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d412c050-2d81-4bc6-5ad7-08de7bda80c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154601_558905_4C32AD59 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Mar 06, 2026 at 07:12:13PM -0400, Jason Gunthorpe wrote:
> On Tue, Mar 03, 2026 at 12:13:05PM -0800, Nicolin Chen wrote:
> > From: Malak Marrid <mmarrid@nvidia.com>
> > 
> > When a device is switching away from a domain, either through a detach or a
> > replace operation, it must drain its IOPF queue that only contains the page
> > requests for the old domain.
> > 
> > Co-developed-by: Barak Biber <bbiber@nvidia.com>
> > Signed-off-by: Barak Biber <bbiber@nvidia.com>
> > Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> > Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> > Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> Isn't this an existing bug in the stall handling?

Hmm, right. I will make it a bug fix.

Thanks
Nicolin

