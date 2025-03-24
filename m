Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBEBC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYGcI8imqj+MGUqjN29fBqg3Vw5woBztKuaSrXR3vbI=; b=rBEDjCEKr7+efl6unqMIWULZfd
	aHJKQUvTUSnCcQ2C84hPL7etBE23RnclyBGuuMWr/tl+dlEdDZ8MLogq+wj+0WTO7VUDC1mAvwxkk
	F8oBoKIpr5xdtL+9CHTLC6uEafXza0Ej7QJgwTgp1ogekUwSB180F5Jpikstcbqf626BPVoyszMb/
	qvB72QJwrT/4AVxC8QS5+qnsuo95nEJihlcrAUERa6/Z8TPLEzEaCcO7yMymD79QAdJy8dtfaZ4BW
	pCvNkjAixGRjrpfjgsMfsdZInQlhjmVwOxBWa2PI6gTxDoJfeTdqziEt0pDLgLRj/deJQv6R7cMh5
	tDUYdkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmSY-00000003wJF-2lrB;
	Mon, 24 Mar 2025 18:23:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmQq-00000003wAE-1apZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:21:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2239c066347so106991185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742840511; x=1743445311; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vYGcI8imqj+MGUqjN29fBqg3Vw5woBztKuaSrXR3vbI=;
        b=HgFVgM4XT2wASovsm+4DQNSAmZWZ9QVhG4Yiti87oGDYIQDm6z0KdjexlNbh5IMGYJ
         ZXVJ0rKswtfxDCtX0++efd9aZ1ecXZtX0vWVue9H0t2C31lNntcQAWfld56qimt48dIX
         qJLxAy20/UNypOqrFFrGmJBTg291EWXEDuITzX1GTp5BPl7jt7NFTGAe8GPZJugmr/19
         rqjL6YwghV8GeEqUVBS61csZ0ji8nUtqbbU4gexN2FVn2mn15FXL6HirE7BWQuaXBcLb
         GxNz7Zwb4PXWL54FlHKopw5QMU8dY5MLg4e5o1TcnLwuhpnyNZ+yBH36h42XzejlfXxm
         MwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742840511; x=1743445311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYGcI8imqj+MGUqjN29fBqg3Vw5woBztKuaSrXR3vbI=;
        b=bHsG9RxoRLrQmbtyRB/i2oMbbhWB7l4T3PF8gnIhwURls4MMDzOXOKulrZ5s1Gm0kH
         9ARimbzwA/M3ZcZ8OMCI1NKIRMCzYSQnuu+B10Uj6E5ejXnA1CYGRlfzzLidIbE/v0pB
         1zSZ0e19r4fXKy+8EGfKAzN3xZbKwDSpJAvbmo+zg5ockjcemnwG6sYtYvVOG6wORQZn
         goSbObFdj4zYl0BBjz5UVjA6YrIX424qM7nOlowdQDUKAgc2sJvMKJIWRAB5QzFnl7CZ
         VSC86w8n9BEHEFqhgXF7zCsrJuWaEqNimNKjomw4434U3ICzglOHUxbyP+xeUMalKyNi
         bVpA==
X-Forwarded-Encrypted: i=1; AJvYcCVZr4AhuzU8hT9PRVLgdcDCTMJpiekDDah7WTq7fZ5RArnbx9llpVrwr2BrfyYnxSUEMPIF3UPpGhGRa8Hbns+v@lists.infradead.org
X-Gm-Message-State: AOJu0YyhxJ0zQKGp1tLEJBYjfmbMmaGih01Y6Z+0JIYgpr5VlLKx1s1H
	TuvqihEn8UqsTxy5p9+mp6xzHefHVFdtFa28+9ZmiNWKyc91HIyxPMcP/DNbGN20WBzx7EGE+gT
	N5gxhbnKuInNMOfUrS5942913EuyBMzDjciAq5A==
X-Gm-Gg: ASbGnctADyw1yin+QgFzHJGo2hwg3ze/ok2dEoVBkD/Ob3j8uoyKaymVo1QGVKP+ypp
	wK6MrNzVKVL8K/1U4jCBBRDmVRcr+UUcEHMbeGognzxsB0lJ6LXW6jraFALjk/PldaOzD+MNqE/
	5exB0zUW+Vq+AvYmPXkRXvMFlqiv0wlmNbanVVXdfptC3ePhRJrRZM9s1LY9U=
X-Google-Smtp-Source: AGHT+IFF3EcxhuVze+FBnKUvTSo2ADv/p17nL+WNhX5Rraz4E5NBfUNu9Acb3U1M/4KPXQVXhN5pXD8y6Aad14poHsA=
X-Received: by 2002:a05:6a00:2384:b0:730:d5ca:aee with SMTP id
 d2e1a72fcca58-73905a2529fmr23710196b3a.23.1742840511070; Mon, 24 Mar 2025
 11:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250109171956.3535294-1-yeoreum.yun@arm.com> <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
 <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <CAJ9a7Vgz+L+UYf8Yqyu9J5hp3AB3WPSKutA4AvR-OFdu8b-dPA@mail.gmail.com> <Z+FlLDLV9WkGNbj+@e129823.arm.com>
In-Reply-To: <Z+FlLDLV9WkGNbj+@e129823.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 24 Mar 2025 18:21:39 +0000
X-Gm-Features: AQ5f1JpBLeuBe2uwu_6LtTYvGXXov15RoxnfseC3LtykXCAnpx1LgBpQDY-jWNc
Message-ID: <CAJ9a7VgsBZ6MkgwVjDiOm7rvcy9KVPfPc_PbaRNX7ra8NWGb9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, 
	"james.clark@linaro.org" <james.clark@linaro.org>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_112152_430322_BD7A44DA 
X-CRM114-Status: GOOD (  49.39  )
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

Hi,

On Mon, 24 Mar 2025 at 13:59, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> Hi Mike,
>
> Please ignore my foremer mail.. and please see my comments for your
> suggestion.
>
> > Hi
> >
> > On Fri, 14 Mar 2025 at 15:25, Yeo Reum Yun <YeoReum.Yun@arm.com> wrote:
> > >
> > > Hi, Mike.
> > >
> > > > >  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> > > > > @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> > > > >
> > > > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
> > > > > +{
> > > > > +       if (enable)
> > > > > +               return atomic_inc_not_zero(&config_desc->active_cnt);
> > > > > +
> > > >
> > > > Not sure why we have an "enable" parameter here - it completely
> > > > changes the meaning of the function - with no comment at the start.
> > >
> > > Sorry. But what I intended is to distinguish
> > >     - activation of config
> > >     - enable of activated config.
> > > Because, current coresight doesn't grab the module reference on enable of activate config,
> > > But It grabs that reference only in activation.
> > > That's why I used to "enable" parameter to distinguish this
> > > while I integrate with module_owner count.
> > >
> > > > >         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> > > > >                 if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > > > > -                       atomic_dec(&config_desc->active_cnt);
> > > > >                         atomic_dec(&cscfg_mgr->sys_active_cnt);
> > > > > -                       cscfg_owner_put(config_desc->load_owner);
> > > > > +                       cscfg_config_desc_put(config_desc);
> > > > >                         dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> > > > >                         break;
> > > > >                 }
> > > > > @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > > >                                      unsigned long cfg_hash, int preset)
> > > > >  {
> > > > >         struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > > > > -       const struct cscfg_config_desc *config_desc;
> > > > > +       struct cscfg_config_desc *config_desc;
> > > > >         unsigned long flags;
> > > > >         int err = 0;
> > > > >
> > > > > @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > > >         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > > > >         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> > > > >                 config_desc = config_csdev_item->config_desc;
> > > > > -               if ((atomic_read(&config_desc->active_cnt)) &&
> > > > > -                   ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > > > > +               if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > > > > +                               cscfg_config_desc_get(config_desc, true)) {
> > > > >
> > > > This obfuscates the logic of the comparisons without good reason. With
> > > > the true parameter, the function does no "get" operation but just
> > > > replicates the logic being replaced - checking the active_cnt is
> > > > non-zero.
> > > >
> > > > Restore this to the original logic to make it readable again
> > >
> > > It's not a replicates of comparsion logic, but if true,
> >
> > sorry - missed that point .
> >
> > > It get the reference of active_cnt but not get module reference.
> > > The fundemental fault in the UAF becase of just "atomic_read()"
> > > so, it should hold reference in here.
> > >
> > > So, If you think the cscfg_config_desc_get()'s parameter makes obfuscation,
> > > I think there're two way to modfiy.
> > >
> > >     1. cscfg_config_desc_get()/put() always grab/drop the module count.
> > >     2. remove cscfg_config_desc_get()/put() but just use atomic_XXX(&active_cnt) only
> > >         with cscfg_owner_get()/put()
> > >
> > > Any thougt?
> > >
> > > Thanks!
> > >
> > >
> >
> > The get and put functions are asymmetrical w.r.t. owner.
> >
> > The put will put owner if active count decrements to 0,
> > The get if not on enable path will put owner unconditionally.
> >
> > This means that the caller has to work out the correct input conditions.
> >
> > Might be better if:-
> >
> > get_desc()
> > {
> >     if (! desc->refcnt) {
> >        if (!get_owner())
> >            return false;
> >    }
> >    desc->refcnt++;
> >     return true;
> > }
>
> I think This makes another problem when
> it races with _cscfg_deactivate_config().
>
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
>
>                                               // sysfs
>                                               _cscfg_deactivate_config()
>                                               (sys_active_cnt == 0)
>                                               (config->active_cnt = 0)
> ...
> cscfg_csdev_enable_active_config()
>   lock(csdev->cscfg_csdev_lock)
>   // here get module reference??
>   // even sys_active_cnt == 0 and
>   // config->active_cnt == 1.
>   get_desc()
>   unlock(csdev->cscfg_csdev_lock)
>
>
>   // access to config_desc which freed
>   // while unloading module.
>   cfs_csdev_enable_config
>
>
> Because, the desc->refcnt meaning of zero is different from the context.
>    - while activate . it should get module reference if zero.
>    - while enable active configuration, if zero, it should be failed.
>
> that means to prevent this race, the core key point is:
>    when config->active_cnt == 0, it should be failed in cscfg_csdev_enable_active_config()
>

This is not a failure case, it simple means that this config should
not be activated for this device.
It is possible for a configuration to be active on the system, without
it being active for a particular coresight device.

Having a get/put interface for the config descriptor - which prevents
the config from being unloaded is fine, the key logic here is that we
are searching a list of possible enabled configurations for this
device and taking the necessary action to enable it if we find one -
and there can only ever be a single configuration enabled for a trace
session.

Therefore when the list of loaded configs for a device is > 1, then
all but one is allowed to be active - so the search code will validly
find instances where config->active_cnt == 0.

My objection to the original interface was not the get/put operations
to protect the module from unload, but the fact that the logic
deciding if a config needed to be enabled on the device was hidden
inside the get() operation.
My suggestion is to restore the logic that decides if there is a
config to enable on the device be clear in the enable function itself,
then use get/put as appropriate to prevent module unload.

Regards

Mike


> Because, according to context the handling the zero reference value is
> different, It seems,to integrate the get_desc() interface to handle
> above case together without extra arguments (in case of here is
> "enable").
>
> If this interface is really ugly and unhappy to you,
> I think It should remove get_desc()/put_desc().
> although we can add new interface for cscfg_config_desc_get() for enable
> path. but it makes people more confused.
>
> So my suggestion is:
>    - sustain this patch's contents
>    - or remove get_desc()/put_desc() interface but use
>      atomic_inc_zero(&config_desc->active_cnt) directly in
>      cscfg_csdev_enable_active_config()
>
> Any thougt?
>
> Thanks.



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

