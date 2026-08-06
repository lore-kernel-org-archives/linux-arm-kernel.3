Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2CBC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaxlKJGTsZngzdaWcyP0O7FUrV3KkW/yE5t2F7iml8s=; b=O+QiFpAwPRcaVouDFMbfzFUXAj
	oTn8ZoalkIe4qv0rxQzocS91aH3iPI9rcI95w1IF8p7txM5WC5Rl1wnV7D4KzG0V9RkFyaOkKKeEL
	vt005XgDoEVRFVSuOsocHedTy7EY1WzZPBJlH9Hg7c0YsL0vTuBSvMBgj8Oj4+FhoUgD3yIqiuihF
	2oOhrPFFTdrPGHecit8WAW7kxEuJlRXTd58XwOWQeot077vVI999hbc8A2KTr5BknPZi1msw/KP7A
	U5ncVkOodUnnxxXuAZfltBbrEnPBhChlk8MFfIsbhYMWT76U8JhKIwYz8oKg2ZspTfgf3x5XGSwGm
	6/Qfca/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxVV-00000005oz4-0ljV;
	Thu, 06 Aug 2026 12:47:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxVU-00000005oya-0EN3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:47:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 509A660A70;
	Thu,  6 Aug 2026 12:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E021F000E9;
	Thu,  6 Aug 2026 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020451;
	bh=gaxlKJGTsZngzdaWcyP0O7FUrV3KkW/yE5t2F7iml8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgkoqYVo2ffsadHBiZ95EO4eOAW64JMlxzI9/C1I8pgBeuGIOuq6b5+hO3ZtpiK3V
	 Rg9VWVNiu8I5TVq7dlTV/kUE8cwy/C6+b/ohOoQuEDYlc+oHg7Y/WBcSK+vsC+klfp
	 P7WlegvBHxB8v6mgFm5wDVO7O+qFp/ktqh6jblHhuaDkxlUHV2ITJfGuBYNcMLFbxx
	 aeG+Irh0fNIqZvIFDMs30W/FqrK+hz2iD4FMtvcgeiPGlc9hAaOHACjffhyTbyvay1
	 FZNGZOAiIecdnbOBSA5Dhw1t0oW7i07iyYJ8hzahAcNcYD5PLokpHErIfTafXS6C+I
	 aAZKhvGgAQ9MQ==
Date: Thu, 6 Aug 2026 13:47:25 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/tegra241-cmdqv: Reject a VCMDQ base above the
 48-bit hardware limit
Message-ID: <anSCXUjivdb_aOv_@willie-the-truck>
References: <20260729220329.805417-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729220329.805417-1-nicolinc@nvidia.com>
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

On Wed, Jul 29, 2026 at 03:03:29PM -0700, Nicolin Chen wrote:
> tegra241_vcmdq_alloc_smmu_cmdq() allocates the VCMDQ buffer via the common
> arm_smmu_init_one_queue(), which uses smmu->dev and its coherent DMA mask
> of DMA_BIT_MASK(smmu->oas). An SMMUv3 queue base holds a 52-bit address in
> Q_BASE_ADDR_MASK, but the VCMDQ_BASE register holds only 48 (VCMDQ_ADDR),
> so the masked write "q_base = base_dma & VCMDQ_ADDR" silently drops bits 48
> and up. The HW would then fetch its commands from a wrong memory location,
> which likely raises VCMDQ errors.
> 
> Real hardware always pairs an SMMU OAS with a matching VCMDQ address field,
> so this cannot happen; it takes a VMM that gives a guest a mismatched OAS.
> Nor can the guest rely on the VMM to catch it: an SMMU CMDQ base keeps bits
> 48 and up in Q_BASE_ADDR_MASK, so a trapped CMDQ_BASE write still carries
> them, while a VCMDQ base goes straight to the hardware and loses them.
> 
> Reject a base_dma with bits set outside VCMDQ_ADDR, the way the user-VCMDQ
> path already does for its base_addr_pa, failing the queue init rather than
> silently truncating the base. Use dev_warn_once() rather than WARN_ON(), as
> the OAS is VMM-controlled and a WARN_ON() would let it panic a guest booted
> with panic_on_warn.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

This still just sounds like something that a VMM shouldn't do?

Will

