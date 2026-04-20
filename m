Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D187F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEgidxfCrHeWAn/iqKdfWB4mQGqG7JFMt/kzEyBGoSw=; b=p8W2UNDrJngC5Wss+Qof5+ijFv
	9w7byUGBSqxUfb1avaPGYl1K+t8HC043QOvEM+6rGZ7P+dgWLx7ojY4I8zhzCiXHaa9OGbzX9poeM
	nHK5qcJlkBi8wNl1l1x/EzxZtwrLkHBHjVDajGy0OOpwaEunWqJErxzIxEqLDqkiPNI5QMIRkgfgi
	+K9umFJUXDUn05h90ZSIAr9Bh9YOLppHADyx/bp4zONckmPsOg96U3UoBJF3tddRiaQBdeACV0m0a
	H8bJQAa+Qtuc5UlCeQlDKxVZwsgqB89oKyj7hML7GD8UmVQ/BB/ku10XXCL5UrxdQo9p0LCtkQg4Y
	7k0dQE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2X-00000007ff5-3Pbi;
	Mon, 20 Apr 2026 21:20:21 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2Q-00000007fUw-0Cfe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:16 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so1754712b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720012; x=1777324812; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sEgidxfCrHeWAn/iqKdfWB4mQGqG7JFMt/kzEyBGoSw=;
        b=TTTXV5v1+cBoOW5sJoFSM0JZADvFCfac3RjpqSRfPvk9wsaa8NToXmYcvnSHz1N3rp
         D+uYTAGy0yKvVcwOuNK//TmyoGorV2tH99UDNEZTTkAbWKmoPKJ7ssbWZTmr0jZ0RFb7
         QA2FzimoXAT8J6gwaCcivKDdb+GGabnvJksM6K4ZQjzZJQM2XSihT6t7BPsIIE7QFrkl
         iHBmX6m9/ejaz22AGZBbhC/ol44uYd5WDbg256ah5YAOcMphoMX051TFb740erkPtiDd
         Yd0zWgJPDoIi+ZKaSfBhTD+8lGwJCMuPRJ57vnUUDq32IxtuE7Ome2HkSXpK1iI4CSkZ
         9PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720012; x=1777324812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEgidxfCrHeWAn/iqKdfWB4mQGqG7JFMt/kzEyBGoSw=;
        b=AhB7QBxQTMtbN8aXlKlNHa+V9D7+YgkHLINChgYNPq6HNDzn1y8GFc5H5UiGnCJNLb
         tMjP9R5qpDm+7UbNLXRwZoV8Dc6ULjochyPhmsMJOwMIFmoqFvy044vXA4/OkeGyvTXB
         XWgn7UyypAisQEhYbostQkwN2tYiZk15T74UsBenwlWcUZp/CCsldM4v+huod3K9HXc+
         ZZLlSpj0wUbUdl/190wU3Q+qUjvuDIgPXv2HJMpIwjKKRmOTJPDiZ7Llh+QYzmNx8utK
         GjMVDAXjjp+2tMXdM9QaceaQDepccEQNAmX7nkW7xR/b6+coi82YKNEbXQ0VWVUl6W+C
         nz2A==
X-Forwarded-Encrypted: i=1; AFNElJ8B/7/GPjK2Oji8tjRCk+wHMDdOmRyGjaWfs3RO8JBBFWPHcR5Z8YkgoW59nu/TQg+dx+h232VDZftcyxe4iFFw@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCzUNqXkqVCKh1wxNDT22hdsLGUlEWF6kmRVolzrN9hbqO+E5
	STXlwazt7aYWigomh6XoGYDN+YfPXexw2GR9e2nBzhVkfdRSBKc4PV8gdgkh4A6a9cYb2/nwvfp
	ai9uK1g==
X-Received: from pfbli8.prod.google.com ([2002:a05:6a00:7188:b0:82f:54e9:c13e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:27ab:b0:82f:6eca:563e
 with SMTP id d2e1a72fcca58-82f8b573171mr11858630b3a.34.1776720011915; Mon, 20
 Apr 2026 14:20:11 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:48 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-4-seanjc@google.com>
Subject: [PATCH v3 03/19] KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142014_122873_2160C994 
X-CRM114-Status: GOOD (  13.62  )
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

From: David Matlack <dmatlack@google.com>

Fix various Hyper-V selftests to use gpa_t for variables that contain
guest physical addresses, rather than gva_t.  In practice, the bugs are
benign as both gva_t and gpa_t are u64 typedefs, i.e. gpa_t and gva_t are
interchangeable from a functional perspective, the code is just confusing.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
[sean: call out that both are u64 typedefs]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/hyperv_evmcs.c    | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c      | 6 +++---
 tools/testing/selftests/kvm/x86/hyperv_svm_test.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index c2de5ac799ee..2d1733f9303a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -76,7 +76,7 @@ void l2_guest_code(void)
 }
 
 void guest_code(struct vmx_pages *vmx_pages, struct hyperv_test_pages *hv_pages,
-		gva_t hv_hcall_page_gpa)
+		gpa_t hv_hcall_page_gpa)
 {
 #define L2_GUEST_STACK_SIZE 64
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
index 1059fcc460e3..0360fa5915c0 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_features.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
@@ -82,7 +82,7 @@ static void guest_msr(struct msr_data *msr)
 	GUEST_DONE();
 }
 
-static void guest_hcall(gva_t pgs_gpa, struct hcall_data *hcall)
+static void guest_hcall(gpa_t pgs_gpa, struct hcall_data *hcall)
 {
 	u64 res, input, output;
 	uint8_t vector;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index 7d648219833c..5369867efac3 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_ipi.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
@@ -45,13 +45,13 @@ struct hv_send_ipi_ex {
 	struct hv_vpset vp_set;
 };
 
-static inline void hv_init(gva_t pgs_gpa)
+static inline void hv_init(gpa_t pgs_gpa)
 {
 	wrmsr(HV_X64_MSR_GUEST_OS_ID, HYPERV_LINUX_OS_ID);
 	wrmsr(HV_X64_MSR_HYPERCALL, pgs_gpa);
 }
 
-static void receiver_code(void *hcall_page, gva_t pgs_gpa)
+static void receiver_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	u32 vcpu_id;
 
@@ -85,7 +85,7 @@ static inline void nop_loop(void)
 		asm volatile("nop");
 }
 
-static void sender_guest_code(void *hcall_page, gva_t pgs_gpa)
+static void sender_guest_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	struct hv_send_ipi *ipi = (struct hv_send_ipi *)hcall_page;
 	struct hv_send_ipi_ex *ipi_ex = (struct hv_send_ipi_ex *)hcall_page;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index e0caf5ea14bd..54a1a6dad4d5 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -67,7 +67,7 @@ void l2_guest_code(void)
 
 static void __attribute__((__flatten__)) guest_code(struct svm_test_data *svm,
 						    struct hyperv_test_pages *hv_pages,
-						    gva_t pgs_gpa)
+						    gpa_t pgs_gpa)
 {
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
 	struct vmcb *vmcb = svm->vmcb;
-- 
2.54.0.rc1.555.g9c883467ad-goog


