Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2813EC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkEyccE1SP4/O8FRxuMTjwZTWvb3WH5wHagpAHgazS0=; b=APevy2seQF60vcKJusMb04hp/E
	bEJFdtZhix0tTWDXOKJcM/4APi8H4V72SSh+mokcRTJUy0NRAn2Q35pfhPIXMxUisIJBi+/3IhXwY
	w+YrGhLFgFSdW4rHi9c3N5ji5sd6BnA1yzwcEJDQeyJq5QhJcKtVhLix6TneSKUxwSqrHF9+JxBSO
	mn908LbINlXsniR3R9D/fAc/eH63NDY+cBv9cFngelKHM1j0sBmV8X8Ug4hmosNu/x1fwtWAYGrwH
	Otfg9YJ+dlW/SMkkmMxtCzSpLnT7vH6Yx0KLEkTor1U+mpewF0/TvVWDOcpm6MoQKyIwAvscG8Ewf
	BmGveOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymgK-00000000PHQ-24sj;
	Tue, 25 Aug 2026 08:38:56 +0000
Received: from out-60.mta0.migadu.com ([91.218.175.60] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymgH-00000000PGU-2FpR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:38:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZkEyccE1SP4/O8FRxuMTjwZTWvb3WH5wHagpAHgazS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787647130; v=1; x=1788251930;
 b=MmsGmhnri+5vlJsN04OHRZxwt/rImBtKjM+7pU9Q+4j7ozrepuPyyoy9PCm8gF5mDAtwK1Np
 cvtD9hVydAiohxMCxf4NeTyvgOlMaG0QdwC4zy2JvxLM1aFYZx3ZsoTqvlENToIncYfuVAJMhTF
 HhkrOkArfzwRdrTu6bi6bIN8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f54.google.com (209.85.167.54)
	by smtp.migadu.com with ESMTPS id dd98221a07cdc1a1;
	Tue, 25 Aug 2026 08:38:50 +0000
X-Mizu-Trace-ID: dd98221a07cdc1a1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso5262e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roefpx4y9eoO1EGky9aObFRWXr2HfrPv2vzBs4PclIXkZbbtGGwYKoSvn2vESgoCwDxJzedtW8QxOENw8tLyNeQ@lists.infradead.org
X-Gm-Message-State: AFuF++n4pk2bINZ50RjjYu2NdA47gbXKS0S3cDPpYP1T/PU6emxyuhwn
	YnrpSkOifqIwKio/O6lQargmSpsOksamcDX2AwSrZyosZzhir3Jmbbl2Fnu5M0rFhGK4vcj6IyF
	sYWm2isXNx7LoX4RednbmYACHrkfk+IeuIzjDgpZ5
X-Received: by 2002:a05:6512:3d8a:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b49de33a82mr59200e87.2.1787647125805; Tue, 25 Aug 2026
 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com> <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
 <aoxzjag7xr_emuvX@google.com> <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
 <ao1CspwFUHyhj0dE@google.com> <CA+EHjTz3Fua-vSezqu3ennb1bZpUjCopE0Ud8N3ssFUrRGNZ-A@mail.gmail.com>
 <ao1QPyLXVGuH1XLn@google.com>
In-Reply-To: <ao1QPyLXVGuH1XLn@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 09:38:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyLPzuV7rfm4f6MOBDB-rCg=s413yiJUmb2o8pS6u9aYg@mail.gmail.com>
X-Gm-Features: AcwNN1XQLeBQ7u9EOQoGMHte78AwqW0cwF4cJoFF4AYKd0NiyQxRZAlxD9ORrkU
Message-ID: <CA+EHjTyLPzuV7rfm4f6MOBDB-rCg=s413yiJUmb2o8pS6u9aYg@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013854_103080_C5B46D9F 
X-CRM114-Status: GOOD (  30.87  )
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

On Tue, 25 Aug 2026 at 09:20, Vincent Donnefort <vdonnefort@google.com> wrote:
...
> > It would still fall through to the top-up pages once the chunks run
> > out, which is where your last point comes in. hyp_allocator_map() only
> > raises a request when it finds the mc empty, so pages sitting in there
> > are ones a top-up just put there for a retry. Could the reclaim leave
> > them alone altogether, and drop the mc.nr_pages term v4 added to
> > hyp_allocator_reclaimable(), which is what advertises them to the
> > shrinker?
>
> There's nothing that prevents a users from topping-up the allocator mc... but to
> never actually use the memory. That's why I think it is better to drain it.

Agreed, that settles it.

...

> > It's the retry that fails, not the reclaim. With target == 1,
> > hyp_allocator_drain_memcache() pops one page and target is done, so
> > the chunk loop never runs. But the top-up was sized to the exact
> > shortfall, so the retry now runs the mc dry one page early, sets
> > topup_needed = 1, returns -ENOMEM again, and pkvm_call_hyp_req() goes
> > round for another top-up.
> >
> > Nothing errors out, it just doesn't converge for as long as the
> > shrinker keeps pace.
> >
> > Keep in mind, I am not as familiar with this code as you are. So I
> > might be completely off here :)
>
> Ha yes, a concurrent topup with shrinking wouldn't cooperate well and I am not
> sure how better we can do. But note the shrinker always "scans" half of the
> reclaimable memory. So it is unlikely a user needs to top it up during
> shrinking: if we reclaim hyp allocator memory that's because there's plenty
> unused!
>
> But I am happy to start with the memory mapped into the allocator and then if
> necessary finish with the allocator->mc: if there are memory in allocator->mc
> that's probably because a topup is pending.

Sounds good. Would the tail ULONG_MAX drain need bounding too, so it
doesn't empty the mc regardless?

Thanks!
/fuad

>
> --
> Vincent
>
> >
> > Cheers,
> > /fuad
> >
> > > >
> > > > >
> > > > > However now looking at it. I wonder if I don't want to ratelimit here the number
> > > > > of pages reclaimed in one go to limit the time spent at EL2. Especially we do
> > > > > all that with the allocator lock taken...
> > > >
> > > > Ratelimiting would cap the time under the lock, but it wouldn't stop a
> > > > concurrent shrink from taking the topup pages, would it?
> > >
> > > Yes, my only intent is to avoid blocking at EL2 for too long.
> > >
> > > --
> > > Vincent
> > >
> > > >
> > > > Cheers,
> > > > /fuad
> > > >
> > > >
> > > > >
> > >
> > > [...]

