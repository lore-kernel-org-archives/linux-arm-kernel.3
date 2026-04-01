Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2A0107637E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIwkuLiJTh+pp8wK5KW2JfDaTVf1TkmPvAzw2AK7DuA=; b=f7gt/jQ5xyyMQgWEr22Y/gvlcr
	RNSXWhuTiy8J/ginb4fceqhFgADvFITXiPRWgFuulHKum10M+pQk9FtYrhgKBSYCDsFT6D3Z1cQ3R
	JKtqLPJYWu3VTj+IELMdsIQ+0MGiMUGYuorjy+6hyAO+0oMswLfv9LA2xROaAl+H74Fd5Bvlu0H0q
	bRla2JdnIXKTewcnxyp+e2xPIYli2WZtLn0Jg6rC4OJd3IOAQb8Mn9jBJjJ95VDnekvm0NgDYRcMB
	nS4V9z3fi2A37mzYfyiMF8MU5vaaIpHoEbB8It6f0V7FGMJy1bG0nyP3QfcCYDQS/UEDqrCQeSInB
	QRq4h5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wKw-0000000FSie-1AY8;
	Wed, 01 Apr 2026 14:14:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wKs-0000000FSiF-3mxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:14:24 +0000
Date: Wed, 1 Apr 2026 16:14:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775052859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sIwkuLiJTh+pp8wK5KW2JfDaTVf1TkmPvAzw2AK7DuA=;
	b=BFYbdsIV7JKFtMJDsvAe5MwTK33wkr9TQovFoK+nJmVBpBywy5VAywv//KWkmCe+Nwp9HU
	/ZrGv3CChp6qNd+wmWYcvNf6A4zcv2BO0D45332zZSPshpoFkCoT+aOrgHl4DyumbbBIyQ
	2Knb+oLQJpqaXhqoxtxOHx6Dk5OpcozB/sNCDBpjJta8RA45pkPTR0qJS0/hVHadU54xva
	fKflKqLo+5jp/Cekx0Mv15WskkQky6UNl8sVbSWw4HaTbd0PtBM3Ntrygen43T6pGAzRI/
	K3ZJq6orSIgVAuFnCiE+QItq491LYf3Wi3F130YD/YhLfWp2dhOqJpgkHrRlMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775052859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sIwkuLiJTh+pp8wK5KW2JfDaTVf1TkmPvAzw2AK7DuA=;
	b=6kJ1ZgFk1QoWp7KCcvZ69B0cUHYCaCYbDkB/NJfxNVQcYeCJBTy3uhBypeEC+zNLcJLcHp
	eQ2XzX9wUPsyqeBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Kelley <mhklinux@outlook.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Question: interrupt randomness and handle_percpu_devid_irq()
Message-ID: <20260401141417.6uJk69i9@linutronix.de>
References: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87bjgik042.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bjgik042.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_071423_084280_F87DFCB6 
X-CRM114-Status: GOOD (  21.22  )
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

On 2026-03-20 16:10:37 [+0100], Thomas Gleixner wrote:
> On Thu, Mar 19 2026 at 19:34, Michael Kelley wrote:
> > The function header comment for handle_percpu_devid_irq() says that it is the
> > same as handle_percpu_irq(), but with the addition of a pointer to a percpu
> > variable with the real device id. That makes sense. But there's another difference:
> > handle_percpu_irq() calls add_interrupt_randomness() [via handle_irq_event_percpu()],
> > while handle_percpu_devid_irq() does not.
> >
> > Question: Is there a reason for this difference in handling interrupt randomness?
> > Or is it just an oversight? handle_percpu_devid_irq() is used, for example, for the
> > SGIs and PPIs on the GICv3 chip, so I wondered if IPIs (as built on SGIs) & PPIs
> > specifically did not want the overhead of add_interrupt_randomness(). But then
> > GICv5 is doing IPIs using LPIs, which use handle_percpu_irq() and hence *do*
> > add interrupt randomness. That seemed inconsistent, which didn't help provide
> > an answer.
> >
> > The question arises in the context of Linux guests running on Hyper-V. Hyper-V
> > VMBus interrupts to the guest are per-CPU interrupts in Linux, using a PPI on
> > arm64. So these interrupts do not call add_interrupt_randomness(), which is a
> > problem because these guests don't have much other way to get entropy. To
> > fix this, the VMBus ISR has always had an explicit call to
> > add_interrupt_randomness(). But maybe that's not the best approach, and
> > handle_percpu_devid_irq() should be fixed to call add_interrupt_randomness().
> 
> I don't think there is a real good reason unless any of those interrupts
> is NMI like.

So we could wire up the generic/ arch code here and feed the
"randomness" from there and it from the driver bits.

> Thanks,
> 
>         tglx

Sebastian

