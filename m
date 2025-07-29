Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C140FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 00:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EorjiQ424BTohGrqf8DNWx/AmqFoym4CNGeVIARROHM=; b=jW9YbkGdGxc0GpMrc7qwK0VZ2X
	H3AZPjdItugT1Vf9QTZwYV2J2VaKnG406Fh2U6//IwAv6eq2FcVwxHwq61QzBBKQ838KZUy9JZdYc
	enu2/7xa0K1MCxdAtejIYyMs2asf3NzsoWVicF9LxfID26KewaKHEs4wom4HdGGhJl5MVYqkjs4R1
	cM1jSOHdpVN3khKtgoYpv3VoatbVuRKwY5bzIC9aN6PCrC1KT5zBRXlFAjp+Eqz4TGeSYdVKIPS7Y
	3RWO3q/ZQmFsDnR+YyxguiHh+AgUIQRpmZqaBrztuvpoCz+la38ZRosejP/k+AMkGct9uCKI/bBvD
	JAZUpsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguEy-00000000LXs-1zZo;
	Wed, 30 Jul 2025 00:00:17 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEz-00000000Dxg-32JQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31ea10f801aso5782102a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829773; x=1754434573; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EorjiQ424BTohGrqf8DNWx/AmqFoym4CNGeVIARROHM=;
        b=3n8ExzMhZ6doY32SS+cevRoNskmSW7ApLG+NSgN54LOfhROGyuUA208WePXUHNjc32
         hXhQWEJIC/56h/QYG8L8xQNBDqM2e+RfVre+MbTwUEXX/z7hMB7pBpPHSN48dSTKfkBV
         v3p0pL6VOz/x9V0TqkrXqn6WbdasVT2hrADTJuKX2/n3jERZMqumvkN1+p15AyY4vTUL
         pgYVFyMgmNA1py5ixFHCJqRGiQ+r5v33cLUcYay3lxFsi7b2BKH1g9kxgQEDP4ghZw8b
         M7mWT0KDNVl3vG+UMGXQuczwNimdXRjwMAQGfu2KkpzVt7v7/bFIVE0GCmrkc9TyXtiZ
         o+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829773; x=1754434573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EorjiQ424BTohGrqf8DNWx/AmqFoym4CNGeVIARROHM=;
        b=FlUIU5FRl4RN9C/tbNI17KoPZFMFx3gMuOBhFcu9HkrpFZIRyEDZEjwuICtjzNva1G
         ug+xQNE27WBxZIQmJTDDs6cTCUjhMHQxpvY5ZEB+QUCMKBiFdEpiMcCojeOYv4h3FWN/
         YJ6A8c0M2C4GWyYIlIGITtUrYkobW7BpHaz4knkFgdgJ3qPhGf6gBNRsS6HO+tzVtfJA
         bzAQF+P6O8PwoT+cNMjuqn7JZ6c0/7s2+1e+GkNMtyaSMfIaT9Jt5auOSWuywG4GCJW6
         Bepge/agvVIxuhEjEwqEFQmLszH2Sp5AY0b4TY6jHzQ4OvsDZ1m1t6E1yJc5nKzdeoBq
         q1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoq59XVsb1QejHCyDFP4e00RalElYi27d+mBqctV16WEdBxiRzM6Kfn/TxpqX2hXK29eOgzprJgM2CJZlX6/RO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9slE/cLS9eanRsVlBBfj/Aaof/eSHmwTdiQHKD7AUf74L08jy
	K+MoZVdtwIGVqtcpLpG1XI6Ac+ykFnPRJg3cpRsoJUZTMrDAsa9fz65OcFraGbdOOLJh5V/0hWG
	+UIvd8Q==
X-Google-Smtp-Source: AGHT+IHB9c2363ufbpvtr+JBuwDrzcLhfsH2Xd3qM0cBsmlln2L/OVyYyxyGr5yAT46jm6mjT2DN+GL7x3k=
X-Received: from pjee15.prod.google.com ([2002:a17:90b:578f:b0:31e:fe0d:f464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:288b:b0:311:df4b:4b94
 with SMTP id 98e67ed59e1d1-31f5ddb7ea8mr1459342a91.4.1753829772835; Tue, 29
 Jul 2025 15:56:12 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:55 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-25-seanjc@google.com>
Subject: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155613_760948_30E51BC0 
X-CRM114-Status: GOOD (  14.91  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a guest_memfd testcase to verify that a vCPU can fault-in guest_memfd
memory that supports mmap(), but that is not currently mapped into host
userspace and/or has a userspace address (in the memslot) that points at
something other than the target guest_memfd range.  Mapping guest_memfd
memory into the guest is supposed to operate completely independently from
any userspace mappings.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 088053d5f0f5..b86bf89a71e0 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -13,6 +13,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/falloc.h>
+#include <linux/sizes.h>
 #include <setjmp.h>
 #include <signal.h>
 #include <sys/mman.h>
@@ -21,6 +22,7 @@
 
 #include "kvm_util.h"
 #include "test_util.h"
+#include "ucall_common.h"
 
 static void test_file_read_write(int fd)
 {
@@ -298,6 +300,66 @@ static void test_guest_memfd(unsigned long vm_type)
 	kvm_vm_free(vm);
 }
 
+static void guest_code(uint8_t *mem, uint64_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++)
+		__GUEST_ASSERT(mem[i] == 0xaa,
+			       "Guest expected 0xaa at offset %lu, got 0x%x", i, mem[i]);
+
+	memset(mem, 0xff, size);
+	GUEST_DONE();
+}
+
+static void test_guest_memfd_guest(void)
+{
+	/*
+	 * Skip the first 4gb and slot0.  slot0 maps <1gb and is used to back
+	 * the guest's code, stack, and page tables, and low memory contains
+	 * the PCI hole and other MMIO regions that need to be avoided.
+	 */
+	const uint64_t gpa = SZ_4G;
+	const int slot = 1;
+
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	uint8_t *mem;
+	size_t size;
+	int fd, i;
+
+	if (!kvm_has_cap(KVM_CAP_GUEST_MEMFD_MMAP))
+		return;
+
+	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, guest_code);
+
+	TEST_ASSERT(vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP),
+		    "Default VM type should always support guest_memfd mmap()");
+
+	size = vm->page_size;
+	fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP);
+	vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size, NULL, fd, 0);
+
+	mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
+	memset(mem, 0xaa, size);
+	munmap(mem, size);
+
+	virt_pg_map(vm, gpa, gpa);
+	vcpu_args_set(vcpu, 2, gpa, size);
+	vcpu_run(vcpu);
+
+	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
+
+	mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
+	for (i = 0; i < size; i++)
+		TEST_ASSERT_EQ(mem[i], 0xff);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
 int main(int argc, char *argv[])
 {
 	unsigned long vm_types, vm_type;
@@ -314,4 +376,6 @@ int main(int argc, char *argv[])
 
 	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
 		test_guest_memfd(vm_type);
+
+	test_guest_memfd_guest();
 }
-- 
2.50.1.552.g942d659e1b-goog


