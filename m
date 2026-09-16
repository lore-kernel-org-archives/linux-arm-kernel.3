Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFE0C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/a4aK+gN/7WQgr9WGLAxW26AQdjhDeu9mCp96kKnlY=; b=waJ+izVDVQV+XkIR1+hJEcgWUY
	6ur7cLWq6Avr5bL5GeIhy629Dt6qvU6eMAr/ry9kE6ELBQSaawNb9Eo9wZpRxnJbR6rPbf6dfUAZ7
	zRA3bs4Zu+cMLuZ6MfVCR/DxfXNL9O06oDi6Cv90HoHdkK5j+GCgAggTGCEcIRngd7SgoOqenhWPG
	B4S8u8saCF2pYPFzMvB/PsnpDq+NwjBltOUuMlZYIXL1P+QdhQUbGw4d3BjaqXxIjnMugLRmQSeiv
	REasAYeDNgwTv4aJ4eGr9yTjrD0Eea8whWJmFEJ62niwfHJ/JS3iGmEHv6zEtz0Xx8Vtjx+SFo7Uv
	KqOhLBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6haZ-00000008KI4-3viU;
	Wed, 16 Sep 2026 04:49:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6haW-00000008KHE-44Gy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:49:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83D271516;
	Tue, 15 Sep 2026 21:49:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60B6F3F86F;
	Tue, 15 Sep 2026 21:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789534178; bh=jycAePJzGoWD7iuHXNX/pHzEJqNW9LDecK84UF0GsGc=;
	h=From:To:Cc:Subject:Date:From;
	b=N7Tenfyeb/B92byMKzxo1+YO/EFOWyugBUnMdXx1oEjuQ9cSSD5iIVZ474nePzmoX
	 CwMZwNXxrUMYvcukYA/lHLlG7CkOn+z+ffmh+TMx9ZYdbPhPCxyzmm5AWUl9od8SiA
	 sKMCxSgd0qLhr75AsY9BQ8BLyfVOHmbWuLoxwixk=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 0/2] arm64/mm: Standardize printing for pgtable entries
Date: Wed, 16 Sep 2026 10:19:31 +0530
Message-ID: <20260916044933.2689426-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214941_131458_FA784602 
X-CRM114-Status: UNSURE (   9.52  )
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

Standardize printing for pgtable entries using recently introduced generic
helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
bits entries when added later.

But first move __check_safe_pte_update() outside <asm/pgtable.h> to avoid
a cyclic dependency while accessing these afore mentioned core MM helpers
defined in <linux/pgtable.h>. This replaces the original page table entry
print standardisation proposal which was part of the D128 series.

https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/

This series applies on v7.3-rc3 but after the following.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

Changes in V3:

- Added tags from David
- Added comments in section closure for CONFIG_DEBUG_VM block

Changes in V2:

https://lore.kernel.org/all/20260909040005.4148136-1-anshuman.khandual@arm.com/

- Moved __check_safe_pte_update() inside #ifdef CONFIG_DEBUG_VM
- Added empty stub for __check_safe_pte_update() when !CONFIG_DEBUG_VM
- Dropped IS_ENABLED(CONFIG_DEBUG_VM) from __check_safe_pte_update()
- Replaced pgtable level specific strings with pxd_str[] in show_pte()

Changes in V1:

https://lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/

Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  arm64/mm: Move __check_safe_pte_update()
  arm64/mm: Standardize printing for pgtable entries

 arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
 arch/arm64/mm/fault.c            | 16 +++++++----
 arch/arm64/mm/mmu.c              | 48 +++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 49 deletions(-)

-- 
2.43.0


