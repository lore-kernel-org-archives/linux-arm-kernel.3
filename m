Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55663CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vp2m2LiOM0rYmxTb2ybDJvKTJV24hoV3ZdEgjzuUVc=; b=N0Jw54oS/pYLxhY6uoNMU6wIeP
	EoDzXyMMBn9CXyZ09wOt4RRlz0oghUifi5Wdc/KgQc1fr5phungVoohjLnHT/oUKnxqkI03cqfOxY
	qe5GSfK+zIVWUbd3hhaRm20uaU9GrDyZJAjOhyCW5CbO1LEV9RrdlZ2SRmVjk317BFOJpWnIyzOh4
	k16uxC0lYqXGJ5QBMeMJUPuO16s8vpmxA+F4X010Z0aVOxEdmCUbFjCDDVeMMOuB1gR/oRVgk0KiP
	jzM/qv4CSRPS/Pd7uXVdtpc6KkWBehqfnYKnBtkTBDmNkqnWkI+s3hk6yn4RjY4sPqWK9Xo5McAh0
	LN/XYCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkTl-00000003azk-27vJ;
	Wed, 19 Nov 2025 15:52:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkTj-00000003azW-1gOX;
	Wed, 19 Nov 2025 15:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA96B60171;
	Wed, 19 Nov 2025 15:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBBBC4DDF8;
	Wed, 19 Nov 2025 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763567538;
	bh=7FBm2pA3p+MjBgITQg+SdeuwcZfV8pg78x6e3pMzwVs=;
	h=Date:From:List-Id:To:cc:Subject:In-Reply-To:References:From;
	b=azXf6kuph8YIH/6gTeAN8ASFX4cUDu3oezkVwxE30ue29dK3zM9FbIAkdvFOtBm5U
	 xyic6fky5EGretMReyNxfrEaBBUQpLPJuRpqIx2jef8uos/qZSeqDVQ4yeC4HmYd8R
	 U4PbBPpKn1h1cLKnWLNdUzyAlKz9W1fJ3cjwsvilcYxrzBU3KgHc1qtnyYSqB4ubLf
	 B5sxJAF80/ndhREDDdEXP9hEiptZl6gwmHGen6Tk/hlWHYbEv1UwMfzBlG43lL6CEU
	 xYTCxx7aCexdD+/dL82+sGQkB8yiyW2BtaWqggfAgytg+62dr55OOLZyPdAXmedGAc
	 U5miHI48RhQmg==
Date: Wed, 19 Nov 2025 08:52:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
cc: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, hchauhan@ventanamicro.com, 
    apatel@ventanamicro.com, luxu.kernel@bytedance.com, atishp@atishpatra.org, 
    bjorn@rivosinc.com, cuiyunhui@bytedance.com
Subject: Re: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org>
Message-ID: <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org>
References: <20251105082639.342973-1-cleger@rivosinc.com> <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1889358478-1763567537=:1438789"
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

--8323329-1889358478-1763567537=:1438789
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT


To add more context:

On Wed, 19 Nov 2025, patchwork-bot+linux-riscv@kernel.org wrote:

> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:
> 
> On Wed,  5 Nov 2025 08:26:32 +0000 you wrote:
> > The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> > to inject software events from an SBI implementation to supervisor
> > software such that it preempts all other supervisor level traps and
> > interrupts. This extension is introduced by the SBI v3.0 specification[1].
> > 
> > Various events are defined and can be send asynchronously to supervisor
> > software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> > as platform specific events. Events can be either local (per-hart) or
> > global. Events can be nested on top of each other based on priority and
> > can interrupt the kernel at any time.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v8,1/5] riscv: add SBI SSE extension definitions
>     https://git.kernel.org/riscv/c/7bba38249b8a
>   - [v8,2/5] riscv: add support for SBI Supervisor Software Events extension
>     https://git.kernel.org/riscv/c/b52179e6de7d
>   - [v8,3/5] drivers: firmware: add riscv SSE support
>     https://git.kernel.org/riscv/c/5ffe60d26107
>   - [v8,4/5] perf: RISC-V: add support for SSE event
>     https://git.kernel.org/riscv/c/c6f3f04d2a9c
>   - [v8,5/5] selftests/riscv: add SSE test module
>     https://git.kernel.org/riscv/c/a123316660af

This is a pretty sophisticated series.  I was hoping to get more test 
reports on it and reviews (as Clément requested as well). In the meantime 
I've pulled them into for-next in the hopes that it might increase the 
number of potential testers.  Am still very much interested in any test 
reports or additional reviews; if they come in this week, I'll consider 
rebuilding for-next to add them.


- Paul
--8323329-1889358478-1763567537=:1438789--

