Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359ECC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=; b=4hrXFhJhw5dF7cx8FUplYHdtBY
	dsUPcGM41Pbg3v/thQe6lzxyph8mo1YzfNRw8+TAmtZQv0Z/4hV/bQKk9mvc/WAJSGBLwLxpHCiVE
	tF+JtW95aLwWR9FLOSebvlla1t830GEEZmRUpQVtzprpAEQ/BGXvm2FQw8P8tY/WWRL1/fPcq7db5
	89pOfrd9RSQsSjqZe5spGXPaPkIMTqtrjLRLYBsiXR0ZOT2pBP2qDhV6+i0sWaJ9No5hEHuGi0e9F
	mc1UFpJI/6AW4Qvd4PIvV5t/Pw/4/tUS5jkN58tVURe69BytPDf2XQrPpWSocJJXaqGY7LLNum5vn
	RaMfRsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtD7-00000002mRz-0T3D;
	Sun, 15 Jun 2025 19:40:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtAs-00000002mHN-1v2m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 19:37:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade30256175so736761266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750016269; x=1750621069; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=dLqpUrLuTWXMfO6J9+xpUv+vLXAJwDf/FHeynR/5MNid1o0fSeVKQ4O/wbrYeR0wQZ
         2qUWJ2KUoEd2JAjxLProYEeRx2btM6LH24o2MKDSHZR/Pi7lYHSsAh2vQufqKYPv4Tsk
         tfGtcNruhY9cV0KLWZyYDAiyCgLgXRl5JFsGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750016269; x=1750621069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=fR0JA5UM8ilElVF855l/NCfeu+QM8Cuitatbcet5InRmir6eTiAoCNA2tPba5nouqE
         7wQSAKon3gpRpIm/nFOgOvg7D1VSnfytrR7xcvqcHbzSl+heGLQBtzDohG+vdI6kACTj
         oncSmynzQXi/tIdgvsTuNdKRNIoWaVauVe3NeisO+SUQL//n3cGXcZyUITWgJ1CQEDBt
         fIKj6nTRwPQvTLiXryOieYGLCVFGc1m7bo9LzhUOMwJhfRi62Ok2ehvQk+mu2pMIfRfY
         Jr8tbffDoCjngJvyF/ZGF54xLItxwpwXCCKdHhk3WmbEPtmMiCbOesKpBuT/aQd7ivj5
         gJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv32MoKhEyZKwuxZ+GZafPkR6abl9JYoWdfxNGaY9rlvrN5fU9XaKSXm8J0UMOm5//K3uhF3t2rSujA/KPl9ww@lists.infradead.org
X-Gm-Message-State: AOJu0YwXbCSI7+wyaRYzda0ODITXCFAAhPcYh9CjbcW04ET+9gejVHmK
	BA4GUUNBapLl3bq0+ct9pws0noduswd0QuG3mrUPB76OIPDoP3pYfdRe6c2juzXfPgoi5Bhix9W
	asA+QVFI=
X-Gm-Gg: ASbGncvvYm7nmNMSZByT/ccr8HOKUTn7cjlTJueiPj6q3FNwxorf+HLWAfoFlWi5IPl
	Tp2v/P7Sghv2At/21QjDPuyV4mHLNruqwAJGEFD5Jgs2JKzv+uer14ZLS4bH8JCYjiAR30iUcGv
	ZSL2pXNfMOzvgIbgH7A+9S0fLYHg01V1OAfOToITg4VkMrvE54goymq4KDFaD+mDMDOPDXLKy1L
	hzZiBt+rEwxwQTJtuTY2ZgiR68+ZAYkNBltqBHuvrGN1CztI5TZ7M28tt9p0lKzN2Betb1iq8GG
	fkNGApG8Q5FtzccUNxPWH9oVwaIKaqtWIO9j5zq85D/U5MvKHQFn+3IrLpcsrWPs5XYHg+4KrzS
	WF/7GuYH8yqvw8CzKv0IYoXQuB3Ay/hed9B42S1Ioz6OQJ7s=
X-Google-Smtp-Source: AGHT+IEB9tkaUDagaSKykBQD7txKfn9patM/IfbxlrGy5bvCNr6h2KxKt7zh3cmBFavzkcP9HzSTWA==
X-Received: by 2002:a17:907:1ca0:b0:adb:2db9:b0ac with SMTP id a640c23a62f3a-adfad28d3d8mr643126866b.7.1750016268762;
        Sun, 15 Jun 2025 12:37:48 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff483sm535295666b.90.2025.06.15.12.37.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 12:37:48 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso7898770a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJy01IJuZA9npxK2ZmQbolLcZ8ZmSJAVIBC8H/6SL4/7quZ21aTzHcr99vX3rILFgeEbZIOdiybgWU6E94xoJ9@lists.infradead.org
X-Received: by 2002:a05:6402:50cc:b0:5f3:26bb:8858 with SMTP id
 4fb4d7f45d1cf-608d09a2d16mr6285703a12.34.1750016266135; Sun, 15 Jun 2025
 12:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au> <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au> <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol> <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol> <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol> <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
 <20250615184638.GA1480@sol>
In-Reply-To: <20250615184638.GA1480@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Jun 2025 12:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
X-Gm-Features: AX0GCFsirgA8Ga0u26X0ToUgNd-a86j5gL8Na8fIUJo1Hy2_joO0gogaJwm_iSM
Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_123750_777793_E476675F 
X-CRM114-Status: GOOD (  19.49  )
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

On Sun, 15 Jun 2025 at 11:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So yes, QCE seems to have only one queue, and even that one queue is *much*
> slower than just using the CPU.  It's even slower than the generic C code.

Honestly, I have *NEVER* seen an external crypto accelerator that is
worth using unless it's integrated with the target IO.

Now, it's not my area of expertise either, so there may well be some
random case that I haven't heard about, but the only sensible use-case
I'm aware of is when the network card just does all the offloading and
just does the whole SSL thing (or IPsec or whatever, but if you care
about performance you'd be better off using wireguard and doing it all
on the CPU anyway)

And even then, people tend to not be happy with the results, because
the hardware is too inflexible or too rare.

(Replace "network card" with "disk controller" if that's your thing -
the basic idea is the same: it's worthwhile if it's done natively by
the IO target, not done by some third party accelerator - and while
I'm convinced encryption on the disk controller makes sense, I'm not
sure I'd actually *trust* it from a real cryptographic standpoint if
you really care about it, because some of those are most definitely
black boxes with the trust model seemingly being based on the "Trust
me, Bro" approach to security).

The other case is the "key is physically separate and isn't even under
kernel control at all", but then it's never about performance in the
first place (ie security keys etc).

Even if the hardware crypto engine is fast - and as you see, no they
aren't - any possible performance is absolutely killed by lack of
caches and the IO overhead.

This seems to also be pretty much true of async SMP crypto on the CPU
as well.  You can get better benchmarks by offloading the crypto to
other CPU's, but I'm not convinced it's actually a good trade-off in
reality. The cost of scheduling and just all the overhead of
synchronization is very very real, and the benchmarks where it looks
good tend to be the "we do nothing else, and we don't actually touch
the data anyway, it's just purely about pointless benchmarking".

Just the set-up costs for doing things asynchronously can be higher
than the cost of just doing the operation itself.

             Linus

