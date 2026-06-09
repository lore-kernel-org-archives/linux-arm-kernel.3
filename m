Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486F6CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/QDHCd1pzNPKIKT6XsNCXh/My/ujozGgvsOiDCA3LA=; b=moaNOM4qg9+4io9x6Q2vO/mPIb
	5LyKGm/QAumOyRfv+hd4RgaTDqyuwMYuZzjiETZBETxK05uc9GWTxDEbqnZZryTwv1lYNASf1Xsho
	1FFRtKep8M/oTEBiP37Z8WW/LdtQdKPHfyEKrMiyv27PwhyABMovotIx0E3cT9qGPJ24vKaaqGaXv
	kX79yypFiX1feKUsC2Xm2dC1zPjpubsYUWrVqLnphwdtM5hfJHnW6HtKULQD37k7r7JDijgsMZRsP
	mZpCCOOT/4qIxPrS5EHVGQSfN3JPL8YsX+9x/4d00XUPjSnLPk4/62TuDfYbTtohW2I4RC4RsTwxB
	JpDG/o9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtBD-00000005H2u-3mTd;
	Tue, 09 Jun 2026 09:55:32 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtB9-00000005H1t-25Eu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:55:29 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c534af2470so3506045137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998925; x=1781603725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/QDHCd1pzNPKIKT6XsNCXh/My/ujozGgvsOiDCA3LA=;
        b=KkLwM4akFnosKk6FqI5aauLPnsBdiC7n6rHwF/N9Am/KdMjEPlA5bMtWa0WTc8jA3N
         MmhyQtK5VotDrAchbPKbuYWWBh004oAikIYh7HvATvryMLUoDGjzjVDAP5tLYgJCSJzP
         4tksi9mRewtwp4XKFQTJsCO74uBZlYuxw0Z1IP0TWGf5ciRgcbgST4tzq/iWjgWbvc4k
         RLyaR3kFNK2BOYVMe/pbo1SjRdXZ3mOz1oQzc56f8G+VW8kQbmgHaGpDGz/WcXMBvVus
         qhpUoXyo03l1tJg6OZs7jASGR232ekUecXqE9ikzAC3EEM8jkWmI+iGTECS1mvPtiYGV
         W1IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XHN8JnJ9ei/IchXTcolVj2Q/FQNIYPtnDn6/zTgNa29+TAgxz+0KzRBf8OLbSgb/f5QJFyG3UPU3v+teNv828@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe6KNq7QcgiLBgzkKsBnezgLyOPKt7SsTnFTwxSJwqjqgDJIHa
	lcYExHCOXgBT2jdw7BdIkgCLhT3xNcr8blqn92NZVOCwmYdOT4sUoJvFs+44bEPF
X-Gm-Gg: Acq92OFVaKjASUdLh09o3w5O9hx9sLynWBWk8NLO8A+tUhjHCzqElSM1SkODLC/vrPn
	OymMixTAqF6XRQFKW/aY2017rw2rkqFEBgSZPHTLvfqAAm/lSv4EtMdUnryIKJjJN3hOWRTkbeZ
	WDV7o1h34dvZMfdqr+iMYA4GeauWJdiEoF6MCAQXPdnoZU/dVNNcHjedaVJ3HTDoKdYQ2F1zvnr
	U2qKPBr6+ZBXFNQ9dFIgfbHwNn12YdilhTxw5a5xa1dawN7R357SH5KRQUQwgHklderhEU9ar6W
	x/mLq2MIpDhNmVB/wuTj5fpJBfE3OEMhRHUzLeBzttkMmqnYe3kjDti/+o02Cnt3dRZ5xJN13K5
	EfUp+VoI2wQVFtpOFOKKs4ZimmwjCmuZ+NiHwi2nsv9UWIx9OxWqb0XDrQ+/Vjg8kFEoZuuuZyF
	OlP/nh6/zQiPHmEzvxRmBQ0kmiN3N5ghCKUs5XakkIUA8MtAFGwibYvBjE3Aa9yLkYc2+yVf7+N
	Gc=
X-Received: by 2002:a05:6102:2906:b0:6c4:5bdb:5e34 with SMTP id ada2fe7eead31-6feddea2406mr9723962137.0.1780998925476;
        Tue, 09 Jun 2026 02:55:25 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f91f2esm15319490241.4.2026.06.09.02.55.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:55:25 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59bbe027424so4344857e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80ZszTbLVdPIH37+j8qZpQBdCOF4cx2Fb01yTBirprEthsQlJcvcheQv6PMvhrWz4HLbXsjfagAKJTyOlC+GBd@lists.infradead.org
X-Received: by 2002:a05:6102:149a:b0:636:984a:1e5d with SMTP id
 ada2fe7eead31-6fef05f052fmr11135049137.11.1780998924802; Tue, 09 Jun 2026
 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-32-ardb+git@google.com> <CGME20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0@eucas1p1.samsung.com>
 <a1b27e97-182c-485d-a448-56c19c5de2c2@samsung.com> <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
In-Reply-To: <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 11:55:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-rH7s6GD4FtiKP9++3c2ojwZKm=YGLM_S_+nkj+EBtw@mail.gmail.com>
X-Gm-Features: AVVi8CfDur0wzec2mY_1awm30cbHrLvunVYojJnvz6Cb53IUltKkdZGFSORVN6A
Message-ID: <CAMuHMdV-rH7s6GD4FtiKP9++3c2ojwZKm=YGLM_S_+nkj+EBtw@mail.gmail.com>
Subject: Re: [PATCH v7 15/15] arm64: mm: Unmap kernel data/bss entirely from
 the linear map
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_025527_547930_E911FF37 
X-CRM114-Status: GOOD (  29.58  )
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

On Tue, 9 Jun 2026 at 08:28, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 09.06.2026 08:22, Marek Szyprowski wrote:
> > On 29.05.2026 17:02, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> The linear aliases of the kernel text and rodata are also mapped
> >> read-only in the linear map. Given that the contents of these regions
> >> are mostly identical to the version in the loadable image, mapping them
> >> read-only and leaving their contents visible is a reasonable hardening
> >> measure.
> >>
> >> Data and bss, however, are now also mapped read-only but the contents of
> >> these regions are more likely to contain data that we'd rather not leak.
> >> So let's unmap these entirely in the linear map when the kernel is
> >> running normally.
> >>
> >> When going into hibernation or waking up from it, these regions need to
> >> be mapped, so map the region initially, and toggle the valid bit so
> >> map/unmap the region as needed.
> >>
> >> Doing so is required because pages covering the kernel image are marked
> >> as PageReserved, and therefore disregarded for snapshotting by the
> >> hibernate logic unless they are mapped.
> >>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > This commit landed in yesterday's linux-next as commit 63e0b6a5b693
> > ("arm64: mm: Unmap kernel data/bss entirely from the linear map").
> > In my tests I found that it breaks booting of RaspberryPi3 and
> > RaspberryPi4 boards with the following kernel panic:

Seeing the same panic on R-Car H3 ES2.0 (Cortex A57/A53), but not
on R-Car V4M (Cortex A76).

> One more comment - reverting 63e0b6a5b693 and 53205d56212c (dependent
> change) on top of next-20260608 fixes this issue.

Confirmed, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

