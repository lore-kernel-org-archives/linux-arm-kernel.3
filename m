Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC983C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JUiec05jSU29eBYZBhrfBy+IxRcHB6XQ8TIH7rp69n4=; b=gvkioH6/aY3cJC/04rMiK61V1f
	MPDvpjurX1vK9o4mcnTj74TiWkjifKMqNiNCEfM3gA/BMX0sDk066xw6MrhBjbt0nN1SvuIxiwAsG
	Lpfz3sfWqLPxs6ckxmUGz58n5uJB/3qN6XP1uZgvaJKfFxcswuu/B2ejHKC0nGOVDWKlkGwqxogco
	zBQqHJTfKu4itXX+0AY9HfrrMMyjEsfDiqCZwKU2y4SMPrJ1F9CME/GcsfRNTpmGh/3qkOdYQVMm2
	63Ec7kohtuJnqxg1f4QR6ow/84olPWLKATBEZJqAm/0elgc5Xn1NALlNNOsrZ/tsHgCsxy6LOpZjy
	t/Y3NdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH2Y-0000000FLTX-1Mzu;
	Fri, 11 Jul 2025 16:56:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRS-0000000FGBO-238P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1DFDA54EFA;
	Fri, 11 Jul 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6951AC4CEF5;
	Fri, 11 Jul 2025 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250661;
	bh=ssqviJJdlPK7ukKCK3lJrf33765uDPISKy8fhWLffIw=;
	h=From:To:Cc:Subject:Date:From;
	b=eiF+dqKP7uTJo85RpjhX5/oQPZga4hD5I7fma2cgcqbTU0HxJoqoYrnxfHkOC94PZ
	 Gk4Ani1QThRE2Rgj/TLMVJxEfFlPA7Sp4bjSAaMe5dEcj03BleXV+O9q7/xnsYKN+N
	 Zs3U8Cih95EC7L0OizuMgW8goCQsfRmYKtHygnmaPF/wA9EP490zZbHYhqyQDUxcrZ
	 hMq9A6WbI87ilE6wgzPSxfgYe1dXQkOfb8gClSst0/W2drrfpxVBeA1p9B68MgMJlU
	 HQuoILHlbR9fYGwgwsxR/yvh99YzalWIgylv1r8nRkTu/B8sq6fAkPwtrbbAvHHg2G
	 xyBICNRWmEgVw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 00/10] arm64: Replace TLB invalidation preprocessor macros with C functions
Date: Fri, 11 Jul 2025 17:17:22 +0100
Message-Id: <20250711161732.384-1-will@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091742_588229_BCDFBDDD 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi all,

I cooked this series following a complaint from Linus back in March
about our range-based TLB invalidation macro after we fixed an
over-invalidation bug thanks to incorrect handling of its arguments:

  https://lore.kernel.org/all/CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com/

Once I started trying to rework the range macro into a C function, I
spotted a few other opportunities for cleanup and so I've ended up with
this series.

Testing and feedback welcome.

Cheers,

Will

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (10):
  arm64: mm: Introduce a C wrapper for by-level TLB invalidation helpers
  arm64: mm: Introduce a C wrapper for by-range TLB invalidation helpers
  arm64: mm: Implicitly invalidate user ASID based on TLBI operation
  arm64: mm: Remove unused 'tlbi_user' argument from
    __flush_tlb_range_op()
  arm64: mm: Re-implement the __tlbi_level macro in C
  arm64: mm: Simplify __TLBI_RANGE_NUM() macro
  arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
  arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
  arm64: mm: Simplify __flush_tlb_range_limit_excess()
  arm64: mm: Re-implement the __flush_tlb_range_op macro in C

 arch/arm64/include/asm/tlbflush.h | 230 ++++++++++++++++++------------
 arch/arm64/kernel/sys_compat.c    |   2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |   2 +-
 arch/arm64/kvm/hyp/pgtable.c      |   4 +-
 4 files changed, 140 insertions(+), 98 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


