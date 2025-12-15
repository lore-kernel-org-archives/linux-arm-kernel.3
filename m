Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E18D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=; b=J3vSas3yKZj1GrL+dFBGeK6KTW
	RFaECRkLYScAsoVV+1/lIWz2r7GrVd121sEsFmRFfYl8uQZOideGyQ0qb5A6KKol3vHRYbV+GcpqH
	LtRKIerSqxQQiO5gT9vo66kDGMCoZQnlbWA6K4zpb3ybwIP0ipQkC9Bl8KYwHh3fkyYfRbyOl8say
	95ae5MXopNePZLahfO/i9VPKGttuB0i89crW9bPiHCzv3wmUmaHDdYPbvURo7BmRMaMbL1K5oqBhf
	JzM6ZdwuXnfPe1urY8TwF1R56V+bTV1y5lbnu2Cug4T1/UWXrSQyWyHK3EPbqg4GDTg4pk5C3r529
	6szJhHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlj-00000003v30-2MZx;
	Mon, 15 Dec 2025 15:45:51 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlY-00000003uuR-45Dq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-430f79b8d4dso815328f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813538; x=1766418338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=P5q3nl115cnab+x/wLjguF8OeFb2J2iGwAL0EfSWzqV17FsC0I+1ycCnBWJvKTwLfL
         46I+wSyhsnLe3aacJ3KoS1r/PP/yhEHNtUbIjQOC5JKu7WFSzCW6XcTRgdCQK46xjvPi
         2C3Ca4saaGV1FdYTnwgPD46SrIV5UQcOpG/MGdDGttzGS8hVdJN2wKMk0nV6ahPwO8N3
         XNoyRDvt716chNE5FNjQzhTmbOUU33220w9DgfJTJ2UN8jc/KJFg69OXP2WiyRY9jX4w
         a0xOyFdfeGYbdrMj5YwgAp20PRhIedhm85MLr0BZO2sKN+vMo5SNn7+mTUKGs+utz35p
         Un6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813538; x=1766418338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=QXLPadCYoZtcsqrJKI/USg04pjyHO3nKcXO7BsBlkIpF5D7buE5LRK6YeWVkrYDr95
         ZsT/Px+qPkvei6vTooW3PhB2O05UuhwoVpf9hq1xv3b6jn5v9N7XO0ax0fjYs4XB/EJi
         K8YBgDBesPnvdmMi2AyAzLPDnbT4NEIlFhCM4DyR5wradJjzgsVjI1ZiNCe3y1Ve3dL3
         WCZXxMCyj46rXluM0Cvl6DTCP2nctG4iGI3vnC4rdK1lTTTZy0JqFa4kUdEUG/QIGWRV
         tFunmu1/BsENh/+fE1Jq2Gg2ccvOj4DR06wkcKz4qBSNA8SrEGIpGmZXe69XyqtUQwsb
         v4ow==
X-Forwarded-Encrypted: i=1; AJvYcCUiyjOwHw35nSrN3tNXFcqIHsILHkHB7xgXIoD/5SAs7PC00ZE/aahH173RROepmpdpnWuwnyuXDgwovTJdCRv3@lists.infradead.org
X-Gm-Message-State: AOJu0Yypz2+XrfPEJMmH+g0eEJK83yXcEiaJVz/S6K4KRl/cs/QNlOHS
	7O6bqihjCr48Imoes0cdpkjUmLjzautk2SyRWsVSETuRdmhpQF9EqYXxYmgzUWdEM0vdwm/u3pR
	fVA==
X-Google-Smtp-Source: AGHT+IF1MpRc9WCV4iNqOeKkM/bPydRIafajA/wmrsGONtcLwMuxj9cblPfLQA8xrv+eJQIjYXzjtyAfRA==
X-Received: from wrbfv11.prod.google.com ([2002:a05:6000:2c0b:b0:430:f798:7803])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2307:b0:431:32f:3140
 with SMTP id ffacd0b85a97d-431032f322amr854887f8f.12.1765813538338; Mon, 15
 Dec 2025 07:45:38 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:32 +0000
In-Reply-To: <20251215154533.3154405-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215154533.3154405-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-5-tabba@google.com>
Subject: [PATCH v1 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074541_047423_6A38DEB9 
X-CRM114-Status: GOOD (  10.72  )
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

To avoid code duplication, move page_align() to the shared `kvm_util.h`
header file.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
 tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..dabbe4c3b93f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 	return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
 }
 
+static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
+{
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
+}
+
 /*
  * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 607a4e462984..143632917766 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -21,11 +21,6 @@
 
 static vm_vaddr_t exception_handlers;
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d5e8747b5e69..f8ff4bf938d9 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 	return !ret && !!value;
 }
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
 {
 	return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
-- 
2.52.0.239.gd5f0c6e74e-goog


