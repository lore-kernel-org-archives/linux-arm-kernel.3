Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D827C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=; b=iUjkrc3yjz86XW1stKxup93LZo
	e8Fg3TnqcqO7n+/xXD1YOlCKLcfxgqnXDJLY/rNIbobt/tHuOzf2BuP8QFof+PH6dA92Z5qLRnpFi
	t4zAo/Wzy5p00RHCe8znEj9ur7wwszOg05EuzbWjhSXpP41GcpIca6OFYszHyYIu0JxpCuXviX9wE
	qXzDPARrSo9XcB9zgAQOPkzx85xXLd5/6ByfGWOe0JdBUsgU47SC9Bca+4Y0rKXbYJkk2D3TQDCH0
	Df745/wjj6jI3wJexWPLcaVG6Lf9n8SWlMfyQLO6Pyppbk1luQfMVB4XU21EliH1ySf2BN5zUnTxM
	KOflu8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blp-00000001oIq-1I39;
	Mon, 21 Sep 2026 11:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blf-00000001oGY-2eOG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=; b=T4CYzN1S3q6lDWBGSIbwqQMy1M
	3wdi2SWJUEmgvxv855+fkx5fTnA0/ctM16mXxr03l0QRfv+BsNeMQv+Dd9K8FwYVgCaS13AFwFPD9
	qXEW5VguTyCj/HGDWwI47yzih/TmQ33rj62MPljZ7yUC9om+psR8UWwVzZsHziiuTuvnIi9Es/+u6
	o21TVEurjSapC0tU2f97tiYfaNs0m299GqSoKVzPXXyOcH0m5mAQdvCcJYr7r80JDVs1ADxmL98yZ
	ZhR1LJx0IjPuE8GGNE3WChdcqSkkoia+j+hHoQqPMpSI0sCkCpqhJavR+D/nkbKlek51Q/bbTqK37
	cu3E7reQ==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8blc-0000000CA0O-0O2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:02 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so21327185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988458; x=1790593258; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=;
        b=bFrLfOZ2qOdPeIs6EynxmCOgzsWrPraYiUlrQjWfx1MPYpHuogZWytwN8aTEA+5iBZ
         GS4OKWDnjFJES2+HDYC6N6O0xX+Kxnln8YjWU0C5dkfRNifE3gui8pLqdih79tXy/CrQ
         k1bLv/8Ni1DKdC4CoupFb4WiEUsJpaHsCxSesR5ukscolCB4i0g/gy1ZCpUqPWxcjliA
         KaPMSN57BU+sbcnrpt/I/TOjw35OmNXUUBtIcNvB3vBz3fo2TJarriMQhssVbYylwreH
         jrguzayM7/nQMs11tc6IBSXH1O4czLeBDU8OdmeLqYY/BsvnxfRVRVFVI7oqXZFkdfqU
         td4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988458; x=1790593258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=;
        b=pbS/VT0ymWDu7HzKRhAbLMmu3qy7u2hBy/rIQVTmKjRTXEOIOdJ7jhegQfawXaHO3a
         6B+mkr4XMexaOKpGl5wHoJsxLh9ALggSwWYGRSsJZMPZO1klXT8C5YEwD3vyjBUtWYAP
         LAMe7a9wcfS4i5/GQlh3PzifAOwBxj7iJw68QhryCPhSpY7B9HuqR3jQNAbG/m6xwXp/
         FVdpf46kLVgMRWxyRYHTGW8b7fjGhZK6OCVTVndb8/GYnnyclxWvOIhxf+IZml/5cvNt
         Z9vsFN2f6nehDTMpjXRACicbKRIRI/WWAE/4odCiWnTc5fLhOB/VItB60N3si3vvMJv6
         tR0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5QfYRX2dQMbc2fvimSbeZ4uoeWRTBBAWVTDOv8hkFND8m2OdPibOgCvxF21RomeYUDLaxOSv5bE9HkIJXlPur@lists.infradead.org
X-Gm-Message-State: AFuF++n4tyYD3AeZx67frPtn7eKWDwqzZClBh+xIAq3y8X2B8jVsr+J6
	4SbjoQvO0V+RVup+rUev+UFbkPbCRnRgeiI4MTr/5zCU2AtO9ADP3b/a+GbVcDJBpJ0SSI+LSDU
	rzb94AJJ0NbeqdmbK9S+gFQ==
X-Received: from wmcn17-n2.prod.google.com ([2002:a05:600c:c0d1:20b0:49e:8399:b77d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b2a:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49fc5687df8mr141949475e9.5.1789988457579;
 Mon, 21 Sep 2026 04:00:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:43 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-2-vdonnefort@google.com>
Subject: [PATCH v2 1/8] memblock: Introduce MEMBLOCK_PTEMAP
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
X-CRM114-CacheID: sfid-20260921_120100_647384_EA337B24 
X-CRM114-Status: GOOD (  15.80  )
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

Keeping PTE-level mappings is interesting on some architectures as it
allows mapping/unmapping pages from the kernel direct map without the
risk of splitting blocks which, under the break-before-make rule, may
trigger page-faults the kernel can't handle.

However, mapping the entire direct map at PTE-level is costly. So
instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
a PTE-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/memblock.h | 18 ++++++++++++++++++
 mm/memblock.c            | 30 ++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index aa845f488327..13263055996d 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_PTEMAP: memory region to be mapped using PTE-level mapping
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_PTEMAP		= 0x100,/* PTE-level mapping */
 };
 
 /**
@@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_ptemap(phys_addr_t base, phys_addr_t size);
+int memblock_clear_ptemap(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -285,8 +289,16 @@ static inline bool memblock_is_mirror(struct memblock_region *m)
 	return m->flags & MEMBLOCK_MIRROR;
 }
 
+static inline void memblock_warn_invalid_map_flags(struct memblock_region *m)
+{
+	enum memblock_flags map_flags = MEMBLOCK_NOMAP | MEMBLOCK_PTEMAP;
+
+	WARN_ON_ONCE((m->flags & map_flags) == map_flags);
+}
+
 static inline bool memblock_is_nomap(struct memblock_region *m)
 {
+	memblock_warn_invalid_map_flags(m);
 	return m->flags & MEMBLOCK_NOMAP;
 }
 
@@ -305,6 +317,12 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_ptemap(struct memblock_region *m)
+{
+	memblock_warn_invalid_map_flags(m);
+	return m->flags & MEMBLOCK_PTEMAP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index ea0de4b5f356..8a87d4d2516d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,35 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_ptemap - Mark a memory region with flag MEMBLOCK_PTEMAP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * If supported by the architecture, such region is mapped using PTE-level
+ * mappings in the kernel direct map.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_PTEMAP);
+}
+
+/**
+ * memblock_clear_ptemap - Clear flag MEMBLOCK_PTEMAP for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_PTEMAP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2880,6 +2909,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_PTEMAP)] = "PTEMAP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.55.0.1082.g2b9226bbc0-goog


