Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B258E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrHqZqqEaVMU3oCHDCS41i+I4fc1QPJYYRzHrA7T2c0=; b=Pd1H6KMH3AYYrC7swUJ8sJh512
	upBEjjEqHr9lwBHdOl/WQ8AmqBfkCzG4z29qJkPycLVeZ2ISo5QcwOw/2jR5Zoqt1OjZ9zs8PUVVq
	6ByJLXFnweNKzJA0Ux6uOsmE6IFDaAsThtTyvvpaOX+RiEZcbtkpQedyn/FMIDiHhi+NNzY+CGd5m
	czFU8bEKzy6NGUabik3VWk2naRyZYpQt66Ni82260OcvTYu7hSJwer1ksuAwyL/YxC155Q3zTYCEV
	xgsKc1gVkdkSOxnAz9GIjSK3wb0B9kffZHdqU+z+N0CCCoZXoAP/y64qhwjMWquLJ2nx6qcvOUQif
	l7jwfz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcnA-00000004ySy-2DT5;
	Fri, 20 Dec 2024 13:11:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOclz-00000004yDn-2laJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:10:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df6322ea7so2285717e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734700230; x=1735305030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrHqZqqEaVMU3oCHDCS41i+I4fc1QPJYYRzHrA7T2c0=;
        b=Ap7WuQEwb8lfVkJmr5XDmw+W2yOoGIN3fBiVY2Zwh9vJZ5ck9AOUmCYtScZwsh2c4t
         7TcI8+CLy/COR3jlUd4jby2LLW3jczjnPjxU8c0VxvBvclxPS51kLGSBUySnLRntKo6g
         CK/mpizR5KivIGNBqPtV1cEPrJo+pamJJs/HKL6oELdm4GCmAUyekfy59utxWpF8KOQn
         jJ45q7Q2oMM5RI7RC4vm4HBbceNIyzVo/a1fz10NjBrekthnpIF1F5g/w4SWrR4Wu88v
         9c/5qZqSDaDPNqPtN0XfiSw7lpTa+2nPpIwDeY0Bc/RY/x3anEQ/oHoNW26RubNJqbaj
         na7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734700230; x=1735305030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrHqZqqEaVMU3oCHDCS41i+I4fc1QPJYYRzHrA7T2c0=;
        b=ATpXFfTPvL7U03BSg+lRyG3acajtUILegVn4SS0xDc3H+OqyfyOwOau/9urF2/Sasa
         AVdZiCJT/UbSAhbbpkZHREo7zhD+00jN2wb3adi4zUXTuhLx1bNqKO33qRNjCPNdGohl
         TaJl+CNi5+sDr4kw0LHAPyvYAhHYwqrmgl1lPNbsJkIIF24knzNPPe1nGzAEgdMmR6Sf
         0BotLX5YD2GAH1nMQ5mISIS4RhiXZkkvRezN/JUp4aQeibnV0epAX/ixODSqDlEDjvsH
         SrNgMyhL1UoXsfw+IXq/wW2/mrrR4aVZkn1xq+zSCupCj6reHPnrNyUPLSjog7FZp4Sh
         BXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbAGPEwlDc5Fkzjm5w3d9NvE7F4ox5stqZGTi2YppfrZ1LQp/Ga0hFGljWyFUSK5txiSzse811PPeLZMHEacsu@lists.infradead.org
X-Gm-Message-State: AOJu0YzgrEsF+J2JucTbNEJNMb7yIk/femlUnjoRlsKRPZoZweML8xZQ
	06JwFBYGk2n8iZl5U1QnmHqMvXt/9L5DEHp0G0WOTFJyBdkjh3pdf2/s5lk3zzRYgQLWI+FPni3
	zfGY9eFit6GA4yQLKmDrqFymrxrx/FIk8WD8XPQ==
X-Gm-Gg: ASbGncsYpFOMQkOGtknIXZlLk5t/uoNWmNgroGgo+/E6l/zNROI2vt7LZobdm7sovZE
	t228TWqVQeHsy0q1vlyOMm9x7BEIbkUlCo1mM7Q==
X-Google-Smtp-Source: AGHT+IEsWa7ECublo4QBSm9SpricFNqVcJqJSRxA1U/TGctMJucN3JX8+bo5j0L+A2ogMgWJu00AKQ5Mn/t8hFoEZhs=
X-Received: by 2002:a05:6512:b06:b0:540:2549:b6da with SMTP id
 2adb3069b0e04-54229547969mr730789e87.23.1734700229726; Fri, 20 Dec 2024
 05:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-4-arnd@kernel.org>
 <d54e11cf3f4d4216b5cecf29b761cd45@AcuMS.aculab.com>
In-Reply-To: <d54e11cf3f4d4216b5cecf29b761cd45@AcuMS.aculab.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 14:10:18 +0100
Message-ID: <CACRpkdYihj15SRp5t_8Aq4i4jtgP1-VLOSbbKG+ozLgiAuLgmQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>, Ard Biesheuvel <ardb@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_051031_717344_3DAA0DAF 
X-CRM114-Status: GOOD (  16.43  )
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

On Sat, Dec 14, 2024 at 7:41=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:

> From: Arnd Bergmann
> > Sent: 10 December 2024 16:06
> ...
> > Since Arm is the last architecture remaining that uses this, and almost
> > no 32-bit machines support more than 4GB of RAM, the cost of continuing
> > to maintain HIGHPTE seems unjustified, so remove it here to allow
> > simplifying the generic page table handling.
>
> 'Picking at nits' 'highmem' support was needed for systems with 4GB of RA=
M
> in order to use more than 3GB or 3.5GB (depending on the bios) because
> of the physical addresses that are reserved for PCI (and other MMIO).

Wow I didn't know that, there are so many reasons why highmem is used
by different architectures.

On ARM it was originally added for a certain Marvell system with
a mere 2GB of RAM:
commit 053a96ca11a9785a7e63fc89eed4514a6446ec58

The reason was that since the virtual address space is just 4GB and
we have reserved virtual kernel memory from (typically) 0xc0000000
only ~1GB can be linearly accessed by the kernel (actually less than
that).

This wasn't a problem since no ARM system was using more than
1GB until Nico ran into it.

So the ARM "high memory" is something to do with virtual memory
size rather than physical memory reservations as in the x86 case.

Yours,
Linus Walleij

