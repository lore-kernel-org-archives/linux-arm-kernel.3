Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF05C71156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=; b=sLAm/2zaoaLsE77ZjDiHvvpxFi
	5n0N4AdmQJo5Nc7wshR0aohZuxZXxboQOFUBGZK4/rYfT26spLBNI9IuFBpmrO9CrR7IIMxjwoqOB
	CFC6jeX9PZY7PrP4eCF6FE+cYgGusD/088eoKAtNtuv9Yz6VeVHruZ5imP/cvQ52NYUmzajIo5W8h
	+dCviqDsCuUo7AetnHg5D/Gyea4iJ5e/ARiWfEgtffDOFbDhRER5bw0e/72qi1FwCD2DJbtSo5XYx
	YHxgS0ZK4dRm+EpZAjlqpj9q40NsL5X1RZ9VKxsB52eSPzr0kUKEbpsHQIP0apR9g1J0zR8hIm6aj
	ZvhS/aHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9h7-0000000HNXl-1l8g;
	Fri, 13 Jun 2025 19:04:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7O7-0000000H4CW-3Lg9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:36:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-adf34d5e698so101626666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749832578; x=1750437378; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=J+OGoIWhfw8m4eoQj9fWEQi/EdbEzDitC1iRtRYFj03eObtblOBYcjXjCyyaBTEj3N
         bf3XdyHTGyi+jw5+NdorkNcpyCyXssXbxis0GHL6LgeFW4SIMqGQl/r6RMNBTQxIwJfq
         Y7dCD+sessGS5pXPrM+BM5Is0U/gN9dQ+t5go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832578; x=1750437378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=SB/lT63ehKjIQeog9JVo8vHqUjCVIr08LojjG1JQ6uk8DVKwwG6qN1o3ECqjHiJrxJ
         +6PLVBT5PVA5Q74Pf4V+VWyTl5d4gH6si+E8311jNROU8ZbFwjSd/SFIdvJY3M+Lupge
         FVmnIdKeVmohoW8svIKL5jaFYkXYfWHiY5AZQC5IwCrT7mPg97s2vINIWirWsds5EaeV
         7vIEZmGZc3u9uQa3Wu7B83cX/5JrdZhvJucz0abmfeR4JX7lbcVwJlZmVJ1CcHsKdkVB
         hf/lntFE0vE6Cm0whIplbs8+lyNv9tlc4cLG2pcFGLK9nOI3tdqspWzmjpPBWmY1pq3h
         Pf4w==
X-Forwarded-Encrypted: i=1; AJvYcCVSF+ox/jFuGS9M9iy7Iv1zNpjaOlRTkG54qw2i7DqczRHsI7xVhNzlR+8nvXIesombc2bipzYgQaxIGtqcN3HH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8M0tBCtWJ2SrUvtIZS7ynOfvmrDBEhq7XKvLb3tnaQqRgJfkK
	hWw41kEhfxUa1c3iUpisn6GoxYJ7aenJa7+rgBjh0+PwbxdOnXQnxi5KkGUcFdul/b428tiwcRT
	UVCadaxz3oA==
X-Gm-Gg: ASbGncsq9mukB1e7sk0wdPwhkUCSBCJ+wHnlmqaS7hhG2g9KC23/Ihsu5WTeyqApi5K
	69pOOkLH+2GyM2nUv5YbM2jzeZiZTVlSNZQOdu2zpTw/9u9W/K1T/WV/vCay08ccrMPaRdUhM3x
	LHrwtr83DWXzSXDJaxO0PUh6cYTTp2a6gLQsxPQ2IJqJropi08Fod53VJmm7mNrzU9W5e9i1YoB
	UBbMWUn4MMarjekFZJy7IDgkBj/5KaW8c0dWH364VfjbLwFwy1kNDoJDgufoiR/n6YO67ClkQ6F
	9QDanjyiueL6MPRbf5tlfclkGsWQ0lQr7LBTtMw3y3zaITTXwepfH8pE7S7e3n3Mr2k3JmGySnO
	YdLQceZfXkjw84oPuINN7Mqqd6EpkMBG4T6XI
X-Google-Smtp-Source: AGHT+IHFjlqfXH5xfDZ9w9fHQ4mpbz8De8BWeVo9Zc7a1hen2B6+y3ATbyagX1AglV2ZLzD3HkS2FQ==
X-Received: by 2002:a17:906:f04b:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-adf9e2cdf3dmr39699566b.16.1749832577634;
        Fri, 13 Jun 2025 09:36:17 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897bb0asm149583666b.160.2025.06.13.09.36.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso3986527a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXP4jRyto+VgSqkbEP/2oM3SjYTxl78maHaSUTCwK69uSJo7qBIh21vZWFXWAzvnebFOZB2byxJ45KdcHPoabWR@lists.infradead.org
X-Received: by 2002:a05:6402:35cd:b0:602:427c:452b with SMTP id
 4fb4d7f45d1cf-608ce49d897mr365341a12.3.1749832576184; Fri, 13 Jun 2025
 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com> <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 09:35:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
X-Gm-Features: AX0GCFu7lGsyyFJqLRh6z7a562txhJJOyTpVqIIzlie72BRGPF0wH2A3ccvLGV0
Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_093619_849895_878EE466 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, 13 Jun 2025 at 01:39, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.

Can we please instead aim to *simplify* the crypto thing?

Just say that hw accelerators that have this kind of issue shouldn't
be used. At all. And certainly not be catered to by generic code.

The whole hw acceleration is very dubious to begin with unless it's
directly tied to the source (or destination) of the data in the first
place, so that there isn't extra data movement.

And if there are any software fallbacks, that "dubious to begin with"
pretty much becomes "entirely pointless".

If the point is that there are existing stupid hw drivers that already
do that fallback internally, then please just *keep* that kind of
idiocy and workarounds in the drivers.

It's actually *better* to have a broken garbage hardware driver - that
you can easily just disable on its own - than having a broken garbage
generic crypto layer that people just don't want to use at all because
it's such a ess.

This whole "make the mess that is the crypto layer EVEN MORE OF A
MESS" model of development is completely broken in my opinion.

There's a reason people prefer to have just the sw library without any
of the indirection or complexity of the crypto layer.

           Linus

