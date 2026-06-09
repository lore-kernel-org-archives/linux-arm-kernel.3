Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CC0CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYcniqLgoc6rs2Y66tZnRmYsvusegrTq2ElWgRTEb2A=; b=ArsUZ5peAuXneUqbWhvl42ZkIj
	cY/4BijG7UEjG178jpjV9OoNL4tdWlaTPTlNC/A+5qxW7fWUeb+i5vAuRVgiragT3LoYWXnj4omkM
	m9Yu9RlmhorOH43FLgRDdyM6iQtrt8Tg63j7m6ZSt9Rs9Gk6RLI7Sa91W1M5/hv2XdGsuQAq0SOTS
	N6RD79038MEZQHXe0dWIVEwMmXILl+LfwqsbvT0d8jn8eAsiRPAIsx1nUoVGXLVOKFF0s1dDH6Zy0
	zUznHkvx+0V9Zj6MT5o6hEZNhHsP1Xe4C/DNugk+bhgDuWiwRTTj34jrGc02MO/leowQ1bk2KGkms
	U04E6FVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4ch-00000006RKA-0ohU;
	Tue, 09 Jun 2026 22:08:39 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4ce-00000006RJm-38SM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1781041007;
	bh=+UpxFgUmXKI9oYhaSkDpyCrRN4C/28ZAOd9PNSzgBjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R4rZHjGNqidz2ttQSWkuPB0kjevviKYQo0L2HhvAbHAQW7obk8FEoQ8GiYYxJM8ER
	 X7lM4s2OpGrEGkDuikl1s2k/wSfVrYc6exOL3PUWjuwlq3Jc5NmgObsM9ziymgxf2y
	 NkyXHbF+kvJbMqOjwozBzLjAAcoJNa/JAujFTsGQ=
Received: by gentwo.org (Postfix, from userid 1012)
	id E225540BC5; Tue, 09 Jun 2026 14:36:47 -0700 (PDT)
From: sk@gentwo.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org,
	Sayali Kulkarni <sskulkarni@amperecomputing.com>
Subject: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
Date: Tue,  9 Jun 2026 14:34:33 -0700
Message-ID: <20260609213615.2788698-3-sk@gentwo.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609213615.2788698-1-sk@gentwo.org>
References: <20260609213615.2788698-1-sk@gentwo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_150836_826391_40FE014A 
X-CRM114-Status: GOOD (  10.38  )
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

From: Sayali Kulkarni <sskulkarni@amperecomputing.com>

Once active_cpu flips to ACTIVE_CPU_MULTIPLE, it never resets, even if the process settles back to one CPU. Reset it to ACTIVE_CPU_NONE when a new ASID is assigned after rollover, since flush_context() already issued a global TLB flush at that point meaning no stale TLB entries exist on any CPU.

This gives processes a fresh chance at the local-only flush fast path after each ASID generation rollover.

Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com>
---
 arch/arm64/mm/context.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index f34ed78393e0..0c92cc8fb4cd 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -250,6 +250,7 @@ void check_and_switch_context(struct mm_struct *mm)
 	if (!asid_gen_match(asid)) {
 		asid = new_context(mm);
 		atomic64_set(&mm->context.id, asid);
+		WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
 	}
 
 	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
@@ -321,6 +322,7 @@ unsigned long arm64_mm_context_get(struct mm_struct *mm)
 		 */
 		asid = new_context(mm);
 		atomic64_set(&mm->context.id, asid);
+		WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
 	}
 
 	nr_pinned_asids++;
-- 
2.47.3


