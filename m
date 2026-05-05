Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE7CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g60majm7MIGx8fN5HDNHE+DvCVrvkOOCx6X0a2qXQQc=; b=fjpR1kDXe24iqdPI7ATGSuuSPY
	Q2cjyQL9ioz/0PFcfOmlrJdb+2PQ8HGgDXYdeeMw4NBj6Qs/uELv/fTniAo1OiWN6JQUKOTl0fV08
	6YR6KC1O52MRhClQerERnRqRN/lQXx6ZaAwEPP+lA6eIEi5LipwFqln6El4p7+zPQcUOctC0KWq7n
	fPajTf+Wl+e0k+OqdkUXtVNC1ZTEJ8cZi5T4Br0RdzDYm8/Cn9L9Q/vyM95U7t79BzcyLm4Ya/mnQ
	taxTw55dlGZVxofhtjk8aEKgYAOMNMcCVhyhW1rK565lCeO28iQ/4lIlkaYBC1hjpwlPU7/E3I2rz
	Y3zCYSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHa1-0000000Gdk4-3cnM;
	Tue, 05 May 2026 15:21:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHZy-0000000GdjV-48Op;
	Tue, 05 May 2026 15:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777994455;
	bh=GB3l17/ekg1P4sEApX6f/ITXv7X2gefB+5c4kZ5bdhQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HZ4LnhKuimVBHwguEpzHzUmKIga1uo5dFOtEZyWUTnmmq5oSmrqc6vzHcWnZmPR34
	 ISBs/7vrXXLNNZ4GzSz1AJXYG8mPv7GKqln6yQNsn7XEidgQgN3pkpnmUMh9E0By+E
	 zjJnyB/DCGYC3Db1gUTZLhyIJZHavG7xhlYHNvBDaTBBeHP54ab0vkUtayjvGW3SXh
	 U3zsKmmcKDqZX6/TTlXzVZGRMyLzcOvVBrNbm7mZ2626RA7Z4h0vMRsAI54zUqDGO5
	 G6+irU6LumaJMQzuJp99XhlFz158BBAuV1vb71KFVgPXYymXDUkC3hcxqWANL5gyVo
	 vIVXPlsHRlI0w==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35D1417E13B2;
	Tue,  5 May 2026 17:20:54 +0200 (CEST)
Date: Tue, 5 May 2026 17:20:48 +0200
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
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20260505172048.1c48e030@fedora>
In-Reply-To: <20260505140516.1372388-2-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-2-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_082059_186639_E392D0E7 
X-CRM114-Status: GOOD (  30.21  )
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

Hi Ketil,

On Tue,  5 May 2026 16:05:07 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: John Stultz <jstultz@google.com>
> 
> Add proper reference counting on the dma_heap structure. While
> existing heaps are built-in, we may eventually have heaps loaded
> from modules, and we'll need to be able to properly handle the
> references to the heaps

It's weird that this "heap as module" thing is mentioned here, but
actual robustness to make this safe is not added in the commit or any
of the following ones.

> 
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add comment for "minor" and "refcount"]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [Yunfei: Change reviewer's comments]
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> [Florent: Rebase]
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> [Ketil: Rebase]
> ---
>  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
>  include/linux/dma-heap.h   |  2 ++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index ac5f8685a6494..9fd365ddbd517 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -12,6 +12,7 @@
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/kref.h>
>  #include <linux/list.h>
>  #include <linux/nospec.h>
>  #include <linux/syscalls.h>
> @@ -31,6 +32,7 @@
>   * @heap_devt:		heap device node
>   * @list:		list head connecting to list of heaps
>   * @heap_cdev:		heap char device
> + * @refcount:		reference counter for this heap device
>   *
>   * Represents a heap of memory from which buffers can be made.
>   */
> @@ -41,6 +43,7 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +	struct kref refcount;
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
>  
> +	kref_init(&heap->refcount);
>  	heap->name = exp_info->name;
>  	heap->ops = exp_info->ops;
>  	heap->priv = exp_info->priv;
> @@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>  
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +	unsigned int minor = MINOR(heap->heap_devt);
> +
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, minor);
> +
> +	kfree(heap);

That's actually problematic, because cdev_del() doesn't guarantee that
all opened FDs have been closed [1], it just guarantees that no new ones
can materialize. In order to make that safe, we'd need a

1. kref_get_unless_zero() in dma_heap_open(), with proper locking around
   the xa_load() to protect against the heap removal that's happening
   here
2. a dma_heap_put() in a new dma_heap_close() implementation
3. a guarantee that heap implementations won't go away until the last
   ref is dropped, which means ops and all the data needed for this heap
   to satisfy ioctl()s (and more generally every passed at
   dma_heap_add() time) have to stay valid until the last ref is
   dropped. Alternatively, we could restrict this only to in-flight
   ioctl()s, and have the ops replaced by some dummy ops using RCU or a
   rwlock. But I guess live dmabufs allocated on this heap have to
   retain the heap and its implementation anyway.

For record, #3 is already not satisfied by the current tee_heap
implementation (tee_dma_heap objects can vanish before the dma_heap
object is gone). The other implementations seem to be fine because they
are statically linked, and they either have exp_info.priv set to NULL,
or something that's never released.

TLDR; the whole assumption that adding refcounting to dma_heap is
enough to guarantee safety around device/module removal is not holding,
and adding in-kernel users acquiring dma_heap refs on top of this
design is just going to make it even more painful to fix.

I see two way forward from here, either we get the
dma_heap/dma_heap-producer lifetime right from the start the way I
suggested above (I might have missed corner cases there BTW), or we keep
assuming that heaps can only ever be created, never destroyed/removed
(which is basically what the current dma_heap.c logic does, except
tee_heap.c broke that), and just let dma_heap_find() return dma_heap
pointers whose lifetime is assumed to be static.

> +}
> +
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heap, potentially freeing it
> + * @heap: DMA-Heap whose reference count to decrement
> + */
> +void dma_heap_put(struct dma_heap *heap)
> +{
> +	kref_put(&heap->refcount, dma_heap_release);

nit: I'd go

	if (heap)
		kref_put(&heap->refcount, dma_heap_release);

so users can call dma_heap_put() on NULL heaps, which usually simplify
error paths and/or destruction of partially initialized objects.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v7.0.1/source/fs/char_dev.c#L594

