Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79007C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eiuXefLgCGCI1r7YxmombeP0mg4dcvR6K6zniDNoOUY=; b=gKIPts5ZVEfXTD98e0mjb/F0qd
	dB6ogkgMiQboX5c6Oo7+DNsEC+sxO3LMM/g5AXAveV8oT2Sdgbn0O9sxbZETobyhG3GmqvDGYZdaq
	gIbbI6EUuprLYuG6MRFRjLH9v6Cf04B4Bzw0BXWiE0pSTokZ7XfuVsjFT4+6faMCg21qwzy3mfYGj
	zGD7M9vVCaxaRvjr2SIrBU2YLdp0lF1uXbMcFerFTB/P6NUliXwgqOwEoB6+6TBjTNxKwkmz1LG1G
	PSbL0awWOgOfWEDzus0v+dNwnW98G3IZ4xh7CSIa6OkoQbgWof9+VWfrMkWJBLsfmJwROembriT7B
	8M1vOHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhf-0000000GZdP-3T2a;
	Wed, 12 Aug 2026 16:21:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhd-0000000GZdG-3Gpc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F8D240AB8;
	Wed, 12 Aug 2026 16:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851941F000E9;
	Wed, 12 Aug 2026 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786551676;
	bh=eiuXefLgCGCI1r7YxmombeP0mg4dcvR6K6zniDNoOUY=;
	h=From:To:Cc:Subject:Date;
	b=kWgCedTON06n4m1F+9EDLTIF6+8EGVvsqW22h0hnpGBc2lHCrwHV0tFXN6qs/QeeF
	 eAjGhMYy2vWEw0crE6W+WmbtrZpdwwMNerLTHqDaxBH+M/7MEIietD2B/UkMrh368O
	 UYcMs6c/T84clbWRotucyfK86k1uWplMXAWOP0aICppRmK5hxis7NzrwcYkRRixN4e
	 JfXDArSFlRaWOD0jSeEnuvwkBh5w4UEDiv+8HGKYqrXvsSntNcVOY3SeluHBlkG5P4
	 IhLfc8/oXBXo2P9Y6AwrGPG4hkxYmtuDC6VoTRbygVUPh/hMw2qeB8/cGN1dH9jkuE
	 ChTpqtdPsMBCQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 0/2] arm64: Implement support for BTI veneers
Date: Wed, 12 Aug 2026 18:20:59 +0200
Message-ID: <20260812162058.612202-4-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=ardb@kernel.org; h=from:subject; bh=t1mzG9sAxuYhYVzxySeHVpE1gwIi7wWs3ZJEMLRKnAk=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatmbnZQE+/y7Xu1Xkf8nvZhQcmVubFuftdU7+x+enjL9 Crx1+czOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBERCcx/I/Q3XTfgHnnXT6n D1phfzcGiez++bXVpJ5xSnpQrF9k+B9GhgvnvN6pyEe+8P4Z1a0cP2vWgvdfpr12qCgN2/+bIXB +PDcA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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

Recent toolchains will omit BTI landing pads from functions with static
linkage that never have their address taken. If a landing pad is needed
nonetheless, it is up to the static linker to emit a BTI veneer withing
direct branching range of the target, and direct the call to the veneer
instead.

Modules are partially linked objects, and so there is no static linker
that can do this for us. Instead, the module loader must see to this.

So implement this for the arm64 module loader. Patch #2 contains a test
module that was used to validate the approach.

Cc: Mark Brown <broonie@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>

Link: https://lore.kernel.org/all/ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org/

Ard Biesheuvel (2):
  arm64: module: Emit BTI veneers for cross-section calls
  DONOTMERGE: arm64: module: Test module for BTI veneers

 arch/arm64/Kconfig                  |   2 -
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/Makefile          |   1 +
 arch/arm64/kernel/bti_veneer_test.c |  26 ++++
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 6 files changed, 165 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/kernel/bti_veneer_test.c

-- 
2.47.3


