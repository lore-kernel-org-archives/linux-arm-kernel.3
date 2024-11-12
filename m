Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB2D42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzVQUAW7rSnshW39+ykBJSKBa2Pfavpo58DjTTnpT1g=; b=aSUfmpAdLXUy44vXuXoajaJjJ4
	XeZWgBTud9mZ7HOPG/QnzqDkdobsTTFd6ltE9fx7uKpPnyxhi8vRN+naUUFtaa4VXNSZ0aYIaYH4l
	VtVDyEKmlMFg8gsfg9z+sA0xBovHB5UfBvJBBEWFRp4+Cxgv7qRUCAnrXy4g2YeoDTdT2SO1L9fv5
	YxrCHtkM1ZvtoMUJNJDEEabnkdu4yfE2tcWKwl3F7oo89JQ68yT5PlHw0DgpBxEWwL+2yIXr1lPYe
	J1fTVXydTZP+MfT1ZbBiBDMRmQQSYZ1wSIXnDKlvS2ACiS/Op5C7JP1BC0taW79FBOea2aT1gEn6y
	qMojGSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtOL-000000044R7-3ntj;
	Tue, 12 Nov 2024 16:05:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtJo-000000043Bs-27po
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D7315C57D6;
	Tue, 12 Nov 2024 15:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1C3C4CECD;
	Tue, 12 Nov 2024 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731427239;
	bh=jRptFKZ6EWwcd9gt1RnzMN4OZFAiMNrpYSjY4y96mqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzLgJLi047fFA6CUYdWIWbsQwDTyAzZlZaSufd8HROXV5wqNtC2IVpEXtTEJIvp6X
	 JwRbhxC0eVMwgY6PIXlVEdaDxG1aFBkQaTUYWI3ovv5DvINBFTJLU8JepMudnjdvy9
	 Eatsx/2hTpEaLn8a+Od2X+slepsrXy7Qau6VY0WCH37fLbYRwYB3nnG/Qupix4dDyw
	 5l6iZnFd7kDUvYLQrLFBWdibsJamkMg7WS0RfzlzLzgRCCtjbeLZkGMlbijuUL4JQd
	 pYn/4vOKPCtcIepvnaA8xujmrTlaUl6gWlrfdrnPY0nCJ/iEkIPSPzUtBwE5jxKS7u
	 fqYIyupLS1RGg==
Date: Tue, 12 Nov 2024 16:00:35 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] iommu: Manage driver probe deferral better
Message-ID: <20241112160032.GD21479@willie-the-truck>
References: <cover.1731088789.git.robin.murphy@arm.com>
 <2da0ae7f76c7466176e906fa5d7a0ae5210e8650.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da0ae7f76c7466176e906fa5d7a0ae5210e8650.1731088789.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080040_626197_1EDD83BE 
X-CRM114-Status: GOOD (  11.38  )
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

On Fri, Nov 08, 2024 at 06:30:17PM +0000, Robin Murphy wrote:
> Since iommu_fwspec_init() absorbed the basic driver probe deferral
> check to wait for an IOMMU to register, we may as well handle the probe
> deferral timeout there as well. The current inconsistency of callers
> results in client devices deferring forever on an arm64 ACPI system
> where an SMMU has failed its own driver probe.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iommu.c    | 2 +-
>  drivers/iommu/of_iommu.c | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

