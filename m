Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D772CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2h3aXDZdKJuJgQ8QcsPnMlbnn2I3rpyOltrfhKhEwM=; b=uYxAg1hVwwhA6O1yQdxF+3ZscD
	ZhhUvH9i4PUO1cteS8++f4JTNngTO+wTV8ez6JNQMfK2FXOqoM7TwWOmykzy9OPHFKz/ABmDWOokz
	iIh7Ppa2FdFQlX0T0UTLt+COQbegqJ29Bj7rcm3S+59didltMX8lXqC7SJCWt1v3EuXXbeGHd3Sis
	gXCH+0hVEufXH7AFYE5/vc1gL/G+tj/XHf+pn8pDEEfZ54ul7AhDUlkfQ1JxoxojLVrZqd9Jd3K54
	c+gRbxCfUQEBGhqmesn2VSJdDtqtPBzUYPUOjh8WC6z6FkbVhFIbVR+sUW50OKWfGL076rCsxqDne
	GptGl/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21V-00000008wzk-3JHc;
	Tue, 09 Sep 2025 17:20:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzFi-00000007i0V-2JnF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AD8760224;
	Tue,  9 Sep 2025 14:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E472C4CEF7;
	Tue,  9 Sep 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427801;
	bh=fQ97+Dd40Jh9OqBAWXGx6hNnCravOj+hTJQ++rkJ3j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxCjHBoHfMm+cNL2zfObOh2HtjGIcDm2vdmciJn35H9XMf4qpLYftWD4UmFIGdGlS
	 I7NerNlwaG5f5iygJ8AhuFN9J4iyS50pbWi6CUnCss0G2KSGq1IOAGiee9nAY0BUmK
	 AGHvSvbHcruitvsn3RsFq6ESQioVk2w3nDA0XTIaa3mJV5vh/TdSUwZomlJNuAafmU
	 chjjKMN4SSR5k4brVFGPH26PhyDWGHXxUTL2pZTXyB/BJ+LOdiBG/45Ju1nWpfNHZ2
	 6SPfhbo1CCRGtuXWe0OQm7WXZEN9ZTmQ8uz66xRhm69sFTLBqyZRP2RWHbJxbND9IQ
	 glPUXXtgOeB4w==
Date: Tue, 9 Sep 2025 15:23:14 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 06/28] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <aMA4UpDgLDuiGYf8@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-7-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-7-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:34PM +0000, Mostafa Saleh wrote:
> The KVM SMMUv3 driver would re-use some of the cmdq code inside
> the hypervisor, move these functions to a new common c file that
> is shared between the host kernel and the hypervisor.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
>  .../arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c  | 114 ++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 146 ------------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  44 ++++++
>  4 files changed, 159 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66b..1918b4a64cb0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
> -arm_smmu_v3-y := arm-smmu-v3.o
> +arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-hyp.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
>  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> new file mode 100644
> index 000000000000..62744c8548a8
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> @@ -0,0 +1,114 @@

Given that this thie is linked into both the kernel and the hypervisor
objects, I think I'd drop the '-hyp' part from the filename. Maybe
something like 'arm-smmu-v3-lib.c' instead?

Let the bike-shedding begin!

Will

