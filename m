Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DD7C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 23:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS3RsGLOqDWTF/0tu9QIojAyjIMi8bf2cp1hpYeKO5M=; b=zoGJGd4h4OhSJCkzbByipzpeo9
	/K7+dpuJbu+f4ufH2ZUi3GFREs23uFZdsiKWrGoLWatzvNH9xavrszR5Y8c0pYDC4wqPdv/Jlp20D
	mz71pLMbHq70AE5m1baONYOBAKbQ+mArwGj6qo91DobKwvWvoGr1NCd/sXDAfQ+qQ8nme1wP7+vb9
	lfznfjzwSWsmiCceWSrt+MyDvNNHObB84kO+NCuUPiEO9a7PbaarJLDLUA+ntyrg/i+qMhpEWvX4O
	Wx7O4gmsCvNqzqPTRncOlkYp+izzW2w0OE33wmbyCvoV4EDyXpYr2htPn3MfPd8idh3mVRRtnt0sI
	XRedUBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMxQV-0000000ENwU-3G8z;
	Wed, 04 Jun 2025 23:21:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMxOO-0000000ENoM-3zIp;
	Wed, 04 Jun 2025 23:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749079170;
	bh=mTRCvc258jkudvZvomecwN9xV5gLl5CSYCwEsxmMdMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RMKiTRxsYuw/7GqgTwTKf2FGIC6xn9hC8jXJpdjWoeRNyZzpy4VWbA/EGF6h9TTMb
	 Ul+bq6Aawq37SBSD1Yod370/JmRXw4XG4Vrphip81LTQXi9DpeqgfcK0A/QDN/Il9x
	 RUy/nogkNeFbkdbEdJPxVRMc+i52pMEqKqSDVZdjCUxgAnpKNZvH58LKmVKuu3CnZX
	 8Nf3viuXiISMThnhBHtAjVtDpocVI1FdVA4EKYuMO3n3pNYY0dmdjth3ekn8jmiKwf
	 hT4bxc6zKtZ/XvocozUJb3CKLRlt7AL5/nbXjy/A6s/j9bsybJ+br7aw7sa9QTIRvt
	 RJdqC61qIuGxg==
Received: from [IPv6:2606:6d00:10:5285::c41] (unknown [IPv6:2606:6d00:10:5285::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B824F17E0C87;
	Thu,  5 Jun 2025 01:19:28 +0200 (CEST)
Message-ID: <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-media@vger.kernel.org, Sebastian Fricke	
 <sebastian.fricke@collabora.com>
Date: Wed, 04 Jun 2025 19:19:27 -0400
In-Reply-To: <aEC05991kEIIifDB@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
	 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
	 <aEC05991kEIIifDB@kekkonen.localdomain>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_161933_143984_97C2BD30 
X-CRM114-Status: GOOD (  44.19  )
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

Le mercredi 04 juin 2025 à 21:04 +0000, Sakari Ailus a écrit :
> Hi Nicolas,
> 
> Thanks for the update.
> 
> On Wed, Jun 04, 2025 at 04:09:35PM -0400, Nicolas Dufresne wrote:
> > From: Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > By default when the last request object is completed, the whole
> > request completes as well.
> > 
> > But sometimes you want to delay this completion to an arbitrary point in
> > time so add a manual complete mode for this.
> > 
> > In req_queue the driver marks the request for manual completion by
> > calling media_request_mark_manual_completion, and when the driver
> > wants to manually complete the request it calls
> > media_request_manual_complete().
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 73 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> > index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
> > --- a/drivers/media/mc/mc-request.c
> > +++ b/drivers/media/mc/mc-request.c
> > @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
> >  	req->access_count = 0;
> >  	WARN_ON(req->num_incomplete_objects);
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	wake_up_interruptible_all(&req->poll_wait);
> >  }
> >  
> > @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
> >  	req->mdev = mdev;
> >  	req->state = MEDIA_REQUEST_STATE_IDLE;
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	kref_init(&req->kref);
> >  	INIT_LIST_HEAD(&req->objects);
> >  	spin_lock_init(&req->lock);
> > @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
> >  
> >  	req->num_incomplete_objects--;
> >  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> > -	    !req->num_incomplete_objects) {
> > +	    !req->num_incomplete_objects && !req->manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		completed = true;
> >  		wake_up_interruptible_all(&req->poll_wait);
> > @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
> >  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> >  		goto unlock;
> >  
> > -	if (!--req->num_incomplete_objects) {
> > +	if (!--req->num_incomplete_objects && !req->manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		wake_up_interruptible_all(&req->poll_wait);
> >  		completed = true;
> > @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
> >  		media_request_put(req);
> >  }
> >  EXPORT_SYMBOL_GPL(media_request_object_complete);
> > +
> > +void media_request_manual_complete(struct media_request *req)
> > +{
> > +	unsigned long flags;
> 
> I'd declare flags as last.
> 
> > +	bool completed = false;
> > +
> > +	if (WARN_ON(!req))
> > +		return;
> > +	if (WARN_ON(!req->manual_completion))
> > +		return;
> 
> I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
> framework) bug and telling once about it is very probably enough.

Just to be sure, you only mean for the two checks above ? Or did
you mean for the entire function ?

> 
> > +
> > +	spin_lock_irqsave(&req->lock, flags);

In practice, if you call this specific function from two places at the same
time you have a bug, but I realize that moving the the warning on the check
manual_completion inside that lock would massively help detect that case.

What do you think ?

> > +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> > +		goto unlock;
> > +
> > +	req->manual_completion = false;
> > +	/*
> > +	 * It is expected that all other objects in this request are
> > +	 * completed when this function is called. WARN if that is
> > +	 * not the case.
> > +	 */
> > +	if (!WARN_ON(req->num_incomplete_objects)) {
> > +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > +		wake_up_interruptible_all(&req->poll_wait);
> > +		completed = true;
> > +	}
> 
> A newline would be nice here.
> 
> > +unlock:
> > +	spin_unlock_irqrestore(&req->lock, flags);
> > +	if (completed)
> > +		media_request_put(req);
> > +}
> > +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> > diff --git a/include/media/media-request.h b/include/media/media-request.h
> > index d4ac557678a78372222704400c8c96cf3150b9d9..7f9af68ef19ac6de0184bbb0c0827dc59777c6dc 100644
> > --- a/include/media/media-request.h
> > +++ b/include/media/media-request.h
> > @@ -56,6 +56,9 @@ struct media_request_object;
> >   * @access_count: count the number of request accesses that are in progress
> >   * @objects: List of @struct media_request_object request objects
> >   * @num_incomplete_objects: The number of incomplete objects in the request
> > + * @manual_completion: if true, then the request won't be marked as completed
> > + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
> > + * to complete the request after @num_incomplete_objects == 0.
> >   * @poll_wait: Wait queue for poll
> >   * @lock: Serializes access to this struct
> >   */
> > @@ -68,6 +71,7 @@ struct media_request {
> >  	unsigned int access_count;
> >  	struct list_head objects;
> >  	unsigned int num_incomplete_objects;
> > +	bool manual_completion;
> >  	wait_queue_head_t poll_wait;
> >  	spinlock_t lock;
> >  };
> > @@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
> >  int media_request_alloc(struct media_device *mdev,
> >  			int *alloc_fd);
> >  
> > +/**
> > + * media_request_mark_manual_completion - Enable manual completion
> > + *
> > + * @req: The request
> > + *
> > + * Mark that the request has to be manually completed by calling
> > + * media_request_manual_complete().
> > + *
> > + * This function shall be called in the req_queue callback.
> > + */
> > +static inline void
> > +media_request_mark_manual_completion(struct media_request *req)
> > +{
> > +	req->manual_completion = true;
> > +}
> > +
> > +/**
> > + * media_request_manual_complete - Mark the request as completed
> > + *
> > + * @req: The request
> > + *
> > + * This function completes a request that was marked for manual completion by an
> > + * earlier call to media_request_mark_manual_completion(). The request's
> > + * @manual_completion flag is reset to false.
> 
> s/flag/field/
> 
> > + *
> > + * All objects contained in the request must have been completed previously. It
> > + * is an error to call this function otherwise. If such an error occurred, the
> > + * function will WARN and the object completion will be delayed until
> > + * @num_incomplete_objects is 0.
> > + */
> > +void media_request_manual_complete(struct media_request *req);
> > +
> >  #else
> >  
> >  static inline void media_request_get(struct media_request *req)
> > @@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
> >   * @req: The media request
> >   * @ops: The object ops for this object
> >   * @priv: A driver-specific priv pointer associated with this object
> > - * @is_buffer: Set to true if the object a buffer object.
> > + * @is_buffer: Set to true if the object is a buffer object.
> >   * @obj: The object
> >   *
> >   * Bind this object to the request and set the ops and priv values of
> > 

