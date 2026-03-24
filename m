Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058EAF54AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ot/g66ED1b3E4j/YAPW1gMfq9DWygqkYzjEZrylBGUs=; b=DDzCLSM4AYYoXg5b6Fx3Z3qgMh
	IM6JhXvEfE7pf9fijftF+6+N02sgm+UwhB0ADoIcXB2S5bu7vjIStaebBpEwmHqbKjldVvdTEjwhl
	G+6lj94tlfTosO52rC2OsVA0PIGkz+XfWN8NqCsbsHtG2lzCM4pdSgffIALlveJXKEPKkC/zY17+e
	lGJFyQ7xG5mUdStec0HQIo8SI45iJX1k4HBMQsjTOTwt1A57SUTmdVI/5w4P2DKvcgJyg/f2h0gog
	Szw+89EShFcWUpBlIkWoe8JcgugkrCaNFnxg3EWHdKQ2PcTR4gg2HLC9hUXS/rWVKQifrynqnCBIE
	tJBL+aRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52sn-00000001fFf-2ipH;
	Tue, 24 Mar 2026 14:37:25 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52sl-00000001fFG-3Rhh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:37:25 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-509062d829dso585681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363042; cv=none;
        d=google.com; s=arc-20240605;
        b=AViqC/llod3/+I++B57sagxoMpT+vj5RT5AsHcQxWm+ZPlWRzLwlJknSRfKHwTL/Tq
         6oIUXDlywd9Q46/cYoIGUHK6ioQIssEUZn1bDa0WQS4f4hhIyTJMwig8urtvMvPUKo45
         f/i5tPJrOcg4zT+D8TjlkdknM+dw/EjwHo1UPCiiY8N7P2ctmW5fsBHTkwue1yixfzOE
         VqQGfT3UsO0t5+v2l3debj8vUaGowf2F9jHcGizteGp8d3J99qklvg1zoKHlShErSKgk
         ZoKtxpfG1bkyUk1Hu0mNFaiVvXymgsesAAvYdCBuKDsQCv58NOioZ4Kw0s76LF3rTehz
         5oTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ot/g66ED1b3E4j/YAPW1gMfq9DWygqkYzjEZrylBGUs=;
        fh=AsOkl6KeEVHep3yGZnuLEwjFXyRtxdozqod7HHq0WCM=;
        b=OWqCrxu9PQfQ5fVYxcMRUde91tADz82CWbDXZAQ3ebmd5grQL+Sw7yJpMFn10WVm/F
         5/1/+r895vfTCDGzA0oGUwCDb9X7eUY30a0iU9SQ1tRbCn3WqrIaVMywl5tzMMTPv7j+
         fuOpwEq0LqgUt+uAupuJYD9G4esD7ReloZdm6j4Ut+5aRZ+LUUKsUmz77li7ScDGgFOV
         TIn1ax59YFiKooSS+gQWbdbn+2RjdjPMnrkzh146Ieimb6anCl85qfeG1nDVaJ4PmEcl
         SRHj7rnlXkVAr3YTRHvPIQ9UwGVdS0RSmcLxOz2e3vLVpDOKLAD1dkMnisJh6xASxFEe
         mvwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774363042; x=1774967842; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ot/g66ED1b3E4j/YAPW1gMfq9DWygqkYzjEZrylBGUs=;
        b=GXmnB9BxKApAVlMmcZ6hNDyn8DuMx/toghn1eJioR7VOnQg+p1WE8n2b5uC1IU7I4Y
         o3sd7k5kwd5eXTSV2ZNJCc/ZmaqttnZGYbdxIUanXjx1ZUrVUUOl+pHa7aFr4TE7zZGO
         6QmBY6kkj//5A2v8lTka55PNV8EFoXScWZOi5GRI/YzxC/Uv33Jh5nm6dw+c6BfXM/6Y
         MZZ5dAoeh+1AR1xjc110GvpZh5IBlY+7OYCr5hHykf0IKf/iIF33ck75FAqSZnc73GzH
         EeNfcmNCJwmmxvOLKanuYgxMsbg4UXP3IA3LY5Z1hpEpG6GRh8BGKiAbi+IN0shv7eSd
         6unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363042; x=1774967842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ot/g66ED1b3E4j/YAPW1gMfq9DWygqkYzjEZrylBGUs=;
        b=pTkVTJyzB2+4Y7JEnFNfvghbeMpz/0lc4zxWC9tHjn4HNxNmZ+724c1vPw60KGmVVJ
         ZjmCUbdyD3qtFYRTNrFY0baKT1hP8jbUKa2QNtr8OLFgq6NkbTrzZX5HDHX+3bfk1Otz
         onExbD22HHK0CP8UHHJ20cnWW5QcEeSN98EmSo8aA/zffNd0xxszsNChrS6G1RSVZ3tX
         ZgvqeB0uJ7BYebnYKb1QK0LB7QRk9vQQc4rPr5BYPHctYXq1d56SNchUcv5AT60qN8Jw
         pPxJF21H0ocerzfS6QOsefAAG9E9rRapw3oSc4r0f3bB34A4TFqn3bXygdZ5XJON5kww
         X+2w==
X-Forwarded-Encrypted: i=1; AJvYcCVY94XMzdrreFhBe2Uf19MxoCppuee5nvpmYU5WdEJDLHjy1iFBKkCJsMEro5F7uGeR8M6g8n1sKDQmuME/wwG2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7LXBcokFz6xmavbBGR5VsKCRdKowza83LjlNm9YPRkdpUprCC
	8dDAgIHkoQ+5cpLsG9HLWiAmPuuyINPKK7ICyV1UIjKZa/ZF7jh3RAk55CcfM2UUNt8qzE128KO
	ECRFv+GxMacrlTqa2BuDpLeU40PnAb9DO5PCnZtbbYLt++MtMnVYAnhYlsQs=
X-Gm-Gg: ATEYQzyWjKuQSumuKDueTsDE/3c0NMPzr8EdcPyF1ahCYdHJP7aJd+RkbqxZCl1hdZz
	Cq+jKPpco8U6AQrg7O5Ocqsi8Nf1EDu/TcGOHW98wJySsctkTObAGsYSjqXi9X/AI95PK0MQez2
	rC4JybkZ0nipIbirr77LxJ6uQZIfx8FIvntBw1biKTe7G6OK9DVvXrvpGRe4Z/XMC4FawtQ0Rfd
	w0IByRJrEuI38ldbt2mBifbN87+DYW0cq8t9lHiIaR4xvdsz44zopENt3cIL+P5pvdGZ9zYQ28l
	gxte11109/PIOr6Co866vK0KDmrJ97v0e/ak
X-Received: by 2002:a05:622a:20a:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-50b6fb96461mr15215721cf.12.1774363041055; Tue, 24 Mar 2026
 07:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-6-sebastianene@google.com> <CA+EHjTyG-rUp1M_4a=adBwqhAJ=JuHL5GaLmMBSi5o1ycaSu3A@mail.gmail.com>
 <ab1jnHvmIeh0PExw@google.com>
In-Reply-To: <ab1jnHvmIeh0PExw@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 24 Mar 2026 14:36:43 +0000
X-Gm-Features: AQROBzDy-GT9f8lanLVQaWs787bpI3GrHwllCWBkC0bZltTZW20kHdI-Z7YOLIg
Message-ID: <CA+EHjTwW_tUghZnqJcR5LByX4fPpdocGnM5FFA=4+CfPWpXOrA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260324_073723_909965_C5DE697E 
X-CRM114-Status: GOOD (  43.51  )
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

Hi Seb,

<snip>

> > You should decouple the synchronous pointer swapping (which must be
> > locked) from the hypervisor notification (which can be done outside
> > the lock). Instead of executing the callback inside the critical
> > section, its_end_deprivilege should:
> > - Lock everything.
> > - Perform the pointer swaps in the host driver structures.
> > - Save the hyp_shadow pointers to a temporary array.
> > - Unlock everything.
>
> I am afraid you can't do that because you can have dropped commands &
> timeouts between these two steps. The driver might put commands in the
> swapped queue and they will timeout.

You're right, that won't work. Simply releasing the lock between the
pointer swap and the hypercall (HVC) isn't safe for two reasons:
- Timeouts (your point): If we swap the pointers to the new shadow
queue and drop the lock, another CPU might immediately try to queue a
command. It will trap to EL2 (cwriter_write), but because the HVC
hasn't finished initializing the hypervisor's internal state
(region->priv), EL2 will
drop the MMIO write. The host will then spin in
its_wait_for_range_completion waiting for the hardware to process a
command it never saw, resulting in a timeout.
- Stage-2 Aborts: Conversely, if we try to run the HVC before swapping
the pointers, the HVC will actively unmap (donate) the original
queue's memory to EL2. If the host is not locked and tries to write to
the old queue during this window, it will trigger a Stage-2 Data Abort
and boom!

We must pause host command submission to the affected ITS while the
HVC is running. That said, I still don't think it's acceptable to do
what you propose in this patch. This holds the raw_spin_lock_irqsave
for way too long, keeping local interrupts disabled while performing
slow hypercalls for the entire system.

I had a bit of a think, and I have two ideas, one is an improvement,
but not a full solution. It's simple though, and it might be enough
for now and I am more confident that it works. The second one is a
better solution I think, assuming it works and I haven't missed
anything :)

Option A: Granular Locking (Per-ITS Lock & HVC)

In this patch its_start_depriviledge effectively locks *all* ITS nodes
in the system simultaneously. Then, its_end_depriviledge calls the HVC
for every single ITS sequentially, while the CPU is still holding all
the locks with interrupts globally disabled. This makes this critical
section very long. Making it shorter is pretty straightforward i
think...

Instead of trying to decouple the pointer swap from the HVC, we can
start by reducing the scope of the lock. We remove the global locking
in its_start_depriviledge. Inside its_end_depriviledge, we process one
ITS at a time:
1. Disable local interrupts and lock one specific ITS
(raw_spin_lock_irqsave(&its->lock)).
2. Perform the pointer swap AND the HVC for this specific ITS.
3. Unlock and re-enable local interrupts (raw_spin_unlock_irqrestore).
4. Move to the next ITS in the list.

This should be simple to implement. It guarantees zero dropped
commands and zero aborts because the swap and HVC remain atomic.
However, the CPU executing the deprivilege still holds a raw spinlock
during a hypercall, but the duration is reduced to a single ITS node
rather than the entire thing.

Option B: Software Quiescence (Driver-Level Pausing)
To make it so that the HVC runs outside of an atomic context (with
local interrupts enabled), maybe we can teach the ITS driver to
voluntarily pause command submission without holding the raw spinlock.

I was thinking that we introduce a new state flag, e.g.,
is_vmm_migrating, to struct its_node. Every ITS command goes through
the BUILD_SINGLE_CMD_FUNC macro. We modify this macro so that if a CPU
tries to send a command and sees this flag is true, it temporarily
drops the lock, re-enables its interrupts, spins (cpu_relax()), and
retries.

The deprivilege sequence per ITS then becomes:
1. Lock: Acquire its->lock.
2. Swap & Pause: Swap the pointers to the shadow queue and set
its->is_vmm_migrating = true.
3. Unlock: Drop its->lock and re-enable interrupts. (Any other CPU
trying to send a command to this ITS will now safely spin and wait).
4. The HVC: Execute the slow hypercall safely outside of atomic context.
5. Resume: Re-acquire its->lock, set its->is_vmm_migrating = false,
and drop the lock. (This wakes up any spinning CPUs, and they
immediately send their commands to the newly registered shadow queue).

The HVC runs safely with local interrupts enabled, guaranteeing that
no commands are dropped or sent to unmapped memory. If a hardware
interrupt fires on another CPU that requires sending an ITS command
exactly while the HVC is running, that CPU will be forced to spin.
However, this is no worse than aquiring locks, where that CPU would
have been spinning waiting for the raw spinlock anyway.

What do you think?

If you like, I could hack something and we could discuss it some more.

Cheers,
/fuad


>
> > - Loop through the temporary array and call the KVM cb to notify EL2.
> >
> > You should probably split this patch into two. The first patch would
> > implement the freeze/unfreeze locking mechanism, and the second would
> > swap the driver's internal memory pointers to the shadow structures,
> > and invoke the KVM callback to lock down the real hardware.
> >
> > Cheers,
> > /fuad
> >
>
> Thanks,
> Sebastian
>
> > > +       if (ret) {
> > > +               its_free_shadow_tables(hyp_shadow);
> > > +               return ret;
> > > +       }
> > > +
> > > +       /* Switch the driver command queue to use the shadow and save the original */
> > > +       its->cmd_write = (its->cmd_write - its->cmd_base) +
> > > +               (struct its_cmd_block *)shadow.cmd_shadow;
> > > +       its->cmd_base = shadow.cmd_shadow;
> > > +
> > > +       /* Shadow the first level of the indirect tables */
> > > +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> > > +               baser = shadow.tables[i].val;
> > > +
> > > +               if (!shadow.tables[i].shadow)
> > > +                       continue;
> > > +
> > > +               baser_phys = virt_to_phys(shadow.tables[i].shadow);
> > > +               if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48))
> > > +                       baser_phys = GITS_BASER_PHYS_52_to_48(baser_phys);
> > > +
> > > +               its->tables[i].val &= ~GENMASK(47, 12);
> > > +               its->tables[i].val |= baser_phys;
> > > +               its->tables[i].base = shadow.tables[i].shadow;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +int its_end_depriviledge(int ret_pkvm_finalize, unsigned long *flags, its_init_emulate cb)
> > > +{
> > > +       struct its_node *its;
> > > +       int i = 0, ret = 0;
> > > +
> > > +       if (!flags || !cb)
> > > +               return -EINVAL;
> > > +
> > > +       list_for_each_entry(its, &its_nodes, entry) {
> > > +               if (!ret_pkvm_finalize && !ret)
> > > +                       ret = its_switch_to_shadow_locked(its, cb);
> > > +
> > > +               raw_spin_unlock_irqrestore(&its->lock, flags[i++]);
> > > +       }
> > > +
> > > +       kfree(flags);
> > > +       raw_spin_unlock(&its_lock);
> > > +
> > > +       return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(its_end_depriviledge);
> > > +
> > >  static int __init its_probe_one(struct its_node *its)
> > >  {
> > >         u64 baser, tmp;
> > > diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> > > index 0225121f3013..40457a4375d4 100644
> > > --- a/include/linux/irqchip/arm-gic-v3.h
> > > +++ b/include/linux/irqchip/arm-gic-v3.h
> > > @@ -657,6 +657,30 @@ static inline bool gic_enable_sre(void)
> > >         return !!(val & ICC_SRE_EL1_SRE);
> > >  }
> > >
> > > +/*
> > > + * The ITS_BASER structure - contains memory information, cached
> > > + * value of BASER register configuration and ITS page size.
> > > + */
> > > +struct its_baser {
> > > +       void            *base;
> > > +       void            *shadow;
> > > +       u64             val;
> > > +       u32             order;
> > > +       u32             psz;
> > > +};
> > > +
> > > +struct its_shadow_tables {
> > > +       struct its_baser        tables[GITS_BASER_NR_REGS];
> > > +       void                    *cmd_shadow;
> > > +       void                    *cmd_original;
> > > +       size_t                  cmdq_len;
> > > +};
> > > +
> > > +typedef int (*its_init_emulate)(phys_addr_t its_phys_base, struct its_shadow_tables *shadow);
> > > +
> > > +void *its_start_depriviledge(void);
> > > +int its_end_depriviledge(int ret, unsigned long *flags, its_init_emulate cb);
> > > +
> > >  #endif
> > >
> > >  #endif
> > > --
> > > 2.53.0.473.g4a7958ca14-goog
> > >

