Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBsMBd1i0baUKewPQxLHxyy7sMDVTDzHxDH7w12EKXQ=; b=aKRbKnszDv9nI7M84H+H+n+TTN
	gtRV7uOcV+IWbhK9sbZxdPYktMEiLLyPMuHtMTYKLA2O2rWZQ6vKk1EF/7/ASIfffFwWTMZSr3FEE
	DxEq9t2IwgXGJeGEKnVoEs14h5qDJZq4N2LPbhyWZONcGXI1oF4tqWh64dhKwZP3uAOtkFmpLdsqP
	ETk8M3zGK4/wLJJKisxrKSxgTYHqMwTHlumGhYEXt6iiOzgth1cMi4j+C5Zq+Hv3f1Xnas7/1pHK3
	vXzY6hxyqyBgVE7LP+ho6/Erb/ljU6U386Z5fdq5+BeogCNpD6AfPHL+A1Otde8SaADJZ0qX1kkLR
	OUSfxpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPX5s-0000000Buln-0vWf;
	Thu, 12 Jun 2025 01:51:04 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF0-0000000BXmY-1sip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:19 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30a59538b17so291644a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682097; x=1750286897; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OBsMBd1i0baUKewPQxLHxyy7sMDVTDzHxDH7w12EKXQ=;
        b=P69uFInpVTP/+KWxWIFoy1uZYQ07TS49mNkLaOQQm1iLsGVI2JOqpjcP/iP/ctIV1P
         AoXddcmwwE+zzbsGCRUbWyDbWcE6oKZn96o00TixnxgsHNpllnLKfpEgDJfU/ItlsM5Q
         l1QmfjWq9oQH/SQ6aFXGOynRoCpv/cgJGRKKk7pVGg2rueUmOtEcTc1x9Sg6czb6X9uy
         d0cVYLVIV+mFVPVZMqkoeg3f4Al/1EsE3NxaFz0sKrNgvZCsGfa1WIV0YaL8KA6t3oDy
         PD8Z5+txczvOikaxgVPBEtKBVvR+BBNnDLCDa1/kgWMI9Ygzb6UhRS2QPZJG8giBHGW3
         5w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682097; x=1750286897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBsMBd1i0baUKewPQxLHxyy7sMDVTDzHxDH7w12EKXQ=;
        b=TYxhPkXAsLfzMvEslnT62pqDn2V3yKN8YoMqiHEvf9pw0dQsaO/NInQcTYXXHikrG6
         lZ5rZIrS9gcT4BgKf9WofmT2g7/8Nqf9gbGAcI38Vwa2v/BKUeoSrafFWpP2vcgp2trB
         Sty5BdB6RHXD9sTkrRNJZbnB3Ei4ZqPTIdB23QxN8tXK7s/fNKH2NVrp0wuNnNv+4zkD
         BU3gOjkNHOi/qbawc8Pl8mZys6CjcsBKpCosRxxuixLsImMj0KcY39F+KyO1XZiPm4cF
         iYqfutD0TJJND334a84MaUZwDBcZ3JCanMGHukDnHJYPZuS+suOsV56VQei7tnuQuGDL
         1gOA==
X-Gm-Message-State: AOJu0YzwT0IdTMV3EFT8K+KNsXd0yxB+Y8GopMW/DL2UXPpTb+/4MiGJ
	UZ74dsN83fL23wAxOIzDPeLZwJibG5eIlZ+3oQUEzOGxN5wbdearJt0ybvKT1tkQNW7zdu/9qb4
	U+BPCXQ==
X-Google-Smtp-Source: AGHT+IHBEy8+OKJmY+A4zi/3hTeqSjfA/ttP2bWoyN5/kshTJAQ27HG4vGJt+llsgPQtOFs3CpzMzSvtcZQ=
X-Received: from pjxx16.prod.google.com ([2002:a17:90b:58d0:b0:2ff:6132:8710])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e8d:b0:311:d258:3473
 with SMTP id 98e67ed59e1d1-313af12a361mr7057487a91.13.1749682097123; Wed, 11
 Jun 2025 15:48:17 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:50 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-49-seanjc@google.com>
Subject: [PATCH v3 47/62] KVM: SVM: Process all IRTEs on affinity change even
 if one update fails
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154818_484132_77DE526F 
X-CRM114-Status: GOOD (  11.06  )
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

When updating IRTE GA fields, keep processing all other IRTEs if an update
fails, as not updating later entries risks making a bad situation worse.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 6048cd90e731..24e07f075646 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -849,12 +849,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	if (list_empty(&svm->ir_list))
 		return 0;
 
-	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list)
 		ret = amd_iommu_update_ga(cpu, irqfd->irq_bypass_data);
-		if (ret)
-			return ret;
-	}
-	return 0;
+
+	return ret;
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


