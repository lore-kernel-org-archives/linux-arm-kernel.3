Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC0CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbO9ihI8N/tHJd5rn+q0yf0ZhhuPpFDOP1LlEgGefh0=; b=hIkskOfxZ+Y4BusAnEFvITO+IF
	Y3iXlQ0x/8CZD+Sz34E9bWW7PczD0+xKObOnJDNAaJY5QG+MY5Tj0dWFl8rboDysnI4IllUr3RbJq
	pan77WEqfxVTqSq73RZ1tfknbd5XM4HUWEfQ6Mr1wyx8dQ13bLfaoow62e3ydSn65I6t/+TlFiTXM
	5dKq1zYP/Pu+q7lmOgAIOJXoYlQevRSg1CAP/KyjUbFlpTx95PmqxQe0GH5RBOTmCmuiCkD0vArXO
	f+gsKiZImNRiNM1e6HCn31+x+4zN19HqsYXzPp9Jn3LiNGF7Fn4lQhXFAfDiVtFV3JhkqTVeQsDmJ
	yZtIvpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaZB-00000003azK-3WsG;
	Fri, 05 Sep 2025 17:49:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWuG-000000027lf-2rlT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2349C60284
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 13:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA1C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757080511;
	bh=tbO9ihI8N/tHJd5rn+q0yf0ZhhuPpFDOP1LlEgGefh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jFOlwufCougt/KWndQp5f92rVECAChAIQNoFor7KFc8x6Bw4tYTJiozWza/6NluUi
	 BFGShRkwWQS5I1wJbbiNtJTjhlF9caNARCOumM3OysnR4XBzsB+Jf4omq7HmdmQX6V
	 UUBzBYUPt2avxON+tAe7WSfKR/gg309FIq+MYz0W8iOV+nXBJreXko73B1oMGpF3yP
	 YD3vdpH2LsDjmu6Akw8XUpHjAFdwE1edMWl8h8FEinH6Lw+lF10guZv3QhL7htyMnL
	 dBSqjhwLkDEesMEYwQ2Ht8UKXdwEJlVcYcx/2lzh9oo3HbbyzED/9QoSyglPPgQFf3
	 tBC30iVlTA/zg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-337e1ce5dd1so16880771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnTC/ZbZbGWd1+VelbBgIhka/WtsEha/CScNMn8fizPzqk5wxpweD509PvTKlNPlgiYlb+erQM4eBCPbtN+Fwf@lists.infradead.org
X-Gm-Message-State: AOJu0YxzmgzZebvqtb4Tw9ybb7Sl2WDRdvO2BhVz1XW1bpP+AA64zPbO
	hnNM3wUKCQzUm7lSQqR9xvXZtNsQfx5ungVUMNhQs8gl97HkA52YK821DXWj9gx782I0/z6FmOu
	zJ73wFIFJUpVzuJcGyJXgTWgjENomrz8=
X-Google-Smtp-Source: AGHT+IGnR2SsMTiyOAAhvwYnOIXA5lhedj7YSR5pCY82ACY1he4UyteJ+PqMEQ2mdIywc/cZuplmILslAXt6ruyb2Ww=
X-Received: by 2002:a05:651c:20da:20b0:338:1c5b:37f0 with SMTP id
 38308e7fff4ca-3381c5b4ba4mr9724091fa.32.1757080510151; Fri, 05 Sep 2025
 06:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com> <20250905133035.275517-14-ardb+git@google.com>
 <20250905134409.GD4067720@noisy.programming.kicks-ass.net>
In-Reply-To: <20250905134409.GD4067720@noisy.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 5 Sep 2025 15:54:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE49HFQHYJ=bgz2hPoa7ZocqbeL+pWGtpxxBU2g6_7+SA@mail.gmail.com>
X-Gm-Features: Ac12FXwgTpHgZE1QucUvVXDJ06PpzmoBlm_o2ucaJEAd7ZBRUBINwU5z8wjYoHg
Message-ID: <CAMj1kXE49HFQHYJ=bgz2hPoa7ZocqbeL+pWGtpxxBU2g6_7+SA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64/efi: Use a semaphore to protect the EFI
 stack and FP/SIMD state
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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

On Fri, 5 Sept 2025 at 15:44, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Sep 05, 2025 at 03:30:41PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Replace the spinlock in the arm64 glue code with a semaphore, so that
> > the CPU can preempted while running the EFI runtime service.
>
> Gotta ask, why a semaphore and not a mutex?

Because mutex_trylock() is not permitted in interrupt context.

