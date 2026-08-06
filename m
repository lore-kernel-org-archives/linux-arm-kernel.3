Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A64C5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=; b=t5bDN+5YhoAxeT66Vqf+oLVcqS
	QyasZPpBWzc7cV7PB7qOpkK+IwZOQkYL4/+uzzNQRb5ff0mp+wOSRWQs7WcnZ4qDJKKnpX0eIlKoa
	BQHGT9lEe2t6CqIf7zqd7WwkLQ3mrnjP68ZKKyyggiwvEZ6HZQEKajMpcrpIPM8cLdyYZnR8Ehiaj
	DvoUjjFX7zT6oMTi01ss/5lwrbHZKY/a0kUStWtULJX0M9ITRC4JfGA0KbZKKqQYip0rn+N93dAS3
	sh9sMvwT6Jf9BpaWL9ptX5dCJPreYQ+ELnWFacqrWRyRumKMXEVLBgJ1dq5sMkm5z2iv22B6u2v0z
	hpPVpy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWa-00000005Q3x-3sbA;
	Thu, 06 Aug 2026 09:36:28 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWW-00000005PyH-4Ar2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:27 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-84847482584so559665b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008984; x=1786613784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=jOoiRaXmpKO068h2SB529JWPNPqLGn3Mk2afl5DZpWW1o0o7195tf6jU1rfJD7J2em
         7BEiv1kXyor/hbvxH3CoxBRt2zMc7oB7QTOvsTfDL/ST8msJwlizQ30nhRtUE/wichC6
         f3XTEJh5B3GZKvK7STzkPuF8E3jEpoZSP2cLnG1UQ9CkkpHIQogQSoCAexMIbOi5XI71
         iC7GN1WxeF7FUNxDLyLVZAgqPLm/uyrrC/0nv2AArBHsnRIlJMCwW/TvjRqAulK3xLXi
         wZBq0OVczeaXTtxR/aEcMuw9COF9hRKkQLRL38ArE2//VCfqxQoy4cGdYPGnhNnHlYK4
         /FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008984; x=1786613784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=mJFREJODw2Ys+h6bpyDPhIGHMw5yE3YsYxMdoYpXsRFHdwQUBuU7EBzBroxsneLgB4
         3P7m7bJ5OT4imji7PSC1JgVQOkzFzfQcxTaTacwGns6IfEKDXXUSpqw7SpPkSprt1IAb
         w1Q6GNP30zboXPUy+5UaniGLiuT1CM3a9qAaFLeEyA9HQPQyDQOEmTI6Exs+GEI55402
         5verL8+AlaTe8pTzazBogPZQSPV1q8Vs9Ek9ehJTNViHXBhvxNi1+D/VstBWATDe7Gl7
         RbuRnmy3TvzmyKAz/4DFtAN0VHmoFy39l5DcGYVQNETW+JH8y5sEnQNWsiwlvCdoTemW
         iREA==
X-Forwarded-Encrypted: i=1; AHgh+RpCPKZxz08x/yT4EigUDp0Z2TNB5L4R+1htOO1SF0AxXiA7qdKKvAF7t5DqOqUl38h/MuZ2W6RbYF6QWuXCRLdS@lists.infradead.org
X-Gm-Message-State: AOJu0YytW+dfRo+1+rTCLj3PgyQXOWZ+KPra8BXnm85EIffEyMUZyLjw
	gkMexHaPLobusHpJ6d3WkTBf4lEPoZjshz050hohaEFwekM7HfIQkwbR
X-Gm-Gg: AR+sD13Q/rSj1Ljyx1KkGuk+uRgxJ7OquZZKF4jfcfCIPpMg6jg7oQwHU7g2ulx+Xv9
	225Wi0HRcigXrG2zchO1wCpMB014iACOR/xAelnZdX3gvRmLTgseje2pyjZbvbr3OtQ9ihUDFkG
	Ss2GPrgnE8bxnvBfaCnZKvyJF8KJRMTf8/LZsws7GLix5Wo2BdkSTqgn+y/lJO+1eeM3vIgJV/n
	Yw17iDYzlTrUSbrHeVn44OwqKH/62MMZbX96e2QoC/0joiORfgHwHTPMJhe2ZyYJVGBnonQaqzk
	uBmv/wwxYg1BD7RJjtNpXRFGu+vVGVmHOZ8eLzjCYfAAXuXbkHmDY4SDB/WAHBiKNZw4cgSo0E7
	xpCm32J3g150dvsCBfZqb5WhTc7DIf2BmbqyF8DVK59ZH0BGcckQJY24/d51PJnVrWeGWj8G4wf
	WWvcyIK6Y/VUoIH6vUYOhqbyA/0Wm4gVC7LkMmqdMt4nmvykf1lO0Q8iHUfqxLhij/1T9n8y/W4
	A==
X-Received: by 2002:a05:6a00:f8a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f41df42ccmr6551184b3a.9.1786008984000;
        Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:23 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 4/8] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:15 +0800
Message-ID: <20260806093519.2907771-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023625_046101_49D99AC5 
X-CRM114-Status: GOOD (  16.94  )
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  2 ++
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..2aa888997e9b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,8 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 
+	fdt_mark_memreserve_nodump();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..667ce9e46aab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f38d11df6f15..f0683b5d77b3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,38 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable && base < rmem->base + rmem->size &&
+			    rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0


