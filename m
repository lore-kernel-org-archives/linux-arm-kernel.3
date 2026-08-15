Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A0C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SLTJcm5n+Gs4MvyDRaD5ZUNP0VQqMVi7H7DWoQkAZE=; b=1HXwY/NaUwel15OH0AABpEebkG
	93QcZzzkkxXjJuNlCVlDuQwwQMPei0IfevuJArY1YAShvmi+kudhBVIwC7DXpYQO7hTEoEVG4Ji3h
	JUhL4HybQlXPDUBi3LoSOIDTJlGOCmUhU58xLhZ8OIf4Xw2XAEscR3XXYvUDnN7IzhXLOn37FtGeI
	Q+pcjsPbTW80RoQhREkIo8r8uMsmdymv4Lui84X9VsyLP5Uip+ZJUJqXv/68K0jMTrnbSBG1bUp31
	JqYGgolvfe084dEXpjZOcqNGsT3xEQrCwzW0/1XTaYVBHoZLq7GnMbVZXFyubrTP/Avqqhi8rHjxt
	rRmwAEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvLh0-00000004CMi-1o3C;
	Sat, 15 Aug 2026 21:13:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvLgy-00000004CMA-0B8Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:13:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1535244f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786828402; x=1787433202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SLTJcm5n+Gs4MvyDRaD5ZUNP0VQqMVi7H7DWoQkAZE=;
        b=KhYkeoNQF8SEo9w7UnQ50rh226qYBodE1MJF3LX0k3NmggcFbFNpgWaHa2uquI4/Wh
         FuwQI90P0xUdcoVmkhVqnJb/WFhHPPBMFiYbyWbhNZ0awszGpg30TsfUD6d0HI7ywx+u
         Oq+9Rv39o9aayqf49hWsGhXRl0OwDkOKd9EtcBkRryzk5LNNqcHouoF2kfR+pFLMbKNn
         Q6ocWLNdQiu5XJkLEQ8drczlXSSYgHsFqPBk+2n01gIwDelXEZ/FOQ12N+5V1aIq9e1M
         8Cq1FpNJ1aoEB2ti3vW6ohqTpE6lTy9LV3K3+pvyWppBuPxikwkbQtbBGROb9cTqFxCb
         6dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786828402; x=1787433202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SLTJcm5n+Gs4MvyDRaD5ZUNP0VQqMVi7H7DWoQkAZE=;
        b=OO2dO2WeOQRktukF3T4+vVWEvxuOEysbpViBUjSU5M4KiMibCQ9y8EInc4noNooiFh
         kccmHICwcL5eugKGSH2INUmGgs0r/kFLbL6AQOiNRdl7zEGmJQ3zw+pyorNrpUNkUSdD
         TTppUubjd7N4nfxQG7kY120yPvyE+Qag/qfYt20NeobWais7tMBgy9H1xiW+5EOdq4vz
         P7eHiJO7C65hwSukx+wSnT7/e/Jytu3IZh4gwL5y2wY1u+qKjOpOu/abNAQ/feTzsxBA
         holFD31LSPZTJGhoiNB02T3DVmJyvTMLavpqq/M7mGbJbhL/f0ICRxfjf7fmEWJtLKyY
         ZHzg==
X-Forwarded-Encrypted: i=1; AHgh+RqnPBsC0ij/eler2gYilAqyAFQDLCJ3KE7708IzEjACPyFe7y7sDeel12utA92APOweOqodV0CSRpVZz0VSsHL/@lists.infradead.org
X-Gm-Message-State: AOJu0YwbmSyHMpJyg94Pf1NbuJZ5sl4w9x0XwVWdPMnKPicc3hCqulPQ
	17sE+4/PEAM3NIvtG+944cuXnf266bvQaqZZfmzKvFtI1izTUiBXC+OA73QJxZ7z
X-Gm-Gg: AR+sD11CjQ4DbwkB+2/kXXHlWQFTfS40jrfBYmpj0SZGJnuNFQbwXAFyFlSo5Nhf154
	AzblSJHF3bRtb+UUWFrK667WbKMZFzSWG5xqo7jkcye15HGLO9TbsuWE0i2kDng8WjvFc0oNV62
	Y2EpQCqkNJnPB6rXwSz11zH7NoXYItlQ07IZCySJ6WMrupL9kd+7FajVmvC35FyO3YF60vvto9f
	f9I97LJ4W3matHRpcHXsy1qNaRbkz4BZu/29eyLBMLQ3NiOqtkgx7Um8RC3G04nbW+FQ2U1ln2R
	2N/il4FjDjMeynXMjwpt4mE33dRy2zZV16uuE05XJbc4n17K4pqnGJ7GwCD5UfyRXY+xQI34qFA
	HUa0KAoETbxlSn9PwI1TqT7EOvsrMk4c4nffRYIu7EV/xDcLUXsqY9goqf1YJR9b9hvW+DEqPtO
	9YHWntuG19AZlQpkH/eDdz0WuVWJ/7CBwocWlmp7ElCCPPddFQaisTrCewF/kZSPN02jIhN41nr
	ziu5zI0wvhVcN7Dv9fo5WJd8UPlCph5CFuWAgsNQa0I0qhqlIyhTbZfQwW/rqSPTMnaQMpm1JQj
	tyMm7MoI1eMVXfJhQWbluRWAIAC0kUOqR5HAcDP8KvX0bFoqRwRuLuh8IIwEGEOkpmYm
X-Received: by 2002:a05:6000:2a89:b0:47f:93b4:2def with SMTP id ffacd0b85a97d-481607b5671mr19216866f8f.28.1786828401869;
        Sat, 15 Aug 2026 14:13:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aecb-d601-fc34-eb31-14a1-3704.310.pool.telefonica.de. [2a02:3100:aecb:d601:fc34:eb31:14a1:3704])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm19113272f8f.12.2026.08.15.14.13.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 14:13:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: mm: Walk page tables with interrupts disabled in show_pte()
Date: Sat, 15 Aug 2026 23:13:16 +0200
Message-Id: <20260815211316.974-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_141324_100009_2EDB0759 
X-CRM114-Status: GOOD (  12.35  )
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

show_pte() walks the page tables locklessly and can run with interrupts
enabled, so a concurrent teardown (e.g. munmap() in another thread of
the faulting mm) can free a table page from under it. Dereferencing the
freed page can fault again or print garbage in the oops report.

arm64 selects MMU_GATHER_RCU_TABLE_FREE, and the documented protection
for lockless walkers is disabling interrupts, as gup_fast() does. That
holds off the RCU-deferred table frees and, unlike rcu_read_lock(),
also blocks the IPI-based synchronisation (tlb_remove_table_sync_one())
that khugepaged collapse uses before reusing a table.

Use guard(irqsave)() around the complete walk. This does not make the
diagnostic output a consistent snapshot, but prevents it from
dereferencing a released page-table page.

Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing: QEMU arm64 virt guest, 2 vCPUs, debug_pagealloc=on. A racing
page-table unmap triggered a nested fault in the walk without this
patch, none with it.

 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be6..b173eebd3cd19 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/hardirq.h>
 #include <linux/init.h>
+#include <linux/irqflags.h>
 #include <linux/kasan.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
@@ -151,6 +152,8 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
+	guard(irqsave)();
+
 	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
 		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
 		 vabits_actual, mm_to_pgd_phys(mm));
-- 
2.53.0

