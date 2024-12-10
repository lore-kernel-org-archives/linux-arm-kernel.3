Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4674E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gw0UIck/8kcTJhQT0+SoqTIkOrZFvIk1IeoYAe1gWtM=; b=3knC7hpacjn34KTQdjmv4fkqXV
	RaHM79lJmZnLAIhFnCM9+w915sofGrQiuXc1I2wUhqOr/2G+ZApX9qOby+bTKn66sQz7phogagwQJ
	lH3Q8yOBXFAqS17jQT66nx+c47BqB6sPV2NX3D+mXkf9xkmG5WOta1q7Ng0LzeC4zIHBq1e7k8KKH
	O3qnN1vF1psxBaFamNNkzfObJos64ODE3nWbYXN5JZccMqJijr5Y+R6hVZmKk+n8AFviFZ1cHEOG3
	u1056pGbM26UV2v4owQffeiT3xBwgYM8sqPTDwH+s35bS2hI6kkkiDK7jU67UqlXJclB8qtRVxeei
	poZg3cYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2mL-0000000C2ER-2u4C;
	Tue, 10 Dec 2024 16:08:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2kx-0000000C1pv-3mwZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C3235C0F91;
	Tue, 10 Dec 2024 16:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34108C4CEEA;
	Tue, 10 Dec 2024 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846798;
	bh=/EJLCV9Nbr8z/O96b+uztb1OOD40c2eM9YQphH3+pAU=;
	h=From:To:Cc:Subject:Date:From;
	b=rRU3ftX+twlXWaN+79xv665kO8GTDnwM12ZBEdFR6MfSY6RLbhue+timW9PEJLzVH
	 beh+aeK1Pi58eY9T5GdG9lKtRCsf8OCIgBxKZ/z8u+iHn6wOjoUvVsSj1wTiX2P8AK
	 Gg94zwt7HgC0V48enoGeycNlp0PCke484gZQy4qy9aufpc/byk2ZXYv3lpNFUnGj/q
	 ak+wSlWuHE9MCMOJLnrHzuSUEQ3l7NFw2vXA2zmMOggcrNHirXuiVKVKuzvhna/wH/
	 VMx4h09I3WzjCYDp+3jyz1J7H4FNGENzbpjMxf6CtTPspUPDtg858zwaCd7tYj/fdB
	 Awv+i++19po7g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/4] ARM: towards 32-bit preempt-rt support
Date: Tue, 10 Dec 2024 17:05:52 +0100
Message-Id: <20241210160556.2341497-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080639_977913_350F8942 
X-CRM114-Status: GOOD (  13.75  )
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

From: Arnd Bergmann <arnd@arndb.de>

Linux-6.13 contains a few patches required as preparation for
CONFIG_PREEMPT_RT, there are three more left, out of which I have reworked
two slightly:

 - The jump-label patch from Thomas get a little more background
   information, and an improvement for non-SMP kernels

 - The HIGHPTE patch from Sebastian now has the reverse dependency,
   turning HIGHPTE off instead of PREEMPT_RT.

As Matthew Wilcox noted, we can probably remove HIGHPTE support entirely,
so I include two more patches for review here that do just that, with
linux-mm added to Cc.

The final RT patch for the entry path is not included here as I'm waiting
on some work from Linus Walleij. Hopefully it will no longer be needed
after then next version of his generic entry series, see
https://lore.kernel.org/lkml/20241029-arm-generic-entry-v2-0-573519abef38@linaro.org/

      Arnd

Arnd Bergmann (2):
  ARM: drop CONFIG_HIGHPTE support
  mm: drop HIGHPTE support altogether

Sebastian Andrzej Siewior (1):
  ARM: Disable HIGHPTE on PREEMPT_RT kernels

Thomas Gleixner (1):
  ARM: Disable jump-label on PREEMPT_RT

 arch/arm/Kconfig               | 13 +------------
 arch/arm/include/asm/pgalloc.h |  8 +-------
 include/linux/hugetlb.h        |  5 +----
 include/linux/mm.h             |  1 -
 include/linux/pgtable.h        |  9 ---------
 5 files changed, 3 insertions(+), 33 deletions(-)

-- 
2.39.5

Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rt-devel@lists.linux.dev
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>

