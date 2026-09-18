Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aOX9z3d/XK6ZHrErASZL6mYBZmtA4GVOMC24/C+YOg=; b=WLVYh4BFkdHRQ9Sx5gezUE4ixe
	BQJJvJqglWVMBaTiIwMDq5OXuoTJdeF1vUel5gfFmQ3Cm9O3K6ZlXnFv4TmX23U/ySvnjrqJOgdmw
	/qCtw7naAK0Z1/ySroLXvEpDPQhrr1uE96mG8+DN2HpkD9OUlKD60hpKYvPyQRBdB+Ci/95pwNOq+
	AIInNtUWeInY7nKEd3irmJfkuVBAaKEBvfOBCeQYJ0nWLXvDBoZMBtDpXKfd6OUHPZa8Wbh9YB4jB
	7XLlEU2iNIkDpr5SnzugZBiIPluoEUOPmPfzDinZfsyHUhY0vfCN1RCuf2LXGj6TcN9eAnsOBEBSn
	RSScsqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUi-0000000EUEu-0SJY;
	Fri, 18 Sep 2026 13:19:12 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUc-0000000EUBb-4BPk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:19:08 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so760213f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737544; x=1790342344; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aOX9z3d/XK6ZHrErASZL6mYBZmtA4GVOMC24/C+YOg=;
        b=VoCcklhDwo754KuDuK8e2yr45TJnyRuJxQhNBETWTltWwyTOlbErd8HU3jk7//XxmJ
         +EIh9bXcdgnfqMvlM7zKG+egrNEC2npChGUJagFcs39GBSFoRL0+1BMH6hOF/DEaTxC6
         Xs46Hj+Fsay63ObGgGxGKHnhD/VtH8B1xg1Rp8oqpeQmhtfBn3GT+50/v1As7g6EVANn
         o2uccVUHVqbB9zcS3lajz91A/incvZjSr3NjmqwF7CoY/OM1ABoZcqL6Ck4dJdD6sn7X
         iGk48QB6cpKo/BpapmqmLJGqw912BEl1ZtT5VB7nNuncqpxStysUwij/FXclprJ8AUeB
         JPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737544; x=1790342344;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aOX9z3d/XK6ZHrErASZL6mYBZmtA4GVOMC24/C+YOg=;
        b=uFDNR8CDo5bJBJMkIFuluxM/joBrDT4ZdtZWUfxtZ9s8hx/lLJxEL57NT3YAuoeYRt
         lJcoUYJjuA5kPGSXqH6/vjHJoWOrg/2IQNYAAnJs1HplyciTrcKEp2OlVQSlblZtUe1M
         AwRNZ0qei0vmKaB08SA1uOPe/jSHQxvf8aMWjUUwPHtf5YiS8yvZ6jpZdvnUn1u41qto
         nkifLhkNliwLBy+W076h8olvYk9A1+qz6Nfjenqa2z2xaGoCejPJZGll29/Hjfd4e7Lb
         XyTISa1Q0d3w+bG+j3ufATCe1tKDbYDUTcr74qpeBo9v4OevU7fFwQ8Na4gjZ/0p2iNZ
         /muA==
X-Forwarded-Encrypted: i=1; AKwUvBxuuQ3yutxks/vteVN7YlxIa1vbsuc+iVpx9xSUdpy4BKzT1MAi7JB0PBut03LmIzVDZmaNtCNbE9Omqd7kvE4d@lists.infradead.org
X-Gm-Message-State: AFuF++mO8VHdjpBpJetTbiOAv5+7zJuqzdwyBVaQ2ZYiqco6lJx2cIC1
	T4wthYEyY9ok/1LIVMdHkYXywRIovtGizP8vCZjr3PSSJupmZSYAgIXxsC+qs6ivfn8dVD+Eb+F
	QVy4Ans3+PIKaPWcpsS2cmA==
X-Received: from wrdf12.prod.google.com ([2002:a5d:58ec:0:b0:487:11c9:7de9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2884:b0:487:360:5be1 with SMTP id ffacd0b85a97d-4871e2112femr3684285f8f.8.1789737544221;
 Fri, 18 Sep 2026 06:19:04 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:55 +0100
In-Reply-To: <20260918131656.3710047-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260918131656.3710047-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-4-vdonnefort@google.com>
Subject: [PATCH v1 3/4] arm64: mm: Introduce linear_map_needs_set() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061907_060431_6CD2B2F5 
X-CRM114-Status: GOOD (  16.05  )
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

can_set_direct_map() is intended as an external query function, but is
also being called internally by map_mem() to initialise
linear_map_requires_bbml3, duplicating the feature checks already
present in force_pte_mapping().

Factor the list of features that require modifying linear map attributes
into a shared helper linear_map_needs_set().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/mmu.h |  1 +
 arch/arm64/mm/mmu.c          | 22 ++++++++++++++++++++--
 arch/arm64/mm/pageattr.c     | 12 +-----------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..12ed21e2d0d7 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -70,6 +70,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 			       pgprot_t prot, bool page_mappings_only);
 extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
+extern bool linear_map_needs_set(void);
 extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
 extern void linear_map_maybe_split_to_ptes(void);
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..c18ed601f0a8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -776,6 +776,24 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	return ret;
 }
 
+/*
+ * True if the linear map needs to be modified for one of the following
+ * features:
+ *
+ * rodata_full and DEBUG_PAGEALLOC need to protect/unprotect pages in
+ * the linear map.
+ *
+ * KFENCE pool needs to protect/unprotect pages in the linear map if
+ * initialized late.
+ *
+ * Realms need to mark pages shared/protected in the linear map.
+ */
+bool linear_map_needs_set(void)
+{
+	return rodata_full || debug_pagealloc_enabled() ||
+	       arm64_kfence_can_set_direct_map() || is_realm_world();
+}
+
 static inline bool force_pte_mapping(void)
 {
 	const bool bbml3 = system_capabilities_finalized() ?
@@ -785,7 +803,7 @@ static inline bool force_pte_mapping(void)
 		return true;
 	if (bbml3)
 		return false;
-	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
+	return linear_map_needs_set();
 }
 
 static DEFINE_MUTEX(pgtable_split_lock);
@@ -1203,7 +1221,7 @@ static void __init map_mem(void)
 
 	arm64_kfence_map_pool();
 
-	linear_map_requires_bbml3 = !force_pte_mapping() && can_set_direct_map();
+	linear_map_requires_bbml3 = !force_pte_mapping() && linear_map_needs_set();
 
 	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..c1ba74eb602f 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -89,17 +89,7 @@ bool rodata_full __ro_after_init = true;
 
 bool can_set_direct_map(void)
 {
-	/*
-	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
-	 * map to be mapped at page granularity, so that it is possible to
-	 * protect/unprotect single pages.
-	 *
-	 * KFENCE pool requires page-granular mapping if initialized late.
-	 *
-	 * Realms need to make pages shared/protected at page granularity.
-	 */
-	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+	return linear_map_needs_set();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,
-- 
2.55.0.1082.g2b9226bbc0-goog


