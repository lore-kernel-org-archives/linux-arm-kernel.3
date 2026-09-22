Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E373EC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=; b=GbMxfb9rwl3O28SdCmbbluNVi0
	0uji+0HkuWLEC7LH5bPetNgow3vCuAgK0SkeHrX7SJwXrwP6TlQGnZCdBp/qKHK9XXY4nPGhL4H28
	yvDmdKByq5lOGh6uJY3CTAWno0A7x00RVcBvE+fxE6qYgf05OShRC23q1QU2Zbt5EY2POWWBFD6bM
	kWmc8D4J4R0mBwamkX7H0aPMpy329f+eNMk2waryevCVEhxIqABiunYV6xFjeHf1iAcBTkcQk/amO
	v1M0Xg46ZQSkbkG/B5F/mKn9Bxe3jxwpMOCXnq33goDa1JtrP0BtXw1MpK7l8IMCmyDhO/LCZBR6s
	kpJgxjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6i-00000004iwt-3G3x;
	Tue, 22 Sep 2026 08:44:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6h-00000004ivQ-2vdN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=; b=Id3DDOHUoUQkdaK+o7w5aqpPEA
	UujTWPy28WCDDdQvGssGwWlhsvUOs0aG15w5NzkLYzVgez6FL/iPBRLQlotbKZvy7dHKHmVCfix/1
	E01lQw/ypvYefRXBcwDEOdwLHNvv0BhSdkp48PjgZeo7F+bnumfzy4oBOwffgIoGg3lVAH8wlgkDh
	85a/qOFtnIh6HSgpMypfjIfDMD7+YwTMNq1IpC9Q5IVVdq855a3yoL9Dw21e1q+6Ho+sF2PD/QBIn
	wSVC6krjLIYVNsEAPAEW/xiUVV9Ufj8/tvjThFOEYq8eGBMrldTxx9OhY7ZNp1cCeUN66k4mTqj3o
	sO84ZFBQ==;
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w6a-0000000DHaB-3tsq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:06 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1278529a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066639; x=1790671439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=Fd/mG62JbKtk4HmHAb8GXJWWTXHaIVkuhIXWZYTSlUmEvysommzkCKFBepm2D3L4gy
         queTNf/QexmZyhrcLQdiKJkiDyxS0i9Z/cPYU2LIbeO0ZMQUdJYVeYsDQ/mmlM8+e/Uf
         AYvzWVzilLzZXK6DxiWyjzJy5sIRl4EXyoFEVdNz5Hk8HQXo8uPQWLPv3/T4N5gVkB6P
         oZqnwxvvzfRVWeJXvq0onEyiYM5229CVHPXWdpUqSk7RmgNlp8PNrRd+DkWvcYtgWV+F
         nRAf9OsaEbDSNsZt3wgcqxKH/AKOdw9y1gprMwhyrS7I8mvxcsX0sDCQDXJXNu0cqKdY
         2Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066639; x=1790671439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=UUErNW085Hi0wggQSIGukQkORTQn9bzF3CY4g0/7DJv3D2pHeLnWVDVJYIhoV4FKpu
         SZ9YHbGq7QHHwGRMR6vQk1NtOP5D4i1RymzziNNLuU2r9EeOV3JQdtcbNCZ59DNsaXyt
         Cb9FLd0rlRR3jXcB8ygNTHlCV6dRaCTLsyIEg1iakFfigC6YyzIx5wI+1VZJ9Z6CXqqm
         HY47HCMJKwy3Dg4qodIsovOu6f+Xmd1if6q1ypMdOA3tFEDvTBskbsHJRQsCoIrRX7tv
         1PdC4Cdz0UoShh3NiPFrmd0VMuaMHeN4WwnWYYza3+ONkLKLvlz4ZTNj1XunpkVPDViY
         pR3A==
X-Forwarded-Encrypted: i=1; AKwUvBzPWTXcGN764dm7/LvY2mB57+q8tu5EOeRd5VFxhVCGCjudp8ahx0OUCHGDG6PBmznMN0xIgUq+pGtCfWxkfNO3@lists.infradead.org
X-Gm-Message-State: AFuF++mItt+ji/jfFIYx742dTni57LHADk67AA87YxtD7znpNSMe53mv
	ABx+nab8ZYhCVy1wS6bTRUipm67mAFUviX/fAicXtTu9k1Rk8YsdJ0cn
X-Gm-Gg: AYBFou3+2NzV8RVt/hJniZsM56vE2J4IERKN4rFhBw+1aAvFo1tcB0t/VNqwWjoNjnS
	Q+BIXpLKPKKK8Yz5Z/bUNNBjC/JIEoVoy8X+433FviyduAK8CDTcshmobcAEbVnFzSaJ9anSMBu
	arTi0cPA1Vg2NQcObikYJlrOxWNBlAwWDfTdp09yiaT9Tw4iIYGLGWELvEyG4buo/EUpCS/AMlM
	yVyiaM2J+ADurlGv5W60aqgrCB26sFhHt8Ybn4TmVd9b3LlSE5YUEmvhzyEfRv6l20F7ML1QOu4
	29cpGeVgj22q5K8VF0isiM6pii11Ycyv9v3EzoWFAkegNrIAQy6w+NoZRVbS3KNJOhHmay8w+hg
	DihIZv+LF/7+ZLq8XWSedDwPyot6pCPyLmcv2q0U6jmbllRbqWIBh0f06BC0COZBg9EK3q8lGcS
	MKA4uImP6ZtF5C6dY59CWZD2YKm5UqF0MnF3D+mnpKQG9WFVgtvCPh0C+4qsnPPIRu7jIk5yjCT
	tcUUY1DeNQ=
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr476673a91.34.1790066638632;
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
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
Subject: [PATCH v7 4/9] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Tue, 22 Sep 2026 16:42:51 +0800
Message-ID: <20260922084256.1515554-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094401_308790_709F6814 
X-CRM114-Status: GOOD (  13.72  )
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
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0cc2496dc09..c7acb2e449df 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
@@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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


