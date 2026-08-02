Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A10BC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCHf+BICxa7EuaPVaTzlpXTab1HmVNR8CLRR09b05kw=; b=4BoXIaCBtsdxi8xPtJ8UUKn7vL
	VfGjEQP0IlB8TySXUbMi9AevP5oFs/ZeTdkAVFMht7x8BvGO1ahE/U3XUSk+lsOczAjU4QEnGHrDn
	ytABN7zOBam3XuS4Rn9VCGqymMwLWZ4OOY8lqgrpJLMxEhhR1a8ms06IUePuNMkYqd87DRTOzXWbr
	3a8b803lDbYRPTzPNybY6IClRQ5KocdosZv7DNagZjKDDbcDU5ufQnEZ0aRj0p0266RHrRgCHmNXm
	9sGFp8pziEyEG7Uyx59kSMdAMGx1AvQPe55oUzqHjkDjlMItrsw8BbO192iuRoUgScK1XHOic/OtZ
	f38J1qyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3x-0000000FbjP-341E;
	Sun, 02 Aug 2026 12:13:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3w-0000000FbiP-3Zqx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A3743B76;
	Sun,  2 Aug 2026 12:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62081F000E9;
	Sun,  2 Aug 2026 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672784;
	bh=QCHf+BICxa7EuaPVaTzlpXTab1HmVNR8CLRR09b05kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WzpNSuYJ7wuarLciqjaZ1phi1fcfjZRNR4oTj/S6dyijpC0cIFrWkUalaju4zpd+x
	 kvfsJqh/7RXuZD045pQFw/GRm6pem2gYv29KshCfSGUxFfMrMp2bBXka8mIXrHg/ib
	 X56oynNj8cVgrJKBPohV/kTZcC1NTgLpe/mbTkqlTCFPfaEYLrXltUz3y5xQZ/J1+7
	 rkf+GyY9kRvPpVaMFw4utzH4kdf96CP/bQCDUH5J8Mt4h/T1osMWqhtKV6G2cix7h0
	 ETwSgXcHMSXFZ2da1BOzDmgNxYLVuZGxV/tIASmZZlkTjXlCJti3ZSxycuvPrC3e6K
	 jXfRJLPtQgWUA==
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v5 0/6] iommufd: Iterate the cache invalidation array in the core
Date: Sun,  2 Aug 2026 13:12:27 +0100
Message-ID: <178566589744.1710802.15577357267722332966.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785258826.git.nicolinc@nvidia.com>
References: <cover.1785258826.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Jul 2026 10:33:32 -0700, Nicolin Chen wrote:
> The vIOMMU cache_invalidate() and the nested-HWPT cache_invalidate_user()
> ops are each handed the full user invalidation array and must report, via
> array->entry_num, how many of its entries they handled. That makes every
> driver open-code the same array walk, with real downsides:
> 
>  - each driver carries its own loop and sub-array bookkeeping;
>  - the ARM SMMUv3 driver allocates a buffer sized to the whole array just
>    to iterate over it;
>  - hand-rolling the loop left the ARM SMMUv3 driver with two long-standing
>    bugs:
>     1) on a conversion failure it counts commands that it converted but
>        never issued, so user space skips invalidations that never reached
>        the cmdq;
>     2) it rejects a zero-length array, which the uAPI documents as a valid
>        request that only probes the data type.
> 
> [...]

Applied first patch to iommu (arm/smmu/updates), thanks!

[1/6] iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
      https://git.kernel.org/iommu/c/773f2b9e3670

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

