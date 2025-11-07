Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4425CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMiAlmZ5os5PJiSn3mse/lYqj6Ay26vK/U4XP5dRDMY=; b=WHPxMV/zHhgBJlbkA6I7pVixU/
	myBjcXVtfJRkEk4KWRs7cvSVr8uTCJcp+xS48EZs9n2epuapF9xYlMvAYLAQqzXYpk45aQm46Ej7f
	4rrXOIiNLD0w8cv6MEXdKqU4O365f4ALOiv61WLi6WNDmznUuzGVkQLKbHbJoYSGfGnRKUkky/REs
	UJN7MCbMAFbLVzx8mxXVIfWgZp6LD++HiPVRcc3Jg4A0LJKV/UqnU2S1e+ZR6mpUxDxuafcl+VpCN
	Aec/bZQeUn/J15M1t/xKNCGd/mZ6Ulnedzmrw95db+4ZkKf3/K1FtU7rUfMcRAo2Wi2xrztY96hp7
	HRGx3ZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHT0Y-00000000vfC-0uDK;
	Fri, 07 Nov 2025 20:24:30 +0000
Received: from mail-northcentralusazon11013070.outbound.protection.outlook.com ([40.107.201.70] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHT0W-00000000vdv-0Sm4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv7wN1UaOdDQleySC43eE52yJddi4bqIsjfWbcPsnwHKlVS7xOOEiyPMOutJuAuWR87QkYmbtwcSkNWgVdaCUyBzY7GKfxGt864Ez9EfToU0e/azca/OB4dP6pIJfb8SDqlsaHIPJxLcv0dwgeM+yjPAYzLpJNt8IWYHVrllgiwnc9BHFnU5uw+a4Y7M0Fo2uKJpQMPAzcVTys7dM/kW9F+1lvr+FG1s6AvwWZVaLjYT+8BagZpACz5C8rvsX3Zf1mHEBD/FysnbuQGuBkA1dZUc1rgeI+B4T/XC4W+fMsiXiniFXzmQ6CdwnQ/+3E+9z/HCwl58/O3GtcmdyKfQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMiAlmZ5os5PJiSn3mse/lYqj6Ay26vK/U4XP5dRDMY=;
 b=wd01u+nhB45OaZR3RyXz9vxI2e26xYF/pG6B0pOWCrkgB9hJ/zcncHDj4r8RFsuTB+hnXaYjzA+WUCc57/OlPrPqM4UHtedkzIpP/+GaFLy5ly42zMBs6lCa2FO3BxGtJWwlJSCgYygGjQFffa5tmyWkJD4296Gctxva3yesJjVzrlDFotQ0fvQtwhxJ4qD2r+0zhCWloiqvw9a4NvH2/tsudZQ1jCu6MqvGs6lCcx6j6Z5qBSJYG6UWkHOXwvHJUk8FsWaqOaDoE01pZdB8Ujm3mABbrW4EelZYoeKOKWRuIXSUhkjOffqkKhdhgPGtz7SueWOLLYD6R8phhH4hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMiAlmZ5os5PJiSn3mse/lYqj6Ay26vK/U4XP5dRDMY=;
 b=t8yVd6CZTw8E1XE7vTlwLxxW4GfM1HyZu96xOl/8OwH4AgUYNJ10fxxNbC4qxiBEbuq3amevYEUdv2GQf6mu/GdO++DJ8S9TWBywUSVkXlwMNqdUDBTBOugHbNXcct5ZPQ+Lb5o20Q4OZ0lBPK0MarKuFDfqso7jzlkbqqlis3H3UG432HBvQZW3Ghz8XKHcD99U/lc60lFq49+P8cdUeV8ym4Q04l8PWQlQMbE8F3CF7wc605KODCkHmNsnc6i/K4xGNioNXOpdXqJWcrM+uzs7nW/ZbWRpzSnb2eDnpwc14uBs4b0APuDuHxliIcZ7TrhbWIRLomCmPcaJ+SKbmw==
Received: from BYAPR08CA0070.namprd08.prod.outlook.com (2603:10b6:a03:117::47)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 20:24:22 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::bc) by BYAPR08CA0070.outlook.office365.com
 (2603:10b6:a03:117::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 20:24:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 20:24:22 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 12:23:59 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 12:23:58 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 12:23:57 -0800
Date: Fri, 7 Nov 2025 12:23:56 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <jean-philippe@linaro.org>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aQ5VXORy6nQ9yfwF@Asurada-Nvidia>
References: <cover.1761590851.git.nicolinc@nvidia.com>
 <b7560a95f474bd642e037d5a43cfe5be76ea3fe7.1761590851.git.nicolinc@nvidia.com>
 <20251107194158.GB1932966@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107194158.GB1932966@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2602c787-a3de-49c1-a4e6-08de1e3ba369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UXJ+2SEmaAj9fdJDRmzaeJdJfMY0OX7S6PpZ+/cyhLScThua/LNz0VZWqRRZ?=
 =?us-ascii?Q?IBq5BRb466AxV7hPx0C/rukznq81/kI2P7RHGjGVdb11RU1KEtTAdT6VSCgZ?=
 =?us-ascii?Q?mjzi880bl2utS+TiR71Zyahsj3m6f1RQ7jQdmwCXD+mVcv6hY90f6huoWecc?=
 =?us-ascii?Q?+KvZVSuciHDU7W0KqfuknAr3dLOjTSAEI94SzsgzRYdd3397y/9HxZmSOAOq?=
 =?us-ascii?Q?Fs7d1r/69CARo6YsBgLTElkeN96PUc0gwBWNm5aD4JG87D+NLSPIZisYLHvQ?=
 =?us-ascii?Q?aexzClVQpJ/a+1Kdjvf7IRAc69Z58hexSgHsFRYGXUNSlfgsR0Qq8VZuIpa9?=
 =?us-ascii?Q?cBqMs19Ku9HBUJGoycEvm80T0101eO7dUa4uYImSM7apVloPEhN15B3I6kzF?=
 =?us-ascii?Q?vj4MkjlwWOkBIrDNFYsGmzT3rTpHUA4sKtaWJ2y9062tzQ6BUdWEL97mn7eO?=
 =?us-ascii?Q?1HGqw4ghPVDQvfV2A6Ml665a0qMjIjzJ0VVzIZOI/0Fhcu62HiQQtu2n4geY?=
 =?us-ascii?Q?XYYtuYjalP0UQbJKwEmutyyvftbp5a7RDkUqS/qgEmV5RG7gidoPF499ZjZA?=
 =?us-ascii?Q?3YugFqR+OcNiUGxaeOdMjJYx1Y2IUg5hHm6ZqVkgQG8yD1IoNEK+ahxJsBcD?=
 =?us-ascii?Q?sGQYS0T6aOEhu6QAYkg/HvRW5fySm1w/HZBUpNItqLcFPydDxyHBclpWTenH?=
 =?us-ascii?Q?NSgq9jd5NVrZwWtm7Mq6eKAxilvzSySPulr5+Rs2REsG2byB1+M8FdcasrtE?=
 =?us-ascii?Q?UMvarIUJNT5iTNh8VY9utZDQfauJyD92IZdpk0N/0SFiF/XTWe1agb251lsM?=
 =?us-ascii?Q?g59ZPLtkreKTLwfc2a8fdZWCasjB55FULS6YKNcZOjsCoaLQeOopWUPIujU/?=
 =?us-ascii?Q?qRlEG5bu5no7UUAIaBVYtMI7ub0NrfF5NJfElRbkeJ6iUaaGdIp1ncEk/Nzb?=
 =?us-ascii?Q?nmTQcQt9YKSjulftb9pE9T7ccftVH54hs7fhpwr8cOKOLj/qUQz1ynE59ypm?=
 =?us-ascii?Q?7YLU3lrp8T7fu6NorTyRe3ijITO2hwm+H8Vs8BO7wkdRlulZvoijbjtHQ3aQ?=
 =?us-ascii?Q?keInzSG9DQN+GBrdVExYGGHUpH/mcOtuottjJZKBfXm+RhcVdLH/oNOiL67e?=
 =?us-ascii?Q?BmjA91r1nseBG6tMGLBehlSB8Eyfy3ygCuBnZUCTegdMoHs+3dO2c1WtuR5t?=
 =?us-ascii?Q?gede8s5cXF3RbQv9Ah4J1QYJ9Yg3n+YnmP1DClmfHxistVf+klSTPa8fHMmE?=
 =?us-ascii?Q?LXwvar+kk5pIJOTFM4jZK33GAd/xt2EjUWgmljGzUhi6bI3zPWFVHrws7vGB?=
 =?us-ascii?Q?MImbGWTGGS0gL9J2a1YeBuj/j58QP2G3paizbBrIKfndPoW2vOUwxLStmy4P?=
 =?us-ascii?Q?AlKAXaWNsn0T4Y4m1Z/uhRbR7oPccSgKIFgvdzoiQuD5HzNcB3YBTbKxRaXU?=
 =?us-ascii?Q?b/Q3Xz1d2GXDRayLk2eMo5EiOxx9AaGxA61BiYHR5OMWDYDW0G+DyCthTerv?=
 =?us-ascii?Q?9CEzVhJsQHqhxDUinb9vw9ZEmRe5fQUSL2EjEQyQyRG6tu85ThpgowSV6W+L?=
 =?us-ascii?Q?+/vHXyR1uOQpuf0Icn0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 20:24:22.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2602c787-a3de-49c1-a4e6-08de1e3ba369
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_122428_177001_1F59FEB0 
X-CRM114-Status: GOOD (  16.96  )
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

On Fri, Nov 07, 2025 at 03:41:58PM -0400, Jason Gunthorpe wrote:
> On Mon, Oct 27, 2025 at 11:54:17AM -0700, Nicolin Chen wrote:
> > +struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
> > +					  struct arm_smmu_invs *to_merge)
> > +{
> > +	struct arm_smmu_invs *new_invs;
> > +	struct arm_smmu_inv *new;
> > +	size_t num_trashes = 0;
> > +	size_t num_adds = 0;
> > +	size_t i, j;
> > +
> > +	for (i = j = 0; i != invs->num_invs || j != to_merge->num_invs;) {
> > +		int cmp = arm_smmu_invs_cmp(invs, i, to_merge, j);
> > +
> > +		/* Skip any unwanted trash entry */
> > +		if (cmp < 0 && !refcount_read(&invs->inv[i].users)) {
> 
> Do we need cmp < 0 here and in all these other similar ifs? Can't we
> just fully ignore trash entries no matter how they cmopare to the
> other list?
 
The index "i" might overflow in case of cmp > 1. So, if we don't
check cmp, we'd need to check "i != invs->num_invs" instead.

> If cmp ==0 and we do num_trash++ then the next iteration will see j
> ass cmp > 1 so it will do num_adds++ and the two will cancel out.

Yea, cmp == 0 should work with an additional iteration.

Perhaps we can do this:

+		int cmp;
+
+		/* Skip any trash entry */
+		if (i != invs->num_invs && !refcount_read(&invs->inv[i].users)) {
+			num_trashes++;
+			i++;
+			continue;
+		}
+
+		cmp = arm_smmu_invs_cmp(invs, i, to_merge, j);

And I will fix the other two places too.

Thanks
Nicolin

