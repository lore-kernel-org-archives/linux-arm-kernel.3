Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44755D59F48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl3U4wSL+5LdLKtEEvFx0ANtJXl/d4JTR3XePPrdFwY=; b=eOi7s709fGfoR9Y7eiwSBwVca9
	uhTLEv4FlDvYFDtroKyhZQeymR4L0+GDtK7d6V5IKcxEzWX1ekmkt01w4zPNc1OVCtdoraVDTZfu5
	NUptykfPsYPv5wuDqfQ63+5aE+5NzxrSOzYM8ELp9MfpuCDLPacrVEcfQuUYSm5GT7X0xzI52jBrf
	7NC25QFHOuWehsNtie8X7yr6H2UOEyZQDBGKJXD/pdcgfdkYZfKvnoah+5Xnarf1EII0HVnrSW+2O
	7jJVUxIsusTwno04Y5GJ51+GALl01Y1jmleQnDKi0NHz7RF4sCJIgV2o4t+7XGp1Cj5YGd9W0mO82
	eRv2+HbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iP1-00000003ug3-3RV3;
	Wed, 06 Nov 2024 15:57:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iLe-00000003uB6-11gP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9ADD6A43F97;
	Wed,  6 Nov 2024 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DDAC4CECD;
	Wed,  6 Nov 2024 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908413;
	bh=Eg7TVMu0q5lzDUTXHhoiurM6aMX5DshN2Hm+8U2txNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xy+3mwjAla+PCpUgJIAWjVJvAxy/sWMdntHcLHXg4t4MBCLlQUKPUTdEBJ9xKed5t
	 Ks2GXpv5XKfiadr4Px/0LuF5VWyVKBfOsYc55xuB2UVnQ620qanS0fhmo/LFzJ/8L4
	 ZUmueb01LhGr9wKA1zJu2JaXIa9WP97ov5IJ+kWHmFDQluN2YatgrwxJKSZ99SGlQJ
	 BufjhA3pihT4TISQ93n9mihnSxXrXjGOWSakfKuTtraNBX2kDuNhnNz75plYmxWW5a
	 ogtXlWD70w7ub8mCGvZLUkmq0i9nvHF7OKPnuAcugmbyV6wxbomkjh+mh/hSmS8ga0
	 BovKWFWogz5Rg==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Date: Wed,  6 Nov 2024 15:53:23 +0000
Message-Id: <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_075334_369937_F3030107 
X-CRM114-Status: GOOD (  10.73  )
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

On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> This is the result of the discussion on removing split. We agreed that
> split is not required, and no application should ask for anything that
> would not unmap a full large IOPTE.
> 
> Instead of split the two ARM drivers will now WARN_ON and return 0. This
> is in contrast to what several other drivers do of removing the whole
> IOPTE and returning 0.
> 
> [...]

Applied to iommu (arm/smmu), thanks!

[1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
      https://git.kernel.org/iommu/c/33729a5fc0ca
[2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
      https://git.kernel.org/iommu/c/fd50651636fb
[3/3] iommu: Add a kdoc to iommu_unmap()
      https://git.kernel.org/iommu/c/6ac7dffe7cca

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

