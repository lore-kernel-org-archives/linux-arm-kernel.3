Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=; b=dezIpBwLtZ39DsWyNoMD8ETqNi
	0fmS0FQ6TUHKZizwvapauyzjFhn4TjYSEyID/1QsFi1XGaItg5U63adbgilcz0ryhZTJQOB3uPcuO
	0/7uu7rGCV2xgAgqWFViR3BJ+Xa98PFjuYhEQdVF3XVAF0vdv5OvjyqlNkdBIU2pMQ99oy0BPAhGz
	UAMA6HoE5kbsfo+cIEgTwMcwIdVFqkA67PriYQzu6xjKbxef7W8YpabHcqtpD3rAi9OzlGxbPB53k
	aiSTmYhtbTX3XUvdfzub47x/DuADX1qqWhSJNZUYjfpJicxwc/y4CnPOjY3G/0dVqOKE3M2LabLVk
	Iu4cAsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS4b-00000003epC-2C4z;
	Fri, 20 Dec 2024 01:45:01 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz2-00000003cz5-2ST1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:17 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-72aa68f306fso1227577b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658755; x=1735263555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=;
        b=dqmpaYvsouZlmnoDUd5y+4P9GMHVvzfaPxrPv5bOvpSo/xf6LGELMSD+lWwEsFARSX
         vM1gHqbSbdY5BMCYshNI5u4Qbzpjc4QjNAGK6k1UXd696Wslo5Fm2RLPSFpC/DOR7Emb
         TQNUvB8d2nVepACaM+QxjOXfd9Sciyl4HgKBPv6kN14J2CLf2lHetJ+T6NnY3mbm0s9l
         DW6qQ7rdjHvW+WlVKxNeMawJy9VemWuR/6/mQ92DNERN6SnwSG5lxOZBgd3oxo2zF2jo
         i5vz2p/MC2LA0UksinKF+04wnWjufbQzvztkq4vOFePkMG4a1J0tdrW9Sgpvg03AlhgC
         YJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658755; x=1735263555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=;
        b=cj4/WNlM70+Lp/9CKlI5qgoBcovZ+u7s8BaIk+ygkrLwSYGw42dlFSw3G1P5U3B4Po
         ztKgBjCoH3MgAINM1Vp75ClZnJH/tcCoO3RoG872DG/U8xr0EzSiDlzf7NEHsqvT1A3Y
         Ln/9pQAvPFkvgM47xkG/tsoVESMpmWa9eUCF/wwrGz+xcfhrTxRE3KdwJE+92Hem/IRR
         pUlQtDfZcm/pnhb5JKOU7UT4FiWXqaRor8LYJ7oz1ySUHYx8XdhOzE+h/skIVAh7mUp6
         S9DxexPacjdUUNzuIM3t3AcI43ORTRF+ZRE4QnUxOi1Idry++4RebzQfUxMaouXYQA1q
         qx0A==
X-Gm-Message-State: AOJu0YwtY9wPHlWaXizAphIb6YQKbRtScSltUQbBtvbU7ye6Gg25PSc1
	VOrnG9gHlwc0MnNrVHaY+SXcBaptknQpFSA5Wq7oNiX70s4TdvB5ykvXYHrgQIyfFBOwaa/QQ04
	XBg==
X-Google-Smtp-Source: AGHT+IGgztxRUxTUpaMUvL86uRz7hYZyu/zAmCoVzo4yvg4Q5SlFHbLBFYN3ktm59BGI0bTCiW14R+y2ITQ=
X-Received: from pfbkt9.prod.google.com ([2002:a05:6a00:4ba9:b0:72a:bc54:8507])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:33a6:b0:1e5:c43f:f36d
 with SMTP id adf61e73a8af0-1e5e046189cmr1878060637.18.1734658755535; Thu, 19
 Dec 2024 17:39:15 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:02 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-5-seanjc@google.com>
Subject: [PATCH 4/8] KVM: selftests: Macrofy vm_get_stat() to auto-generate
 stat name string
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173916_647935_94865BD2 
X-CRM114-Status: GOOD (  11.23  )
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

Turn vm_get_stat() into a macro that generates a string for the stat name,
as opposed to taking a string.  This will allow hardening stat usage in
the future to generate errors on unknown stats at compile time.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h     | 14 +++++++-------
 .../kvm/x86/dirty_log_page_splitting_test.c        |  6 +++---
 .../testing/selftests/kvm/x86/nx_huge_pages_test.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..044c2231431e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -534,13 +534,13 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 		   size_t max_elements);
 
-static inline uint64_t vm_get_stat(struct kvm_vm *vm, const char *stat_name)
-{
-	uint64_t data;
-
-	__vm_get_stat(vm, stat_name, &data, 1);
-	return data;
-}
+#define vm_get_stat(vm, stat)				\
+({							\
+	uint64_t data;					\
+							\
+	__vm_get_stat(vm, #stat, &data, 1);		\
+	data;						\
+})
 
 void vm_create_irqchip(struct kvm_vm *vm);
 
diff --git a/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c b/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
index 2929c067c207..b0d2b04a7ff2 100644
--- a/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
+++ b/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
@@ -41,9 +41,9 @@ struct kvm_page_stats {
 
 static void get_page_stats(struct kvm_vm *vm, struct kvm_page_stats *stats, const char *stage)
 {
-	stats->pages_4k = vm_get_stat(vm, "pages_4k");
-	stats->pages_2m = vm_get_stat(vm, "pages_2m");
-	stats->pages_1g = vm_get_stat(vm, "pages_1g");
+	stats->pages_4k = vm_get_stat(vm, pages_4k);
+	stats->pages_2m = vm_get_stat(vm, pages_2m);
+	stats->pages_1g = vm_get_stat(vm, pages_1g);
 	stats->hugepages = stats->pages_2m + stats->pages_1g;
 
 	pr_debug("\nPage stats after %s: 4K: %ld 2M: %ld 1G: %ld huge: %ld\n",
diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
index e7efb2b35f8b..c0d84827f736 100644
--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
@@ -73,7 +73,7 @@ static void check_2m_page_count(struct kvm_vm *vm, int expected_pages_2m)
 {
 	int actual_pages_2m;
 
-	actual_pages_2m = vm_get_stat(vm, "pages_2m");
+	actual_pages_2m = vm_get_stat(vm, pages_2m);
 
 	TEST_ASSERT(actual_pages_2m == expected_pages_2m,
 		    "Unexpected 2m page count. Expected %d, got %d",
@@ -84,7 +84,7 @@ static void check_split_count(struct kvm_vm *vm, int expected_splits)
 {
 	int actual_splits;
 
-	actual_splits = vm_get_stat(vm, "nx_lpage_splits");
+	actual_splits = vm_get_stat(vm, nx_lpage_splits);
 
 	TEST_ASSERT(actual_splits == expected_splits,
 		    "Unexpected NX huge page split count. Expected %d, got %d",
-- 
2.47.1.613.gc27f4b7a9f-goog


