Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D25C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=; b=dinEy6QXKYNMEm9bq6ohWaSOqK
	pLpgNa1AOVtxQzZwcNdmpdW/AdxFHJKg2aQoqd2kn9CNcpK2uXLfn4tzbH2iG67FvfAf1oUM3PWWY
	8bDhClwFZSA/2PIb297+A+GBMUTvBpJ7PK2RJCz41gzCvf52xr2J4zMdoXZYkMJU28wHQP4obfWfm
	nkBHBBaunNKOwcvDhKKXJZGzGQ2wH+haAtGG3x68D0Xm6GSs5JZkE7L13yGKjsF0bzee1xaXgcwWD
	BSSYu+qd/3nTRsXO7qUho7LtIorgRj7rR9ULdfQza9IcPDzxRpCV0K3wUGQRLTQJLrwrnQLf00Zps
	ayP/viaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXD-00000005Qsa-2mO5;
	Thu, 06 Aug 2026 09:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXB-00000005QqJ-3vSo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=; b=JXLxM5gqPBYsrSIefU0hzV+ved
	jEr/7ks4xICNIL+scWoMsPocZboJe7Akg07iYqxtV96ds02ISvRpexkRnbNJe5Z+g6Svi4A1h/KBa
	V/aUHTBiSItLT0VVqQIqyHPN9/76T6YE54SP7E31H6J1uOcyfoX/zBGPDjyoG4/ALOUC+MCs+yxrz
	9jkX6sBBz2sUA/UM9rQVK2mQdb5kWhzECqcbjnZ0HZrrNG6RhlrHn+N9dpRwQQYYgwgLNlb9Tkea2
	jCDs6XoXK3W85Mt7egt71sFi6g0rvk4ePsQoCJZHPpb/W60wJMaEFwoNbsFIjtoNbTY7sEYlQ5qDu
	7mi8OxXQ==;
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wruX6-0000000BNXF-3Jt9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:37:04 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1143348a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009018; x=1786613818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=O54xxo+l8FLuoL8qdDPS3wXMses2/ZDQfxqvWbnFBiX2b7zkKty7vbpplVbeAbuxKV
         TmgQUj91fkTeo4R2h2arJ9MI1OyuMfRLVzWvc8/7xrpz5HQu6qrDIkrFuzfvUBWyPqAA
         kpBPBFVgU6VENvnDQVeXkzFY8Cl54N7AdsQ9snIhvHQDsfCD2VUAWFcNY9J7dB+aQ/HO
         JEObwT1vKOA+nATuqd2c7CN/QCVNiLJvN4C9+P8DlgReIJYUZ0Qg2vVuZwB+K8QZ2ddN
         atZNWQSyhnaAzXToHVRHypb07BB9NIpfITQ0a/M/9MQvTldFTpDigsklu7V9Aje90Z7b
         PCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009018; x=1786613818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=F/ecDY1raDLmhtPDCEwsqieFPQ+gYR+yoYd0TxYLfCFpTD2Wazv6H3aJ01mnP6H5o6
         VlKda+KHjuy5pYiPQsc8Mic2mvUr1uwytmgksX+by0EMaWmt1Y5PSnCEDLgNYlfjpinG
         K18j41jO6f8BR6mm6/tQHn4akWiSny2vE9RhII6G36gojFtJPna3V+CUrbelJtLaUtRx
         CywW/w5b/j+ER7lZULd0EISUaelVTd9v31DIL3CrhlzycWu4SHg/FuYcC4ZtkIkjIedW
         8PxS7XWpAqweYS+HnC+ogZKKMMZTYGLmILzTRoZr0vCJQfPILZuxCZTjh8DAR/14FbCF
         vIIA==
X-Forwarded-Encrypted: i=1; AHgh+RoDiFp7VswoaoQrI7zFqYrIKqEBMG7419oJApBXauJRwgSdSbhaxV+grs4j8YfHWFNlwQlBwKCDEnroI4whR+gz@lists.infradead.org
X-Gm-Message-State: AOJu0YwHqE6V9D2KB4EgY0dYvnD4PMQZNJerHXLtkVIUMgSPbGklMCaI
	84+X4z2OjBJ84LL0/KSHqh/EvPLfEWIX0L2bwBwYjtxKnOgEV7zn8Hal
X-Gm-Gg: AR+sD12Z9Q1F1G/PscS9btfgPlW8M/rTb4G6gh1tGlh4sRDWxuXXJmIxN6H6HuCfGbh
	lwktLT3Ir23p7YJFeEB9nytD1fF4JjzwzJDsTHY/cTYdUxIuin7yMvga8SpWv6uRvOE+DlzVG7C
	oYxWxXLV4uUOI63gLt1vrajB9wSROV3nmwFcOoV7NyhtTH2xyD9Yfk9VTD5iEo0A2H7qKT27nIO
	ltTa2k1ff7CsNqgPYB2w14OSHDQy5nembQC0VV34vFnpmXwIWXl0vjAqUDtQYpvXu/uy6C9OGGi
	zFaH6MRTBpRfcIOU0Pr8SG/N+UgBxM7OZ3zIiU6kMRVujiwnk3PXXXlaXgM6fmB2LAuOwQ43QMg
	Zygz/Whye6BlRKaJZCNyrs6oWGQ1bXeyJ2gdieBkf/HPZV4vGRySL2mxdPjW3xKLSmLC4bDeNWF
	bqwwFd2ipap+vB6MgsgA5rRjMHJynE6QvnCt9qhSmvclfij4rcmP6R5uj1pJVo/yaIv2Gvcmsqw
	A==
X-Received: by 2002:a05:6a00:2d81:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84f2dff6cd5mr14050456b3a.1.1786009018224;
        Thu, 06 Aug 2026 02:36:58 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:57 -0700 (PDT)
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
Subject: [PATCH v5 7/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Thu,  6 Aug 2026 17:35:18 +0800
Message-ID: <20260806093519.2907771-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_103700_971198_11D68858 
X-CRM114-Status: GOOD (  13.10  )
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 77285ae3ce60..fb78b7814f18 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,6 +269,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 {
 	struct crash_mem *cmem;
@@ -284,22 +290,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0


