Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56203D2D8E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOVCHa5FK0FHzhkRB3PH07haTP2XM7pEmD3OPviuoK0=; b=nestrJq4YOkboCLabg7v6Q3NXh
	EodTVKEta34z9mBunOJYbBWLvObEqL5x2mJX2Uojy9yVYy9/zcqTiPBHJcan4A20kpaFKULR9wmA0
	tLQDrYUsa5QKVqgXoCjLqJv8cdfHYKQ3HhDoV9kTB1MBSORnolLPdU/vi6jYPd5Po93XwSph721OB
	ylh+Ij9ODamBYu07nRmx4bDZf9gAc3BP3AFPTlGLBF1ftoz+/zBOFj8M6BjlchIllJdSXOAb0uL7/
	enIrupdS3R/5iVtaq8qGA7M83rLCxQ9xlaX4mAhVUtwzUeWWzu7Sio7aevyf+lEQgmae9b6nMa3j2
	SOSxNOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg4t-0000000E226-2fIi;
	Tue, 27 Jan 2026 10:13:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg4r-0000000E21g-41LY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:13:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so42305475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769508820; x=1770113620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOVCHa5FK0FHzhkRB3PH07haTP2XM7pEmD3OPviuoK0=;
        b=PbUyWnF9YilhUCK2TW10HJZ6BfkfZl7iph8TA/IZZ3gxeGYHxPCT9y8PdX5E20eCqJ
         Ev5lRpKLMvcD651L9PUCwzRw9Jp63tODgklI8nWmjM4ZRDKA0du0zQuxXbrDSMwj9Lul
         3YfdTHWcc8M9PkJn84WV2AJ9WVKDTwrS0ab/ATxsQzLk85cJUyjalFKHD4QOX0Ot5vko
         f3KBqNnI9lZrv5vFCTmd/nlIl91ClK9OYIz/F0M1I/YzDkxZwaNQGA8tEpLn2mCzNVPC
         7b51Aw1RXOJBbqPQ1s311pDivvvrGZSCHypOauGODtU66YDDfy276+kbXUK+Dicr89cR
         qf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769508820; x=1770113620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOVCHa5FK0FHzhkRB3PH07haTP2XM7pEmD3OPviuoK0=;
        b=Iv1WkxHGvQIJxkVaisoOWwQSW7oszbKc8N+hkzZTIRqbpITYS5qmdXxu1lpqj12NnX
         Qj6VkuZqk+RGrvk6z+O17qjm0s7ftsvci2qYzPcjE5/OKnTcml2UqQYL0iwn6uvqzr2M
         tK+Vo8YAmEr9odT8RjfOu4cqYRMJ2HgZSFCEpy9TCFzitbbhX8nNQII+XeizaJXw2USm
         kAsw6+mG5NcGIi1kdJ7gzCjmRy5Z7T4tUFWs2FF6uAhDvgmo57E7LF8vg9pPpDkpIhN4
         jB+r9iGMBu0sxHa2jVZ9q9ZjIuiVr26TNKMxpTMIZ/1axY9iE3J6AXhHVKHyl100Ot4Z
         C0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBAWuxFy6oICo6wcVW6fgAbp9WVU/ltPlbEayJ8teh+8f2LNZZM9A/PZCKmaC7NN4oadDowXgtajjE29DJBUqd@lists.infradead.org
X-Gm-Message-State: AOJu0YzESZkyo/3ThdhD7/C1mHyTfo4SmslhoG0/rSS4IeFMU46XZf6V
	J3KSsEZO6MAXfL+6CndaL198ycTeNDfQ+KQit6LO6ivHe49L32ct//oH
X-Gm-Gg: AZuq6aLmHeDWiYuz38H96iiGp+1LZoTx5tM/tVmCynD4/xBfAvPvCXvsqiQeGNvH0Zu
	qOEkC2cEqOMzp4NOqSnyGIw4V7xPK9oqSIZRNXGEBNhtm0BoKuDjr8tks6v7kMlQky1nwMBjAPN
	qmlWm4hi3rEPTaW8pF0crGuXi5QjgYgSAr5Gh4MZx/Bqi2OVeRCNzfbJUbJh1Rg1AJLexVeE3xm
	5NiJ19N94grAwbZfc6Jyqf5NDQoZ9/vTgeOaAFeeUGv/du9C2KAggINLrzDLwFYFZanv8jeUnNT
	rrtPR1cP5A9yB4Q9ApX6/VlpU/biu4JP7u6ZSrTtS8Y6+RzdxYa9oPT9e15KXzCCIUWSL4EJXV6
	nQtG+zBgxxkZQOjobgdqduvqX8hSPHktghm61KU6730m3N3qFhcOcZBKggmslg4x/mGH4QeQh1L
	u1dQfcQZnJLR8iyWsl+bWmoktkbAjqMfadEz/JbCRYKnTOe0tenUU1
X-Received: by 2002:a05:600c:450b:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-48069c96b8amr12421685e9.27.1769508819768;
        Tue, 27 Jan 2026 02:13:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm47613355e9.7.2026.01.27.02.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:13:39 -0800 (PST)
Date: Tue, 27 Jan 2026 10:13:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127101334.352794d1@pumpkin>
In-Reply-To: <CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<20260126111643.534c8274@pumpkin>
	<CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_021342_018324_93BFF581 
X-CRM114-Status: GOOD (  23.64  )
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

On Tue, 27 Jan 2026 00:15:38 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, 26 Jan 2026 at 12:16, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 26 Jan 2026 01:25:11 +0100
> > Marco Elver <elver@google.com> wrote:
...
> > Also is the 'default' branch even needed?
> > READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
> > A quick search only found one oversize read - for 'struct vcpu_runstate_info'
> > in arch/x86/kvm/xen.c
> > Requiring that code use a different define might make sense.
> >
> > I also did some x86-64 build timings with compiletime_assert_rwonce_type()
> > commented out.
> > Expanding and compiling that check seems to add just over 1% to the
> > build time.
> > So anything to shrink that define is likely to be noticeable.  
> 
> The compiletime_assert_rwonce_type() is for the benefit of the
> asm-generic variant, which is implemented like the 'default' case here
> by default.

True, but compiletime_assert_rwonce_type() stops you getting to the
'default' case in this version - unless code uses __READ_ONCE() and
I couldn't find any examples.
So the 'default' could probably just be a BUILD_BUG_ON().

Although part of the 'bloat' from compiletime_assert_rwonce_type() is
the repeated definition of the error function.

A few places define an 'error function' rather than using
compiletime_assert(), perhaps there should be:
#define compiletime_error_fn(name, msg) \
	__noreturn extern void name __compiletime_error(msg)
for consistency.
If compiletime_assert_rwonce_type() used a named function this code
could just call the same one.

> This here is only the arm64 override of all that with LTO.

I keep missing that conditional (and that it means clang) ...
It also explains why only a few builds get a signedness error from min()
because the 'atomic ? x : y' causes integer promotion to happen.

	David

