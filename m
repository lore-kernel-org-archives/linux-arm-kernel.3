Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E47CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=; b=hbgreKT+CYYIQP/nTgJ+1Qb6u5
	q1EOmStCVw8IMaH3scA9tcKisBm++UHuK+dvMtBkrGSqRu5zEjXk1Qi1ObPQKuI/U2Bgo+r8btMxg
	gtx+UytkobjNIhjL/aJU/eXCwKtxhY1h5emuofsVaIC6K6iJDDaDyi017FvveHYgbFKh0JWmCYuZK
	fQ91Pk6T5EsFFSWUVtIwdxIjbY36mzCAz71hwGnYKeIOJyvlcJ3kxmUXVgSrKYgrxctr78/3YZgq0
	LoVg7um+FJBPCwf3nIS0EdqZpE333DUkMMqu88Oc/HcRlyENbAWkUl+8vbA3ejim7zPV49qk7SOmd
	ravhoLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4y4-00000003EkN-4ASA;
	Wed, 27 May 2026 03:30:04 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4y0-00000003EeY-2Vu3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:30:03 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-83945063f70so5571501b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852600; x=1780457400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=DeBO29+M+CzT4Lkw0NUu6t2Gth0Q7AKYXm+4qwlmp8A0HbuNGpTQDkQR4f/2q2N1Wq
         Wue5sUhI3aFKsgL7O8WWPrVMCeAuEa4ldu77jcr8/Pga6rb+Qw3DcQ/OIjlS0I+TtBwY
         ktarfE/Uv64Aq9WpQogtKsF1r/c43hKPQEmDgXSiVZPJNTFEBzxCQzDRiK2U3napV1gY
         ZihMMg5BKR9M3uRUgyGmnEOkQiY5GhxRslFS6XfdS/jLpRjpXd8BIh24EA4kB4zraBww
         gUQKKuOlV1dLv9rHyNNAnvoIyg9O+SVoxFtY4sGwRECRQMTAqRK//D9Vhnx1KlP0IBgz
         /ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852600; x=1780457400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=YcGVmvEukSIMD4QIWRmj3vpbiXPSiLXO88Vhv7zglbIJ1QOE0JFW+k87IkqjHZm0oq
         J1BlWaLoUGkGgSZDNR0IJDJ4cSwSOkyL0RP0IIrjWVlVwCbvV9g/+Gu+2A3MBltBPfHN
         7lMOuilOvSsdijsm+/cLtApgvnNmSXfd9sIs91pS2PtWuhsm+Ra3jiy+xCOPHEHYAO0y
         iQWpkv5FMKdeXOVIbSZjenbpdJTer+Q33ZlFz2NMo+WF5Di2frR1+EDKiTivK7RqVVwI
         v1V7ex0QuAJgP70VMdZvmUZa7Fl9DxDvK38YhWu7dWvA7uLyeUqdur/+99gUyJsQjSJJ
         3PzA==
X-Gm-Message-State: AOJu0YxsQCd7PreJidfDTcq7GGZjYIh0IiLIDsZBv4nlweUmmh6W3vUd
	fQmpbdbg/5y4SHFSjpRAK88ZF0mclB+BiNo1HSmM2vbNkgBncokoG6CK/OW7iNzYs7XsjQ==
X-Gm-Gg: Acq92OH56aUbglQqJkUvWWbDpde270jigQoF7NSk7AdqpOpvQBb52Zzs3gwf7gi2Non
	xQlWh7TmgxWO3JCfpGTRbDrAi4zb6DPZoNF8xfaVdPbnuHwkT9/9S1E1Xw5GLPp80GrPNgrJbVK
	ccE3o+mYhThFP++LTyOBMdKeSxfeChjbiROAaKNBnreeymrURfHUUd0p4fbAQWRGEc4KE6FnVhS
	OpkPWnw3Rn2os2ZtaFTw/ZHUBCGBF3vMXAfo5qebnKTUmgIgw6zCntHIwcmhnlYH4sC/QkZYGO1
	jxqgU0ew7AqrEdfM1lPADzZND/qx9BM9NBcY1cbMNt2wCv3llWPeqFl9D3fbL4XcchAnKf+aTKh
	sDnqmreC+k9VRn9Po9LAJ+lt5bInuK48VWhL3yPQz9VMW17VSDR0E8ydYOfEDjHZKnibg9NowOv
	gezR3woJpvRRfY60uumKVEuk11Z4U5DAjBl966bhCdwO8uxek=
X-Received: by 2002:a05:6a00:ab86:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-8414b427c3emr17125755b3a.11.1779852599870;
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
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
Subject: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
Date: Wed, 27 May 2026 11:29:09 +0800
Message-ID: <20260527032917.3385849-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203000_652769_B4F9A4DC 
X-CRM114-Status: GOOD (  15.65  )
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

The global pointer 'reserved_mem' continues to reference the
reserved_mem_array which lives in __initdata if
alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
exported for post-init use, that would dereference freed memory
and trigger a use-after-free.

So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
fails.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 313cbc57aa45..6d479381ff1f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static void __init alloc_reserved_mem_array(void)
+static bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 
+	if (!total_reserved_mem_cnt)
+		return true;
+
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
 	if (!new_array) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
-		return;
+		goto fail;
 	}
 
 	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
 	if (copy_size == SIZE_MAX) {
 		memblock_free(new_array, alloc_size);
-		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	memset_size = alloc_size - copy_size;
@@ -100,6 +102,11 @@ static void __init alloc_reserved_mem_array(void)
 	memset(new_array + reserved_mem_count, 0, memset_size);
 
 	reserved_mem = new_array;
+	return true;
+
+fail:
+	reserved_mem_count = 0;
+	return false;
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
@@ -266,7 +273,8 @@ void __init fdt_scan_reserved_mem_late(void)
 	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
+	if (!alloc_reserved_mem_array())
+		return;
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-- 
2.43.0


