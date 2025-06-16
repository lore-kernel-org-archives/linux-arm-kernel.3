Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E997C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I9LRxbbBBppWWiUnB8hlN6UQEkIvrjVtuYYX5wN0/c=; b=O74pOQ1Uv4GdGqqLG95jJ6JqME
	ifWhD2Gg9konAMFDJvcd3eQ+ngCb85YG4nRFBGXuWNy07wT0UMd5r8s7GRGJg0XaAutrGEEXYWYGm
	BSWGAuzgjIJwdqi/sLmoQbwGVpv81XuOJQ7iQik5d6Dj9vOfWT3ENRal/39aoAXLxGOGqzXanZF9C
	ie9+ol6LDDpa46MgNDkngNoM5DgdfSCAdLnYNwTwy+yafbD/8jR5AGk3KdXHer+kJKhZfPtIWYB+G
	bJ2NjBq6ubJ0sHI/GzjBNrW2MAC0hqBYS2njBgVkurOjV0ZFYnze/qzKwPOze0W7tAeUErHHecrh5
	1qQJNhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7fS-000000049ki-1rRw;
	Mon, 16 Jun 2025 11:06:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6gJ-000000041Al-1imB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0288B49B07;
	Mon, 16 Jun 2025 10:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1DDC4CEEA;
	Mon, 16 Jun 2025 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750068189;
	bh=XQM8j714x8CB0+wIsMuEuOxZKpbd7ep9EJ8KDVn9O04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bjo78z/unMglag+thKwfukBAUjd4ObIDnwtDCbACbFN5dFlqSZb7v2YHP8Ec096Xz
	 3bBI17L+F4CO4kHNuVKN4tT+N3y5D96977CfynimipzSkpa684O1LZf8Tpd8b3uXfH
	 VjyIiqTLkKw0ooqWiFAab1+KWJAr5v0cdg1farxLQL2LQG3yXIKkAPYh1W1dX9/ga7
	 jaEmX0vtnKB6tc/p+4nOfiX5AMUCLhbfPMmMgV3qM2RDzSnlJsw0r+EPs9u4X0rXfd
	 gRIEN/qyLYZiLxAYWFv8B/s11wE2NTm2iv3Fjv3cL2qiaYUZ8LYvqLelF9dj8magUt
	 O/gxT9SFf8NjQ==
Date: Mon, 16 Jun 2025 11:03:04 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, robin.murphy@arm.com,
	joro@8bytes.org, praan@google.com, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 10/14] iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with
 arm_vsmmu_init
Message-ID: <20250616100303.GA17132@willie-the-truck>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_030311_465947_9F589051 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Jun 13, 2025 at 11:35:22PM -0700, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced.
> 
> Sanitize the inputs and report the size of struct arm_vsmmu on success, in
> arm_smmu_get_viommu_size().
> 
> Place the type sanity at the last, becase there will be soon an impl level
> get_viommu_size op, which will require the same sanity tests prior. It can
> simply insert a piece of code in front of the IOMMU_VIOMMU_TYPE_ARM_SMMUV3
> sanity.
> 
> The core will ensure the viommu_type is set to the core vIOMMU object, and
> pass in the same dev pointer, so arm_vsmmu_init() won't need to repeat the
> same sanity tests but to simply init the arm_vsmmu struct.
> 
> Remove the arm_vsmmu_alloc, completing the replacement.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 11 +++--
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 46 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +-
>  3 files changed, 32 insertions(+), 28 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

