Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBBECCA46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=; b=vUTlKf8iFONj0YYhEP4GJrcQoP
	3wYdrpP0Yc62AB5/6RwoqJmZRrcxdeEbZ2n5wutMIBQvM6BL1Xu57HLVEdigAe2oyH4OukZ4nqQ8y
	NLT/2CdsOVAzgHbOytPPUgQOqweZBmGgBf5igsBP4JhKmNnyuHepn8+9uMg2yJp6ksG4W5aU+1Dbk
	6Tzt4oIu+VjkUv57k1E3/cpux8H4+ixCZAkmlB5U0B/aHWANG2C+PAzxI/0dpeukZCVN3CKJadZ35
	dbc+IKqaaJD3Fu6cvVjmd4/JR6IilModT9KeAlpAdQLKuLRA1TTDBVTcyC7gPzwxnU0/bjdooJHbC
	hgt4EGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFT-000000025WF-16ea;
	Fri, 16 Oct 2026 06:16:59 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFQ-000000025So-39D1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:16:57 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1161811a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131416; x=1792736216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=pp1AAe/lFKiIimKk2DmJ2eWPLP5iCgM1pUo8Ytb+WvTHGPv4EZ/T7VIEd36aeRhrlJ
         N5wvNbGiQivEoq1Tl2McAj4pw1UGYH3wOuVGcd9FO5mL9pT6QWAuBzNcg/mlXGvw8Z1K
         5ZcVResE9ZjQ4NKdDCtE7rpwqjKd+iQIBgnx+v49P8ZJxwNyH0MyGVxBaRKnSp9xMEri
         6cM4YWKvNj3r9MmXll1CK2wfxSV/KQlI0z4AyjtjSbDgGnw80THERfiNL0eF6OcpsGQg
         hcLz6gv3shFCVxNLgNFKGXkLrWOrTKytVpwGye4ex+VeX48NdnVNgRSdafHFbs1bsZhS
         Ycjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131416; x=1792736216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=uwfsRKJYmuVFuEYLYgffOI6jfFs2yAnAeREFXYJzfeOYZ48Bv4CxUqkoSSxDHSyQM6
         +8z2AKaP0p6QVU1jW/4G1lIZvRlmYr7qX7x2DRmw+B68TPWNagNhB2uK8YI3pZsgdE5X
         UpBxWZ6BuupdA9i6Vxl3TWJAGjIuYzI/0WeiaGNgb1RhKFrDo62Pi2kk6zsCMccXra1i
         tHcL3WlPFfe1sBb+Sm8Lj/APFh2/P9/DOMj8NdnOR2bQqn0hyBm127bPG4cWCwoTJCfZ
         pfKanG4GDB+/HGcpOtanugcsgHpkaKNqDECZIa5MQd8JniWmHzSJCwG0tR/PAA0CmTUv
         MstA==
X-Forwarded-Encrypted: i=1; AKwUvBxC42fB7m4yt3ec+hXuu/n+YRvSBM2mTaDsPPHJg79IlhhtObq8ggoiSxqkFI1+bmC36VRMWs38buaAay/ncL2r@lists.infradead.org
X-Gm-Message-State: AFq9FYLBzAfFPbgVUVIg4gnaIZ2uDBHc6eBXrCZm/x+LybfpmkHJxrCe
	oa8PUnMZNwMBvCqHbBt8CXV22gKrvAeEHLZLK4441ysEye44HxSecZgX
X-Gm-Gg: AYBFou2nInThcKTEvEQDYowkcQSVvZfOwtKctIis26i2Px+VnVwWtUjDY3+RIUIR+/H
	CbL6KefT3oxWR51wgcdpL4/dSvwG41srvWxMxNw797aqw8QxS9gSAfaf6+lb2BiwCS6u4c0sklk
	zigGiBpKU8smLS5U+pEZrH/NwKJMvlEGR/PPlb+UtFhN4pkVzlezxV4M7tYtUwYpYfpO23O6w2h
	6MBmLP4gIWOYSq+5LelvmwKipEHF2CuG7bQEYH8Z8gyXyIWjf2AfhTD2ekMfcYbrWprmDY++IMg
	H9pJ8KF6XZEO/Z/kYx8+3LgA+gTer0o3HKoLqf7PaMaOfJUGTgAz9v/pClhZA8kRbyVgyiu0P/K
	6O6Z51N846FHfXI5a598o3bF3tFF7tGvVcxgytYCWuFdRa/m+Az/1SEWyxS6Ynl9YtkI6Oj/yau
	SH7px6pbR91OPwITZ6+cdWNsLyRWaMp9NKwexoqkLeC3/kpxNmk9f923G+6ejcqEpf5IAl7lArY
	zApoBvvEtg=
X-Received: by 2002:a05:6a00:b8d:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-89dec58cf9dmr5849396b3a.55.1792131415787;
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
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
Subject: [RESEND PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 14:15:45 +0800
Message-ID: <20261016061549.4181390-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_231656_793637_77AF0D93 
X-CRM114-Status: GOOD (  12.65  )
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
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
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


