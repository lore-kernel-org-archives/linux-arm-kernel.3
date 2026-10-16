Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93797CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=; b=EnKWx766YPwp5KN+jkVCa9BvjW
	FXuIVFfgvwbmVGuKrnghVdMDvIQEQc4kFNn4uMMNE4/7LU6W1KnePP184HvrP6GbeOyA7vdGG8qlB
	rzTyJd6qWpJ7nSiqzIQG38SRU/wAwgTMdrEDlqbndwmFGnBfDyzoTuPk6c4o29S0iPygNLUA/Je2/
	Ok5NxJMX3WP7bys3JnJQVQU6tHDwthKLqDCPE7h62eVN7t2bIBLYEa15WpSRUoEc8lrqZu4u0t5Wr
	wnuRIZzXNDcb3LP12uog/+HkI9FBS7TAZykxUwFULKk28LN8CUzYc1ILxgffYWy2KwLFaLehz0HqE
	p8N2pqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFl-000000025lE-2EhJ;
	Fri, 16 Oct 2026 06:17:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFj-000000025k1-3yms
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=; b=TAs1UMMe1TiqzPb3HrM0S5biqj
	d+PoLCuaPQGhYTUVkvW90kqc+G0eWGO7SCn+qXNGHmtzXVcaT+B1RzljFL0svNykqBfn9yAQHTncK
	cAtKzeLydpu0lgnTnofM9JpvlLaouDQ6ERc9WdN/jDriDXdsKpOVZwk4uKz4IFxzdZz2QoEADNea2
	nRRP8B7GSbrmOPj88D1qbj0dyUpH7WTgyqrJ0mqZr/UmIO+r27FqKU2RDqPu6POlQd6DUxlQ47V5v
	r/qzWbnWB1Id80U2XAep1BioTVxgqCEnFOwogDd/K+O8JVpaIORii2Zh8zUuG0kPNGYYpTPZqugD9
	witmDVcA==;
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbFe-000000019kI-2i1Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:14 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc7c6cc3513so836491a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131428; x=1792736228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=ohCoCgev0VPrJXecYrxgiGsymU607TGDkl67uyO8CYmBdm7Rzy2WqWyqjtJazBWPfq
         2RfA+U4EDA+LVyKBtY3JhBVtL4Qryx8cmdHsNExTiR+jxnvPnkG6j/j/dZRxaN5+b6aN
         JPl+RhkvG5GDTi784+D5NMiaIsR4+M5KfRjvX6xOwQeK1nd0yptxt1ad7vHMudI4qJ0r
         rYwCHvhM4vakMu3+pTnLZ+14Sudc3TBsVMKIN6GnwVuPcIzjEsf0Y5N2axcToIeOU9YX
         a7FV281MYcef7SofzEnCucw18QQhBmvK98kQJX7EXpGC5JpUjMaGr+5d0BVgr8+Ua7UV
         QjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131428; x=1792736228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=UbJ1/VIeL669m1/oKmCAQhpikra4eRHhB6D9ah/n8deTNftvcjsOQ0oT0i6TthwhqA
         PnWU002+ngrrV6NY0/NvO6OLZjQdMFdxoXCzo5xsWagpkVmlkrmX/K+BBYlFWZuCDDHE
         uWj4n1X5n2G5RZW1n7SS/MczPIWHNPXu4q7Ppm0Gr2Fg9UXa+SqK0CQmgNGWX4vS+l3M
         foyh8t0GlkCjEnreDbYROPhrxLpvf2xEX/yMfRLaJyamT/taeD1XNK56UQWlAaJaeyRk
         2wP618PxCe6/A5Nz242IslA/3sl1FzB1xdrrYk9RuMSlULbHJCeQDqwTA7NEEVrCu4nu
         CWxw==
X-Forwarded-Encrypted: i=1; AKwUvBxC6PbzUuHJdPLUCEyOM0Kgf3+elHuvk5HrUtd2m/KsZrafBCJ1UPN8wPJFlRPs1jgecg83B12ccuotDytglzCg@lists.infradead.org
X-Gm-Message-State: AFq9FYKjgl4uSKbQWAjMTrB3vin17VvplREwIkKgG/HOid6ARrV3fBmn
	+v1DzjZvS7jis0ZEF1SnDRyrJnQQMU4pWE6xHx//95E7NBW+gM9wTU95
X-Gm-Gg: AYBFou1wgKrmzFo8Ke8pERkB9p9Oa9fgZWPuaILsXHQp4IVVFXDNFJYku0/BgZ9z8lR
	ZExaJI7I4l5lNmnyMLAmtus81YhpwdwMpvw9hoWiExjULWFaI8NJ6vgj1ZnMzOpmUj2mB/7M3+k
	i1Awd7LkHGnfSVkr5XNksqnNf2P3RCO5OnYSSSqjiuxvN0cEG+OpIwThD/1dM+xgKWPa5/9ZZ/n
	4num//lxoO4bAhKf93zZpNpVBGwkf8y0hGKOG4hUL0jHYS9fk67NUhen5JCp6KubJ75ftpjfw96
	zKE7uKSg/0d/GC3nNjKBEnlS6F82d16i5Ol6u+XSqaL0zW1oMOXZfK5PIH54uCbVFg1ycnUgTCQ
	d8rCmObhDKqfcXMlOhqsKi04W7czgwR03+eKH3Se/q3FWIaDg9pSI+mlAUZ+Ba8NdRF0BUwkZW4
	VqiZHyS6ex8wDzVqjOZQGi4bzAkf1fMfg6JWzBupH64eYM7wLKEMk8ykQHrMQqnX1scP88sf4et
	k7ZC/+w1jM=
X-Received: by 2002:a05:6a00:3404:b0:881:4b47:f31a with SMTP id d2e1a72fcca58-897c6539ee1mr20053354b3a.11.1792131428281;
        Thu, 15 Oct 2026 23:17:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:07 -0700 (PDT)
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
Subject: [RESEND PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 14:15:46 +0800
Message-ID: <20261016061549.4181390-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071711_073776_E4CA7CAA 
X-CRM114-Status: GOOD (  14.85  )
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


