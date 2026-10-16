Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A444CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BC2GgbK+WoFQXcV9V5/6mo0si8p848r+VKvD9YiR8iA=; b=OICgMmtWWrSv4S5KdAarBdlC/l
	VCMOzwmo+VkISPZkcADPlAYHCXU4pUXcrN1mk8qxrDEdFgxY2YF3A2EEFDFyN85edVQ4z4mWDnnKr
	iuEgIXFMtLyRGW5iu827Kdni07qzyU78KLEEdkkqcY1VFi8o2rJDZqPKmsuF4TnNrVpgI8WAsFg2a
	gDz2wv90UoLncIHcUX2xoQielcZssEXkBBb0V4t560+rL81DWb4Xb4ACcO9KGnywLkMSnXKf2NvSj
	xi9i/sXogr3pCKTDGHZ7Hx3h5Uy0ZEYR57LaIXGn4VTUc1Q43i0AKkHd9zctcuYMdDbdnfioiHbip
	+wa6CMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHix9-00000003974-1ecz;
	Fri, 16 Oct 2026 14:30:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHix7-0000000396q-2qA9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:30:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88864600AA;
	Fri, 16 Oct 2026 14:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C791F000C5;
	Fri, 16 Oct 2026 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161032;
	bh=BC2GgbK+WoFQXcV9V5/6mo0si8p848r+VKvD9YiR8iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J/zQhxy3DvvHtqlJgPR2wCD6FtIcCpZDGlMxgpqkGGOcbZPi2Z5FSg5pav4I9SOZM
	 eUcBaIxHIKW/XlnIizLNd3Tp11ed8og4XnvEHSiRuJgaOXacO5qcUAmjpUzZb6CJoh
	 SZaasebWVHsUO16EJIFaKgGPd9zMhEjvqTEf0yBosyZqdJaSorlkhev3BOdjy1WHKj
	 CjX/fsi/oM4Fn9vcH/TdwrRjtOKjB7mnl5+0VLiMWEvYuFwoc7jgcxY2vVYiZu4YUt
	 R1Q7VGkl/Qt+Wt5PJRSjKnuaSHJXN4E01nYVDhdGQaQ1LS7TkAsECRJBWThOnWtz9/
	 uojxREGTx2JhA==
Date: Fri, 16 Oct 2026 15:30:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 08/28] HACK! KVM: arm64: Disable SPE
 virtualization if protected KVM is enabled
Message-ID: <atIzmvlo78PDwAXI@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-9-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-9-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:06:03PM +0100, Alexandru Elisei wrote:
> For RFC only.
>

I realise this isn't intended for the final series :) but be good to put
something here briefly for reviewers to explain why this is here, e.g. pKVM
needs special attention etc. Similar comment for 9, 10 if there's an RFC
respin.

So for this and patches 9, 10 in general it seems you disable the feature
for:

- pKVM (at global level)
- non-VHE
- nested virt

Are these temporary for proof-of-concept reasons or do you plan to make
them permanent limitations for the initial implementation of SPE?

If the former it'd be good to know what your plans are to provide support
for these, if the latter it seems sensible to put these all in one patch
that describes why you are limiting each.

> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

I won't bother actually reviewing the hacks, so just the queries above for
8, 9, 10. Will resume review at 11 :)

> ---
>  arch/arm64/kvm/spe.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index 646806a60d66..97160d1fae81 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -22,6 +22,10 @@ void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
>  {
>  	struct spe_pmu_entry *entry;
>
> +	/* TODO: pKVM support */
> +	if (is_protected_kvm_enabled())
> +		return;
> +
>  	guard(mutex)(&spe_pmus_lock);
>
>  	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

