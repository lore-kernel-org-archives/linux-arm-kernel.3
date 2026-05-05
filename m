Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833B0CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cxk//KUPJSoEx14fWOBCbzpWhXsaa82/9VwpdEGmrc=; b=QLtk3uBH1KUNmM5Uy+y1+AsZim
	mhBLIbEW7UNzttR2IB6ENtLj4f7VGk/i/KlWFm69oJ+r/G9AqB3bdbhbvpAe5jXTmmiJqzhzL4gTC
	G4iWzXxCm7Q9psUzns5PlVgdPP63YlewYHqtIh3N/MJcC2vDVH0kDRjKkeg28+lPaa9hjGeH2WgON
	uEaw9HJg3+hJvaY10K3ylOi/o17ZRcSVpUCjPJCGxuLHIprLpdTENyQosTqArM6Js7Mc0Ia0IsbBw
	jKD+1KMmTjaS5/nJBUhi7D7kBTuvgmQfIIGFO+55C7vC97jLndoUhrHwEKIfQEJQyNYv6fFmGYMCX
	Bj10tyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIhb-0000000GtmM-3KSk;
	Tue, 05 May 2026 16:32:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIhZ-0000000GtkN-1TfQ;
	Tue, 05 May 2026 16:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777998770;
	bh=dnfLGzurewhGYmAkfx0e1+N3a4xmKjPSdyc6YJYICe0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=chnNGEJP+I5Tqr/+EzV+BAGa2W8876nPXG15BSzH3+oTObFtVw/uGnWFO4iEfi6Yu
	 qjVJu+SBs/mo/Sk7SE3fHq+sYl6hc9nf05jEVXaxQ0cR2WLGatLnbs2uyeBwE3/aND
	 hPWcmnyKFANowsOdgQrWSSRX5HuTRQJWzrUOmENA5qa4LqYsM1N1mfdKOXp3ZrkQLl
	 1cfuK86dMDOdfh1iedj/t8nURvTzZQRQyNPGBFwpt35AlXQk1bcM/ikK9HdqWi765l
	 ElVgV22rH5VsA7nb4eBu3bdhO9NoRLdMYZaMe1aI7S9wmGx7xHEbvKlpJGoSAiu6xm
	 5UrIfFmlWFH5w==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B811917E0F07;
	Tue,  5 May 2026 18:32:49 +0200 (CEST)
Date: Tue, 5 May 2026 18:32:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/panthor: Explicit expansion of locked VM region
Message-ID: <20260505183244.0830c34c@fedora>
In-Reply-To: <20260505140516.1372388-7-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-7-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093253_579732_1A18D90A 
X-CRM114-Status: GOOD (  34.24  )
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

On Tue,  5 May 2026 16:05:12 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> Currently the panthor_vm_lock_region() function will implicitly expand
> an already locked VM region. This can be problematic because the caller
> do not reliably know if it needs to call panthor_vm_unlock_region()
> or not.
> 
> Worth noting, there is currently no known issues with this as the code
> is written today.
> 
> This change introduces panthor_vm_expand_region() which will only work
> if there is already a locked VM region. This again means that the
> original lock and unlock functions can work as a pair. This pairing is
> needed for subsequent protected memory changes.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 69 +++++++++++++++++++--------
>  1 file changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fc930ee158a52..07f54176ec1bf 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1701,15 +1701,36 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
>  	struct panthor_device *ptdev = vm->ptdev;
>  	int ret = 0;
>  
> -	/* sm_step_remap() can call panthor_vm_lock_region() to account for
> -	 * the wider unmap needed when doing a partial huge page unamp. We
> -	 * need to ignore the lock if it's already part of the locked region.
> -	 */
> -	if (start >= vm->locked_region.start &&
> -	    start + size <= vm->locked_region.start + vm->locked_region.size)
> -		return 0;
> +	if (drm_WARN_ON(&ptdev->base, vm->locked_region.size))
> +		return -EINVAL;

How about we have a helper called panthor_vm_apply_as_lock() that would
only take care of the AS_LOCKADDR() sequence. panthor_vm_lock_region()
would have this WARN_ON(), the pack_region_range() and a call to
panthor_vm_apply_as_lock(). Similarly,
panthor_vm_expand_locked_region() would rely on
panthor_vm_apply_as_lock() to apply the expanded lock.

> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	if (vm->as.id >= 0 && size) {
> +		/* Lock the region that needs to be updated */
> +		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
> +			    pack_region_range(ptdev, &start, &size));
> +
> +		/* If the lock succeeded, update the locked_region info. */
> +		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
> +	}
>  
> -	/* sm_step_remap() may need a locked region that isn't a strict superset
> +	if (!ret) {
> +		vm->locked_region.start = start;
> +		vm->locked_region.size = size;
> +	}
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +
> +	return ret;
> +}
> +
> +static int panthor_vm_expand_region(struct panthor_vm *vm, u64 start, u64 size)

s/panthor_vm_expand_region/panthor_vm_expand_locked_region/

> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +	u64 end;
> +	int ret = 0;
> +
> +	/* This function is here to handle the following case:
> +	 * sm_step_remap() may need a locked region that isn't a strict superset
>  	 * of the original one because of having to extend unmap boundaries beyond
>  	 * it to deal with partial unmaps of transparent huge pages. What we want
>  	 * in those cases is to lock the union of both regions. The new region must
> @@ -1717,16 +1738,24 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
>  	 * boundaries in a remap operation can only shift up or down respectively,
>  	 * but never otherwise.
>  	 */
> -	if (vm->locked_region.size) {
> -		u64 end = max(vm->locked_region.start + vm->locked_region.size,
> -			      start + size);
>  
> -		drm_WARN_ON_ONCE(&vm->ptdev->base, (start + size <= vm->locked_region.start) ||
> -				 (start >= vm->locked_region.start + vm->locked_region.size));
> +	/* This function can only expand an already locked region */
> +	if (drm_WARN_ON(&ptdev->base, !vm->locked_region.size))
> +		return -EINVAL;
>  
> -		start = min(start, vm->locked_region.start);
> -		size = end - start;
> -	}
> +	/* Early out if requested range is already locked */
> +	if (start >= vm->locked_region.start &&
> +	    start + size <= vm->locked_region.start + vm->locked_region.size)
> +		return 0;
> +
> +	end = max(vm->locked_region.start + vm->locked_region.size,
> +		  start + size);
> +
> +	drm_WARN_ON_ONCE(&ptdev->base, (start + size <= vm->locked_region.start) ||
> +			 (start >= vm->locked_region.start + vm->locked_region.size));
> +
> +	start = min(start, vm->locked_region.start);
> +	size = end - start;
>  
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	if (vm->as.id >= 0 && size) {
> @@ -2252,11 +2281,13 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  	unmap_hugepage_align(&op->remap, &unmap_start, &unmap_range);
>  
>  	/* If the range changed, we might have to lock a wider region to guarantee
> -	 * atomicity. panthor_vm_lock_region() bails out early if the new region
> -	 * is already part of the locked region, so no need to do this check here.
> +	 * atomicity.
>  	 */
>  	if (!unmap_vma->evicted) {
> -		panthor_vm_lock_region(vm, unmap_start, unmap_range);
> +		ret = panthor_vm_expand_region(vm, unmap_start, unmap_range);
> +		if (ret)
> +			return ret;
> +
>  		panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>  	}
>  


