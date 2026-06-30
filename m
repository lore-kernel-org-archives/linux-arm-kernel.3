Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE07C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=; b=2atane/ixwE9S3UsYEsWfbZlGe
	813zY7FT0iV/6h3MA8bi33Id91lnu1mbe0h1ggKLAf3MIL3DLtp7D40e84UQuYHSD+Gatg8R67Cg5
	gi7Wt4i/U19erqcr1Ei4EJeuN58QV5ZCHIGVXuznVvMNo2haWrT+CHSAkEbI6+GRXzfr8ea2DkMEp
	KKDopNCJS64XkkeofsXZTSVOvjo0HyEGK97KAC/4qo2nn0evZNgW7Jth+GTC8cSxN8uKPY6K7+HM8
	xAcZB78+Lv7CBcVVH5pCL5BQGW/eWRkLa4l43ePShlMvqJv3D44guJaRiioKI+a0Rc/SFEuAG9tT9
	woC1mYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCw-0000000GA8S-0Puu;
	Tue, 30 Jun 2026 07:48:38 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCo-0000000GA1p-3h9q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:32 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c99784b434so2273135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805710; x=1783410510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=;
        b=CgCZTTvytgIy0DXqQznk3epUrR03i8kms9/U/IgVRmkJD33veh8y8AnAa+IE8BFXoI
         6dcZEmRiDDC3iI2XjnN/CzcCdZ4FpdBcoT2BwD7RM35JdRtdjRmykUlp98AR3n+DcP9y
         cNCkvedTYMDgxCDQCHvM6BRwFjH5rP+8RNnkTRcWlrMbZZ/vWE74fAGsld6oicP7R1P+
         3OabMkAv0jYQkMCWR1h3qij6EOfGkTL3emuCxs3Fn7461yamDYPghVw2xcmYUi5io0XR
         /oFWLHimCco2oovB6aNSb9l72KDt1ZRVSe0zEeJX4GP8UTtjfgr33JCl7ruAwQ9cPpnN
         L90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805710; x=1783410510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=;
        b=EWMJDPzcZu1DE1W+9RLccjKdQsMgGK0Q9SMIXDlbckcHiGTvQGVzRn+uV0aEK+C9fc
         NpsHWXAv+a/Z1TZ4g5FnLw6FdnhZ0oAH1kcr5d92bAJIS9bspwyQ58AdrBEx3ddqSJEl
         AttII/JcAbHCjWetsa8y8QQnqL8B/r0+APE6yeaLImUQNc5NqrgdT8slYRy0bPLOe5yt
         kw4ODXvp3v6fghGnojXnmgfOSuSLGfOebd0ZeUXs71qxPLo2EvTP1Zv87cqPBN61Etke
         EbnWVV0pw79lymbSXet6LbvJJPpEz+upVLzUfpjD3Ch65YyrDpigCG/aearpm5mOVdgc
         Lqiw==
X-Forwarded-Encrypted: i=1; AHgh+RoOCcm/uNVRlg1bDgjVwhlW5JtR/mY0/jZSzwmVoycL9+faKRG6CeH9S/aGZfmoWujbnv2uJunn630lIhQS53Gj@lists.infradead.org
X-Gm-Message-State: AOJu0YzYZqB3e3f1f4JC3kf69sOojfLCXkkGiQ9a+xM04Ok9CL9UlXXO
	YhRYMYU+SL62DXF6RpofblDpFg++UA2eW/rdZUkBrT4EnF8akQwbwHu4
X-Gm-Gg: AfdE7cn2t/Xrh1/HXHJ1r612ReM8b99MrXXFBTgb6er0LAmrYwWPu6HlrUD4osoPiDm
	d7ozspO8aRvr8wHSW9p2hlxYtUITj7jM1/dPC9HmA5v11symnvxIXrpqWR8mvCILzdppbKx/K/m
	FZjv+cBYIoCF1DZp8+n3xB+6MzbZMBpY1WqArhZ8ew/pXtqEHkadpWfvubz8N4CQBITz8veqqNx
	HqHG5gB/T566FMn1pjyoyJ20r66+2mJAbh3pHa+ll5DxEpLErlGSEA2rYuGyioXHvhNgQbXI8Pk
	8BTVZ+H7ddfHJxTYX3AggEu9aGXnFHL8tiW/OmMZ0wG8jDh9gLPo0pB6JsmvYe/HAICKmA5BSV5
	n3J/xas/U5J2Y4Dlzkir0EobtCXeqDTSC249dv9lx+Mw/Mg+ZiNMdyzmmcH9rmQjlslKAQnLGW3
	f2yzj00m+TbtehqyCmmjJwYuAQLA==
X-Received: by 2002:a17:903:1a26:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2ca2e714d17mr18921635ad.28.1782805710141;
        Tue, 30 Jun 2026 00:48:30 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:29 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 06/10] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Tue, 30 Jun 2026 15:47:10 +0800
Message-ID: <20260630074715.4126796-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004830_960974_6A988492 
X-CRM114-Status: GOOD (  18.97  )
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

/memreserve/ is used by firmware or bootloaders, such regions hold no
useful data for crash analysis, they should be excluded from the
kdump vmcore, so save /memreserve/ entries into the reserved_mem array
for later exclusion.

If a /memreserve/ entry overlaps any dumpable reserved region, mark
the whole memreserve entry dumpable as well. This may keep slightly
more memory in vmcore than strictly necessary, but avoids splitting
entries and never drops data that may be useful for crash analysis.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  4 +++
 drivers/of/of_private.h      |  2 ++
 drivers/of/of_reserved_mem.c | 52 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index b97775f6c9d4..3e478d29e247 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -497,6 +497,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	int n;
 	int res;
 	u64 base, size;
+	int nr_memreserve = 0;
 
 	if (!initial_boot_params)
 		return;
@@ -514,7 +515,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		if (!size)
 			break;
 		memblock_reserve(base, size);
+		nr_memreserve++;
 	}
+	fdt_reserved_mem_account_memreserve(nr_memreserve);
 }
 
 /**
@@ -1286,6 +1289,7 @@ void __init unflatten_device_tree(void)
 	if (!alloc_reserved_mem_array()) {
 		/* Save the statically-placed regions in the reserved_mem array */
 		fdt_scan_reserved_mem_late();
+		fdt_reserved_mem_save_memreserve_entries();
 	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 81c8ec9378b9..a67929c0a6ec 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 int __init alloc_reserved_mem_array(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f6c02b37deb7..9db0502989c3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,43 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
+						   phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	bool dumpable = false;
+	int i;
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for memreserve regions.\n");
+		return;
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+
+		if (!rmem->dumpable)
+			continue;
+
+		if (base < rmem->base + rmem->size && rmem->base < base + size) {
+			dumpable = true;
+			break;
+		}
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->base = base;
+	rmem->size = size;
+	rmem->dumpable = dumpable;
+
+	reserved_mem_count++;
+}
+
+void __init fdt_reserved_mem_account_memreserve(int n)
+{
+	total_reserved_mem_cnt += n;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -305,6 +342,21 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
+void __init fdt_reserved_mem_save_memreserve_entries(void)
+{
+	const void *fdt = initial_boot_params;
+	u64 base, size;
+	int n;
+
+	for (n = 0; ; n++) {
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+		fdt_reserved_mem_add_memreserve(base, size);
+	}
+}
+
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
 
 /*
-- 
2.43.0


