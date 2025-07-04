Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233DBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JAt74F1miLEzpWqwEs/9FjD5FZn9rXwKEhCUVtjvGQ=; b=fgIE3402wJaflJVa16wyMizTEK
	feuMzGHvv+fRZyCBehXKY5C7xJt49UI5fL4hsXGVQLmlFPdAD3EL1sELT4rs04rXKMh4cdNSndjXs
	z1UihR139rixtPnOtOo13HeYzVchm5wee36dplnhr/HbMk8n/eRK6nGNBSWRy77KCRCDHVQzX7VOK
	aP6e07hzkAEEzj2Gm87PMfMDdFEWpsWWJ387S4d3gV14hbDonE8eTaFiLVkELfAQeiY2bnx4DDCN4
	Mz1ENH1wrLu05mFOfo1c5yOjbfhqFv5BzwZpt+jocT/K6kFbcAWZg5UNE4dxNFvAQSqZENFn7nsrB
	o69VxDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXks5-0000000FB6K-09xw;
	Fri, 04 Jul 2025 18:10:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSq-0000000F8FI-2drE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21A3B5C6A5E;
	Fri,  4 Jul 2025 17:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BB6C4CEED;
	Fri,  4 Jul 2025 17:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651083;
	bh=5LK3c7VkLVR6ZvjLipVvmjr3y3j0efN+nBY9t+tmaME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJ1LHkhldFrwXnH2m1q+LefNuqfgHOHtgAT6fVu7wkltXngPFj1lpf/BCJ2SJmqoe
	 +O1B/QkpYfqt/7l0Bw2pZmza3M3WiaktXSHcMukV1RTpGvzqv4bDOl+znWZqQ1IVw/
	 Z+mLROZLe/qJq5FqUaAKBlo6udbGqu86CfokV3HvizOe5/fFTXPI9a9CdFrs+Zqyl+
	 tGtged31xslSmBAGHv7yotfDiqPviBxd5ZwqDXqefSFRHwjKzUpk7DEvv4RJvJ795Y
	 5ZAvPz1NJEG9POJumcrTamQWg7yXiM4ZMHbC3PDFFrGtjezvsmdMb32gZMdcZ5OeVs
	 3eppQradlIRtA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	usamaarif642@gmail.com,
	Ard Biesheuvel <ardb@kernel.org>,
	rmikey@meta.com,
	andreyknvl@gmail.com,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leo.yan@arm.com,
	kernel-team@meta.com,
	mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: efi: Fix KASAN false positive for EFI runtime stack
Date: Fri,  4 Jul 2025 18:44:15 +0100
Message-Id: <175163682742.1322301.12219137975972256785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704-arm_kasan-v2-1-32ebb4fd7607@debian.org>
References: <20250704-arm_kasan-v2-1-32ebb4fd7607@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104444_708777_C1F908CA 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, 04 Jul 2025 05:47:07 -0700, Breno Leitao wrote:
> KASAN reports invalid accesses during arch_stack_walk() for EFI runtime
> services due to vmalloc tagging[1]. The EFI runtime stack must be allocated
> with KASAN tags reset to avoid false positives.
> 
> This patch uses arch_alloc_vmap_stack() instead of __vmalloc_node() for
> EFI stack allocation, which internally calls kasan_reset_tag()
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: efi: Fix KASAN false positive for EFI runtime stack
      https://git.kernel.org/arm64/c/ef8923e6c051

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

