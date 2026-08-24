Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E13C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oifvu65sIA0XdhJEnNqAtZI4A+dT6SUlucjIQqK6vsQ=; b=lNUvZKzdRmLjdtNvA2MdmuDKJJ
	3NS3mzKhOQypnbtJedQ0+N82tqAH2IdudY77owsRbAdzR2ahNJUAte1E+fzNqZkC4DqvweHKdfUfT
	8/vwK9sN8tc6t65wdzAdMpfO3Wx3IzQl3XM+6xpdGkZXz/0bTVKr+xj+4xtsN34QT0Kw61k9HgREr
	0IPb27RQvrovfgGH+QPewCqlwYXogYkGjwZzIVd9HfH4wH9JkbU6YWzXSzih2hDKW2qIa5pp6C3qo
	WXIl/8psQgELCO/ltOrVcKPB1pP6sCfoIQ2ZeBWGF+ntOyzO0xPZKXAZWKb8g05rZAp5dNqY8qi1z
	e4d7/+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXhA-0000000H470-1X7m;
	Mon, 24 Aug 2026 16:38:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXh6-0000000H460-1An0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:38:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1892599f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787589522; x=1788194322; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oifvu65sIA0XdhJEnNqAtZI4A+dT6SUlucjIQqK6vsQ=;
        b=ZX9CmqeQ30cliKOoGGLSHAf4Oh2jAKJw+BpWqD5VA9CnQjcmQpz2GDXYo8XpK7axOr
         rDDte0TB+G5QxRlu6HUCWgGLZ3DCQoYa+ya6owfYJwgPwHMtQbiEcW0+N3JsvzZSkDmX
         HsQHPL4pFuJ2gtXyTTBeEqtpO8F3H/2yA2UFSOxl3WY65OT6IQc+h1z/3z0YE8fzF19k
         SLOgfskW0KvTNmGxmHwv3aj3YMl8V8DH1ogyZKKQ0lrolMyBKH3wzpBktUfs5mFoZ+Gw
         FcJULcxOSpvF+iQ9mk6XCV4gTSW10B2PnYkuzaEb7xEfyjAEjAzbdQk+daj2M8Vcnw2m
         tPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589522; x=1788194322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oifvu65sIA0XdhJEnNqAtZI4A+dT6SUlucjIQqK6vsQ=;
        b=A4AvjQXWASX2w6z2CbVRbQ0v1TwhBBvCWiJ14rLs0QrKoNTztpBU48VtMUWZ65i2tO
         D8v42WhZ/asrVwZnwrFsxKwvNW01M5Mt3bCJizwM3M+4DIGx1238ajYb7KkVroV3I1yy
         vBboKrV7MSt4AtAh52GIok1TcdHr+3q3InVwMmLZsFbPPn4/2OOiXAlIRfj7ylEN8a7l
         iwBWGs9aonS0rMBVFC1St4Oq/Bf9qh76FQF3GHSXJxWj0Y0OpMjZphuPQz68oKzP2vFj
         oWDUSbIJ/WqFs0n066Tp8BY/0dJW341j/anXnwOp1xeM2WyHve6jRNQn0WHlFlUy/U+G
         OK/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqin/ozW3I6drWmmtamK/KX57KR38Bbf9Y66r6JBYYGpiniNln7fi8W3c+4Xs4yfVm3sHIRhDcyu8yW4BCrvjka@lists.infradead.org
X-Gm-Message-State: AFuF++lgAO9xoFl9FB+GvF85idF9txfGOBlWFO5+UHE98FHvc/tWXIeG
	GjVDqvX9MfyxYMkCg8yfpHs0u1iLGEG6n+vxTj2Uov8RsOeDoyOmkGRP9KFHs351ZA==
X-Gm-Gg: AR+sD10BAWvGT3l7Cmqc4lguSyF/83+dz3eCgyHQnfD2piXIEgBDPo3Wzz86cif3SFa
	p9sJZkC5TM0fRxBdAR+8FnNsgG4SBWRr4V4ha35ZDU2MbJWYl1N7VgxksAxqS9Ugwgr34Y7FLCA
	FsVLZNW847JKxaOSxdMKsbEfcZk2ZaD+S1NmW7YtDosJrn5a+TargjkmGNqv6GJ/x91Km/gsNsl
	XW+H3PcjAISKDuOymFCiYxZB754L5ABoOsgtxyqP5WAj6TUOMuoNdzhxVN0TZ/VwSzEH8xvM0tn
	fNw/yjDvQvHWTfjFgHid4sSjcNZEb5uCgVyoLYaCI20Zbq2f5j3pSlekJJRI9Krfutxs9lbE7EY
	bnlUkTTeNQiyIDQoEpxKkI7zcA/rwGYhSQY9RMJlvtm/hbj+s7YqXsslWRx/zITz+bwKjdtSuET
	+cKEvWvhVhAvhKs9yzj+PiVD32PQri7GvQUXSN5KVsVm/hCDjwIz7e7zxp5HJCHAwA5qPbEU0KC
	hlPR3pdqhtLxjXwT+tU67ws1QUSg8YF
X-Received: by 2002:a5d:64c4:0:b0:47f:e377:8d61 with SMTP id ffacd0b85a97d-482c0b99d81mr33579028f8f.11.1787589521794;
        Mon, 24 Aug 2026 09:38:41 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69a60sm8912087f8f.1.2026.08.24.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:38:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:38:37 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
Message-ID: <aoxzjag7xr_emuvX@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com>
 <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_093844_350436_2F4464E7 
X-CRM114-Status: GOOD (  31.53  )
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

On Tue, Aug 18, 2026 at 04:28:38PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > Integrate the pKVM memory reclaim interface with the host's memory
> > management subsystem.
> >
> > This allows the host to automatically recover unused memory fom the
> > hypervisor's heap allocator when the host is under memory pressure.
> >
> > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index d28422f5c3d6..bfbb1266491d 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -115,7 +115,7 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
> >         return ret;
> >  }
> >
> > -static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> > +static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> 
> This is the first caller of these, so it is where reclaim starts
> running against a concurrent top-up.
> 
> Nothing marks the pages a top-up just put in allocator->mc as spoken
> for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
> so a shrink with target 1 hands back the lot. Land that between a
> top-up and the retry it was for, and the retry asks again, and
> pkvm_call_hyp_req() goes round.

Sorry, I am not sure I follow here.

IIRC, the shrinker will only reclaim half of what is available. So the pressure
should be proportional to what is available and limit races with topup!

However now looking at it. I wonder if I don't want to ratelimit here the number
of pages reclaimed in one go to limit the time spent at EL2. Especially we do
all that with the allocator lock taken...

> 
> Both are driven by memory pressure, so they are busiest together.
> Worth holding back what a pending request asked for?
> 
> >  {
> >         struct kvm_hyp_memcache mc;
> >         struct arm_smccc_res res;
> > @@ -133,7 +133,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
> >         return reclaimed;
> >  }
> >
> > -static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> > +static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> >  {
> >         return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
> >  }
> > @@ -342,8 +342,19 @@ void __init pkvm_selftests(void)
> >  #endif
> >  }
> >
> > +static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> > +{
> > +       return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
> > +}
> > +
> > +static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> > +{
> > +       return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
> > +}
> 
> Returning 0 rather than SHRINK_STOP when reclaim comes back empty
> leaves do_shrink_slab() calling this until total_scan runs out, and
> each call is an HVC. count_objects() covers the case where there is
> nothing at all, but not the one where it goes stale between the two
> calls.
> 
> Cheers,
> /fuad

Ha right, that SHRINK_STOP seems indeed to be the convention for other users.

-- 
Vincent
> 
> > +
> >  static int __init finalize_pkvm(void)
> >  {
> > +       struct shrinker *pkvm_shrinker;
> >         int ret;
> >
> >         if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
> > @@ -359,10 +370,21 @@ static int __init finalize_pkvm(void)
> >         kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
> >
> >         ret = pkvm_drop_host_privileges();
> > -       if (ret)
> > +       if (ret) {
> >                 pr_err("Failed to finalize Hyp protection: %d\n", ret);
> > +               return ret;
> > +       }
> >
> > -       return ret;
> > +       pkvm_shrinker = shrinker_alloc(0, "pkvm");
> > +       if (pkvm_shrinker) {
> > +               pkvm_shrinker->count_objects = pkvm_shrinker_count;
> > +               pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> > +               shrinker_register(pkvm_shrinker);
> > +       } else {
> > +               kvm_err("Failed to register shrinker for pKVM\n");
> > +       }
> > +
> > +       return 0;
> >  }
> >  device_initcall_sync(finalize_pkvm);
> >
> > --
> > 2.55.0.508.g3f0d502094-goog
> >
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

