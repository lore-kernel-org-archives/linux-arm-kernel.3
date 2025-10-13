Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F52FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=; b=X8qBJZiyFjyNxue1LYAzk62485
	EELHpff7BI3vhOrZmeeWGUHuy+vNBuMO+LyqPVi2muQBOcY7EN4YuACQhVwsyA1AIiNWXEb1ZxvOZ
	VM1js6uouDYsKcYJERR+LaKVGS83GTQ5t3wGef7K1xxuae4M39n/Z9drapxNPfyykQovZFNepM2WD
	JbXtS1EBVfiruH5z0+G5/2TQUgr954rtqUlaaF+RLksiNd4URrawvmRQxKpsgBmS9QOzNUSebPlJF
	7d+KA0jElF2j1I7vnQH/SEMshn1Hv6SGya8XiU1seOleZNWFCbyxsw/fGnooH8/bgLKM0uLcSC+OH
	IymW7aug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH1-0000000Db50-36lj;
	Mon, 13 Oct 2025 15:15:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KGy-0000000Db3X-32EY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso26777125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368539; x=1760973339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=;
        b=XmmOL5B6TU2aFGxHQT9YMR1ls48NFHrXDuD7G0jeQfMBIFNEdhyWmDTvJZnRtTZYes
         mN7RPKko5AgGJg1xKsp19CJP8uBMBHHvTRz+0erCBVLrcAlmABDVPhVENZRZRhV68+FN
         4K3IbSvuXJvcV+LuZ1THDCxObTWGKtYktg7fTL9088/QrqqRJE75dbkD4Y9mGETC6ocv
         N52tPt0SMZVbWjdvKjGH7tdINP2c4YHDNnREhhhvXyXeh0pVqPxXp6S+4EWT5UkwVv99
         zPYG9U6uwmbNTo5MxfQzx7E908YLLL0GI/6KlM7ewGq683b0H0JYNv9O2qumDEXpPjxS
         x4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368539; x=1760973339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=;
        b=FR7jyF8jj77dyDH0Q4QxiWZkzJZ2C5QNadbBKIq0aZUMQ4UbvCmGGRMnJO9O8NfHZI
         PXW8A2C3gQLcGGgeRXvfEcAORRIU5evuPx54cnhwqoJJ+NF4G1vCk3iVUbJGUKAONfYe
         H+eH1V62bCrcB9m/2TIExjA6eJVauC8z8aSTf7jlClB5B+SD0ePZDNMP6kTSO6kqr+y3
         XgwZJavYEnO6DVW0sxsUrpPBaOA3UlZ4O6AKz422nX/JSK8Uoz4BfUf/uTaVscr07MDY
         OQVGZNFSMJrXvBW96OKFqkhHE+GCmKri62DvDWex9hp689TlBSnUJNaikOImGQ/uz/NL
         IIZw==
X-Forwarded-Encrypted: i=1; AJvYcCX3SRPnLDAE4XDD59kg3AX+2cFVlgWv4lSrRogGg24pW9jCdUz0NuctTEj/6tR06yvVyELbIpWYVDShymC7yXsb@lists.infradead.org
X-Gm-Message-State: AOJu0YzwM416KSHy0XRlXQSs1kN78yWLUXaqoH9nl99S01086w6q1EGM
	z6GYxOcfKqy6xxnrsqJM/4gnRCRJd1ttSLqkIrpqC1DFWT63x/UN4PNe
X-Gm-Gg: ASbGncuEt5zSdeMskn6KTaLjn2AMMdCwefCHSidAGR0D4bK0Mz8JAemPequbNN4pI4t
	PCDKI4wzbzPMYacPe4IupAMrluk3IiTAiXmj+aJZw+46rs9CqLaKoExVJaaEegIDfjDnZ+2rN4Q
	F3hDt50A/mAPwY5rHokvKJVmLARPJCJd8vv5bMb1P9bH37CA3ahKdxrcGKjp33G+FytyL5pcx7M
	SGaisrQGebYoFNq125iy5qBoYZGHqsHq1+Z2hVrIsGK+Pw2GttzvQT4CJ0U30Peafa+T6D3GyEY
	a2NoaSL53QyU2CYsxhCPQVE8zXlTs15uxx9/gm2wa1ApvaVOGzJ3bfSH1r/Qq0yqmDdB6mnJo5l
	Blh8Fzr0omes2To+GA22A9FuFDvpjLG9QxyNLm0T9BUGWCzfi7HYSce9mD/xWB9/1va+GHU+RdC
	lTJCMm
X-Google-Smtp-Source: AGHT+IGwJqj5PmL4e2MI1le7nNOJW+jd0SIfBCswYBmaCJKr1jrFAghd2jBuPptFtHUN4Hmx6R2roQ==
X-Received: by 2002:a05:600c:4752:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-46fa9a9f05emr138719385e9.11.1760368538589;
        Mon, 13 Oct 2025 08:15:38 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm135545825e9.0.2025.10.13.08.15.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 08:15:38 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
Date: Mon, 13 Oct 2025 16:14:59 +0100
Message-ID: <20251013151502.6679-3-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013151502.6679-1-jackabt.amazon@gmail.com>
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081540_786644_768A1CFD 
X-CRM114-Status: GOOD (  14.54  )
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

From: Jack Thomson <jackabt@amazon.com>

When creating a VM using mmap with huge pages, and the memory amount does
not align with the underlying page size. The stored mmap_size value does
not account for the fact that mmap will automatically align the length
to a multiple of the underlying page size. During the teardown of the
test, munmap is used. However, munmap requires the length to be a
multiple of the underlying page size.

Update the vm_mem_add method to ensure the mmap_size is aligned to the
underlying page size.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c3f5142b0a54..b106fbed999c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1051,7 +1051,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	/* Allocate and initialize new mem region structure. */
 	region = calloc(1, sizeof(*region));
 	TEST_ASSERT(region != NULL, "Insufficient Memory");
-	region->mmap_size = mem_size;
 
 #ifdef __s390x__
 	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
@@ -1060,6 +1059,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	alignment = 1;
 #endif
 
+	alignment = max(backing_src_pagesz, alignment);
+	region->mmap_size = align_up(mem_size, alignment);
+
+	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
+
 	/*
 	 * When using THP mmap is not guaranteed to returned a hugepage aligned
 	 * address so we have to pad the mmap. Padding is not needed for HugeTLB
@@ -1067,12 +1071,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	 * page size.
 	 */
 	if (src_type == VM_MEM_SRC_ANONYMOUS_THP)
-		alignment = max(backing_src_pagesz, alignment);
-
-	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
-
-	/* Add enough memory to align up if necessary */
-	if (alignment > 1)
 		region->mmap_size += alignment;
 
 	region->fd = -1;
-- 
2.43.0


