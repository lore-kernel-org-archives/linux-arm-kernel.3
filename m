Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D88D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdiIDMjT6U7gnpeUR5pH8VP7V3AkpC/YLt5uohRVR1g=; b=yJnfYHSWWxYhJSZqkqs/PqPn7p
	7I6p8tl1sNQ4vMQrf6/hTJRkyFel2fCWk1qwDJunjuD2/TzP6bVbUSebvAg3nTbt/dzmO+lYVj3Oe
	+nWw77pgZJarXXNrSs/Cj+WWLYRPQtvs/WQ4YJ5M6awnJqF80TSpwV2bs1EZM4CFVBFA3Ef/8BDpa
	u1ov2UqvqSv/p8ZlMGIoXlWP7Cecp8z5H7ojabiqlrA8mKuQdKPlDicwwPDNTZPr5+IlSRFUtXGEL
	NS5xZ0WmFDTYm4Do2QKZoza4lxic1BQEjGfy6IEoEhRq+AuIGA+Qi+Szf3x8ocQh+MAYrE7/Tyubg
	wLzDX8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1J9-00000003Lgf-24DD;
	Mon, 01 Dec 2025 10:39:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1J8-00000003LgL-1K6p;
	Mon, 01 Dec 2025 10:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 690A760121;
	Mon,  1 Dec 2025 10:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41D4C4CEF1;
	Mon,  1 Dec 2025 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764585541;
	bh=7otL5ZpSjHqKVAsGUZwGGCooAKXLD8oQRR5TSq1M7g0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GNh+5vzg472/kaEpWox0DRBdneMiT3C2i8SgfXRGwMw3DD2KHUHEX2z8498ySfcDp
	 W418/y6q7dHvLL5B/IlTdldGOrVCvZoNhFWGd7Y1RAo3ngAORaGqw8wVRSZu8o5bS1
	 oPuYcK5H4mP9AZlziA+Nhd55DBHkZFx/ISJBqZcudW/ypsRUiNgRSMLIX7oCPI+qK8
	 6ugzS31Es6VgXhhNJSKPyoBNUzYMsrELG+6KD5AYgR9PO2FBGoy9kwKmV1/11Ty3ka
	 XMgu0sUb5R/VC2e5Qe9hGiQqkZCAgE4JJek365j8gBB7L3DbOIDO2OaOnZeNeia0k3
	 ZenPh0/xUb0fg==
Message-ID: <fcfe2672-b546-4f3f-8418-71ee8ce1fb5d@kernel.org>
Date: Mon, 1 Dec 2025 11:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 1/5] media: mc: add manual request completion
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
 <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-1-c166bdd4625c@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-1-c166bdd4625c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Nicolas,

On 28/11/2025 20:16, Nicolas Dufresne wrote:
> From: Hans Verkuil <hverkuil@kernel.org>
> 
> By default when the last request object is completed, the whole
> request completes as well.
> 
> But sometimes you want to delay this completion to an arbitrary point in
> time so add a manual complete mode for this.
> 
> In req_queue the driver marks the request for manual completion by
> calling media_request_mark_manual_completion, and when the driver
> wants to manually complete the request it calls
> media_request_manual_complete().
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

For this patch and the other patches with this xs4all SoB, can you replace it with:

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Much appreciated,

	Hans

> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/mc/mc-request.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index f66f728b1b43dcd1cf51de46e828bf806f014f8d..512e6969152792558537dd8a0736df82847ae210 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
>  	req->access_count = 0;
>  	WARN_ON(req->num_incomplete_objects);
>  	req->num_incomplete_objects = 0;
> +	req->manual_completion = false;
>  	wake_up_interruptible_all(&req->poll_wait);
>  }
>  
> @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  	req->mdev = mdev;
>  	req->state = MEDIA_REQUEST_STATE_IDLE;
>  	req->num_incomplete_objects = 0;
> +	req->manual_completion = false;
>  	kref_init(&req->kref);
>  	INIT_LIST_HEAD(&req->objects);
>  	spin_lock_init(&req->lock);
> @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
>  
>  	req->num_incomplete_objects--;
>  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> -	    !req->num_incomplete_objects) {
> +	    !req->num_incomplete_objects && !req->manual_completion) {
>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>  		completed = true;
>  		wake_up_interruptible_all(&req->poll_wait);
> @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
>  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>  		goto unlock;
>  
> -	if (!--req->num_incomplete_objects) {
> +	if (!--req->num_incomplete_objects && !req->manual_completion) {
>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>  		wake_up_interruptible_all(&req->poll_wait);
>  		completed = true;
> @@ -499,3 +501,38 @@ void media_request_object_complete(struct media_request_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_manual_complete(struct media_request *req)
> +{
> +	bool completed = false;
> +	unsigned long flags;
> +
> +	if (WARN_ON_ONCE(!req))
> +		return;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +
> +	if (WARN_ON_ONCE(!req->manual_completion))
> +		goto unlock;
> +
> +	if (WARN_ON_ONCE(req->state != MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +
> +	req->manual_completion = false;
> +	/*
> +	 * It is expected that all other objects in this request are
> +	 * completed when this function is called. WARN if that is
> +	 * not the case.
> +	 */
> +	if (!WARN_ON(req->num_incomplete_objects)) {
> +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> +		wake_up_interruptible_all(&req->poll_wait);
> +		completed = true;
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> diff --git a/include/media/media-request.h b/include/media/media-request.h
> index bb500b2f9da46f5a9a84272759a137720b094a80..3256fcf3709da58878a59d90722bee3224d97af6 100644
> --- a/include/media/media-request.h
> +++ b/include/media/media-request.h
> @@ -56,6 +56,9 @@ struct media_request_object;
>   * @access_count: count the number of request accesses that are in progress
>   * @objects: List of @struct media_request_object request objects
>   * @num_incomplete_objects: The number of incomplete objects in the request
> + * @manual_completion: if true, then the request won't be marked as completed
> + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
> + * to complete the request after @num_incomplete_objects == 0.
>   * @poll_wait: Wait queue for poll
>   * @lock: Serializes access to this struct
>   */
> @@ -68,6 +71,7 @@ struct media_request {
>  	unsigned int access_count;
>  	struct list_head objects;
>  	unsigned int num_incomplete_objects;
> +	bool manual_completion;
>  	wait_queue_head_t poll_wait;
>  	spinlock_t lock;
>  };
> @@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
>  int media_request_alloc(struct media_device *mdev,
>  			int *alloc_fd);
>  
> +/**
> + * media_request_mark_manual_completion - Enable manual completion
> + *
> + * @req: The request
> + *
> + * Mark that the request has to be manually completed by calling
> + * media_request_manual_complete().
> + *
> + * This function shall be called in the req_queue callback.
> + */
> +static inline void
> +media_request_mark_manual_completion(struct media_request *req)
> +{
> +	req->manual_completion = true;
> +}
> +
> +/**
> + * media_request_manual_complete - Mark the request as completed
> + *
> + * @req: The request
> + *
> + * This function completes a request that was marked for manual completion by an
> + * earlier call to media_request_mark_manual_completion(). The request's
> + * @manual_completion field is reset to false.
> + *
> + * All objects contained in the request must have been completed previously. It
> + * is an error to call this function otherwise. If such an error occurred, the
> + * function will WARN and the object completion will be delayed until
> + * @num_incomplete_objects is 0.
> + */
> +void media_request_manual_complete(struct media_request *req);
> +
>  #else
>  
>  static inline void media_request_get(struct media_request *req)
> @@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
>   * @req: The media request
>   * @ops: The object ops for this object
>   * @priv: A driver-specific priv pointer associated with this object
> - * @is_buffer: Set to true if the object a buffer object.
> + * @is_buffer: Set to true if the object is a buffer object.
>   * @obj: The object
>   *
>   * Bind this object to the request and set the ops and priv values of
> 


