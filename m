Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEZsLhf6SxJ64ydA6t/wQOktcm5LeFVwzcPjAJ4nCGM=; b=JvOLFsRpWSMcGfb85PazLINDTb
	DuOtwU0Uls1R7Qi2WVj0uYC0MUU9CIVKiFCwWl2S7jTju05tXZDo7Ynxaa04QxtiGmJvyqKwwZG0X
	ml0b2vRecH9vUEig4Yb/5XHCbahRcl7l+Nas5MYt8hgB3XfvOXlDLb0SxMhsArUbVW/EpiRebmWs4
	mr3ynWGncBZa1xKEjyT573u9fv1c/MsJqW570gUrZNtTuTzfWnjtExfO367/+U9sOylGMSPcncKYw
	g5OmDndVlSCYRjLKRJyGFjw3wNMsfCjrZtnQMfpLobcVd65BpPfool6Z0kJObOnn9rEIzLTcPg7fD
	A+okYRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWzZ-0000000Btm4-3Cnl;
	Thu, 12 Jun 2025 01:44:33 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEu-0000000BXk4-3nSi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:13 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311d670ad35so294855a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682092; x=1750286892; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mEZsLhf6SxJ64ydA6t/wQOktcm5LeFVwzcPjAJ4nCGM=;
        b=fvRkl+n0ucobOKu3y/KEUNHRmsSaCtmoumKPlR0tY9cA8p7TVBSpN8PlptFzPY7ViL
         1u00upcBKKIbMgSpyJFaMaW/OaH1WPIKY/auP9uuWUXlDILOWL3lejjxWic5VgbmDtZ+
         puI/iqOJPraLayJxQOPm57J+7phPvjqbI07FExaWsxK8XzGnMubkZp8r7qdWAQ2+Vup8
         rEreJTELsPzVH236uktEYsZDRSP5/MLaUzqmfUIP7HnTxyiKoEZ8PM4EPAu4iO7w0ncS
         rYvPyVl+dzzjqNRhENpF/37WuQlqUQqf9TLOJ5FLsyIJtI0S0o0ZbCj1VYhGO3wBQrhp
         xEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682092; x=1750286892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEZsLhf6SxJ64ydA6t/wQOktcm5LeFVwzcPjAJ4nCGM=;
        b=Cj//oci7wj0psZ6S31VoGeRQRQWFux0u1lRELywb7VU29W3k5mosu1+xU2uLyqauuF
         9W5oIe4IS/eTxaG9fzV+8Ye49JjQVlJ3GdqbdlX55Xgw1IAOl1PFfodGuvTxO1QUaa+1
         M5ZWCtRdF+V/3ZGQEA4Uk5xzARPQJ2lvhLBPpUr7k1U/UEawDmQU+BqOlFjHpy0iu8Of
         JFq5PyHwSBKCL8ZriDPq0pE45l1ryQgPnuDjejIogD45R6voD9UDAQJg6++5UsU3VFov
         rKkJMd4IlcnjhWxB6H42enw+NC8aH3Ny3i1et2d3ETemeIiCuegzQOLNxvgfomfRj2q8
         pC2g==
X-Gm-Message-State: AOJu0Yyi87o5FCNePO2Yg9E9IJwFp97MjuI3W0gYoeihjWEZ8v8Kqu35
	bl8HB6EWTqaSVSDGscPXe1lvzSpVoPxUUDA2p8b9kxIfnGAs4jk0mgf3rRhuWjPFPZXyjMTqOm4
	8/9qduA==
X-Google-Smtp-Source: AGHT+IFg24zPNL3KiBl4z/DNOHqd2KhvvGrjl3yLgrTD6GwXkCuqSf7mQ8rAwENd7T74FPlQ31IQOCRlfVY=
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2d0:b0:312:def0:e2dc
 with SMTP id 98e67ed59e1d1-313c068d18amr1292249a91.7.1749682091962; Wed, 11
 Jun 2025 15:48:11 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:47 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-46-seanjc@google.com>
Subject: [PATCH v3 44/62] KVM: SVM: Don't check for assigned device(s) when
 updating affinity
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
X-CRM114-CacheID: sfid-20250611_154812_956103_428A0041 
X-CRM114-Status: GOOD (  10.04  )
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

Don't bother checking if a VM has an assigned device when updating AVIC
vCPU affinity, querying ir_list is just as cheap and nothing prevents
racing with changes in device assignment.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 2e3a8fda0355..dadd982b03c0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -847,9 +847,6 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 
 	lockdep_assert_held(&svm->ir_list_lock);
 
-	if (!kvm_arch_has_assigned_device(vcpu->kvm))
-		return 0;
-
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
 	 * interrupt remapping table entry targeting this vcpu.
-- 
2.50.0.rc1.591.g9c95f17f64-goog


