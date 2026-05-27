Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE58CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrSylNUfVMz9fGhknfQmD+9F4TfLhiOlPkwxJFsVly8=; b=ZFSBA2CcgaJdkGijK/jEGB9M9D
	vcn2sNbwyTz4ccG/kJPWdvYnvokj7rycIBwDDzBlekdcx+5nSUe77kcy9ae1YDVncmrobO51y55GP
	Kd/1gokMWYOvUS766zHg/cr0hBeLRN5CEbVMTIHbjD50NTiZaWcI7t0Uo9xDlrdwshvXdYh69IRev
	68SmA8hhNVuXS0xvQXThRxFAPb6OR0fBMKPYc2xwJvqXUI+Jz8uSmM91PA06uTs7oenO74t6i5jmu
	eb1mFP3AOKpJd2/4AF7IUHDtDSt3xa60PnmoDpBDqGBa+BgFuuPRUwf5pSiizi4yZaSBfzEQ5zbAZ
	4v16Y6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4z5-00000003FhS-0RUv;
	Wed, 27 May 2026 03:31:07 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4z0-00000003Fci-3YXX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:31:05 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so5625371b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852662; x=1780457462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrSylNUfVMz9fGhknfQmD+9F4TfLhiOlPkwxJFsVly8=;
        b=nxPcgQ8oJOQcf27vLO2kH1+W7vmwjlB1JMpnSPG4JLll7iPRYjUh6fCIwaf47qus8B
         C1jGtShK6ooEl4PMSsw9RXs0nhlr1KVOTQ4gosp9vdJCvAhhWu/TcG3deMQKUXK41C83
         +SGT95Eg4w5vQq/ABZCkEVJ6s9rutCCCmBf2GfRXUv4/FTSajieGLG0iZuEnNKKLhduH
         DVtfXXLfeaLihzpQNT6slvTmNiU6WGLAWGjnYhhgsun2Pbp4nwiEECaZ5auxyOjP9/3u
         3nSk0/MtnjyrLt883cTqFfVqeS/EzAav4uNWXQNxS6MjGuYQCXhTgcbn8qmuqHLWsCYp
         ZE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852662; x=1780457462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrSylNUfVMz9fGhknfQmD+9F4TfLhiOlPkwxJFsVly8=;
        b=bm1tAiN+2+pNhU3MJIcZuqMmXBpj+uMiesKf6bv9+ZLF/RvGnRgdacr7Ezt50YxgGP
         0+bCR1tWqhwbsuhG0RlgeQup40mic4cWLd5wzvs2ob46oMr26WOH6o8t8e98howxSh/l
         jppXN+HDFeL5ZJLt4EydNiT3078LadQHsrFeWLWXDkr9mACZ/9l9K+2OHMsPH/NrPTT5
         IN3WAxTj6yPM69MUiDwJSlxA4v63hDzL7rQdtbcbHyQBu2gb9MJUxzFk+aaMH39XIZbu
         PamAd3cYu4My2Yf6L9FBcCNj8uLAcU3e2lrLIHvs5lqIgTb7YiBhQawQRFa5h6H6Ugu4
         6AGw==
X-Gm-Message-State: AOJu0YxOdGH6U5kSTnI16hUD6Rkj1q1LcZOiQI2G2+cmlkCQ2TJ8213f
	rEKYLdd3eOfjQYV4G/ifu22c4REZSoxdBkylFg39+5xg8VkVSc3yNadFmZI+kv1YF6B/WA==
X-Gm-Gg: Acq92OFmHfhCIpHKVCVUDEb2/a1gKXg9KZq31CKTfsz4cp+RO+S2BEDdgmFH8til9Nj
	ii/DNdcB2JzCnLBsBO4LRH4gqwT/fmoFBZCfGpbP8sliI4ETBkRnTYMBGyIt4Jq0jGNOiWtKBvz
	ilIlHO5cLCJxKhKlNnPK54n9TrnimEtJGL/LjQs4ZS+uMZYtcwrV9IukBUmc0cTSWKD7VXfVkWd
	w8Pq1sjDSP+SnEz8woJKtdYQbgIPPTV2aq5PapMcsN9QJ50Ajw7SpRnyFXa1Yo497wTjB4mpjR/
	GkfT3cHxzeIBeVkMB4prsarTh1Jm67KuwH2wV2IqYGklaUCpzOH46uF7qa1lMo1XvUhVk0s8GHV
	Az27Bvjcqbkjh8QJbjEIFRoDRDdEPE99JXTFl7R5WUK7mHdlnJa7Od4EAmCbT+958uVOn2Q2kXI
	eHEggH6nbqs+BfRhmqZivMrkYB5RvQDIp1PqK+ThWJAj8D3OU=
X-Received: by 2002:a05:6a00:13a6:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-8415f31db44mr19548057b3a.11.1779852662047;
        Tue, 26 May 2026 20:31:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:01 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 08/11] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Wed, 27 May 2026 11:29:14 +0800
Message-ID: <20260527032917.3385849-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203102_900977_ED90C914 
X-CRM114-Status: GOOD (  15.76  )
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

Add two helpers to exclude non-dumpable regions for arch-specific
code.

 - of_reserved_mem_kdump_nr_ranges() returns the count of regions
   that are not dumpable. Each excluded region may split an existing
   crash_mem range into two, so callers use this to calculate
   crash_mem allocation size.

 - of_reserved_mem_kdump_exclude() walks reserved_mem[] and calls
   crash_exclude_mem_range() for every non-dumpable region.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 34 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 5e27f9403786..1d9aa332325b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -858,6 +859,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/*
+ * Count non-dumpable reserved regions. Excluding each one may split a
+ * crash_mem range in two, callers use this to size the allocation.
+ */
+unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].size && !reserved_mem[i].dumpable)
+			n++;
+	return n;
+}
+
+/* Exclude non-dumpable reserved regions from @cmem. */
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->size || r->dumpable)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 55a67cee41ea..70db99f1fbff 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -48,6 +49,9 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+unsigned int of_reserved_mem_kdump_nr_ranges(void);
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -92,6 +96,16 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	return 0;
+}
+
+static inline int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.43.0


