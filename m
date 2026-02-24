Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26748F55433
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qexNreA3noaNpoPwWdD70RuBwyt5EeVZfegYyF8m7cc=; b=iqYWnLeg8FdiN6LWfQyst8uG2G
	YwtoNW5c9NST22waGsAGyJltASdeq/H07E/Q5FCj44eBEKbPsAwIM0GUIiM+l3zUHrmVgoTauIf21
	GIgWhIN1uYh+1KPDYICchEeSH/OmlfWNCaGCEbQ2SdC0ep4BkY0QZ+WJ2i+nwhFRr6SvP4V9nS6DS
	rrBPzzAA7yKFOp3nHv2TpAbRg02/GoqnlRW6azGMNB0V7VQtJV4w5Y440qwFEVT/6of258diCgd85
	GaMhDxProjlRRrCGKOSEN9P6DhwK82/hiGTVpjtbwYPuq0NnlX7N0jsmK1c6T2lqjC8yY/ZS+Whv2
	caKUiQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2Ee-00000002x8y-2NGX;
	Tue, 24 Feb 2026 23:54:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2Ec-00000002x8d-2eue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 23:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2D5B4016E;
	Tue, 24 Feb 2026 23:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04A3C116D0;
	Tue, 24 Feb 2026 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771977273;
	bh=qexNreA3noaNpoPwWdD70RuBwyt5EeVZfegYyF8m7cc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oYEB647EzJmppp/2RB2bNjz4U0zSLzPjLUfECABrKnqfFxl+OI7hqQFEcBtVo9iGy
	 Idk9r8iZ+MvGV0MybLailS6CIxs+/gpyO0kpcx3H10OyQLE+xCA8YRRMCBXQaShI3D
	 l1cTz7x1yqwpoiFcS0MOLS1s56hTRM5u5hUYf4wxv733xFiJJayQ9Rt72FeuUxpaD8
	 EvAO92aDeQmyq/dRGZfDsT0CCqH/nYSmuwGj8ZcR8eG1uP235JgGTURChoN+K52SxF
	 ATa7KpKdkHeN4IVT23VYAh9l1qkyeqQjwrwkeDEhFUuDtraPFBwIuZ/ye62yniLf3v
	 /dPrkRzEjGJhw==
Date: Tue, 24 Feb 2026 15:54:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
 <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
 <vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
 <vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
 <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>
Subject: Re: [PATCH net 1/3] net: ethernet: ti: am65-cpsw-nuss: set
 irq_disabled after disabling RX IRQ
Message-ID: <20260224155432.15ded392@kernel.org>
In-Reply-To: <c9b1c5c2c5f9587c31132586fddb1921ff6824a8.camel@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
	<20260220041431.372610-2-s-vadapalli@ti.com>
	<20260223184803.739c17a7@kernel.org>
	<c9b1c5c2c5f9587c31132586fddb1921ff6824a8.camel@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_155434_697871_B2BEBD17 
X-CRM114-Status: GOOD (  10.14  )
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

On Tue, 24 Feb 2026 10:40:05 +0530 Siddharth Vadapalli wrote:
> CPU1 sees irq_disabled being 'true' and before it updates it to 'false', if
> CPU2 also sees irq_disabled
> being 'true', both CPU1 and CPU2 will enter the IF-condition and eventually
> invoke enable_irq().

I think the races are just between NAPI and the HARD IRQ context.
There can only be one NAPI scheduled for a queue, I assume.

> Please let me know if this is what you were referring to. I will use atomic
> APIs at all places to update
> 'irq_disabled'.

I recommend a spin lock, unless you can measure as significant
difference. Locks and atomics have similar cost on many CPUs.
And juggling local state, IRQ state, and NAPI state atomically
will get tricky.

