Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC93RHTPJR0hYLcAds88MrDeKfUjJXJiIT9n5WyFK68=; b=1i/J0dwgvqn5zXjv03/zRstdy8
	nDJINj9ADGbR/TejV69wFAUQautvraIMG97Ys8vrXmOeknKBDjAJOaABcGb9lLhXIkvg8Hrz9/R6j
	5eIyb7idZK+z1nRTmi+aBRkJPNv4ivqsl35az3l23E56Boy2QebdfFvCyUdWHLm0aJ6gtamsdgOzu
	uhQXVz9tRlNEu9lCvcnPKIf0iCXUDTNa82ABKyV2l45JieqTF6unbqr5zol0mj+1VXlISsNHpsdFv
	q0J7QpMCK6DbQ3e45QjPdGfNr5VcOxgnhtTysB15gjsmScgneKcuHlCewj8ojpQJmmR/1i8uBZsOU
	2cX1tiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWJd-0000000Bqhm-0fSK;
	Thu, 12 Jun 2025 01:01:13 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEL-0000000BXL6-3rvV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:39 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2358430be61so2012465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682057; x=1750286857; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nC93RHTPJR0hYLcAds88MrDeKfUjJXJiIT9n5WyFK68=;
        b=WlZpuJEJzvUs8kylS8GvBSQLGZ4+M/5n/G/Y9sZKpiSVorZ1+xVgpRqGGx7igBR1rS
         rJIj/qceZUJbX6v9GnACB1ora8TCPH+jWIN4BdVceZpWl1eqMZQJUUZC3+Ge0IPTup5s
         BIstEkW8wmZdYRegDlVekT9wtcZTo1Dbq2bEb8bS7BNd/j00YTkeTemrf8l70H56dxuW
         +x3SzmAjr4yk78H4RrgiQAMAN6i2D/fjx/qvIkCVWuWTZ1fiF6jiA+Nl6l27R/CSFKOB
         /WTVjc3ec68PT6BO6KvYeLF0hpBRpPqtYCVSig1pouOTkVrJ3DSNPWDLPHIbAv/IVijb
         lNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682057; x=1750286857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nC93RHTPJR0hYLcAds88MrDeKfUjJXJiIT9n5WyFK68=;
        b=lakCSUNv3lU17ZzoL3eMzbgXvob+Scgfdn1cG2UDmcbPrhIBkTeUAqlB2M5kEqisZo
         K3pA2nJctzLEfaSv3zsnYUpxAxGS1QSZ9Kfxy4/1uCypFn/mby0aQAvY57cj8H2P4f46
         jiAsNC2I+1aevYO9XPJatVcvS6bFoPrO8AjBKQz4e2cPdqHWvXdZs535oKzFcJLk38QJ
         tT+i5pmfpmCVZBIrp8WSBj3n2KdkL9sdTKjHxmPpV8FFyhNph93WSiE4nj9G+3fu2WTW
         BiAJKeBYhgz2ItSN2H+a3NVG712FKrmnVxtr+RzfPqbmFCWKs0JfRQ8+IOew1Lfk4kJv
         gjtg==
X-Gm-Message-State: AOJu0YxnFE0PMLrQV/Cn60I6+S5AKpYrZ9M4cLzOzWH8Qt31mXeiBqs1
	as/fTn0DnPYCi75FOPNKtHeeFt1j3fiwq68PoC31lq9e6O0RDLiSXEiieSoOzUzrVpt0WZ8M8bx
	qROOI/Q==
X-Google-Smtp-Source: AGHT+IHC+tL/ohPatgcKOK+9NRFx6tDroVAP77vbD+LWVMPFcp/p0UPjT16l7BqZ0WY1gMWbfEU6vC1Hc9s=
X-Received: from plhb13.prod.google.com ([2002:a17:903:228d:b0:235:eb8d:8024])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94f:b0:234:bc4e:4eb8
 with SMTP id d9443c01a7336-2364caba922mr14235635ad.46.1749682056865; Wed, 11
 Jun 2025 15:47:36 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:27 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-26-seanjc@google.com>
Subject: [PATCH v3 24/62] KVM: VMX: Stop walking list of routing table entries
 when updating IRTE
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
X-CRM114-CacheID: sfid-20250611_154738_008613_0FA04D0E 
X-CRM114-Status: GOOD (  17.48  )
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

Now that KVM provides the to-be-updated routing entry, stop walking the
routing table to find that entry.  KVM, via setup_routing_entry() and
sanity checked by kvm_get_msi_route(), disallows having a GSI configured
to trigger multiple MSIs, i.e. the for-loop can only process one entry.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 100 +++++++++++----------------------
 1 file changed, 33 insertions(+), 67 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index d4826a6b674f..e59eae11f476 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -302,78 +302,44 @@ int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_kernel_irq_routing_entry *new)
 {
-	struct kvm_kernel_irq_routing_entry *e;
-	struct kvm_irq_routing_table *irq_rt;
-	bool enable_remapped_mode = true;
 	struct kvm_lapic_irq irq;
 	struct kvm_vcpu *vcpu;
 	struct vcpu_data vcpu_info;
-	bool set = !!new;
-	int idx, ret = 0;
 
 	if (!vmx_can_use_vtd_pi(kvm))
 		return 0;
 
-	idx = srcu_read_lock(&kvm->irq_srcu);
-	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
-	if (guest_irq >= irq_rt->nr_rt_entries ||
-	    hlist_empty(&irq_rt->map[guest_irq])) {
-		pr_warn_once("no route for guest_irq %u/%u (broken user space?)\n",
-			     guest_irq, irq_rt->nr_rt_entries);
-		goto out;
-	}
-
-	hlist_for_each_entry(e, &irq_rt->map[guest_irq], link) {
-		if (e->type != KVM_IRQ_ROUTING_MSI)
-			continue;
-
-		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
-
-		/*
-		 * VT-d PI cannot support posting multicast/broadcast
-		 * interrupts to a vCPU, we still use interrupt remapping
-		 * for these kind of interrupts.
-		 *
-		 * For lowest-priority interrupts, we only support
-		 * those with single CPU as the destination, e.g. user
-		 * configures the interrupts via /proc/irq or uses
-		 * irqbalance to make the interrupts single-CPU.
-		 *
-		 * We will support full lowest-priority interrupt later.
-		 *
-		 * In addition, we can only inject generic interrupts using
-		 * the PI mechanism, refuse to route others through it.
-		 */
-
-		kvm_set_msi_irq(kvm, e, &irq);
-		if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
-		    !kvm_irq_is_postable(&irq))
-			continue;
-
-		vcpu_info.pi_desc_addr = __pa(vcpu_to_pi_desc(vcpu));
-		vcpu_info.vector = irq.vector;
-
-		trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id, e->gsi,
-				vcpu_info.vector, vcpu_info.pi_desc_addr, set);
-
-		if (!set)
-			continue;
-
-		enable_remapped_mode = false;
-
-		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
-		if (ret < 0) {
-			printk(KERN_INFO "%s: failed to update PI IRTE\n",
-					__func__);
-			goto out;
-		}
-	}
-
-	if (enable_remapped_mode)
-		ret = irq_set_vcpu_affinity(host_irq, NULL);
-
-	ret = 0;
-out:
-	srcu_read_unlock(&kvm->irq_srcu, idx);
-	return ret;
+	/*
+	 * VT-d PI cannot support posting multicast/broadcast
+	 * interrupts to a vCPU, we still use interrupt remapping
+	 * for these kind of interrupts.
+	 *
+	 * For lowest-priority interrupts, we only support
+	 * those with single CPU as the destination, e.g. user
+	 * configures the interrupts via /proc/irq or uses
+	 * irqbalance to make the interrupts single-CPU.
+	 *
+	 * We will support full lowest-priority interrupt later.
+	 *
+	 * In addition, we can only inject generic interrupts using
+	 * the PI mechanism, refuse to route others through it.
+	 */
+	if (!new || new->type != KVM_IRQ_ROUTING_MSI)
+		goto do_remapping;
+
+	kvm_set_msi_irq(kvm, new, &irq);
+
+	if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
+	    !kvm_irq_is_postable(&irq))
+		goto do_remapping;
+
+	vcpu_info.pi_desc_addr = __pa(vcpu_to_pi_desc(vcpu));
+	vcpu_info.vector = irq.vector;
+
+	trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id, guest_irq,
+				 vcpu_info.vector, vcpu_info.pi_desc_addr, true);
+
+	return irq_set_vcpu_affinity(host_irq, &vcpu_info);
+do_remapping:
+	return irq_set_vcpu_affinity(host_irq, NULL);
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog


