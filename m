Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B2CC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C87ceICwqHWFazhK3YCduUkTtmc6pkDDD2ghB3jqD3c=; b=qgZBqoNSxp+JIW2cEW+xhpI6IY
	7mLVXFiQx2ZzBfajCDC49fARZsMOGCytpDFa0LxqpNyCrvoto598lNMyGR25GbwnxztOQxfw6lu5h
	1+WJZyEsvqUykG4/gtTlkrkRixgorZP8LxmkNbSAD4+N1SPT+iStp6yqhEJ9RVT0ELRbZYwMGXgdD
	h/pGXmTHvdAoF48ICO/NNQjrPt/iHIKOI+JZM7INDUseVisa+upn0yYL0oI1XWh+mBf8ZiZDDoprU
	DOsAI/u12SyPT+k+z8cVNDj9l4IJwMIhCwRt1j9Pfow/rvMblzu0a/HPPndCF1C9jiGzHi90sj0N9
	tCGu57ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2h2T-00000003dR4-3EnR;
	Sat, 05 Sep 2026 03:25:57 +0000
Received: from mail-westus2azon11012000.outbound.protection.outlook.com ([52.101.48.0] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2h2R-00000003dQW-0DQJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 03:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAcCFaiVizlCmfvK/mknCZD5WV2kZbGg9Bgq7/rreuwzOeZAWVPMnV8DEkOnCV6z8FjQ6O1j5cbNXmh+mAUySyNQRLhzJGxXnQ6lqHEsjAIooqZ03A1nS1zZFbiw1k55R1zF6Ut6tAJf8MaLl8wyra8YkvDY8JjjgasN/8BlHUi+4Dmza88qd+6OKIpdG75Kqu/UY1kY4EVIlG9+Kk2gLGxA2Wo7Gsnklgy8aLxCQlIHaf+2ZB81A6v6vViPBrQkFellTqetnLSXqQ32rwFF98eFrtI4hXn6Xl/k7qD5NyrLYTW3uAzi5nXtsYTq4JRZboXa1tdRoeW9i7+WiEWU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C87ceICwqHWFazhK3YCduUkTtmc6pkDDD2ghB3jqD3c=;
 b=xc1XwbMf3mjLMX9zva8wS4y/w1jMZb+zTDBeeAypNjaKqiT82/95/Vv8ssN829giKaW7hiXNuJwBzBPzC+a3iSFlgCWZ2yK8GxA4M52mwsh8U4IxEgzm5kVbNGSCc/EKBpJn/05uh6X3kwSh8gFUADdydJ45XvKcJcDQsszrRr3OKLkFUiCVK6RwUj0QMOL5JYk5NTCBlnxBVK6eKMEotfmXUj8rbj51qmWxS+zKsw0c4s+smhVHRN0nsGVd8S0L0xjkNFLCWkT9v0aOJ7Cro9qPpZ9/Fxn5cXgDtW2aA2OvG2ufWunquZvFebku0QV6x1S5jZktzFDgJhIuDjN3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C87ceICwqHWFazhK3YCduUkTtmc6pkDDD2ghB3jqD3c=;
 b=JuuEgRDni6/KR+Gx39gY17p5VQonc1eHsqKYIhGPY5/jtiO9aRFFqzDQhTVcTYilWzE4ayjGjz8YTPwfdCrLbJnXdIwReJqx4jg4LAUx+kK3AILcuWLKMUqzayytDGxXaVler3/8Op3FkKhyA/FeohO0ES6X4m8dIkN64hMVEK6I9t99ipa5jpABl57BhjDalvM5Jw3o8IX+DtUoLf9BnjBDCnOmEKPUCIznTHWeOwp8zJ4PAjDLt7VTCPYCWRtr4Fyc9KtY1Y7j1H2lOBveM3YgGbzAbOcX2//cZM/l5rXuQnNI5fQhRUmXtKT1CEoFyJjMnqIhEfu/HdVQpBxR3w==
Received: from BN9PR03CA0780.namprd03.prod.outlook.com (2603:10b6:408:13a::35)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 5 Sep
 2026 03:25:41 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::3f) by BN9PR03CA0780.outlook.office365.com
 (2603:10b6:408:13a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 03:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 03:25:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 20:25:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 20:25:24 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Fri, 4 Sep 2026 20:25:04 -0700
Date: Fri, 4 Sep 2026 20:24:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/13] iommu/arm-smmu-v3: Disable the queue IRQs
 before disabling the SMMU
Message-ID: <apuLhri9BpqncLRT@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <a6fba7f7a01f5955dfb44d34adc6262c8534e829.1788222486.git.nicolinc@nvidia.com>
 <178846311318.1308030.6301643510859406126.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178846311318.1308030.6301643510859406126.b4-review@b4>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a19117-4dd0-4314-a0d6-08df0afd5bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: oBYXOpw/FDSeraw2Xxj1AAacfOsP5mQ9FAlg++EJi3U5RaQorsMiPVZaZU6wOHBgg9DDy0A6DzpkswxSr8iwV11ZbogN77W6r2NN3q61aBEhepIxmJ46barlPBPuEI/pefoL97jUnPLtpXP+Gsp4c7YhxiOr8LIdbYuoV608uFb37J8UYtk8e6B8lxmTdiiuvTmw/BOLbJZKWNeXcEf1Y6jUTUytZNBZ1xASMh9CVG9ooS1xz3ZqHizmVwGqNmnjpP2INXj/A/FPjmITrOTxMoU8Y3WCkXggP0moeIovPIq0zkUrBs7EYTwhIjQpQih3b/aFW+nnihw5iLWeoqWbxYFq8zcZUGDF/VmkyOwcuEqzH/k0HILaeqD51yb6SEA2IVAqr+TvKm6OghCgV5EcbI8wL+najHwLOdpaBiyf1dsU+MKEMlpj+KAY9aAR7OWrv58cTZoUz4EpMyryrkSBbWb8IvAWWx+D7gKLt5zCouH0QiO5Yh/2Z5D/imIEDHN3+j9nMZ82uPeSeLmhIn1vjdI5NekMlH7b4xlujVrSxdGK7K+jryTd0MjUedbBSy9CC+tiIKW3kVmGyXQHqezB1fXI9DJA+vJyBGuiyVO/G53874TJ+ypBPyECT8hZGGicXfD9qYBdqRXX4XGQAl0aJ3Ce9m80LGEgWlqVb4iIp3jsJXHJJbNY51jPxcmfAM+laQSmi01ytKvtTyDqWtra3g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZdgvWQOQW7PyQD9IgXbDcjFR3oOZBbpje6jVmKo1wXLiAvFkh7LuRASbZgcKmgZPT9SQq+/fnCGN7LsJkF9YTtYhFnj3ujJ5HLff38MY3izJ0wiq0skjWARzv3ERvTMyRLjqa0Y+fze21IeQiIlcy3fpTA7FOcfGLjGfZpQC/U/ppEq37505dMeStmnZu0kwb8YKbTzCzeu6uZJxIB9pOq9H3UsBx4phF7I6bNZTpooP+uGx9WpVwe0gJDrFQQaBnrvBeZC6AszoER8qP/j8AySdpEHvZV9wnekTlFUWeg+wD4LygnqjaCtYdyOPIBKGwSvQjma9i4Hc5ix1pPstYbtuaq/Lgaveu4KLMDNpYZ8f3x6iHAC3w7PtyKm0eaNkj14T85AJUYLVeImQne2OTYKd5dS/NS+FklyN0B1HIbIPGe7L5A7I+IQlhSmYkmKp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 03:25:39.1774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a19117-4dd0-4314-a0d6-08df0afd5bd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_202555_121474_B20488BB 
X-CRM114-Status: GOOD (  16.23  )
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

On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > The EVTQ, PRIQ and combined IRQ handlers are threaded and issue commands of
> > their own, e.g. a CMDQ_OP_PRI_RESP for a page request. Disabling the SMMU
> > while one is in flight hands that command to a queue consuming nothing, so
> > its poll waits out a full timeout.
> > 
> > Two paths disable the SMMU while those IRQs are still requested: a failing
> > arm_smmu_device_reset() returns to a probe that disables the device itself,
> > and arm_smmu_disable_action() covers an unbind or any later probe failure.
> > Both can run after arm_smmu_setup_irqs() requested the IRQs.
> > 
> > Disable those IRQs first in both paths, so that no handler is left running
> > once the SMMU goes down.
> 
> Why this soluton rather than a flag to stop them queuing new work + a
> synchronize_irq() to deal with threads in flight.
> 
> irq disables always worry me a little as they tend to be patching over
> something nastier.  I think this works though so I'm not going to
> strongly object.

Well, I don't see a reason to add extra flags: each irq here only
has one single source, so disable_irq() is fundamentally similar
to a flag + synchronize_irq(), but also masks the irq line, which
makes sense in the probe-revert and shutdown paths. Above all, it
is cleaner.

If there is a solid reason for not using disable_irq() here, I'd
not mind changing that though.

Thanks
Nicolin

