Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B343BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=; b=VTjYl7KE4rTnuzji7MBB/YPXef
	XoKQz0i1QzKigkI+YkQRicNT7onkpLBoG+UukbrhRWENt84iKfTMV+T31nEwq4yfHW3w5/hKyYfuh
	8aUtsy7RepUMSNNt0C+HFO+YjUtJnT/a7cZWIitCv3Fu6rL+2XAl673oMFRJKgobq8JG8zvtzNO7O
	q49EP49nZoWoaHWzzvMkma3L6GE3UNyQLEM6P7HDf0qfJqJ/t7i/DZRW2y1Pa3zHfJZw8IQJ6A1Bo
	VTV2VEHRUucvtMAQYrPcOIVpWEojCigAG4GZDe4HCN2eGJIYShXrUBIDElfxXZWVd50f3zalqrWt5
	YrGniYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSK-0000000HK5n-2yaF;
	Thu, 16 Jul 2026 12:44:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSI-0000000HK1g-1une
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jul 2026 12:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=; b=jqNrDbABnCuVFGVgaMHI7U06kZ
	7UDOMnus5hmmxh9idh1W9Aay8yqgMotw0SMu9R+p7tlFRpMGPMyFvb2DRuRKEXVCWK9H+cXlymjtx
	3xo1I3sD3pdxjFNdAU+NVKUImU7MAevyX++k8Hxus1D5PCrDsvcc3USa+H+iIk4hYFoRriCzFHJKe
	Wfewn+hhexVnx7I48NN6BmmSgvhhayGkS4TP1DhA6ZtdbHcArhKu1jxDcoLciA/jXx/+yuQOYDdlA
	j2LQbOIqTsXa5YFb6NvfR5Y5tB2QKQf3wwNjxSCNOhydag2tnaRwfUPKNVUSs810ULEgm2Sa6zS6a
	QnfqWdMQ==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkLSE-0000000E38o-49U9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so4833550a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205881; x=1784810681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=j9H9ZcZiXjQ76RHRS/Mgai3gMuMPIhDYV9YJOwW1GYLOFuqlI/XSfUqQVC+YZBt+j1
         Fu1u10kwQUhCBXJV9yH9+DKk6KmWDC/296NziedVsIYJ2pvmoyF4MN7CUjje+bjDU/lR
         oAeJDqdniw+YFTzEa8cxYfA1YUX03/TAulJfWtqbcL6DaKHvdkAZvCi9jIrMXjuT+4rs
         Dqf1OicKWaJSX+Om3fVdYdYScVpfbYlp8kZoSQrul7nvKtWByTXJMRESKitAnL3rA40w
         aMYDi+edKd5UM0kxGlEA+g0IlVkOzksyAwiutFLKZ7wIsjF3hyLLO+z0vse0cOEio4Fb
         jsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205881; x=1784810681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=U5u5q4aECLG9hvzkn7lk0G1FZWKKFsS5xZCj2jWObzZYHgc21SDMvySsO4WN54Ujv/
         n5YYpX7Str3pr//n/3Si31PC1doMfSh9Eflx//+3ZfcrwxrIO9yOLoFwLQTBchqI3UPg
         ImsE3L6NSusZ5nT6eYh+z7j5tmHPP9X+s7WIjDoOM1IXupapVB8LC4Wdhc7A24fAQcbK
         W1TrsIyJ8HfukLY3nhD6ALMSlaEL7LbkVxD05Codg3w8dOSCHH8OE+A1KgZ7P9oLxqNy
         FZWzMnQvxyJlX1J1mYfwlXyfBFpzk9HQsA6s1B6dJevuajB2bI/c+XpMrVsHYAWFC+VG
         5+Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrvkgpKU/RcTBkcDozhCSxFxyDjU4JPNa1WVc+pPDbyyRdaWgQoBusTVRHALgZxPZuyT926B6IeqZV+BY2LCCdn@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxXEOkLqe2H/ah8CkB6RPWBylyig0RFBNHvzcNqVOkBw3KY3S
	KAS8o6SE3QFliv9X+plWSMTaoXiePwO67hJQAnER0AAtmAmN/HZHVKybTr4mShGXROw=
X-Gm-Gg: AfdE7cmjvr1GECLLEbjcNJbdKNSHb4DHwA8G7sBGuL0me7Reoawtx28u4QE7vo1PdXG
	DZJC16WGUyy9pm0kxpQYojv6wRJmokYuRDbf5GdhiAEOY5bh04sfaHnqVEQQd4nW4c2JMc2Pana
	DNRnez/0+v2F42tx/7eCuE7GYYtxaGUqbDgiqhOr4b1etg2l2zVkHLX0V60PNw24VOapHJPaLjP
	dewev2Cz7hIK0+GNyS8h/vDFm44qHCAEr5rSVFXMDM3xnzPpjiLcg/qz61G6k5zm0+ajyDVxSGb
	wchkE8zDAF4VJc28TwiJJDRAk1QB3AUS0JTzP5WVygpVEEzwSUYHLrj1wG6tXiT3QEOPFqSdNn9
	F+Jji9eOsq0aCsYlp4AFHtqe0EkMbgmTAeFVXhIxVhminykoWN6A42NdVUE3p/INrgsaOicy8L8
	EBJjNJ8ugkohKh/QfDqYc/jwI=
X-Received: by 2002:a05:6a21:114c:b0:3b4:b275:c5b1 with SMTP id adf61e73a8af0-3c36c1cf118mr8945730637.26.1784205880687;
        Thu, 16 Jul 2026 05:44:40 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:39 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 13/15] riscv/mm: remove redundant TLB flush in napotpte_convert
Date: Thu, 16 Jul 2026 20:41:48 +0800
Message-Id: <e55fb906990083b05272648f5299514a68cf8456.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_134443_229019_F7F22715 
X-CRM114-Status: GOOD (  13.17  )
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

napotpte_convert() switches a NAPOT block between the Svnapot encoding
and the equivalent set of base PTEs. The conversion itself preserves the
effective translations: PFNs and permissions are kept the same while the
page-table representation changes.

Do not issue an SFENCE.VMA in the middle of this representation change.
For partial updates, such as unfolding a writable NAPOT block before
write-protecting one subrange, a flush at conversion time would not be the
operation that enforces the final permission downgrade. Writable base-PTE
translations could still be refilled after the conversion and before the
subrange is write-protected. The required TLB maintenance belongs to the
operation that actually changes the effective mapping.

The RISC-V privileged architecture discussion clarifies that Svnapot is
an encoding of a naturally aligned range. When napotpte_convert() only
switches between the NAPOT encoding and the corresponding set of base PTEs
for the same effective translations, the conversion itself does not
require an extra TLB invalidation beyond the usual page-table update
rules.

Link: https://lists.riscv.org/g/tech-privileged/message/2950
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index b0b8ff0aade3a..8289f39d6e188 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -129,7 +129,7 @@ static pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep, pte_t target)
 {
-	unsigned long start_addr, end, ptent_addr;
+	unsigned long start_addr, ptent_addr;
 	pte_t *start_ptep;
 	pte_t ptent, pte;
 	unsigned int i, nr;
@@ -137,7 +137,6 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 	start_addr = napot_align_addr(addr);
 	start_ptep = napot_align_ptep(ptep);
 	nr = napotpte_pte_num();
-	end = start_addr + napotpte_size();
 
 	for (i = 0; i < nr; i++) {
 		ptent_addr = start_addr + i * PAGE_SIZE;
@@ -150,8 +149,15 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			target = pte_mkyoung(target);
 	}
 
-	flush_tlb_mm_range(mm, start_addr, end, PAGE_SIZE);
-
+	/*
+	 * This conversion only changes the representation of the same
+	 * effective translations: NAPOT encoding <-> equivalent base PTEs.
+	 * A flush here would not replace the TLB maintenance required by a
+	 * later permission downgrade, because writable base-PTE translations
+	 * could be refilled after this conversion and before that downgrade.
+	 * Leave TLB invalidation to the operation that changes the effective
+	 * mapping.
+	 */
 	page_table_check_ptes_set(mm, start_addr, start_ptep, target, nr);
 	if (pte_napot(target)) {
 		for (i = 0; i < nr; i++)
-- 
2.39.5


