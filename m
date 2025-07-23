Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDB1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 01:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YD+vr7yy0nmfwboNiePS1qnuISLBaI+pGYwIDG4Iops=; b=13LdGHug/a1/95VRnXUrETt6Kc
	YNSVT6+U3QfF/1Z+DBtgxLMEwMSOfxqEtg1UHTqlQAUVkOUHITlRwXc+4xI1CDY4RImkf0Jr+cwvl
	YN1CTVOdXzaauSZlqQfbQC4CSZ7gPLcyIFKH7FElHOflnVLPnOBeNzPu8h+MMfTf2heIQJTTqslGw
	+pwvjmnIa1XZ/1jcJP66Qj+0bD32SmjjbPbWqIgCNsS8KF1LVmyyqVAPH6lXfCo8thHDmg+F6iebp
	VH0zcMe+81gjDEya1t7AZI50aII22jPuzQoFTGEwhm8xfEFAvQ9u502TmYQpTVIfaxs/OyR3ibKQo
	2WgF3mWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOD0-00000003m9I-0Xst;
	Wed, 23 Jul 2025 01:23:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOAT-00000003m3i-3DQF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 01:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 044A7A56523
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7CC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753233672;
	bh=YD+vr7yy0nmfwboNiePS1qnuISLBaI+pGYwIDG4Iops=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qUkeCDBP7ytlUUpQy0TNHttB2Csp9By5STiizexOeBUoAHQbw7lGSmhIniHngxRXM
	 rkvvc1PCV691ACM7w9qz4MaoN2nbINr9JrtDMNUlP/z1flgFljsYvQFlXLyWm1xVxK
	 QwjTbCM+bxeeGwxihqj/lcHzwpNvLDpWR36utf5MxwUrthgBmVmcYh4wPkMiDbZqRF
	 2jRUEjTj8yaaYdxWQn4PM8i/tux5r/7t9pAxLOJpudXW19kSEo1RUSIdCyXLKzddzt
	 K6p7QWmdrEuAYyGdgmMhi5ehZ2xTm43azXvFpJFbrqQjDObjODbc3jDI+Zbkr6z6Js
	 8fP0VF79zwzTA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso4483651fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 18:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQvcQ4HCAg9NHGGMT0ifG6Yc0Evn9itZMLI8Jcmp9XRLqmkxQ3RUxbQ9og2heFZ6PjSLSBLA7FA4Fnx7ilRJRf@lists.infradead.org
X-Gm-Message-State: AOJu0YxXr/Q1MDtFBADVUdWqOD1jaAYylqX7FcrYRMyFjnA4fYvCPTAx
	0FQwDs2nLv/vdWZTOsWKYJkLaeYYL86Q6OImzLols9JlcFgonJYu9wg9stVTIh6VxzIP6j45Zl6
	z9Y9s1XkiiQ/qMQqdFA8O3CZizNVqfRY=
X-Google-Smtp-Source: AGHT+IGCiXEAKf0AmaEeEIfoISjwt7nevoqdchWJZqO7CIWK6oo90fAQ5keAWS/fn58h6WCHUVU7pRPWq047ovii5xM=
X-Received: by 2002:a05:6512:3ca7:b0:553:510d:f471 with SMTP id
 2adb3069b0e04-55a48f1e9d9mr1671355e87.24.1753233671081; Tue, 22 Jul 2025
 18:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
 <82AA504A-E3D8-479E-A625-306004E1850F@amazon.com> <aH-sSqC177IM-nbi@willie-the-truck>
In-Reply-To: <aH-sSqC177IM-nbi@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 23 Jul 2025 11:20:59 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGv8cV=kfDBw=29NUX6rYtSUPJJ9HUXVNK+7R8aB5b0wg@mail.gmail.com>
X-Gm-Features: Ac12FXytYbIVHqTIgCrSakuGQHyz6JWt80y56F5YFSiktTvEhpQ2vmsm47bBKDI
Message-ID: <CAMj1kXGv8cV=kfDBw=29NUX6rYtSUPJJ9HUXVNK+7R8aB5b0wg@mail.gmail.com>
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
To: Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_182113_936846_3D31A3EE 
X-CRM114-Status: GOOD (  27.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, "Prundeanu, Cristian" <cpru@amazon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

(cc Sami again)

On Wed, 23 Jul 2025 at 01:20, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jul 21, 2025 at 09:42:23PM +0000, Prundeanu, Cristian wrote:
> > On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
> >
> > > Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
> > > Do the same in `call_on_irq_stack()`, but restore and mask around
> > > the branch.
> > > Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
> > > of behaviour between all configurations.
> > >
> > > Introduce and use an assembly macro for saving and masking DAIF,
> > > as the existing one saves but only masks IF.
> > >
> > > Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Reported-by: Cristian Prundeanu <cpru@amazon.com>
> > > Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
> >
> > Confirming this fixes the spontaneous reboot previously observed when
> > enabling both pseudo-NMI (irqchip.gicv3_pseudo_nmi=1) and shadow call
> > stack (CONFIG_SHADOW_CALL_STACK=y). Tested both on kernel 6.16-rc7 and
> > legacy kernel 6.8 where the issue was initially observed.
> >
> > Tested-by: Cristian Prundeanu <cpru@amazon.com>
>
> Ah, I hadn't appreciated from the cover letter that this was fixing a
> real issue seen in the field. It all sounded a bit theoretical (but more
> likely with pNMI).
>
> I'll pick it up as a fix so we can land it in v6.16.
>
> Ard -- maybe we can rework this in future along the lines that you
> suggest but, from what Mark was saying offline, there may be problems
> beyond the SCS that need addressing too if we decide to leave IRQs
> enabled.
>

That is fine with me - the change looks alright, it's just that the
wall of text implicates the shadow call stack (and the commit in
question) in particular, even though (per Mark), the actual issues
being addressed here are more intricate and not limited to the shadow
call stack at all. E.g., the fact that call_on_irq_stack() may
re-enter up until the point where SP is assigned could have other
implications, which were present before that particular commit made
things even worse.

But if masking DAIF is needed in any case, it make sense of course to
rely on it to fix those issues too - I just think it might be better
to get rid of scs_save in call_on_irq_stack() anyway.

