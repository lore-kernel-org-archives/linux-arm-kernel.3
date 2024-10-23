Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FBCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEsOPb+l1iotdIHwOTelo3swhljmhVTkrXLfVmt8ycc=; b=BPpWbwXKoaVh0zMDJnmqL4CK1Q
	z0U+BCbDUUWPeba9a4aj+t36ssrqU3MeoAi3WNOg0HkwMH8szKhs8vZqg22629/6CFIrL4quVpnzL
	GyL/7o8E30a+uE87KW0bFROm7PImiyARHe9D3PyMSsDiQL9qmrTR0M77FK9FOHWOnjvrwWGHUY+bF
	1V4dVu7QfqCYPy9UJAtugTpsmyvB7am09XEqeUSOA1cext2zI23CEcvSK4e3NrlPVVwG5VZe7KZQu
	hXom8qkDEiUAA90kVaDmbyOUHBakIHQHnIAwUI28/SeK0CwEVou8ZPoccVktH9DIEqz2Ogcsa4bo8
	Bjym+P1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i5Y-0000000FqvL-29aj;
	Wed, 23 Oct 2024 20:36:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i3z-0000000Fqbv-0OcO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:34:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so231323a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729715677; x=1730320477; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LEsOPb+l1iotdIHwOTelo3swhljmhVTkrXLfVmt8ycc=;
        b=cAsEQCTQgXOdCzuFf+CleXiLLwGN7OgelY94nAO3cmetLh2FPSSKafc9MS9GP2wpE7
         uUw4gwWbOBfNAHGXmfMLcYnM66IzMx7EOh6B+DstS8sNPdTOVNxBun91bwF4hPHN9psV
         9gLB4m2HBy7dM312pjMCpc4W9IaB+TpxXqhHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729715677; x=1730320477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEsOPb+l1iotdIHwOTelo3swhljmhVTkrXLfVmt8ycc=;
        b=KUQFFEgdRO4yzOqmTB1IZ7gRuhCaYQzRgcJfRhMVKscQv7Y/Nzn8ef+LdsE4LR06K+
         OT9hkTDPvKW4x08xMgjSTOeK07TXMoAEny3sHPxpIYGe0uj038GBmZRgnJFh17rLa7xi
         5Ful3VRuoQ2xiAsGJ03dtCaRSQrSRE9piFYLVQ6sh57PDveP15fx3GtTa/X4xVSMWbFC
         CUTd+v6bf+dYUH+lcIM11cXPQXz4bUe63BnHFxGzQk9FCBgCVpJ5vr17SvjAVU1CaSDa
         mM43YqoLtCXK++Lv8nkIORGjvN9reYDjHGH50hlAEkqm35FpDIz2xeIhm7DGIc0Us+Gn
         2G2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBf2800XH6QjlahuP8wWi++YpBbx0nVuY2YGCUyzwOCXftFatFMgo5HIYt/wToWrq1aPPllz+0MMsR4x215ke/@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqin09Dps12cvMS8cRTZZKp1Y2A0VhxyOI6SYfmpU5xc2gXpI
	ydh3Jul8ONGtn0yMwFWPm6jXYu+l9U9AgHALCK+eKlcPRbulMKwCqgRiImepeIIlV1yX0DztFuY
	ZdmWAFg==
X-Google-Smtp-Source: AGHT+IE4e26M1Q7US3RfBwDzLsHNXt/ZbW4gi2UiQuD/JYu1x6bmkSojUAo/ebGHjqGFrPYR69XjLQ==
X-Received: by 2002:a05:6402:2792:b0:5c9:39d8:58b3 with SMTP id 4fb4d7f45d1cf-5cb8b26317dmr2958031a12.23.1729715676733;
        Wed, 23 Oct 2024 13:34:36 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c7262bsm4813864a12.82.2024.10.23.13.34.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 13:34:35 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso16587666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVz2xAW5AxJQSU+zg6POuBgvxREpMaBvjuNtobs+z4ilUvVZF7YulMdsGkq6Zhuhkd39rIfzWWHl39EiYz1SEY+@lists.infradead.org
X-Received: by 2002:a17:907:72cb:b0:a99:87ea:de57 with SMTP id
 a640c23a62f3a-a9abf852bb7mr329557766b.2.1729715672886; Wed, 23 Oct 2024
 13:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org>
 <20240917071246.GA27290@willie-the-truck> <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org>
 <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com> <20241023194543.GD11151@noisy.programming.kicks-ass.net>
In-Reply-To: <20241023194543.GD11151@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 13:34:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=Ji6-xi32167i3M1JL_YyRj6tgUAJS=YQ94GKzMBvkg@mail.gmail.com>
Message-ID: <CAHk-=wi=Ji6-xi32167i3M1JL_YyRj6tgUAJS=YQ94GKzMBvkg@mail.gmail.com>
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load acquire
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133439_141826_FF5A8254 
X-CRM114-Status: GOOD (  18.50  )
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

On Wed, 23 Oct 2024 at 12:45, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Do we want to do the complementing patch and make write_seqcount_end()
> use smp_store_release() ?
>
> I think at least ARM (the 32bit thing) has wmb but uses mb for
> store_release. But I also think I don't really care about that.

So unlike the "acquire vs rmb", there are architectures where "wmb" is
noticeably cheaper than a "store release".

Just as an example, on alpha, a "store release" is a full memory
barrier followed by the store, because it needs to serialize previous
loads too. But wmp_wmb() is lightweight.

Typically in traditional (pre acquire/release) architectures "wmb"
only ordered the CPU write queues, so "wmb" has always been cheap
pretty much everywhere.

And I *suspect* that alpha isn't the outlier in having a much cheaper
wmb than store-release.

But yeah, it's kind of ugly how we now have three completely different
orderings for seqcounts:

 - the initial load is done with the smp_read_acquire

 - the final load (the "retry") is done with a smp_rmb (because an
acquire orders _subsequent_ loads, not the ones inside the lock: we'd
actually want a "smp_load_release()", but such a thing doesn't exist)

 - the writer side uses smp_wmb

(and arguably there's a fourth pattern: the latching cases uses double
smp_wmb, because it orders the sequence count wrt both preceding and
subsequent stores)

Anyway, obviously on x86 (and s390) none of this matters.

On arm64, I _suspect_ they are mostly the same, but it's going to be
very microarchitecture-dependent. Neither should be expensive, but wmb
really is a fundamentally lightweight operation.

On 32-bit arm, wmb should be cheaper ("ishst" only waits for earlier stores).

On powerpc, wmb is cheaper on older CPU's (eieio vs sync), but the
same on newer CPUs (lwsync).

On alpha, wmb is definitely cheaper, but I doubt anybody really cares.

Others? I stopped looking, and am not familiar enough.

          Linus

