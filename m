Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EC7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWW9xv7ooDLIQsrqaAppZ94QsrxtKHBFzcmfZnB+aek=; b=1d2vqEps9oxKrjmk/rFFS0pGDM
	7L0vMSFVaYDYtDXSZtXrDVyn69kGxGX/8jT/toL6CKgF0mzSbYvjJo/4VHkUCN3mwz9yXMXcEOKQw
	pG4+ABuR6Hc+PNq1bRufNHa3Jb99EdGmyWvamPkqaqVnInJwajKL0MUxaZhJbyNKC3M1OSutiFIIh
	Jvxz4aihg5xhAIDcd3l9cyL4y8mQ7JLvDIbkObznunamFhAgh87x1MHSr0rDk08Q00g8iyDHVflym
	xDfENSRJgW1BfEbCO0ObUvB0iEMsP+vrZFpXMocFW5F2G0iH8puoDpUND255JDWUoBHMHErwVZhra
	pug6nSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlt-0000000Ha2e-0h3l;
	Mon, 21 Jul 2025 14:45:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqRd-0000000HNGV-0iwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F61B448EC;
	Mon, 21 Jul 2025 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1ADFC4CEF6;
	Mon, 21 Jul 2025 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753104040;
	bh=EKbMumgPxG3mrRXVfqq22nRZqrgaafXKtjd5p3sdBnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bg/8mIA/+RhenAyCWnlw2Omth29e2SMqxc1KgdP24WpiBEKYxI2FABFubp29ut4Nh
	 AICjk3+4LS/z7KdfIpS0Ow8SOMgC5VsGm17zpL65dHcyJ2q/TV6bFPpP7ln4xKehGp
	 w4XwLoFGnmUP9tcy9CG56K3aYBrmu72CVOYcQECiBw4TzKoyjwbkaJVoQMnJSrSxJ3
	 eazPeGqRTQEZNjUeB7+q/+gbMYPa0IWXah6MRcNO3O2YVGo4gEsj5ct2rmeFYgujLn
	 Y07ktCaiiIES3T8tFweeV1KgFxdHKptkXzVkEWHqUqcXgIDQbX48fsZUieZ01n8r5w
	 xsSDALGAjtP+w==
Date: Mon, 21 Jul 2025 14:20:35 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aH4-o8Y99YTnNzss@willie-the-truck>
References: <20250718234822.1734190-1-nicolinc@nvidia.com>
 <20250718234822.1734190-3-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718234822.1734190-3-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_062041_228965_11FB1C0C 
X-CRM114-Status: UNSURE (   9.82  )
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

On Fri, Jul 18, 2025 at 04:48:22PM -0700, Nicolin Chen wrote:
> It's more flexible to have a get_viommu_size op. Replace static vsmmu_size
> and vsmmu_type with that.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    |  8 ++------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  3 +--
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c     | 14 ++++++++++++--
>  3 files changed, 15 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

