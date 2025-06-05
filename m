Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3534C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9WazpzKcumwLrqZyJ4/uWFbtdp85eK2+cFv/S9/2yA=; b=umMVHKJVs9QCyo1NsLzbkcFTN2
	ra8zgYQbE2GTGP5QT10dQIW0YEd+dE3mTd+iO9cEn9+MhZG0mTc1Q81CBpcYIMG19OvhtIZgYds4K
	3g1+T/n9Z+eyv2FUAo7/QOR+rm0yLUt3EVf0tVLVvToTsAS0V5jlyOcB6SEJHYCj0KK8ZZ5og3bCo
	l/TdmRnXA/k32RjAII1FjwCEqTj3HwedRGMfQwvxA/YYLVjPfFfHczlHDPEWRJzjbcroJdauK3X4U
	7CKjTX/Y//f/lFzfJMXT7HGatcqNVT6mISMGCAgh3d1BHaEqJvSbur2yQbk/Os58+6TvW8i0qvpli
	K+7J3d1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN75B-0000000FBCU-4AVn;
	Thu, 05 Jun 2025 09:40:22 +0000
Received: from dane.soverin.net ([185.233.34.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN72w-0000000FAzq-1fKE;
	Thu, 05 Jun 2025 09:38:06 +0000
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bCfWR6KG9z1Sm4;
	Thu,  5 Jun 2025 09:37:55 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bCfWQ60tpz4M;
	Thu,  5 Jun 2025 09:37:54 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=r3an6fmG;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1749116275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9WazpzKcumwLrqZyJ4/uWFbtdp85eK2+cFv/S9/2yA=;
	b=r3an6fmGZTBObi6EKTD2YCpu6SNkYb9IRdGwEFcPL7mXbGnavNUMRQU9c5j0KWJQuDUCYA
	I920bDJPn5zPmnpb1IHBoqrQDWw4eLeeJoK+YIMQ7sHVa1G/YWCDuGp8tTBR77/AZFVVhK
	SVdxDJ37Vd4dS3wAgM499YVDD0tvBjjpV7/IYAHQ5GTI1MfldaKLbm72p5IRuvpJ2Z/Nda
	yEO+e744hng5s9tJZGB0HydlMt0LDKs6w01YELc9gRoskvq0f+w1lKoASYOBkyNT1GY2cs
	O/Q+xgkfsMxzevT60T63Hy7+X5wBmE33Ywxjaw5oj86Yee03d1R8OtRUKAwmfA==
X-CM-Envelope: MS4xfPNnir3sPSCo/uIfr9wdSIkrlJmw7w2T4mmt9sw3/63llGQMHPmnbKjnWOlPM3fz2++hGJ1vHhdK55sXbwmuzmYAEPTGHGINjMs0DvGUDV5RloKBexeb dcCbmYY6WggIobwm6ieNLQcBrqB46U0WbiKlNc8RmlT0cv9hgubja+Heq+TvCml5YqzxgYZ52GQc1FmNqzXdoCmrtcFX752w+DToG14drept+ygZTssrfyY+ bsR3+CxmFZ54H/KAR9Rn0+171nzGsiFPNonkJPNN8JEp0b8iNH4BLEJGpQkPJq/Ol6DmHbq+w4NkbUYEKD6racwi36/9K23OgKud0heUgvLeZ4aaFhxSQix+ 59T0NUAnsNR6Uxo05lMCfUzcwGmYE1Ci2Xstq6G4uvrGcRZTZqRI4FIHGjJBA27AQh3BY6tBCi7xdidFVOiurjDr32fAGdTq/XkpjcwsaKnv5b4inHW2LCNC CXRwvT3HPhL9Hse8OkOHw2ZwgKxjXMCXiTiWZz5wHiO59CkyU4ASf8dniasjpK3fmwq+Lif0apyOFcEUpdy7AGvwFeGKgZ4vjxN0ICc1ECF8wuhqE9T586Mg 0EqaVmFoz4iPSv/nBnZgqjpGBDv4F1Vi17SMvp6eFdI4ViUPPVqHPSbl56p8NksFPlhgF/5UhGJ9gJoPYUJNLs0CKMN+1QRz/PLu/tCj5lGG3Gxrlj/h4INN n5v8LK6+N4hCy2nh5JgI3g2vujh0Q0Qk78qxmAXdn6csLZgcl8tx3v69MMDdhIiP2yhKQTajirXdQa4Scns4iUx+hNuzxUz1dPm1MoZcxYoSOba16nhHPDrw jox0NopQoL3x7/SyzwqMbqGTjHSjdsUX31WVBmt/pDUvVA4KkoAepyOBP6z6F0+3vliOpe3ItldFVDzulB1e04Hy2Ncg8zHsm6DaFsBr
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68416573 a=rRPUdUMkfOuWADC4PY0RbA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=QX4gbG5DAAAA:8 a=7u75VyA4us0rJz3QA60A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
Message-ID: <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
Date: Thu, 5 Jun 2025 11:37:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
From: Hans Verkuil <hans@jjverkuil.nl>
In-Reply-To: <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_023803_491392_157E15C4 
X-CRM114-Status: GOOD (  32.66  )
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

On 6/5/25 08:51, Sakari Ailus wrote:
> Hi Nicolas,
> 
> On Wed, Jun 04, 2025 at 07:19:27PM -0400, Nicolas Dufresne wrote:
>> Le mercredi 04 juin 2025 à 21:04 +0000, Sakari Ailus a écrit :
>>> Hi Nicolas,
>>>
>>> Thanks for the update.
>>>
>>> On Wed, Jun 04, 2025 at 04:09:35PM -0400, Nicolas Dufresne wrote:
>>>> From: Hans Verkuil <hverkuil@xs4all.nl>
>>>>
>>>> By default when the last request object is completed, the whole
>>>> request completes as well.
>>>>
>>>> But sometimes you want to delay this completion to an arbitrary point in
>>>> time so add a manual complete mode for this.
>>>>
>>>> In req_queue the driver marks the request for manual completion by
>>>> calling media_request_mark_manual_completion, and when the driver
>>>> wants to manually complete the request it calls
>>>> media_request_manual_complete().
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>> ---
>>>>  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
>>>>  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
>>>>  2 files changed, 73 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
>>>> index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
>>>> --- a/drivers/media/mc/mc-request.c
>>>> +++ b/drivers/media/mc/mc-request.c
>>>> @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
>>>>  	req->access_count = 0;
>>>>  	WARN_ON(req->num_incomplete_objects);
>>>>  	req->num_incomplete_objects = 0;
>>>> +	req->manual_completion = false;
>>>>  	wake_up_interruptible_all(&req->poll_wait);
>>>>  }
>>>>  
>>>> @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>>>>  	req->mdev = mdev;
>>>>  	req->state = MEDIA_REQUEST_STATE_IDLE;
>>>>  	req->num_incomplete_objects = 0;
>>>> +	req->manual_completion = false;
>>>>  	kref_init(&req->kref);
>>>>  	INIT_LIST_HEAD(&req->objects);
>>>>  	spin_lock_init(&req->lock);
>>>> @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
>>>>  
>>>>  	req->num_incomplete_objects--;
>>>>  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
>>>> -	    !req->num_incomplete_objects) {
>>>> +	    !req->num_incomplete_objects && !req->manual_completion) {
>>>>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>>>  		completed = true;
>>>>  		wake_up_interruptible_all(&req->poll_wait);
>>>> @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
>>>>  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>>>>  		goto unlock;
>>>>  
>>>> -	if (!--req->num_incomplete_objects) {
>>>> +	if (!--req->num_incomplete_objects && !req->manual_completion) {
>>>>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>>>  		wake_up_interruptible_all(&req->poll_wait);
>>>>  		completed = true;
>>>> @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
>>>>  		media_request_put(req);
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(media_request_object_complete);
>>>> +
>>>> +void media_request_manual_complete(struct media_request *req)
>>>> +{
>>>> +	unsigned long flags;
>>>
>>> I'd declare flags as last.
>>>
>>>> +	bool completed = false;
>>>> +
>>>> +	if (WARN_ON(!req))
>>>> +		return;
>>>> +	if (WARN_ON(!req->manual_completion))
>>>> +		return;
>>>
>>> I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
>>> framework) bug and telling once about it is very probably enough.
>>
>> Just to be sure, you only mean for the two checks above ? Or did
>> you mean for the entire function ?
> 
> For the entire function. I thought that if this is user-triggerable, the
> amount of data ending up in logs could be very large.

It's not user-triggerable, if this happens, then it is a driver bug.

Regards,

	Hans

> 
>>
>>>
>>>> +
>>>> +	spin_lock_irqsave(&req->lock, flags);
>>
>> In practice, if you call this specific function from two places at the same
>> time you have a bug, but I realize that moving the the warning on the check
>> manual_completion inside that lock would massively help detect that case.
>>
>> What do you think ?
> 
> Seems reasonable to me.
> 
>>
>>>> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>>>> +		goto unlock;
>>>> +
>>>> +	req->manual_completion = false;
>>>> +	/*
>>>> +	 * It is expected that all other objects in this request are
>>>> +	 * completed when this function is called. WARN if that is
>>>> +	 * not the case.
>>>> +	 */
>>>> +	if (!WARN_ON(req->num_incomplete_objects)) {
>>>> +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>>> +		wake_up_interruptible_all(&req->poll_wait);
>>>> +		completed = true;
>>>> +	}
>>>
>>> A newline would be nice here.
>>>
>>>> +unlock:
>>>> +	spin_unlock_irqrestore(&req->lock, flags);
>>>> +	if (completed)
>>>> +		media_request_put(req);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
>>>> diff --git a/include/media/media-request.h b/include/media/media-request.h
>>>> index d4ac557678a78372222704400c8c96cf3150b9d9..7f9af68ef19ac6de0184bbb0c0827dc59777c6dc 100644
>>>> --- a/include/media/media-request.h
>>>> +++ b/include/media/media-request.h
>>>> @@ -56,6 +56,9 @@ struct media_request_object;
>>>>   * @access_count: count the number of request accesses that are in progress
>>>>   * @objects: List of @struct media_request_object request objects
>>>>   * @num_incomplete_objects: The number of incomplete objects in the request
>>>> + * @manual_completion: if true, then the request won't be marked as completed
>>>> + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
>>>> + * to complete the request after @num_incomplete_objects == 0.
>>>>   * @poll_wait: Wait queue for poll
>>>>   * @lock: Serializes access to this struct
>>>>   */
>>>> @@ -68,6 +71,7 @@ struct media_request {
>>>>  	unsigned int access_count;
>>>>  	struct list_head objects;
>>>>  	unsigned int num_incomplete_objects;
>>>> +	bool manual_completion;
>>>>  	wait_queue_head_t poll_wait;
>>>>  	spinlock_t lock;
>>>>  };
>>>> @@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
>>>>  int media_request_alloc(struct media_device *mdev,
>>>>  			int *alloc_fd);
>>>>  
>>>> +/**
>>>> + * media_request_mark_manual_completion - Enable manual completion
>>>> + *
>>>> + * @req: The request
>>>> + *
>>>> + * Mark that the request has to be manually completed by calling
>>>> + * media_request_manual_complete().
>>>> + *
>>>> + * This function shall be called in the req_queue callback.
>>>> + */
>>>> +static inline void
>>>> +media_request_mark_manual_completion(struct media_request *req)
>>>> +{
>>>> +	req->manual_completion = true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * media_request_manual_complete - Mark the request as completed
>>>> + *
>>>> + * @req: The request
>>>> + *
>>>> + * This function completes a request that was marked for manual completion by an
>>>> + * earlier call to media_request_mark_manual_completion(). The request's
>>>> + * @manual_completion flag is reset to false.
>>>
>>> s/flag/field/
>>>
>>>> + *
>>>> + * All objects contained in the request must have been completed previously. It
>>>> + * is an error to call this function otherwise. If such an error occurred, the
>>>> + * function will WARN and the object completion will be delayed until
>>>> + * @num_incomplete_objects is 0.
>>>> + */
>>>> +void media_request_manual_complete(struct media_request *req);
>>>> +
>>>>  #else
>>>>  
>>>>  static inline void media_request_get(struct media_request *req)
>>>> @@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
>>>>   * @req: The media request
>>>>   * @ops: The object ops for this object
>>>>   * @priv: A driver-specific priv pointer associated with this object
>>>> - * @is_buffer: Set to true if the object a buffer object.
>>>> + * @is_buffer: Set to true if the object is a buffer object.
>>>>   * @obj: The object
>>>>   *
>>>>   * Bind this object to the request and set the ops and priv values of
>>>>
> 


