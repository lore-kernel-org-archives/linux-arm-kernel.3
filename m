Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE1ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRYI6CCQKlmB/yAhO+GuKjuxUNc5kLEJ8j3t4D2xfo0=; b=e1sYycrAp4Gm3Jl5qmBTCbdP1n
	QPPUZ0rKneGVslcNwWN3p8x5xAYNBPbNYTzE1dPFwMD1HYKjYGHpCgPipbcDtDEzWFsI4WgK0hA5v
	RPmrZqnuYSR6QP1h/zHHMiKOaDTaLpd27CIxOcP7YYm9zcsxF/KxmZLoNdSdSQEFceD19dkQSgpSN
	jwiKBtNfGRDKtKVVOvkU/E9WaqfR0mLgpiYwaekXCHyTm3tErvJ+zlX18Px3Kq+Z1w7R+U1GAzCAB
	qPWMs7nTkR1i9eQ9qbaV53lf94UwegL/LWcIgDe503MNd44AnsjnPsmEA7Sf7CDnQPqkuRzXIFbl/
	By1FQEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYj5X-0000000Cucn-0WPw;
	Sun, 14 Jun 2026 11:33:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYj5V-0000000Cucc-3p3X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 11:33:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 110BB6008A;
	Sun, 14 Jun 2026 11:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63681F000E9;
	Sun, 14 Jun 2026 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781436792;
	bh=JRYI6CCQKlmB/yAhO+GuKjuxUNc5kLEJ8j3t4D2xfo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIeE6VKNzQmhInQeQVXkWGEJUZZJeXp70i4Ig+p+iZ0C5ReLJ841XOzCR/aD1iNJc
	 MZVs1zsfyNFHPrvfAMc0Gm/M+InAJKLF9zhxpRcTI9IpjD9FEnVAndQkgb/w6Mm+Bo
	 UenSQLw9Ax+aOIcVpFgY+rdT+Uet5bb84KT8y2Qh61R1uoZVI8EgR3JFtJ9W6WhSUw
	 Yv0NtoZRwFhFKMgMtZEM1oVEY5p78DGDtuLZZEzdnS9XLyo8UbBTnrny6iMzAYFWrp
	 OlBSETd1Gactgs65bbZ0pFA+QT8AOuWUzxep/8Kb7WQlr97yPa3w1/UFvuOx4bgyPA
	 HSw9Aqvx3AGTg==
Date: Sun, 14 Jun 2026 12:33:07 +0100
From: Will Deacon <will@kernel.org>
To: Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ai6Rc6cCYlPMjuyg@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai6KzFgfMAxqplcr@willie-the-truck>
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

On Sun, Jun 14, 2026 at 12:04:44PM +0100, Will Deacon wrote:
> Can you simplify the 'if' condition here?
> 
> 	if (active == ACTIVE_CPU_NONE) {
> 		if (!try_cmpxchg_relaxed(...))
> 			WRITE_ONCE(...);
> 
> 		dsb(ishst);
> 	}
> 
> (as an aside, maybe we should implement arch_try_cmpxchg{,_relaxed} so
>  we could drop the READ_ONCE() here as well?)

Mulling this over a little more, we probably can't drop the READ_ONCE()
even if we optimised our try_cmpxchg() implementation, as it would
prevent us from eliding the DSB on the fast path.

The rest of my comments (including the refactoring above) stand, however.

Will

