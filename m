Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F68C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amp7TonfLQQCmQ63ymRvTi5wVBJ8saros+nDhb1Tf6M=; b=FjD2uZ7iAzh4S74OwedCsSE1hr
	KZm+kDKqg6HYP4sntnW2cRcvCLf7tPurdSTOn7bQ4+WMAU9aAsLw305IVrfQ3VUWr6b569zhs3l4R
	vIDCX+kodnALDfX+jkLtvtg6vTEX/01MQ6JGMgcchgksnZtKRgVyvKOn6X9qE+VwwfvHIy/qqGKtu
	QcBkFKTYS38fcTdERuxVoSMeFisE4R4tlooyf3ghfuRnF1znKzvmaUAhfLQBwOX1U2KMAjD1sPlb6
	Y3rzkTQjFiTjNd+3jK+Ar+BMfs+5FTPUHC8agAnnMK91BrFbwexGncoHOpu7zsLYWz9leya0qyXCO
	KUDGQ4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSot-0000000DtEp-2kUM;
	Fri, 21 Aug 2026 17:14:19 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSoq-0000000DtDk-3DT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 17:14:18 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260821171412bc75df658800020779
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 21 Aug 2026 19:14:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Amp7TonfLQQCmQ63ymRvTi5wVBJ8saros+nDhb1Tf6M=;
 b=isrGfETZuR5SaCfX4BVh97wtJzmgVEzYpQjSgefKxhHm2ej9FvvEQCB+U26g0gSPVVLr8i
 jf/W5DKhgYn9GaMUjGi+287Yd6GX64x3eQcsHhRYWBFL1UOgFSliHEF2RYXm0DR+v1mtteVe
 tfgAHPCMEivxJMS7UxKHmdyZn+DLs2XvzbGnabU8+8iwa9fr11pOEDC9WXNumQFZ2GIWlElA
 SrdOdAxwmir7d1IAKhqr+rD8YaQfdhQ8Ff9kSDqvcZy1qQeT1cbOoaD59exCvHtctIU1c8yK
 wda6R0j6hkiXpdw9ILBPXyVxHMuPjZH3y5M6Oz+3JQZNlllPkYYu71Kw==;
Message-ID: <8e80acdfaeefa59f455f5e894d177a4a6c8bf3ff.camel@siemens.com>
Subject: Re: [PATCH RFC 1/3] cpumask: Honor irq_default_affinity in
 cpumask_local_spread()
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Yury Norov
	 <ynorov@nvidia.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes	 <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner	 <tglx@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 netdev@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Date: Fri, 21 Aug 2026 19:14:11 +0200
In-Reply-To: <20260820160947.GZ5F-O0o@linutronix.de>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
	 <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-1-3f79a99cadaf@siemens.com>
	 <aoX4HuUxL4tNWvpq@yury> <20260820160947.GZ5F-O0o@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_101416_941660_545EC384 
X-CRM114-Status: GOOD (  17.20  )
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

On Thu, 2026-08-20 at 18:09 +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-19 14:38:22 [-0400], Yury Norov wrote:
> > > --- a/lib/cpumask.c
> > > +++ b/lib/cpumask.c
> > > @@ -81,8 +82,9 @@ void __init free_bootmem_cpumask_var(cpumask_var_t =
mask)
> > >   * @i: index number
> > >   * @node: local numa_node
> > >   *
> > > - * Return: online CPU according to a numa aware policy; local cpus a=
re returned
> > > - * first, followed by non-local ones, then it wraps around.
> > > + * Return: online CPU according to the default IRQ affinity and a nu=
ma aware
> > > + * policy; local cpus are returned first, followed by non-local ones=
, then it
> > > + * wraps around.
> > >   *
> > >   * For those who wants to enumerate all CPUs based on their NUMA dis=
tances,
> > >   * i.e. call this function in a loop, like:
> > > @@ -110,9 +112,9 @@ unsigned int cpumask_local_spread(unsigned int i,=
 int node)
> >=20
> > Please don't touch this function. There's ~40 users, and we don't want
> > to inspect every caller for their intention.
>=20
> While this might be okay for the NICs, the usage of PMUs shouldn't be
> changed. So yes, Yury's suggestion to create your own function and then
> move the drivers one by one makes sense.
> You might also want to verify that your setup/ design works on some
> "newer" multi queue NICs even after the number of queues is reconfigured
> at runtime.
>=20
> There is also netif_set_affinity_auto().
>=20

Thanks for this pointer. 4 users and yet another implementation that
ignores the current userspace settings...

I'll put this on my "to be revisited" list. Thanks!

