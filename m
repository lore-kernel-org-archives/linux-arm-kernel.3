Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F520F9B605
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=; b=pSUhR41xOH8tHIpcaVFUATq0xY
	JbPntiiIHC3efzcyVwZI2tqsx4mMaTd0rXSUb30zuuIeMhVmEx7aPD/49o08Fxcmno9VfYH/yQuLC
	GFhDCF3ULCqnT99ZQ7U741d0PowrxNarmYN3k7yNhVSwTOyj0YrPj6kjGluooHDCQvnneyU22nO4T
	Y+hVOBzmfCtKs1D6WK34yGGB87lFANYlCtFW6hWbWlKVj7j6kwxxlAnjXeXNCzgT70igu2lCRLfVn
	oI0XNJi/Xh38CFuUFRZpjS964pss9gX2DQmWcecjR4WTdUL7jDUGcjHK7URui+SkOWfn48+XNTLO3
	OifaSq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVO-00000009vKE-1Rhj;
	Wed, 22 Apr 2026 10:08:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVM-00000009vJR-1hhl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:08:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so5989433e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 03:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776852501; cv=none;
        d=google.com; s=arc-20240605;
        b=kY67aJlNkS/f+ACFxSewj/4C7/H5JVCn5VgamgHqxdqDng6y/Cs6+AWlXH7ONkwx8D
         f/BT0DCv+P6FLbuTblw9drxdRtqP+4AHWs2REauBdCssWAF77AhNrBBTvX/611Puuxku
         5LZiP55wYZquWxK4NX4sWwLojcVq5MD9eUj9t15xpWgcWw29K6EQmbdDLesDcOreVc+D
         vhJE06QK9AjKUaCABKmmqmwrsGuc1cQ6GWWQMiARIYiYm+OSJBGiMMktnxHJ9RxaDGa/
         TpGYWYWhFPkVMYuw1g3GTVyrBZJuwy1bYBgtgJfzx2N+9SnWHKiMqcfmZNTWOmWuMHhb
         nbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        fh=+fSSerfydippouOJFO1vRRYkxVch6j0zNwoW7bMF/sg=;
        b=dPhHB/giMv3ubrr/4wRgjSckrCpgG+wfu6Y0cFOyNfAdjQxVLUYrVveNLMLORS3NyP
         vbhfI43ZqzWoHEP3xcy1TYxPk/7CjI+DbQd+4jHnaeWysKVhmi7yyUZhHKFLXbcjPxVk
         g2R4IicnvSUy+3G1Bq0Ky4X2HqwyP9Afz0k3YdNxxXdtyFW6NVSl0JYP3ThmNtSVktNh
         U1MlXQsI0iOc+rmjYi2A/qV8nTfsoHCZK0abg95C3+nmZeEwQSGgGmHmJPSwJPCCcx/1
         lFkhWCGRlC1NgZrdUHHufjeKGgTm1CnKxePwJAcxWzq7ux0iiX8davfJ0it0QBGiZCKP
         iZUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776852501; x=1777457301; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        b=xBfE6a1+qWQ947NVBt9tMy06w7lrqm4OCkFuYZD8yuMDNyE2Jhc2kBmZ8vMb1Zqe34
         BhhWxmI87cgKAsIGI1AyoL+vsXblm4VoUTuyyVWi4WsEyD/YZv1fgLROKnSSTaFuhDRP
         /defQtRyZTOUYg7C4xiNLxxV0M+XfLFlIVbiRWjkNp9s4vjEdP2akE5SKBFLqHEUw2Vt
         cfNSFdWA7gjyePFnYP67k0JevmhcOtzSXYXxYu+BU55EV6hINAfFsFrlYZLAYyFH/1NQ
         F1iKtI78nF9NQVNIsPtFBxnE7PJeuUCccxaZvjpWDbpZqXp06BTFSox0v0YuAUzDRQFq
         4Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852501; x=1777457301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        b=lOd24K53WI5fFP3nx0DM7KUiCnnIM1SPLoFfpStvKyl2TPlQ2OK6EHKdr2Ov91fvw6
         6FzxGnG4WKUeEsUekvjhn7X0GSKWlqNeKFKKP6eyunD+B6uIGRBdw9+0d3/RuFuRNNg2
         W8dC0r2m0UOuXrbyij7x5fMziX+vV4d1dtOjlBzP1VrR1XRk9c2sNhDUXyazh7SD/tUn
         XMc5AAgZlGZLU/Vb+zP6Jl/0YCOQVpgt1+Md8elWlN5QLxEdDruYW7DlJxDx6IYHHzHq
         7N3pyQ8Hvh9Dj1x/tNd195eZyuts9WKxWJ981fhef7RdKoyKjcwwiSXZL7t00j+h9pjJ
         bDIA==
X-Forwarded-Encrypted: i=1; AFNElJ+1+gK9MH4g6RIO/R1RDhRfA38tULCFa0xgeJcjYsintOGglqcIw9ttbmSNg75scZjyfqda+8wNEb2+Etq6g8lE@lists.infradead.org
X-Gm-Message-State: AOJu0YxKsxuHIaOZzX45Nnr+ZwHVkHBCAK+JMgkhBg310DFxcW3wRAKM
	lOmjSeJiYHtWXEmZYDx8oQgkE1YDtrqv9N09RINyECT6wsbC7zt6SWDpUBpTfQIUPvWmxPfg0CY
	FGSj756QmbklEXtD3WKixZ8lIEW7nwTeEJc4QbD6RnQ==
X-Gm-Gg: AeBDietkx1VBiLTm29yxMCnKlnOVOiYSWCqy8ftC+afKYJ5RhVEPy8zEH0NEQJXIHA8
	6pJ5oVZb/UflnPTqgIiLyZzjaoQKvNYCqqna+E9dNCKX5+t9LFrrVFQHeu9PsV14YXaGf0+Ieqm
	5Jz5g10e4o/hPLVaMo1t6N+d6PKl8ZOMz2NB14H50G7t9sIyby0QbtlBfC8AmZhshLWgV08fB4n
	Lu9q1KnHyGP+u8+OxgXpTPyRtXwsouKWuX/BqW/Uzn4Sf8DOEpbvoYS7Gebi3LR7SDa2kUqAukH
	CA1pSY6pOvcCtGyR79M=
X-Received: by 2002:ac2:4c4b:0:b0:5a4:b0:a072 with SMTP id 2adb3069b0e04-5a4172ca655mr6734556e87.4.1776852500411;
 Wed, 22 Apr 2026 03:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
In-Reply-To: <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Apr 2026 12:07:44 +0200
X-Gm-Features: AQROBzC5eJAyDlpSocEWC79YWE17Iafg8A3OHcUQDEnYvf-zjcf7j-wZjMNN0Zk
Message-ID: <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_030824_521227_DD39E1A0 
X-CRM114-Status: GOOD (  44.08  )
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

On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> > The common sync_state support isn't fine grained enough for some types of
> > suppliers, like power domains for example. Especially when a supplier
> > provides multiple independent power domains, each with their own set of
> > consumers. In these cases we need to wait for all consumers for all the
> > provided power domains before invoking the supplier's ->sync_state().
> >
> > To allow a more fine grained sync_state support to be implemented on per
> > supplier's driver basis, let's add a new optional callback. As soon as
> > there is an update worth to consider in regards to managing sync_state for
> > a supplier device, __device_links_queue_sync_state() invokes the callback.
> >
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/base/core.c           | 7 ++++++-
> >  include/linux/device/driver.h | 7 +++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 09b98f02f559..4085a011d8ca 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1106,7 +1106,9 @@ int device_links_check_suppliers(struct device *dev)
> >   * Queues a device for a sync_state() callback when the device links write lock
> >   * isn't held. This allows the sync_state() execution flow to use device links
> >   * APIs.  The caller must ensure this function is called with
> > - * device_links_write_lock() held.
> > + * device_links_write_lock() held.  Note, if the optional queue_sync_state()
> > + * callback has been assigned too, it gets called for every update to allowing a
>
> s/allowing/allow/
>
> > + * more fine grained support to be implemented on per supplier basis.
> >   *
> >   * This function does a get_device() to make sure the device is not freed while
> >   * on this list.
> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >       if (dev->state_synced)
> >               return;
> >
> > +     if (dev->driver && dev->driver->queue_sync_state)
> > +             dev->driver->queue_sync_state(dev);
>
> This seems to be called without the device lock being held, which seems to allow
> the queue_sync_state() callback to execute concurrently with remove(). This
> opens the door for all kinds of UAF conditions in drivers.

If that were the case, this whole function would be unsafe even before
this change. I assume this isn't because of how the function is being
called, but I may be wrong.

Anyway, let me add a get/put_device() here somewhere, to ensure we
prevent this from happening. I assume that is what you are proposing?

>
> This also made me aware that the above dev_has_sync_state() is probably broken,
> as it also performs the following check without the device lock being held.
>
>         dev->driver && dev->driver->sync_state
>
> I think nothing prevents dev->driver to become NULL concurrently; in this case
> READ_ONCE() should be sufficient though as it doesn't execute the callback.
>
> I will send a patch for this.

Okay, thanks!

>
> > +
> >       list_for_each_entry(link, &dev->links.consumers, s_node) {
> >               if (!device_link_test(link, DL_FLAG_MANAGED))
> >                       continue;
> > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > index bbc67ec513ed..bc9ae1cbe03c 100644
> > --- a/include/linux/device/driver.h
> > +++ b/include/linux/device/driver.h
> > @@ -68,6 +68,12 @@ enum probe_type {
> >   *           be called at late_initcall_sync level. If the device has
> >   *           consumers that are never bound to a driver, this function
> >   *           will never get called until they do.
> > + * @queue_sync_state: Similar to the ->sync_state() callback, but called to
> > + *           allow syncing device state to software state in a more fine
> > + *           grained way. It is called when there is an updated state that
> > + *           may be worth to consider for any of the consumers linked to
> > + *           this device. If implemented, the ->sync_state() callback is
> > + *           required too.
>
> What happens if this is not the case? Maybe worth to check and warn about this
> in driver_register().

Good point!

I believe I should also add a check in dev_set_drv_queue_sync_state()
that is added in patch2.

>
> >   * @remove:  Called when the device is removed from the system to
> >   *           unbind a device from this driver.
> >   * @shutdown:        Called at shut-down time to quiesce the device.
> > @@ -110,6 +116,7 @@ struct device_driver {
> >
> >       int (*probe) (struct device *dev);
> >       void (*sync_state)(struct device *dev);
> > +     void (*queue_sync_state)(struct device *dev);
> >       int (*remove) (struct device *dev);
> >       void (*shutdown) (struct device *dev);
> >       int (*suspend) (struct device *dev, pm_message_t state);
> > --
> > 2.43.0
>

Thanks for reviewing!

Kind regards
Uffe

