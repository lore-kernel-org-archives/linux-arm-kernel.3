Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADCACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=; b=SvXsYD4XHEOfg/slmFpv5p3+aB
	Eh6qwRxw9ySaFJBnmqrQgV0sQkVnbUBncbCjVAQlj+pMIDOC9fLK3FlVI5m4OenRWYdTu0dExKiIA
	7slYE2CuDYqB6jwUda4nH11UoL93d54r5EeTnRQdrUIX8pbUBx4ARg7o8/MtrSgoQ3RIlPti3Vdlz
	R+6Bpjpblvwzn+CPwGE4P//ZGKI38RQxESpXCNa5839ylaxcoG2UhfRlho48cjHp/cnOM4J23pb7c
	9KsitnhhBDJg/OLLpF5oFPiw+kpQfZYbVcTO9INHTfGYkty9nzvwH7JtCJFdD63VFZ2NTN/oXDOtE
	WAGFcLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbEu-0000000258Z-0BAg;
	Fri, 16 Oct 2026 06:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbEt-0000000257q-1mb9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=; b=VFqXmnlOrLhD8pDGQ5WfsdsBpG
	xufjc4TxeVlVvD7ntN2VopPo5xumgtbH/kMqzQ17vCWLrZ7mnv88ur4mRjnW7uxiAB1MDlggMsZOH
	8v1Zpyu2buhXHEaWd8XNfiFaR+0V/25bh3qY05w2JjZNsaIPOX2jVE3NVU1QY2MCvCPvUb3OM5OvP
	6tfsWjyLKgCIUpYTX6f+JHhuAOBzdTTKDwdGzcv0bbOLkJY488Jt6MQaQQ47xY1+PQCSiEqy4u5C8
	3wTkxcDLhfYOHg73OWmOGawOmqPd5rL+CFbLiRSw22NsDlaawE4vqvKXTkj7T8pGVT2L37ciq2c4/
	rfCz8FRg==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbEq-000000019Zr-2DoA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:16:22 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1161653a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131378; x=1792736178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=it/Xu88dD2gIkSe+HpUTimu4Z56RVG6dnDZWUdw5dkgdMyyhck8+sIp7h+z52eAWPB
         7sX2t4OjM3T6zthfdorh41pWnPdtDY1ZJEgxBJ/jLVqE4p2Qg2N/uuuRAZ4U1AvC8DQN
         6/HmggIkr55r3TCuuCX1OLBFCyrP3nawYFaLEE7KmVTE3zENJMini+02K49lz4tSbEak
         FFdJ4AbMYh69YaIijINwjSXi9GL/XEmOpqZLEQd9GxoRCL6HETPY7pVcDYKoizLaR45B
         9sGuMM1bnbp7Xt9XorqIV7jrWqRnV7zzZurPU8CQV7xOzBDQStLpUXqIMFaP3PqrTGSQ
         5kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131378; x=1792736178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=CPjTdsEjovlZDjpYeFDXJxphtuTCvtPSNthc33/7IZ+j2Qk1GBbrsz/Z6KYq8KJrAr
         fWTXzyUVzhqr5HMd462O7N1xs9r8yOmHexqceLqhkgOKmMFdYXI1bWTwgqhQsudnw/cB
         6idZ4qAGjDZeVdQHBPEvbpCvzMVNLIsWlBFH/SReEE/TbnZnO4r+OloKbpRlxA/uQk4M
         BQ6WdNNoF73zE2gWwVeb3KNeegEXut2kBsOcM6klvQP7c41Q8knMKMFpv7Odd2/Impo4
         eaJAr11XRJDlp+zyAnonO2r58YaAVSgsUS18Zf8fxvRITkW2G+OxYw3k1szLh4ZYlcZn
         R+aQ==
X-Forwarded-Encrypted: i=1; AKwUvByOzgVdyMpIJxhjnx3jELh0gR4wAsYm0Zyligx6ZXEi9fKTNgscemni0eiMOt36/0zLihUhJRv9AOgkhz3852YV@lists.infradead.org
X-Gm-Message-State: AFq9FYJo/oua+0wwaFpcTgwO6yP3wdH18YHfUzcaXU0wgw0/bCMmQNTJ
	Cn9RuI5L3r3/c7l3N7tM12OCQWoLFszenV6iixq8acKcpHeHyFI66dwQ
X-Gm-Gg: AYBFou08hW51Spxzww8BVeu8xvc8L9dz6h4ouxv20SpKmEoHYaHP49FynGaQMOx8lG4
	t19uE650PT0wo9LvyZCn5pNwDOMIoLAq8SBuvcp8hrZsa8Sf/d7TnhqRPU7aIB3Y8cRV0Obcu47
	LHL9Syt5yc5z1CcBIsesw6Wl/iTh9AkvwyTM5cBk+bEaJDaaI2aXJUMW63kKyCHc/cwvagtgPiS
	kltV4pj1Y905LTmMhyOeI75EtPlxL/wL7Q0S0shviy/CN+N/RrkCXY3aSTLyZ/wOSIniLPok1m+
	BaTk5ow2mDmgb5/P5mB7CGtMoQ7xJMPPGlL1rjz4byd7AvYOWAuSZy0EbzCbgOW4lAmkEQxy6l4
	m3LDsfXcKxTSnjwT60PhjL5OSftbsKYiX5jQVVfcDoNRCFvL7Rm05LmRw0RtW7ErvhwBfcaT8l9
	guyho5hUowFbsDsC3dWpDl0Z63740BmJVnWZuv9q6tfTm5O0aYHy1/kzbOg7Wrp5e1+aatAGB+m
	9ZA74TOoN4=
X-Received: by 2002:a05:6a00:2996:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-897c79d707emr18459260b3a.43.1792131378226;
        Thu, 15 Oct 2026 23:16:18 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:17 -0700 (PDT)
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
Subject: [RESEND PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 14:15:42 +0800
Message-ID: <20261016061549.4181390-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071620_647919_5F85AEAD 
X-CRM114-Status: GOOD (  13.29  )
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


