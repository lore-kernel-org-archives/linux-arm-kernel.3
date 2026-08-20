Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B3CC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLz4f+Hk4HfGPbGDqQZgNNxr9lDGlubcQpeUIHcO3cE=; b=EKTNwf4NvcgaqAiL/zm16I2hVP
	qWzg+FWm5F6AuSV0qKEkQ7fc4xgcJJIRyLmcWfWM3MeKS0QpY6q9iykdRm2Y5tHT/ZHtZ7fT56TIE
	4HFvCZOnZL0TTI/WPhwTvuhcdKD0ZwnBk2kjz+Rh4T10ebXisjrVOomr/LY3Pzdr3w0eIabGiEIc9
	4a8yseRyDYtx8T0DMx+e6ZIpKt4hjXi5l6/KjIbsAGIZ+FTZdzMG3IpUOtE6+sEZsn04HueTJJ8aW
	6yqokAFuSm9LkTHgktlgk7ho8a7J6VfUFZMeRhHUzbX+/uxfPqN0vBs2hhe3LQTe5T0n/w0y5N13i
	NkD7JHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5q1-0000000BuEC-2EHe;
	Thu, 20 Aug 2026 16:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5pz-0000000BuDw-3NXO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:41:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E76B060A58;
	Thu, 20 Aug 2026 16:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0442E1F00A3A;
	Thu, 20 Aug 2026 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787244114;
	bh=aLz4f+Hk4HfGPbGDqQZgNNxr9lDGlubcQpeUIHcO3cE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LyhAdJ6Ys70M2HKfEMjqm64T25fAtue1GHRERfuNMdYzuhjrdYY/eFT/y0zTI72eE
	 3Q6p/c+EYTZ0wPIVU1UrJ2TMDQ9Dsm3TlEo4wC+0xC96XtpTGJeXfphSQozBHOKBc2
	 3UN+4Swd2+cOD9FRquj8T8sCQw61YTOkSxwBsNd8KUM61f3LuwrgW0z2/tf02/JcsO
	 P6VGKZUDMLPp5kfSJM1Pzlu7QHj84qQVWvIjV76ibVmnVBcDbcMux0ikoFmSOKXYrL
	 i/6dhudroJ2cQuKolSHxOAE4/+NbwnfeXb3PFs0IzjXngENyrIljQjmUUHE1Irmsq8
	 7KzekzcAXraag==
Date: Thu, 20 Aug 2026 09:41:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton
 <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, Jan
 Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] genirq: Honor existing IRQ affinities when
 setting affinity hints
Message-ID: <20260820094153.420202f6@kernel.org>
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-2-3f79a99cadaf@siemens.com>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
	<20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-2-3f79a99cadaf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 19 Aug 2026 16:30:31 +0200 Florian Bezdeka wrote:
> Some device drivers implement an IRQ balancing / spreading mechanism
> based on cpumask_local_spread() and irq_set_affinity_hint() (deprecated)
> or irq_set_affinity_and_hint().

Not an expert on IRQs, but this may make the API even more confusing.
irq_set_affinity_and_hint() not setting the affinity seems odd.

I'd go the other way and either have irq_update_affinity_hint() apply
the affinity if it's safe to do so, or create a new function for
"defaults".

Really, the drivers are dumb here, they are just trying to pass to 
the core a hint which is: This is Nth of X IRQs, please spread them on
the NUMA node where the device is attached. Ideally this (Nth of X)
should even be part of request_irq() args. IRQ core already knows the
device/NUMA node. Drivers juggling multiple flavors of uAPI-shaped API
is... not very scalable. People rarely get this right.

