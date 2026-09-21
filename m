Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF48C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=; b=vqFLMryA7OMMWmvU5y0DxvPwGb
	hEu/s9cxBK0E+ernsTrdc5PrJJSxEm/NKqA3MqfILwTY37dyPcjSkg+EVz+1zbdSYiRPXu/NGTIXp
	OT5WL4ij3aGh5yoxaWSYDu6ESjiMVimMASxo5JgdLy8hibRFrH5Tg06PZfMgbLg2spklA0qdKROae
	Azq2aCN1vp+0XD/8WyHQi8sE/0OAke8ldmvvtvlUKiYVcNr4IEKkPuG9ue8Vig8zcTpiZlqZRsAax
	1JprMYJTZ36S9Wu4MkpRtTAlTlRQLBQB8GRT/WqMHq0T5GxkHuNopXufqLMcuFRqic2UrO9GR1Yrd
	+r3wnIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blp-00000001oJR-260Z;
	Mon, 21 Sep 2026 11:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bli-00000001oH4-2TXM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=; b=ZHlSkDHlhEoOBvLw7376a8MVu2
	a7sj1TOFyeLPIYIws3BK9B1PbSvXDALnQY4R0c2UeuDu4/nx3ctGemCMIYtc6erdn1wNXQm6Zq4QL
	w+H/1ghIby9CZ13ACHhXgL3FHpA5+8J6jTxOx7opUsMhn8Jbu+ZhTGYQKg3tU5JvJq9555gjUen+2
	P798OpGx2tWSROHSmYHFWtDET9pK5Sd5NP+mEx4hAQvE7QOMFwAZ8GSiEKqSVCT4pmv3Xv5pSkKcO
	qgnBPuieQU07n1R5LpZNK22mDX6ELuQNHaEt/y574d4bak18qsLMsFWwR7hgdjHlZUc7vavaVU9Qv
	xEvWm5sg==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8blf-0000000CA1f-1F8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:05 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e6862e924so22885515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988461; x=1790593261; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=;
        b=LLe9CuooF6g1k72nWUxmHVF70F66QUN9A5GtfUQgz92umaLx1IGR9Nsr6Q/AmL+ciV
         QHJq7q0hgXVBfivJ1psDLcNtj6IO0qADaLPhBNXYrIrI9+sXJgFx5GraQIqcIygyUF94
         V1nF+WxKEvXBanVk6jIHPMcDAIFmhzWsO+DwO2eysTDv+WK6MfosipbFEMYV2XpL9w5J
         Aahj1Xc/winHkIEoP0K+MbcraJFgSRVXpCwyaQeI4vI0SPdiGajJcj7J51yvnMo6pkSS
         f0gvydZJtId6aEu1yNphewnqCkjRK2VGv2e1efC6JLbSHYgAavuQpErOiSJkSok1zZVt
         RDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988461; x=1790593261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=;
        b=CSSXpOLJElF7X2Dlpu5JfHyBgZE03YK2PiWuJrKJ6MN3hPERvKka8IPX9kTDNWay3c
         B58LEv5sppwlWOgPwdxxGQkBta4DBq6I0bd8QRkATpcAtMtbrWI+acrwqVOTu0EqgPEA
         hZXCUIvfZh+mVMqlQNM/xU8rlfQnGvBZL6nJb4aKUdBdaYbIuBvUDavKvqAMYNHG/oVP
         qRi1DU6SljYuWhMN4XCPPy5vR+xKFCDsC4wynYL3yaz3ECE7v3Y9j0XT1i6tJGkhcgI9
         HU7XaG40q0oDWY835L4zyddsJ9/Ku0EfEXwvMzIDLvPyxRh5+7TuQrNwGVQVJwuRZX0Y
         tcrw==
X-Forwarded-Encrypted: i=1; AKwUvBwsPtzs1bnmuP7Qp7VY5dKKy6VpCDgRJIASYL2ciTU2CmTL11OjHpVms74Fc4CpVdqxC62MQklhm06lZGDR55Il@lists.infradead.org
X-Gm-Message-State: AFuF++lBbI8o4dG3ieBJZ+mrptV4HpK07Hg2EVdzmuvBzQHRy85yTBI3
	5kJydcObiOgbjY0swcIgzj886Pp/NwAznVuhJI14YfNduMLKibROZpfZL1v2Nk/IOtwHcsNV4NE
	EvqHtn6ubggULBbGQQaIetw==
X-Received: from wmbd4.prod.google.com ([2002:a05:600c:58c4:b0:49e:81b9:5272])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6217:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fc571423dmr133093905e9.9.1789988461055;
 Mon, 21 Sep 2026 04:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:46 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-5-vdonnefort@google.com>
Subject: [PATCH v2 4/8] arm64: Add support for MEMBLOCK_PTEMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120103_669276_37B73B9D 
X-CRM114-Status: GOOD (  14.32  )
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

With the MEMBLOCK_PTEMAP flag, force a PTE-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/mm/mmu.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..6b22b43a5f77 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,9 +1184,8 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
-	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
-	u64 i;
+	struct memblock_region *r;
 
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
@@ -1226,9 +1225,13 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1240,23 @@ static void __init map_mem(void)
 		 * regions. The cost is at most one page of unmapped gap at
 		 * each boundary.
 		 */
-		start = PAGE_ALIGN(start);
-		end = end & PAGE_MASK;
+		start = PAGE_ALIGN(r->base);
+		end = (r->base + r->size) & PAGE_MASK;
 		if (start >= end)
 			continue;
+
+		int rflags = flags;
+
+		if (memblock_is_ptemap(r))
+			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
-			       flags);
+			       rflags);
 	}
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog


