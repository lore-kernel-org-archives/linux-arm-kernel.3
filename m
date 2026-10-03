Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A49CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTGwDHpLhUzAsXa7WFBlG6P/g0gt4zDPf57eK2yB0Jg=; b=3Om33mKHuO81/E2tYBABbz8yCd
	EUiuW5WRcacMRXo9zMH+Hh84i9NQGkvG2gmUBmUHqDZamhV5Jec01lG1y9yuMqrsJamn620aer1nk
	tK/pYoiu3/0AnunLhcFv6sdIlBKpiIlNzyG7pTqoam3vFCzaL7i8sfZDNOzb1KHKaynFlXofZTpIJ
	XdrsFVyHHxJ9vGGlPCp76+rJjkk4q//di0pJoDzRHBFHKnUIrAiVouOVqBThEkhe9WDQjkCmHHwz6
	MoVvBaiRpj2J0ehR+7ZbkU8WnT8MtP/WTIoSBaXmxIW88KUIZoLW6tJ9o+to2PxQhHqvMxq81TYoW
	AEs0k3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVg-0000000CnIY-0pgI;
	Sat, 03 Oct 2026 00:21:52 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVZ-0000000Cn7F-04b2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-ca8aee88725so61655a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986904; x=1791591704; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTGwDHpLhUzAsXa7WFBlG6P/g0gt4zDPf57eK2yB0Jg=;
        b=j59ZDcd+3XkZqdC1UAMhcJCUjVnDOHGBk25OYz2jH58sNG50YKrf4AGcHCg15ex3HM
         pa40oFzIB6WvydnxNJwI18GmVxzqD/AmCS6eyqo0kt2v69GfADIoST3mUMU6IA6STrdu
         d33/PtfKdgYrdAdoKqIdPD/jl8Fj1zUKF/oOMDztD/Nyr2L95kT5iQ61q6J2Q9j4io7F
         9bp9eK5F3P8FtL478piWuUslBT+Rhq51+1BzY3lp37Odo7Xa8OH918Du7jkMZnPGWmBy
         VUxjg4i0WSu3O6C6FWAniKhSPTmc/oRsgybW3CBvwDxIE6qOYe0+6IWKl/v9jvaB9Zun
         k/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986904; x=1791591704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTGwDHpLhUzAsXa7WFBlG6P/g0gt4zDPf57eK2yB0Jg=;
        b=JxoRIQBcCZDS535FMtj3XfPvBanhQSNN7JUNISHrk/Pv51lCmFWe8ddp4+p2JGS24K
         DLH1bUS2daYI0OcfZ63rkgKvE5hBRzFw7lcLbd0TB+e+om8mvCkW62gLKaUywK89KLVu
         1ScfrQK95PdS2vVW0lxsR/2icvtcD2Cgb3UV8rVF/+yF8P30wIS3HWCyZbTFxJoAdZpc
         FHwJnJTZz63JiYIXS1h9YwdAitBYiQPgcLOxodubEtl7tCVHSzRnVSwqsyAtzHjpcfRF
         FTcIH0oJQA/YFmBI3Lukobi6Z57M+Ri6Vs6/OOvntSDm9Y9tSZvM0ghybkmtvxvD0INw
         KlrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQW6GwUwH7V+7BpFxUQCO3Mh3+A7d3JdQjooLO8SXtOJYZyqs8i7Nqjr+ODsanRCdv1CMWtjKSrfvEzL3Mp5RY@lists.infradead.org
X-Gm-Message-State: AFuF++nIGBwwQbK5CG5X65UVUAcn7a5W8of0y5p2JcXLFnQa5g0qR+Vk
	2G1YOsh8KK5b5GdzlOem7dtYcMI0rafZMmVkdEvwreihrfY3YoLlMhi3BapAmc/5AzULkyK1Qj1
	+zN7QJwGHQEkE3EfxA6FpZw==
X-Received: from pgaa6-n2.prod.google.com ([2002:a05:6a02:6486:20b0:cca:bb35:aa9c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7103:b0:3dd:a006:7b3b with SMTP id adf61e73a8af0-3e0bd4133a8mr4176550637.58.1790986903290;
 Fri, 02 Oct 2026 17:21:43 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:13 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-11-jthoughton@google.com>
Subject: [PATCH v2 10/20] hugetlb_vmemmap: Expose whether HVO is enabled to
 architecture code
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
X-CRM114-CacheID: sfid-20261002_172145_076107_3DB2A0C4 
X-CRM114-Status: GOOD (  14.99  )
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

Architectures that select CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
may configure the system at boot depending on whether HVO is enabled,
e.g. arm64 requires all CPUs to support hardware access flag updates
only if HVO is enabled.

Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
declared before <asm/hugetlb.h> is included, so that it can also be used
from inline helpers there.

It only reflects the hugetlb_free_vmemmap= kernel command line parameter
(and the sysctl, when writable), not whether the architecture supports
HVO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/hugetlb.h |  9 +++++++++
 mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5029c7241863..1ef73b5da664 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -22,6 +22,15 @@ struct node;
 
 void free_huge_folio(struct folio *folio);
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+bool hugetlb_vmemmap_optimize_enabled(void);
+#else
+static inline bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/pagemap.h>
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index de4148a8aabf..c1c736dd08b9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -448,6 +448,24 @@ static int __init hugetlb_vmemmap_optimize_param(char *buf)
 }
 early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
 
+/**
+ * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
+ *
+ * This only reflects the hugetlb_free_vmemmap= kernel command line parameter
+ * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the architecture
+ * supports HVO (see arch_hugetlb_vmemmap_optimization_supported()).
+ *
+ * The value is final once early parameters have been parsed only if the
+ * architecture selects CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT;
+ * otherwise it may change at any time through the sysctl.
+ *
+ * Return: true if HVO is enabled.
+ */
+bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return READ_ONCE(vmemmap_optimize_enabled);
+}
+
 static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


