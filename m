Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08745CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=; b=CYExWUlWGNm6Yi39VnPxbIq9SV
	B46/p4Ybxg4kg/gdgIXkkRm0Mbn1esy4cwSvgABAfhv7ltyOOrdE6tb/VCNwsMR+sA23WKW4y8Zik
	o9sTMPsWd34euzQjrIZlg7foCAfb9Mh2BZgNWdGKCXDlh7VGsp5Iw9yQFy4lYrH62SvxlRo9wSNA0
	nbnGPwbXz7U+zbD+MXbJ7OeEZEr2dHQIFkxVCAYD1j++20mXVCNJsNTjFfOXkmKLR6CfLgwL0EDHo
	bkn+wzh97c3lukoeRbhE7X5PbXPpzIrZZHBOdpZaHkBriXHAM6ye2R4Ye3eLZ8ZMsNjJZuG/TW/Ov
	VpgOuGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CY-00000004hhk-1z0n;
	Sat, 17 Oct 2026 11:03:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CK-00000004hX1-49dU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e812e2b31bso3584475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235012; x=1792839812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=jK+0Sjrqpju1AkuXLTRUyuKjIDC4qhrN2fR7xsnfuHWijU3ZNlY36894EawAU5OTj0
         6+j51KmhE3lIuQsJyaFKLIvU9Sgg/PFuhKkgyULxWgHutsWBl5X0aPoGGS+2VbZnnptJ
         C+hQy0iBPDTtQurKwDtuVF82yII92RBa9au9NBv252Q91MiZoE6D0Au37O70tcSzWbNI
         qg8PbapbkCOqY7Et9E0Xm8NM8k5WP8a3E6/FkyPcJzZZV9GFkCMxm+5EBWCdQOGfKFAw
         LMP1hfJhE5snrLPvqbUULK9YbIAXdrWCxPktZlqCwO+9e7sfZwrJ/JVrZB/KUN8nZQUI
         KNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235012; x=1792839812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=cXRJVAAr3wginrwHDzFdtLqy4HJ0ajvLzn8dj2k7pfEeluyvlvR8uqha9rEGTmRbEI
         LLQYKXM548RjDsuN+EbnKT51CXunyGOJO52LtFgRO+NRqVsDoQDMwQMsB7/k33CrDGre
         HHb+mWtqlLfnP6T3GM/VDhiBuKUKmbxDR8DFLI3hDdTzmJMxDjTs6twN6BY/UJR9YUQ/
         /v+FIf3kIt5Xd5Xg6LCbpmS1e0Y6HMpzezGbT+6iqwDhhkzhOxGcGJBkcKmAjUAiRLoa
         aHj20v+h+e/6FD75pkIt9jxBjhrg667Tgm4PtUQnGI8eL0jYKTqElDs1P+w4VWl+shTV
         s1qw==
X-Forwarded-Encrypted: i=1; AKwUvBzFsOyui+g7dKaBkDCatTVMHxkdl97yYK9EUJx3dK7KS/mxlBOyqAicx3IWUZ5jBZUA6mddv8jaKEZOeL/PZ3Y9@lists.infradead.org
X-Gm-Message-State: AFq9FYJMd2X3/6Pmm5WOl4DLKWz5WcATsSYW+gMV/tnxnO5Eh5ugE3TM
	OrR3m87vSgCS4Gvx1Wk+Xr5Xu6AgyEqLKVYMYOMNFXeTZNr3Ffho/FUp
X-Gm-Gg: AYBFou3cD0rO/4Bmzd3piu6xapVkxde2bTysQO2W9DYVSlNE/oxR8gK9VKjlDw0ZEcQ
	RYd6qFgbySG8AaBGcQio9grbPp5n/lhLQPp/FUwFCJQLgQtKOIXpwum6034dAfLm8wy9uBUEmxT
	dVqOVnzcHMTmBEmd8F392Fcavlrm9fsWBC7qOaRYar1kpRL3wT44bVH0UXfhCtQWccRtLghmiq8
	QF2DDyIvPc1UY+DuC+6jm+g+RkBDyRn+cBSO9dQ5f/CZrx9elE6SU3vdHop3nwm5Mlx2NYYTC3d
	53+iGNsm3V79wFPtSU3mVNeqmxGc4qlCPfMBgmFucAX+9R9d24QbRMlzsbNhPISdoUYXMlrAfP7
	S97PGswXvF67od74yxYAYH6lxbHnbLpi5q/I4iTMPaTiDfJIt1TNOTqf+N3igtKO0i3gK2w3KKV
	+EobqifOYAnuZD45SycmGB8DgM0bMGrqjsVQ0MGu0K08WT4QMWJmowrPHGcKOecHCWYZrrSyA+6
	Ew3CjJOQOFf2HiE3eZWVA==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr22504755ad.30.1792235011936;
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
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
Subject: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
Date: Sat, 17 Oct 2026 18:02:13 +0700
Message-ID: <20261017110213.46199-6-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040334_048689_42AE8E43 
X-CRM114-Status: GOOD (  14.06  )
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

Verify that creating a memslot overlapping the ucall MMIO region
fails with EEXIST and that ucalls work before and after the
attempt. Skip when MMIO ucalls or read-only memory are unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/reserved_slot_test.c        | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1f4bc2a1322d..ff4a5e9733e9 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -68,6 +68,7 @@ TEST_GEN_PROGS_COMMON += set_memory_region_test
 TEST_GEN_PROGS_COMMON += memslot_modification_stress_test
 TEST_GEN_PROGS_COMMON += memslot_perf_test
 TEST_GEN_PROGS_COMMON += vm_types_test
+TEST_GEN_PROGS_COMMON += reserved_slot_test
 
 # Compiled test targets
 TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
diff --git a/tools/testing/selftests/kvm/reserved_slot_test.c b/tools/testing/selftests/kvm/reserved_slot_test.c
new file mode 100644
index 000000000000..4a908017ca73
--- /dev/null
+++ b/tools/testing/selftests/kvm/reserved_slot_test.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define CLOBBERED_SLOT		TEST_MEM_SLOT_BASE
+
+static void guest_code(void)
+{
+	GUEST_SYNC(1);
+	GUEST_SYNC(2);
+}
+
+static void test_slot1_protected(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_run *run;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u32 nr_pages;
+	size_t slot_size;
+	void *slot_mem;
+	int ret;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	nr_pages = vm_adjust_num_guest_pages(vm->mode, 1);
+	slot_size = (size_t)nr_pages * vm->page_size;
+
+	run = vcpu->run;
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 1,
+		    "Expected the first sync before clobbering the ucall GPA");
+
+	slot_mem = kvm_mmap(slot_size, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS, -1);
+	ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
+					   vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
+	TEST_ASSERT(ret == -1 && errno == EEXIST,
+		    "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
+		    ret, errno);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 2,
+		    "Expected the second sync after attempting to clobber the ucall GPA");
+
+	kvm_vm_free(vm);
+	TEST_ASSERT(!munmap(slot_mem, slot_size), "munmap() failed, errno=%d", errno);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(UCALL_EXIT_REASON == KVM_EXIT_MMIO);
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_READONLY_MEM));
+
+	test_slot1_protected();
+	return 0;
+}
-- 
2.53.0


