Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA78CE63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6NwBIQ7eXVw+znH9rMDvom5IKc0tLlzEwcR2BJoXeg=; b=H1RJMufXfS0rTQWN36+kBNDod5
	3iTVe7VLiOx34b6VplQJuIvk60Q/2siPQCOGF0x5hxiHY8e355BZCO4ehkEP2ghiX+Ua9YTOey87l
	qXZAd7p/bNzbhjjO8sKuNxX2ecGa7O2/55TL19yUr9/eXULD/gWxjFXMQfRXmRBh4cwKE783pjDks
	bVQc9k9Xsluv1KWhIS0AlFh0TPXIzNoICps9Y4uRVrdbVaFvHIQ7Y86u69eal1G1/tBV6uUe1oCm2
	z7uNKVozZcGgXKroPlnjRTw4ar0hj60wQyF5tgLEoFhKXaUppSTbwVyjbkaQdVUFJ2sbqmx3gqtSG
	JvM2ixlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrlom-00000005mLi-1FN3;
	Sun, 15 Feb 2026 23:46:24 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrloj-00000005mLL-2sRF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 23:46:23 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b884d5c787bso344591966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 15:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771199179; x=1771803979; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6NwBIQ7eXVw+znH9rMDvom5IKc0tLlzEwcR2BJoXeg=;
        b=P4yHJo86w0QEtBdfHrMjxzhshEWNUYaN72EDGPzMXBkxCBVk4Y7krVHc4QQUG/f0Ex
         XU+vVuCT7e/7+4cZ3VsfJOOyZ4Di+tWm06z4tNUJQVoxC7ZcHxNKoFdHWPCBBjzq8a6T
         aTv/1V3O1hSMVHXtRVNa+r7pDi7MgSVwufcpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771199179; x=1771803979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6NwBIQ7eXVw+znH9rMDvom5IKc0tLlzEwcR2BJoXeg=;
        b=Yaz4n+GlsKEflNpp8lTBxrJi2EDMq8KArZe84t27jJBta82NVp1QGWU89iQd/TXcFM
         QjubHl9vgZI+4mYiIsN/B9pJxlJibshIGaVelerrh9VMIHYC4IABcMlI6wQhHASzeUB3
         ZRdhUnvAyzDcaMB0le1jPfzYUgYx9SCvhiNFAoyDOBjyS5Y5k3KZY9Mg0DHrpFyF8ndy
         to/Uv8qFRSQl8Zd6f0nAJ1KjUR34/te14V/wrdcZ44MP3T/5872AGKHsu/65ZBm4iGHF
         LPzomD0Y6GMvc0psF/YSbGZTGfIFr9qwmIyz+qR1dmTPPCknDC9jMtTTHTrPGpUjdrIj
         FuzA==
X-Forwarded-Encrypted: i=1; AJvYcCUG3TYjIih//7BW65R8fQyrNwloGwsDjJ9wqn979KI43D5op0PA6engEbI7dfzkeh6tWBoM+OFXWFHnkVV+9CNn@lists.infradead.org
X-Gm-Message-State: AOJu0YzTshyo/EOnQPICNBbJJnRrLCj1t2XNLTPMtqxYseUaKHNUDMBY
	L2zBrgLWKbQ/UUZ8ZaZo/k6U51iTB4ChBMyy19ngeGnHmBON4IY7C4hpQ1FJs7QD1uxu4cI4W5u
	RO6bjXzD1VQ==
X-Gm-Gg: AZuq6aI/evLZ1LRaGadG811UbpZXWWp6YRzj2S5BtB0FNx1cmEsdC+JiddHe3tCK9H3
	/AOtm1g34uaq6MxurGivZcLYYwCX7JRsOlM7UnHBOQiQ94+DCLu4eLanuySsCJepr+heY7rQzrO
	s2BFfaqrgshSilOTy7V5FtH1Le55pxyvGO85Eo+wYto5Akxxo08w/6+DxUQX9qp9P7Xj1ThfuUg
	pMwSLMl3sAdqEiqe3gOXBoHG1tad1YMxYQBo6xi5Os2VMjhG/Ti1XolRlbA+iQch57vxDzbTr9K
	9nZQ7YsGngGX8J4kC7TatRZFBF/F6/CN5clWaoKATDwCvF4gARxzQTtOGKGfX/NyHNdqFY1JgO9
	he67sibf5MyZ6nrOqyx75BdVYZ/U3ei1deCwtx7LzbR7HmhCv0oZlyDZH035FIveKO3VPoOiYAy
	wd1i5TMqSniKnb2jvnM6EKH0LbQYd7IyxPrkcAqBswmqM3sF37l3b/AkuogRiSaIfrMu5vEFIQ9
	Fm5afq2nzM=
X-Received: by 2002:a17:907:3d9e:b0:b8f:a724:8704 with SMTP id a640c23a62f3a-b8fc3c7d456mr332740166b.42.1771199178578;
        Sun, 15 Feb 2026 15:46:18 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385f5dsm204602066b.20.2026.02.15.15.46.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 15:46:18 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso4536582a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 15:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoBw6EKeSZgvsbiQZ2ZViOZJUFQM8RFDDBS6K/KGHzw2Brjgs3dLnQQTsTuGojPOIZHgmVTKrnYIRSWlY3Nqud@lists.infradead.org
X-Received: by 2002:a17:907:7285:b0:b8f:8cf4:adf9 with SMTP id
 a640c23a62f3a-b8fc38f2bf7mr268150966b.6.1771198823544; Sun, 15 Feb 2026
 15:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
In-Reply-To: <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Feb 2026 15:40:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
X-Gm-Features: AaiRm51C-TOhqxwqOCsQDQLvUjgYKxEEB-yLqUbC16D4v6k1IC3ICBouNKGd_k0
Message-ID: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Marco Elver <elver@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_154621_926735_44C8B771 
X-CRM114-Status: GOOD (  14.92  )
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

On Sun, 15 Feb 2026 at 14:44, Marco Elver <elver@google.com> wrote:
>
> I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
> case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
> 8 bytes (due to that static assert), but that itself uses the
> __READ_ONCE() helper which these patches were touching.

I think we could just make __READ_ONCE() be totally unchecked - just
make it be "const volatile typeof()" and leave it at that.

Anybody who uses __READ_ONCE() would then have to deal with it.

There are very few users of that left, I think it's mainly
arch_atomic_read(), which just doesn't want any of the checking that a
regular "READ_ONCE()" does.

In fact, there are *so* few users left that I think we could probably
just remove __READ_ONCE() entirely, and make our "atomic_t" use
"volatile" in the type itself.

I generally absolutely hate volatile on data structures - it's a
design mistake (an understandable one: it was at least partly designed
for memory mapped IO accesses), and the volatile should be in the
accesses, not the data, because very often the volatility of the data
depends on context, not on the data.

But our "atomic_t" is already properly wrapped, and nobody should be
accessing it with anything but our helpers, so putting the volatile
there looks ok.

             Linus

