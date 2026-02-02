Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C3E7DF1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjT2P46cgvM3nyh/kXEjvqkxlTx4XGDlaIbAn45KjYw=; b=LzBvAf6Zx1jvB4qt7SUB9ZQN6D
	3JzIP+ppOBqKfDwYF8zVvnBGqhJAoyC2EUIfQKrm16WKJpZpohiU1ovAfqDyOQ5Lr09jk7GVzbV+G
	tBXtXvbFtnGrJY4P0kgtrNPA1tOqCwEiRR+1pqlRn+dFn9O0xeH5I8QF9UuH48Pd6oHUB8Hy0E2fE
	r9rR5PIXcjp0JFUzvMvJB980CVtpbGoPxX3T1n0PlrUT1FoZrVqnnAWh9Xw3B8fNPoXJ5nSxIIr0N
	Qzik/gxqkcOqa/4GXMJrNo2+oK3IFDqdhux6Ge3+DAe2ClTU8eTFAlOnNDo/+pdAgQWs/+Lb9gOfH
	T0mDHRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzMw-00000005UZd-3DuK;
	Mon, 02 Feb 2026 19:13:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzMu-00000005UYn-1cgZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 545FA405C4;
	Mon,  2 Feb 2026 19:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460A6C116C6;
	Mon,  2 Feb 2026 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770059631;
	bh=bVNExOecclgFUYczf53ULyUIujXLZbcCGWlArLy5Srg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qo2fkX6zhNO6/ZZPfsT8pTBSn1FSKNP/wNRp/EdO9cTMiPLJ/eGxI1hE2ANyGtNzX
	 QITb/IWbFQcM4r8psiYTvSpQqbQpK4V13ZBGX9r30D0a/hQ1685/7Tpui/FrMn7WpV
	 k+w0yrEqANMg39VBGvxKgmsIXBJHIhxrpDbM3cBShUptCBsuUFiJbIRXjqB+HEbgCc
	 9Y1pZjNDXa5zjR67NSYuKezM7oNUubB7Rv54usQsKE+5H0eCjIvregkNuoYC9Dwxa7
	 hur9/BMjEOL+fv7de+8QFvepcTwn0S30cRRU6mnhtZ2CoWWjS0uIiuShvhjcPS3Fg1
	 dL9TTdPYbcGlQ==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
Date: Mon,  2 Feb 2026 19:13:42 +0000
Message-ID: <177004685649.2187917.2406852216797394665.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111352_448145_B089AD2B 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, 30 Jan 2026 14:28:23 +0100, Marco Elver wrote:
> While investigating a Clang Context Analysis [1] false positive [2], I started
> to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
> hole led me to find one critical bug with the current implementation (patch 1),
> and subtle improvements that then enabled me to fix the original false positive.
> 
> Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
> fallback) incorrectly qualified the pointer rather than the pointee as volatile.
> This resulted in a lack of "once" semantics for large struct loads.
> 
> [...]

Applied first patch only to arm64 (for-next/core), thanks!

[1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/bb0c99e08ab9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

