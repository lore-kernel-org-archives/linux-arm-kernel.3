Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237DBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1muiG6r1Y6aTMJltz/i48BkuYMlcYEFNd8ZwblGnAMs=; b=QLyzYwdPXyC0D1z4wWmAKodjez
	uHFxbiu+L6Zb6VbFHJ8DJpXfmELtgSmsxIffCU2G5KaNii0ufuCnfqgjsP1kfLOLevK1a5fdJjmEn
	J9pRHpVimMGBXUfB5B8/IAS+SRXQtmkyZepgNUnoVytXMaPcaxD1I9mrU7kSRc2tSCESggiVWRTIR
	K7QP2YGji5XztWLPDEZ5Zw57zL/j25NyEzv/ApykivRLcpvaZeN/uSU8/tlbxnpBSXa3r2Au/67rg
	FnXa0o1K+tnzYogeAiVli9znqUFLqCgFpIphgV0fJFjL09G9sjeUwOOCriXUQNajrbIDOyfhUeHG6
	l2iijWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rlw-0000000AmFs-0kQs;
	Tue, 29 Apr 2025 20:41:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYr-0000000AkVU-3TbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B12F5C2D38;
	Tue, 29 Apr 2025 20:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27413C4CEE3;
	Tue, 29 Apr 2025 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958493;
	bh=pww28JlyTBzS88AER217678R1eGmM0hTlESvUyPTfGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbeadhyBqAFVD0mn9RAVEXLytFdg3lODFFUe5lpfsxg14ZozPnlGu2bii3qsIuQQ4
	 UQlui9EnSxzCmouPszdd/t/Yv5YfEhqWWhmCv9qseRj/gV6U4J4VagxgZwZaossTRz
	 rqZXN33+3C0oK5bycH0vg+/nW/VDUj1PUghWySNTM20CjbRTd967DHIu1j6NTq35F3
	 47RJWftcIR1iRuOhABl/1nVHrF9TcrxiR9r0x71CoTtTbKRptstYha98Nb9aPQHsNN
	 bmoBcQa/4Nf7nPw5iLAQK6Fz9hf0s8Gt73LHbYd29uDQ8o+bowFzq6qFnrgTYmXMkK
	 sOgrwGCATsOAg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ssradjacoumar@google.com,
	chromeos-krk-upstreaming@google.com,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
Date: Tue, 29 Apr 2025 21:27:48 +0100
Message-Id: <174593987866.472512.6873137326879401537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250417114754.3238273-1-korneld@google.com>
References: <20250417114754.3238273-1-korneld@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132813_915861_C6E62174 
X-CRM114-Status: GOOD (  14.88  )
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

On Thu, 17 Apr 2025 11:47:54 +0000, Kornel Dulęba wrote:
> When the 52-bit virtual addressing was introduced the select like
> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> Because of that the rnd max bits knob is set to the default value of 18
> when ARM64_VA_BITS=52.
> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> be used if 48-bit addressing was used. Higher values can't used here
> because 52-bit addressing is used only if the caller provides a hint to
> mmap, with a fallback to 48-bit. The knob in question is an upper bound
> for what the user can set in /proc/sys/vm/mmap_rnd_bits, which in turn
> is used to determine how many random bits can be inserted into the base
> address used for mmap allocations. Since 48-bit allocations are legal
> with ARM64_VA_BITS=52, we need to make sure that the base address is
> small enough to facilitate this.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
      https://git.kernel.org/arm64/c/f101c5644771

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

