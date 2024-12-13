Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTzQyXIHcaxEEVwjd+PpJ1XyNFyqZzECKyZ+9DQUQzo=; b=2d4/Z1ZO0F+pYp8kQsLx4qE/nx
	kRsY712GgjH7GhOofOA1QdjzyjMjuz5SOS70hVQEwTo+21L2KvWd0HWW+tQ3F3uYHD1JOZyMzEvKc
	qaBOhKq9u5tlFZvwloiImRFJrUs2h1WpwzKxDKjw8iB2glLXMfCz34t6jNfwaBh35EHr2TTe2Zh/n
	ktoEpKsSm19FNCU11QvGO5Aahr6ny9OHXnejeU1pp6o6GmLQcQz2fsGnXgaeZBBKRim1QD5NtS41D
	Zh9vKXQLCVio2S7WrF7ZYrTg7Ncorgk6Pz1XKzwr3vNKTg8QAO+fIjJemyTPMuw/qOEfSQCIDkP+b
	rap0dHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1y4-00000003G85-3V6s;
	Fri, 13 Dec 2024 09:28:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1x0-00000003Fzu-061w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:27:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-725d9f57d90so1103302b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734082028; x=1734686828; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hTzQyXIHcaxEEVwjd+PpJ1XyNFyqZzECKyZ+9DQUQzo=;
        b=NGiaRiodRwM8UW1JJ59jq13IpBnlY16TvDD++f/eVE4Fodt0/L4j1BKkYYbB6y6FLQ
         euNzXti2WbZ3H55MhFA8TppVKc0T/fBXyFZ0NHd2V8yDmkmhG3U5Q6oxUtYtMDX4pE45
         VWZORzUYsLmn0AI4vvcUi4usLJlMZOHR7SCq+BhLGU6AwKtmjnxcqpGy3xvxq5yRsZyt
         eDAwGm4e8Bs61zxZG3vt9Fd64ZhCF50QSHhSIVIyiCS4aMk62Ih0VfTrCVSeVv/TRqIo
         h1GXqs5iRMb0YTM22EdbOPP7RQh8OYDfIDIKCebi2WisbHGbykQXBW0kFtwfhQ59IPkW
         aDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082028; x=1734686828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTzQyXIHcaxEEVwjd+PpJ1XyNFyqZzECKyZ+9DQUQzo=;
        b=pl3qBqDRX8QUkuL3xQok1BuJMADAavQUl17Ds7ssNVQ8WzH99xzok2UZCSRZBSwWxz
         VBUyIZ2RbP9O5sHaOZRLWbeudReLJQlwvS1xRgRP4G04KsoqglGjkgk84zGODRBFtgDG
         o0+HjNZz4Z8lNLQ6wOyto6bzGVvarDpsXfByML+nVwU0GZrKkaaqK+AkLhnPFiUthXk0
         UjWySw66mfet+s5YWct3mEsgZAQs/TNQ/y7bGpXgUWX12fNRQ8R8TuPQiZ9czvboGw3G
         pJR6ZxhTtKi7qPEnZmbayh7e35oZu/7mBmEYy7modk11bDPLFt5+sKKe+ihsjEDh72x1
         6zRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsV1/uIDiar2KC87dhWMd/y8t7iJpGsKUZXVD0oIpQIDAJ0X+RW/bRXMYdXfAnZMKQXpn4BJhD9K6+at42Cj6r@lists.infradead.org
X-Gm-Message-State: AOJu0YxcN9Lfm4DUqfuHtlYmNQaMzoOaG68Qphkb7CYmTwBAF1sbXN62
	bes2YeR21hUVAqh7GJdnPUhOBazaDeA8+rQ7bcafDphf9rgk8bz9
X-Gm-Gg: ASbGnctYTQeZylBL6Bq7bxn8mMhp0bBZ9CP5TP8rzrfmdQqaFEviEbUdywHhKGUyBxJ
	yRSR/BHCBVapRek+OjDyQjiL+Lh6ZKlkdd/x9DXGaxvSHeZLNmoM6pPoxy/v7L+78WqZ0IKqCOp
	tgc7SKpPjUA4gDQUft9s/WLc0waUL9OsX4ebTPXKtqFwbYEllNSvQDLCTwrYcS2rvWg81s0FO5H
	euhXcS3C8AzLhMWjvKxnP99UewBl5e8N+OhTX0Ro6evlxwbTFPQlxrL/g58CWLde/lQY2fPW4r9
	ESnUqpk=
X-Google-Smtp-Source: AGHT+IEotA2MyBaR6GaoJwJuWdf/DB/mrRTTIJotvOvCF3vwProtl1t9f2/mF88td+J4waI8v5QJVg==
X-Received: by 2002:a05:6a00:430f:b0:728:8c17:127d with SMTP id d2e1a72fcca58-7290c12ef7amr3243500b3a.8.1734082028273;
        Fri, 13 Dec 2024 01:27:08 -0800 (PST)
Received: from MBC02GN1V4Q05P ([117.143.114.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c7cba42fsm11948546b3a.123.2024.12.13.01.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:27:07 -0800 (PST)
Date: Fri, 13 Dec 2024 17:27:02 +0800
From: Richard Clark <richard.xnu.clark@gmail.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	linux@armlinux.org.uk, mark.rutland@arm.com,
	torvalds@linux-foundation.org
Subject: Re: Question about interrupt prioriyt of ARM GICv3/4
Message-ID: <Z1v9GKkghPjpnvp6@MBC02GN1V4Q05P>
References: <CAJNi4rMfhZOCT+7Ki14vUs+dZbv9cxCZ0s+jgn6=_om4NTgo_A@mail.gmail.com>
 <86cyi5tanz.wl-maz@kernel.org>
 <CAJNi4rPDVXS3Ft3nHLXvMzHmn9d10Nz4Pxeduoe+v5HaK=CEAg@mail.gmail.com>
 <86ldwlryzz.wl-maz@kernel.org>
 <871pydxde2.fsf@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871pydxde2.fsf@bloch.sibelius.xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012710_070284_16F9ED27 
X-CRM114-Status: GOOD (  58.43  )
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

Hi Mark,

On Thu, Dec 12, 2024 at 02:02:45PM +0100, Mark Kettenis wrote:
> > Date: Thu, 12 Dec 2024 10:12:32 +0000
> > From: Marc Zyngier <maz@kernel.org>
> 
> Hi Marc, Richard,
> 
> > On Thu, 12 Dec 2024 09:18:56 +0000,
> > richard clark <richard.xnu.clark@gmail.com> wrote:
> > > 
> > > Hi M,
> > 
> > Hi r,
> > 
> > > 
> > > On Fri, Dec 6, 2024 at 5:37 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Fri, 06 Dec 2024 08:33:11 +0000,
> > > > richard clark <richard.xnu.clark@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > > Currently seems the GICv3/4 irqchip configures all the interrupts as
> > > > > the same priority, I am thinking about to minimize the latency of the
> > > > > interrupt for a particular device, e.g, the arm arch_timer in the RTL
> > > > > system. The question is,
> > > > > 1. Why don't we provide a /proc or /sys interface for the enduser to
> > > > > set the priority of a specific interrupt(SPI/PPI)?
> > > >
> > > > I'm afraid this really has nothing to do with any particular interrupt
> > > > architecture.
> > > >
> > > > Before thinking of exposing the interrupt priority to userspace, you
> > > > should look at what this translates into for the kernel once you allow
> > > > interrupts to be preempted by another one with a higher priority.
> > > >
> > > Interrupt priority doesn't necessarily mean the preemption, seems
> > > you're talking about the interrupt preemption harm according to your
> > > statement followed.Frankly I am just thinking higher priority will win
> > > the lower ones in case massive external interrupts received in the GIC
> > > level (you see I am still talking about GIC, not kernel)
> > 
> > As I stated at the end of my email, the GIC only gives guarantee that
> > you will ack the highest priority interrupt in finite time. Not right
> > when it is made pending. Yes, it has the concept of HPPI. But that
> > from the PoV of the CPU interface, not that of the distributor. Factor
> > in the Stream interface, and you realise that expecting to always ack
> > the highest priority pending interrupt is akin to expecting no
> > reordering of packets in a network.
> > 
> > > >
> > > > This means that at every point where you would normally see a
> > > > local_irq_save(), spinlock_irqsave() or equivalent, you would need to
> > > > explicitly specify the priority that you allow for preemption. You
> > > > should then make sure that any code that can be run during an
> > > > interrupt is reentrant. You need to define which data structures can
> > > > be manipulated at which priority level... The list goes on.
> > > >
> > > irqsave just masks the interrupt from the point of cpu, I don't think
> > > it will mess things up if preemption really happens (no? then what the
> > > side-effect is for the nested interrupt handling in the softirq part.
> > > damage the semantic of the lock primitives?)
> > > >
> > > > If you want a small taste of the complexity, just look at what
> > > > handling NMIs (or even pseudo-NMIs in the case of GICv3) means, and
> > > > generalise it to not just two, but an arbitrary range of priorities.
> > > >
> > > > If you want the full blown experience, look at the BSDs and their use
> > > > of spl*(). I don't think anyone has any plan to get there, and the RT
> > > > patches have shown that there is little need for it.
> > > >
> > > As supplement，the fiq is suggested to be used as an alternative to the
> > > higher priority in the RT area...
> > 
> > <PulpFiction>
> > FIQ's dead, baby. FIQ's dead.
> > </PulpFiction>
> 
> Hah, tell that to Apple! ;).
>
Suppose you're kiding, seems neither Apple employee nor working on its HW :)
> 
> > > > > 2. Is there any way to verify the higher priority interrupt will have
> > > > > more dominant to be selected to the CPU (IOW, the priority is really
> > > > > working) in case of multiple different interrupts asserted to the GIC
> > > > > at the same time(some debug registers of GIC like GICD_REEMPT_CNT :-)
> > > > > to record higher priority wins)?
> > > >
> > > > The GIC architecture makes no promise that the interrupt you
> > > > acknowledge is the highest priority pending interrupt, because this is
> > > > by definition a very racy process.
> > > >
> > > > Also, even on busy systems, you will very rarely see two interrupts
> > > > targeting the same CPU being made pending at the same time, so that
> > > > the interrupt delivery system would have to arbitrate between the two.
> > > > That's because interrupts are vanishingly rare in the grand scheme of
> > > > things.
> > > >
> > > 1. I am trying to stress the external interrupts to the core#0 via the
> > > stress-ng tool with one of interrupt being configured as higher
> > > priority to see the benchmark data, it's time consuming as you can
> > > image, still is in progress(BTW, I can't see any lockup similar hang
> > > in the system with a higher priority configured)
> > 
> > If you don't have preemption, I don't think anything wrong will
> > happen. But I don't expect any benefit either.
> 
> Based on my experience with OpenBSD, I'm not even sure there is much
> benefit even if you have preemtion.
>
is OpenBSD has this priority feature supported? or do you have some related perf
data on BSP...
> 
> And regarding anything wrong happening: there is an interesting bug in
> the RK3399 GIC integration where it gets the priorities wrong:
> 
> https://github.com/openbsd/src/blob/feb3ea439d8f49b3c0e33f54c34631a611b98e21/sys/arch/arm64/dev/agintc.c#L395
> 
> (that comment is my interpretation of what's happening; I might be
> misinterpreting what's really going on)
> 
> As far as I can tell the Linux code doesn't handle that quirk.
> Probably it doesn't matter because Linux only uses the priority
> mechanisms to implement pseudo-NMI functionality and/or doesn't do
> preemption of interrupts.
>
seems the BSP has the priority support but encounter the bug/quirk, correct me if I am wrong. Frankly I have no
time to read the code of your link

	r.

> 
> > > 2. This raises a very interesting question and I am also very curious
> > > about is, what is the purpose for the GIC to introduce the interrupt
> > > priority features, a placeholder feature reserved for the future? Ah,
> > > hardware prefer to provide more functionalities than its being
> > > actually used by software, any other justification except that?
> > 
> > You realise that the HW is not exclusively designed for Linux, right?
> > 
> > 	M.
> > 
> > -- 
> > Without deviation from the norm, progress is not possible.
> > 
> > 

