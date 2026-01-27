Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54ABD34099
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3RKlvdcEoP9Uu/mcemCmbe9e6wEQBfOmxP8RaTQbnM=; b=ZdDsRxHHYEA2o0IaUpMJwNv+uP
	MB+waKkpC3Xemc/Zs2Xmz+q+NzR06U67FDh9WlQU0moXZ3RvlOE3f53JgWMnMjc5BHtTHPMyitMiL
	1fZzLd6wB9xfBkxUPw8dsiKETi+FUli3GqQMosBCYQGQ9B2dAsqZsyCXp4ODet9E8FRw2zSLO8K7k
	DejEziHVD2yzT4t5UdxMUGyLqVwumnyd+yEhxKMLZhVJrfjzsw8y/y3BxTpjHPvMnxKDYa2s2ZPp2
	swtlfiTCpR3oIZv1Bx5VaJySolZ6j4wqPbZzkpCe/xfgwe45CShXOxtNZxXrcXjlvq+VoTuwF3iJ9
	DYHq+IDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklWe-0000000EbLq-3zhf;
	Tue, 27 Jan 2026 16:02:44 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklWb-0000000EbL8-16pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKcgTp4Uw1iCkkgXP7swFysAMlqSkAqyH8lvjfCNZsBAU0DPn4y8JpbELG6PljnredRM3tFmLMno4KW57NgCSHniXyRt28hrcP4A9zpUJoT03fEvPZ/HSuUgjoQN4T5eduTuMAMup7WLQWIMCtPgSGEP43MniJ4Up5/sPUFxw+18Ty9VbLZWMClmHUlutMW8LShcWAE6PmUsfPhkoq6XPcQN74wNuumXfWHwS1qurUNgPbrNizr4i4yaTaJkKy/sa0xNgAC9hTfQ9GFvKTEDXHqMfjQHensh7pGgv6o1TyHqpO6NyTjxOfihjoIlMXjmjQgTqc6EWmx6KkoP8pQZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3RKlvdcEoP9Uu/mcemCmbe9e6wEQBfOmxP8RaTQbnM=;
 b=Mi4Fz9ILb8EGxACiqPf5IW08OZXZs3i5BzWq5fzX16OCEtZcZQblIZHgL8HLekZHlf2mtyUBWhYEegswuhv/ElUvTDGbnsgCDvdj1Ef6/zNRWt7Mx+FWk4U+5I6W9ePC73f7GFEnnUnhOSSdOLAxo6BuWJrVDey7iyTzTV4H/QxGJCrvBoja+PsNamH9WZu5oxfRaSThjHLbMkuBQZiKeej2m4V5YAWUOhrvdq5zQ23Hjp7cGy/80Baw11tjn3I7MzcBbigT/7H8pqi7erqkFmSeEep0Sfxn703QIQx59uePIVTsOUcI+hS7bwpsyLvqE2xyI9D0T5ymEeFs2eKbAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3RKlvdcEoP9Uu/mcemCmbe9e6wEQBfOmxP8RaTQbnM=;
 b=I89bLyt4WzG5s1jX5znIyJ+IIZOSdzaHnf5SUAUtBxH7iWLT6bUgDx4/qKyTyaTjttCNM/0Zk4WD+TvzV8R1tlgGLUnkRkA8H3GH8r6+cxxuc2uEIdzcAY71IZHxNGS0z4aScSG2hpwjGWSvxXG2jA8HQycpXEpMMR8DWdkRCL45HJfYc/hoA6rJHyjTzNYEWX3Paz5Kkw9DOHXKkWDBqXOtS+7I0iryAzkAaxiDIfEcc8fjJIGMu2oRizjUPjFmgCE6MVqfMQz7s+/ssDXJptHV+AX39C58N07i0boTzOAbAQulPehYZDvCEBoxTVyH29NZXlDf7zVnteq1LBaILQ==
Received: from BY3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:39a::20)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 27 Jan
 2026 16:02:28 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::70) by BY3PR03CA0015.outlook.office365.com
 (2603:10b6:a03:39a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 16:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 16:02:27 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 08:02:07 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 27 Jan 2026 08:02:06 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 08:02:06 -0800
Date: Tue, 27 Jan 2026 08:02:04 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 0/8] iommu/arm-smmu-v3: Introduce an RCU-protected
 invalidation array
Message-ID: <aXjhfKEiPUWX58Gg@Asurada-Nvidia>
References: <cover.1769476588.git.nicolinc@nvidia.com>
 <aXi_qqx8oNn44UbS@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aXi_qqx8oNn44UbS@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DM4PR12MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cad237-971f-482c-305e-08de5dbd7808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q54iyhvxzaUz9JOWEHEdEBBOW73caFXvpC8B2a+kRcD1AsxsHThXjy72yncK?=
 =?us-ascii?Q?njZRJgchflSvCcrP+Ox9bwqUL/g3vSY3szVT6KFcdckkjlTNJX6Amrfqv59m?=
 =?us-ascii?Q?SeuGRz+I3GQ9b0LTfIB/SDIaEbsdPnAh8rZjTQrYbwo6HS+9Y0eoZ4qO6oO2?=
 =?us-ascii?Q?kYUdBVP/iMhOSfr20J9TYltNUC/pdjdRETk/P6Fdi/t9hSB1tmzF5nqf8mFy?=
 =?us-ascii?Q?ZkEzVVdpX9WAXzvkIkD5T/jYpiy4xXwq1PuiSD8be3Ra/vMPFtWZ5d3RUcig?=
 =?us-ascii?Q?0QMpVErnsG2FvNgWfHvJRZ5sGG5NHQcBXnz6sGlNlwIV/S7p7kvOV6AkCMzv?=
 =?us-ascii?Q?NPJ+9oBWGRw700XORrZUbt/adcSc1wCMmubw+rL9+9yftzE0UABOJ9qQ+W+v?=
 =?us-ascii?Q?jpI5BiUOCe7KqzBydJHgZOnqdBOeB5xBlADCB9bytv52+Q61I5F2Sb7SYamk?=
 =?us-ascii?Q?h8wbL8zU5L9fc9N7uBU5q/6UQc5b1TGmI5FWZYH+UjnhgFdP8sAniM6zRI57?=
 =?us-ascii?Q?QsFN50hoN/WnS3dW0CX9g2R0n9GFk3n7OGhX7n1cuzuSTjspPoDmbHvSqO5c?=
 =?us-ascii?Q?Q/ef0aDQqBrLonZwtx2y8eBadcyCgzQ4e0Tx5Rz6APMaF/jcMwRIxX4reKcb?=
 =?us-ascii?Q?tRFYncHIZ0+zSznamIAa5Mzvh3BM08F6P6bdbfSpAYbw9xaW30jCIi44eiNU?=
 =?us-ascii?Q?AChqnibPWaXDM6rJAZ+T0rPY0aCvnF+/jBfeQsb9m55+VlOyoPNNfVJcyFeN?=
 =?us-ascii?Q?oxfL+8fEBLjmNyQx7g8bReYqm/st1UNB+biQEIzh6XfwzKayD8IeBzjJngNL?=
 =?us-ascii?Q?AdpeUvzReQfGtxNtrYVx35zCmMalFe8U4wGq3AN0r8TCAVagj0WiLj5I+Pwq?=
 =?us-ascii?Q?UGYlD/EfcPfY62FLDEFpd9653GIG5neKHFr7Tc4gRuITWrYaR40vUZE0Ftzq?=
 =?us-ascii?Q?GUzF3yM42BEsyrxNgSWCWFp34r4ONFaa9R0f2kaWWOKM3aEggPNmP2HOo3jZ?=
 =?us-ascii?Q?K8UlsBy4S2q3EVYMQ4Ce7ds+mJc0oVYC0/chvWv834NDwDGnfcUo9cBqCK7r?=
 =?us-ascii?Q?jVjoYzEknQjb7OKz5DfOP4hsmNCk6tlzVDNMnrg40sPctIHfTvzRg2yCCsPT?=
 =?us-ascii?Q?aDNQ1E2DeaH0dqzv9dYytbW9DiZQWTtQBoqN1BCj/DoFKKHhQbSADaTUWK65?=
 =?us-ascii?Q?eOAqj5c1oQbKKJxO2RjWSojDAwqq/QNLTh6887Zt+XSLnqLbUdaiV0sm+epc?=
 =?us-ascii?Q?rPg8z8k0AmmMvl8WcDLmx75JsREd1P7sMmnHQqbgpUMBvx2Q8kPHCeY8v7It?=
 =?us-ascii?Q?wGVGyaNC4qQxKLRl40YGsg+MxyefLV+w2fY1dSUelgnyXv/R4E+aw9VDqExR?=
 =?us-ascii?Q?zRQ9xo6gSslp6B6ZShU1LJ42XzN8vOOSCrIi0xMwWXDpIR2AjDW+6vrymtnH?=
 =?us-ascii?Q?yakrSlTu8cKpkD2rWHgHl14G8jAaxjEE2B1Y0cOuEoCzuNAeJYF+n94SrVL0?=
 =?us-ascii?Q?AGgUs/mrZif7JTwGNWo21XO2B3S3fI2fmXo0nFX3Zj5iJiCiR6zkd4jXPRXK?=
 =?us-ascii?Q?jCqDwsiw92oLydCDRv0bJ2JrUdMAbS1mMgQZvgo3GG7ho9HpDaj7oGzRwRV0?=
 =?us-ascii?Q?TZIjly2CzsfEwnt4OEu6X52UZJ/YhoR4xqKpqFyje/sG21IDqdUgRkqxNWq7?=
 =?us-ascii?Q?mkFnNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:02:27.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cad237-971f-482c-305e-08de5dbd7808
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080241_311884_F2DB0535 
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

On Tue, Jan 27, 2026 at 01:37:46PM +0000, Will Deacon wrote:
> On Mon, Jan 26, 2026 at 07:09:11PM -0800, Nicolin Chen wrote:
> > Changelog
> > v10:
> >  * Rebase on arm/smmu/updates
> >  * Add Reviewed-by from Pranjal
> >  * Fix typo in kdoc and update comments
> >  * Add dma_wmb() in arm_smmu_write_entry()
> >  * Drop free_fn from arm_smmu_invs_unref()
> >  * Replace refcount_t users with WRITE_ONCE/READ_ONCE()
> >  * Verify num_trashes in arm_smmu_v3_invs_test_verify()
> 
> I think it probably just slipped through the cracks, but Pranjal had a
> concern in v9 about the rwlock not being irqsafe:
> 
> https://lore.kernel.org/r/aXND9YJTwm6om689@google.com
> 
> Did that get discussed someplace that I missed?

My bad. I missed it. I'll reply there.

Nicolin

