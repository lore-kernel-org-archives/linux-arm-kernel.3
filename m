Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB2CCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuVSHKSsMcwtQfVcd+p5GkIpu47wINMtbXzXIQ+YSfU=; b=mAU9lmr3hggePcGS1aD7f++Yki
	lkQSpi0125g0oXMj6lfCjF/E1BtjSfTgl65HBU7RTNZ9UqvPm4sq3uOYeA38rqjkKvzKDxwtdR88a
	p6Rh5Kds/+VCfKpQZYP9fCmuT+U48eMpGFDyI7WBbwmRu+p+/sfudxhOHnNxSav/2TDDcvumuX2a2
	QPybbuSAOPn9nw26dSROO7y5BtPCTUovQsYQhN83sJOcq5nbNqPXsvMypFmNdrK3FttfZxMUXnqYb
	enPXT7HaKHd0hhyWbxfYHMm40gTYHUBc7fPHvrAMCfq5OhU3BYMP+WZlVXf4pQtxmYJFVMmGoYoqS
	EsEBNGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQN-0000000F2qE-3VqL;
	Sun, 04 Oct 2026 16:50:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQM-0000000F2pZ-0PEL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 16:50:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68C5D42B14;
	Sun,  4 Oct 2026 16:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87511F000FF;
	Sun,  4 Oct 2026 16:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132653;
	bh=nuVSHKSsMcwtQfVcd+p5GkIpu47wINMtbXzXIQ+YSfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qd7+JUc5YcezLGcxNrrUt2ZGcbHq5Nnl64L9F7w6P081ics21AFO5Pi1EF+bficqF
	 ILF5iCvM1+npNc3fNxjlt4vXiXjaSX1T5tWYDpS6ERnIb0GVU+ae/ed3g7fYvZ0ezT
	 uoQxUmwhw8Asd6cGVT6eS66lx+0qdJFmTvVitZx92uWcH4QpBjmJlBiEaQ7nZsPYIu
	 Pq+PQcM9ZkwFPWY0OvnJc1Pt/RNJ1upzv0GfWP5jQgKu0txcj8uB18EWzbF5+9AnjR
	 CnYRjDnTf1hL4w8RP7EWM8IRWeXqWeKyNEVEuNMU/Qz8teax2q02PQlmNySu347aV8
	 UDuMYzdaoy6uw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <peaan@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v8 0/9] Organize the SMMUv3 invalidation flow so iommupt can use it
Date: Sun,  4 Oct 2026 17:50:41 +0100
Message-ID: <179112946237.2363163.15333874894190883676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0-v8-1eaaed5e0433+3d3d2d-smmu_tlbi_jgg@nvidia.com>
References: <0-v8-1eaaed5e0433+3d3d2d-smmu_tlbi_jgg@nvidia.com>
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

On Fri, 02 Oct 2026 22:23:19 -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table, the precursor patches have been merged now. What's left:
>  1) Organize the SMMUv3 invalidation flow so iommupt can use it
>  2) Use the generic iommu page table for SMMUv3
> 
> The first patch should ideally go to -rc
> 
> [...]

Applied first seven to iommu (arm/smmu/updates), thanks!

[1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT under invalidation with SVA
      https://git.kernel.org/iommu/c/84c6089a365f
[2/9] iommu/arm-smmu-v3: Pass the parameters for the invalidation in a struct
      https://git.kernel.org/iommu/c/0a6cd4ac9252
[3/9] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
      https://git.kernel.org/iommu/c/a9573c2847e9
[4/9] iommu/arm-smmu-v3: Optimize range invalidation for latency
      https://git.kernel.org/iommu/c/5a158b29766c
[5/9] iommu/arm-smmu-v3: Keep track in arm_smmu_invs if range invalidation is used
      https://git.kernel.org/iommu/c/fc62cd069cf7
[6/9] iommu/arm-smmu-v3: Precompute the invalidation commands
      https://git.kernel.org/iommu/c/bc5c3475d63c
[7/9] iommu/arm-smmu-v3: Populate the tlbi at the top of the call chain
      https://git.kernel.org/iommu/c/d587faf66828

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

