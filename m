Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DACCCA463
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=; b=FoPHjkntBCE+P80yf7o9eciDdV
	yNA7WXjZuL3bjOBTKkFvdVtkKKalX0bZLpTbBOCppbC9XYNB5I3bHjxu78bNkUZRBRzHWWUBpOjq+
	gz+KBFQUgca6NO/zVB/CkfjF8NKKigOnes9284jKkcUKcpeLakp/AzNgNTeT3rtCffFa+/+nMOsAu
	zZpWvIToBSI/d50o0/58WZiMJdtjHV2jRmFtPRNtzM/VoP/tiZ3b5ygsBaj8r4xAHD7j9kFJ9vgDc
	XYNzjaC4hgETc+3tAO8vScJi4eDorkKMs45iWz7FBPXdiue0fmTJXR7sQ1xQzCHRgy9qTLQDcUR6p
	HUxp55Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYK0-00000001nEi-0cIa;
	Fri, 16 Oct 2026 03:09:28 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYJx-00000001nD2-2FXa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:09:26 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3acc610014eso196437a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120165; x=1792724965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=pykGi6p5n0lqjw+03t5NPoFmTh51Zcnh/Nr0Bua9q4mV5HRaRUwEx3ChVne3b58iyO
         YtfPYWAkIcthNQ3DPZy7+mVVdqil8Z7hPYYgCrTiOT5zCsfgpsHGBJPbgL2h/8Tn5YoR
         8FdnkaxGtTVW1sOxshAwCnKUmucPYNY90AIEwRwx9Dca9s1zaca3xEcVUFNuCSOJCEcr
         JDAua4vMIcocjTeo9Rfl/Yj/OxbH+dx5h7JnK47U5XSX6wqJGemVEZffphtrcbvn/5iX
         Toa/F8Ere+S1HiT/XOlBzs0Xy6xnVbhEm+BdDYLVwgaIMsJ+2nD0R0DEgPYJCxqzrye/
         6KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120165; x=1792724965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=kCVkNZKKMllpi6tRmGtC+Hhy1AlqLr0XVTjbce7eJ3xLu6QmR58b1n1hhGNwC36sYq
         BfTLH2HJtBrhf99Vkyjh2uD5BLDXhx1SSWFzPKBHjhcEY3ygMi04d8yxIhl/ANWwcKCe
         x3PR6BPSV4pq5yAhrMdObn+lYa2M+Q3RYo+0NPh4hE+oiN5JDQZq1e6HKZBP6qtB+0gn
         1yQizQwFnaLdi1OnMME0lMGbpN7JsZPh4WTRrg9QkkeILvnuR96ECzC4dgIYLn4XMnsF
         8f7JPNyIaDjxaYROIOj40n+Rufe26CAbMIVf6lJ3xHvLOVsXYO9fmU6jzUUBte+ygTW0
         XH3A==
X-Forwarded-Encrypted: i=1; AKwUvBxtkDfCe3JlV8BXMfJqJxI7AUgrfQbNjcCaPLMMGY1TNqjv2BQbbdwtUp/lTDHdM3h+jBpuPP5FuZ3iW3yjP1Vz@lists.infradead.org
X-Gm-Message-State: AFq9FYKRzEh8L2KtjxhIRtnFlcpCFGqCGKFFCaqS9LNXFy4hImWjp+lc
	gT/443CjGkYIKqn0ocYjJqD4PvaAQB7kAn66qC9U6saaZpHtwZ5kw/sh
X-Gm-Gg: AYBFou04OeZu9f9X9xUAD7hmEQRBnyJcejqCa8eAHnRnlme2oHsywbNkrAzh7pmeIwt
	IQ3/RSD1vT0Vxj0/U8vW6XJicAfxfjPF6+NaqecdQz+92YoK6ZRgCUfNNUOQEMUowIoMQxtleQ7
	PAZUVTZl2aTtnrZDxMOoZoVI8WiDJ6KlIV5SqSqcC191OsVApTTSP7dCfjhHd+JJSOZbyUBjXFj
	QmoCFLhP0lngOFmUkFZc+lxojPJL8zMDJKMTcNCRbAtIcIlf62dUVr5iOFnsoH4ufvSEof36SB8
	bAfoORQwHUNsA8frap612BGZoaqaC2e84u4oH8CF9esh9Ka7//7T3RQpgMVdY14uqsZEHwjwO7j
	xQt+/lVUTm7b3Mb9GFGdPCbLo6hDeQrq9lYIsprTNJRCrsDjYylA3YID5ysQQ8Cztugr5MFO4f6
	jDo42hFltAGNpo52pm7qpHYxurJk8pePGaKete3Orj5IrE72rZRKJ44kYWYhw2FKUCqoIs6Q2ED
	6f1EuqOUNM=
X-Received: by 2002:a17:90b:5823:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ab3ab1d561mr18240688a91.42.1792120164811;
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
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
Subject: [PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 11:08:48 +0800
Message-ID: <20261016030855.4062882-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_200925_615957_D3A41424 
X-CRM114-Status: GOOD (  12.48  )
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

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62a4be0474e3..529310e3ae1e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


