Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1706ACCA46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=; b=y1b4eHeDz7118fm5DLUca3OsdW
	zyHZ3/NmZwx2JBUwm3ubwRvwc1A/wIzbbDnCWx6iFtY7k8He08b7CDkwtz/apb+DIG96vb6J/4Bnh
	rNv0Vz5pOSP7zPBVvMEMfhs51aYQsCgOm5bQozQf+u5+OGWXtJ/UJUoUxzQ2EExuJ0kx22Qwkk+7m
	WJ+PoMOrMXahzkHjAMeId6BTAntE+T/yYHDP+pnrJOCKQ3tB4fHx0ZRf4q5EqDn64EmLg0C531Ly6
	to6HBH5ANWwe0YzhW4SLmxb9fp1BNM5RH6bzEgSpoU5WdIr6bv84zTCgBrFMV7YUykijF3g4vPII/
	ollXUZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKt-00000001nxf-3k59;
	Fri, 16 Oct 2026 03:10:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKr-00000001num-2mAh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=; b=b+AJgC/gdAGR6cb5TtUDZTWk1H
	z+qXN5dVG4RhrARpAiF0xk5YvS//xsgNrmlnA9CtDb7jnJNQ9ENq6w0KcHo2LWzz/hPMy4Ij01Ose
	CFHGmQMwvjKZ/G111ESslgKmGfxm7ycmlIeaQu1VFQEgvvYLe1ydSJmbUodxyqz2br8IGfGMxlvRn
	W72tFJcZBF9dpujx72d1bWlNBV1yG0HkRhLjTdzbQj/ddCvuwyU4SAiyKpa3RFp9hreZ4Asd6LxpM
	cbme8nOJAY9lbiRpCd1sihjvNnUUcuwG5ef9d5QPwR9gDecrJ1zifUP9SYH1aF44T+GOHFjMc6Ori
	KHS0Dwzg==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYKo-0000000122c-0w8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:10:20 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1533521a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120216; x=1792725016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=Rfe/Cgo39rKLbBlm8VVm/HYyoIUiYPnScohWk1+r/QjnHf9fTa9+sknFL8bPR6V41D
         8xqTLlBZwi2uE6XwFXBG1AqgPVoS8c0bNDNdhhJqZ0pXUcMjrnFCHLo2+ZXzd840E1bV
         CeFvKKRgvTZUQ9Vi1VIjgt1j+7X71QQ7sG/LcS7b66rYGNMriMnzPXJfmQujUorSefM1
         dAvRX05uLj/5x2GcUVn6R5O+uW2x+b2R+5yA5a+cp8tOqptBUY1bvMw0PYTEwvu49z98
         wwYfcPrXMs9KF4ph03pFwjJ17KTecwAhDH6GvDde1QT5H0nBVEZGEGYr4f602UtjM3Qr
         xyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120216; x=1792725016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=kanKkFN6E8FzEXN9FZImZL9vuHF+0KmBHV1ADY+qbySZvhpnzSkcHVDIvJDSsYJ6Sp
         q1n1cleJoR72LqBLJDri/+ZFydx6pDEsxJFUzI83zQxpqaztRSM+GObMVR/egZFAJpkX
         eMI/q43hJGo82OgLQJaKGzneVBN7Ki/M5CU+K1wUUfixHv599ybqWk6MR0FCsvyBWo2e
         ILOOgvkFcTVi4HxDwOyYi9xuJjPYTZ2CBI+1d1pSm5K/1P2my0SYbWEkyiGz2YI9Vi6G
         2VFFyIaM0hxZnUWoddzv4s+USGLnYblrR5aT3F4zoq5hsDqLeDGhP3w3WFwEIJ9WiGmp
         2klA==
X-Forwarded-Encrypted: i=1; AKwUvBzJlPGQ2HKsmzBcATbRROpuHUNDBu06IZDVWYOlH/f/PCe/xVYQbIdZ24M2jt6u6DJlNWmOzTMpolgnrDgePUo+@lists.infradead.org
X-Gm-Message-State: AFq9FYIT/J8/Y7wyLoz8yjDTVLyVR0qse7hm7J20rE3KKS1uvBBazA+D
	gu0OFaPd+U2JGdmHQxFFqEzssEioUs2VPAJYPaRZd00CyM79i/bNzag7
X-Gm-Gg: AYBFou2jJv9j9/Kq3NtYaNu0a09gmVOSKXbRZr4MQGNJlia7Zi8U2pkatl2p+gRiy5i
	PWrWh8pr72nzorxRtUFMCwVuR6rEHGQ+cmnF5rl+IC0QfDQQEdVBTbzvOPT87/dbMbKtCoM8gM1
	C6jUM+B6qcdi0jAcfTF3EK3T0TsZTeeogFZ3ZvHgzdI+9hLRxDCo2V1JZKM1dZLiIFgNNwTds6R
	W3KUign7WqvafRmc4JVIUsA0W/C9GKY4wXZN8pwkwqg4JChXJNzoBCqNbQWAmlCYLJSNsxzId4i
	Rc3ZAlVboMeNEqN5l8CpzeVkRs8aoJALpz0dbUpYymN5hdYzViY6VyDzDTldXvb2/8LkeYvEDFi
	N6/lMGBjR/4Nl0zXs2EiU8kwk+o5JYFK7FTLCO5lnnquQO0/Fhw5LT2nPiq604fVxNDzdR6QMlD
	q+6YiNk1okkofcPnbWrWQSGnrCd4Jff80k4UXWlhR9IcMjqmvklyzIE/Ul412NunD9AY5x95kGy
	c0pEHfGbFk=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr21861671a91.0.1792120216184;
        Thu, 15 Oct 2026 20:10:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:15 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 11:08:52 +0800
Message-ID: <20261016030855.4062882-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_041019_028397_97FAA9BE 
X-CRM114-Status: GOOD (  14.92  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ea288cf21400..04fbdff2b808 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index cbb172fbf06a..31c89bd64036 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2880,6 +2895,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


