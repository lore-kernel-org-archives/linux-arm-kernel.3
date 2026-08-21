Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB36C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Busq7bBd83wJI8JtXzPnJLO7cdNRm+myeGSGFtSRJng=; b=i02t16sqwFQobrKcFLc8D4bPDO
	tLfxOauoS+0yzBmuqfQW/A8Tj80ZJbVhlgUb2dvwRut30UTZBOhrY002568OPKjlC0mm+wi6Kmkcc
	Q/LKLMkDnryHcxygDvqExkF2i0g82ucNjIWDwJFtv4jxgQ7x8YoH16gwo1Zi3stYTLl8eHsW45nmd
	1JB9YVQnncypwrsJK+WDDoZbudOF1J2gYV9EjV3Al4dtSAFEv+sA+2pHpgQ0aRvtM9MJte8Z9xFkp
	hBKRQsjZkmRBoaDuTe0C+VcxeYP7jFqIvGpa/rtH/6YvkFz4xVq9nHhMqWEz6KK+phBsPg/j+U0rU
	yAqAFanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxT50-0000000Dua6-2ESM;
	Fri, 21 Aug 2026 17:30:58 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxT4y-0000000DuZk-00KP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 17:30:57 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608211730517c36e025d1000207e1
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 21 Aug 2026 19:30:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Busq7bBd83wJI8JtXzPnJLO7cdNRm+myeGSGFtSRJng=;
 b=PzM66+4OwB265jh6TgPYagsGzvQfPSfsDnBTN6kZ/k22GR0GNOM2Pp2i8P6nHviC9p7N0H
 M08MkMhK1U2pLnaV+WRAMbEQHI140i9NbytDRugVeMd03b6rCogUGXh0u6JOi77b/Q4upOms
 Md78DIwWIQERBcSQpHTGjDiG0Rfd8KSrUbwzii31PgHglklSa8nEwk42E1Ei5nqg3jkwf6c/
 E16hYqHAYWwTKQXBxzswEbSPuKEg9MRkZlWVijfRlZ5fnTRSxToJ5ObFrsKB7lSjjaQqUeXv
 vWgMxYeL0hFxjHKw6ZUNLvkFA3FOCNNOl3grNMX2F6xcXTpbhyw3JNgA==;
Message-ID: <6e82ad58a9d7148a3ed614037edd5150f84c0533.camel@siemens.com>
Subject: Re: [PATCH RFC 2/3] genirq: Honor existing IRQ affinities when
 setting affinity hints
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jan Kiszka
	 <jan.kiszka@siemens.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier	
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Yury Norov	 <yury.norov@gmail.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton
 <akpm@linux-foundation.org>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt	 <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Date: Fri, 21 Aug 2026 19:30:50 +0200
In-Reply-To: <20260821105310.ZRK2TO93@linutronix.de>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
	 <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-2-3f79a99cadaf@siemens.com>
	 <20260820094153.420202f6@kernel.org>
	 <11c2d3c4-ea05-46a2-8579-c5aba1bfa204@siemens.com>
	 <20260821105310.ZRK2TO93@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_103056_182637_10CF73FF 
X-CRM114-Status: GOOD (  20.50  )
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

[ Might be a resend, got some HTML warnings for unknown reasons...]

On Fri, 2026-08-21 at 12:53 +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-21 12:38:52 [+0200], Jan Kiszka wrote:
> > Fully agree: drivers should not set affinities. They should just expres=
s
> > desires or additional constraints. The ultimately resulting affinity fo=
r
> > an IRQ should be the result of the various constraints that kernel and
> > userland may express via NUMA placements, isolcpus, some dynamic
> > isolation/grouping constraints, or you-name-it.
>=20
> You might want to look at irq_create_affinity_masks()/
> group_cpus_evenly() which attempts to spread irqs evenly across CPUs/
> NUMA nodes. This is used by storage is considered a bit by the
> isolcpus=3Dmanaged_irq option.

I'm aware of those functions but faced the following shortcomings
regarding timing:

1) irq_create_affinity_masks() is called on probe() time, which normally
is "boot time". Userspace is not up and running yet, so the
default_smp_affinity was not properly set up.

2) You can not overwrite the affinities set on probe() time until
request_irq() populates the affinities to /proc - and with that the
interface itself - at open()/"interface up for the first time" time.

If the default_smp_affinity changes until your interface comes up for
the first time, it might violate the current settings already. No chance
for a user to correct the current (device) settings.

>=20
> > I think we need a big picture how things should eventually look like an=
d
> > then develop a strategy how to step-wise convert existing code.
> >=20
> >=20

I just received the confirmation email that my abstract, which I
submitted to the Linux Plumbers Conference (Scheduler and Real-Time
micro-conference), has been accepted. There will be a session called
"PREEMPT_RT: How a simple interface up event might break your realtime".

Seems we have the chance to discuss this topic in person.

Florian

