Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA7FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCUz4EPmZaE7vP+ZlBjxRLQxrvpznxUDXVXIJb/OFMY=; b=NiQzGGv6iT6EkTV/hv8aohwQ5R
	IAhQFRYb5T+BUmtNpcgG0H6Ph96/cN3iPn66bGUvkgJFJg5jJoLCnKoehq+qRFcFMm92kRaeAgsN6
	Wqat5tgkY+r+hrNHdK6DkPT8Yt8q+c4mp4fP9tUzXKUdZKtpe/eu4OvAkkHFVjYC9+Y6mLP9AwlGw
	tTyE/578OjuyRfk+9KfwurzaWDwpSOkCuxCsz6vNzR8ipHzQZAnTEXNWUUteZEwYJ9QKcb3Asfbui
	aUYTuCWArPOHsLIoMcquVyfTlWnV5jhp+zPbTL1BLkfqo7DmnL9uo17P1Nuhi96kAg1FEoryp0FC0
	akEguZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOd-0000000GWkf-2Sgd;
	Wed, 11 Dec 2024 23:45:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGJ-0000000GKpV-3BVN;
	Wed, 11 Dec 2024 22:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 975595C67E0;
	Wed, 11 Dec 2024 22:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C1BC4CED2;
	Wed, 11 Dec 2024 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956374;
	bh=29u5B09z/mNiOUipvbCAR8d/HfuJKD9vMPDnfCmrneU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dnrDcNkOoxwSBjPjDdUGrvVokaL8PbY/29PjhRdPkvydqw8DxYooD5ABeBk3HzL/N
	 76xby5lMWnFghEv7vC3hF+lPCP97eOVPUwp3+ZSkE4SEdqJhuc4M4tsMuMgquf/1Sh
	 MR1GipeeO24AReN6/ejtJZElR5CRC8RyZljN784IO+9YPc2RBnMzEXA7w+OQ/yoYqa
	 adhGvjnBGfHafNdP3219wtIr4V6sPs3ti0dnt0aZa1Z6WSjl0+E+Zb5OzErlTpRYgu
	 UkzyIpABUuFP1nVewt4cL6HBuOiiJYxbTNdocbttNyq8XlE99Zmw+EmsHH8rPlCKUB
	 H5x4fe1dWfyKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD93380A965;
	Wed, 11 Dec 2024 22:33:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] ftrace: Consolidate ftrace_regs accessor functions for
 archs using pt_regs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395639050.1729195.18342749493985130890.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:10 +0000
References: <20241010202114.2289f6fd@gandalf.local.home>
In-Reply-To: <20241010202114.2289f6fd@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143255_848233_9E8DB788 
X-CRM114-Status: GOOD (  11.87  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Thu, 10 Oct 2024 20:21:14 -0400 you wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Most architectures use pt_regs within ftrace_regs making a lot of the
> accessor functions just calls to the pt_regs internally. Instead of
> duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
> that have their own ftrace_regs that is not based on pt_regs and will
> define all the accessor functions, and for the architectures that just use
> pt_regs, it will leave it undefined, and the default accessor functions
> will be used.
> 
> [...]

Here is the summary with links:
  - [v3] ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs
    https://git.kernel.org/riscv/c/e4cf33ca4812

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



