Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF611C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMxmjZ0JJMyuWIJbXGv/0gigEXN79Nbqmvzf7orMYUk=; b=ZjmGDNTNReGTSNDFBYK765oktW
	tScHFx+c0t4DCugQRwoZpjlZzn0f2KcGx2bzyGsEK1wv0GA9LO/hZkE7yKoMKVvJJFNpOwhcruiCx
	YnMXg6Y6rrQ/URSTvcyK2EJOoPE92gSJ8PDmTMfW8Q157gDA4wsi5kVb8dgu4sJBnULaE5nxI7guL
	GLz5XraSa34xiLVfNpKhwDUcjwQqMCgX2QoEwSyzLIvoIEaXl5HtXTAckrSwTr/ncJY2jNK1lZ9dk
	BNDzHbEmEbfIAoP+rKaQVozgJFWJfV4I5PnKlgUc/x9DtY9nYZJwPSwUp8QV9WLbHiYAOuHm24M47
	5oP3bilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylm4-00000000J3t-15A9;
	Tue, 25 Aug 2026 07:40:48 +0000
Received: from out-149.mta0.migadu.com ([2001:41d0:1004:224b::95] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyllz-00000000J2b-2TML
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:40:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AMxmjZ0JJMyuWIJbXGv/0gigEXN79Nbqmvzf7orMYUk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787643641; v=1; x=1788248441;
 b=VcxtuuPXErsWDah5Lr6vrje5qBP2/1RBZ9gxO5MonGYKWEtSVUC1DmvkPZuapd5AdduA4kF6
 UY7PJav9skptwlsP35lFf0iFCSDiE3WLnEObRnAj3T5uDZYKv6XfKumxXFEQhOia9KK5it9glMu
 bPaRknZZIzWHxekUsWh53tWQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f50.google.com (209.85.167.50)
	by smtp.migadu.com with ESMTPS id 67afa3bf06d5a58f;
	Tue, 25 Aug 2026 07:40:41 +0000
X-Mizu-Trace-ID: 67afa3bf06d5a58f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a8173142so3668e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 00:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNwU2v5AAeOXyTTdyOsmoCl5bwLtqcZDyYHhJX84YRPBRxVVb6NIWYv8VaeQAnkFP3pWnVBiUvo6ax10NEZL4N@lists.infradead.org
X-Gm-Message-State: AFuF++nGNiEY5Y7tGJqdbDdqAAqpcVGC4kcsorqR2urn121/qKrjWTt9
	+asbCYpZZ10/1Yru/zg71BdiJv0vZItdMOmoIeBDsoc6axRDFgp6nqoxk+yNxDyyU/RCfYZVRUg
	Fh1nJowBCS5wMF06sQV59ru1fs35j4WKTxAkIWGss
X-Received: by 2002:a05:6512:3d8a:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b49de860a1mr48950e87.5.1787643640199; Tue, 25 Aug 2026
 00:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com> <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
 <aoxzjag7xr_emuvX@google.com> <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
 <ao1CspwFUHyhj0dE@google.com>
In-Reply-To: <ao1CspwFUHyhj0dE@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 08:40:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz3Fua-vSezqu3ennb1bZpUjCopE0Ud8N3ssFUrRGNZ-A@mail.gmail.com>
X-Gm-Features: AcwNN1XR0Ts6IcRX1i_REvmjYK54tavPxfSvDfmqMn9S4xm5Sn-f6fGyHQGFKMo
Message-ID: <CA+EHjTz3Fua-vSezqu3ennb1bZpUjCopE0Ud8N3ssFUrRGNZ-A@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_004044_048990_ED8D5564 
X-CRM114-Status: GOOD (  30.07  )
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

On Tue, 25 Aug 2026 at 08:22, Vincent Donnefort <vdonnefort@google.com> wrote:
...
> > > > Nothing marks the pages a top-up just put in allocator->mc as spoken
> > > > for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
> > > > so a shrink with target 1 hands back the lot. Land that between a
> > > > top-up and the retry it was for, and the retry asks again, and
> > > > pkvm_call_hyp_req() goes round.
> > >
> > > Sorry, I am not sure I follow here.
> > >
> > > IIRC, the shrinker will only reclaim half of what is available. So the pressure
> > > should be proportional to what is available and limit races with topup!
> >
> > It's the ordering, not the amount.
>
> Do you think we should first try to reclaim from the mapped pages before
> draining the allocator->mc?
>
> Mapped pages are more valuable hence why I have started with allocator->mc.
>
> But, it is true it might make sense. It is unlikely to have pages left unused
> into that mc. If that mc has been topped-up that's because it is about to be
> allocated from...

I think that would work, as long as the ULONG_MAX drain at the tail of
hyp_allocator_reclaim() is bounded too. The memcache is LIFO, so the
pages hyp_allocator_unmap() stages sit on top of the top-up ones, and
draining just what the chunk loop reclaimed leaves the rest alone.

It would still fall through to the top-up pages once the chunks run
out, which is where your last point comes in. hyp_allocator_map() only
raises a request when it finds the mc empty, so pages sitting in there
are ones a top-up just put there for a retry. Could the reclaim leave
them alone altogether, and drop the mc.nr_pages term v4 added to
hyp_allocator_reclaimable(), which is what advertises them to the
shrinker?

> >
> > topup and its retry are separate hypercalls, lock dropped between
> > them, so a shrink on another CPU can slip in, right? .
> > hyp_allocator_reclaim() drains allocator->mc, where the topup pages
> > sit, before any chunk, so half still comes out of them first: a target
> > of 1 fails the retry.
>
> I do not see where a target == 1 fails.

It's the retry that fails, not the reclaim. With target == 1,
hyp_allocator_drain_memcache() pops one page and target is done, so
the chunk loop never runs. But the top-up was sized to the exact
shortfall, so the retry now runs the mc dry one page early, sets
topup_needed = 1, returns -ENOMEM again, and pkvm_call_hyp_req() goes
round for another top-up.

Nothing errors out, it just doesn't converge for as long as the
shrinker keeps pace.

Keep in mind, I am not as familiar with this code as you are. So I
might be completely off here :)

Cheers,
/fuad

> >
> > >
> > > However now looking at it. I wonder if I don't want to ratelimit here the number
> > > of pages reclaimed in one go to limit the time spent at EL2. Especially we do
> > > all that with the allocator lock taken...
> >
> > Ratelimiting would cap the time under the lock, but it wouldn't stop a
> > concurrent shrink from taking the topup pages, would it?
>
> Yes, my only intent is to avoid blocking at EL2 for too long.
>
> --
> Vincent
>
> >
> > Cheers,
> > /fuad
> >
> >
> > >
>
> [...]

