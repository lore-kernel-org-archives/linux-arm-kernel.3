Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A94C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNc95hCETK4CO1l/jXeVB1uxPt8EvO+gdfuwmtQcpo4=; b=t7ru6/WqF/VDoTzw2aZ6tkEWr5
	9cW0iqWNj5ORu/oZ4VWiZdU/vjtH8Sb6nwMrY69IwEU+ZZBP90/3R2t0r6HPdnRP28eEis7lA3K57
	XRoLBBX5r3YfDGypg2GqEVS3yPmj4WUcg/nLHy9DG4esYgnj9atPzaXhclD0Atmn49F/piM9ld4l1
	If16T7wf8WHxFDxok1fDukY6ORiQmn/lL3C2/yaSwbTJsMGAMQo7TI87dCoxxbJOljhm6OSDHYqjS
	/r984Y8731I0baIjX0KdNKe+W6ZDDrQC+HisxnOZ1ERZVRavnP6+RK9i+7nLLN7efe1g9nHh45HrR
	xEcWABAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5L1-0000000BrZa-1zOA;
	Thu, 20 Aug 2026 16:09:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Ky-0000000BrYh-3TRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:09:54 +0000
Date: Thu, 20 Aug 2026 18:09:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787242189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNc95hCETK4CO1l/jXeVB1uxPt8EvO+gdfuwmtQcpo4=;
	b=2F0JLV9j+HGy00kK79fVfiCqoBAsyUzEEyHd3YsfJINiGfA/SUr3zJQ6P7spxpXAOmBSZy
	4X07nXe4Oeh2P0pOsNEwh9THqBYaTbbNOqIiVs2BK/CaF61gOB3XeGhx9igTFP264BylYz
	GrOuyXSYuolOV0ZHjds4/v95mXrdbs85LffijwDvTjVQGnyGii7uZoLnraXX73vOUNLWjR
	Sz3jkfWIGycPDbi9552i07r0MEPdWtcuY3B+H/A3Y2S5cMjX1K9rZBQo2zXb4D/zRVzAkx
	9QWLr/LHqkfpsq6ks+gcBdGdOCfeBZYg7trdp7tcG+C4TM4Tg/JfKB/QnaS79g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787242189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNc95hCETK4CO1l/jXeVB1uxPt8EvO+gdfuwmtQcpo4=;
	b=G2SFSveA3vHYyq3ELy6PjB9JFohOWIrbAVZ2upl8tWLLL39V1/V84+/ODLc1BIcuWr/KCF
	ovlSFT7RLDRJkbBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yury Norov <ynorov@nvidia.com>
Cc: Florian Bezdeka <florian.bezdeka@siemens.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] cpumask: Honor irq_default_affinity in
 cpumask_local_spread()
Message-ID: <20260820160947.GZ5F-O0o@linutronix.de>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
 <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-1-3f79a99cadaf@siemens.com>
 <aoX4HuUxL4tNWvpq@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoX4HuUxL4tNWvpq@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_090953_008576_E0FF5A50 
X-CRM114-Status: GOOD (  12.55  )
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

On 2026-08-19 14:38:22 [-0400], Yury Norov wrote:
> > --- a/lib/cpumask.c
> > +++ b/lib/cpumask.c
> > @@ -81,8 +82,9 @@ void __init free_bootmem_cpumask_var(cpumask_var_t mask)
> >   * @i: index number
> >   * @node: local numa_node
> >   *
> > - * Return: online CPU according to a numa aware policy; local cpus are returned
> > - * first, followed by non-local ones, then it wraps around.
> > + * Return: online CPU according to the default IRQ affinity and a numa aware
> > + * policy; local cpus are returned first, followed by non-local ones, then it
> > + * wraps around.
> >   *
> >   * For those who wants to enumerate all CPUs based on their NUMA distances,
> >   * i.e. call this function in a loop, like:
> > @@ -110,9 +112,9 @@ unsigned int cpumask_local_spread(unsigned int i, int node)
> 
> Please don't touch this function. There's ~40 users, and we don't want
> to inspect every caller for their intention.

While this might be okay for the NICs, the usage of PMUs shouldn't be
changed. So yes, Yury's suggestion to create your own function and then
move the drivers one by one makes sense.
You might also want to verify that your setup/ design works on some
"newer" multi queue NICs even after the number of queues is reconfigured
at runtime.

There is also netif_set_affinity_auto().

Sebastian

