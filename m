Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1C9CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWzAyf83sJMqlpcdExg7TKJ622UXmHtaI+HggcOSlVw=; b=VbVOodfQ83p2z+BMebsMiHluyx
	XXGAVLJt2HKXfrjhXjZbEaCnFr/40q6S9Wbh8gk5HD0rMrMXXp3R5CKS2aM6tJRB88LMhdz6KQH/a
	zwchNIYUyGVcMg53WnWV8dfrLcyzb/fgkkl20ZvAxyivOtD4uy99wD3AqBPWPPB1zt9lzHbSopfj6
	LjcMMx1RjGwp+OZChzAChdevINa8U3yVW/6/f0JU5HOdqOr8EX+l5rkD4pKcrzyX3iPKshTc6tgyo
	5DIwNf7KkEgsRaV2GGQ/dWQbmdJgoawVbMGpCgktqwdZSuBttzoK+uMZaIe1+PRq1r8RDJnlDx4CL
	aiKbisww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEptw-00000004b02-2WIa;
	Thu, 08 Oct 2026 15:19:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEptv-00000004azw-2llF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 15:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CFC141A6E;
	Thu,  8 Oct 2026 15:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630CB1F000FF;
	Thu,  8 Oct 2026 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472758;
	bh=FWzAyf83sJMqlpcdExg7TKJ622UXmHtaI+HggcOSlVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaSSgG/e1OFEOZeoSjyLzNDhrgxw/efV48ECagVYuF+B+AwcGwD/iOuhbngCe8xKs
	 RbCzaFH3yZc1hT6N9KR9NOkQiGJR1VOfRLsGic46eV6Q5OPgrw0ZdqqBwXZHFX1SAU
	 5pL8i42Dv/GJ1sRFL4tHw50cXg3tLdwm+XwQVmUs8ITyUg0AI2UGOA++UEv0u0yQxG
	 oGaIpg4cn+xAnLJnB6llSH+YRYICMZMdB7L+/Wsw7vP76zgC8MgnolanOyEjhM18nV
	 flGH8PsR3kZYSYbLJhfq1BK8SIsDpcPpz4K+H3/S1zUx7enXkG00FEDnEHM0r7A9Ap
	 JZ5oqB8EPzbiQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: irq: exclude the softirq stack switch from KCOV
Date: Thu,  8 Oct 2026 16:19:10 +0100
Message-ID: <179136595191.1063015.6426776896396499376.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926191325.79047-1-kmehltretter@gmail.com>
References: <20260926191325.79047-1-kmehltretter@gmail.com>
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

On Sat, 26 Sep 2026 21:13:25 +0200, Karl Mehltretter wrote:
> On IRQ exit, __irq_exit_rcu() drops HARDIRQ_OFFSET before calling
> invoke_softirq(). The arm64 do_softirq_own_stack() wrapper and its
> ____do_softirq() trampoline run before __do_softirq() establishes
> softirq context, so KCOV records their PCs in the interrupted task's
> coverage buffer. They also run outside softirq accounting when
> local_bh_enable() reaches do_softirq().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: irq: exclude the softirq stack switch from KCOV
      https://git.kernel.org/arm64/c/a9cd14bfb0c1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

