Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166C6D11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi8uih8ofLo5efaX/ubMnimRmRfmY8bXqmgKuWa3CVc=; b=OxNFOzO4zf3A3W1x1ucZtt/8sX
	PulNXBx3uOJHn0xxCVnoQajeR2PGYhY6kQr0CdcJplXCDm3emf4GFwovyCXIH7MIiQvBQxvZ2stfU
	8JeVpHvkWw8qi5q3gII87iK3SplziV1v+P+4/GLomBcQsGsA1RNMmTzq2lA6xQ5Rlps2wwy0HUxtN
	Oxod6UfxWA+VNw6wUeA0EHyiFMqUmmKp/liCDqyj8/TLz224pJcWefidiKQ8K4nh8WDLv26wlvAtd
	LNAgU/+fcDSy4CuCx99HazJwp3Ftl0tpclXrFZ8C9w16qRTHBJi78gwFsm4mkgup0lUYiIjZlkjxV
	JXdo4GLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLgp-0000000FaOd-1IaK;
	Wed, 26 Nov 2025 20:00:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLgn-0000000FaOE-2SFX;
	Wed, 26 Nov 2025 20:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B17E160139;
	Wed, 26 Nov 2025 20:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B21C4CEF7;
	Wed, 26 Nov 2025 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187232;
	bh=R2AGU5XnORZusZ1iGFwJY7bQHmgaVS26nysHAWjHEZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OiC5469NkF4URpfQxVhISBbvN9Wlj4COaxPmDOmpqX9Je9mrZq0t8wEeFdRxkE5AC
	 ADwdtpeKcrjTBxUE0NeUXamP5TMq7NMXzJP07tTUsEWZrOcYT4kNlC6sZ2a1DrCf6o
	 5X+R6ScykcAahBHN7Q/dMZ5KZ/GluORcTWH11Gv+hzY+H7XpduiuILm+vWWF6JDwh3
	 lrMA6Hnx+2B+Gs0eBRGMsqfkr4F95LIXIUYmrMuedGvuLzWH/dm/es9ZGIGidP348z
	 i4r2C4ECAh0UdAH0YHsOYDY7Bk6Z/Pitnm8ybxXCObnxSt9pICI8/i+v9vWwwoXgYP
	 ep0ohDllFnRHg==
Date: Wed, 26 Nov 2025 13:00:28 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
    paul.walmsley@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, hchauhan@ventanamicro.com, 
    apatel@ventanamicro.com, luxu.kernel@bytedance.com, atishp@atishpatra.org, 
    bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
    =?GB2312?B?1cXVucX0?= <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <4b22e7c4-4d3d-43b9-bc27-ffd7a86ad26a@rivosinc.com>
Message-ID: <39079362-64ce-e951-6906-0302b1e9e55d@kernel.org>
References: <20251105082639.342973-1-cleger@rivosinc.com> <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org> <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org> <4b22e7c4-4d3d-43b9-bc27-ffd7a86ad26a@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1617688475-1764187232=:894490"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1617688475-1764187232=:894490
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Clément,

On Wed, 26 Nov 2025, Clément Léger wrote:

> On 11/19/25 16:52, Paul Walmsley wrote:
> > 
> > To add more context:
> > 
> > On Wed, 19 Nov 2025, patchwork-bot+linux-riscv@kernel.org wrote:
> > 
> >> This series was applied to riscv/linux.git (for-next)
> >> by Paul Walmsley <pjw@kernel.org>:
> >>
> >> On Wed,  5 Nov 2025 08:26:32 +0000 you wrote:
> >>> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> >>> to inject software events from an SBI implementation to supervisor
> >>> software such that it preempts all other supervisor level traps and
> >>> interrupts. This extension is introduced by the SBI v3.0 specification[1].
> >>>
> >>> Various events are defined and can be send asynchronously to supervisor
> >>> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> >>> as platform specific events. Events can be either local (per-hart) or
> >>> global. Events can be nested on top of each other based on priority and
> >>> can interrupt the kernel at any time.
> >>>
> >>> [...]
> >>
> >> Here is the summary with links:
> >>   - [v8,1/5] riscv: add SBI SSE extension definitions
> >>     https://git.kernel.org/riscv/c/7bba38249b8a
> >>   - [v8,2/5] riscv: add support for SBI Supervisor Software Events extension
> >>     https://git.kernel.org/riscv/c/b52179e6de7d
> >>   - [v8,3/5] drivers: firmware: add riscv SSE support
> >>     https://git.kernel.org/riscv/c/5ffe60d26107
> >>   - [v8,4/5] perf: RISC-V: add support for SSE event
> >>     https://git.kernel.org/riscv/c/c6f3f04d2a9c
> >>   - [v8,5/5] selftests/riscv: add SSE test module
> >>     https://git.kernel.org/riscv/c/a123316660af
> > 
> > This is a pretty sophisticated series.  I was hoping to get more test 
> > reports on it and reviews (as Clément requested as well). In the meantime 
> > I've pulled them into for-next in the hopes that it might increase the 
> > number of potential testers.  Am still very much interested in any test 
> > reports or additional reviews; if they come in this week, I'll consider 
> > rebuilding for-next to add them.
> 
> Since we gathered additional bug/starvation reports with SSE from
> Zhanpeng, it would be preferable to remove this series from your branch
> if still possible. I'm not currently really available (just had a
> newborn) so I won't be able to fix this quickly.

No problem, we'll drop it.


Congratulations on the new addition to your family,

- Paul
--8323329-1617688475-1764187232=:894490--

