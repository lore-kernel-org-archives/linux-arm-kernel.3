Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93777CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbmZ+eqccnWtG+CQ3VasipDd7HkDp6oeIP2UmZOr3rc=; b=ZcTdlzschvh2LqZjNTt7GDez4o
	JZ7ET3RyLkWwkvZLG9BksfVfSEayrNzkzBRI/C+qOsU0psOo2oLJ7aGOXcByu40fJ2Dzs3lB5M6Ne
	Bk8kXnPKqZpxxB8NSwm/rZGJLBFnA0ib0THKIRT5z25yo3eTiYdPJpYSsE1+UAZRBFLiyw1PuxY1G
	UNaGFeBZzfPH+m3U/NFjOcymdiDf6D2NSUo25H3+7eEdPDeHGziw//KykoY9VSd3sJiP+uFdk7fRc
	e6C/HfIdvxVctLoQNicndCbh/fjSHnXCVVNhebNcWgK9Ie7uTAcjze5r/W9po/8ldDv/Ra8JxUgIv
	BskPDp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNAi-0000000CyxP-2vQC;
	Mon, 11 May 2026 09:43:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNAg-0000000CywU-26vL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:43:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a4113ab355so3776241e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492608; cv=none;
        d=google.com; s=arc-20240605;
        b=fA4nXyq58mcjUYmeZszzBcAynnPmk/k3u0W9lv9Zqi2YRL3NhFNu8EMsDf0IJzma4z
         PYQHzSfEt0gr9i4B5BH9gn8/i6oKngA+aIY0BGulhm2kroO1Sb0W3dx6qL1xCuMFWe3y
         MX8PAHQNuvkTtQMEgq/6Pc4xEuLEi+s1CyIejO2jnb5xhdRmQZL3pWIb5lexVmMlMi53
         9XVSoy+rbrOBc5DBW394ZBzMunZoC8JZnql2vO4rJ00c6qFFz3txn3bDyVplm7D8suUZ
         fQM6yDbX9RTTYc4a7YlAHYDHUMaeBjPDl2KLDTN97fvI1So4Ue7fScMAfjMybr9E70Um
         4sNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbmZ+eqccnWtG+CQ3VasipDd7HkDp6oeIP2UmZOr3rc=;
        fh=jQQAqrtunakbzhy7AQyy8vuJnQhZsycHJYrEMN7GtMY=;
        b=ZuHsiXPCNYIF/1dgZDusKwuZ/slj0S2x4XGsVH27jlClV9Pxmo3dCKa5ZoQf8sdN//
         Tu5+xtfYeoBXyeB9xQZOfVgmxeG8Bmsvm8RjLIbF/CPQat20Pvr8SFn4bh435Vu/X21D
         p3vaIqG+OQBDKKM1TcnRzkuLWHwGl0c4oXxfV/sArcGSCVVk2dhNMMZIP2bLSM24gzeB
         e5R0viJAyE1U0dkjHX4Co83gsyesPQX/uiePtX/FUOlKR4I2Q5mHBC2NSzpzCs9AHNsX
         rr6YEQF4kfG00zkP914jtfeLV5hskDpoC5zuSc3jNxvuR6B2RkWxtqPSlbRR0zBjdKHN
         Sl3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778492608; x=1779097408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbmZ+eqccnWtG+CQ3VasipDd7HkDp6oeIP2UmZOr3rc=;
        b=yiPPxtAH6tbH6IiLmq2tG0yZoZTRXEXafKh2sXUQsIfacxUJqDGO7u7lG6YwDbWpTt
         e9Zakt1aEYiznf/Og/0kqrY/TyC/Zi7i+K8Jl97EYFvSmVxCqxTjkeRXi4sEeE/PhtZs
         o1cF8QWRizWjUcjgnOZkn99xaduPGR8pkjflkwLYti8mKvKxfiNXSBVvfEhZzifNWg7K
         9bIFMZJ9J39ZV9v+YwsySwqPZiZ8X38qcCeRwP3Yb2hZneaI6/P/Nkvxsvx2WQwsQGa3
         /SZqHiMyzrBKh1iK14c8rlbbAPe84zMMMpkWbcfznJRxWdd7rV9Ccqv4FSyKihor9pmf
         By0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492608; x=1779097408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VbmZ+eqccnWtG+CQ3VasipDd7HkDp6oeIP2UmZOr3rc=;
        b=Z6q1BB7i/wc9W1Q3ugfhkk7bUcW7djnX5fq7qPAMAWU9zAsIBEhGLaml/UijNZKiOt
         TsBkcDRpYnVbMei5Jw9+ABu721RAklHb0uoaNo2OOk+Fi+zr8bZo2WNauZopH7HKTwBS
         +ivBqpK8owIS4RbOjxr5rPtEvMQMpesDLYglEDCPZprgxawx/BnUOjWr0wVCBGzgLXwY
         4O5UwiuY7Lh861joOdttmYPA8Spe3G/j/x+MoyO2AttR3zhrQvycYU+OlJeicWXVWsLy
         6/woHlX6x+gMAqi953b5hOtSRnn9wwtF053YOx+Bsz0oaro6oW7mp2DLRVe7rlp2nWtd
         rZmg==
X-Forwarded-Encrypted: i=1; AFNElJ+1IQC6LDasITxlF7jESG4R8VfqRcPBCYFnL6hSCzadYrgu9TUQpDstwbfhusKPB8Efb4IvVI6PyXFFGfgIevpD@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLQN2W2T+YJFj0jsT0SOQu6mPJnP1fAX1kJ8MgZvR7dyxTGWy
	CdAvq2js4BJaDKu6+n5wKoR4nF5HvBJ8l/8L+BqPCLY6ZQagVB0GMUTuF+ZUVqUPV1yUAjMOuil
	/Z878qFjVITz01BVQ/Uy6J/ExUktnqjcKDRCQ1rMarA==
X-Gm-Gg: Acq92OGO4P1pHqACqYGQbZb3xSMplIh6PA+9pYTOnteSbB7ZyknQrRbBmKLHyz9HE1t
	xfSpZyTpWNDmaKFgV6zSz4yO6/ioW6VuOua1ywT3IFS202IVTL2PQNMT4l2ijTsHmZpPPq4Mk4r
	5AVFf6UTIiEZLbPUYr7i8wzsZ+fvMmG7ByBt7NgEVjMfWoIZlisXvMMzFtxVJCfGHW/RSsyyigG
	LDOkXeks95PeiUa/fhoaYapAw+O7NdymHOM05rEBGz9v8T8HeVdx0dTgurBsHrlqhV/xaRxZ9uV
	X9QvjgqF
X-Received: by 2002:a05:6512:124c:b0:5a8:6747:b053 with SMTP id
 2adb3069b0e04-5a8a94c1fcemr3898167e87.27.1778492607818; Mon, 11 May 2026
 02:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org> <CACRMN=fseD6-ODYnOEE42S9VKAb2F33kRv_VPYBGyPsitG2how@mail.gmail.com>
In-Reply-To: <CACRMN=fseD6-ODYnOEE42S9VKAb2F33kRv_VPYBGyPsitG2how@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 11:42:51 +0200
X-Gm-Features: AVHnY4J_ttWzrEuWuwteFabwVb29vcgy3RU9tdBAvYwb2cFb-EfkO4zeO_ONwPQ
Message-ID: <CAPDyKFq+F=zn_Coicb9LzyMtQ=b2Lrd+3Czx6r4ReY-DNyb9eg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Saravana Kannan <saravanak@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024330_732577_64D7938C 
X-CRM114-Status: GOOD (  50.58  )
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

On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > The common sync_state support isn't fine grained enough for some types =
of
> > suppliers, like power domains for example. Especially when a supplier
> > provides multiple independent power domains, each with their own set of
> > consumers. In these cases we need to wait for all consumers for all the
> > provided power domains before invoking the supplier's ->sync_state().
> >
> > To allow a more fine grained sync_state support to be implemented on pe=
r
> > supplier's driver basis, let's add a new optional callback. As soon as
> > there is an update worth to consider in regards to managing sync_state =
for
> > a supplier device, __device_links_queue_sync_state() queues the device =
in a
> > list, allowing the new callback to be invoked when flushing the list in
> > device_links_flush_sync_list().
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >
> > Changes in v3:
> >         - Re-worked the approach to use a list to queue/flush devices f=
or
> >         ->queue_sync_state(). This should make sure the device lock is =
being
> >         held when it's needed, as pointed out by Danilo.
> >
>
> Hi Ulf,
>
> Thanks for working on this!
>
> And please bear with my slow replies.

I will try, but taking more than 2 months to reply isn't sustainable,
I think. Let's hope you can get some more bandwidth for reviews when
moving forward.

>
> > ---
> >  drivers/base/base.h           | 18 ++++++++
> >  drivers/base/core.c           | 77 ++++++++++++++++++++++++++---------
> >  drivers/base/driver.c         |  7 ++++
> >  include/linux/device.h        |  2 +
> >  include/linux/device/driver.h |  7 ++++
> >  5 files changed, 91 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index 30b416588617..c8be24af92c3 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct device *d=
ev)
> >                 dev->driver->sync_state(dev);
> >  }
> >
> > +static inline bool dev_has_queue_sync_state(struct device *dev)
>
> Let's please pick a better name. This is too similar to the actual
> queue function you call __device_links_queue_sync_state() and is very
> confusing. Maybe something that has a meaning along the lines of
> "another consumer probed". So, maybe:
> * consumer_probed()
> * change_of_active_consumers()

The whole point of naming it "queue_sync_state" was exactly to refer
to __device_links_queue_sync_state(). The point is, the callback can't
be invoked unless __device_links_queue_sync_state() has been called
for the device first.

Not sure why you think that is confusing? To me, that is rather the
opposite. :-)

Before deciding on another name, note also that
__device_links_queue_sync_state() is called when resuming sync_state
from device_links_supplier_sync_state_resume() and from
device_links_driver_bound(). I am not sure "consumer_probed" a good
name that covers both of these cases; what do you think?

>
> I'm going to refer to this new callback as "consumer_probed()" in the
> rest of my replies so I can keep it straight in my head.
>
> > +{
> > +       struct device_driver *drv;
> > +
> > +       if (!dev)
> > +               return false;
> > +       drv =3D READ_ONCE(dev->driver);
> > +       if (drv && drv->queue_sync_state)
> > +               return true;
> > +       return false;
> > +}
> > +
> > +static inline void dev_queue_sync_state(struct device *dev)
> > +{
> > +       if (dev->driver && dev->driver->queue_sync_state)
> > +               dev->driver->queue_sync_state(dev);
> > +}
> > +
> >  int driver_add_groups(const struct device_driver *drv, const struct at=
tribute_group **groups);
> >  void driver_remove_groups(const struct device_driver *drv, const struc=
t attribute_group **groups);
> >  void device_driver_detach(struct device *dev);
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index d49420e066de..f1f95b3c81e5 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1101,15 +1101,18 @@ int device_links_check_suppliers(struct device =
*dev)
> >  /**
> >   * __device_links_queue_sync_state - Queue a device for sync_state() c=
allback
> >   * @dev: Device to call sync_state() on
> > - * @list: List head to queue the @dev on
> > + * @s_list: List head for the sync_state to queue the @dev on
> > + * @q_list: List head for the queue_sync_state to queue the @dev on
> >   *
> >   * Queues a device for a sync_state() callback when the device links w=
rite lock
> >   * isn't held. This allows the sync_state() execution flow to use devi=
ce links
> >   * APIs.  The caller must ensure this function is called with
> > - * device_links_write_lock() held.
> > + * device_links_write_lock() held.  Note, if the optional queue_sync_s=
tate()
> > + * callback has been assigned too, the device is queued for that list =
to allow a
> > + * more fine grained support to be implemented on per supplier basis.
>
> Why not keep this in the same format as the existing doc? Something like:
> If option list xxx is provided, queues the device for the
> consumer_probed() callback.

Okay, let me clarify this.

>
> >   *
> >   * This function does a get_device() to make sure the device is not fr=
eed while
> > - * on this list.
> > + * on the corresponding list.
> >   *
> >   * So the caller must also ensure that device_links_flush_sync_list() =
is called
> >   * as soon as the caller releases device_links_write_lock().  This is =
necessary
> > @@ -1117,7 +1120,8 @@ int device_links_check_suppliers(struct device *d=
ev)
> >   * put_device() is called on this device.
> >   */
> >  static void __device_links_queue_sync_state(struct device *dev,
> > -                                           struct list_head *list)
> > +                                           struct list_head *s_list,
> > +                                           struct list_head *q_list)
> >  {
> >         struct device_link *link;
> >
> > @@ -1129,8 +1133,14 @@ static void __device_links_queue_sync_state(stru=
ct device *dev,
> >         list_for_each_entry(link, &dev->links.consumers, s_node) {
> >                 if (!device_link_test(link, DL_FLAG_MANAGED))
> >                         continue;
> > -               if (link->status !=3D DL_STATE_ACTIVE)
> > +               if (link->status !=3D DL_STATE_ACTIVE) {
> > +                       if (dev_has_queue_sync_state(dev) &&
> > +                           list_empty(&dev->links.queue_sync)) {
> > +                               get_device(dev);
> > +                               list_add_tail(&dev->links.queue_sync, q=
_list);
> > +                       }
> >                         return;
> > +               }
> >         }
> >
> >         /*
> > @@ -1144,25 +1154,28 @@ static void __device_links_queue_sync_state(str=
uct device *dev,
> >                 return;
> >
> >         get_device(dev);
> > -       list_add_tail(&dev->links.defer_sync, list);
> > +       list_add_tail(&dev->links.defer_sync, s_list);
> >  }
> >
> >  /**
> > - * device_links_flush_sync_list - Call sync_state() on a list of devic=
es
> > - * @list: List of devices to call sync_state() on
> > + * device_links_flush_sync_list - Call sync_state callbacks for the de=
vices
> > + * @s_list: List of devices to call sync_state() on
> > + * @q_list: List of devices to call queue_sync_state() on
> >   * @dont_lock_dev: Device for which lock is already held by the caller
> >   *
> > - * Calls sync_state() on all the devices that have been queued for it.=
 This
> > - * function is used in conjunction with __device_links_queue_sync_stat=
e(). The
> > - * @dont_lock_dev parameter is useful when this function is called fro=
m a
> > - * context where a device lock is already held.
> > + * Calls sync_state() and queue_sync_state() on all the devices that h=
ave been
> > + * queued for it. This function is used in conjunction with
> > + * __device_links_queue_sync_state(). The @dont_lock_dev parameter is =
useful
> > + * when this function is called from a context where a device lock is =
already
> > + * held.
> >   */
> > -static void device_links_flush_sync_list(struct list_head *list,
> > +static void device_links_flush_sync_list(struct list_head *s_list,
> > +                                        struct list_head *q_list,
> >                                          struct device *dont_lock_dev)
> >  {
> >         struct device *dev, *tmp;
> >
> > -       list_for_each_entry_safe(dev, tmp, list, links.defer_sync) {
> > +       list_for_each_entry_safe(dev, tmp, s_list, links.defer_sync) {
> >                 list_del_init(&dev->links.defer_sync);
> >
> >                 if (dev !=3D dont_lock_dev)
> > @@ -1175,6 +1188,25 @@ static void device_links_flush_sync_list(struct =
list_head *list,
> >
> >                 put_device(dev);
> >         }
> > +
> > +       if (!q_list)
> > +               return;
> > +
> > +       list_for_each_entry_safe(dev, tmp, q_list, links.queue_sync) {
> > +               list_del_init(&dev->links.queue_sync);
> > +
> > +               if (dev !=3D dont_lock_dev)
> > +                       device_lock(dev);
> > +
> > +               device_links_write_lock();
> > +               dev_queue_sync_state(dev);
> > +               device_links_write_unlock();
> > +
> > +               if (dev !=3D dont_lock_dev)
> > +                       device_unlock(dev);
> > +
> > +               put_device(dev);
> > +       }
> >  }
> >
> >  void device_links_supplier_sync_state_pause(void)
> > @@ -1188,6 +1220,7 @@ void device_links_supplier_sync_state_resume(void=
)
> >  {
> >         struct device *dev, *tmp;
> >         LIST_HEAD(sync_list);
> > +       LIST_HEAD(queue_list);
> >
> >         device_links_write_lock();
> >         if (!defer_sync_state_count) {
> > @@ -1204,12 +1237,12 @@ void device_links_supplier_sync_state_resume(vo=
id)
> >                  * sync_list because defer_sync is used for both lists.
> >                  */
> >                 list_del_init(&dev->links.defer_sync);
> > -               __device_links_queue_sync_state(dev, &sync_list);
> > +               __device_links_queue_sync_state(dev, &sync_list, &queue=
_list);
> >         }
> >  out:
> >         device_links_write_unlock();
> >
> > -       device_links_flush_sync_list(&sync_list, NULL);
> > +       device_links_flush_sync_list(&sync_list, &queue_list, NULL);
> >  }
> >
> >  static int sync_state_resume_initcall(void)
> > @@ -1296,6 +1329,7 @@ void device_links_driver_bound(struct device *dev=
)
> >  {
> >         struct device_link *link, *ln;
> >         LIST_HEAD(sync_list);
> > +       LIST_HEAD(queue_list);
> >
> >         /*
> >          * If a device binds successfully, it's expected to have create=
d all
> > @@ -1351,7 +1385,7 @@ void device_links_driver_bound(struct device *dev=
)
> >         if (defer_sync_state_count)
> >                 __device_links_supplier_defer_sync(dev);
> >         else
> > -               __device_links_queue_sync_state(dev, &sync_list);
> > +               __device_links_queue_sync_state(dev, &sync_list, &queue=
_list);
>
> This path is really meant only for situations when the device has no
> consumers. So, I don't think fine grained control is relevant.

Okay, makes sense!

>
> >
> >         list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_nod=
e) {
> >                 struct device *supplier;
> > @@ -1393,14 +1427,15 @@ void device_links_driver_bound(struct device *d=
ev)
> >                 if (defer_sync_state_count)
> >                         __device_links_supplier_defer_sync(supplier);
> >                 else
> > -                       __device_links_queue_sync_state(supplier, &sync=
_list);
> > +                       __device_links_queue_sync_state(supplier, &sync=
_list,
> > +                                                       &queue_list);
> >         }
> >
> >         dev->links.status =3D DL_DEV_DRIVER_BOUND;
> >
> >         device_links_write_unlock();
> >
> > -       device_links_flush_sync_list(&sync_list, dev);
> > +       device_links_flush_sync_list(&sync_list, &queue_list, dev);
> >  }
> >
> >  /**
> > @@ -1516,6 +1551,7 @@ void device_links_driver_cleanup(struct device *d=
ev)
> >         }
> >
> >         list_del_init(&dev->links.defer_sync);
> > +       list_del_init(&dev->links.queue_sync);
> >         __device_links_no_driver(dev);
> >
> >         device_links_write_unlock();
> > @@ -1808,7 +1844,7 @@ void fw_devlink_probing_done(void)
> >         class_for_each_device(&devlink_class, NULL, &sync_list,
> >                               fw_devlink_dev_sync_state);
> >         device_links_write_unlock();
> > -       device_links_flush_sync_list(&sync_list, NULL);
> > +       device_links_flush_sync_list(&sync_list, NULL, NULL);
> >  }
> >
> >  /**
> > @@ -3169,6 +3205,7 @@ void device_initialize(struct device *dev)
> >         INIT_LIST_HEAD(&dev->links.consumers);
> >         INIT_LIST_HEAD(&dev->links.suppliers);
> >         INIT_LIST_HEAD(&dev->links.defer_sync);
> > +       INIT_LIST_HEAD(&dev->links.queue_sync);
> >         dev->links.status =3D DL_DEV_NO_DRIVER;
> >         dev_assign_dma_coherent(dev, dma_default_coherent);
> >         swiotlb_dev_init(dev);
> > diff --git a/drivers/base/driver.c b/drivers/base/driver.c
> > index 8ab010ddf709..b8f4d08bbd58 100644
> > --- a/drivers/base/driver.c
> > +++ b/drivers/base/driver.c
> > @@ -239,6 +239,13 @@ int driver_register(struct device_driver *drv)
> >                 pr_warn("Driver '%s' needs updating - please use "
> >                         "bus_type methods\n", drv->name);
> >
> > +       if (drv->queue_sync_state && !drv->sync_state &&
> > +           !drv->bus->sync_state) {
> > +               pr_err("Driver '%s' or its bus_type needs ->sync_state(=
)",
> > +                      drv->name);
> > +               return -EINVAL;
> > +       }
> > +
> >         other =3D driver_find(drv->name, drv->bus);
> >         if (other) {
> >                 pr_err("Error: Driver '%s' is already registered, "
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 56a96e41d2c9..6848b0a2c2d9 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -414,12 +414,14 @@ enum device_removable {
> >   * @suppliers: List of links to supplier devices.
> >   * @consumers: List of links to consumer devices.
> >   * @defer_sync: Hook to global list of devices that have deferred sync=
_state.
> > + * @defer_sync: Hook to global list of devices scheduled for queue_syn=
c_state.
> >   * @status: Driver status information.
> >   */
> >  struct dev_links_info {
> >         struct list_head suppliers;
> >         struct list_head consumers;
> >         struct list_head defer_sync;
> > +       struct list_head queue_sync;
> >         enum dl_dev_state status;
> >  };
> >
> > diff --git a/include/linux/device/driver.h b/include/linux/device/drive=
r.h
> > index bbc67ec513ed..bc9ae1cbe03c 100644
> > --- a/include/linux/device/driver.h
> > +++ b/include/linux/device/driver.h
> > @@ -68,6 +68,12 @@ enum probe_type {
> >   *             be called at late_initcall_sync level. If the device ha=
s
> >   *             consumers that are never bound to a driver, this functi=
on
> >   *             will never get called until they do.
> > + * @queue_sync_state: Similar to the ->sync_state() callback, but call=
ed to
> > + *             allow syncing device state to software state in a more =
fine
> > + *             grained way. It is called when there is an updated stat=
e that
> > + *             may be worth to consider for any of the consumers linke=
d to
> > + *             this device. If implemented, the ->sync_state() callbac=
k is
> > + *             required too.
>
> Let's make it clear that if a device gets sync_state() callback, it
> needs to sync the state independent of whether it has received any/all
> "consumer_probed()".

Right, good point! Let me clarify that!

>
> Thanks,
> Saravana
>
>
> >   * @remove:    Called when the device is removed from the system to
> >   *             unbind a device from this driver.
> >   * @shutdown:  Called at shut-down time to quiesce the device.
> > @@ -110,6 +116,7 @@ struct device_driver {
> >
> >         int (*probe) (struct device *dev);
> >         void (*sync_state)(struct device *dev);
> > +       void (*queue_sync_state)(struct device *dev);
> >         int (*remove) (struct device *dev);
> >         void (*shutdown) (struct device *dev);
> >         int (*suspend) (struct device *dev, pm_message_t state);
> > --
> > 2.43.0
> >

Kind regards
Uffe

