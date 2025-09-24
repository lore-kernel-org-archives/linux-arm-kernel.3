Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274D0CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev7vkWWpgToc+FdEfELBXoQMv9UDNDNXzmnZ7+y7N2U=; b=KAGtLvjPgTIRiYans/z3J5un1H
	nHHHBEmKefGvis6O16SudggzXqoZVJ/9nyTYtA41fscH6dh+hMDP1bNdjwNsPnbZ5OG21m2+ocQA0
	U38b10kgyPxMNzTw/010i4KIfx3dnhdPm55Sf8onnTQ3vbrXaL3vIqfX43279xxwxQqb20GuHJ/kV
	Pn0XEz6oI0XUjhTsap9PlZSSJNclWW4hIBCt9Gc+JZqVyGa/U30Cd3NQa7SRgKdyT4vYX6yzCF8oT
	vC/zf6eigaSBiZwcFjTBHeFDZlbmeQGfTqaXaweFqK3C1n44hJ6lvKyzQ72XVByiwwc/MCThvBmHU
	bviiTMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4N-00000001aBA-27NH;
	Wed, 24 Sep 2025 16:10:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4G-00000001a7u-1z74
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2C116020E;
	Wed, 24 Sep 2025 16:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB13C4CEF4;
	Wed, 24 Sep 2025 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758730207;
	bh=m73kcVysURDl6GXQPRTNE13OfbCK3ha4T2Z9R0aQT0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgH4HDO5JWOt+xsLlEt99a/nF2CGleqbKiPNKAgj447l00w3BeLL7y+DhRVxyZHVz
	 VUSHt8he7/R9+ksWXMVa3RBwTLLc2vY7Xa7bc648y7WlCT7rKmMgRxHI15EzZuRZmx
	 4NY6LuJ8VTBpTBEy8yNCeIoB8KEkV9iL3EPFDtL4qqZrhFsJRBw12fRuIAitOHfbOk
	 87zYFVuoR3Dzb2RHaXkNdSVAZzlf0Q65BfECk4+CR3Ifo8aUvhL4WCMQ1jiCHUH4b8
	 8LM2RIkdXZdWUMeAC0yjV38+e9AICAlKRaqmCXkmBgwJtcOlO+cvGa+AIe5c/3uQ9+
	 fKImi/JcxUMDA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] arm64: cpufeature: Remove duplicate asm/mmu.h header
Date: Wed, 24 Sep 2025 17:09:57 +0100
Message-Id: <175872868780.2472667.3542607606720611909.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250923035023.3166679-1-jiapeng.chong@linux.alibaba.com>
References: <20250923035023.3166679-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 23 Sep 2025 11:50:23 +0800, Jiapeng Chong wrote:
> ./arch/arm64/kernel/cpufeature.c: asm/mmu.h is included more than once.
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: cpufeature: Remove duplicate asm/mmu.h header
      https://git.kernel.org/arm64/c/ea0b39168d3a

Note that I dropped the Closes: tag because the bugzilla link was giving
me a 500 internal server error.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

