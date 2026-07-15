Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87362C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ievLJX0egM0rwUjdUqPD4IZqXimWIm50aK++y/2rIiE=; b=Nbpz+v6yB2Mhs+pmFtgAzEHfbY
	M6wzzdBgfaDG1mVe16bvAtlbdzUAufJWlEXIzmNC1JzHJp7GIlW7y1y28UkUOO2HHr2zYKsyQPjjW
	8UpVIo8f+8cnmKBhbB6p/sPBo1OZ+FNbJ7wjg/H69MWmjrVCh/L62+g/BpAUbOWtgsQD4p0bXxGn8
	pkYs95hbUGgqiQt3S70RU82c5ggm4pIC7NkjaMF4SxKcQM4gLTDfc3WH8IS6cA5PYtKZSiBaBSq7g
	5lNzBh7/pbsNoq4NK3ME1tkb1N+sTBKeEjdLYsRwn72ytF7VcNVazCNbZsauqnWJJkS4JNWo0qVdS
	ubdEuF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3fo-0000000FaOH-1gAL;
	Wed, 15 Jul 2026 17:45:32 +0000
Received: from mail-eastus2azon11011032.outbound.protection.outlook.com ([52.101.57.32] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3fa-0000000FaM2-1R2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 17:45:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsWgKbQ7Aj7aFUg8Jp3vTKPEbGTJ0i4Oj3OaQ8huzK14JtDCA9+jRR1UcOeSG9flW/jRWG4YplpG+eeDMzuxCNOQ3f8wrujnDStkZwZTx+p5sjieSVtzK5Apdr7IKyPVMCxE71QOmXWcIRLPuSi/IooPW0jHljIfJQQNrLap7gvBFhJHiA9xU+MQVJtAvrQ++kDQqwGdo2Kudvr8h1irKhtdiWNTUYobxzRqWLIv+VsQi/DMLKu4b3vBBn8wCKnNdydyQao/aMiKN4xaQ3NR7FW2zU2JubkcMmDktk/RB39EMbKVAEznaj0vXSMIZEZgsf9sDgkPXjSg5c3vXM82YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ievLJX0egM0rwUjdUqPD4IZqXimWIm50aK++y/2rIiE=;
 b=JOcPcjYnzqiEeljrUUEaPb/UPBTUoZn/heaUHATfjYyfDxF/J0604d85raDM2tgBhZGd1lzFTTbyRWenZYnWYRqS4as/BtFVFv+fy3ooYSNvYoJU2AS0yiNIZPtgA0QM4J7+qbIgHPB3d1HyxlBVAXnZKBxAKT2U7hrgnq6MGO8vkNUNsH9Bf44U3mGC15Q6XXDSKXD8M9/ef06phdY/YrSrlDS4ninLEWhUdqjbM6FX6WAH6a4dP+za4skWF4h7FmQhsI66sbHgEJiT1SiOxCRki9VWmfvm59zO1o6sdHLMIwftQ1zlY/NJtY8uZUK7s7GYyZ2NO/Vb6TLgS085dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ievLJX0egM0rwUjdUqPD4IZqXimWIm50aK++y/2rIiE=;
 b=S4kUnlAxcLLWHv43tcRLBinEGDn0ZESxdT1sPdWn14o+DzT0aw6tZrCQL5mkAJjFJI//uRALLOwO7FZ1US4cUQ0s8cGydg8CFaKm8VleVRC801HWYouUavfRYxENdlJ4MHcVE4ALeSdJCVBwn1a0Fhd6ypD9pYDJOV3uZ/uItibg4qIj4E6XzWFSUcZukYhhItJDD8OhireSVbT7ce9oWQIqwgmhyDPh2lI0zNygs5U3ZsXfvEyq2+UxJJv2CRNgNDsFTBiToDGiRlEKrzHDq6ptaVvb9UB2XvXaaDbE4qhrHGOryDf9DOP3pQnI7eW69Va5VNMKr+8o6tJH6pGy/g==
Received: from CH2PR04CA0007.namprd04.prod.outlook.com (2603:10b6:610:52::17)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 17:45:11 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::5) by CH2PR04CA0007.outlook.office365.com
 (2603:10b6:610:52::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 17:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 17:45:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 10:44:53 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 10:44:52 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Jul 2026 10:44:50 -0700
Date: Wed, 15 Jul 2026 10:44:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] iommu/tegra241-cmdqv: Fix error-interrupt races
 and VINTF lifecycle bugs
Message-ID: <alfHEC8YPQPPzb1W@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 623c711b-4e2e-40ac-7ff8-08dee298d1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q0aJ5jf0pB1DDYd9iXue07RzUBXdVC/txOVQcgvwAt2rZI44lysK2RaB2xfnctZDd1TmLR0HPNBf2P6OE4Sm19u6l14pkW9w24fJtRLbGblAZ3C+ZeKj2iu2DMwt5NkM29WjP3r/uC5PWRvnqYDBA8uWeK+mHBDAbI3/EPcC689rXMisjTd1y44UjlUYYySDC0F6WBBc4Hz4x7bRBQOtXS/Hwtnr/RloMimisMeBSvzE9F1ZONKfQY6d3YlPBbkmzpNoPlsyKjYTeJoxjyp7nATUYUNJbIbl4yGGEU122NiGdDHClnwnFxkHbedvoHELrfMMJumDt79ZkglwvR5Qj7RkRPW9e1S/5umSwaMdnrbUyQeq2W/EB3TXkLV6NCEeFmBrRIHfDN6A55V+YnP/vrQVNB2M5KGZ3tWlPfNuPMw3PUfZN8W1jbBUd80YLph5K/j1ibTWqICCFLD9nofOXoYTgwjx0KsyTfAwR/g5KJURmNbBXmIwogKpvZ+bMBK3QXIRJVVoZoHyPZ55YNucEfqy93XsWmMMVv+v5pqIrR8OkQ0Kap3qh08/e4SiiJgg/k9rPIHuFyqfT7dHN+YvgrgqCQ/i9DQE8COce7c0Zo8FIgsyaLNuLw2ZDkv90HyVnH/FoPtl7rmW/S1lGnBgpHdl3SguMWAq5RZ+JBtDfPelylv5zZj0ivSjHnN0LWhT/tAQHnJgAOHpzRYd/+KfPA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jNIXZguha9Budy+DBFwpg21o0swm3BNETVzFJ8ceDq9bcRy5vscmBcVR266jjfvwpQIj/CiCug2fMX2L5V/mhXEWVmMwanD4znlXjJcEx4ez84vFxtW0G8/sb5yIXGnA2TNxuwkiwXXxP8OP001HX4qKCxEOuSY13231ceUPaIvrHXleKdtg5f6giY5XoJD2z5ioyTKYaYXkDsY6VqtmpIx2Qk1PifMIzp5peWDc0Ue1RiTpNB3OakU1UaJITvxF0W1+WbIfZB8Rq6N1ELURrCOOpjFoIly71sOxCUDO/PHMOUh9146M6i310josVSHbx1YpoLR9/gzSlkEfXnDmUvX/PByQeP9tzMY1VbDgl91OWYWUNdJGqF8/E3NMxx72UisGwCdhNPAKfkYAKYHFLYI7RFv8QN8sB0ihX8f7fRcVhbAD+2I3TOZGOVcDhZQu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:45:11.4772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623c711b-4e2e-40ac-7ff8-08dee298d1d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_104518_407617_22F7C165 
X-CRM114-Status: GOOD (  11.45  )
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

On Tue, Jul 14, 2026 at 01:54:57PM -0700, Nicolin Chen wrote:
> False positives raised by Sashiko:
>   - a viommu outliving an SMMU unbind and touching freed memory on close: a
>     physical IOMMU is not a pluggable device, so iommufd holds no reference
>     on the one behind a viommu, and this teardown cannot arise.
>   - the ISR running after cmdqv is freed on probe failure: free_irq() runs
>     first from tegra241_cmdqv_remove(), the devm device_remove action,
>     which devres invokes before the cmdqv allocation is released.
>   - a guest never acking its VCMDQ error wedging the shared interrupt: the
>     interrupt is edge-signaled per event, and the host ISR only snapshots
>     the error map into the guest's bounded vEVENTQ, never depending on a
>     guest-side GERRORN ack.
>   - the ISR accessing a de-assigned LVCMDQ page after a VINTF hw_init()
>     failure: the page remains a mapped MMIO region backed by empty
>     registers, so reads are benign and writes are dropped.

Adding one more false positive:

Sashiko reported against this v2 a critical issue stating that
CMDQV is level-triggered and could cause trouble in kdump case.

But CMDQV is edge-triggered; one of the ISR patches noted very
clearly.

Nicolin

