Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD132C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXsE9y2Afxlva29zdGgs2SskF2xRtMQxmsyYTKFV2Ps=; b=PWDZD853peS0zJTg7RYACRF7ho
	f9z3FQlcFy874H86JDi9TPxtrN3NnlKJbwxNp/DdWBKl2cgzlwXV9CejTRrHPTGdKLNF7kOZgplzp
	I2s70YR5fcKbwLA3CuUpZpCWqjkt5ZCSDrDmTHn1u6TESBI67PCvT7ME/WQ4LR33pP9gi091Imgi2
	xle15yqRIlZZUusVOvnCtscbhWcpQqV0KKDcz2FBN3AguU8D4b5RKeXDVXWpN7zKkv4tIGQT+cMBc
	ey4v30RCfvQq5L8uh5Oi3fpI9SnW49Th4f3L+2GZhmSWftO3i8gbG4qV8QPHq8/53OZvGX5zW56kt
	I2W9G08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZ8j-0000000HERY-2yjx;
	Mon, 24 Aug 2026 18:11:21 +0000
Received: from out-250.mta0.migadu.com ([2001:41d0:1004:224b::fa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZ8g-0000000HERC-0yo3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:11:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=E2jaU37tQeUcIjkW19HoffUL927um7nsAS5L5j9Rxw8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787595075; v=1; x=1788199875;
 b=nUzxDXLelmip+hu815qSh/beuiCouJLyJZKXIJyyX6LggKUAFZc+e4lUYu3gfQkTQyEa/w7i
 WHp5YTXx9jDBeselEz65FH84NXA04ha3nsbmv3quJYhUiuX7uolQsbTSytSt2znDFE5QuJmeNh+
 uIZdbSVx0W0kPQccVB/1ki10=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f46.google.com (209.85.167.46)
	by smtp.migadu.com with ESMTPS id f08e1ea7a6e8a92d;
	Mon, 24 Aug 2026 18:11:15 +0000
X-Mizu-Trace-ID: f08e1ea7a6e8a92d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso897e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqUq7Th/hCjo/Y41MUMgEMlxPy+ie4h3CeFmyLPeX1P4wB3FlXy3SSr3CN/GbrdbfZPrNfSUMBDKVPA+dFUqUdD@lists.infradead.org
X-Gm-Message-State: AFuF++lNtGagPxTXdUQLeCcZ5VibnUqKXZK06lfEZVV3tsTqwE5evgk5
	N4CXtEEX0WFD/tYQIqpRYbW4o333HpfTubFgUDvrL9DSt1EXRoZRzJ2jRHPVADFLHSqkSECGOtl
	5T7zn4ER+L9B1W4dvhA0YUI5vTKAy7rP7VYU0rd9R
X-Received: by 2002:a05:6512:688a:20b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b49cfb11bbmr1e87.3.1787595073680; Mon, 24 Aug 2026 11:11:13
 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com> <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
 <aoxzjag7xr_emuvX@google.com>
In-Reply-To: <aoxzjag7xr_emuvX@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 19:10:37 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
X-Gm-Features: AcwNN1XJpoXidKq07m2BnDIJg0Ftg4tyZwrDQ0iNhfHbpQ5gmaLqF6lsd5lLiJY
Message-ID: <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_111119_217037_402442E1 
X-CRM114-Status: GOOD (  35.12  )
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

On Mon, 24 Aug 2026 at 17:38, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Tue, Aug 18, 2026 at 04:28:38PM +0100, Fuad Tabba wrote:
> > Hi Vincent,
> >
> > On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > Integrate the pKVM memory reclaim interface with the host's memory
> > > management subsystem.
> > >
> > > This allows the host to automatically recover unused memory fom the
> > > hypervisor's heap allocator when the host is under memory pressure.
> > >
> > > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > >
> > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > index d28422f5c3d6..bfbb1266491d 100644
> > > --- a/arch/arm64/kvm/pkvm.c
> > > +++ b/arch/arm64/kvm/pkvm.c
> > > @@ -115,7 +115,7 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
> > >         return ret;
> > >  }
> > >
> > > -static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> > > +static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> >
> > This is the first caller of these, so it is where reclaim starts
> > running against a concurrent top-up.
> >
> > Nothing marks the pages a top-up just put in allocator->mc as spoken
> > for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
> > so a shrink with target 1 hands back the lot. Land that between a
> > top-up and the retry it was for, and the retry asks again, and
> > pkvm_call_hyp_req() goes round.
>
> Sorry, I am not sure I follow here.
>
> IIRC, the shrinker will only reclaim half of what is available. So the pressure
> should be proportional to what is available and limit races with topup!

It's the ordering, not the amount.

topup and its retry are separate hypercalls, lock dropped between
them, so a shrink on another CPU can slip in, right? .
hyp_allocator_reclaim() drains allocator->mc, where the topup pages
sit, before any chunk, so half still comes out of them first: a target
of 1 fails the retry.

>
> However now looking at it. I wonder if I don't want to ratelimit here the number
> of pages reclaimed in one go to limit the time spent at EL2. Especially we do
> all that with the allocator lock taken...

Ratelimiting would cap the time under the lock, but it wouldn't stop a
concurrent shrink from taking the topup pages, would it?

Cheers,
/fuad


>
> >
> > Both are driven by memory pressure, so they are busiest together.
> > Worth holding back what a pending request asked for?
> >
> > >  {
> > >         struct kvm_hyp_memcache mc;
> > >         struct arm_smccc_res res;
> > > @@ -133,7 +133,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
> > >         return reclaimed;
> > >  }
> > >
> > > -static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> > > +static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> > >  {
> > >         return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
> > >  }
> > > @@ -342,8 +342,19 @@ void __init pkvm_selftests(void)
> > >  #endif
> > >  }
> > >
> > > +static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> > > +{
> > > +       return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
> > > +}
> > > +
> > > +static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> > > +{
> > > +       return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
> > > +}
> >
> > Returning 0 rather than SHRINK_STOP when reclaim comes back empty
> > leaves do_shrink_slab() calling this until total_scan runs out, and
> > each call is an HVC. count_objects() covers the case where there is
> > nothing at all, but not the one where it goes stale between the two
> > calls.
> >
> > Cheers,
> > /fuad
>
> Ha right, that SHRINK_STOP seems indeed to be the convention for other users.
>
> --
> Vincent
> >
> > > +
> > >  static int __init finalize_pkvm(void)
> > >  {
> > > +       struct shrinker *pkvm_shrinker;
> > >         int ret;
> > >
> > >         if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
> > > @@ -359,10 +370,21 @@ static int __init finalize_pkvm(void)
> > >         kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
> > >
> > >         ret = pkvm_drop_host_privileges();
> > > -       if (ret)
> > > +       if (ret) {
> > >                 pr_err("Failed to finalize Hyp protection: %d\n", ret);
> > > +               return ret;
> > > +       }
> > >
> > > -       return ret;
> > > +       pkvm_shrinker = shrinker_alloc(0, "pkvm");
> > > +       if (pkvm_shrinker) {
> > > +               pkvm_shrinker->count_objects = pkvm_shrinker_count;
> > > +               pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> > > +               shrinker_register(pkvm_shrinker);
> > > +       } else {
> > > +               kvm_err("Failed to register shrinker for pKVM\n");
> > > +       }
> > > +
> > > +       return 0;
> > >  }
> > >  device_initcall_sync(finalize_pkvm);
> > >
> > > --
> > > 2.55.0.508.g3f0d502094-goog
> > >
> > > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> > >
> >
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >

