Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF47C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8qKUeLq0Xc1diZzeHtvK61x/Xi1I1bUFpJGekusuPQ=; b=Q7KhwH7ZrwnMX4yW4T8F4rV8JK
	1lRbgLtbrdypohhXHd8/sMztefaKSH1mmFXsWpKSk4lkGtr/8F/PTTTolUzFG7WDSVtuwTs1ozyEC
	TBudFT1+qedqhFBSvifdT4sybbvQiayMXsgBa/DWaffcmAsVtXf/IhqpdnhLJ99k0+prAexIbwc+w
	AgRFPtZU3l81UdWThw7BxguEptIj3FyNlCUSvC/mTHKhxw3jGJgJkGahVfqdwC6mzIK91wCBw6qZB
	0B62btSyJnEPd8kxrymMi2gHfnd6OAA4cXaEWslhR/9KLhYUX2bUKIQrNZzvIjpF83FEe2hKaHnvi
	Cx2WDbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj1u-0000000CWqW-1kT0;
	Mon, 06 Jul 2026 13:06:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj1s-0000000CWq3-2EAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:06:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-46cea75d96cso301593f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783343190; x=1783947990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8qKUeLq0Xc1diZzeHtvK61x/Xi1I1bUFpJGekusuPQ=;
        b=fPK7BU5ASKamlPtWacaLHx76YJ757Rq+KenXl9EFO4xqmsHGiGDhYAIk6N7DK8peFv
         ZS0Ayz3WrhA8/in2bRZE9DidH/ymAlya9kC1/4hi9sYacNqhQlrzLMWIgBa9/VKaJo5A
         16GGrpkIojIaIhYEej3i3QB38csrvg974qUZgYiloxhZ71Du6xywt60zGdQFeY2kptGr
         QA2JtrLxup/0tiIwA7C5RZsB9iBA5dRiswgNSJOnURnBOwaVKAw64kYX0/Xi8Q+fP4oK
         ZSx58AcqVHMnbGxWI+w/gRJMMHt5ftDfw04x0LDLLVj5Q+/ULpP9eP8TCvanltINpld2
         LzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343190; x=1783947990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8qKUeLq0Xc1diZzeHtvK61x/Xi1I1bUFpJGekusuPQ=;
        b=LF6ypS2G4y9aY3gfLdCv8ADAiILBEFyEvInV3VD5Fw+wq/Y+Sc4YzWjyVIIIMUzjsn
         hYZz1Etk35lUjVOQHKOhMEQSRJYMV9JbwhBqRMUizqD7Fo9hMsmSNz8XzpjTdUTmdk6G
         xjC4H2Jes9rESzveCc6gwrvQLWb5b8QS/3OwcjYLm44kLkYz0YOSKAzCmJCJJ90MwoEb
         t4ullYqOqrM+rNggVyA9Z4+wpJMLMumTa3KbLuuIsbqMbnYcRTiGp4FpMRnWEtceRsZD
         kAU/3+uSQKw6wo+mwUPw7U9kw7OS6BVh9Dxyv1FOIz5x727u5y1sSDko34XcWjbZPUf1
         +YIA==
X-Forwarded-Encrypted: i=1; AHgh+RrS/NOfsg6TRsNg3auQfnA37LtP3BQZKT0xkZ5FHsZRkGQtdJDZuxR9MDyZGApWysD02rPhzJuutZtYduk6+SeU@lists.infradead.org
X-Gm-Message-State: AOJu0YwNt0QB9XWYwH7QOfk70vbJrR8zwHex7Z2Li4V3nn51Vo76oUOE
	6/lpmYo+1tiirnPhOueYfyLOLdIgzkrxEiEt4GpFIAYSO01xa87uGGs/
X-Gm-Gg: AfdE7cmvcQD+jjESp6IDaO0L5M/HAXGyRwL+weGsaYnljeQ84RqxmDZ1iCEupNfmM07
	mgAgSmilk7DvSr5itfDYZ/nM8a6t5quhPpOQWDloGuzObs/oBR7hT5f/00hOWAMEjihafAn/qG0
	UO0oWBYm5bX40k0z9KaZugCzvV0jKr1IaNpHuNpKi2cZTKg/kSZN0RzhVqvzQWh06F4yKr30dVR
	+m8wA6Jv70uCqXbha11kwLhlCZXijDvblqECOhFT0Kd/Xsfog8BPTS1bXpNKjtRwml+stLdE3y4
	prqOUmA8YTKWdpFyYhUwiq7WgIrvqtLUHdTBhtnAw2EG1zaK+sn1R4ewKXoewudpqJP62v57CkK
	83qrMSmWk4F4ux4pPnUG5fzmxgcAgblHK+b1aooxWmnIondtc+lqm25B8kl75ZC/z9WeqnGUNVK
	fk/sGHgj31b0ECg087X1m32Zvh6bMGiH0yMJY8qFK1KQi0BInxcNPM8qLUuDVdmrthMcWy/ybKB
	ahlRo3Ug49gUzNAMAamFVjyDRCRTy2w/DQ=
X-Received: by 2002:a05:6000:38a:b0:47d:2a79:a2eb with SMTP id ffacd0b85a97d-47d2a79a429mr3756010f8f.5.1783343189936;
        Mon, 06 Jul 2026 06:06:29 -0700 (PDT)
Received: from debian.lan (vmi1894487.contaboserver.net. [154.26.158.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm24515956f8f.3.2026.07.06.06.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:06:29 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lance Yang <lance.yang@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v3 1/3] mm: make persistent huge zero folio read-only
Date: Mon,  6 Jul 2026 21:04:38 +0800
Message-ID: <20260706130440.9295-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
References: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060632_604362_9AC236C5 
X-CRM114-Status: GOOD (  17.83  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out[1], kernel bugs have ended
up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the persistent huge zero folio read-only
in the direct map turns such writes into faults instead of silent zero-page
corruption.

Add set_direct_map_ro_noflush() so mm code can make a direct-map range
read-only. Use an address-based signature to match ongoing direct-map
helper work[2], where existing page-based helpers may move the same way.
The helper is direct-map specific and does not flush TLBs. Architectures
without direct-map permission support keep existing behavior through the
generic stub.

Persistent huge zero folio setup happens during early boot, so no explicit
TLB flush is needed.

Inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[3] with Yang Shi.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/
[3] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

Suggested-by: David Hildenbrand <david@kernel.org>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/set_memory.h | 26 ++++++++++++++++++++++++++
 mm/huge_memory.c           |  9 ++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..a905074fb21d 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -40,6 +40,22 @@ static inline int set_direct_map_valid_noflush(struct page *page,
 	return 0;
 }
 
+/**
+ * set_direct_map_ro_noflush - make direct-map mappings read-only
+ * @addr: start address in the direct map
+ * @nr_pages: number of pages starting at @addr
+ *
+ * Make the direct-map mappings for @nr_pages pages starting at @addr
+ * read-only, without flushing TLBs.
+ *
+ * Return: 0 on success or when unsupported, negative error code on failure.
+ */
+static inline int set_direct_map_ro_noflush(const void *addr,
+					    unsigned long nr_pages)
+{
+	return 0;
+}
+
 static inline bool kernel_page_present(struct page *page)
 {
 	return true;
@@ -56,6 +72,16 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+#ifndef set_direct_map_ro_noflush
+static inline int set_direct_map_ro_noflush(const void *addr,
+					    unsigned long nr_pages)
+{
+	return 0;
+}
+
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bdd8635922f9..6633217b10dc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -41,6 +41,7 @@
 #include <linux/pgalloc.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/pagewalk.h>
+#include <linux/set_memory.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -981,8 +982,14 @@ static int __init thp_shrinker_init(void)
 		 * that get_huge_zero_folio() will most likely not fail as
 		 * thp_shrinker_init() is invoked early on during boot.
 		 */
-		if (!get_huge_zero_folio())
+		if (!get_huge_zero_folio()) {
 			pr_warn("Allocating persistent huge zero folio failed\n");
+			return 0;
+		}
+
+		/* Set up during early boot; no explicit TLB flush is needed here. */
+		set_direct_map_ro_noflush(folio_address(huge_zero_folio),
+					  HPAGE_PMD_NR);
 		return 0;
 	}
 
-- 
2.49.0


