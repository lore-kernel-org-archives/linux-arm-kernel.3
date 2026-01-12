Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA59C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=; b=VaNE5UED8XdkNhtDuyyl60XI/O
	YxYNYzknpOL6kX+dAopeHo+sme03qx3Oxq9v5IkvWP8u1zJe9xEpNLJHcMJjpZ4p6XZd0twc9Fthe
	DmB1puEmEZ6Jxc6tN4x/Bt+WlebmcMd0RRYnwJst3ZwXI93cnSd0btCxwvemD4HlkdFY4PfuXMj7V
	9Pa4a/R8xCbwgfxkxLP+RfnbonQbvDu2YGmRZZdmynfgsdiEmTi9sOXS3z0QzSdHNm67/KsI0kUw/
	qxTwJGKDBLLlIXTgVQzXOzMeH9lhVn7m5gvk1lk3WfTtqZGyStUhASyQOpOhbS6YcVHXqRXJ2zG7j
	OWGgHlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5r-00000005Q9Q-09pV;
	Mon, 12 Jan 2026 13:36:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5p-00000005Q8J-14n3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:36:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3320105f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224982; x=1768829782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=TsZan0AfKoP9fouLSi3y3hRgnc8Y/vjEK4Iv80aVF9RPIhxxmQr+gzZjiYCy3eLrts
         IM849ZfGK/VDK6TXpb78ZCx/zeDe9ohlzePK0upJWZ/GQclCwpKry3leoBj3omcOosE0
         94wOL/ZOXcVadBH3Ub4Nbxbl1p5236wvwOeSBeC4EhCKYL1qAXe01F22GSI4c5Dj5jfS
         4qmQvgcl2VL91vXrbDq9kFEr+UdUZqMUQxpxUAlBzRxnwXiuoyyhkOZ3rrZUCg41XCwA
         tgkF+t4UuKuUCTDvOGSSWsQrBRppZ+6cJZ3EQM13eYOXxj4ncsDgsfZpslfk5wrrhXGR
         78OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224982; x=1768829782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=vVAF4/NanN0nbDe73MbY1s7/1QrAF6PErpcV7O8Ofdj6MOAURs4ulnROLqYoJseCwz
         dPVmdJ6li0k2tUgY+edCvj3DvQMI0oV/VwIHUZ11Ld4wFkmVLaIb8afUuJNr82zEIq6Z
         jMMnSgNixB2qIMXZr+JN4hw0L9ris7TOFp6px7XEPnNRl7JwHTIWRXIfTVW/AMPpF0h0
         nB8sKBcB9g/l5/Ko6dxsxYx3Vx251W6nfnhUvtX/Pjj0WRMzb/m3etkjpPDTTy7UfPlo
         2Pfn4gYjnw4c1oCcO8WuCYRJC+Nm28oxOmWqa1PwoE0xzmNxa5BPmjcnKvlAWgEAbhoT
         8ejw==
X-Forwarded-Encrypted: i=1; AJvYcCXUDxVbahtwbL1pbge5crlSNUaE7cnH08asdXsUdCagkT2ug9VITaWWnnv216Um5LfAQYhmFDgaqa7hoaRlJAGq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn+Jut+DtFXlzD+tFr+eLAw9cjeVOtuTRU+3kh17CT44YGwxvC
	Qdr5nwkoiUTPuom8a2XuTSxpHVt3jC2/SFQ1NoAkOHHLcwj25q6fTP0N
X-Gm-Gg: AY/fxX5EhWueFo9PJfL6wm1+CZJl3J6xxq7Y8CGOU/ba4NrSslm/Cxi/xJGB3oaTCh8
	vbwr2OgMX6Yb49blzElYAJRiyT1f40b+OQMrPfFFlqWn2Du/N6M/pJB2VIt9KXY4ztXF4V9yJ0S
	AFiaRdr5B8aOfNX/kkb08l6DGTJMQvpBZKjtnr9PffnURWiHW7H24tIN6vJMeFb2TMti77MQe8w
	+e8Pxs2q8OZ6+ydqIIZsLsA77QroLOdc8aJHJluWr5wnKLvsCUc58g9Iewe3pBLwJ1qJzxOvsID
	0HfzQmBz7vsNj3nhMYJQnXX6fiXgq3xwB2Ab+FWGlsEykQxcFlF1rcLIEj389Vtf8kIv2nhNq/S
	yPftn2EgwZYFtmNb5Zmp4+YSs7AwKRUGDsm5Xkunn3WaIgSo7KFXYuXi4SGlc4IUEKtOPROViAh
	fivBwVQbeLsRkLVvoC4O9HkxZQ5RQo6vc251aQJuVazolR2RNzw+2m
X-Google-Smtp-Source: AGHT+IGyxiv2XFt49Pj+G/FCKb6Do+/qO1fvIxMUjWKWGTcpTcAtASoZtqcJMaJZUWyMrmC4TwCROg==
X-Received: by 2002:a05:6000:40c9:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-432c3628374mr22009793f8f.11.1768224982426;
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm41054434f8f.24.2026.01.12.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Date: Mon, 12 Jan 2026 13:36:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260112133620.2863e1d6@pumpkin>
In-Reply-To: <09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<20260107140533.2b3c46a1@pumpkin>
	<09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_053625_308758_437A1C85 
X-CRM114-Status: GOOD (  35.48  )
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

On Mon, 12 Jan 2026 12:26:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 07/01/2026 14:05, David Laight wrote:
> > On Sun, 4 Jan 2026 23:01:36 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
...
> > I've trimmed the initialiser - it is very boring.
> > The code to create the initialiser is actually slightly smaller than it is.
> > Doable by hand provided you can do 128bit shift and xor without making
> > any mistakes.
> > 
> > I've just done a quick search through the kernel sources and haven't found
> > many uses of prandom_u32_state() outside of test code.
> > There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
> > bpf also has a per-cpu one for 'unprivileged user space'.
> > net/sched/sch_netem.c seems to use one - mostly for packet loss generation.
> > 
> > Since the randomize_kstack code is now using a per-task rng (initialised
> > by clone?) that could be used instead of all the others provided they
> > are run when 'current' is valid.
> > 
> > But the existing prandom_u32_state() needs a big health warning that
> > four outputs leak the entire state.
> > That is fixable by changing the last line to:
> >         return state->s1 + state->s2 + state->s3 + state->s4;
> > That only affects the output value, the period is unchanged.  
> 
> Hi David,
> 
> This all seems interesting, but I'm not clear that it is a blocker for this
> series. As I keep saying, we only use 6 bits for offset randmization so it is
> trival to brute force, regardless of how easy it is to recover the prng state.
> 
> Perhaps we can decouple these 2 things and make them independent:
> 
>  - this series, which is motivated by speeding up syscalls on arm64; given 6
>    bits is not hard to brute force, spending a lot of cycles calculating those
>    bits is unjustified.
> 
>  - Your observation that that the current prng could be improved to make
>    recoving it's state harder.
> 
> What do you think?

They are separate.
I should have a 'mostly written' patch series for prandom_u32_state().

If you unconditionally add a per-task prng there are a few places that could
use it instead of a per-cpu one.
It could be 'perturbed' during task switch - eg by:
	s->s1 = (s->s1 ^ something) | 2;
(The 2 stops the new value being 0 or 1, losing 1 bit wont be significant.)

This one is much nearer 'ready' and has an obvious impact.

	David

> 
> Thanks,
> Ryan
> 
> 
> > 
> > 	David
> > 
> >   
> 


