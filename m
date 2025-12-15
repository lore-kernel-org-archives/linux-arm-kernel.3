Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8774D5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXuzL5EebOkBmMK8Aq8nvsj5n+kUXEYFHV9Bdy5czmI=; b=3aLDXHn3zRgwan8fOvfAVWrzyV
	t9Tv02AyFa/VMlCwGpeTIBLP6NjHS//uyM2Za3dT3emnI53tW+LzSaesVxzxJbqNd+vfchujSDLTX
	jTv9B5fDI4h4dlGepaTwjMA7c9rVHwo8TYepZssZgFDbs49oKMdJFrVM+BIAvfRF7PJwxJ4Linf67
	7Yc/mRPLbY5FfhRBvLIYjE9RtnBUObXMcrsh6wQrY328e4t7mb/K+OU2hQG6mDh5jKZR02yrWUd5z
	jewQIX+Fed/xx5ZXUcu9JCbnppQwTvAzdaCVZnr4MLEP+/gaajFLeXg2uNGgulUOWMo2C3q2MazHM
	nLAKrs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCh1-000000045QT-2sR9;
	Mon, 15 Dec 2025 17:49:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCgz-000000045Pi-0Mbs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:49:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E0C168F;
	Mon, 15 Dec 2025 09:48:56 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 088373F73B;
	Mon, 15 Dec 2025 09:49:02 -0800 (PST)
Date: Mon, 15 Dec 2025 17:49:01 +0000
From: Leo Yan <leo.yan@arm.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 08/35] HACK! KVM: arm64: Enable SPE virtualization
 only in VHE mode
Message-ID: <20251215174901.GA779696@e132581.arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-9-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114160717.163230-9-alexandru.elisei@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_094905_185534_FC795952 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, Nov 14, 2025 at 04:06:49PM +0000, Alexandru Elisei wrote:
> For RFC only.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arch/arm64/kvm/spe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index 7e38f7d9075b..101258b55053 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -24,8 +24,8 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
>  {
>  	struct arm_spu_entry *entry;
>  
> -	/* TODO: pKVM support */
> -	if (is_protected_kvm_enabled())
> +	/* TODO: pKVM and nVHE support */
> +	if (is_protected_kvm_enabled() || !has_vhe())

I totally agree we should focus on VHE mode first.  But it is worth
considering if we can unify solution across different virtualization
modes.

Aside from register access and IRQ handling, buffer management is the
most complex part of this series, it would be useful to know whether
the change can support different modes.

Thanks,
Leo

P.S. an interesting question is whether we can reuse virtio-iommu or
DMA buffer allocation for SPE.  My understanding is the IOMMU would be
simpler case, as the page table allocation and mapping occur entirely
on the host side.

