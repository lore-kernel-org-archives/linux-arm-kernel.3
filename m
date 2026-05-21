Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E8CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqCkFknN+N3li35+HvdUGnhYWftGulMOgKVsuhyPHwA=; b=YyDTRgU8XWWuJvEZCOANuOYRur
	majQHHlZK+nZe3RoqJz1AmMtELssl3EVvKoGEcUDmrza5vk/O2nXLIkRbwgDs4qyHZYXhfGmji6Gt
	nj6M1MekV+jiH34Ogk32nckaDiP0yv+zCUKKG3+103Pm0QfGaEzHwSjf+rd4W5quzYU/2yQwzvAUI
	VxaKk8rfLA2geTlt9Yi33EQqMEU4HcsN+yv8JrLgTuDxOmSSR8swA1uSG+kzzti/cM7+JCWKBATrL
	pdEDQGKK7UJYkr1raeIUDC+gIY5eDyDemKos95fBvq2kgBfztI9q5iCLSB/RZCs23II92KEVYwTjc
	BkdSEnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2ZF-00000007jlk-28aW;
	Thu, 21 May 2026 12:32:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2ZC-00000007jlF-2tRx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:31:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E1C774383F;
	Thu, 21 May 2026 12:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E75041F000E9;
	Thu, 21 May 2026 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779366717;
	bh=wqCkFknN+N3li35+HvdUGnhYWftGulMOgKVsuhyPHwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eUoxOvs0JYkXNTlx9svl9KZE1lEq/WML4RGD2qzPLI55urA8oxqlh1yrDfHUX+M/9
	 1DzAZ0/Lg3KXIZi4nqcczqJT7tSiyO6fCmA/GUDWynw1R3UEFoiiynIsF3fsogSAlP
	 2paYLDriI6tlqMA76IVTJ8Wg2LfkU7xHhaZ8iha9ky5Acbl8d5oh1oPoS8z4UUIUfF
	 6uMiQnOxrdNKBxK9i08OqGW56EUEbqlaS9m461X8zXrUg90OmJOf6+rUK7krhgPqn5
	 KIi9H1mC6V3N9r3x7PzeusHSpB5FX3Ch+i2wSIbr69rL11JzqgO1YzigLx6cSKhrTs
	 ngwkUlZI0A3+Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
In-Reply-To: <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com> <87ecj5w2qf.ffs@tglx>
 <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
Date: Thu, 21 May 2026 14:31:54 +0200
Message-ID: <87zf1tueo5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_053158_749825_E38C8107 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, May 21 2026 at 13:26, Marek Szyprowski wrote:
> On 21.05.2026 11:06, Thomas Gleixner wrote:
>> What is this lock actually protecting?
>>
>> Each combiner has it's own @base address, so there is no concurrency
>> problem between two cascade interrupts being handled at the same time.
>>
>> That means the only possible problem would be that the same cascade
>> interrupt is handled on two CPUs concurrently. Is that even possible?
> Frankly speaking I did this conversion mechanically, late in the evening =
to fix
> the bug warning I've spotted. Indeed this spinlock looks like a copy&past=
e or
> development leftover. The only side-effect of it I see is a=C2=A0memory b=
arrier,
> which might affect how the register access happens, but this should not a=
ffect
> cascade operation imho. Do You want me to send a patch removing it comple=
tely?

I've applied the fixup for now. But, yes please send a removal against

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent

Thanks,

        tglx


