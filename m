Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A42D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXAeBT1lMbiyPDpllsNP2CJSnS+mNvTWXZomcT5wmnI=; b=4YteShfoPKZclO7eUdTW2mByoY
	9b9bcALcdZ6FckguVoPVHUdVxg5rfb+YuGfbgVsBdo5jI2q24UC8RNsiWxXzWBMbrXr4/v65In4Ko
	XTUEmftI3ytXtaIpA/DRvgnlD/KVx49VEPBgfmxWYuzx7E5PZGz+d3vkC3xv1nAeWWGMpqFzGUMex
	sG4CGLF2sVZD5zSAnglnvnjIztOVnL65ZiHfE5jI6pB+/gTGbfXXx77hQ676xuBQPHCU5LLXsTmfc
	wBY2GsriqYXNeDVWHJU67i7qAtpO3DSAIy+CRTHCo1L2bFCqqE4RQnrwkcLvajWe2LkEM8y83vPK3
	nRX/xx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOayk-0000000GXGt-1T9q;
	Thu, 27 Nov 2025 12:20:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOayg-0000000GXGA-12mC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65D936014D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 12:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBE6C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764246001;
	bh=zXAeBT1lMbiyPDpllsNP2CJSnS+mNvTWXZomcT5wmnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqaUDtnq8l1zZz2L6bQox2uE/ZG0Hll+bmbcZxLJeSva+zv5bMP2pBBudG9XhibeX
	 tMh0SGobPEkCTVlDzpArioHcJhnP1qL6UH0hy1B/1Y07SAqmhpg5Ya9sv5oBITDCxT
	 KS57oKZjb2+js819uoazaWQjKgaHwKY8GGNdT/3M6nz4WDmLf6Dka1OAbpJLhLk5lj
	 RaB6Jg+ugn4nkeZCAeNW76SGCQcwxLQwIMQe7ns+5dx0cIIN94cLxm0oFQityJaAFD
	 XGLaI2TSsMwk5t68WzS5mcsiBF/IXiaWC1J/5pSjR4Wg6Ulpep6BMFnfuHQLWTcX5W
	 xoej5P/ACD6+A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-594330147efso805049e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:20:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV62PqKoeF2/KD5tdupuXWj8pBqvGrUUPuh2q3uQMGW+6zLp5iFv4xSuv1KMN7Wsl+wUzcexHaXvFYQWQoBAxfO@lists.infradead.org
X-Gm-Message-State: AOJu0YzcntbbzK7vhQgzI2vXdx+Zv/F20rMRAirRY8oJa9LPhjAlTiSp
	pz0yDTns+vkYUhyIQfeVp5nythmkvIiZ/lAdLsSXyHya3NKz5jVHyrfL9NYfC9R2+a8VFMEXs+P
	DgESyUkTUBYdVxZ6x8+Ica86mALRsSVM=
X-Google-Smtp-Source: AGHT+IH+P3i0GzNV1pBkRC65hN4mb/axoJ/folK00YqQFSAH3V0WuH+c0jZL6bJT15wKp/S20bR5N7qV0JB8k0RwOng=
X-Received: by 2002:a05:6512:398c:b0:594:2f25:d488 with SMTP id
 2adb3069b0e04-596a3ed2f58mr8449947e87.21.1764245999457; Thu, 27 Nov 2025
 04:19:59 -0800 (PST)
MIME-Version: 1.0
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com> <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck> <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com> <202511241250.EB2ADED@keescook>
 <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com> <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
 <202511262358.1B99951@keescook> <a5afc696-b288-433c-8fda-12b9126c02f1@arm.com>
In-Reply-To: <a5afc696-b288-433c-8fda-12b9126c02f1@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 13:19:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEJSmYXPNiHO4woBE8rVFOxkfuKOJ9JGacVC76GqkqY+w@mail.gmail.com>
X-Gm-Features: AWmQ_bk3Lu_ixorzUm2KTog4EouJZNksgjcKNucgHcpZ81ZY8kcVZ8Gs3hapG1Y
Message-ID: <CAMj1kXEJSmYXPNiHO4woBE8rVFOxkfuKOJ9JGacVC76GqkqY+w@mail.gmail.com>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Nov 2025 at 12:50, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/11/2025 08:00, Kees Cook wrote:
> > On Wed, Nov 26, 2025 at 11:58:40PM +0100, Ard Biesheuvel wrote:
...
> >> the tail latency issue, but I'm not sure I understand why that is a
> >> problem to begin with if it occurs sufficiently rarely. Is that a
> >> PREEMPT_RT issue?
>
> Yes; RT was Jeremy's original motivation for looking at the prng approach.
>
> For the issue I see, improving the mean would be sufficient, but improving the
> tail too is a bonus.
>
> >> Would it be better if the refill of the per-CPU
> >> batched entropy buffers was relegated to some kind of kthread so it
> >> can be scheduled independently? (Those buffers are all the same size
> >> so we could easily keep a few hot spares)
>
> That came up in Jeremy's thread last year. My understanding was that this would
> not help because either the thread is lower priority, in which case you can't
> guarrantee it will run, or it is higher priority, in which case the RT thread
> still takes the glitch. (But I'm hand waving - I'm not expert on the details).
>

PREEMPT_RT is generally more concerned about the worst case latency
being bounded rather than being as low as possible.

The get_random fallback runs a few rounds of chacha20, which takes
more time than just reading the next value and bumping the position
counter. But that does not imply it fails to meet RT constraints.

And if a thread running ChaCha20 in the background fails to get enough
cycles, it is not an RT problem, it is an ordinary starvation problem,
which can only be achieved by doing less work in total. But cranking
prandom_u32_state() on every syscall is not free either.

In summary, it would be good to have a better problem statement wrt RT
constraints before assuming that 99% tail latency is something to
obsess about, especially given the fact het getpid() is not that
representative a syscall to begin with.

