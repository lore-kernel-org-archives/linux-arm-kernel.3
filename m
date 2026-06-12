Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE8CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBIgaU61Un7nMuYbPJcEUZodZq+y7U5VjpgVb1xUmfs=; b=NBtz1NhFjGzWcoBTup3ukK5Rod
	yPocEe2dk8tKZBFxrR0iLqD1JiHkiVem7wzNJQUnOyBi+xBmbpOSWL7XNtsENQG5luKRMPrGtoNi4
	0glKmBGHT9c6jddmbP3Zi4OaaQ6DIjwthIz3TFjbR+XzmAvQ+tFVxNYD/HDGwXHoEdMOyD6EUOjOT
	8JqYRRU5axZF3zB0HaNrgh0uPRNinjhmwSXv6Q3r1HZs0M6XUAu6RrbRhZk7PC05mpNZ/wehm0Vxa
	Xau7BKErChGwA1Yx1Vq009Ed0fdLZ7NNOBHHHIO5DNeUaCIGZ/eREhso3HDOu3XwXd4tfVZ06/zgc
	8rvq8wDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBNn-0000000Blag-28TJ;
	Fri, 12 Jun 2026 23:33:51 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBNl-0000000BlaL-36e2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 23:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1781306606;
	bh=eprTu/oj+2fV5INJ+XfJLbMEIKjolppdfw2udojmbQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QX3vXNXOVg31iv7k/1mxQL8T+6d13z/zyviyNOhf4a/vkPZ1STxPrCfCNYmLa/6VP
	 rLMWNQqXZ4DxmwBJvE9GDaHjXKVAAx80lpYgmAKZd0//kPDWNZs2A2RonEx/BuZyet
	 A/ajXnbAFzRJJQXZ4OUVO+eZxYRRK0Ugcm68M+6U=
Received: by gentwo.org (Postfix, from userid 1012)
	id 38290401B0; Fri, 12 Jun 2026 16:23:26 -0700 (PDT)
From: Sayali Kulkarni <sk@gentwo.org>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	ryan.roberts@arm.com,
	linu.cherian@arm.com,
	yang@os.amperecomputing.com,
	cl@gentwo.org,
	sskulkarni@amperecomputing.com
Subject: [PATCH v2] arm64: tlbflush: Reset active_cpu on ASID rollover
Date: Fri, 12 Jun 2026 16:21:06 -0700
Message-ID: <20260612232254.2856649-1-sk@gentwo.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <airWIxSd_a5kR65-@arm.com>
References: <airWIxSd_a5kR65-@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_163349_824981_07AD7164 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Catalin,  

Thank you for the review. I’ve addressed your feedback in v2:  

- Moved `WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE)` from `check_and_switch_context()` to `new_context()` after the `set_asid` label. At this point, a brand new ASID has been allocated that no CPU has ever used, so the reset is safe even for multi-threaded processes where other CPUs may still be running with the old ASID via `reserved_asids`.  
- Updated the commit message to correct the safety reasoning: `flush_context()` only sets `tlb_flush_pending`; it does not issue a global TLB flush.  

Thanks,  
Sayali


Once active_cpu flips to ACTIVE_CPU_MULTIPLE it never resets, even if
the process settles back to one CPU. Reset it to ACTIVE_CPU_NONE in
new_context() after a new ASID is allocated at the set_asid label.

At this point a brand new ASID has been assigned that no CPU has ever
used, so ACTIVE_CPU_NONE accurately reflects reality. Any other threads
of the same process continue running with the old ASID via
reserved_asids and are unaffected.

This gives processes a fresh chance at the local-only flush fast path
after each ASID generation rollover.

Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com> (Ampere)
---
 arch/arm64/mm/context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index f34ed78393e0..46c7fd07b9bf 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -209,6 +209,7 @@ static u64 new_context(struct mm_struct *mm)
 set_asid:
 	__set_bit(asid, asid_map);
 	cur_idx = asid;
+	WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
 	return asid2ctxid(asid, generation);
 }
 
-- 
2.47.3


