Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9CBCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=; b=sqQ4owZ3p/az4nZoL6sm7jVtL/
	RAVKBWc5Hj/KE1FYZ1AYxCC7MY2j+piBz2hjku1pVuHyHcvlMPylzC0PjCX1p12YcPK0Y55BmjVE1
	LsZVbWQBrE45lPysIQ6K2v2kCKpOHJAOZsyTnQppqOZF93FzvLfFsxu7aDG8VX4QjwbSbKwP3jjoH
	74HEP8YjQSO5sG5jlMnqw+y3voEVelt0BIqutwfr8bfGcMmMnLSn8pf7ckwJBq2wanSJu19GwCT0Z
	4dwfdhCttICMqkArb44UpLBitAsFcYGtsWx8nc36jFksGh/hA+0kTES/N5/1ugKgFD6bQa4lYjySG
	4GmE+SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNoY-0000000BZYd-24Xa;
	Mon, 12 Oct 2026 21:44:10 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNoV-0000000BZXl-0kOg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:44:08 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-7c19c6721a3so1526377137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841446; cv=none;
        d=google.com; s=arc-20260327;
        b=Cg5AtY62HLO+hg8hgIc9qwkA3LhnZnYRg3vQdsxSN/wOKjJf+OVjP1qTA30a7rdC5M
         8r0dZfni6zfaOb+KbK1u5tkDcQxCNFJy/q10AqgOhaKMqH8ZUcPQZga1FAnOA1S19fBx
         sFrhCZoMkMdi5Ojmrji3bCnPpwaDBLArGixsW7DOXgxYnSsflRgiuRicXvpEM+nSxtD/
         fXVeY3gTzuDACrom/7buVY6el1aVnO0amKgoc7k0y2MZQYAYiOkBJf2I6MQvJP1qZshK
         WlKPgF7tabVZVhumU4CB4tccQmbPyh1+8e2BqYsMR7F9106yYHlfPT/q2kJqTSGf2IZi
         ReOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        fh=hW+FffRsyw4sQd/lHVy6tPUwZc1EsO0oQsnkyxE0VAE=;
        b=GJ0oycyXGq8zt5T8Z8KIP+MwxtBe0tgRLU22xk7UA16sqiyCBDSHpMut7MmIdgLHQZ
         SPKoyYTkgbtR7k1VTMLS7pf+jpXMclAGljI/aWwj7GfrPUW2uAN5lJok2TS507/XLCfk
         XiR1CyteahqOb1MjD6dX4E5g1paX6WFmzhBc2gvH5yCb5/6sYQ7PT2slb7c0r86hh/sx
         zEMJrpL6XbKn81eHiZsgMIqxyh93M5PS3TkizaBB/Iy1I2BakXQOxnRPXNNgQjW41M73
         /tIwr9PsmLucn3GZdWa4ss87av8YPz8qpZJkVRlwoJ+hnRg8U4D17U4PM2OeXO6D9sUR
         zyGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841446; x=1792446246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=A56WKw+xK2LnMkcL7VfBfKHtnm39Y/UlvZuOCOaGU91nObMDEG1WemgpsSVf0Irzdz
         QYMdFAHp58nOfpd7K13b63lapXER3rIdRxEeGJaHhnnmL5/sT8RdOOpU5astochVhkRC
         7MGbsmj5XM0gQEe3vZoLxoaOMhvht8KdCQsIvgLSA6wqs1lCrPDOV1Z0XcfQSzUu/2dL
         kTGQ/qDmJ4gjmE6HOx5L0m+8DVg7SF7ex00c3Yn8Gu2REnBTBTnz7eSWN4vlvDrB7cXQ
         KCyGksE48Sa0cFYbTxCkXNtsrwFh2MknRoCSMvhe8Qn2meNGl8mWc8CzHYbazy52mhz+
         m5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841446; x=1792446246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=2sRrj+SsZdmQcVR7re1FTwMn5qyzCvWiq2lpdt6H0Ja/xs89cQ2pB1tO+CoqmZpRiE
         6eypHTuLzg9twWoVD+sr4npMbV4dImWzlnSPI05T2u4pOfsesGdNp1O0mXXZFvk5wkfy
         SnjYvTEjlul35xXfVB35DxXTGSRDuk2EM/X586NbuXue7RUwB0AyFbuyCfgxj6gMrpjK
         iFMYUauoQTMbVgxep4MbqED6V4UDMvHh8+VD9/+iTMDcNVCXpdOVpManlteTq8aPxLI7
         gk7S2XScp2v4wRLLU0T46eCNm9QHOsFKUFr4TAn65G+sTVy36BiCUp1xMwD3aCXBHM46
         +Cmg==
X-Forwarded-Encrypted: i=1; AKwUvBxH1IdW9Pn/ehTT518we6vFTvDf5dmqSl268RcZ5Y56qDnI012RmLFnoa09CRkjddGYguUyILJT83nz5+tL9S5p@lists.infradead.org
X-Gm-Message-State: AFq9FYLB859SyKe4rDQ2SOGyI+CgdZvdnbM00l3ovwA4v6Bx+STvqmIW
	yWdjLSTZYrrUy+JJsk2DZBIDMeuwQicyGpxMcu0yld2y8HQMMYEuMKYfDeFRwelLJq3Aa5l1WK+
	N2T04vvnF8p4F6MI8rzKSfn32CH1+xpI=
X-Gm-Gg: AYBFou2dsjpiJR+4ZREtfPCYUtjC62eLAnKyaSAJt9retRlkaRP8tkaaAy91uByHXZz
	J/OvxG59ODS+28Z3raYKwqCt5sIMBtO+Wr8NJND3sH+eq9JXO9vtRtKnTV3PWyLXYqDQJRAN/l1
	oXbSwC3Kry0rzv6BCEDRlioNZLui4xWPBIhzC2+fy7TBv+ZTxOMMtAcuij8JIBQlxMvcqg+VueF
	Sh+pQVVUEPjHSf5tE38AUrjvtpU+tGHf4mBo7OM3KXzpgz/gDQl/xBPncyluUFroegmoZZGGADg
	Z22SpsaqHaZjJ9/OqhqZj3zniyAlbPBmV/xZO3Hp6FVWNLriPGyhFmD8d66vq5tCEW+3kf7s0yo
	3YMYG1FkhrVgO09Hjwj0IdDrRSKYtVYgdSnKHviuUmaXJvlWBtYAf3LVGuGkJj+ja7SDjgIJgkj
	kVjcsLWGZ03yd9ozCiuVsYTyJLIMDPMRxgPxK2E4a4VcgwD8dwJK3HTsM=
X-Received: by 2002:a05:6102:5814:b0:79e:2b00:b4da with SMTP id
 ada2fe7eead31-7cb3a0059admr2967326137.6.1791841445569; Mon, 12 Oct 2026
 14:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com> <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
 <87pkxey725.fsf@bootlin.com>
In-Reply-To: <87pkxey725.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 15:43:54 -0600
X-Gm-Features: AclHuK9S8X-EJbG6Jz0l1nDWbI3paRApUkydjtgW5vHKMROEOTWMTqhZBvuvO68
Message-ID: <CADvTj4p-o=EQMq-6E1q2=NOmQbscAVGMUbwX+Wh4R0v5kbXe_w@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_144407_243051_24D991DB 
X-CRM114-Status: GOOD (  31.48  )
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

On Mon, Oct 12, 2026 at 2:53=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> commit log, I now disagree with the first part of:
> >> >>
> >> >> >The old handler can also complete the new wait or restore an obsol=
ete interrupt mask.
> >> >>
> >> >> "complete the new wait"? I don't see how a stale handler completes =
the
> >> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> >> register is cleared on timeout.
> >> >
> >> > The case I had in mind is an already-running handler on another CPU:
> >> >
> >> > CPU 0: Read st and ien for operation A.
> >> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >> >        then eventually reinitialize the completion for operation B.
> >> > CPU 0: Call complete() based on the saved st and ien from operation =
A.
> >>
> >> For this to fire, the hard IRQ handler on CPU0 would have to be stoppe=
d
> >> between reading st/ien and calling complete() long enough to span:
> >> - A's timeout
> >> - A's cleanup
> >> - B's wait being rearmed
> >> On this hardware, how is this reachable?
> >
> > CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests th=
is
> > IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
> > forced-threaded. A higher-priority task can preempt that IRQ thread
> > after it reads st/ien:
>
> That argument only appears in this reply. It is not in the commit log
> nor in the diff, both of which reason about a hard IRQ, no? I'll happily
> take the PREEMPT_RT case into account: in that configuration the case is
> reachable, but it reads as a justification added after the fact.

Yes, PREEMPT_RT was a later concrete explanation of how the race
could occur. I should have made that distinction explicit.

The original rationale for disable_irq() was to establish a clear
boundary between the old handler and timeout cleanup.

Simply masking the controller interrupts does not stop an already
running handler. A partial-event handler can subsequently restore
an obsolete remaining-event mask. A handler whose saved status
satisfies the wait can instead signal the completion after the
waiter has moved on.

disable_irq() prevents further IRQ dispatch and waits for existing
handling to finish. Cleanup can then mask and acknowledge the controller
events without the old handler modifying that state afterwards. The
register readback flushes those writes before re-enabling the IRQ.

This also keeps the additional synchronization on the timeout path,
without introducing a driver lock into every successful interrupt and
wait setup. The checks at the time established that the caller could
sleep, the handler did not require the NAND controller mutex held by
the caller, and the IRQ was not registered as shared.

Sashiko's report[0] was the starting point and mentioned both
synchronize_irq() and disable_irq(). The ordering above was the
reasoning for the implementation, rather than the suggestion alone.
It was not based on an RT priority-inheritance analysis or a measured
performance comparison with a spinlock.

[0] https://lore.kernel.org/all/20260909085434.C8F201F00A3A@smtp.kernel.org=
/

> Then, I'm curious to know how the AI justifies the use of disable_irq()
> as the RT-appropriate choice: doesn't it block without a timeout on the
> very IRQ thread the scenario relies on being starved (and gives no
> priority inheritance)?

Yes, it waits without a timeout and does not provide priority
inheritance. I would not present it as the better choice for bounded
RT recovery latency.

A spinlock_t-based implementation can provide priority inheritance on
RT, provided the handler holds it from the status/enable reads through
the register updates and complete(), with corresponding protection in
the waiter. That improves recovery under priority inversion, but adds
locking to normal interrupt handling and wait setup/cleanup.

There is a real limitation: if the IRQ thread remains starved, recovery
cannot finish, and other NAND operations can remain blocked behind the
controller lock. So the operation timeout does not bound the entire
cleanup. The argument for this implementation is the straightforward
handler-lifetime boundary and absence of additional normal-path
locking, not that error-path latency can never matter.

>
> Thanks,
> Miqu=C3=A8l

