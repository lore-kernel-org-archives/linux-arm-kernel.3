Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30F8CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp4zdahHzJQavxN6hq07R6KY82T++POvxy4+D0aaurU=; b=1ZSyVm1SFEg+BML8R+p0sNB1ks
	M4AMe5bs197JKAegCLTjfCxcxDOczfcJ9K3Ga1J+RUeHDZN/C+m1k3yk7vLuPpUuBZkt2eGjFHcZ0
	BDwuZUzepnue3EYotF3xjFD8nNDlR6I10kRbee1ccvuLguiQ4Yu7UvDzBA8vT8g/DCl3hoL7w+YJL
	7G77274ezbUNyz73nMObMi6GDJ0Q1XPAQRzAxKuoSPuiCQjvupjBDXGHDkh9TsElVOPjXg7nW7GSC
	CItiOZlrBCaSTy3sq5SNStp6yyZbKXRHxDcVa3imYXmMxdk2IrdtyitDhtGl0asXbzFrOyjmo3p1J
	Pntz+CYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHxl-0000000Ghg1-42qq;
	Tue, 05 May 2026 15:45:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHxj-0000000GhfH-1voT;
	Tue, 05 May 2026 15:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777995928;
	bh=jBx8nB9b6bnSOdq1Lg0Zmli8skt3ZB3P8uirgX2ef6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TVnQwlNnhVc/ZN7PyO7X+H+GzfbfoPlX794s3ooDIRI2/+3CaYrrJAj4C1cGixQmm
	 ffGLgHU0nrOlGKWiilu4yeC9F13it7AtoUIgNOwvdcW50nxVRIGqM5GtSC6mn13eB3
	 PoC6ff/ZzvtEApEPYuMrfXvIDZoJyDLrTVDT+ie9R/Tl8nzLxoj9zyaWFaqH4hJjcL
	 Ig9Jr1fR2Z4PUXSFWKcdYcve2ERp2IZARnxBpjoZPk4mfgfrtZuVPNwtUY0aXYVgDK
	 vV0XSomsNSK3WR22a15kmCrueH0J2UVUXt7Yfywt7thP3sCEMTJ94J35SmX7qB/cLB
	 PfC+fcmM3+mEg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 267D417E13B2;
	Tue,  5 May 2026 17:45:27 +0200 (CEST)
Date: Tue, 5 May 2026 17:45:22 +0200
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 2/8] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
Message-ID: <20260505174522.7d7f2756@fedora>
In-Reply-To: <20260505140516.1372388-3-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-3-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084531_674686_B8FCD4DA 
X-CRM114-Status: GOOD (  34.83  )
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

On Tue,  5 May 2026 16:05:08 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: John Stultz <jstultz@google.com>
> 
> This allows drivers who don't want to create their own
> DMA-BUF exporter to be able to allocate DMA-BUFs directly
> from existing DMA-BUF Heaps.
> 
> There is some concern that the premise of DMA-BUF heaps is
> that userland knows better about what type of heap memory
> is needed for a pipeline, so it would likely be best for
> drivers to import and fill DMA-BUFs allocated by userland
> instead of allocating one themselves, but this is still
> up for debate.

I think this commit message needs to be updated with more details
around what it's actually needed for here (driver needing protected
buffer to boot FW and expose a char device, and no clean way to pass
dmabufs around before this cdev is exposed).

> 
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Fix the checkpatch alignment warning]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> [Florent: Rebase]
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> [Ketil: Rebase]
> ---
>  drivers/dma-buf/dma-heap.c | 80 ++++++++++++++++++++++++++++++--------
>  include/linux/dma-heap.h   |  6 +++
>  2 files changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 9fd365ddbd517..854d40d789ff2 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -57,12 +57,24 @@ module_param(mem_accounting, bool, 0444);
>  MODULE_PARM_DESC(mem_accounting,
>  		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
>  
> -static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -				 u32 fd_flags,
> -				 u64 heap_flags)
> +/**
> + * dma_heap_buffer_alloc - Allocate dma-buf from a dma_heap
> + * @heap:	DMA-Heap to allocate from
> + * @len:	size to allocate in bytes
> + * @fd_flags:	flags to set on returned dma-buf fd
> + * @heap_flags: flags to pass to the dma heap
> + *
> + * This is for internal dma-buf allocations only. Free returned buffers with dma_buf_put().
> + */
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      u32 fd_flags,
> +				      u64 heap_flags)
>  {
> -	struct dma_buf *dmabuf;
> -	int fd;
> +	if (fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> +		return ERR_PTR(-EINVAL);

I'd probably move the flags checks to dma_heap_buffer_alloc() in a
separate patch, to keep the diff easier to read. Same for the
dma_heap_buffer_alloc()/dma_heap_bufferfd_alloc() split, though I'm not
too sure we need dma_heap_bufferfd_alloc(), we could just move the FD
allocation directly in dma_heap_ioctl_allocate().


>  
>  	/*
>  	 * Allocations from all heaps have to begin
> @@ -70,9 +82,20 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>  	 */
>  	len = PAGE_ALIGN(len);
>  	if (!len)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
> +
> +	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_heap_buffer_alloc, "DMA_BUF_HEAP");
>  
> -	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +static int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
> +				   u32 fd_flags,
> +				   u64 heap_flags)
> +{
> +	struct dma_buf *dmabuf;
> +	int fd;
> +
> +	dmabuf = dma_heap_buffer_alloc(heap, len, fd_flags, heap_flags);
>  	if (IS_ERR(dmabuf))
>  		return PTR_ERR(dmabuf);
>  
> @@ -110,15 +133,9 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>  	if (heap_allocation->fd)
>  		return -EINVAL;
>  
> -	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> -		return -EINVAL;
> -
> -	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> -		return -EINVAL;
> -
> -	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
> -				   heap_allocation->fd_flags,
> -				   heap_allocation->heap_flags);
> +	fd = dma_heap_bufferfd_alloc(heap, heap_allocation->len,
> +				     heap_allocation->fd_flags,
> +				     heap_allocation->heap_flags);
>  	if (fd < 0)
>  		return fd;
>  
> @@ -317,6 +334,36 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>  
> +/**
> + * dma_heap_find - get the heap registered with the specified name
> + * @name: Name of the DMA-Heap to find
> + *
> + * Returns:
> + * The DMA-Heap with the provided name.
> + *
> + * NOTE: DMA-Heaps returned from this function MUST be released using
> + * dma_heap_put() when the user is done to enable the heap to be unloaded.
> + */
> +struct dma_heap *dma_heap_find(const char *name)

s/dma_heap_find/dma_heap_find_by_name/gc

> +{
> +	struct dma_heap *h;
> +
> +	mutex_lock(&heap_list_lock);
> +	list_for_each_entry(h, &heap_list, list) {
> +		if (!kref_get_unless_zero(&h->refcount))
> +			continue;
> +
> +		if (!strcmp(h->name, name)) {

I think we should go sysfs_streq(), to make sure we don't return a heap
whose name only starts with the searched name.

> +			mutex_unlock(&heap_list_lock);
> +			return h;
> +		}
> +		dma_heap_put(h);
> +	}
> +	mutex_unlock(&heap_list_lock);
> +	return NULL;

This could be simplified with something like:

	struct dma_heap *h, *ret = NULL;

	guard(mutex)(&heap_list_lock);
	list_for_each_entry(h, &heap_list, list) {
		if (!sysfs_streq(h->name, name))
			continue;

		if (kref_get_unless_zero(&h->refcount))
			ret = h;

		break;
	}

	return ret;

> +}


> +EXPORT_SYMBOL_NS_GPL(dma_heap_find, "DMA_BUF_HEAP");
> +
>  static void dma_heap_release(struct kref *ref)
>  {
>  	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> @@ -341,6 +388,7 @@ void dma_heap_put(struct dma_heap *heap)
>  {
>  	kref_put(&heap->refcount, dma_heap_release);
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_put, "DMA_BUF_HEAP");
>  
>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>  {
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index ff57741700f5f..c3351f8a1f8cf 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -46,8 +46,14 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>  
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>  
> +struct dma_heap *dma_heap_find(const char *name);
> +
>  void dma_heap_put(struct dma_heap *heap);
>  
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      u32 fd_flags,
> +				      u64 heap_flags);
> +
>  extern bool mem_accounting;
>  
>  #endif /* _DMA_HEAPS_H */


