Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0spoNjs2N2IikfxIi4vPxdEU/Zh2HTYHpAsMmHsIBMM=; b=2Cg/qYQdlBQAmEVBt4fJHi2LX5
	QBYIRIxcJOtXTRzQcwhihjdw1bF0Iv/kCtfj3enJqDF+P835MOlNfZ9bD4Wr4XhkXk/QIvprum4kt
	HGGvusQ6Jsu+/jVFbehGIYASYXeYbvw8fvHUdXPTyGlGjP+TT/tfSbY4rCJIzKvgBPYYDDkIy53O9
	yvA/587igLYbaw28CHzK3DHlmqYZ0rG8BELQavUzOo2eH96le3PxX+HhYYOZb45+3vG76GApSSjTm
	USG4BIC46qrQ4mt2UZB//jCDfxybHHfWgbthEBFxXCZmWb+R808kwngrWdKjuiHWngTH1ObGjxf4L
	MRCoe2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLS-00000001K73-3hsK;
	Thu, 09 Jul 2026 07:38:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLQ-00000001K5l-1ru3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:38:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8485b358552so345558b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582731; x=1784187531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0spoNjs2N2IikfxIi4vPxdEU/Zh2HTYHpAsMmHsIBMM=;
        b=iJCNTDYnKK0WSn0AZ2/jOZH//HOMwh6OU+d/SPV5PdDGIgG/jzdULXar3Q+q40Ig5m
         y86GYW2ENbGFScHFn2RZEaUsEX0QzWpe0ImmjThs7dor+aSK6uRUNT54yTyAH6VGkb2h
         iUwwhrLY6lGSDYV9t5BCYLf4SvMLD1IbZhml6TMzc/DQucfr01DaqfNfbYlD3aw6lbJG
         6Ad+ZyAqqmDXC7zOlh8w27qomzQfqfHM1Fy+lXQtlYanSaLJI/Cu3d0HhTryxCDvK1OH
         h/u1iBxsbmJeCNAjFzKmqO9BRwmBxe0YwQfkr6DkXsCs58gF9G2Q8OM2z/hCaUJKIOlS
         n7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582731; x=1784187531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0spoNjs2N2IikfxIi4vPxdEU/Zh2HTYHpAsMmHsIBMM=;
        b=GM0orcACOpBu1Kssmt/sVMA+jwsUVVhvRFNTa8KZDubeoqjRCoqRNFAvgnn4KiyIfD
         2pPPa/1db+mNpiHN1aKHghjALLje//dp99P4wRCxFp5o67/NdPoYzlEnaNt/QF+gLAKI
         xEw8MIc9E2fzEbQ24e9Ybv6q/vssPzopfnUDbI4dZadJpqpVJM2BSUBmkhoJcdk2S7xV
         GbaS5Cd3vk8AVW4JJ8MY1uijRUp8KmcrIhoEvSvBVc9EykphAQS+aizL+hsX676vEdo7
         2bdE5S5uIOGf0VRQTUV0KAf+FNykYiWjZLMdNz3cnO7MwUNOY/+42ePgQYnoMSKFFKau
         Cu2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpy1Ysbl7PgcagIS7l1CXGZKETEfqFv1lZOeuCuicSNTKwYtEFD2aqOOQfzMebdi46qkH0lR0XNFTD73+lKMhN8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy1RSSBpbFoyzckykElmmwDa52cY9Ha7Kq24T56eQ4xhpEwZOi
	SPDqG49U2Lb70xoUJi/EJoJfa9Gk4IyFqvJUWlE7coP3Q+MECGBcztvf
X-Gm-Gg: AfdE7cml6nR1eNNfX9u2Q+4M30PZWtrEWsKsYQwVcZeop3jlZoRiYVEbpGb397Brjq6
	Ye0tmCPeR4Bj3kaOOf+MPPjSvlyxlJMcgg52yO3gb3sucYBIkEu/JpIezQuRc9Ja4ZMgl9utmum
	KZ6jFQZi10Xo2O2w5s5gc0Exo6pUTVbn9wOLaAXer5jHToVbH3uKHvg04jEfSyEdcyqcTpPHX7h
	9cj02mB/DHB64jfXMdgML8nTVlZL7JhRmuklQ9MWj16mwMwW7vFikrAg4+CicGl+pVjJlop6Xr3
	9ujFcTFK1k2XQ9SIU19khmeqrUnr4ijanVpV4e32Hb9o4MgU5rt+blFZpb5af5UEP16BIdtQ4bq
	+GRXefg7mGw6Weibh+wnHjP/wFoRjhr/qDBLDS5+lw7Q+YbHjFUO84F3uu2KKEaPYB60V1q/jF0
	AwjFOlVMV9Te2/0DqqbooNbzFRsrRFHWBqN+A=
X-Received: by 2002:a05:6a20:3d0c:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3c0bccbbc8amr6866655637.29.1783582731389;
        Thu, 09 Jul 2026 00:38:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:38:51 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Thu,  9 Jul 2026 15:38:20 +0800
Message-Id: <20260709073823.6643-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709073823.6643-1-jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003852_490021_9F0C2BC9 
X-CRM114-Status: GOOD (  13.82  )
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

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
so callers no longer need to handle the conditional compilation.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2c2f74a07f396..d7fef85b241c4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -91,6 +91,33 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_t entry = pfn_pte(pfn, prot);
+
+		entry = arch_make_huge_pte(entry, ilog2(size), 0);
+		set_huge_pte_at(&init_mm, addr, pte, entry, size);
+		return size;
+	}
+#endif
+	set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -119,19 +146,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-#endif
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		pfn += PFN_DOWN(size);
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
-- 
2.34.1


