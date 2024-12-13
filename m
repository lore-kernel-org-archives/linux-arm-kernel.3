Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9355CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9odnWlNvbIAJxNwIQe2y8lDLwTJga+YaH3t7y8G83cM=; b=rVOIvA2fpcuucfTHBF3Vj2k0Zi
	EV7Lcj2aWjAS3Rno+yDG28BLe5qVmfz8W3r34HNHq5JaOQKz+jtRhgVFW//LjugI/4FM6G3S3ft4E
	DyLj/yxcjg/Ma06aAKLy4NE0TrqpCCB33O5M7YkLe8EMDnrdrdIgG+nCFNeGA8phi7zecUaPASQEG
	p0sciJp4gYN9hvLwRPQabt6MAcO72At9ItFij9He1N8UOcAYnjkaYApkK9KtVg0XvAB26XvAx4fLe
	EUpNRXZjV2ilFw7XKeeGZrxgwAXvxA1XLDnHO3pZAdqkRymiNe1fumbyJlaUvLtlDW5rYLxuCmPvW
	+c/X7ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1la-00000003D7w-2Zw2;
	Fri, 13 Dec 2024 09:15:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1jU-00000003ChB-1uVh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:13:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2162c0f6a39so24915205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 01:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734081191; x=1734685991; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9odnWlNvbIAJxNwIQe2y8lDLwTJga+YaH3t7y8G83cM=;
        b=YOzMNlwvnM2O6Shrd4lzJjWh4z+Qy9cznT5T8woyg8e9XLNBvyKJQziOgqzSyPGntX
         Suo/qSKyc5hdz3v9gOm2oHDmaLKhC7tW9MTpgi3HpcsEFrAb7l0Wl54gQoedvswhyUDa
         bURSaAC7v77H+nbxXsQWlD8qN4eAe9CdgGwExBR5aMjx3wts2cuEkaMi4I/5MNQtjE+v
         d+KUTKvpEvNS2+k6OOnKFjxJRvUm35VYf179vmWXVQfXciz7yUT2WaY4Yj4orF1qpvfL
         +1JqrvqckeQVZc1LRxuOrziOa9zs62Cl96+JSldKKc4m9Bzl0Azd2tTVq6q7kkTaU9Pj
         J9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734081191; x=1734685991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9odnWlNvbIAJxNwIQe2y8lDLwTJga+YaH3t7y8G83cM=;
        b=mBriQQGMWAYGUsGv/bF/UhPdpvuJu2qdwoMOcyTGXdpXcTjFdMU9bvMWE4DVg2iK54
         PX9T+S+HunRVzLCaM10vs2ObKRPrBJQIn4UJaenEQUwL2DcIYdF15+ffCckcRugGJsox
         QO6ETYjysCHxuaMK+AdzK87RZ68IO5Soro+krzp9HswjPglZBklo8GRndvOFTTIVOWvb
         9UYYltXF3s6koSD+yNf0UXTZNHxFDgOPdLotNrZd2+6UEjJnAMqC6GT9iFc5i/SYPgQa
         KQ9EkUDjAHs0XSr/9GHjyT7Sk3n3ef23BZFeBJ2v6cSpJdcm8zzPctlu03NNbq+1svV1
         rFIQ==
X-Gm-Message-State: AOJu0YzaLAajYxiLA7OkTrNylwYgoFZFzel5HuJRsPOzXJT5cRFsjuGq
	YXoryDJDRA3Z6V7gjORRa9iVLCxDWdOtEA399UCGlD2/j8HcDcsWB3Oe6Knh
X-Gm-Gg: ASbGnctxIQf6yd5AE3WHCbjAnZilvpaFJa1inVhELW6Q27W1xxiF1cFnP/3SfLBMd/y
	MDoDPiLQFKgFqcOOm918PEezbNx1AVlGUSO3qkeMe0944K0J2xENE0FUje5QWXApLTesj3af51J
	UHSSAu0VqnC9ISCUJ5rdcE9Dhf8XpCWuPvAqO0UQxQL6ou1qcn1A0vn9YdGdSiJdBZFogLy9rIM
	oUjAxTjWH1GuUHXJqalhNjMUxdwaNJ85BUEwDfndt9VJwBDyASYf2UhwH9jf6kRuAJGwHcti7xm
	LdxOk7g=
X-Google-Smtp-Source: AGHT+IFtEar1BU3xr1HATQkCx25u8mBGWmtsfz6eRpRGGvEh8YuIBVU9Mn1d1iJyHg69ffJV1tOlMg==
X-Received: by 2002:a17:902:f711:b0:215:b18d:ca with SMTP id d9443c01a7336-2178c85c532mr108043425ad.18.1734081191039;
        Fri, 13 Dec 2024 01:13:11 -0800 (PST)
Received: from MBC02GN1V4Q05P ([117.143.114.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21625b4f979sm109576545ad.172.2024.12.13.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:13:10 -0800 (PST)
Date: Fri, 13 Dec 2024 17:13:03 +0800
From: Richard Clark <richard.xnu.clark@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Question about interrupt prioriyt of ARM GICv3/4
Message-ID: <Z1v6n6c6GB2_pFiR@MBC02GN1V4Q05P>
References: <CAJNi4rMfhZOCT+7Ki14vUs+dZbv9cxCZ0s+jgn6=_om4NTgo_A@mail.gmail.com>
 <86cyi5tanz.wl-maz@kernel.org>
 <CAJNi4rPDVXS3Ft3nHLXvMzHmn9d10Nz4Pxeduoe+v5HaK=CEAg@mail.gmail.com>
 <86ldwlryzz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86ldwlryzz.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011312_532291_9BF7C083 
X-CRM114-Status: GOOD (  55.76  )
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

Hi M,

On Thu, Dec 12, 2024 at 10:12:32AM +0000, Marc Zyngier wrote:
> On Thu, 12 Dec 2024 09:18:56 +0000,
> richard clark <richard.xnu.clark@gmail.com> wrote:
> > 
> > Hi M,
> 
> Hi r,
> 
> > 
> > On Fri, Dec 6, 2024 at 5:37 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 06 Dec 2024 08:33:11 +0000,
> > > richard clark <richard.xnu.clark@gmail.com> wrote:
> > > >
> > > > Hi,
> > > > Currently seems the GICv3/4 irqchip configures all the interrupts as
> > > > the same priority, I am thinking about to minimize the latency of the
> > > > interrupt for a particular device, e.g, the arm arch_timer in the RTL
> > > > system. The question is,
> > > > 1. Why don't we provide a /proc or /sys interface for the enduser to
> > > > set the priority of a specific interrupt(SPI/PPI)?
> > >
> > > I'm afraid this really has nothing to do with any particular interrupt
> > > architecture.
> > >
> > > Before thinking of exposing the interrupt priority to userspace, you
> > > should look at what this translates into for the kernel once you allow
> > > interrupts to be preempted by another one with a higher priority.
> > >
> > Interrupt priority doesn't necessarily mean the preemption, seems
> > you're talking about the interrupt preemption harm according to your
> > statement followed.Frankly I am just thinking higher priority will win
> > the lower ones in case massive external interrupts received in the GIC
> > level (you see I am still talking about GIC, not kernel)
> 
> As I stated at the end of my email, the GIC only gives guarantee that
> you will ack the highest priority interrupt in finite time. Not right
> when it is made pending. Yes, it has the concept of HPPI. But that
> from the PoV of the CPU interface, not that of the distributor. Factor
> in the Stream interface, and you realise that expecting to always ack
> the highest priority pending interrupt is akin to expecting no
> reordering of packets in a network.
> 

I am trying to figure out a meticulous way to verify if the priority really work
or not, all we're here is talk abou like the 'technically', we'd show the
statistic data collected. Except that the stress-ng to stress massive interrupts
to the cpu0, another way I can see is a kmod to remote cross cpu call targeting
the cpu0 from other cpus. From the current data collected, I do see some gain of
latency, still it's not finalized yet. Be patient baby :)

> > >
> > > This means that at every point where you would normally see a
> > > local_irq_save(), spinlock_irqsave() or equivalent, you would need to
> > > explicitly specify the priority that you allow for preemption. You
> > > should then make sure that any code that can be run during an
> > > interrupt is reentrant. You need to define which data structures can
> > > be manipulated at which priority level... The list goes on.
> > >
> > irqsave just masks the interrupt from the point of cpu, I don't think
> > it will mess things up if preemption really happens (no? then what the
> > side-effect is for the nested interrupt handling in the softirq part.
> > damage the semantic of the lock primitives?)
> > >
> > > If you want a small taste of the complexity, just look at what
> > > handling NMIs (or even pseudo-NMIs in the case of GICv3) means, and
> > > generalise it to not just two, but an arbitrary range of priorities.
> > >
> > > If you want the full blown experience, look at the BSDs and their use
> > > of spl*(). I don't think anyone has any plan to get there, and the RT
> > > patches have shown that there is little need for it.
> > >
> > As supplement，the fiq is suggested to be used as an alternative to the
> > higher priority in the RT area...
> 
> <PulpFiction>
> FIQ's dead, baby. FIQ's dead.
> </PulpFiction>
> 

As an advice too...

> > >
> > > > 2. Is there any way to verify the higher priority interrupt will have
> > > > more dominant to be selected to the CPU (IOW, the priority is really
> > > > working) in case of multiple different interrupts asserted to the GIC
> > > > at the same time(some debug registers of GIC like GICD_REEMPT_CNT :-)
> > > > to record higher priority wins)?
> > >
> > > The GIC architecture makes no promise that the interrupt you
> > > acknowledge is the highest priority pending interrupt, because this is
> > > by definition a very racy process.
> > >
> > > Also, even on busy systems, you will very rarely see two interrupts
> > > targeting the same CPU being made pending at the same time, so that
> > > the interrupt delivery system would have to arbitrate between the two.
> > > That's because interrupts are vanishingly rare in the grand scheme of
> > > things.
> > >
> > 1. I am trying to stress the external interrupts to the core#0 via the
> > stress-ng tool with one of interrupt being configured as higher
> > priority to see the benchmark data, it's time consuming as you can
> > image, still is in progress(BTW, I can't see any lockup similar hang
> > in the system with a higher priority configured)
> 
> If you don't have preemption, I don't think anything wrong will
> happen. But I don't expect any benefit either.
>

As a said before in this eamil, real statistic data is needed as evaluation,
WIP through now.

> 
> > 2. This raises a very interesting question and I am also very curious
> > about is, what is the purpose for the GIC to introduce the interrupt
> > priority features, a placeholder feature reserved for the future? Ah,
> > hardware prefer to provide more functionalities than its being
> > actually used by software, any other justification except that?
> 
> You realise that the HW is not exclusively designed for Linux, right?
> 
I realize, but it will be better if you can point is there any other OS
kernels make use of these interrupt priority of GIC but Linux, if no then
what the rational is for GIC to support these priority features...

	r. 
>
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

