Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B930DC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7trlcsG1krKbhyG6JNZNy4KP8suxB7I8zy8DcqWE90=; b=SxJdukA7bmC3/Yo7wze7f87vFN
	YMWIVHwxsDlo+RP3nf2d4E0bbjfLjAHl7GvvtFExmVckjNqnX1Ha3pZmtqhp0UL2kypCem6vGAnkm
	8MZTYaTE3XcIEzfIIWgIUq9MWWJ0SMOxAiTizx3G975Ed9z0XJLTjToCtmVP0urPK9kArxggSRYF4
	SB5r3Fa/1mQYhPgWpLI1YQtElFMycA3LSB5uu40Tiy71//KqJLr69vblG6lDRxF5Fz+4Q/RmLvJzh
	uXpr6eQ8yFwzrOhyuQWJ2Hk5Ngb7MJRcO4rXfTV/9Unx+P+uyFYBkN+5Is7SswsTsuMJsTzgfxwKC
	DHIavjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaDb-00000003y6B-0tr8;
	Mon, 09 Jun 2025 10:59:07 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZka-00000003uQl-3UKc;
	Mon, 09 Jun 2025 10:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749464949; x=1781000949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=b81GxXQOgz++9oTBAz/FoXRwlEIZehWSTem3SGxqML4=;
  b=HEzJO5tuCxssG/bSoNZZ9NOKUYwgZF7PxolXflnKHPQLJfPzT4geyto0
   Aj5znwTtfP17W0D87WKAbKNtzYIlVyAkhPOhlLWOcFdPCGMontB12L9+r
   FWTiC9F8lwA2+OXQV9n2ldY8J4p0Kn+K8hBvK/oo8qvUYrS/+YJeP0Nwr
   D2C5BIgUaimz7tMFz6vaO2osTv7u7mJniybkLkBGaxRg1l+esZxVQwu7/
   mH7dqegfXEKv2qbhB6uzDRGX+OpUzjPOkr78+8f3zjLL8UY3r08j3IoT8
   u43qEehxacjy0LAfjYCPLUnzMcr4zGnIQKaWUk2ZFFigIz54HeosjQHu0
   g==;
X-CSE-ConnectionGUID: OR0NWILSTQKeEJHclhpA1g==
X-CSE-MsgGUID: 3UmV6aUPQIGRGjbp6h0frg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62937884"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62937884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:29:06 -0700
X-CSE-ConnectionGUID: kw74qhyMR2WiVaCdt2Xedw==
X-CSE-MsgGUID: /Wqtw3bBSGKJCNaG4QUKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151292359"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:29:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 14D9511FBC0;
	Mon,  9 Jun 2025 13:28:59 +0300 (EEST)
Date: Mon, 9 Jun 2025 10:28:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 3/5] media: mc: add debugfs node to keep track of
 requests
Message-ID: <aEa3azYxM5Sc6cZC@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-3-603db4749d90@collabora.com>
 <aEC7jMDgRAg1cfXZ@kekkonen.localdomain>
 <870611a1e5d21fa375dd9359192641484c1c0e76.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870611a1e5d21fa375dd9359192641484c1c0e76.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032908_949071_6BFD54D8 
X-CRM114-Status: GOOD (  43.21  )
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

On Wed, Jun 04, 2025 at 07:08:53PM -0400, Nicolas Dufresne wrote:
> Le mercredi 04 juin 2025 à 21:33 +0000, Sakari Ailus a écrit :
> > Hi Nicolas, Hans,
> > 
> > Thanks for the update.
> 
> thanks for the review, these things are precious.
> 
> > 
> > On Wed, Jun 04, 2025 at 04:09:37PM -0400, Nicolas Dufresne wrote:
> > > From: Hans Verkuil <hverkuil@xs4all.nl>
> > > 
> > > Keep track of the number of requests and request objects of a media
> > > device. Helps to verify that all request-related memory is freed.
> > > 
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >  drivers/media/mc/mc-device.c  | 30 ++++++++++++++++++++++++++++++
> > >  drivers/media/mc/mc-devnode.c |  5 +++++
> > >  drivers/media/mc/mc-request.c |  6 ++++++
> > >  include/media/media-device.h  |  9 +++++++++
> > >  include/media/media-devnode.h |  4 ++++
> > >  include/media/media-request.h |  2 ++
> > >  6 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > > index c0dd4ae5722725f1744bc6fd6282d5c765438059..5a458160200afb540d8014fed42d8bf2dab9c8c3 100644
> > > --- a/drivers/media/mc/mc-device.c
> > > +++ b/drivers/media/mc/mc-device.c
> > > @@ -679,6 +679,23 @@ void media_device_unregister_entity(struct media_entity *entity)
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
> > >  
> > > +#ifdef CONFIG_DEBUG_FS
> > > +/*
> > > + * Log the state of media requests.
> > > + * Very useful for debugging.
> > > + */
> > 
> > Fits on a single line.
> 
> Ack.
> 
> > 
> > > +static int media_device_requests(struct seq_file *file, void *priv)
> > > +{
> > > +	struct media_device *dev = dev_get_drvdata(file->private);
> > > +
> > > +	seq_printf(file, "number of requests: %d\n",
> > > +		   atomic_read(&dev->num_requests));
> > > +	seq_printf(file, "number of request objects: %d\n",
> > > +		   atomic_read(&dev->num_request_objects));
> > 
> > Newline here?
> 
> I prefer that too.
> 
> > 
> > > +	return 0;
> > > +}
> > > +#endif
> > > +
> > >  void media_device_init(struct media_device *mdev)
> > >  {
> > >  	INIT_LIST_HEAD(&mdev->entities);
> > > @@ -697,6 +714,9 @@ void media_device_init(struct media_device *mdev)
> > >  		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
> > >  				   mdev->dev);
> > >  
> > > +	atomic_set(&mdev->num_requests, 0);
> > > +	atomic_set(&mdev->num_request_objects, 0);
> > > +
> > >  	dev_dbg(mdev->dev, "Media device initialized\n");
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_device_init);
> > > @@ -748,6 +768,15 @@ int __must_check __media_device_register(struct media_device *mdev,
> > >  
> > >  	dev_dbg(mdev->dev, "Media device registered\n");
> > >  
> > > +#ifdef CONFIG_DEBUG_FS
> > > +	if (!media_debugfs_root)
> > > +		media_debugfs_root = debugfs_create_dir("media", NULL);
> > > +	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
> > > +					     media_debugfs_root);
> > > +	debugfs_create_devm_seqfile(&devnode->dev, "requests",
> > > +				    mdev->media_dir, media_device_requests);
> > > +#endif
> > 
> > I have no objection to this but it would have been great to have the Media
> > device lifetime set in first and MC device and devnode merged. But maybe
> > it's too late for that. Well, at least this won't change error handling...
> 
> Since this specific patch is not required to fix the MTK VCODEC issue, I can
> delay this a little. Is that comment related to an existing patch ?

Yes.

I've pushed the current set here:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=media-ref>. I've
rebased it recently but it's still WiP.

...

> > > diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> > > index d27c1c646c2805171be3997d72210dd4d1a38e32..dbcabeffcb572ae707f5fe1f51ff719d451c6784 100644
> > > --- a/include/media/media-devnode.h
> > > +++ b/include/media/media-devnode.h
> > > @@ -20,9 +20,13 @@
> > >  #include <linux/fs.h>
> > >  #include <linux/device.h>
> > >  #include <linux/cdev.h>
> > > +#include <linux/debugfs.h>
> > >  
> > >  struct media_device;
> > >  
> > > +/* debugfs top-level media directory */
> > > +extern struct dentry *media_debugfs_root;
> > > +
> > >  /*
> > >   * Flag to mark the media_devnode struct as registered. Drivers must not touch
> > >   * this flag directly, it will be set and cleared by media_devnode_register and
> > > diff --git a/include/media/media-request.h b/include/media/media-request.h
> > > index 7f9af68ef19ac6de0184bbb0c0827dc59777c6dc..610ccfe8d7b20ec38e166383433f9ee208248640 100644
> > > --- a/include/media/media-request.h
> > > +++ b/include/media/media-request.h
> > > @@ -292,6 +292,7 @@ struct media_request_object_ops {
> > >   * struct media_request_object - An opaque object that belongs to a media
> > >   *				 request
> > >   *
> > > + * @mdev: Media device this object belongs to
> > 
> > This deserves at least a comment what this may be used for: generally once
> > object is unbound, it's not related to a request anymore (nor a Media
> > device). This field also adds a new Media device lifetime issue: nothing
> 
> We could make it explicit by clearing the mdev pointer ?

That would probably be out of scope of this patch(set). Also see the
patchset I referred to earlier.

> 
> > guarantees the mdev is not disappearing at a wrong time albeit this is
> > very, very likely not user-triggerable without physically removing
> > hardware.
> 
> I'm not too familiar with the subject, if the MC knows it has open request
> FD(s), why would it allow userspace from unloading its module ?

Drivers nor MC currently have a list of request file handles.

Apart from the file handles, that was the original thinking, yes, but
devices can be also unbound without touching the driver (or other) modules.

> 
> > 
> > >   * @ops: object's operations
> > >   * @priv: object's priv pointer
> > >   * @req: the request this object belongs to (can be NULL)
> > > @@ -303,6 +304,7 @@ struct media_request_object_ops {
> > >   * another struct that contains the actual data for this request object.
> > >   */
> > >  struct media_request_object {
> > > +	struct media_device *mdev;
> > >  	const struct media_request_object_ops *ops;
> > >  	void *priv;
> > >  	struct media_request *req;
> > > 

-- 
Kind regards,

Sakari Ailus

