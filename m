Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15228CA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qp+JasK82C1RW+o2wrGx0jSXA4z4FWd0AFKo27jNBek=; b=tAUDaPbC3d+H5oM0bGRsNtOJds
	+ad6WUNIM/LCltf6iyPrwAplDgm1ezFx0KxEVtEvNwqzVAckG3Njb+VUpSfrfYljA7GlWx6IPRnsE
	SNy3pcu9594NWvYlIzufL2uOMZxoQUKSH+n4C+YnvdXU3a09Bisf8Y65+mNbX8F1kEJK/lr4zoWJx
	g/vlvV/ziA8hrnmD/StG651oSQ/o7BAyD6UG50GJeHUK4mQSmFL9J1bDpsbe/E7iRpGMgQtj5pIbj
	IiSpuPi2WlJLekl2dzW1bSVfZMKyi3TFfo9q4LbRi4BtHwFRPKuHU/IkNLcnE78/G96AcWMKG3LIk
	iPIXuwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVx-0000000CnjP-2erv;
	Sat, 03 Oct 2026 00:22:09 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVj-0000000CnJR-1QNk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:57 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2df375fb9b2so7435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986912; x=1791591712; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qp+JasK82C1RW+o2wrGx0jSXA4z4FWd0AFKo27jNBek=;
        b=Z6D9Ol7k7lUrafISy+zGdVnyBf70bf+zupNSBgj/w6TG0jky+d7hOFy/Fpio53joba
         WYP+yMj2Pvrmq+TN2sy55UXW9n/NgY/KLEK16UqeXTmAEu4MK9V9HqmycPPSx+VCge/6
         orv5we5clNf9swmwqXcegGUtEAuVA81Uj8/BQT5tVqxnbvXwtdyfAbInY/fiBDK//DVR
         Qj1BkmcfGgZecNfZ+BMGVFtTyP6qcr6HlOjXfzO7cnWYpMZPxxLond4VeYq6YATv5UdR
         RLymH7lguJVvatG+2N7XKAs7jEK9ezR0P8U6ndCxRnwo2jS4CS6uU6pRpSDGGdptpDIX
         HDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986912; x=1791591712;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp+JasK82C1RW+o2wrGx0jSXA4z4FWd0AFKo27jNBek=;
        b=JDiaINHobVBu+NGaFM17bbS9AieZz4m7ygucyisUK2/nfwx8qKZPvPRZeiVZpmx7Iv
         dz6s6ihH3T8l8qsD2IXMwApwoVWAKN3Fa8d59MlgO271FPWyX4Cjpazm8ABUlmoNHUcj
         PngsvXcQB0yrWcXuRolZTe9KjO5f9nnYZRDbNfp+P+uExsOSrqjlq8TCDFCxxClJsTFu
         W4+aqq8ucuoA56AGuRXsNRhYcWhhupPKFlXnETF8Rza5ORDxrXq8KTpVUJDrrCUtM2IP
         0/E7eAA1tA6zu60TkY9rQxVx0vr5yB9YnuumoJgAyhJKE1zOFrj+04hASoDq6Saqdl4U
         Fl3w==
X-Forwarded-Encrypted: i=1; AKwUvBykO+cfJI+rht+TkQC98ypbE4V7N1vO5OBUDG3YAtE3DeWfGWpwfXpEkCORRhVxm74JNLIL6O5ZPxEZAewITYNo@lists.infradead.org
X-Gm-Message-State: AFq9FYKE28H7K5EukDebysoVwWZ1RmdwkZa4O7XdKtqmrZ60w4c1oRKo
	OPJetHit7EoOwGNC37EuftpATsod+BGftf5+FU3OQBkGSqCYosGDYktPWgRpXQitN16MCpKolN7
	d0cVIHWElgXLJn5soSvnP5g==
X-Received: from plpv6.prod.google.com ([2002:a17:902:9a06:b0:2df:660d:f283])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:37c6:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2e49b4e29edmr36276715ad.13.1790986911618;
 Fri, 02 Oct 2026 17:21:51 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:22 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-20-jthoughton@google.com>
Subject: [PATCH v2 19/20 DO-NOT-MERGE] hugetlb_vmemmap: Add fault injection
 for in-place vmemmap PMD splits
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172155_789770_798D4CE0 
X-CRM114-Status: GOOD (  18.00  )
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

Like try_update_vmemmap_pte(), try_populate_vmemmap_pmd() may fail,
e.g. on arm64 when replacing the block mapping keeps racing with
hardware access flag updates. HVO handles such failures by not
optimizing the folio.

Add a fault-injection capability, fail_hugetlb_vmemmap_pmd, alongside
fail_hugetlb_vmemmap_pte. When a fault is injected, the PMD split fails
with -EAGAIN without touching the page tables.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pmd= boot option. Since vmemmap PMDs are only split
once, the boot option is the most effective way to exercise this path.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../fault-injection/fault-injection.rst       |  8 +++++---
 lib/Kconfig.debug                             |  4 ++--
 mm/hugetlb_vmemmap.c                          | 20 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 403206645fa4..5cfabea811da 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,10 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
-- fail_hugetlb_vmemmap_pte
+- fail_hugetlb_vmemmap_pte, fail_hugetlb_vmemmap_pmd
 
-  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
-  optimization. (try_update_vmemmap_pte())
+  injects failures of the in-place vmemmap PTE remaps and PMD splits done by
+  HugeTLB vmemmap optimization. (try_update_vmemmap_pte(),
+  try_populate_vmemmap_pmd())
 
 - fail_usercopy
 
@@ -269,6 +270,7 @@ use the boot option::
 	failslab=
 	fail_page_alloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 96cd1f1da94a..7abda377c737 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2072,8 +2072,8 @@ config FAIL_HUGETLB_VMEMMAP
 	help
 	  Provide fault-injection capability for the in-place vmemmap page
 	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
-	  try_update_vmemmap_pte(). This exercises the rollback and
-	  partially-optimized folio paths.
+	  try_update_vmemmap_pte() and try_populate_vmemmap_pmd(). This
+	  exercises the rollback and partially-optimized folio paths.
 
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9e0f52474bdb..f50880dd79a2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -53,6 +53,7 @@ struct vmemmap_remap_walk {
 
 #ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
 static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pmd);
 
 static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 {
@@ -60,11 +61,19 @@ static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 }
 __setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
 
+static int __init setup_fail_hugetlb_vmemmap_pmd(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pmd, str);
+}
+__setup("fail_hugetlb_vmemmap_pmd=", setup_fail_hugetlb_vmemmap_pmd);
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 static int __init fail_hugetlb_vmemmap_debugfs(void)
 {
 	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
 				  &fail_hugetlb_vmemmap_pte);
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pmd", NULL,
+				  &fail_hugetlb_vmemmap_pmd);
 	return 0;
 }
 late_initcall(fail_hugetlb_vmemmap_debugfs);
@@ -80,8 +89,17 @@ static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
 		return -EAGAIN;
 	return try_update_vmemmap_pte(addr, ptep, pte);
 }
+
+static int hvo_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+				    pte_t *pgtable)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pmd, PMD_SIZE))
+		return -EAGAIN;
+	return try_populate_vmemmap_pmd(addr, pmdp, pgtable);
+}
 #else
 #define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#define hvo_populate_vmemmap_pmd	try_populate_vmemmap_pmd
 #endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
 
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
@@ -113,7 +131,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 	if (likely(pmd_leaf(*pmd))) {
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
-		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		ret = hvo_populate_vmemmap_pmd(start, pmd, pgtable);
 		if (ret)
 			goto free;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


