Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C0BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ugxEmd7a7WnD5rzj6dcj8iKmGlwGaXKl0uKILMdDIg=; b=V01hEctYOQSZa0mDjSQRSB6/8W
	5hUkghWyYH6L1Rw8a8yYIm6gdSkck8ZouMF526k1Qe6hrfdJZW3Tl106eIrq3JdAH7LQTgdpwz0oF
	qRWZrPt9SgnvFCb9M/S0jZn6I+RDRb7xo3pk5Nm5H+GUiA4Nr5i8bg+XPmYrfnM2ZMaEUZjB9gS8d
	tq8nSAM34WLh7wVQA5p4DctDLD+8b2NosCYUNEGSj4DAP/K/uqaqo8JiS614GT/eLLwyyI/rckDtN
	jAlMKAYzheflVV+aYN8D0QqGZn0w3DLv8mJESR95fqCszNn7/xfr2XFP6SFRboJcH3te76/PYDQNt
	0Xap/fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO01L-0000000HZps-1oFf;
	Wed, 18 Dec 2024 19:47:47 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzv1-0000000HYJf-3Oog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:16 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3e77fd3b3so3348a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550874; x=1735155674; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ugxEmd7a7WnD5rzj6dcj8iKmGlwGaXKl0uKILMdDIg=;
        b=K6PS0kdzvZQChlPdvheGyibMI3OpL8mhSc9/jxZfekvo+dSQzTe1yurjJIwpGdiolF
         bLzHheMyUlfmFBNLFJOShQH3WPU9V/cDJMdyDGMkBY3QYFPu9xiy1eTm4o65zZAXJY4d
         yQs+2q7l+jvtI1RKwv/+ucxxlIpsCo4mhByp0yeswt9DM68vSFy8ruik+C53IGK0LuKQ
         BNmD4g3US6HSaWEEbhWRx2vw+m4PRJNP6gxUOJCBWIyWSBRYcKozDSLirSUnD/7DWmNU
         tICxHYu8ZB+Xkv0lMGmzQFosypYXecdNG80J3WIYHlG72gh2A7PHd5CDmcAUArOZcrY+
         TaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550874; x=1735155674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ugxEmd7a7WnD5rzj6dcj8iKmGlwGaXKl0uKILMdDIg=;
        b=pu8NSaEsv/T+ZCRfmZWpcDM2R7nEvJXNA5MJyR3FMVbEvw10GUOa/qPimhWPda50ws
         67/lHrgJbzIsdi1WlxAeBUWYGogIyJEH6I6vb3AYVvwub2dRHGZ36gsqciDXUCGm7WYi
         LZa6HzpBjGHnVH+ai6te3wJsmox/QTO2L0SCObGfBertSEx7cJjlAlmvJ0iWVqgiPZgu
         2yQgU0Fz7DmpB93nMsLKcGSKV8OvYeht3TlF4S0fz1zsT1m4WlxWBZuIlBozXg57x/xG
         UizcNAgy5OK1jxa7tJXv8qo1rOimTwGmhWYHMJDIHugEkgpWH1MRVG4DtaO7U9d7EMV8
         yL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJPTM3CLiNt2dNmMupe5VE52xUJ5rRG9wNA7+2NnK06m+HSG2xuZi+2bWTC+Tk9X7e0YwPHoLbRcfvOybMEeBm@lists.infradead.org
X-Gm-Message-State: AOJu0YyHzAwysb0OXKY1MfjeutpIkZH6kM0cj7V/XLnCVMQHww0cXSvx
	yXgviDioy3BNdNGJelJMxXe6hnswvB5cFFG9XpWiV350dfL2ETzmOB8hDK2EN28X8gs4ZIdTUcd
	KaDGoSA==
X-Google-Smtp-Source: AGHT+IFvLhkomwPsLLt4qoep3Va3P5u4/FTIVyNItlHOLlhdPmQivj6hJV4NPzFeQBdz1XX18dDRWVuBUpaz
X-Received: from edag5.prod.google.com ([2002:a05:6402:3205:b0:5d1:21a6:f033])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3584:b0:5d3:cfd0:8d46
 with SMTP id 4fb4d7f45d1cf-5d7ee4242dbmr3825137a12.30.1734550873767; Wed, 18
 Dec 2024 11:41:13 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:46 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-6-qperret@google.com>
Subject: [PATCH v4 05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114115_956925_492BDAD9 
X-CRM114-Status: GOOD (  15.42  )
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

kvm_pgtable_stage2_mkyoung currently assumes that it is being called
from a 'shared' walker, which will not be true once called from pKVM.
To allow for the re-use of that function, make the walk flags one of
its parameters.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 7 +++----
 arch/arm64/kvm/mmu.c                 | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index aab04097b505..38b7ec1c8614 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -669,13 +669,15 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address to identify the page-table entry.
+ * @flags:	Flags to control the page-table walk (ex. a shared walk)
  *
  * The offset of @addr within a page is ignored.
  *
  * If there is a valid, leaf page-table entry used to translate @addr, then
  * set the access flag in that entry.
  */
-void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966540..0470aedb4bf4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1245,14 +1245,13 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
 
-void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
-				       NULL, NULL,
-				       KVM_PGTABLE_WALK_HANDLE_FAULT |
-				       KVM_PGTABLE_WALK_SHARED);
+				       NULL, NULL, flags);
 	if (!ret)
 		dsb(ishst);
 }
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..a2339b76c826 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1718,13 +1718,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 	struct kvm_s2_mmu *mmu;
 
 	trace_kvm_access_fault(fault_ipa);
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa, flags);
 	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog


