Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311871098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+6917AKy85ED59+Qx+OnszYcZiLLVdHxeZpo7ufA5w=; b=WJOQlUUMSEutsITdjncChaGF7h
	KARiGzXCdoIMIw11usq7Kp4WSIDoWFHK6E5GXnbCdhTAQfCZZM66SIYaz5Ye8kIIUUCxv9xSsdNgH
	yAnCfebLOpdY1CfhH6Fx/JrTJFlXUEpdASILzMRhYRdAu4v9HEFafF1R2i79eJRXEg7E2afPcuNHw
	ugHlFeUbIteK9JxQ5t621PL04Wh4h0VR9zaFeTZPGTOMhbjN5APnUc+obzv9m/vrwp7OxT8oyw3a4
	+Wvo0nsxmZf/Bjla6JD9/bZBV5kRND9lfzB85MKe4RMICYRwkLqp0c+cqlbxFRd2uP8WoMojYiQyX
	16cQaFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bVd-0000000D0jo-3DMF;
	Fri, 20 Mar 2026 15:11:33 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bVa-0000000D0ij-3R9R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:11:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6628cc1bd69so8880a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774019489; x=1774624289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+6917AKy85ED59+Qx+OnszYcZiLLVdHxeZpo7ufA5w=;
        b=eYfcItU55JZwTzgvzHp1fRlVXBWkUhZTqTOfs5OZPVhhN8DUhuZPmUY/seoFN1H+Ww
         pgFWLS7mLZAl3U63KCsNSL7U4E+9bnThcyyG6OxlUQ8HlsVsDzAZXBytq7uHyF/YkiNQ
         yaeL6Rg3Mfzt9NSJX1/b8gOCvuu+Hp8hWSnBU3X+W4vKSKZaKFoucA5EqjMztAu0JbFf
         mRa8gFIP34OeRgcp8EqKDVRoSqHXEWhzBnJdI9cPxai0hfRivKtrGuWQAgdRXFw3GNvp
         Uy6U84s+fHlUlkqn1dWMFtBby1oqijID2Z1JbEGkpgwHIj0eEFRTW4h2v0WmAMAQlCyA
         fE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774019489; x=1774624289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+6917AKy85ED59+Qx+OnszYcZiLLVdHxeZpo7ufA5w=;
        b=VUpR/v3+FJo2UM9RB9dQa80hI8i25TF88DsordTZEkYm+EH41c4Z+3mlhQ1EiAJHbO
         h1jbXpZEb/RWREB6hDdSKqG1Zdaw8M4qTXw5sX792wmQ24bXKgiwwueAeNNQK19SIErh
         uJiBLvJzUoROqidRvlme+SAwPLnawt8vd+nbOiV/1U+OkLVn5ntceIqAev/mrqEt3GcU
         f6WS7QhdXcjbLkK9Zx7X4ktcO13tfXDXrUyGVPjc23TTfCidrb0RncDmcmMGFHhfMV24
         4lCH6u+3VdNiOg5gDhxN26RkJweN2WxCNQ0Kvy+8YMXBSmGWIBFxEp+AnETB0zR610eq
         mPtA==
X-Forwarded-Encrypted: i=1; AJvYcCW+r2S6ePN577SYXxc0LRmCVkEUgG2O6uyLFXTi0tUDHLErd6FHKA1YMlUeqNoQal3q8VtqkDqE94mRGJ4zO60Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxeacrXxlAGA+pT5EjmVd6ZTES4j4pIbiHQRSj4DCoBUv+nFoCI
	ODj+JVgFkdFZ6gooXtoSxCGMIWA74ZbWS/Af3Aa3U/jgoD1nw3CT1iOiRv41rBnLnw==
X-Gm-Gg: ATEYQzzTI/pFxBotKIsD6N+vhRNJ8szlvHRZ37LAX9VJ2hTfLigB/dRRoqEP64ffPjb
	2u16snj1e9NY2meF2QdgypY9vglGFxXoiMImuulGFH8CwfrEXsJXzspNEAsHQn9QzCyCrf3ZjKv
	0mGV48EIDQDWv0BoVPdunTvrZIzzpspdlBW22m5OKEJ5XKG4eLIr3luKJLVetwA9niKSdh0PFTE
	Qhi4s2+vmO+KmCs5UezFDY81vIaFdDJGrbHNkkEdKkbawXrUgRXXBYPr9sPvtah8UALfNWsk6I7
	gR98fUJp8qTWZZ6tY+Ba3MaEBh97pjlFzmofpKDcQ3VXDFyan04wQtZ2OO7F7Pgq6gI9QNfQuB4
	792XI1PM6Km/wPR8q9jtgv+30ney4VmFmeRbCxxbgukCcuPjeX8mTQjnI3p54EjaZWmWJj1Cu0W
	aujqFevoRiRIxC/zjuk0mXUxGXsY2HK9NCQBh1IIg3DXegr/NPCU7UNzSdrLxX3XDtesQ=
X-Received: by 2002:aa7:c145:0:b0:665:17ce:4acb with SMTP id 4fb4d7f45d1cf-668cf308958mr49011a12.4.1774019488260;
        Fri, 20 Mar 2026 08:11:28 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm74243705e9.4.2026.03.20.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:11:27 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:11:24 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tglx@kernel.org,
	vdonnefort@google.com, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 05/14] irqchip/gic-v3-its: Prepare shadow structures for
 KVM host deprivilege
Message-ID: <ab1jnHvmIeh0PExw@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-6-sebastianene@google.com>
 <CA+EHjTyG-rUp1M_4a=adBwqhAJ=JuHL5GaLmMBSi5o1ycaSu3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyG-rUp1M_4a=adBwqhAJ=JuHL5GaLmMBSi5o1ycaSu3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_081130_917176_37549CD0 
X-CRM114-Status: GOOD (  48.81  )
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

On Fri, Mar 13, 2026 at 11:26:04AM +0000, Fuad Tabba wrote:

Hi Fuad,

> Hi Sebastian,
> 
> On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > Expose two helper functions to support emulated ITS in the hypervisor.
> > These allow the KVM layer to notify the driver when hypervisor
> > initialization is complete.
> > The caller is expected to use the functions as follows:
> > 1. its_start_deprivilege(): Acquire the ITS locks.
> > 2. on_each_cpu(_kvm_host_prot_finalize, ...): Finalizes pKVM init
> > 3. its_end_deprivilege(): Shadow the ITS structures, invoke the KVM
> >    callback, and release locks.
> > Specifically, this shadows the ITS command queue and the 1st level
> > indirect tables. These shadow buffers will be used by the driver after
> > host deprivilege, while the hypervisor unmaps and takes ownership of the
> > original structures.
> 
> Just a note again on preferring not to use the "shadow" terminology. I
> thought about it a bit more, since these are not at the host, perhaps
> "proxy" is a better term, to convey that the host is writing to a
> middle-man buffer.
> 
> Another term is "staging," which is common in DMA: the host "stages"
> the commands here, and EL2 "commits" them to the hardware.

Sure, happy to use one of the two indicated ones.

> 
> >
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  drivers/irqchip/irq-gic-v3-its.c   | 165 +++++++++++++++++++++++++++--
> >  include/linux/irqchip/arm-gic-v3.h |  24 +++++
> >  2 files changed, 178 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 291d7668cc8d..278dbc56f962 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -78,17 +78,6 @@ struct its_collection {
> >         u16                     col_id;
> >  };
> >
> > -/*
> > - * The ITS_BASER structure - contains memory information, cached
> > - * value of BASER register configuration and ITS page size.
> > - */
> > -struct its_baser {
> > -       void            *base;
> > -       u64             val;
> > -       u32             order;
> > -       u32             psz;
> > -};
> > -
> >  struct its_device;
> >
> >  /*
> > @@ -5232,6 +5221,160 @@ static int __init its_compute_its_list_map(struct its_node *its)
> >         return its_number;
> >  }
> >
> > +static void its_free_shadow_tables(struct its_shadow_tables *shadow)
> > +{
> > +       int i;
> > +
> > +       if (shadow->cmd_shadow)
> > +               its_free_pages(shadow->cmd_shadow, get_order(ITS_CMD_QUEUE_SZ));
> > +
> > +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> > +               if (!shadow->tables[i].shadow)
> > +                       continue;
> > +
> > +               its_free_pages(shadow->tables[i].shadow, 0);
> > +       }
> > +
> > +       its_free_pages(shadow, 0);
> > +}
> > +
> > +static struct its_shadow_tables *its_get_shadow_tables(struct its_node *its)
> > +{
> > +       void *page;
> > +       struct its_shadow_tables *shadow;
> > +       int i;
> 
> Prefer RCT declarations.
> 
> > +
> > +       page = its_alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, 0);
> 
> This is called with the raw_spin_lock_irqsave held, and GFP_KERNEL can
> sleep. You have one of two options, either use GFP_ATOMIC, but that's
> more likely to fail. The alternative is to move this to
> its_start_deprivilege(), before any lock is held.
> 

Thanks, I will try to move the allocation before the lock.

> > +       if (!page)
> > +               return NULL;
> > +
> > +       shadow = (void *)page_address(page);
> > +       page = its_alloc_pages_node(its->numa_node,
> > +                                   GFP_KERNEL | __GFP_ZERO,
> > +                                   get_order(ITS_CMD_QUEUE_SZ));
> > +       if (!page)
> > +               goto err_alloc_shadow;
> > +
> > +       shadow->cmd_shadow = page_address(page);
> > +       shadow->cmdq_len = ITS_CMD_QUEUE_SZ;
> > +       shadow->cmd_original = its->cmd_base;
> > +
> > +       memcpy(shadow->tables, its->tables, sizeof(struct its_baser) * GITS_BASER_NR_REGS);
> > +
> > +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> > +               if (!(shadow->tables[i].val & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               if (!(shadow->tables[i].val & GITS_BASER_INDIRECT))
> > +                       continue;
> > +
> > +               page = its_alloc_pages_node(its->numa_node,
> > +                                           GFP_KERNEL | __GFP_ZERO,
> > +                                           shadow->tables[i].order);
> > +               if (!page)
> > +                       goto err_alloc_shadow;
> > +
> > +               shadow->tables[i].shadow = page_address(page);
> > +
> > +               memcpy(shadow->tables[i].shadow, shadow->tables[i].base,
> > +                      PAGE_ORDER_TO_SIZE(shadow->tables[i].order));
> > +       }
> > +
> > +       return shadow;
> > +
> > +err_alloc_shadow:
> > +       its_free_shadow_tables(shadow);
> > +       return NULL;
> > +}
> > +
> > +void *its_start_depriviledge(void)
> 
> Typo here and elsewhere in this patch:
> 
> s/depriviledge/deprivilege/g
> 
> This is particularly important because it also appears in exported
> symbols as well (later in this patch).
>

Ack, will fix this.

> > +{
> > +       struct its_node *its;
> > +       int num_nodes = 0, i = 0;
> > +       unsigned long *flags;
> 
> RCT declaration order, and please untagle them, i.e., don't declare
> the num_nodes and the iterator in the same line.
>

Ack,

> > +
> > +       raw_spin_lock(&its_lock);
> > +       list_for_each_entry(its, &its_nodes, entry) {
> > +               num_nodes++;
> > +       }
> > +
> > +       flags = kzalloc(num_nodes * sizeof(unsigned long), GFP_KERNEL_ACCOUNT);
> 
> Same as the other allocation. This can sleep. I think that for this as
> well, it's better to move it before lock acquisition. Even if you use
> a different allocator, it's still better to keep the critical section
> short.
> 
> > +       if (!flags) {
> > +               raw_spin_unlock(&its_lock);
> > +               return NULL;
> > +       }
> > +
> > +       list_for_each_entry(its, &its_nodes, entry) {
> > +               raw_spin_lock_irqsave(&its->lock, flags[i++]);
> > +       }
> > +
> > +       return flags;
> > +}
> > +EXPORT_SYMBOL_GPL(its_start_depriviledge);
> > +
> > +static int its_switch_to_shadow_locked(struct its_node *its, its_init_emulate init_emulate_cb)
> > +{
> > +       struct its_shadow_tables *hyp_shadow, shadow;
> > +       int i, ret;
> > +       u64 baser, baser_phys;
> > +
> > +       hyp_shadow = its_get_shadow_tables(its);
> > +       if (!hyp_shadow)
> > +               return -ENOMEM;
> > +
> > +       memcpy(&shadow, hyp_shadow, sizeof(shadow));
> > +       ret = init_emulate_cb(its->phys_base, hyp_shadow);
> 
> You are performing this callback with the lock held and local
> interrupts disabled. The hvc call is byitself expensive, especially
> since it's going to do stage-2 manipulations.
> 
> You should decouple the synchronous pointer swapping (which must be
> locked) from the hypervisor notification (which can be done outside
> the lock). Instead of executing the callback inside the critical
> section, its_end_deprivilege should:
> - Lock everything.
> - Perform the pointer swaps in the host driver structures.
> - Save the hyp_shadow pointers to a temporary array.
> - Unlock everything.

I am afraid you can't do that because you can have dropped commands &
timeouts between these two steps. The driver might put commands in the
swapped queue and they will timeout.

> - Loop through the temporary array and call the KVM cb to notify EL2.
> 
> You should probably split this patch into two. The first patch would
> implement the freeze/unfreeze locking mechanism, and the second would
> swap the driver's internal memory pointers to the shadow structures,
> and invoke the KVM callback to lock down the real hardware.
> 
> Cheers,
> /fuad
> 

Thanks,
Sebastian

> > +       if (ret) {
> > +               its_free_shadow_tables(hyp_shadow);
> > +               return ret;
> > +       }
> > +
> > +       /* Switch the driver command queue to use the shadow and save the original */
> > +       its->cmd_write = (its->cmd_write - its->cmd_base) +
> > +               (struct its_cmd_block *)shadow.cmd_shadow;
> > +       its->cmd_base = shadow.cmd_shadow;
> > +
> > +       /* Shadow the first level of the indirect tables */
> > +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> > +               baser = shadow.tables[i].val;
> > +
> > +               if (!shadow.tables[i].shadow)
> > +                       continue;
> > +
> > +               baser_phys = virt_to_phys(shadow.tables[i].shadow);
> > +               if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48))
> > +                       baser_phys = GITS_BASER_PHYS_52_to_48(baser_phys);
> > +
> > +               its->tables[i].val &= ~GENMASK(47, 12);
> > +               its->tables[i].val |= baser_phys;
> > +               its->tables[i].base = shadow.tables[i].shadow;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +int its_end_depriviledge(int ret_pkvm_finalize, unsigned long *flags, its_init_emulate cb)
> > +{
> > +       struct its_node *its;
> > +       int i = 0, ret = 0;
> > +
> > +       if (!flags || !cb)
> > +               return -EINVAL;
> > +
> > +       list_for_each_entry(its, &its_nodes, entry) {
> > +               if (!ret_pkvm_finalize && !ret)
> > +                       ret = its_switch_to_shadow_locked(its, cb);
> > +
> > +               raw_spin_unlock_irqrestore(&its->lock, flags[i++]);
> > +       }
> > +
> > +       kfree(flags);
> > +       raw_spin_unlock(&its_lock);
> > +
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(its_end_depriviledge);
> > +
> >  static int __init its_probe_one(struct its_node *its)
> >  {
> >         u64 baser, tmp;
> > diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> > index 0225121f3013..40457a4375d4 100644
> > --- a/include/linux/irqchip/arm-gic-v3.h
> > +++ b/include/linux/irqchip/arm-gic-v3.h
> > @@ -657,6 +657,30 @@ static inline bool gic_enable_sre(void)
> >         return !!(val & ICC_SRE_EL1_SRE);
> >  }
> >
> > +/*
> > + * The ITS_BASER structure - contains memory information, cached
> > + * value of BASER register configuration and ITS page size.
> > + */
> > +struct its_baser {
> > +       void            *base;
> > +       void            *shadow;
> > +       u64             val;
> > +       u32             order;
> > +       u32             psz;
> > +};
> > +
> > +struct its_shadow_tables {
> > +       struct its_baser        tables[GITS_BASER_NR_REGS];
> > +       void                    *cmd_shadow;
> > +       void                    *cmd_original;
> > +       size_t                  cmdq_len;
> > +};
> > +
> > +typedef int (*its_init_emulate)(phys_addr_t its_phys_base, struct its_shadow_tables *shadow);
> > +
> > +void *its_start_depriviledge(void);
> > +int its_end_depriviledge(int ret, unsigned long *flags, its_init_emulate cb);
> > +
> >  #endif
> >
> >  #endif
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

