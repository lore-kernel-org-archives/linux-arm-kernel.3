Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD9C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqJlVMIG11w1TTAMInMlbBRNV0I2IOrLcpz1JgFEFow=; b=fnGtrO5rFb47KbQJcpFhpkBwbx
	0Zw30KeQy/XDdofjZQGrYrHW5v7r0rmBVLmffr+gkcDPdh4MVJSNukzb6DVb5dJBMy+tK/8QsFuRT
	rPuIjlKOStXO1a6F1v2CaFRw/s2mKO3B3VG7K3F7Im1WODgi+RPc6+9skpPt0O0U1m5ANjpHpc9xB
	cS3ZXnoXIu0Uq9wzsJJb0fYdCNCfd9rKeFmrhf/yQ11QjShN8vV1wTWG6GbtGJ7lzo3vhV3Idt+EU
	ygVY2A3raMgQfiZB10CYwVs06HXm2LfRUh7CUUWYS9QF8FX+gZguwfkh06QZpN3mkEDYER/scrgE5
	GkQlK05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3FL-00000001S1g-3fKR;
	Sun, 26 Jul 2026 18:06:43 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3FJ-00000001S1K-2CjY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEFldP5htQ0a++63mqmKVTdLz3aT0P1Plchb060TLWi2KiQZ8+zqSjD9Ebqk5fegPB/Mshg+zlFzDR+Z21DV2N15HPAEaVUBk5hlo72T0FxB+P0zVWpmEmayp/V6CsvTsWFiG7w94U/GQ90a2QtK0YGaZLjUyKoxhzfi7iA+rNHBTGZggzCW9N/JvF2xL7s3IulVtze9rpbgYfGXbawf6ChEbzbzGBGig2oWhoBbObX5r7lgoab5lgu450Rk1IUOkjGfqPoV80TuYrbF3W5hBtiaADOVdclhEvqPhryN72lK+xu0ydEEpbhytV5o88dcrnGgdAD/55MrUmBuSGGO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqJlVMIG11w1TTAMInMlbBRNV0I2IOrLcpz1JgFEFow=;
 b=dL9F8xt2y5HgAkN+ejtJRHs1Xr+5B0vowIEKlB9zy8Mj5FZbqhrArYxxJOmX0oLwIdeokQbttROU7xayHxeNu0oTuPWu7ap/EjSEteR/6MjEUkiP+GzVcI9vZepJxNpUZzO5SN3ZvPWRUJhC+eFYKrfUihUHZzKP44RqvxMLUc782qzOhhc6WWb9cL8woSFIdVyIHjz95uu3o59RL1FCeMrw26Gxj4LvsoSp/93tUPlYMa2269ni5GaZ4f5uCsZoa79a6cntxqNoRISQDE3XbhgFw6Fg3aoymIG2M7ZfSeRxXZ/Z4ePlEjRwrm9pjxnYLN12PBsPtX/jduUMo5KdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqJlVMIG11w1TTAMInMlbBRNV0I2IOrLcpz1JgFEFow=;
 b=NglINwE0acPgL6gohlfIXPJuyEGvR1f6vspR2kE6/+AIU0yIwXquNSiwXKrOfg12cXOrlLhvDP6Q6wWaLjZ9pMVpugXEPIaMvXNBtweSqroeqTBY3AOqLLvQWgiIpJEObufqzZ3RTGXKt22BcQS0oDxhmBr0QL7lco3YW5wIEs8Q4IVLPGfUao2QjXrjE7dcQGEMab6azIPN/5aVeRm0RUlFWpa1IJJ9cG6smvr2Qt5HF3S/E0MRyILPNq8qoFu0TIPW2eCAPnYvwCxRJTpOMnzXz7sFcNW495PneHJ7oLdsDnQRs0IZs4HNadPxpeg2HbrHsgACG4N4zaNXfSvfUA==
Received: from SJ0PR13CA0181.namprd13.prod.outlook.com (2603:10b6:a03:2c3::6)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 18:06:32 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::6b) by SJ0PR13CA0181.outlook.office365.com
 (2603:10b6:a03:2c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.9 via Frontend Transport; Sun, 26
 Jul 2026 18:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Sun, 26 Jul 2026 18:06:31 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Jul
 2026 11:06:17 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Jul
 2026 11:06:17 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Jul 2026 11:06:16 -0700
Date: Sun, 26 Jul 2026 11:06:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/11] iommu/tegra241-cmdqv: Warn on a VCMDQ base
 above the 48-bit hardware limit
Message-ID: <amZMlusLNS7WwtED@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
 <4e638ec1bbff46a358b4129e264fef66b4f37703.1784059577.git.nicolinc@nvidia.com>
 <amYEQt7Y5MC48kRD@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <amYEQt7Y5MC48kRD@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: a838221d-ed1a-4926-2cf0-08deeb409f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EBtlf8KvuXGTjrvm2tUB4eVanMeBTMgx3bKjypEraAmc5D/i5h+jOk0zrqwsy5H/0CfPqgJ8VO/nRy92PvZj7jXM0iBJ85KE5tYkIwzopsxojInNEeKuK+O8exMy7VxQF3VboNCz9mZBpbxKn4jK46HX0lv17sTfIKVhHzBSdKQCf0lzJD5R52U66e8EOZ+fcM1C0H1SZsvTscoigu6BgGq8i9cdVCJdGBcLwORzewEzfaBXjh7U4LD06/zMmzmIomlcIYcjLNDGxeE4GlgzYnqUOLJGYlCVc1v0POfKrsH7y5Fn3H3r0zpbLORCovMvE1kIBQczYYSCa4f2GbqPMHDn4K54DTnNBOfzeN4SvcqADVyPFbgzqXxmkIEoXyI/Sfn4aTzxuqjjBXiGXzc0jIsj9mJaqXZ5wzd7wzipOAZpDwTWs7xYvbJGpJR7BqDNG5N2GG5g7eQTm1yuPGUImssbuaZIIohPpDjLkZejlz19F4bu/cR4jnqpQmCqvukxfY5V7oU9CuQpdb4p8tPc3IWfgK/HhOGzvpUuN0U+9PxAV+WWTjtuWsNaYumwJ6oJf7lXQC7zunwN12XNWw2PH6yDqKhNc6KhS1WGC9LZ0Nz8FQP1FC6MZtSdLTwnKvZ60LQCnP1Z7qygtkNUde8AJ5BuKrsQU9HQMCT6vxMN7ibgWpDa7hf/hNMEALTOTHUMFiy19tNFqfAJRt1r5Unacw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vtg7CydaUyzhwBUGE2gjB6HMsLC3is/JM8p7Y5fTIpMJBt0W16T63WQ71k7FuULtirqAC27Pk2B+SR8muzknLO3i8Cu7ICEcUR4IHRFi6hLO505cfw4Q2o3lu2KjfauULG8gAenKIqJJdLJzjmUvnZZrlaIj6VAFM0cjtyeuViTVBFGQatCPQNdtVNOZFyZ3KdD70balrTEW2r7rjcZLNWne4RH2iHO+kNi68A2FzO52tSBpB4gadfLlowRAwuN7rVuljywAqDVp/noB+4bPy1PhEuDVXsHGpcKnPHClHF+282nwioe4D4L8S/uWr1T/kAZgVmAwMBbZhwQuKKDRKFpOhZiALeD9PQA9SY2NjpsjlmNGFR8B8LF9xJAgG4mo+idAd0ToeYQnATsB4SCL9QVC2fvdC2i3na/ukSB871PXUJhV0db96ipUOKcPtPgw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 18:06:31.4170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a838221d-ed1a-4926-2cf0-08deeb409f3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_110641_574574_C09E7473 
X-CRM114-Status: GOOD (  22.33  )
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

On Sun, Jul 26, 2026 at 01:57:38PM +0100, Will Deacon wrote:
> On Tue, Jul 14, 2026 at 01:55:07PM -0700, Nicolin Chen wrote:
> > tegra241_vcmdq_alloc_smmu_cmdq() allocates the VCMDQ buffer via the common
> > arm_smmu_init_one_queue(), which uses smmu->dev and its coherent DMA mask
> > of DMA_BIT_MASK(smmu->oas). The architectural Q_BASE_ADDR_MASK is 52 bits,
> > but the Tegra241 VCMDQ_BASE holds only 48 (VCMDQ_ADDR), so the masked write
> > "q_base = base_dma & VCMDQ_ADDR" silently drops bits 48 and up.
> > 
> > A real Tegra241 never reports a 52-bit OAS alongside the 48-bit VCMDQ, so
> > this cannot happen on correct hardware, but a buggy or hostile hypervisor
> > could still advertise such an OAS to a guest. The user-VCMDQ path already
> > rejects a base_addr_pa with bits set outside VCMDQ_ADDR; add the same guard
> > to the kernel-allocated path, failing the queue init rather than silently
> > truncating the base. Use dev_warn_once() rather than WARN_ON(): the OAS is
> > hypervisor-controlled, and a WARN_ON() would let it panic a guest that is
> > booted with panic_on_warn.
> 
> So here you talk about "a buggy or hostile hypervisor". Is that really
> part of the threat model?

Yea, existing real chips have a matched 48-bit address field with
OAS=5 (48-bit). The only possible scenario is a buggy VMM exposing
a mismatched OAS value to the VM. Perhaps we could drop "hostile".

> Presumably such a thing could cause havoc in
> a million other ways?

Maybe, it's a defensive play here.

A buggy VMM can absorb the mismatch for the SMMU CMDQ, by reading
the high-order bits of the Q_BASE_ADDR field, since the guest SMMU
driver wouldn't truncate those bits. But, in VCMDQ case, it would
get truncated silently, which can lead to VCMDQ errors (IRQs).

> > @@ -674,6 +674,19 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * The q->base_dma is bounded by DMA_BIT_MASK of SMMU's IDR5.OAS. On a
> > +	 * real hardware, VCMDQ_ADDR mask and IDR5.OAS are always aligned. But
> > +	 * a buggy VM might set a mismatched IDR5.OAS for SMMU. Spit a warning
> > +	 * instead of a silent truncation.
> > +	 */
> 
> But then here you talk about "a buggy VM might set a mismatched IDR5.OAS".
> How can a VM write to that?

Oh, this is a typo; it should be "VMM".

Thanks
Nicolin

