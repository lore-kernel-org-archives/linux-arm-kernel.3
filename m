Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B0FDEE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtCO+j49oRtYrCNOBMxnRW4knEbb/1y7Mt3UWY7TQfE=; b=25ppATaeeplIgrBTeFg6X4uUTT
	ZM2Z0wBnC38pqetmPDB1SKA6U6SQASOZ5B8ApNyeizZn2OlRgRqYQe4b3I42XRHsn+hoZmdklXSEK
	m1wMWXKLS9+MthDviGPFDPBJVq6YZe7Z0g1hz06VXVdcz0L4rdImo/oFwDKd/utao70EobaL55p0S
	LKq5lg2hWBp3Zb4hNDuiWtHZg+4gZYcTWjYMRttLLS+3sJ3hgTwwQxuqKASm8ejg1mOC+Srx70sFw
	Xqbg2WyT1pTEMNeHIA5u+rHhyQCG5kowru0LkZkB2OUJIFbQwk+d1L6ZkbXNA4CjVVUA8wo/w1fbD
	qMLdyaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy3K-0000000C4IQ-0MmQ;
	Thu, 23 Apr 2026 17:41:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy3I-0000000C4H7-1IRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:41:25 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b936331786dso907618466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776966082; x=1777570882; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtCO+j49oRtYrCNOBMxnRW4knEbb/1y7Mt3UWY7TQfE=;
        b=hUhkBCEDTH4caDKs1lRfBFsvShWfbQ8RwZuqNJgTSKypFNlTV9Ym+bQxuHe3/m/3S7
         UXoeT+tcl56j50WYiBEOltAsai2Z0JRtBNxDpmCvtU+ceO3KKG3/ppyNEbUPNcqzQjHC
         V+CSjkahQ6YFCLpEyNtfq+f9PCzMHS0E64wHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776966082; x=1777570882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtCO+j49oRtYrCNOBMxnRW4knEbb/1y7Mt3UWY7TQfE=;
        b=biOcTwNf7CY8RpJp6aBq0fqY2Ap2M1LR13lymGanQYRkL3highGAhQk+q+OqdwnOAT
         1azhjsz8GqMat4qvYwC4FMDh3ZlbtGP7SBVAA3cri7cLpRKbUjJ81d4gfhTXBl6Hdh7m
         vtAW0SFkblGX3Anw1NXjLYrdeRT1JrEs3qSu44jCB7snchT5CFglbl04AjnEuLOgAIhd
         +0bzNR4j4VgFMQzCSGPrhrv/8B7na7Xlb64K7V1QX39LXfhGKGF2orsVZLx1gWcm4xE0
         RMYHsxlmJy4JULcwc4lF9qPJO5nORfVx0wtX4XbOkNkkfUEZYUuLCcZmJ6ZsYR/5YM6M
         1aQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J9Wp7/yD711Tpx7VaY3YijFRxFdiMsezLlQhQy+3tgYnDL9UFvDglz2fZJHMFfM5wvmvDSpJHQdW6OD6BSLrr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyatq1xjHKhoUFEhdSSeI14CKAUwrg2ZxMd0kb1dHl9y7ik6KMG
	t8xidq/D1DI2aQM/grFnYdvxDJkWCM+kDkJm3D+4Ud98c9+1zmuLSl0TjayhCfNA/510jST1mfU
	8DVZ+z00=
X-Gm-Gg: AeBDievl9q9quY6rzolUXLpW/lzoDyDsXDhmwWO0fSID+x+ujSlU70DaHM2XUx1jHN5
	whMJRGCTcA2zU1DIa+Lft6+qu0qD2PD9ionVeAtuARR00xScOW2YZEKFzPast1gvqI0ivVz7z4W
	gNl/HZMjJ3WclrFviw19jW2cQ+Btq557nGpnWN8EcJJq2vtl4ERrzNpVHKSUCBa7934BsQ4QM3N
	RMEpz4jypMgfKiwFXzz6Psq+URp+DB3pOWgDjJkET2YzyoGN2KE+Gp3AzM6KyW/5ZWY/Jt8OqKD
	hA2Q4xEndEsFGTaETft3LAmI7IoQgu1+58MSwPxRApWivmPZFXjDH6SG4Fjm8BsWce7R7vQcl3A
	WuK9jcl+mQZQ0wWSpC/tud33cVxTiWexvznLe7WL3+c98xkI47h02ALAZ52KaGQH7dn0UEyYYv6
	kx84R+UN2tYBmG9kxpjp2ey6DnZS9GM/BG1+uTA9XlgFxQozbsn95lcWIehVBIMZfJr24ay9U0b
	sz+cAD5BaDQ8AbwJH3xig==
X-Received: by 2002:a17:906:fe4d:b0:b9d:ed9a:5f30 with SMTP id a640c23a62f3a-ba41b1dfccdmr1455840766b.48.1776966081727;
        Thu, 23 Apr 2026 10:41:21 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4516f7b11sm679785966b.14.2026.04.23.10.41.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 10:41:21 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so10251353a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lC94sjgicAbnzkhDz32kr7hovMv4aJzAxyKuceIWdys46SuxDjGug1fLoSNvxMBN86yJH9c75NHxA6VlJTDZX@lists.infradead.org
X-Received: by 2002:a05:6402:21c9:b0:672:522d:8f90 with SMTP id
 4fb4d7f45d1cf-672bfd736fbmr12735589a12.4.1776966079746; Thu, 23 Apr 2026
 10:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
In-Reply-To: <87cxzp1tn6.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 10:41:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
X-Gm-Features: AQROBzBzEOcvm7qbXfrxaRw14oufW4aJ2ixiz_9tNE7BqF1Jnabsdo_EuiA-ypA
Message-ID: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_104124_420882_6AB91F1E 
X-CRM114-Status: GOOD (  19.81  )
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

On Thu, 23 Apr 2026 at 10:19, Thomas Gleixner <tglx@kernel.org> wrote:
>
>   C) Declare that this is not a regression because the ABI guarantee is
>      not violated and the RO property has been enforcable by RSEQ
>      debugging since day one.

No, if this actually hits real users, that is not an option. If real
users never used RSEQ debugging options, those options are simply
irrelevant.

Regression rules have never been about "it wouldn't have worked in
some other configuration". That's like saying "that code would never
have worked on another architecture". It may be true, but it's
irrelevant for the people whose binaries no longer work.

We will have to fix this.

This is not some kind of gray area. It clearly violates our regression rules.

The only "ABI guarantee" is what people actually see and use, not some
debug option that wasn't enabled.

And I just checked - it's not enabled in at least the Fedora distro
kernels. Presumably other distros don't enable it either. So no actual
non-kernel developer would *ever* have hit it, and claiming it is
relevant is just garbage.

IOW, that debug option was always a complete no-op except for kernel developers.

In fact, that debug option is actively *hidden* - you have to enable
EXPERT to even see it. Soi it really is not a real option for normal
people AT ALL.

Christ, even *I* don't enable EXPERT except for build testing. It's
literally something that only embedded people doing odd things should
do.

If that rule was actually an important part of the ABI, it shouldn't
have been a debug thing.

So:

 (a) the debug code in question needs to just be removed, since it's
now actively detrimental, and means that any kernel developer who
*does* enable it can't actually test this case any more. It's checking
for something that has been shown to not be true.

 (b) we need to fix this (revert if it can't be fixed otherwise)

I see some patches flying around, but am not clear on whether there
was an actual patch that make this work again?

             Linus

