Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECA2105F7A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2824ihBrNFYuwpLFQ3XBkstk4E3T4O896zITIcBZAI=; b=z8sghu3a61B70AUyUWILtb6Pso
	nm4vvjkdyqvIIzkKGTyP4ItjiI+OSs2Ehd+vXdx1QpsW0mlsu8xp29VwAocUoQIwZwJOqlLIQgyML
	/sARuFkeTC703OnOvJQf9+5N3wGooto0QMc/ip1BwV0P7FhrH9Ply5gs23Zd0gVfnYk/RSECxno7p
	YKVaxS4N0blaCG3EOzU298xxlotTFye7ptYnctmg6ZINNPWFrGnRzTL/Qnkc7WT06j/BJnevONMji
	RL9Bo4AaIa/8ocruJl8EPNTZBkWPz56MLSz1wD2uomkpMC9qwh1OjFmOF1Ea1CzI+/WA18rDdFgHp
	wu4Y+tmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12I6-00000000BGw-2xCP;
	Fri, 13 Mar 2026 13:11:00 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12I3-00000000BGQ-3LEt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:10:57 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5091ed02c54so401761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773407454; cv=none;
        d=google.com; s=arc-20240605;
        b=LoJZ0tNbTC1a+4Lad3rkhrx0b+7rp1SmeKmcySf+85i/RXdRf9tC9cry/yixFQGcEP
         xWTAnxDBe/DCG6rE28bEWnsQmzdE+ajZbV9n06dmC6sljq9mwGuaKH1ogPQEZioSZBqB
         7NukS9PNmMLo7achuwhfhNQyLsizwflFiWsvqiLbeKha96xv+SAGqG2HImoJLtTMXbu+
         dAslRcL+ge92fbZZLxPIEO6jdigtRmVt1p4AFzeDxgSiIGXYCfVpdoABIyHObH7bkQVR
         TvYOm4X7ge6AwEEeU1wN30WAZverpGWwQoFCrPvgyG7Ojqi66aaTVLgKSPcya08i+tVa
         jaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k2824ihBrNFYuwpLFQ3XBkstk4E3T4O896zITIcBZAI=;
        fh=v1H2dov6hNqbXxbPxWs/8F4r73XGHDtdujLCpWBZP38=;
        b=dcWUKkGA/9iGHzxBz0SymsjaRAXFMnMICz1RCMHHywrlP/OACuQCf/E7OnwM3X8ClD
         oxQltNOpCwu0Uh45Y5PfSyoRhUajlq5F9RLApYZ7EPuM4LcvbZ/zsji0MXO9FrwEpeJE
         XXdVn7j3VH2T23+qsZuI0fF2wWFavMe4ey0PfzIo8AeRMpoEx2M4lVcLhu4E80+3NoU7
         0oV4wb9HpkLuviQFqHbkkvZ17hYgKze+p5OfkNvIEwtA0gj5cjfErNkGjEzmVqLHSxbR
         MtHagEnOy/7vSwXMu5NcFrvjBLhvvvlHx76+LGxAjIRUYIYR7UXrGUJ1XjNh8wt1MRUX
         tPMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773407454; x=1774012254; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2824ihBrNFYuwpLFQ3XBkstk4E3T4O896zITIcBZAI=;
        b=UPPZKERYInCsbIdwpLV95E/NRRXQxUi7cOwkiVPjo7I8n0JrrHxdMzoFCBSyVaPNNz
         gZtZ7iHx8K7/E1rDljKIj63kbW10Fv3hFFQsFgaeQU4/UMNTgVBUWvt1OlDk4+ywsgWR
         YSvZQhvhOK9uBxojTiBFn16002xwSnw9yKb2dO/AKd1NDp7vGbOttt766EhwfN6Gs8qg
         AEtzcziUFVs8Z3pf277fkGxp7jck81EhkJj1En26HY63vNMABo9O43thHulPTqQENvLa
         5BLSAkRuDOXJMZUfto0MpHrCZURAa950Td5k/jtSjpiyffqcuxx9HtaGCHv37L4RN9HR
         Tc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407454; x=1774012254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2824ihBrNFYuwpLFQ3XBkstk4E3T4O896zITIcBZAI=;
        b=IQA8dE1PwVl85funSS5WnkxxF7RdtX6meDMqbrkM410xvzfN1iJW4uK5nyn4K0zRo8
         wh94NblOL+vOw7y4w1DwqMQQwzwendJz9QaN7z1rT2enaeGrgl7HwYL0JOLaMePpbvAi
         8cxDVEqFy2yy9ZBkotosRCTovLuC38rf7fWDazzO6DVkGiooXJkiEsVL71UA9ozi7KJJ
         r+rrJOsDLtLzKpcaFUsRyhEIlKwvzpjZOsRAHyRN+YclGbWFWICkIulsmeg/GqNsYCbO
         M7N4VTo/cYps6VEayKmCkpn7ESkKcDOWD4bNqDmNk9YVf6dRigYVeR5BxLiKIUNZfy7L
         afTg==
X-Forwarded-Encrypted: i=1; AJvYcCXvvcWzA79QUvh4U6neaV6hBIvm23Gl+z/bafcLP4REa1KYUJPEiCBb4oihUV+2KLwKdS9GZYI8GiLclgaRyaGl@lists.infradead.org
X-Gm-Message-State: AOJu0YyzOHLmPvacQ3Syxk+SEnx515ikQckpxtlxLeymeYUARpEBo151
	bOclQMT/jfVrlTjdzn2tpHUjkmCM0cxfrwvz24C7jroz+Vu6ykNwsUZyptd7CkoT/5+m02sj3Cx
	VkqBOaBNLNgDuwD+Q2vGPVazQBhmucLeuZzsY4HLq
X-Gm-Gg: ATEYQzzbAi0s1fJQgUSHkahqdskrXgBtXIhhysx/uJNLc2n9NpatD9QjAuWAPioGspF
	Sy8aORH41yEV+QqKFM7u1okx++2/K/VsnSz6G8OAxCkOY1mRD4AcfGJ6C2B9Q4ctH5Oht+uXkJt
	BDlrmLDB679aeOA8gYOXgHVq2GzPHfhO3Z5LQDQ04AUGvqraqHiyRAfdrnwiETrTVq4q2ghq+Nd
	XtLM5ZuvwRQW0qi7y5bz3tk8ZYzxefVQIN4PIZq7q2qEAj6BXQukIuGSTvD95ASrf0+ZzT6DmqY
	BNp/mGG3
X-Received: by 2002:a05:622a:302:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-50959d3390bmr8753721cf.1.1773407453607; Fri, 13 Mar 2026
 06:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-6-sebastianene@google.com> <CA+EHjTyG-rUp1M_4a=adBwqhAJ=JuHL5GaLmMBSi5o1ycaSu3A@mail.gmail.com>
In-Reply-To: <CA+EHjTyG-rUp1M_4a=adBwqhAJ=JuHL5GaLmMBSi5o1ycaSu3A@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 13 Mar 2026 13:10:16 +0000
X-Gm-Features: AaiRm52ag_W_RZsir3EPL3s97XPPa2qdUtGLF9Hm3giVrEtDIbzHstdygFaONQg
Message-ID: <CA+EHjTx-Cs4VGB-K9pk5gss5j3Qjif4HAqqSdzP5TUzbjbc1EQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] irqchip/gic-v3-its: Prepare shadow structures for
 KVM host deprivilege
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061055_899324_9B429638 
X-CRM114-Status: GOOD (  46.02  )
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

On Fri, 13 Mar 2026 at 11:26, Fuad Tabba <tabba@google.com> wrote:
>
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

I meant to say that, since these are not at the "hypervisor", or since
they *are* allocated in host.....

>
> Another term is "staging," which is common in DMA: the host "stages"
> the commands here, and EL2 "commits" them to the hardware.
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
> > +{
> > +       struct its_node *its;
> > +       int num_nodes = 0, i = 0;
> > +       unsigned long *flags;
>
> RCT declaration order, and please untagle them, i.e., don't declare
> the num_nodes and the iterator in the same line.
>
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

