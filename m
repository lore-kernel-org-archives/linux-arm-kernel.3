Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FeUn+ljPUYpC18LnCgr5Z2afA+HbBZdyhS8ylWX4DY=; b=DHC4Ogv/+wi3N4ayr7d1bA/Csc
	OrRvWcwxokIjqNXZcHSp3HLjlTDgAsREJrGlR/DiiksVdvvGMYTuqaqIrF+7wSnY432tx/MVEA52Y
	6Pa2Lx19conuNwOWa+Pp6+ZgBZJHjwa55e9hw/H7FR+fMwJ5maPuK8G6zscVUFVnt9gsOVgMi+Rme
	t2XEVhKSOUCgBg+/ZqXeJI+yiFI/nyAHXoo8eQRqAeKrcSZPRctStAOqoEzssuwtb8z+T+4/ajUCI
	pp6IZ6EyGR/qA/6zv5EDysba15+nXIyIo/gibQuaI+/B5ezMKvV0actf5ttfft3iNCZEG+BZrHu5j
	5GV+0SBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnuF-0000000AoT5-3wKX;
	Tue, 26 Aug 2025 07:15:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnkU-0000000AnIa-35JL;
	Tue, 26 Aug 2025 07:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA94A5C5460;
	Tue, 26 Aug 2025 07:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06816C4CEF1;
	Tue, 26 Aug 2025 07:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756191941;
	bh=7qCosOKQzPttR2ozoEnNoiQAcvIcUUwRHGQgkQxhf7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1iWvyg9wPFRd8wynCUuVyy+JIseZ4oHLPeJd5WTr8fbENzC2dGhUaY3809sgpYkkN
	 X8WHpf7/uft4OQEZjpX7wu98Nc2gyIjOoplh1O63ha3OgNRk8zhtcLeT3cGnDPqwph
	 iHo+IxLl/cpGeyBoFTwa2nNpH/ZBR+w09Cm6/SK8=
Date: Tue, 26 Aug 2025 09:05:37 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Xion Wang =?utf-8?B?KOeOi+mRqyk=?= <Xion.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Huadian Liu =?utf-8?B?KOWImOWNjuWFuCk=?= <huadian.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] misc: Prevent double registration and deregistration
 of miscdevice
Message-ID: <2025082638-parlor-retreat-56ff@gregkh>
References: <20250825084556.10358-1-xion.wang@mediatek.com>
 <20250825084556.10358-2-xion.wang@mediatek.com>
 <2025082533-ranked-simply-4b63@gregkh>
 <d3d0fc0e19f939c093e6df1ff08ce23be71636a3.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3d0fc0e19f939c093e6df1ff08ce23be71636a3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_000542_885986_30281B67 
X-CRM114-Status: GOOD (  35.26  )
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

On Tue, Aug 26, 2025 at 02:55:59AM +0000, Xion Wang (王鑫) wrote:
> On Mon, 2025-08-25 at 22:28 +0200, Greg Kroah-Hartman wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Mon, Aug 25, 2025 at 04:45:47PM +0800, xion.wang@mediatek.com
> > wrote:
> > > From: Xion Wang <xion.wang@mediatek.com>
> > > 
> > > When repeated calls to misc_register() or misc_deregister() on the
> > > same miscdevice could lead to kernel crashes or misc_list
> > > corruption due to
> > > multiple INIT_LIST_HEAD or list_del operations on the same list
> > > node.
> > > 
> > > This patch improves the robustness of the misc device driver by
> > > preventing
> > > both double registration and double deregistration of miscdevice
> > > instances.
> > > 
> > > Signed-off-by: Xion Wang <xion.wang@mediatek.com>
> > > ---
> > >  drivers/char/misc.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/char/misc.c b/drivers/char/misc.c
> > > index 558302a64dd9..2f8666312966 100644
> > > --- a/drivers/char/misc.c
> > > +++ b/drivers/char/misc.c
> > > @@ -210,6 +210,9 @@ int misc_register(struct miscdevice *misc)
> > >       int err = 0;
> > >       bool is_dynamic = (misc->minor == MISC_DYNAMIC_MINOR);
> > > 
> > > +     if (WARN_ON(misc->this_device))
> > > +             return -EEXIST;
> > 
> > You just crashed the kernel if this ever triggers (remember when
> > panic-on-warn is set)
> > 
> > So please, if this can happen, properly handle it.
> > 
> > > +
> > >       INIT_LIST_HEAD(&misc->list);
> > > 
> > >       mutex_lock(&misc_mtx);
> > > @@ -251,6 +254,7 @@ int misc_register(struct miscdevice *misc)
> > >                       misc->minor = MISC_DYNAMIC_MINOR;
> > >               }
> > >               err = PTR_ERR(misc->this_device);
> > > +             misc->this_device = NULL;
> > >               goto out;
> > >       }
> > > 
> > > @@ -275,12 +279,13 @@ EXPORT_SYMBOL(misc_register);
> > > 
> > >  void misc_deregister(struct miscdevice *misc)
> > >  {
> > > -     if (WARN_ON(list_empty(&misc->list)))
> > > +     if (WARN_ON(!misc->this_device))
> > >               return;
> > > 
> > >       mutex_lock(&misc_mtx);
> > >       list_del(&misc->list);
> > >       device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
> > > +     misc->this_device = NULL;
> > 
> > You are overloading the pointer here to mean something, please don't.
> > 
> > Again, why would this ever happen?  What in-tree driver does this?
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> This issue was encountered during MTK internal stress testing,
> specifically in the WiFi module on/off process. If the WiFi module
> fails during the "on" process, it triggers an "off" process. However,
> if the "off" process also fails, the module may not be properly
> deinitialized, and the misc device may not be correctly deregistered.
> On the next WiFi "on" attempt, repeated registration of the misc device
> leads to corruption of the misc_list. Subsequently, when a device calls
> misc_open, it may acquire the misc_lock and enter an infinite loop in
> list_for_each_entry due to the corrupted list, while other threads
> attempting to access their misc device nodes become blocked waiting for
> the misc_lock.

What driver is this?  And wifi devices should be using the rfkill api,
which only registers a misc device at module load time.  A wifi driver
should not be creating a miscdevice itself, that feels very very wrong.

> This scenario exposes two issues:
> 
> Incomplete failure handling in our internal WiFi module's on/off
> process (which we have already addressed internally).
> The lack of a mechanism in the miscdevice framework to prevent repeated
> registration or deregistration, which would improve its robustness.

Again, this shouldn't be something that any driver should hit as this
usage is not in the kernel tree that I can see.  Attempting to
re-register a device multiple times is normally never a good idea.

thanks,

greg k-h

