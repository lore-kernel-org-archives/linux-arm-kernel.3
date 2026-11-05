Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ACA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4bwetiJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=baRLamw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8fz6RmNx4rsL9ZO9RoSk+toa+/2KKetNvBTZ87Q/PdE=; b=L4bwetiJ8nx8Fx2yBRAk81m+5W
	1OhNBOQnHfmA56a3qQiK685WDKYYuw7PMDhXdoCzb3jC/Hxtz//ZJdUEiYyJLZ+WWYtJT1LgxhGA4
	OHyBynPruauX9bFtWOa0S6tRicwTZP+gMYyB7SuGngLaGTpfjj7aKHwl/555DaaxcdxfS9e5Lxzni
	ETcZVD15lnRb5xgBXrd7qX3ozRD8kOk24twJI+woTYa3tuh7d7AqTewQnwVFiqs/e7N6J1WE28hye
	aVJgek1V51/3F+aOe6GWtAnptChKfR2nMSjbAz1y77IU69MxbRwuu3JHJsd7ovd0gaXlr7EQol3RU
	KXlzLl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1QR-00000009yLg-2uAB;
	Thu, 05 Nov 2026 17:38:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Q2-00000009yHC-3d9z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:38:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4D3B168F;
	Thu,  5 Nov 2026 09:38:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9CA3F628;
	Thu,  5 Nov 2026 09:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793900312; bh=kQasTs69GJMYTewLpWCOSipBS9yqMY8wtuGqJ6c4A5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baRLamw0BEo+tFUEnaSWrk8Nev4Q5y0Y6eyDS+bv2ePivPxrN/r6dmXeVJw6EAruG
	 LmVvAwErn2pWSVM95ht9FO1Jat+mG0L3qVd816hE8H5/fdYhC/yFe8eoYfW8dKF/Dp
	 GuOi21pPZk+MOhq3hVAGBNMbSd7yiVE5q6xXpyWA=
Date: Thu, 5 Nov 2026 17:38:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 03/32] firmware: arm_scmi: Refactor
 __scmi_event_handler_get_ops helper
Message-ID: <auy_DP2okO9o7Yee@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-4-cristian.marussi@arm.com>
 <20261019134657.0000624a@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019134657.0000624a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_093835_750054_A5598327 
X-CRM114-Status: GOOD (  23.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 01:46:57PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:24 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Refactor the __scmi_event_handler_get_ops notification helper to simplify
> > its logic and make use of guards for locking.
> > 
> > Mostly no functional change, in the sense that while the functionality
> > remained the same, a richer set of errors is returned where before was
> > always a -EINVAL.
> 
> Maybe mention why scmi_allocate_event_handler() is now wrapped in
> an scmi_allocate_pending_event_handler()
> 
> I like the change but beyond logical division of activities it
> isn't immediately obvious why that split exists.

I'll do.

> 
> One really minor thing inline that I don't care that much about.
> 
> Anyhow, both trivial so
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/notify.c | 73 +++++++++++++++++++-----------
> >  1 file changed, 46 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index 7d1bb424a723..2bc2e03df639 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -890,7 +890,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
> >  
> >  /**
> >   * scmi_allocate_event_handler()  - Allocate Event handler
> > - * @ni: A reference to the notification instance to use
> >   * @evt_key: 32bit key uniquely bind to the event identified by the tuple
> >   *	     (proto_id, evt_id, src_id)
> >   *
> > @@ -903,8 +902,7 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
> >   * Context: Assumes to be called with @pending_mtx already acquired.
> >   * Return: the freshly allocated structure on Success
> >   */
> > -static struct scmi_event_handler *
> > -scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> > +static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
> >  {
> >  	struct scmi_event_handler *hndl;
> >  
> > @@ -914,8 +912,20 @@ scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> >  	hndl->key = evt_key;
> >  	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
> >  	refcount_set(&hndl->users, 1);
> > -	/* New handlers are created pending */
> > -	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> > +
> > +	return hndl;
> > +}
> > +
> > +static struct scmi_event_handler *
> > +scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni,
> > +				    u32 evt_key)
> > +{
> > +	struct scmi_event_handler *hndl;
> > +
> > +	lockdep_assert_held(&ni->pending_mtx);
> > +	hndl =  scmi_allocate_event_handler(evt_key);
> > +	if (hndl)
> > +		hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> Trivial but I'd keep to a strict errors out of line
> 	if (!hndl)
> 		return NULL
> 
> 	hash_add(ni->...
> 	
> 	return hndl;
> 
> It burns a few lines be saves a few brain cells.
> 

yes, I prefer this too...I'll do.

Thanks,
Cristian

