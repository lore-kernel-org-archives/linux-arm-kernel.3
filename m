Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B33CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPtNeZedyGwfaB+RwiJfgz9uN28W9hWsW96iSIpxzYU=; b=v1FbQw/7kx6+A8hN7Pi16YKWIY
	qD/fWE4y3CserdN7l+JDcm8Ihu4UwsFjk8U2o+JUy8KAdHQWjmtW0tzsleuRht1rYMJFH03REu0/g
	es6vDQ1wMmXpESZuob/sGY3E+WCraNS5ZJmVECehPuO8vAbTY1l7Ge+zhXSZjSiAl8lqFvn9J+6uF
	7FD8G6LwVsGH8L2+e7ijCigLz4fZf1tHGpWoaTnEPpujKsjIQhNYhGxCSyHDYHgVISq1vo7/5jSrR
	tceoPnjR3+wrgQjSHACVWgPo4xwwen2shW6ht62yIei5iDyy8F8x7DHvM3dLPbSIeMgdE4jfuWB6c
	V/J6h7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjtM-000000047YU-0BpY;
	Thu, 11 Sep 2025 16:11:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjtL-000000047YD-0Xaz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AEC5601D7;
	Thu, 11 Sep 2025 16:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E70DC4CEF0;
	Thu, 11 Sep 2025 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757607082;
	bh=5vEajUiE8vOl+c0s0dvzPQu+3RLAa5VvYGmH9nj+aKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuBfToxkwuIfFk9nR7Y5ZKaZTpqeEbvLsL+qmycMw0U/DWbqdVZBI+xfRcTJIXSjv
	 +ideQ2F+dkvBGRcPw0TI7raAqdbPKd3p1xPevy0lLKkhe3cp/CDA5JYm3dlXveJgt5
	 c9HxB+j2wC/hdSdy+H2WS8xkBdq+0tfdl5VRfb2xPplBMrhcsWtsayftcmFSKBpAxv
	 3UcG5VZwZsZAC0o5XyqoBblq8tADG28vOkNDOCtXcSVNULNKRqppuJntr6AzgZZEa8
	 yBbpzDWD5bwn4ULjxesg/J8dOfFSpOyE2jdRpl3CnPuWPP1HdLCvrmMEnWke1BfDdP
	 hPOi2tnQfXZ7Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	oleg@redhat.com,
	sstabellini@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	mbenes@suse.cz,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	chenl311@chinatelecom.cn,
	liaochang1@huawei.com,
	kristina.martsenko@arm.com,
	leitao@debian.org,
	ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
Date: Thu, 11 Sep 2025 17:11:12 +0100
Message-Id: <175760255687.903003.14486495786906094929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
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

On Fri, 15 Aug 2025 11:06:25 +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry which makes
> maintainers' work easier and codes more elegant. So also convert arm64
> to use the generic entry infrastructure from kernel/entry/* by
> switching it to generic IRQ entry first, which will make PREEMPT_DYNAMIC
> and PREEMPT_LAZY use the generic entry common code and remove a lot of
> duplicate code.
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/8] arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
      https://git.kernel.org/arm64/c/788b8f6af60b
[2/8] arm64: entry: Refactor the entry and exit for exceptions from EL1
      https://git.kernel.org/arm64/c/ee776d68ba47
[3/8] arm64: entry: Rework arm64_preempt_schedule_irq()
      https://git.kernel.org/arm64/c/77c195394639
[4/8] arm64: entry: Use preempt_count() and need_resched() helper
      https://git.kernel.org/arm64/c/c74c44c6ae20
[5/8] entry: Add arch_irqentry_exit_need_resched() for arm64
      https://git.kernel.org/arm64/c/3c973c51bfba
[6/8] arm64: entry: Refactor preempt_schedule_irq() check code
      https://git.kernel.org/arm64/c/64f4b8b15f1c
[7/8] arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
      https://git.kernel.org/arm64/c/99eb057ccd67
[8/8] arm64: entry: Switch to generic IRQ entry
      https://git.kernel.org/arm64/c/b3cf07851b6c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

