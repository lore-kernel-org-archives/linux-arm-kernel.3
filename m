Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1984ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ae6p/oQhFRWNN3HB9SNLB8324YW2M5FvKHnsNF2nCI=; b=xOvQMnMaAG4Aujgjkk8Ohd4rkb
	NoIN2Uff3i6D94cPHGrRDjUmlDKZvPtR6b8JiaMEEbAVKDm2OJEJBDJ76t+nKELgN1vlxLpnUJIaV
	Qjd8jl4VLnkicNTXQgfo3zuH6hHlr+ZNzELJymiHq57gOTnRmSZ60q4PuMhP3rLNA33B7Ffut0ZOG
	AjZTP9a8mRDRIR7SX1Rudkl475zBRIX1p1/1sFqYbgCKfsXnzbTMSBFRdIqLjeVAClRnRHKr2NDPi
	SOCKvdL+Qoy4Kwmszbrbxl7TQ2wxAG/NKVgoqJJwlVlK0JtD7zAz3YiEDci34ntZ8yZhkTT7uPdwy
	nL9HlnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB1M-0000000Bm53-2lWQ;
	Wed, 10 Sep 2025 02:57:20 +0000
Received: from mail-co1nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2416::62f] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB1K-0000000Bm4M-0VwN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+WxC2vvdsAp+LpYH+ngeWhDG4C/iFHRPPrldVb+IQf1uU2Zxtwfv1jcmooGAsvS6C7/Eo99F4lAjtGcqcbey8GBIC409oW4hRq9K1CYiCpj5FINJYjmW8qglmQhf4pI+QyngwLnXhNF7buH613g6f4WBgfz6FUScqUA3T1W2fv4oCqZtqrPJaOio3jKlrr0IGfee0UmE/NwRL8quj332dyZyjuYKbby/s8xBwu32BgMoFzyEichb4T9N9UiWpfQZrDEcCWOmqLQO05rcgxFzQ4+9RaX1lASsVqzHNXp+OavqAjwjpKU3S/mUnlVVIDzc2rBv3m3PKGbwD6g14Pv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ae6p/oQhFRWNN3HB9SNLB8324YW2M5FvKHnsNF2nCI=;
 b=Ej16RizhroYDw7fu22eqOwqy4MBszX+lFQl4Grk0czSC46fKvetNXukoNV8D85KeldnvCJxzMQpf0/jVK40wU38y1lc8ErvvDUPzHdOoMhXH2lkwXmtntuE7f/4/B9Hk6r0fsBskKaWH/qENRpFwIYQD2SY7ZYIR3HgD89sZz3xZ6UEUkJsRbITUWVpSYfiXKaTTaIsf1DeIMwSVDppTh/CCNLPsJzda4bKKn61yW/cyKHBjH6MAG1C+ol1cVG5zbTF8m1p+P0kmXHIS32oTcTipzq/fCApBJpV/zZZR1MYieB0KDKe7Eti+0oXez7klkXgMog0/i4t+bluC3Nsc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ae6p/oQhFRWNN3HB9SNLB8324YW2M5FvKHnsNF2nCI=;
 b=cXx4kd97qSTRBr6WpU6G8sPUuDeLQEQa4/hoaT4osGyynPmnNvddkWWesgUc80ndQOrxEALceqMlZpAwALmsEd2al5UEnYsdAvCFB7agHybXY9wWeBYCL+p7ZU8lxbeelya8ZyxWpRGEDCPejFYcOG15pHj57XA+BpIquzBFgxOHdfOHnC8+bnPcnlMjZ4zPfW00hInB/2LUDNwOvqTAqiUP3jPwwkpxJBzcx90+zJNqlcH0C+uX9w1mEQWfJuPOzwPGFsJwFbNGkCLRy18tNjsdrkSgIlkM4eByz0l8K46V4xNb4xFJG6Pcp+eekGmZEDq06+t+dgh4lhdvY9Czzw==
Received: from BYAPR07CA0027.namprd07.prod.outlook.com (2603:10b6:a02:bc::40)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:57:13 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::1e) by BYAPR07CA0027.outlook.office365.com
 (2603:10b6:a02:bc::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 02:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 02:57:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 19:56:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 19:56:48 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 19:56:47 -0700
Date: Tue, 9 Sep 2025 19:56:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <jean-philippe@linaro.org>, <miko.lenczewski@arm.com>,
	<balbirs@nvidia.com>, <peterz@infradead.org>, <smostafa@google.com>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH rfcv2 1/8] iommu/arm-smmu-v3: Clear cmds->num after
 arm_smmu_cmdq_batch_submit
Message-ID: <aMDo7vljVeeWWzRE@Asurada-Nvidia>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <2f7f5fff38d43221fd60139323d23b258e34cf8d.1757373449.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2f7f5fff38d43221fd60139323d23b258e34cf8d.1757373449.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 03596709-dc1b-4403-845a-08ddf015bdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FXNh4nZkqFdWbTGo919Uwn1pmg7vjZcYYh4Zpcx2O6lTrMfdoV4qAtBKoJUQ?=
 =?us-ascii?Q?QPZKu8ieLhxRKg5Sq8BfKe4uFXXvhv7DczTaAQoiFPtC1C04tZQX2+j414tZ?=
 =?us-ascii?Q?qXp+9yltz1owESbfpk1fF5k0100dZ29AGJReGdhfuOhsh7/zgpyKL7rxx6ud?=
 =?us-ascii?Q?RH/aI9DOHeJWvYq4wuV/I64iMC8rcDhBqcOfIrhRVEYw+dS4hHvuZeu2Me+2?=
 =?us-ascii?Q?DKKiEjUAR4YIZXT7d7VSn0gjGDZLcVVJ6hHm8PSQB9YMSOb7KUVm3aIYokNR?=
 =?us-ascii?Q?TxsbijlX7Sip5ChMdhXxojy0ljAjXGKywwZaB/1XcIHgin9ft8lJ6xQdB1Mo?=
 =?us-ascii?Q?T92HynpvharhbRPJVivPU9EnwGWjEVeAxuTyPGivd2HLwmmo3VtcFg1aQAQd?=
 =?us-ascii?Q?zvKSrK669tTJBDNv+c4tqKCysxRCDjeMYnDhbGEA43cSGqdc/GvhVLxyC2Af?=
 =?us-ascii?Q?E9EdpdqhQeZRpFWqrGF6oiwxsUSF4QD+W0i/INgNKP4oxeQHijD928tk90t6?=
 =?us-ascii?Q?Fqb0rJt+xE35CRPCZZYz0ymVuXvzB9hZdaglppAujbT/FkNOwlDQEDQKwuDR?=
 =?us-ascii?Q?d8DJJK8S+CqugTAnNVgm4bgRPTVngz1/EfXiOLI5NRXarxdVBdRfwbZKDpQm?=
 =?us-ascii?Q?iLkYQElHO3qNI5bYTjPAEsPfl8NbjNf9LDIGGv3Ku93igmgGP48YD4i+ZFd/?=
 =?us-ascii?Q?WRdrEMthyPVksuML987voLrB0QuJOD5jUESWdnxuXggg4pPnyvQw/tHp4svt?=
 =?us-ascii?Q?rWXZoxu44wuS0Y/7lU7P5ngqAGzsJbSrlWeGfJfQnmw6Pemqoun3jbwmPpZ8?=
 =?us-ascii?Q?71zc/FiWGV3QNbVk3FbAUVR/OdYs35ilz3eQ98JZ+N4p+4+VpZt7BZQSxdMP?=
 =?us-ascii?Q?MfIoCd5/MPB3boUXd/YNfwR0UZqfs2fhflBSfIjeg0rAea1DqpHpN/Tsi7nZ?=
 =?us-ascii?Q?vz52RVJjzXaoedQZQoux+ziueDvvLIlOzwcoJyDlusmqn6bkGvGeae51MLcU?=
 =?us-ascii?Q?DSMWadVGg4ol+lB2wbnQ79Qx3FYKSFtAx1EhdBI5gxSDex/BSFHGrfU162+u?=
 =?us-ascii?Q?AH2mOrC59FDxe0ELEB1QlbIf0Vk1UmNOo7cKd5VhTIfkY2bRTZDE28LS2VZf?=
 =?us-ascii?Q?tHDhsqugm86l9MBXp6s4nXXdRGeT2qzURwXhO6jgBj1mwoZj4p0xV3vayRiw?=
 =?us-ascii?Q?z5vzS5himXUPoIQ77dvDqoiUeQMKUVl4PVRDokcBt1sLK8X498ENDYANs3pO?=
 =?us-ascii?Q?fyXhQ1F8Pq1ouQPSW0/QlPNcfk5lSSknzEuae1xB6BSJejtXcFXhnEThWses?=
 =?us-ascii?Q?C7jOyDHXd3mg8ZuwOsmozPGWiwrtdUsNI0Eizgrn10y7VTNAkLu8UDgjb/Kc?=
 =?us-ascii?Q?nUGC4Icap0g8NuMztPwwyr3nZ/66aVp4e5HeW6MOZ3MFAXnpZY4ak3b4wT3q?=
 =?us-ascii?Q?vWXvRM8f0Wmg1ymL+QJcu11/DBXDkndrE/Snkr9VDlwRmYU8vYrUYe9+l2Td?=
 =?us-ascii?Q?0JiDBrPk7EojBiYdi/q5+ZYxNWPQr3R0dv/E?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:57:12.3449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03596709-dc1b-4403-845a-08ddf015bdd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195718_160380_6EC06D11 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, Sep 08, 2025 at 04:26:55PM -0700, Nicolin Chen wrote:
> None of the callers of arm_smmu_cmdq_batch_submit() cares about the batch
> after a submission. So, it'll be certainly safe to nuke the cmds->num, at
> least upon a successful one. This will ease a bit a wrapper function, for
> the new arm_smmu_invs structure.

This was added when arm_smmu_cmdq_batch_submit() was needed by a
new arm_smmu_invs helper that used it at a few places. But after
a few rounds of rework, I found that there is only one call now.

I will drop this patch.

Thanks
Nicolin

