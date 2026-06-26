Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14482C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yUXrG/nzVS4gBmFQzjNdyZOOO8t7nG7Z7NZfYkABdBc=; b=1byldl2GFoREWODdNf+KJWzl5P
	4vKm8PKV//n4lNVjrBUaF8hG1WjxN/Nanmh1XV+k7ph9f1V7B7KKdZEJkgOY+vo4J5937/cDaBBrF
	KnHf2BxkdJsK7/2+I/Hjt63wcHIqnpeGb0ubXp4Wjum9Nt9SwxAmOV2PuZFttgRR8d4FAhHPp1G1/
	+wCECe3zWoTc3dOESESLqU2tWXN+nig+tuwRD7fWovliXzh6qlMtM/01rtTHIzcAdr+ynCx3AaH1K
	wBoA7mU5+Qkp53aHT7epqZs6M53b80PXPpxQBiOJlQK5jP6wNOx2bFZBHIYHWc06WwIhyZt5m9XXW
	xouRD6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7ND-0000000BRYN-1ovn;
	Fri, 26 Jun 2026 14:17:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7NC-0000000BRYC-1qsP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:17:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 802BF600D9;
	Fri, 26 Jun 2026 14:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD351F000E9;
	Fri, 26 Jun 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483457;
	bh=yUXrG/nzVS4gBmFQzjNdyZOOO8t7nG7Z7NZfYkABdBc=;
	h=From:To:Cc:Subject:Date;
	b=HL/2vxeI3xxVckm/i72aRWMc5zrEgumOWpUSBidb2dnGqzaPGyFTP4l5pHT3HEeSE
	 0zkpJUZxb4lV+qMZN3bK2r2gEKyJwrooLglnh33Ku2T8b2xJ7WbHDFTGkq9C4z9ZJw
	 ISFimhZEBnA63u2zV6PPyfZMZYMkrOtoT8IKkeEY1SjiusShIUhB3pPiWVu/qKyDMN
	 jADuCNRWxhb7QPAMMKymRlN2cWdM1CIFdYnwvWm9xDAbEcod053zcqqDHBlxZSIZhC
	 GAPNz/ogWw87e6L7TGv7e+1SoIpQEJZqlvg6fMx5lY+dUocVCkD5T8fhM05dapJv5K
	 UsViXhIpru94Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	David Matlack <dmatlack@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
Date: Fri, 26 Jun 2026 15:17:27 +0100
Message-ID: <20260626141730.5976-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Hi folks,

This is version two of the patch I previously sent here:

  https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org

I even briefly queued that version up, but it exploded spectacularly
when building the kselftests for arm64 [1] [2]. So the only change since
v1 is the addition of a preliminary patch that adds the '__u128' typedef
to the private copy of linux/types.h used by the tools/ directory.

I plan to take this all via the arm64 tree unless anybody objects.

Cheers,

Will

[1] https://lore.kernel.org/r/202606240441.7eZ1TIRM-lkp@intel.com
[2] https://lore.kernel.org/r/ajvGS7UBpWzJtzkw@sirena.org.uk

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: David Matlack <dmatlack@google.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Martin <dave.martin@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (2):
  tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
    structures
  arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers

 arch/arm64/include/uapi/asm/ptrace.h     | 12 ++++++------
 arch/arm64/include/uapi/asm/sigcontext.h |  6 +++---
 tools/include/linux/types.h              |  5 +++++
 3 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


