Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AF7CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=; b=y73AZRLj/WbcaqqVb0hgn7Gv5M
	327c9nNvB1mpvdrGuBqkfeZulWQ6QIQtQUXeuCFzuODjUNiFhrc0dLeSpa/mutXtaKqiz8oTiFuh3
	F7kGAl/ZONG6rKloQOjAggI0a3FeZj1+5EDn5YRAWzfiSqEgO3QhLWiOUsJAxvTm8UOles+p+Xy6Q
	coYSxs+dK0PyZEyGL8c05iiTXtjdTcSrCoSkXLN75PArAIyVCmKZVzeedxk80FwM54OfbUgP6xGpU
	6GBmFTmkk3VfndM9RE9OUIBlAuN3bPM29Xo8vzDIgu3WS+cZAmwLzy40I3lfJlGPauwBb05rbkem3
	yJvZChRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CP-00000004ham-3mHr;
	Sat, 17 Oct 2026 11:03:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2C8-00000004hQj-05gr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e60f9af6e6so4545525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234999; x=1792839799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=IfMTp1WPqg5knQfayfRmDRHqRpwDlB1vj2ygSrUGegUuPn88JY1qspdqN4TYNEp+Q2
         ZNCgOAuyRd9dVzP+PbGnqKWcbVA9C5PnDM+j5L9jBtiUSd1xJxZLyYJtqZgxo7BgnnYS
         c4k/ucemOB2w6bDIFKA6kyctcPcXXCKqWHzJ9sV/goRW00eCAcGcNibxqM/D/96Tan1M
         +Z3t4FMo1Y7mE3QrjfgG/Oe1fp+p3aJHLM+GvpP9kO1bLd7DKEev4kvADdgobndDzpqP
         LKcEkXApdDpVKQHnWSQkVfe+kFQpbUUKU9dUtzrcmIE175NKs2vGzzQwaIjzbyYdyRVh
         Og+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234999; x=1792839799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=NHogU+UQg5QpSObFqaCLzq6XZt6qyekaAYhuHSTNEbp8INttkCW6DBgZ6mfu/zW1rv
         /lhWOGsV5T5Wu15SGnAE+W9q+YkfZc+Khu6QcUUBPWOd9GaS6XDyVgpP29isNu3PI2S8
         Zkjsos2rzti1DBsRUwyH0MvReKX1VHnWK0YV7dEeTWTo3kUALGWURHmfckhQEEYu9tgt
         EjsS3kb3tC/5Wn8AmYZMzzS5EBk1E8GyRHScqdNGCnZphrWZJmbwAKTj+yCh5/4B1qBc
         5PkbrYpHb6I17dNBYd5vETlaOmaE+IfUfO5QzR5wlFF9RN+8whCVMSGmq3uVK6FcrlHz
         82bA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ8Jjvi8BSggcbbiX4I70NNp9IOdYONpW4nTZLzDQI8+ARMOn4qiTS0k/IySE4wPC9GWvj3D2jTTnRBRh5qwG+@lists.infradead.org
X-Gm-Message-State: AFq9FYJoq/33CKSO2F165qQ1tOkezNjTH5ECVHLlnDufevQkVuG3W18m
	LopeijYkz6cLuuqbemdlMu1Awk0ehsW5zFwL8tgVUCZq+sAvE7c3qqLs
X-Gm-Gg: AYBFou1PfT5L15W99eT5O1OhG6VBpPqpRsHEGmnJFA53EMqSTC+ccjSTCR6A0CIZwaC
	GjaQqIGlJ1Vg4KzBd9fdANh76sPqSWC6qXApaqYKj/dP9OaVXuaQ7UT2NtcFmioQPkVs9+sbZIy
	fLPb219An3bqs/ol9g8oxOspqW6HH/9tQqf+XteV4flDoxD1TyhDs0Nq+0GMNN69P6KrkkOHIvm
	YDEqer6r/PoOLc9Sm5WSKsr8lv6yRLugozzhmiyX1sDxAprVizmQbNMqhhe9vSJCr3BHdOCKy8k
	Lxxt4j9E5d3hDMC7EgpFMKB8xtWvXZczIeijY46qwOY8Sxk8tedSmEw83s0gzV+xmubCPRaX70p
	C9xgAtoavesE5rV+WTykMEpWcVc13YqY7mcP/BguuAN9EFqyEZLePrrZ22W52rPqwUDNxujDwpR
	8FuHhKj3FsVPSRBXQgfHOsGZJPj2hjcsCUw9py3KjGjQAcZCXtn0muyieXkbKH3JNo3x2iMtvbE
	JDVHB8Pe1UNQ2UDATtULQ==
X-Received: by 2002:a17:902:d512:b0:2e9:3c24:999 with SMTP id d9443c01a7336-2e9a6c0de51mr23081545ad.40.1792234999087;
        Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:18 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 4/5] KVM: selftests: Reserve memslot 1 for the ucall MMIO address
Date: Sat, 17 Oct 2026 18:02:12 +0700
Message-ID: <20261017110213.46199-5-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040320_061427_8D585221 
X-CRM114-Status: GOOD (  11.57  )
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

Back the ucall MMIO address with a read-only region in slot 1
when KVM_CAP_READONLY_MEM is available. Writes still exit as
MMIO, while overlapping memslot creation is rejected.

Start test memslots at slot 2, leaving slot 1 reserved by
convention even when read-only memory is unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 759d604d44ce..4dbb2ef332fc 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,7 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
-#define TEST_MEM_SLOT_BASE 1
+#define TEST_MEM_SLOT_BASE 2
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..73e28814a226 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
+#define KVM_UCALL_MEMSLOT	1
 
 u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
@@ -492,6 +493,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
 	int i, flags;
+	gpa_t mmio_gpa;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -514,14 +516,19 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
-	/*
-	 * TODO: Add proper defines to protect the library's memslots, and then
-	 * carve out memslot1 for the ucall MMIO address.  KVM treats writes to
-	 * read-only memslots as MMIO, and creating a read-only memslot for the
-	 * MMIO region would prevent silently clobbering the MMIO region.
+	/* KVM treats writes to read-only memslots as MMIO, and creating
+	 * a read-only memslot for the MMIO region would prevent silently
+	 * clobbering the MMIO region.
 	 */
 	slot0 = memslot2region(vm, 0);
-	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
+	mmio_gpa = slot0->region.guest_phys_addr + slot0->region.memory_size;
+	ucall_init(vm, mmio_gpa);
+
+	if (vm_check_cap(vm, KVM_CAP_READONLY_MEM))
+		vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+					    mmio_gpa, KVM_UCALL_MEMSLOT,
+					    vm_adjust_num_guest_pages(vm->mode, 1),
+					    KVM_MEM_READONLY);
 
 	if (kvm_random_seed != last_kvm_seed)
 		kvm_seed_rng(kvm_random_seed);
-- 
2.53.0


