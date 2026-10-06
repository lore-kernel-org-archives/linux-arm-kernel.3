Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FCCCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwGu0L8gi/x+gf3NLIbz/98ZJLmzz95uCuCT5hirT3o=; b=EiQzAlD8wsdoxO7rQjYsqZJsdL
	e6/gH6XgvrLkB+sWVp20F7t46zbJpIIODEw/H6qE4PAerctfggkMkYJlsKyw+J8iuRnGJT0jpBHyP
	7ZmzUaYk8gpvX5ZnLBjXPOPE7+fnBYZ7nY47tTASLbXHBr7F7E0C51QQDpdsi8SVgjKbrNcPgI4OW
	oZ0z96tNAj7bKnICR9F/R8gEwQlZ2mXzwFvEB9f+jElOd43qYfMI53A+wnBye0VA7LbKaMha5umjT
	axYpiPpNuAIgpfW2TDlkdKa2Xb4yNDMw24Ca1xL9UxHNaH7HNt+b8hYnwg9NLprmSgXaQMDKELu6m
	u1nJ3gNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUY-00000001RMN-2127;
	Tue, 06 Oct 2026 22:18:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUV-00000001RLE-2D2Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:18:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B707143D;
	Tue,  6 Oct 2026 15:18:25 -0700 (PDT)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 667E83F66F;
	Tue,  6 Oct 2026 15:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791325108; bh=4a2f0Q6XSzawwAhdB0SXoCS+iLVGBAyTHhrXtzZaQN0=;
	h=From:To:Cc:Subject:Date:From;
	b=rqJsZowmqULJ0Yg2n+F3lEUplKMEHuksjD4Gk++TXT2dGUmhHsX1izVG4s7Q+QWkK
	 iGo/HKv5ETgpP36E3/6Yo696SEiz/tH0h2cBGY0373nwuknhRXWP2euUGowGvouyN1
	 3jKGLpsOZUC4FH8z+MIhXyJk/3TtbUsASMpPo5fI=
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	broonie@kernel.org,
	jpoimboe@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	atomlin@atomlin.com,
	ndesaulniers@google.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	ardb@kernel.org,
	Emanuele.Rocca@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 0/3]  kbuild: modules: Fixup arm64 BTI relocations
Date: Tue,  6 Oct 2026 17:18:12 -0500
Message-ID: <20261006221815.2823252-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_151831_727902_E6CF6FD2 
X-CRM114-Status: GOOD (  10.34  )
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

The kernel module loader, the arm64 ABI, GCC/Clang, and the static
linkers operate with slightly different assumptions about which
functions require BTI landing pads.

A static function called only directly does not normally need a BTI
landing pad, so compilers omit it. A static linker producing an ET_REL
module treats R_AARCH64_CALL26 as a direct branch and leaves the
relocation for the module loader or later link pass. It does not know
the final distance between sections or whether the loader will later
require an indirect branch fixup.

This matters when a caller and callee are placed in different sections,
for example by __init. The arm64 module loader may replace such a
CALL26 relocation with a fixup containing an indirect branch, making an
otherwise direct only function a BTI target. Ftrace makes this more
likely because its entry NOP can replace a PAC instruction that would
otherwise be a valid BTI landing pad.

A linker could conservatively add veneers to affected cross section
calls, but that would require knowledge of arm64 module loader fixup
semantics and is not part of the generic relocatable link contract.

Lets fix this by handling the module specific transformation during
the kernel build. Scan cross section calls and, when the target lacks
a BTI compatible landing pad, place a veneer in the target section,
redirect the relocation to the veneer, and branch directly from the
veneer to the original function entry.

Jeremy Linton (3):
  kbuild: modules: Add arm64 BTI fixup utility
  kbuild: modules: Build and trigger BTI scanner for arm64
  arm64: bti: Drop compiler specific BTI checks

 arch/arm64/Kconfig         |   6 -
 scripts/Makefile           |   3 +
 scripts/Makefile.modfinal  |  12 +-
 scripts/module-bti-check.c | 665 +++++++++++++++++++++++++++++++++++++
 4 files changed, 679 insertions(+), 7 deletions(-)
 create mode 100644 scripts/module-bti-check.c

-- 
2.55.0


