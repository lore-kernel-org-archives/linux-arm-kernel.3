Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3AEE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=; b=Exb4P6gRDRQsDAdyEX3ofRxbiF
	dwnKUAxgZTCutRFGnLtLBInNRiLGPSakuhNnL/SfcEGkoWsH4qStK4Czs8HAllI1L+iclMgd9fIgE
	EfF5d7vXdIDFjzWnAkgOmdUbhRZbfVDb7zEnDKdN/f8gxhKy+KfiTBssv/pcsih3pr6utOFUGx5ps
	Y4rcKaWwn50hjnFzZ/U4k+UNMDtQkqUUajcmeDmkC+GDCcxT+JMUAIssAe6Dreg4jdTC5gQ2THy+J
	kI2zlnZtddAu7w1lFkEelUdeWI7hyL3DniqG+R6t3djzXmg3/R1IWlQgRb+dLJwjU8y1MC3WSIGpK
	OJBlrEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijv-00000005Nf2-34Ih;
	Tue, 30 Dec 2025 23:02:55 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijB-00000005Mjt-2n0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a07fa318fdso192970475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135727; x=1767740527; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=;
        b=prUf8gqqWPTg/PGNDZscUaIf19NKpi8t5zStZLfTyLym266YdqPAUgKp8rLa78ycJE
         6lNeY1pW+OIO4bFbCuOFil4CY7O+dIMlMZ5M97YvEeluDwwUactWM9gjnu3c2JUWATU+
         W8GxPXsMe9PdfFdiUNsnsAfCxpHEMXGwQNUhLatTDB6S4CeBgH9rHSdJ0eW7rSUeJXUZ
         y2mPtEE5pH+mE8dR6aRfpxL5crTGx3+BKJUGDcRfo6N3+O88O8DeUenyHm4J/bm5aBNr
         YlZ45Q3EsCS+R/C6iJCauyh6+XVLw8sQsc5FZEPzlOrdvzc7TLVkSMaELSISv4tr3VgP
         WNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135727; x=1767740527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=;
        b=d7r/WLimTOkTgnB0XfhX53eREGBQgD6d6+AXrg1/+jbGxrVLzuzmm+Dbxiwas3rk4q
         0AwVfJHN8uPoAxP8yZaRWusknQe8cgunYI8UTmY4yH6L1ZTiSnDHMZ/l5vVLaZDD8pYM
         josi/u2qz1SAjfuFdsdPWTkFdox3nXDSSqMQPFGAaiAiYATEnDVOdtjJ4LnkO8LDrn2o
         G7jQ7G/pPXpauRFtsSJaRSOuJtvpqStAT/TmgfHMizDnh13fnT+Ihw3fvqbezN8oHZby
         RLl+f5nwt82+1llmqtt9c2sZL1/1Ken9Yihfn+uz6SoELc9KMK8Vz4G6jE5fC3gVAVpM
         mmAg==
X-Forwarded-Encrypted: i=1; AJvYcCWihz5uak95ag2JKOvJhL8oAspXHAYBHkIDcotIcGVmWPGjFnV+7vYFJLI4SrdV7Udy+zvgvvAiXEnb0lEAqwC4@lists.infradead.org
X-Gm-Message-State: AOJu0YytsWCrnCyUaWu/SGUQHa4faBD5uVGJ2l64LX+ZgTd68haoZDXv
	NfGaOJiQYYVM5R27W8spw3PFI1Tg6KNE77m3HiGQ4gH8WsyDf4uQYtdkhXm6arJ4CUhBQs97ESW
	xlLLiHQ==
X-Google-Smtp-Source: AGHT+IFQnOuwYC0g4+LirB1coBfKvkA6ZwCBuTM8ay+vZ/F6ieVjqX4SvnIiidBDol06ehcl6JagnUzMopM=
X-Received: from plxx9.prod.google.com ([2002:a17:902:e049:b0:2a0:9ab8:a28d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f0b:b0:2a0:9970:13fd
 with SMTP id d9443c01a7336-2a2f293cf1emr298922605ad.43.1767135726838; Tue, 30
 Dec 2025 15:02:06 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:37 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-9-seanjc@google.com>
Subject: [PATCH v4 08/21] KVM: selftests: Add a "struct kvm_mmu_arch arch"
 member to kvm_mmu
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
X-CRM114-CacheID: sfid-20251230_150209_729230_8E4A2DAF 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

Add an arch structure+field in "struct kvm_mmu" so that architectures can
track arch-specific information for a given MMU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h     | 2 ++
 tools/testing/selftests/kvm/include/kvm_util.h                | 2 ++
 tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h | 1 +
 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h     | 1 +
 tools/testing/selftests/kvm/include/s390/kvm_util_arch.h      | 1 +
 tools/testing/selftests/kvm/include/x86/kvm_util_arch.h       | 2 ++
 6 files changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
index b973bb2c64a6..4a2033708227 100644
--- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
@@ -2,6 +2,8 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
+
 struct kvm_vm_arch {
 	bool	has_gic;
 	int	gic_fd;
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 39558c05c0bf..c1497515fa6a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -92,6 +92,8 @@ struct kvm_mmu {
 	bool pgd_created;
 	uint64_t pgd;
 	int pgtable_levels;
+
+	struct kvm_mmu_arch arch;
 };
 
 struct kvm_vm {
diff --git a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 972bb1c4ab4c..456e5ca170df 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -10,6 +10,8 @@
 
 extern bool is_forced_emulation_enabled;
 
+struct kvm_mmu_arch {};
+
 struct kvm_vm_arch {
 	vm_vaddr_t gdt;
 	vm_vaddr_t tss;
-- 
2.52.0.351.gbe84eed79e-goog


