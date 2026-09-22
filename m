Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9FEC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=; b=NGdNuDpUolo9YUTWGG9+4DEXT9
	UW0LL5S0Hhg5xucnOk5nTa1yyEYnbrtZW4ZPhctdbRsqGcNWCEOd+OPuSsvsHG7wKTrPkDYzq8IWC
	d00IkBcIPS8jJR/qtnyIaCn1XwodMvMrebOftMVjsmy+9CPtTlgi6pnB+1jJHkbsS5ytT6HRB9Zdu
	BtURAN6YtH+C6PDmQkv0lXu2vZ7aZpwxPdRYjeTVfuVCr2wnYedgM87hkN7OzwJp2ceSF3xiS+7rC
	zKEpCkNO4XafD+sjznUx5h9FhphMI3v2XmxSRyQvsgOGhqiXEQEod+geYRcCbinlcXS792QEvzSm9
	t0hlMtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6A-00000004iWj-0n7l;
	Tue, 22 Sep 2026 08:43:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w67-00000004iV9-1mWy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=; b=AdMMMYdynOVuoi86+7FHMkuMff
	cAuK76QTDurhTcz+IAu5BuKbvk9EJzXV0QwAO8UFdBRyI59LyjoVztHW8mxsJOVUOBXZmd+bVpPUS
	0w7qZTV4dmktFxjYaIeO+bPytd/MyVY9AC56o7PoI1545sIefSFUZ0TfzAbWQh/8bSuoTlVeYvFIB
	ms6btRfpqV9XoTJ8VULNWnccdD/z5kpmYGeyWs7j2w2zVzAB/8pbBKJTfDqUyglqPuJ9IpqB/OTvi
	OccJ5Hpj3japB0i3GsakazSiTYNNMyE0nTYCldJCF4NYEMZ4aqhotg8F+gnjmxengh01RImzlVjE0
	WYoJB9Mw==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w61-0000000DHSs-3dB4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:43:29 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2418314a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066604; x=1790671404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=nziQsYpl5u2i9n6g3dU+LeYyJAE0cDsATo0lNvS9qdjhJ83NbEgk9Y/jMg/uEIeKL/
         Pe4ifGsV6RVp9EZD5dtb/JRRmfM81NiKpwQXMK5mpNHEhnLAe9+3WOmrl4X4yQfdyUkL
         moWZC7ybPKY2TDQSS18xYOQIQ8kUw2gyhSvya4kidXsQBjOb3rL4rThsFpH3JhyYDHoZ
         /6XQPVDqK8/RKQ+iI0gDu+4dD5ULec4APT742v9/m0rMogNs/OV8vf5vMNOBf1ch3OKs
         jdrD2KvxoQehLp4gzH0aqd5gJ53K2c+c8MSHVFhugCGlSczqhvQJHia0C6tGjQoNPNhL
         4pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066604; x=1790671404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=fSotG7PrOa2VKvXjAB2G3EVvn+rZz9ivyzcY+Ye1OBamEHAJ/WQfWSQb7a+D8f35d/
         hx0203qlOF4QYqSsLKu1rcmtEN+PWHp7iqHETGZTwpgETCCC2Degy5G8XO1gF7BpbgQe
         Wy44b3ybCSBE4x35d3dKj3AhUNOyMwUoJS0fPThTv05Q/Eqo2HAn6HSF1nEGqxfmiWo6
         OkyxFC0eMJqqTJyCztvsB0chQIo3YqueQ8KVqnmVkoOiq0+4HHbzNqRmTtrCVPaPvKr8
         nROv3tJS2QcByL0WcHl/N5r3+fRut5+pIslD8NtqzSNsjPGlslQDrcG3btz6yX4JUKOu
         pXSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8JcLz9RcycGNjnoUw/8qxaj5VeKWUc5DqwidOwfmps+jtmVm0y4KK++y0g80xz1I0bFAtLFOpI9aanemo9h5T@lists.infradead.org
X-Gm-Message-State: AFuF++n6Jr669lhUEsYzfAfuzAbCVmk5PJZ/eZqtjayXcZ0ubBWFzQSC
	v0HHDIRuieTYkJ9c04EPIujlWwxlI0qfbnbXwpr0SAc3qWQXBOX0gugv
X-Gm-Gg: AYBFou27gc4TgLVj69fSkqKwoKQbm2RazEXjZT7fQidvCPGkbwcrWNVVMmq8RcivLw+
	Axx8DB7fJfQVAndbqzqHsmmcXh0MucN1i3j/ujca2KcG2iaZM7sMy8KgUjA+wDWDD7ZjUEmZYUq
	X6wp4K1rJoSb6624qnd6+w0422TZQqks8CZaJsonOP4Ji4WzxN9rKYZ+VPMe7ukaatkoqdYIvDJ
	heNagoHJCgQE/bqSFzp0OAdvfDzj2rgbQdkyWGIJ2rDz2UrGJaVC/bv9pJTsA0zag7s5q77DQkS
	TFMh9BiEf34nMHT8LJv1Fv6kiVzErnniCXdVV0lkE8prujpndSED5yREH1IHb8qyG0S+nVpR5j/
	OSZDTm5bTzkcip8hUYh6+JDsWpxeGPqL7pUuh5F4MA0eR6VrgimjYEvrwbAl5HJnjxnKN45IPPh
	+k7sY0gPL7xYRuLFmURtANAfGZsKbOkbOSRESu9SbN5w301Ifx4yIIvyp9uz4ShAho84XP9hCea
	miYd1xWmfY=
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr482494a91.19.1790066603666;
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
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
Subject: [PATCH v7 1/9] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Tue, 22 Sep 2026 16:42:48 +0800
Message-ID: <20260922084256.1515554-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094326_993206_5D035707 
X-CRM114-Status: GOOD (  13.21  )
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
index a590db7687c8..991657b2465f 100644
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


