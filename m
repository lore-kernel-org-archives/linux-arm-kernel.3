Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29822C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ESC0itWrrYha2Tf9gSEwP/cvcMjKDVsb022arfffBY=; b=U66T6yczo0MGe6NkJnRUO8LnPl
	E3XdM6BnxC61IDmq90xtCtsCs4m0bj5X16IkEdE4wVRPq5cu/k9ZamJnRgZjUU5cRuTnLX2UAT57I
	So4Snx8AIb2wKFPmVvcQfXzz1YTUKXRNVkpFa3StNj5+UbjbT+Vng9KmMMVHwj+UOp3DNb497EqoT
	FABbl6lD4DZD4uRz38nDZCUKxGpRxJlE+qM72Ts1a9C7BexFmHP4OhgyVejyAeZuDN3xdGV5zJ1DT
	bWYYjL7KzzSLo/o+V/kZIKMFqdeVtJHggevJeLHVVeHe8rFWNqcWzuhrdAFoXESJIbGD1UUBx38Ed
	SDLKujSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguA6-00000000L3C-3aaR;
	Tue, 29 Jul 2025 23:55:14 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEw-00000000DwT-12fF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso7303161a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829769; x=1754434569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+ESC0itWrrYha2Tf9gSEwP/cvcMjKDVsb022arfffBY=;
        b=pIzotQ/cebKFHtktNLGt5h+3FBFItiy+AmHsolN3lRKyfqa68LM88lPqmGArWqQfpn
         VjqsrhY+ViWDjiqmVZTuHSKM0GF0gYHWxC+5Pa7jjC0J+hsgQz+gnaRSiwGHKan+Eybs
         WxstbsqZKEnB3D7+yDsFxnGaUjJ/fA307WQxTWnTgb43X2jZbY9qD+kBecybFkXuK0x5
         Vc9gJf57iFZSYvqkVw+IFuIYsmShe/2ol9QggkjviN/hMQcsqdFEbiFsLnh5bcth/5ln
         zJXnPSrTlwNw2GvS33949M6cWVF27f/Xw72O5hCfsTfaqgeBs5akDVbQIhi9dzpXGPCQ
         vSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829769; x=1754434569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ESC0itWrrYha2Tf9gSEwP/cvcMjKDVsb022arfffBY=;
        b=HP/qKSA8G6HDT1yse8LsXL9K4zLJ5pqIYXkLIjaVZwgBIIupis114CsOE04ksPL8L+
         gvAXDKH/UoX3oWqr4InrpzRlTqR7Up7ppIEJOP41EvLny6II6aoAP/hai1LwUAtgdNTn
         D5XpQGSPkBNX/H2vDAM/FyD9W5A2r9QxVQJmW6WNwiRKn6nT3BIHfRfdDezPtgxm7b3j
         NA63jPb1Ix2wTuy8lqOAesm8oCMMASjuQQUh2af34ydQID1VcTdZswaqth4rnJXgITtT
         cqYs/kVVPQ0jMOiruOEtFOTAZiP+S7qApJbQC+RBq/OfGTBmoOvW8pc6mt7ZBoRqcNrW
         am9A==
X-Forwarded-Encrypted: i=1; AJvYcCX+9JW22op66o3o91d7Pa0WHOSweNX/GxQMcmORi7PBQx6WDFoL8bJere0YOwRdT92c/ZBTsGr+xweVIgxGVvSh@lists.infradead.org
X-Gm-Message-State: AOJu0YyXHFXGDbI6HveT1p6neU0FcX4URJ8l7tq2IB69RUVbQ3PIs5lo
	6372eNpF8qV4y+QPdIRc+PpmnAzo3XujoXRYWQ5K/8TnCIwbmNz6ambSs9MngVYu2wTRTey+Uic
	JZ9pJkg==
X-Google-Smtp-Source: AGHT+IEP72ZXZaJ48/ldlCnpX6zM87VMY86dQ66SFrkWz5+rNp24L8qvClHiEDb9z5cTOvOVU6+mQmJCcYQ=
X-Received: from pjbst4.prod.google.com ([2002:a17:90b:1fc4:b0:311:f309:e314])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2683:b0:312:1dc9:9f67
 with SMTP id 98e67ed59e1d1-31f5dd6b52fmr1710635a91.2.1753829769155; Tue, 29
 Jul 2025 15:56:09 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:53 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-23-seanjc@google.com>
Subject: [PATCH v17 22/24] KVM: selftests: Do not use hardcoded page sizes in
 guest_memfd test
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
X-CRM114-CacheID: sfid-20250729_155610_296092_ADF714FE 
X-CRM114-Status: GOOD (  10.80  )
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

From: Fuad Tabba <tabba@google.com>

Update the guest_memfd_test selftest to use getpagesize() instead of
hardcoded 4KB page size values.

Using hardcoded page sizes can cause test failures on architectures or
systems configured with larger page sizes, such as arm64 with 64KB
pages. By dynamically querying the system's page size, the test becomes
more portable and robust across different environments.

Additionally, build the guest_memfd_test selftest for arm64.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Suggested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm       |  1 +
 tools/testing/selftests/kvm/guest_memfd_test.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 40920445bfbe..963687892bcb 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -174,6 +174,7 @@ TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
 TEST_GEN_PROGS_arm64 += get-reg-list
+TEST_GEN_PROGS_arm64 += guest_memfd_test
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
 TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..341ba616cf55 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -146,24 +146,25 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 {
 	int fd1, fd2, ret;
 	struct stat st1, st2;
+	size_t page_size = getpagesize();
 
-	fd1 = __vm_create_guest_memfd(vm, 4096, 0);
+	fd1 = __vm_create_guest_memfd(vm, page_size, 0);
 	TEST_ASSERT(fd1 != -1, "memfd creation should succeed");
 
 	ret = fstat(fd1, &st1);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st1.st_size == 4096, "memfd st_size should match requested size");
+	TEST_ASSERT(st1.st_size == page_size, "memfd st_size should match requested size");
 
-	fd2 = __vm_create_guest_memfd(vm, 8192, 0);
+	fd2 = __vm_create_guest_memfd(vm, page_size * 2, 0);
 	TEST_ASSERT(fd2 != -1, "memfd creation should succeed");
 
 	ret = fstat(fd2, &st2);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st2.st_size == 8192, "second memfd st_size should match requested size");
+	TEST_ASSERT(st2.st_size == page_size * 2, "second memfd st_size should match requested size");
 
 	ret = fstat(fd1, &st1);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st1.st_size == 4096, "first memfd st_size should still match requested size");
+	TEST_ASSERT(st1.st_size == page_size, "first memfd st_size should still match requested size");
 	TEST_ASSERT(st1.st_ino != st2.st_ino, "different memfd should have different inode numbers");
 
 	close(fd2);
-- 
2.50.1.552.g942d659e1b-goog


