Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E29AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QBrTnMU20H4TL+ZQCr6cr8aiZXsWRSrbx0cTy05ECLE=; b=T/d6UYkdnwNMgWkgcWbgm21lzD
	FhaR2C5quhIt2no8LNhgvrO+rJVXtD4xG+CIoGK/hfF5y7eRV9WF2YuGbJTZmMKj+uhQHwFXbQk3O
	cjhTvg32+sx7mpuAHdlD7A8p454SPeqNGhljh7mw7x12KSoOF2schpPoDvHIU3GYWcZLobaY693N7
	WAEF5WEEIPVSp4JCpGUyWsIP7DFlck+sbUibhOO4weeQo/YVGWtQq4obpkjNshP15aQttGzT8nd3N
	RCEtxRmmZQw6oBzCnKBL3Vm8gDo07LMl2ZAd0nup0KE+iuQweNtLbtxHM9bD3N8VuEDgyEgDiBe1H
	T9BQhlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yEo-000000057uS-3Z9i;
	Tue, 22 Sep 2026 11:00:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yEl-000000057tU-3N0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:00:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC1491576;
	Tue, 22 Sep 2026 04:00:30 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE1423F632;
	Tue, 22 Sep 2026 04:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790074834; bh=7kF2ZLd5xnjPr3uj8LRikUsTpF/3ktf/GA8q0jXo8Ns=;
	h=From:To:Cc:Subject:Date:From;
	b=EaG8uaxDBEz3fqXa4znd9kUOM0Mk27eYi5Z1lSJwxludkr8fTVzQtdkHvMsN/MGBQ
	 mvfwGII/uK+MzpsO4aUjBBomCumKwq6Q3TkMnd/gwV79WfrCaxANUJpD1Jqg7UojZz
	 XV+GDc0ZlMZrlUFBGKDgcjzGH/AA/Y3DB9iKF+9U=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [PATCH 0/2] kselftest: Make MTE memory access robust
Date: Tue, 22 Sep 2026 11:59:57 +0100
Message-Id: <20260922105959.129380-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_040035_967758_02B712DA 
X-CRM114-Status: UNSURE (   7.25  )
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

Currently MTE selftests assume that they can skip (expected) MTE
faults by advancing the PC by 4 in mte_default_handler(), but this is
not generally safe, as the faults are triggered from arbitrary library
functions (e.g. memset() and memcpy()). For instance, memset() could
be implemented as simple as:

      mov   x3, x0       // copy pointer
      add   x4, x0, x2   // calculate end
    loop:
      strb  w1, [x3], #1 // faulting access
      cmp   x3, x4
      b.ne  loop
      ret

which leads to an infinite loop since X3 could not be updated.

Or, it could be having advanced implementation (FEAT_MOPS):

      mov   x3, x0         // copy pointer
      setp  [x3]!, x2!, x1 // prologue
      setm  [x3]!, x2!, x1 // main
      sete  [x3]!, x2!, x1 // epilogue
      ret

with faulting access at prologue advancing PC to main could lead to
infinite loop due to main could be triggering unaligned access fault
which kernel fixing up by advancing PC back to prologue.

Address this by introducing memory access helpers with predictable
behavior, allowing faults to be safely handled, and switch the MTE
selftests over to them.

Vladimir Murzin (2):
  kselftest/arm64/mte: Introduce MTE safe memory accessors
  kselftest/arm64/mte: Use MTE safe memory accessors

 .../selftests/arm64/mte/check_buffer_fill.c   | 10 ++---
 .../selftests/arm64/mte/check_child_memory.c  |  6 +--
 .../arm64/mte/check_hugetlb_options.c         |  4 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 10 ++---
 .../arm64/mte/check_tags_inclusion.c          |  4 +-
 .../selftests/arm64/mte/mte_common_util.h     |  4 ++
 .../testing/selftests/arm64/mte/mte_helper.S  | 44 +++++++++++++++++++
 7 files changed, 65 insertions(+), 17 deletions(-)

-- 
2.34.1


