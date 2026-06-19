Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0CCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P4uJwZMdHiu+M2xsL3q57qj8g/8y4qsbooRZc2XmjA=; b=cN83S38CKuY7rjidnUX0ZYZIRw
	Ps08jH2RNrngtAg+lMbNtUzOXf5E5RsgAEneFM6qrKsAxLtNL8l31vkcvg3AO/8DHI941FrAZnQQU
	zEfxngZVx0IwsWRjslDrWvC/7mFpxiAZonkczcir+2qapivO4C7jytSm5BA1sZzrMoanBx8QK9Wfl
	4hxbk3h5shcXdYrQT2egr6iHhgHqvHYMPJov64c7GEvES+8RUMiYxBgB9wDZynA/WQB4ts+UatK+M
	tm2NSwn9MvLtAqRSNkghHjCRV7h7VXIhjok078aObV+Rm34e+ds3AVGgPyt4kjt6eyCaQsHtT+aaD
	EpyBzNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacCV-00000002mLl-1hX1;
	Fri, 19 Jun 2026 16:36:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacCU-00000002mLL-09B1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:36:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7093441964;
	Fri, 19 Jun 2026 16:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF341F000E9;
	Fri, 19 Jun 2026 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781886973;
	bh=8P4uJwZMdHiu+M2xsL3q57qj8g/8y4qsbooRZc2XmjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DSNt//mzGvPcIYKrgnat8UNm/JbXrJJS6Ornk4q6346qxe5ScEZFTUgeVxnMx+lsB
	 hv4J9uhbaNpSwOfS6M2XD74BKRxI2YpST4M3poEyKSTDxiheqkfsYviLHn+Ukih6h3
	 XAKIJH0wRMuBjBU/MO006wlVnZHGTyte2Y3d+nW2/qWI+le4PRsI4noELp+W+PLy9i
	 quWhCY6nQ6abSXnQTDaZztMUYpgizoT0BKLXXBC7FFqwKx+T8QppIXUM0WYULdJl+w
	 fkldA32Js5EbtegwY5kByGBolvyeVfZXrNe78jREjZTPgZI1PixF4bolE8EVAc4Lkf
	 +ZS7gPIPkHtEQ==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: static_call: include asm/insns.h
Date: Fri, 19 Jun 2026 17:36:04 +0100
Message-ID: <178187925432.1029264.8176166898925529089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260611132149.40873-1-arnd@kernel.org>
References: <20260611132149.40873-1-arnd@kernel.org>
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

On Thu, 11 Jun 2026 15:21:44 +0200, Arnd Bergmann wrote:
> I came a cross a missing declaration in a randconfig build:
> 
> arch/arm64/kernel/static_call.c:16:5: error: call to undeclared function 'aarch64_insn_adrp_get_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    16 |                   aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
>       |                   ^
> 
> Include the header that contains this definition explicitly,
> rather than relying on it to come indirectly through another
> header.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: static_call: include asm/insns.h
      https://git.kernel.org/arm64/c/998d4d789d2d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

