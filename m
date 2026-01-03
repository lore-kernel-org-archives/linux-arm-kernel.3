Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95013FC6171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=; b=4SF5FGVFLJQ2RJkhyYu89JQPk3
	prZs+Bm3gGFRyJo96Bty/qZwIczp373hspAGShB8wz4txsK7mq/BV5YD587WfLavbDlOOGeuxBjeX
	tDRJpz3D5PXJ6V7MLopOsb9RWNTrcO8WRbVtYWDNA0DxTMO45gTZ6iXcPtbK9iVj9yeTQl9d7pOeX
	PQ98IiII1vhiS2skCrXqHMvPIUMzfsS5TrJ4B4PeNhoavCXXCB8rPZp+BJyczwjZuVC8xUlSvdGXA
	z6pn6abio0AJU7gDqtmAY+pgHk1JvshZtMRCzUC1ye/mnTFX9Z0R4kQNLqPK2aAg7tDN13qrwZdV3
	NJzJYVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxJ1-000000097PB-3jNI;
	Sat, 03 Jan 2026 08:48:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIy-000000097M1-4AKa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:14 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so10580830b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430092; x=1768034892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=j3tLSqQkYGI7YlRwHDBJdKthYbE8/gm6Qh9AUxFuySzBIsmQF23NWtb0dmCk/xSmNW
         rKGZ3QDeHB9W4iwhlEqqaUIfSooS4p8M72ClZPY52x8wlCUtEuuN0S1PgDw9SYzM9dus
         3KuSyFad054HQqpafGEdAOmiMSbX3o5dkRlJNOJM8De9aT0+3kNajdMwsYuDhoanuaVc
         D5ZUqfse+zHq2Lke3PVFszaVVnLSFX2zr9jFwmDlYsATjqicE65shAJ8AOeyxciEE4dd
         t/h1XBbpno8fKZ8BwRzPNVHxha4ieqGOyHUG7bi2zRKweP6e4Np4ZlCFAZQUwb96+OZv
         3cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430092; x=1768034892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=BFHTPnV5qbT1NJeOmsVrTsVXsoofk3U6io4lCBhjeG8vv1eLrj7l0x3qhkBnbGUYmr
         06bi7CvXLgXuX3ZGlcJy3Gd9yfO8M/67ZTVGpGY4CGOo7ADuhv/0zmXo1qdANdQeoeLw
         aAqAs2eyjf2BCQ7F227xIwUWZP/F9MHgtzHZqpT6MTgFDVvokWM+MelFASQJpk7is1rE
         yx81ThI1QCvbxjOdyN34CJJWNenc3/49Vy1apz/S6IgT8zGc5QrSDrJWm5v4zbXUcUED
         rw5EbDvDBA0pexdP+c6icOZ5gVhQJU7zfV4HJRyhPvvi8KvGt86xWc3au6A8CSbd70id
         PO+A==
X-Forwarded-Encrypted: i=1; AJvYcCXiNXtOMR9Hmr1xugG1Y+A3o1vJCZq494C/PRyCqTj661xTO87H1dAyO7B1I630NKejIdvTLyAEDhba49ILnOau@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1bDIFikGeg6JE7Npy4PuM6gdTARM2UH4ZTVEna14k2TqetlVM
	3W+qOq8R9btWVC5mVHTWY71hL6J8roUlIi/ZurwCowmxDsu8LTQdJjjr
X-Gm-Gg: AY/fxX4ht+krelHOuCXigG3xCP1771LGgiwT+MvCpQkHX0+NZsH/kVg7/rmaCxvL//p
	9DHLWn7jspyaH/N/URokNDZ9GEmxXj06BeRhzgi1hSwPiy3Jy0Ij5KfISV8XrMMbOaVwtM/FCqN
	i9lDiqnEILCqSNjZAYs40FC8ig4Yl1lN+l3XQW2VLE9jYzcErYzIkshMJ9edAJUqNQ2cPbRakpS
	LKB/XeMCpXSuteeVt+bltU6wZH6kCOENBIFqJLgf9x/Jidor4GCJTELFONaGFSOngiSHATjxbzx
	uAFtrsJ7qPD7I9kHpVLnR7WWcMYmiQUc3zMPFdIyOeGkMOV0Fzh8Y2wlfGyjgABphtwbIWJVooW
	4LPwDcmIvfKM6uN8FOKYOj/BcUYyC0WuGixb+FGgjRCkeEerCwCGPKpi9McCChX0KOLdaEbOhjG
	6bVZLn34GwoAzMSnCZKnlZXYUXKi54s0t9cA4=
X-Google-Smtp-Source: AGHT+IGp+2Ae35OlKcY/AZO4SFhsJuhif38Zo263lmc6gG+RjhGQaVQCgX9rVZBWLxbZMYLURcJ7SA==
X-Received: by 2002:a05:6a00:e11:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-7ff6421137cmr37196936b3a.12.1767430092345;
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 5/5] uprobes: use kmap_local_page() for temporary page mappings
Date: Sat,  3 Jan 2026 16:42:43 +0800
Message-ID: <20260103084243.195125-6-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004813_033591_BE47CE6F 
X-CRM114-Status: UNSURE (   9.72  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 kernel/events/uprobes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index d546d32390a8..a7d7d83ca1d7 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -179,16 +179,16 @@ bool __weak is_trap_insn(uprobe_opcode_t *insn)
 
 void uprobe_copy_from_page(struct page *page, unsigned long vaddr, void *dst, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(dst, kaddr + (vaddr & ~PAGE_MASK), len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static void copy_to_page(struct page *page, unsigned long vaddr, const void *src, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *insn,
@@ -323,7 +323,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 		return ret == 0 ? -EBUSY : ret;
 	}
 
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	ptr = kaddr + (vaddr & ~PAGE_MASK);
 
 	if (unlikely(*ptr + d < 0)) {
@@ -336,7 +336,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 	*ptr += d;
 	ret = 0;
 out:
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	put_page(page);
 	return ret;
 }
-- 
2.43.0


