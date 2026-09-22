Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F90C98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=; b=4MDK06/s2Q606Wd6boeqcukdGa
	ALf+MP7g6Uy181V4A+MJ01Kz8boOJXCB+3b+t9XVkKLtORt1PPsUkiW1tg8zzbOP7f4S1LrqDRm1d
	HH+8OynsLZhhIvKY3sX4dtD9Kr8QMtEvflAA6aJHQzP3XGFYuT4AlgXbZ9qpouuovoGpGV06Nx+YG
	pf65RNHtrHsQDRbDJ3v23EehkBHto8hKq9a5u4zehE6+jPd11gfMn6rAqpYx+4YbBNijacMFSmSVH
	CMKM2U/iCtVivFLlubl2xH6JI00Vnr+Y7FzkeyCf65wbQqBtaljuo6VEkrkHVKhoFLzA7Xj56TAaY
	sst9w2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7f-00000004k3B-24JP;
	Tue, 22 Sep 2026 08:45:08 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7P-00000004jmx-0jhI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:52 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e249c766bso1633161a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066690; x=1790671490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=RrpOP3wMwE/gvQ2ht8MVLIUCSMhHzDLRcobIWuhHbY0dc5xj12yCo0CzGmdKzQaSzi
         pVv03e2loFdIBl2ChBiEZn7PP7iqPLqTHH0f9+AFubeSZZXYn/UsCxqxh9DEoMc9+olS
         octJfxhUf/Wp8TJHid3bVLr/fjGz5vZQ3aSvWOUINl/AKG/HvVjFPW1vqvvqHMCclfn1
         kIXJG9OqJA536V0Vv8qwYW2xqZ0JFUExpFnlYZmzrF8Z2cBOXc2aeKWK3qPVJJ0tsuOn
         TUrAzN6SJW99EEIRi8zrw/4wo5Sm8XlK+ZmIGkEORkXaUc86uZtntumo1DCLqhFMphRz
         GuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066690; x=1790671490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=VGKzLwZNPUaLj31NuN3/PoN3JZjGExmco+rvj/rP/iidEPn8paTGTcdby3oTDaxanv
         Z00w2ECR3Vg+Wvc8js9ddGUgkCNGQk0laGk8y8gzXNpQAdyeBQZPQrkfnw2xMaPYV2IW
         7x3m//9CqqYkS5nX3JMhSFUXFC/h4HBfVlYHVaZiQDE343FvVjyhhZiSubEKkhMKsjJZ
         yMMNy5kCi7VM5Vs3BGAYnuD1qccRYS3ztwZV8LarxJ8N5JUWET3FkOWJePsvk1T1LMGr
         c2BsbrMQAtg6xppMIPzqFkiMQ6OXTQyYZCVag04bUR44QJGOwRI+teZ6astAojLTVAJQ
         A9rg==
X-Forwarded-Encrypted: i=1; AKwUvBzX//b/oS9Nr3qIQybWfGmfOdxRsrP/WH5HcjpVb/bRpj9b6XfHa4AzhvPnWYpkI7wLE7lR0d6b8ZabFpC7mlO3@lists.infradead.org
X-Gm-Message-State: AFuF++no+dx++bjueiY/PpUooexeA8fUbOtI1ILhq4GE2aIIC2ZjJ0Zy
	B61+v7FzHIufz09i8fgN0iM3Ejz3nr/75f6KMcUJnX7eALSXFNfYFdrL
X-Gm-Gg: AYBFou3uDgGgq2u3ubvNFd1Why1juuO9z+7pVFo+1FV3AEGi9cbXsRTXvRxVhOtmrCx
	erQmawEM2L2CJkvt3dz4cJjDJ5TEmiV9+EM+AcNoAm4pt49GGIJneJPiNW9VkzHt415l+9n4pTG
	TEE5OW5T8L15qOZFLSZ2YtaAdmJcXV8KUlSLCIsfZzB/08gBs0myxD+zN0p4ry5cgwdD7hxO0/Q
	Pg4rHP1js+cT/u1ff/l0ghwYBszEZKQMuzkswnz/fwc/P43jqxX2UmY/I7IcaIrk5SgeGQ0s7IL
	EznfJWZ+yzUKpvIHZaNYTlr5KAXqfrPYKI6DHpvOvWdnTDv+MXmNj8a7Dr4cHNqp8yteLcOqavp
	Ez8y+xiKMHszLlyyv9xNA27aY1vkSI1iAYxMx4rF+t1fdW4yfW4XC57BfTba4/EJr8iEfx3uf0u
	MmZtFwxQtrAm932OSsMdELkOV948i+g5maxswTfgdpPYpA462dbtFwNGOuGWWHH5fA77flCGvLO
	8dUxvuKJI+ZFm6h1zogsg==
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr479077a91.34.1790066690219;
        Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:49 -0700 (PDT)
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
Subject: [PATCH v7 8/9] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:55 +0800
Message-ID: <20260922084256.1515554-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_014451_257304_43B84F56 
X-CRM114-Status: GOOD (  16.96  )
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
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
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
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
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


