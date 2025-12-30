Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162FEE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFEesFGPsutGHqF0001WthlsbSNNmBrKZgvGONrq/UE=; b=DABZj2ZkWQoPAlFZLCOzx3jvI2
	sOsnBp9tGMvOnVfnc3+8sTzd9Ijq6rNgecWmqsvB/DMtimapf6dnZX2EqukFsDYBeTMBeUXeIlw2P
	/y39RvmUA96IDYAHDTsPj0S6l2PnRy0ZO2CKDRI4bUhm5P3z0SYeXIwJyTv/TLujJW5I/UxgJG6bl
	53JhnoPai88I4a+4y/Q5HR2onwiXqCZ+VpHfji9JdJ7BRe4GPp9iIUFegrkxtvNpmPtHuUMD2rQmJ
	ePwaK5ef/QQ/xm4lahv0RLLMyIjGaGj7oJQlqtFGv1a6U/27TcGbLjUxthxpAQ2OiIVFtyccSOrPo
	NY5ob0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijc-00000005NHt-0v1H;
	Tue, 30 Dec 2025 23:02:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij2-00000005Mhp-2Q0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:12 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so22556434a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135719; x=1767740519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kFEesFGPsutGHqF0001WthlsbSNNmBrKZgvGONrq/UE=;
        b=RQi/6PKpy34T6Xg5kG22NipluaqLO3iswqWRR91ao+xV4Bf4ptmNY56NsQ5HIsezeg
         MaqEjroXpVjiPw+kgrnDRKodHi7mXD3YI3nOapRiH8VSbVTlPO0525dKZBgw1KDj9pE2
         mytdCkdEfxdV8KF9f/mJAlj4eOQiPMFt3/KiMzB1OXNpvBCfn9xR4DWnSsjkBhr7zoFt
         EejSOmJepp3eu1bLCKu4EY5Y43Dz/TZEVcDA7kbjlER/oarHqLz7mNiBWr6oCuAS3wjR
         l+ywB3luEC4Ubt5POaWBkEawu+WeG2QFtxrHneEAUKn91Io0djf1yVDkkwpXLzmrwxBK
         9nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135719; x=1767740519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFEesFGPsutGHqF0001WthlsbSNNmBrKZgvGONrq/UE=;
        b=NTqfvW7N0MciB1l712QoJQwGJwS9ZyR0qXRwrH0SNDiNFRg3WbWYHDziiDFJOpBipd
         7bEmDbXCUrzKI+pZ5avMf3FLuHIKXmDbD7KsAUmFrYVQfCrFP68AJMqt4THhvcp83/3S
         LCVFi/0KBU2e66gO6psx6ryLvHKc9/nXXY4dxdyBTxEn64KwzNZJWtUw/gV1lwQrgTrq
         hnSHp1s6OZc/akW/XZ/U4Ta7wD+n1QzjhLeMW+badDnYiyDAxxnB0OAFtQtS6p39Ma29
         ZJGdbTZi9gRsMaLGnE3aMBnxhxDCZsLD3T9lCnyscPx64krj2EzcwiUG1DPpSSYvBTSH
         VP8w==
X-Forwarded-Encrypted: i=1; AJvYcCXaJb6IbKJYiVSmbEDCJG4M4uZMnkesSF6ghucIgM/MzdvODYa+JeWRVjZMJrD64rU7bRN9nz1u7SSw4S4UPps8@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmUvFFUBIreejittoVABz6ZURQw9onLDncqxOrnLEAo7oPMq8
	FEtDv0eCHLfYHZMnIJpOCUVgXuFmQodnRR8WE5yi4Reh46C9LCF1jhIZplZqrhRvBx0moIE960x
	qff6CHw==
X-Google-Smtp-Source: AGHT+IFMvmVZegtbcaH8ygYeOdZA18LUtrqVKCjaPL92fD8viNNyqFkg9jykfPAXGidnl1kcsTEoQKpdcsc=
X-Received: from pjbqe11.prod.google.com ([2002:a17:90b:4f8b:b0:34a:9e02:ffa0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a52:b0:340:99fd:9676
 with SMTP id 98e67ed59e1d1-34e9212aaa9mr28973871a91.10.1767135719406; Tue, 30
 Dec 2025 15:01:59 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:33 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-5-seanjc@google.com>
Subject: [PATCH v4 04/21] KVM: selftests: Kill eptPageTablePointer
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
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150200_640987_82E331DF 
X-CRM114-Status: GOOD (  11.64  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Replace the struct overlay with explicit bitmasks, which is clearer and
less error-prone. See commit f18b4aebe107 ("kvm: selftests: do not use
bitfields larger than 32-bits for PTEs") for an example of why bitfields
are not preferable.

Remove the unused PAGE_SHIFT_4K definition while at it.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86/vmx.c | 35 +++++++++++------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 1954ccdfc353..85043bb1ec4d 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -10,10 +10,16 @@
 #include "processor.h"
 #include "vmx.h"
 
-#define PAGE_SHIFT_4K  12
-
 #define KVM_EPT_PAGE_TABLE_MIN_PADDR 0x1c0000
 
+#define EPTP_MT_SHIFT		0 /* EPTP memtype bits 2:0 */
+#define EPTP_PWL_SHIFT		3 /* EPTP page walk length bits 5:3 */
+#define EPTP_AD_ENABLED_SHIFT	6 /* EPTP AD enabled bit 6 */
+
+#define EPTP_WB			(X86_MEMTYPE_WB << EPTP_MT_SHIFT)
+#define EPTP_PWL_4		(3ULL << EPTP_PWL_SHIFT) /* PWL is (levels - 1) */
+#define EPTP_AD_ENABLED		(1ULL << EPTP_AD_ENABLED_SHIFT)
+
 bool enable_evmcs;
 
 struct hv_enlightened_vmcs *current_evmcs;
@@ -34,14 +40,6 @@ struct eptPageTableEntry {
 	uint64_t suppress_ve:1;
 };
 
-struct eptPageTablePointer {
-	uint64_t memory_type:3;
-	uint64_t page_walk_length:3;
-	uint64_t ad_enabled:1;
-	uint64_t reserved_11_07:5;
-	uint64_t address:40;
-	uint64_t reserved_63_52:12;
-};
 int vcpu_enable_evmcs(struct kvm_vcpu *vcpu)
 {
 	uint16_t evmcs_ver;
@@ -196,16 +194,15 @@ static inline void init_vmcs_control_fields(struct vmx_pages *vmx)
 	vmwrite(PIN_BASED_VM_EXEC_CONTROL, rdmsr(MSR_IA32_VMX_TRUE_PINBASED_CTLS));
 
 	if (vmx->eptp_gpa) {
-		uint64_t ept_paddr;
-		struct eptPageTablePointer eptp = {
-			.memory_type = X86_MEMTYPE_WB,
-			.page_walk_length = 3, /* + 1 */
-			.ad_enabled = ept_vpid_cap_supported(VMX_EPT_VPID_CAP_AD_BITS),
-			.address = vmx->eptp_gpa >> PAGE_SHIFT_4K,
-		};
+		uint64_t eptp = vmx->eptp_gpa | EPTP_WB | EPTP_PWL_4;
 
-		memcpy(&ept_paddr, &eptp, sizeof(ept_paddr));
-		vmwrite(EPT_POINTER, ept_paddr);
+		TEST_ASSERT((vmx->eptp_gpa & ~PHYSICAL_PAGE_MASK) == 0,
+			    "Illegal bits set in vmx->eptp_gpa");
+
+		if (ept_vpid_cap_supported(VMX_EPT_VPID_CAP_AD_BITS))
+			eptp |= EPTP_AD_ENABLED;
+
+		vmwrite(EPT_POINTER, eptp);
 		sec_exec_ctl |= SECONDARY_EXEC_ENABLE_EPT;
 	}
 
-- 
2.52.0.351.gbe84eed79e-goog


