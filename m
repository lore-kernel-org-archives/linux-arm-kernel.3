Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E888C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=; b=nQhvDSg3aPzhpcbbkAAgCG26A5
	Xqvi7e+fjo5dqIip+2xibV/1RU/ZGeK6VXrPGuIEFWZeHLsHLII4s0gYLMT+pAnzc7dI3UD+jXCe+
	cfdr/UvogIHDWFX0sY8UyqFe2AU3HHO/LIdOVmxtEAfT24Gi8i/C6IJU5OOGJEMnM97iJlYyBDclC
	wCAf+2HdNTo9el+pq9XQ7qBJdsXXQmFY2QuUrsnoODNBNYI7eYcvGonePNmYTtUppxgzv8yjOugBu
	UafQslxtrNimMHSxRiabFaqEy/CGmdMB+y6OLci1dWmtdzQ+Vet/AA/HAL1Z82XYul0wqo5zidgv/
	mShr/evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKn7T-0000000Gm0C-3tVS;
	Thu, 29 May 2025 23:57:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKn5L-0000000GlmT-2v96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 23:54:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so236785466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748562894; x=1749167694; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=Hb24Hv9M1M9R9B9OIg3K2RXNw6D7SPoV14Sp2Bu0VeeGSCTzHl9zf1vCIo/bqwUEcL
         omoN+ycAAlwfyrWMca88C8BgaGt5w7Fwt9A72DtO3exPiUJ9+kmkanQek6NSSvj5xKUm
         S8IZU8lQ+V0sETujghWI9pPQAoqIkMgrozWWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562894; x=1749167694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=oFSFWJ6h3jMSatY/eoYookZ+Xy9FNqiSv5Ld4q5/0/mcZspGz9YIW4sBS03rLB8ToA
         qs9yhTb+xXOBk+9xcOrgOIP60+87T6ByoULgfRE0pMy95XKv5v+IzjyyU27hivE0gYwh
         vypbX5pytRlTQCNabXege3j9GOdu+uu9gL1HM6i0NX1SrC1zZ+Gkb7eHeVBqyBj/qOiQ
         pAQXS6jCbkTMthtSn3K19Z59BRncEtXLBZXtXLyruChtEitEuCi9y5OBW9YtfOYnFWqo
         V7xxX9lWcCajvnmovTPcLp+k9P/NxFtq/iV5VUT+/JwPc4mIe471pQSaLn1z84FweBQ3
         6Syg==
X-Forwarded-Encrypted: i=1; AJvYcCVxpwhavS6WaqvVmg6+p/DUWKgrHCWjZIHsCTV8V8TQoU3RWHA7BDE8Xsms83C1bTJrPcX8u+044dvm0tgk+A2N@lists.infradead.org
X-Gm-Message-State: AOJu0YwCXXZttIDeKGj7AeFJgKTYiFYUOs1qzihYIDrZ7VEL8H1S6cx8
	4wNfkmfBYyFeyT4kSpsDhgbnThOj/sNWyq3PdK/5liSukOs3enhqy+vYyn8eSbm9e9Ze0uFtZy0
	+gqGLCWw=
X-Gm-Gg: ASbGncvexsn56M/1azeNGMiDKqx8ZqusYtqRTTulO6IgnpsznrMVsgLR8bAycY1igYM
	TW9TwL0uXaayH1ILu48rzdbcq3UoFnSBpjWB6p82SYiumZZZUV+DBw3xp0h83VGi+7GbYHCeeNR
	oMf1NIhWwegqXHC73msADmzguE36VjtiRkZe+GpmkKA7hACXJaigENmiBuskae4MPPFGgnifJps
	tVvJoXtKNuROmd7WRVZpLY5eoOJaU2d5Q6lhy+jUdDmaTpgFM6HPKjv8nb3+W/Pkp9BfpwpxgNJ
	OE2xttAXjTWXSckojvjKb3Kj2HKh7AMZ61fGiDNB+UIjjBs5ekWYS9IdV3L8iriwpaYmrbJeYdO
	poiZU4fBwDtQtHpAVFvmNDf97Kg==
X-Google-Smtp-Source: AGHT+IHzl/H6N+8MkKgW26xuN2xl1ZK02VjUltTp55BCeGHa5mnhktv+DOpa9yn3vJXkl/i8sMAKJg==
X-Received: by 2002:a17:907:9449:b0:ad8:a935:b8e8 with SMTP id a640c23a62f3a-adb322456b2mr122819166b.5.1748562893998;
        Thu, 29 May 2025 16:54:53 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e846sm223212266b.70.2025.05.29.16.54.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 16:54:51 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6055f106811so1182477a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 16:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtlB4oSSob+egHHc/eth24z3x+FtpIhhWNeu5K7y3jJWpj3o5YjBZ3G5X6CIeCLgOn3mbA85jHpeNaIm8L2wwh@lists.infradead.org
X-Received: by 2002:a05:6402:35c6:b0:5f8:357e:bb1 with SMTP id
 4fb4d7f45d1cf-6056e1597eamr926476a12.22.1748562890813; Thu, 29 May 2025
 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com> <20250529211639.GD23614@sol>
In-Reply-To: <20250529211639.GD23614@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 16:54:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Gm-Features: AX0GCFuuQZJkBnHy-mtAufGSUKbxBrKrMtOhVAT8ZxGCHwWeq3lbFPW0g13cPtE
Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_165455_853880_69B535E1 
X-CRM114-Status: GOOD (  19.67  )
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

On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> symbol.

Yes, I think that's a good example.

I think it's an example of something that "works", but it certainly is
a bit hacky.

Wouldn't it be nicer if just plain "crc32c()" did the right thing,
instead of users having to do strange hacks just to get the optimized
version that they are looking for?

> Does any of the infrastructure to handle "this symbol is in multiple modules and
> they must be loaded in this particular order" actually exist, though?

Hmm. I was sure we already did that for other things, but looking
around, I'm not finding any cases.

Or rather, I _am_ finding cases where we export the same symbol from
different code, but all the ones I found were being careful to not be
active at the same time.

I really thought we had cases where depending on which module you
loaded you got different implementations, but it looks like it either
was some historical thing that no longer exists - or that I need to go
take my meds.

> IMO this sounds questionable compared to just using static keys and/or branches,
> which we'd need anyway to support the non-modular case.

I really wish the non-modular case used static calls, not static keys
like it does now.

In fact, that should work even for modular users.

Of course, not all architectures actually do the optimized thing, and
the generic fallback uses indirect calls through a function pointer,
but hey, if an architecture didn't bother with the rewriting code that
is fixable - if the architecture maintainer cares.

(On some architectures, indirect calls are not noticeably slower than
direct calls - because you have to load the address from some global
pointer area anyway - so not having the rewriting can be a "we don't
need it" thing)

               Linus

