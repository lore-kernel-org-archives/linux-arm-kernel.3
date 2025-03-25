Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAA0C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 06:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cabdp+J48/jMj4UOHt6oDRI4QF5eNN027JIUPFQOZpw=; b=fJl8AtG4Q1v/rjCygRBiyUfdgu
	cV0lkDc9dbZ7ENWDYmLnpt0GVoWUtmsaR/BEZQB9EsLKlbaFocgUP47kUlvoGcaGyToMQbkHeVC5k
	rXz69QXlD3Kh2GZF0L1ol98mKwNPEWmDtZC4vTztanAg4kGsUxld1e9e/Yrtto0RJRhOhM9ShDqvB
	XsN6Ycy/Us6bNFraUKjM85BrzdUpB+4wf2xnDTN6DO4RwM3U0FK8HvVXlT3LquRfDoIwB/zDNKaXN
	LPiRaXxWoqa7tAlIk90ga0b+G/ZUNTzjJYciElYzD39rQF1JUnOfULBtbas6shTuHQTU9b5nByHS+
	3YeYdMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyCL-000000050fX-0ymK;
	Tue, 25 Mar 2025 06:55:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyAd-000000050Tl-3Ykp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 06:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2938A6111E;
	Tue, 25 Mar 2025 06:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D66C4CEE8;
	Tue, 25 Mar 2025 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742885634;
	bh=kjvYmCQ8Y/WN+yHilTtN81fEcJrveiY+q5nnPqA3msc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSf3uNv5Rw+J8RXCaL/dj8yWijjd1ot7Zs1EcpoC0IFPkR0SszCUJUn/LyPwsG/NY
	 Q7N0ASaAzMMo61I4JF94CkeEkO7tKjp+pIIaXrbSAg8fdozuKrnv0FXlsAIaJCUagF
	 vuR2DSvIk3a2B4+fu9j51sU+JLb092Sh5rJOmNFMO2679kZQuaYVHt/BdCbbJRcrp/
	 mY30UVqS/EvUNmK4VB5FLb1a7mzRopHztnsbyYItn8vrGPPtc4cpbflHFXaJH1Crb5
	 9Jbgs2og3TemIMLi4V77jyNixRxRd4xOQhHCWhPfO0kEsynuJVS87gWnHChOBi7U/F
	 bsa/GP8WvQd3A==
Date: Tue, 25 Mar 2025 12:23:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 07/10] tee: add tee_shm_alloc_cma_phys_mem()
Message-ID: <Z-JS-Tq_lxGAZfiP@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-8-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-8-jens.wiklander@linaro.org>
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

Hi Jens,

On Wed, Mar 05, 2025 at 02:04:13PM +0100, Jens Wiklander wrote:
> Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> from the default CMA pool. The memory is represented by a tee_shm object
> using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> from CMA.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
>  include/linux/tee_core.h |  4 +++
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 8b79918468b5..8d8341f8ebd7 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -3,8 +3,11 @@
>   * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
>   */
>  #include <linux/anon_inodes.h>
> +#include <linux/cma.h>
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/highmem.h>
>  #include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> @@ -13,7 +16,6 @@
>  #include <linux/tee_core.h>
>  #include <linux/uaccess.h>
>  #include <linux/uio.h>
> -#include <linux/highmem.h>
>  #include "tee_private.h"
>  
>  /* extra references appended to shm object for registered shared memory */
> @@ -59,7 +61,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  	struct tee_shm *parent_shm = NULL;
>  	void *p = shm;
>  
> -	if (shm->flags & TEE_SHM_DMA_BUF) {
> +	if (shm->flags & TEE_SHM_CMA_BUF) {
> +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)

Can we rather manage this dependency via Kconfig?

> +		struct page *page = phys_to_page(shm->paddr);
> +		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
> +
> +		cma_release(cma, page, shm->size / PAGE_SIZE);
> +#endif
> +	} else if (shm->flags & TEE_SHM_DMA_BUF) {
>  		struct tee_shm_dmabuf_ref *ref;
>  
>  		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> @@ -341,6 +350,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>  
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align)
> +{
> +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)

Ditto here.

-Sumit

> +	struct tee_device *teedev = ctx->teedev;
> +	struct cma *cma = dev_get_cma_area(&teedev->dev);
> +	struct tee_shm *shm;
> +	struct page *page;
> +
> +	if (!tee_device_get(teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	page = cma_alloc(cma, page_count, align, true/*no_warn*/);
> +	if (!page)
> +		goto err_put_teedev;
> +
> +	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
> +	if (!shm)
> +		goto err_cma_crelease;
> +
> +	refcount_set(&shm->refcount, 1);
> +	shm->ctx = ctx;
> +	shm->paddr = page_to_phys(page);
> +	shm->size = page_count * PAGE_SIZE;
> +	shm->flags = TEE_SHM_CMA_BUF;
> +
> +	teedev_ctx_get(ctx);
> +
> +	return shm;
> +
> +err_cma_crelease:
> +	cma_release(cma, page, page_count);
> +err_put_teedev:
> +	tee_device_put(teedev);
> +
> +	return ERR_PTR(-ENOMEM);
> +#else
> +	return ERR_PTR(-EINVAL);
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
> +
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 6bd833b6d0e1..b6727d9a3556 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -29,6 +29,7 @@
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
>  #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
> +#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
>  
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
> @@ -307,6 +308,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
>   */
>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
>  
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align);
> +
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> -- 
> 2.43.0
> 

