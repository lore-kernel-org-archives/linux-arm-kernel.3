Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4B4C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 00:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQBtHoV4k6KEICmmP/ngOD0EM850XDOZaHNBuV2LJiQ=; b=JjFnQOiiuA2xZUCAFccqDB3OmG
	M7L6E+PHS/vUgPOFffujKHR6py16NJRTWR08xc8gZ7oAlOfFjuBZfP9tCT1l+v89oT2/H+OjXYxXW
	f2IyGMMmriQHLkqwT2tf2nFLBIXMRPm8Y2VTuZKN8BLmwCwyiCfVH/j0k34dgLzftYuYuiOdNgpd4
	cRw1qYV+8ItnwLE4q131SUYlYh33SYnKHHcN8voMWfz5kJdKc9dODH3WmpvZfzBvlUYe0zJpa6K1J
	Sha2tGMmutyAt6Xjz4oZKmUXPvUMsnPHFGwYIZYmHeoc8scPqpcC2ydYWy4tCEEaJgXk5KvuzCxPl
	m6vK9WlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbY-0000000Clzp-3heV;
	Fri, 20 Feb 2026 00:42:48 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbQ-0000000ClqH-3mV1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:43 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a92a3f5de9so8699485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 16:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548159; x=1772152959; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQBtHoV4k6KEICmmP/ngOD0EM850XDOZaHNBuV2LJiQ=;
        b=CzMd6QqNHTKJceIOgQV8NrWXAteF2h3LCpt9JiEpXYmn7tJ0sJrREsCR1DW9G9vZnl
         zQnYBEjusTeQ2ofBIfXCoOI9d+u4r7phFWt1vZG5yeMo0ZIicMFe01dGT2taIJpRWhEu
         Honn9xOe/kjg/eei4YKH/AlnkBDsyK9/TWevrgktZL7x7CKWPnZE3MATG/+NgMvtmN8H
         MlV3MgDAydXTugN9zTg4fRzy9mlFc/crWg1WqT8MDXavfssRJB1fDYrLaaNu1UqGGvjn
         1Nmt0PzlCz+hvq9iPQeexpblryEUUIVViZVQDQiXEECnvADavV3Jrf9ah3pSruHkLQPU
         0LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548159; x=1772152959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQBtHoV4k6KEICmmP/ngOD0EM850XDOZaHNBuV2LJiQ=;
        b=Fspz4+9wvd5KDRg1imtMVpvurjJ2RXIBa0q/u25wjkVgoCEFhfQvlE6HnpNENR2GAt
         H2jAj+tysgKJyjpfurNbFU7oE2c+b+j1LabZlPNoPAhyM4RP+U8e8UnyJk0Q4BU7zng3
         74Ylyttbt71lZ3RrHu0fulhafZqFT2OtR+ImV2ZyxiKyx/gUJuk/PQQM0UOqQyxwgrfp
         tn+fD2D+5LB2kH8bqGBFen6Xu9d5DapiXjA5yqFxNVO5e8axTgFzavCdh8C/YgndRzq8
         XlJ1SzVeP9v+w9r8NGfquJOc+RSS2Sd5oDBGGUajJWUIku7UjSDDI69BIyr+NI8y5bRa
         8gow==
X-Forwarded-Encrypted: i=1; AJvYcCVfFA5poWQSpIH/IzP6xo+NZbrF7EtGcxFJY2HkCSISanF7QQDZXVu/xAqKvnmlbNJXPxodgcFXmhQY1grXwROr@lists.infradead.org
X-Gm-Message-State: AOJu0YxDK/SN7BIpUUpVdHBqj9OgAFGxnfq1PA/Ohc1amCiS66T1u7o+
	Xc9spm7Le8TOXenKnB7P6V5B+kLoVmZsZ3Vd6aPSwDu+9ZCeL06lnAngv9AHtiTTN9VSlW2MCl9
	OEhvcwhDxv1chaw==
X-Received: from pllk12.prod.google.com ([2002:a17:902:760c:b0:2a9:8200:4985])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:41c7:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad50ecdb29mr69263015ad.25.1771548159168;
 Thu, 19 Feb 2026 16:42:39 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:16 +0000
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-4-dmatlack@google.com>
Subject: [PATCH v2 03/10] KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164240_952049_FA560130 
X-CRM114-Status: GOOD (  13.87  )
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

Fix various Hyper-V selftests to use gpa_t for variables that contain
guest physical addresses, rather than gva_t.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/x86/hyperv_evmcs.c    | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c      | 6 +++---
 tools/testing/selftests/kvm/x86/hyperv_svm_test.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index 58f27dcc3d5f..9fa91b0f168a 100644
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
index 3fe5f52e404b..fde6682c49eb 100644
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
index f6385346dd10..f239923e232d 100644
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
index 436c16460fe0..b7f35424c838 100644
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
2.53.0.414.gf7e9f6c205-goog


