Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C29AE77186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4ptZloOfFwNLV1nxYbKIFIsGukxF2nm3f5nBiNdcUE=; b=W/Vjm6HT01y1NqzHK+T+vMhM22
	8r/hZrhoCv+xR8QcKGIuIpReAk42poRceiI3TzTu7PsInDHIJPhuSki2zu/WskXthAT4TiiLcMfwx
	Be6FgWcCaLQvdiTw0zrmyLnn6jgaRNcCotyHHquo1CcTe8sM94JBDWhkAXnO7UcAyhKKfEGQB4BKA
	rST4A11dcOiKF5zLcaDQ5/rOdoyBn7V3LhUwR3z9hr6AzoeYYwlCV5nj4FoK7IUurcuCLkhyQhqBJ
	ktO2Ia+BGmIfzEDSkLPcQ2FeOZatwnVQRGt8jY0h7UQA/KDPdX2gw/pxKTCNpuWwacNU91AQ+6SbR
	B99Nj0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOT-0000000GWXG-36xr;
	Wed, 11 Dec 2024 23:45:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFv-0000000GKVG-09Z2;
	Wed, 11 Dec 2024 22:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C2945C678F;
	Wed, 11 Dec 2024 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABF1C4CED2;
	Wed, 11 Dec 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956350;
	bh=Lj6m1KGdu6A9P37ePkeHmGhpEOYrC07Re+9IHx97taY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q+h6JdhYbgWkkJZKxxBpvzzMrsNxkGoEdza4YFJyky6PGRqvTppB4WWSHpF2XbZEp
	 3RmwDTIJ+IWZiPF6URzM7AFAUrovMRw7D8NbXB+92TG9vVWaXrcU/MsgUuSOZ3vPex
	 o0MaFjihetIadNNvJTpEn+nlZctZbXnS0fVYRMWoku2hOngBPg/UbRT+WKkxpgNf2d
	 SwvyT1mNlDgHbiMNbtlfPoLzmzqTgNvTIuq+Jo3m/NabxJ757iMFljbIUWU4KxUn8N
	 5ID5hDIVQ1/ODfWBnJSI9qXoWm4SM9dKAfh3gfNA/Y4dMt1mVhzEjFLVbDxspwHNRS
	 2u3nMpWh8Eo9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C81380A965;
	Wed, 11 Dec 2024 22:32:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395636600.1729195.17930169527159894833.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:46 +0000
References: <20241103080552.4787-1-00107082@163.com>
In-Reply-To: <20241103080552.4787-1-00107082@163.com>
To: David Wang <00107082@163.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de,
 richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 paul.walmsley@sifive.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143231_114866_8ADBB58E 
X-CRM114-Status: UNSURE (   6.53  )
X-CRM114-Notice: Please train this message.
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
by Michael Ellerman <mpe@ellerman.id.au>:

On Sun,  3 Nov 2024 16:05:52 +0800 you wrote:
> seq_printf is costy, when stress reading /proc/interrupts, profiling indicates
> seq_printf takes about ~47% of show_interrupts samples:
> 
>     show_interrupts(94.495% 5166019/5466991)
> 	seq_printf(47.429% 2450210/5166019)
> 	    vsnprintf(89.232% 2186366/2450210)
> 		format_decode(24.005% 524831/2186366)
> 		number(19.488% 426084/2186366)
> 		memcpy_orig(3.739% 81753/2186366)
> 		...
> 	_raw_spin_unlock_irqrestore(26.643% 1376379/5166019)
> 	mtree_load(8.059% 416304/5166019)
> 
> [...]

Here is the summary with links:
  - kernel/irq/proc: performance: replace seq_printf with seq_put_decimal_ull_width
    https://git.kernel.org/riscv/c/5b881c1f8379

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



