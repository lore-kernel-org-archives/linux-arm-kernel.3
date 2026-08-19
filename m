Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA67C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T8WkfQM1tDVw2lkM35NPqGVyDI8QletmxFw9B3FKiUQ=; b=eqVKW19Git1v1T
	FsvakzOyKIr2AD7G9FUoJ8aLztyIWyziitlncXxiCO0HJS5Nfw1GTW2YMzBahwZMvJ1Y5uTiZDam5
	wDdMrThD3V6HZtAl+Gyag/UNHkCXD8cBGwKqoivPXik+DsckgZRlgqLfYnLs/9H8jrMWTiTun8U4j
	7aPVGSXSsqEhrY13vPBsc83qr61A2ERGTTBc6f6pYEzSKvIVvmLwNb5tFO/Fvv1KqQijVhridyiiE
	e6qGhmVL3YLQP3Q0EULYT4fOvoA/dvnTWKpLZkllGwJL1F/SmpkeyznMV8SSTZecBwGHYq8M7fqHt
	SAxTqrI1PmrZNQNjt0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJW-00000009z1b-0QbR;
	Wed, 19 Aug 2026 14:30:46 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJP-00000009yyg-2XkN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:30:42 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260819143033a90639af4400020767
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 19 Aug 2026 16:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=T8WkfQM1tDVw2lkM35NPqGVyDI8QletmxFw9B3FKiUQ=;
 b=gWgRMMy+C5iSzZsNMMtXSW4NJ+nq3LO8TPIBRLAx/JbrEhLC0J3Nnm7XBArhljqyzSW+u3
 Tu9KMbU2xB6trqXGd+9EFFVta9Uj7P5Ks0Y1011Y9Z5iGtfG6yAIeX56ROZPZfGwdwIceV7R
 6csKI6RJc+CAKjtzXn8HnaZh5OlLFF2adcNhETAnG8e7VrRkRXxril5+F1qFVneaFu1bsDh7
 knd19UbEnWRgzDHznVkTXUC7Cvdc9TVSKS1GN7BdFkLcBtELOWONJGHGiM82HNVFxOSXeRYA
 7vPAM7Fu/PlbH8yyx8NgP/kIeIPSXoeXJRRzAqWJ2A6SPpaCHkTCBBEQ==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH RFC 0/3] genirq: Allow drivers to respect userspace IRQ
 affinities
Date: Wed, 19 Aug 2026 16:30:29 +0200
Message-Id: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAW+hWoC/x3NTQrCMBBA4auUWTuQhKjVreAB3IqLoZnRwSaVJ
 P5ReneDy2/z3gyFs3KBfTdD5pcWnVKDXXUw3ChdGTU0gzNuY3prUMYJE1fcosNId8ZSY6QBAws
 9x4okoknrF+lNmZGsX5PfeRt6gRZ9ZBb9/IdnOB0PcFmWH8+Pv22FAAAA
X-Change-ID: 20260810-flo-net-7-2-make-stmmac-default-affinity-aware-a145a4941d8f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_073040_206630_9C9AE683 
X-CRM114-Status: GOOD (  18.38  )
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

Hi all,

I'm trying to demonstrate a real problem for PREEMPT_RT here, using the
stmmac driver as example. There are more drivers "affected" but let's
ignore that for one moment. Let's discuss the underlying problem first.

To achieve the best throughput most network devices are based on
multiple queues. Each queue (pair) is equipped with one device IRQ. To
reach the maximum throughput, spreading / balancing them between all the
available CPUs makes sense.

While some IRQ chips - and with that some architectures - implement the
necessary spreading (or balancing) at IRQ chip level others don't do that.
If a device driver wants to make sure that balancing happens as intended
it has to implement that on his own (again).

The typical shortcoming of those implementations: They do not honor RT
relevant settings like the smp_default_affinity or isolated CPU cores.
Device IRQs are balanced over "all" or "all online CPUs".

That's not a problem for "normal" systems, but for RT systems - or
systems running cpu-isolating workloads - it is.

IRQ affinities can be controlled via /proc/irq/<n>/smp_affinity{_list}
for existing IRQs and via /proc/irq/default_smp_affinity for "new" or 
"not yet registered" IRQs. Those settings - as written by user space - 
must be honored. Always.

In our case the settings were bypassed by the following sequence:

    - system boot (all CPUs available, no isolation yet)
    - deployment of the first RT application
        - writing a new default smp affinity (remove RT isolated cores)
        - migrating away all that were targeting the now isolated cores
        - creating a cgroup with RT cores as the only usable cores
    - RT application running fine for some time
    - stmmac network interface went up for the first time
        - driver balances IRQs over all CPUs, ignoring the existing
	  affinities
    - Too much IRQ traffic on RT cores

Even with series applied there is (at least) one problem remaining:

The /proc/irq/<n> interface is populated on the first request_irq() call. 
That means that we can not control affinities from userspace until the 
IRQ gets requested.

The problem for network interfaces: We have to bring up the interfaces
once, to be able to control such affinities.

That raises the question why request_irq() is called on "link up" time,
while the low level vector allocation takes place during device probing.
At least that seems to be the common pattern. Can someone tell me why
this is done this way? Shouldn't we call request_irq() at the same time?

So, let's hope that all of this was short enough that somebody reads it
and precise enough to make the problem clear. The idea behind this series
is not fixing or applying the series as is. I'm expecting a discussion
first. So, input welcome!

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
Florian Bezdeka (3):
      cpumask: Honor irq_default_affinity in cpumask_local_spread()
      genirq: Honor existing IRQ affinities when setting affinity hints
      net: stmmac: Migrate IRQ balancing to cpumask_local_spread()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++++++----
 kernel/irq/manage.c                               | 10 ++++++++++
 lib/cpumask.c                                     | 10 ++++++----
 3 files changed, 33 insertions(+), 8 deletions(-)
---
base-commit: aa2e13ae8d3cbe2c15ef4f7e971b2de0832794aa
change-id: 20260810-flo-net-7-2-make-stmmac-default-affinity-aware-a145a4941d8f

Best regards,
-- 
Florian Bezdeka <florian.bezdeka@siemens.com>


