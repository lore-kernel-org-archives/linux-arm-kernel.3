Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3CD5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq7yUIT2qNvwteaJ4TiyipPQcxNOXMFMXDaSsi1L3IE=; b=BDeEI4s0K+3dD7d5SyvLuJLN/w
	JcvIq6TUZt8AnBtBK4/EP/hu3JmEQSwXoYEbuAUQEANExk777w/whVN9xIukzTbN2zNMRd4s9qDCP
	p2HFZpki1AOEU9KPXDoq6NjkzgYHm6BCf+Zt9+ijr6hAWhSWuwlMj/xQUC+DhOKsEGrKTRyvzMYjd
	a5k7Zh3N1Txjyjt0Oob/moQU3Q9ND+8noBDE9Ed8hnC+Q6IpGJiuW+Th1iY/cvnlV/Q1psjMCS4rZ
	Wc6raxHV588+q++G+G7yqnBswa4krRmj6sbT9FjVHNKUgPxOr98aRbmu5ykMsMPfsuoaEeb+5In0Z
	gt59lugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iBe-0000000DowW-3VnN;
	Tue, 29 Oct 2024 09:06:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hyC-0000000Dlkc-0ayw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB5A9A41E78
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 08:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627ECC4CECD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730191974;
	bh=Eq7yUIT2qNvwteaJ4TiyipPQcxNOXMFMXDaSsi1L3IE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EWAG37Q1/jPMEVARQaHwWgoD4IZPOBXva5IpmdjJzocLbSOznobsK4CEPiF6uCV9c
	 AJmWpDj8tiLB+miJQvdPkhQMsikJ3gbBMBH+wDrTl9zbr4QxPMvqwyt49D5L+0fa3A
	 /b2r669wDDaCKw2h5Eucs06HTrqOZType/asvgQpnKP9y7YV6DbY0Zc7x1CFtf49tf
	 gwJqf4oti+Mi6q8QSxE5/tD5R+0GcubBlwFGY0wIUxpdDultVSVoG+6sOu1Yxm3CgR
	 tuTVHBrAGjHVpWGh7Ip8wrnR9LKFU8BYgU+4GGD/WhgqyQq8TkntmMtdpJxG5kFBxX
	 kolluovqzMpsw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso47786331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:52:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjj2twwLt6s/2yH6oGk1SOVHef0UNE6Pi8GEBprRP/YVw8qARyHWw/pQQ2bIsjS0ADZvD9Hn/3HuhjY09RYL3n@lists.infradead.org
X-Gm-Message-State: AOJu0YxszJQTTltFyRxXXdN3apM+5TpypvERbvEhotREdLLvWqUHehEv
	Su/mLHpn71uU5rYfJQhIuH/tWCRN34h+LcNGh3eNEgTcCBo763xs4qMhYY1Yb134+VWpwuIx7cL
	+vOCSra+hmGvw36AbFa98XOs4NUY=
X-Google-Smtp-Source: AGHT+IGnI8jKViXA0iWd/TroHubPtwx67QuiNJEQlZ5qzLZZW3IKmHAuzNAhClw5ucQvGTKdiESCRt0pHcHTLmrSk9s=
X-Received: by 2002:a05:651c:b20:b0:2fb:51e0:951 with SMTP id
 38308e7fff4ca-2fcbdf6118cmr46645831fa.7.1730191972767; Tue, 29 Oct 2024
 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <mb61p4j4wwlap.fsf@kernel.org> <86ed4031zh.wl-maz@kernel.org>
In-Reply-To: <86ed4031zh.wl-maz@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Oct 2024 09:52:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEX2TLdYCn3C-AXhfhjOe6cuzOmd0h5MbgXnzi7Q94T3w@mail.gmail.com>
Message-ID: <CAMj1kXEX2TLdYCn3C-AXhfhjOe6cuzOmd0h5MbgXnzi7Q94T3w@mail.gmail.com>
Subject: Re: Supporting KVM_GUESTDBG_BLOCKIRQ or something similar on ARM64
To: Marc Zyngier <maz@kernel.org>
Cc: puranjay@kernel.org, Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, 
	puranjay12@gmail.com, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_015256_384385_91482025 
X-CRM114-Status: GOOD (  35.01  )
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

On Mon, 28 Oct 2024 at 12:23, Marc Zyngier <maz@kernel.org> wrote:
>
> [+ArdB, which I assume you really wanted to Cc on this, as well as the
> KVM/arm64 stakeholders]
>
> On Mon, 28 Oct 2024 10:53:34 +0000,
> puranjay@kernel.org wrote:
> >
> > Hi Everyone,
> >
> > I work on the BPF JIT for arm64 and regularly use Qemu with gdb for
> > debugging by single stepping parts of the code. I realized that whenever
> > I enable KVM, single stepping doesn't work as expected and it lands in an
> > interrupt handler.
>
> I disagree. Single-stepping works *exactly* as you should expect, by
> not interfering with the rest of the system.
>
> > It always worked for me on x86 so I looked in the source code and found
> > that x86 supports KVM_GUESTDBG_BLOCKIRQ that blocks IRQs when single
> > stepping.
>
> Right, and that is not an architectural behaviour, but something that
> helps the person running the debugger. I'm not saying it is not
> useful, but that this is an *additional* behaviour that the
> architecture is not supposed to cover.
>
> Also, given that KVM_GUESTDBG_BLOCKIRQ has *zero* documentation,
> nobody felt compelled to implement it. I didn't even know of its
> existence until you mentioned it.
>
> > I assume that arm64 doesn't support KVM_GUESTDBG_BLOCKIRQ because it is
> > not trivial to implement this on arm64 due to some architectural
> > limitations? There was a patch [1] posted in 2022 to solve this issue
> > but it was not merged.
>
> That patch does the wrong thing when it comes to KVM. We are not
> building a Linux-only hypervisor, and we need a solution that works
> irrespective of the guest.
>
> > Let's start a discussion about what needs to be done to support this on
> > arm64.
>
> A good start would be to define the semantics of such a flag:
>
> - what should it affect? the vcpu you are single-stepping? all vcpu?
>
> - should userspace to know that interrupts are pending?
>
> - should this result in any effect on the guest's view of time?
>
> - what of interactions on the rest of the system (such as devices)?
>

Sorry to give a handwavy answer here, but approaching this from a
usability PoV (like what Puranjay is doing), it is really about
adhering to the principle of least surprise for the user.

So in that sense, it is not really about blocking IRQs at all, as long
as we step over them rather than into them. How that is achieved is
not that relevant from the user PoV, and maybe KVM_GUESTDBG_BLOCKIRQ
is not the right solution for ARM at all.

