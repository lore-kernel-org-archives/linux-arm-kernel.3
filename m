Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1728E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW6cRbkrMi+Hf/I0xSRo83BmgLzp5feREpfHpupuUYs=; b=VdBO4mjS/e58RvHgVRm82NvQhb
	0WjEDnDsh+IEbOkcr/Ai1G7tTDDrJxSPinvJoV4GibkxQ36HWmKFoIL6e9FVH2e3Tq0e3jIqfR7HB
	Z86Vuhp33hj8hdP4Xn8SUzwB7BSTbgePJUHzERq2r6t2Zk0ArODfYKbwUNpwwAcZQn9sdnZKouliK
	lzEFSal/NYAsT+0qE3OyT8yFPZYm8D7e8UuUnNxBU5GPez3K2cQQoVp/lEksucw9sxDOW8v+aOoIf
	HFPXvNF+hJn/EgaTB5IrFH7/uC6i0NqGij0qX2cU3jPfbq44ORtUL295tIPwIYNEzifJBZDP7Zb59
	TCSPhcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDkI-0000000GWvM-2Oj3;
	Thu, 05 Dec 2024 15:26:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDjH-0000000GWjk-1oTm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FBE55C5EB9;
	Thu,  5 Dec 2024 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A8DC4CEDD;
	Thu,  5 Dec 2024 15:25:20 +0000 (UTC)
Date: Thu, 5 Dec 2024 15:25:18 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	joey.gouly@arm.com, ryan.roberts@arm.com
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Message-ID: <Z1HF3i-mAAXDHKUP@arm.com>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
 <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_072523_512110_E836A7EC 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu, Dec 05, 2024 at 03:04:11PM +0000, Mark Brown wrote:
> On Thu, Dec 05, 2024 at 01:48:10PM +0000, Robin Murphy wrote:
> > Since system_supports_gcs() ends up referring to cpucap_is_possible(),
> > teach the latter about GCS for consistency with similar features.
> 
> Not clear why this is part of a series, there's no obvious relationship
> with patch 1?

No, probably Robing forgot to pass --no-thread to git.

> >  static inline bool system_supports_gcs(void)
> >  {
> > -	return IS_ENABLED(CONFIG_ARM64_GCS) &&
> > -		alternative_has_cap_unlikely(ARM64_HAS_GCS);
> > +	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
> >  }
> 
> Ah, this is bitrot since the series was on the list for so long.  As
> well as HAFT which Rutland mentioned it looks like _bti_kernel(),
> _irq_prio_masking() and possibly others have the same thing.  Ideally
> we'd have no uses of IS_ENABLED() in these functions so it's a bit more
> obvious.  In any case
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks. This patch will go in via the arm64 tree. I'll leave the other
for the smmu tree.

-- 
Catalin

