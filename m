Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6611BC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBT/Ei0w7i+5f+yzzveDHn/UEUbkZyWiKFpbaa3Ox/g=; b=vvOlLGcXbMxYjAaKDK7dmjjt1X
	3htHbujogektoH49f8cfP+EcYgd9o/gc6FKr9ZSRWyVlSwLmt/2CAjZJGuUmsSo1ua3JLsKOvnCwc
	VdWDbtu/tpbsQL3WHR9+Gu5mDjnDVv1Kw3/v3Ivo5WWEOFid0/+3ETRXEqu/3E50danDYSi+SwCV8
	oY9VU/1Te3IxTahwvLWEb123e0uPdN6vkts6avPasbS46uwZMj8mIjPJb12UMtz0FRHqBiOV0x6xt
	mcZE4zxG5UANofg5WadWRxpLFZIE8bVBQeqaekQT8vCb2sUSKQas04WwgAoB+6ebpWrbmFS2d0asc
	lKcSQadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymOP-00000000Mso-2c1M;
	Tue, 25 Aug 2026 08:20:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymOM-00000000MsG-2tWL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:20:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40526995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787646021; x=1788250821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBT/Ei0w7i+5f+yzzveDHn/UEUbkZyWiKFpbaa3Ox/g=;
        b=nJNXh65xzRcrfv3Q9QqGt17v1lTsUK1WOQlOhrPYk18L+I5H4rVmG00v0ce0exRw5e
         Og7l/X54hF5c7Ckn9ZwqSt4QX63KhnnE8oJF9CXeFHVq7SqonsxmBvJXdNZBC9Ec+181
         4V/tSY+Z+uPSp9u4cx+ZO+CwiYJ6/T7ztHd7iD4sOiT1U7KFyTWoxLdjCk01vMjHmEYa
         qSFwhD9VMiXCbbeWZ/rxmEVCftBWxUfdVk/X8uJsvmUCmXv4lBKeWqzTT+bQojGi94Nq
         pgFNMlBU5Gy9z1+AwDFesIOgmxXTOpxAbm+2s31oOB2qjElz5BEmgtkThzRhCudcJR5S
         Vq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646021; x=1788250821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBT/Ei0w7i+5f+yzzveDHn/UEUbkZyWiKFpbaa3Ox/g=;
        b=o3cnVYJ7yvu9uLh/fuZFwf2QqsTRwepeglMtmMTh/zAN/BmOTM9H48+jL0IP6bpMvC
         ZMcem/lS9htL5Hz17asmxX4xFmkzFT2W+Gzf4jvVIYu9xa2LSW3dU3w3PUjr7lWaYnKE
         GNgeCm3ZLuRIqx9ME0x0rr+z9OSGrGmQ2L2itjSvD2NK8uos2IDUXAyElk3nUMFZStoU
         HOEjmsZT8jjbgy+6IGBrBIVDXaDKqIFhGyVkadGCyYi5CWGgRWbOfeEysUrhqXtJh/g1
         TLhC1qeph/yZItM06puG/RLS7CP3GXQfdsjQw1Z0eDgy26GzwrLaAiLxK1Ch2BFj+XA6
         tlDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro++EhbNSmQT6Y1iSFgN6+xxwr3o2gtC31z4J01po3VGCAwm8JFVelyKqV8VQ/M/X1k6LBxrZPaOsclc0GRz4FB@lists.infradead.org
X-Gm-Message-State: AFuF++m0wETKMzRjKfJ9Ah641w/kTHRNHrPo/N8ykTaIBc5oD0ZsQYF0
	9Lzg6hG/E3GM+9uND59nPChJJNXZeQuuSh+TQ8wfuxLiHsJgnp34NUo1Vs1KMECv3g==
X-Gm-Gg: AR+sD128YD/QDY6CPZFPg1Yuq0xy2dwNp7wH3722GpBsOl7qHlk6JzTr7NOaHdwYCa2
	AyZ+YeE34CHSd3SY1jpnkCePma6A227B4/AD2hduChkpMcbkPPhtiDm8N3JgYY6v7HhXc9i6o59
	00SV2X+HRm5M8nw/d1/05F8MyLN3x4hk2hyovfZcbmgzccx2eZIutquEPaZSPiEtotVZ761CrZ7
	fydN+bvRbbKJFM094uy734pK27ci8RiJi4hioJfLbmsyUOrxSmRhzOGvr6BvFdrFMasHVBva7lC
	f5MjLhdddcDf7fJF+3NAtAXYv2OFIE8qviEVI9+q5TQOaRSy61NpoT8qJuGq4dgjYPCQS3GwQzb
	vbm4qcBWR2ER0pai9yL2OMxtUQ3Y2Xsx7awK2LzzfhnLRZFcfELBjqsZw3INbXv1vkh1iwcRX5w
	9XhqNxheCXyyRmvdhUx9SnRRb71+0E9pVfpp552Yen5lbYxGJnscmYR4H1Gn1fKxOFjnQeYmP50
	irr2ujHUsuGtePg6cyp/15/YiCkq/3WDWY8rPCgF7s=
X-Received: by 2002:a05:600c:1552:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499c19ad953mr287526895e9.3.1787646019982;
        Tue, 25 Aug 2026 01:20:19 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d65c326esm18696375e9.10.2026.08.25.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:20:18 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:20:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
Message-ID: <ao1QPyLXVGuH1XLn@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com>
 <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
 <aoxzjag7xr_emuvX@google.com>
 <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
 <ao1CspwFUHyhj0dE@google.com>
 <CA+EHjTz3Fua-vSezqu3ennb1bZpUjCopE0Ud8N3ssFUrRGNZ-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz3Fua-vSezqu3ennb1bZpUjCopE0Ud8N3ssFUrRGNZ-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_012022_760844_947D395E 
X-CRM114-Status: GOOD (  40.82  )
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

On Tue, Aug 25, 2026 at 08:40:03AM +0100, Fuad Tabba wrote:
> On Tue, 25 Aug 2026 at 08:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> ...
> > > > > Nothing marks the pages a top-up just put in allocator->mc as spoken
> > > > > for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
> > > > > so a shrink with target 1 hands back the lot. Land that between a
> > > > > top-up and the retry it was for, and the retry asks again, and
> > > > > pkvm_call_hyp_req() goes round.
> > > >
> > > > Sorry, I am not sure I follow here.
> > > >
> > > > IIRC, the shrinker will only reclaim half of what is available. So the pressure
> > > > should be proportional to what is available and limit races with topup!
> > >
> > > It's the ordering, not the amount.
> >
> > Do you think we should first try to reclaim from the mapped pages before
> > draining the allocator->mc?
> >
> > Mapped pages are more valuable hence why I have started with allocator->mc.
> >
> > But, it is true it might make sense. It is unlikely to have pages left unused
> > into that mc. If that mc has been topped-up that's because it is about to be
> > allocated from...
> 
> I think that would work, as long as the ULONG_MAX drain at the tail of
> hyp_allocator_reclaim() is bounded too. The memcache is LIFO, so the
> pages hyp_allocator_unmap() stages sit on top of the top-up ones, and
> draining just what the chunk loop reclaimed leaves the rest alone.
> 
> It would still fall through to the top-up pages once the chunks run
> out, which is where your last point comes in. hyp_allocator_map() only
> raises a request when it finds the mc empty, so pages sitting in there
> are ones a top-up just put there for a retry. Could the reclaim leave
> them alone altogether, and drop the mc.nr_pages term v4 added to
> hyp_allocator_reclaimable(), which is what advertises them to the
> shrinker?

There's nothing that prevents a users from topping-up the allocator mc... but to
never actually use the memory. That's why I think it is better to drain it.

> 
> > >
> > > topup and its retry are separate hypercalls, lock dropped between
> > > them, so a shrink on another CPU can slip in, right? .
> > > hyp_allocator_reclaim() drains allocator->mc, where the topup pages
> > > sit, before any chunk, so half still comes out of them first: a target
> > > of 1 fails the retry.
> >
> > I do not see where a target == 1 fails.
> 
> It's the retry that fails, not the reclaim. With target == 1,
> hyp_allocator_drain_memcache() pops one page and target is done, so
> the chunk loop never runs. But the top-up was sized to the exact
> shortfall, so the retry now runs the mc dry one page early, sets
> topup_needed = 1, returns -ENOMEM again, and pkvm_call_hyp_req() goes
> round for another top-up.
> 
> Nothing errors out, it just doesn't converge for as long as the
> shrinker keeps pace.
> 
> Keep in mind, I am not as familiar with this code as you are. So I
> might be completely off here :)

Ha yes, a concurrent topup with shrinking wouldn't cooperate well and I am not
sure how better we can do. But note the shrinker always "scans" half of the
reclaimable memory. So it is unlikely a user needs to top it up during
shrinking: if we reclaim hyp allocator memory that's because there's plenty
unused!

But I am happy to start with the memory mapped into the allocator and then if
necessary finish with the allocator->mc: if there are memory in allocator->mc
that's probably because a topup is pending.

-- 
Vincent

> 
> Cheers,
> /fuad
> 
> > >
> > > >
> > > > However now looking at it. I wonder if I don't want to ratelimit here the number
> > > > of pages reclaimed in one go to limit the time spent at EL2. Especially we do
> > > > all that with the allocator lock taken...
> > >
> > > Ratelimiting would cap the time under the lock, but it wouldn't stop a
> > > concurrent shrink from taking the topup pages, would it?
> >
> > Yes, my only intent is to avoid blocking at EL2 for too long.
> >
> > --
> > Vincent
> >
> > >
> > > Cheers,
> > > /fuad
> > >
> > >
> > > >
> >
> > [...]

