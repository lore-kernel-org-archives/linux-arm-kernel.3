Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640FBC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRbYdbPjfnXABceLxP6T4VwYA6vT74WXjV6qwqEpIRA=; b=wkNkxqCcAjy28SR2JMMfzAsIOR
	/W7eChk5kOpReOraOKQxB7L/9e2IvwhfduGYl4GbPw4FT8ydbUx7EsA+9d2KC5aVGDeFZdJ0br12Q
	CTGWptl6Ad4rkHRXAjc3+NVDqDP2hp9xYO4q+tAhjgQjyaFb/VtXPGni4sohAWdJqVoZbJrg9RhMN
	L8fdgkbXLWQExTvLB3mQpClsvzEuQtRhGw4Rghl4dztcpf8p7hFvT/zCNqqHt5c1q6H8gRVDRY9/a
	PR8DPgyuGNlLOmZHJcbyl/XStVGVp4Vveb9BXptaVdqlnxWFo6pJcGVRdRbsrRDTZjv+6HTy+TEiy
	0m34ZkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWin-0000000BsSB-3Ob2;
	Thu, 12 Jun 2025 01:27:13 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEg-0000000BXY8-34ko
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31215090074so514698a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682078; x=1750286878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aRbYdbPjfnXABceLxP6T4VwYA6vT74WXjV6qwqEpIRA=;
        b=GLE6yWZp+zWpaGBTF/+DinRLu+m6OVnRWtOFz2SgUIsdjlWrYRx3ctKBS1mIrUiptf
         AZe/U48J/Vio4pgWTNj6SudCHzDw1/BYx9FCdVS8LIC3pf5R3ALPgbxRyZ3To1f3jrkk
         6ZNQK31taJaUC4Ozcjq+CT9Ri315mo6a3Qer0wDiU4+cvY5q9Y74R46nKWWg5Z4j32vF
         3oem2tZ54NtmhAkFWqjvH2XcHCh/3jVVxDcD3SSGiK7tIUrCBOd/9Z/iox1WLekJ7naf
         d/mxXYA+r8YkTnuwbw1qvfna64evO7bQu+//bup1Kwrw4tRcobFqVD4lOq1M/cL8eShg
         xbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682078; x=1750286878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRbYdbPjfnXABceLxP6T4VwYA6vT74WXjV6qwqEpIRA=;
        b=t4xF5dQYvYta1jpciPHoW0tdG4A1Rpgz8AfnMO6jDcR8QAXXIjR5E6EP4tTMw0+tJ6
         rnVXnSvSL4UlBsA6n9AiNNxQ1X60UJw+eFuTWKBvJOYSUMjGnfpAlVg6GEFRFwbauRGy
         kxI49QjXf+X4YHm8wmlPcGUnFFdp2kuaElrTFNE/HsRXbaBmjJodLcVPDMgkqzzRmSYm
         ej3WwEVpzRlCT2mSSDWGVBFnKoiLVFq+CyCYYi7rdJT3mhpS6GboOgNrmUBTNB75IGXU
         gvdM/duLsWB3NJmDtZ0cvtJ6ehimXYRnCxDtbNoGGcJblOVaJDa6ZTvAGdj3glnd1isE
         on/Q==
X-Gm-Message-State: AOJu0Yyzc+EwuThjfbQx+mS4U5I4utdlToAmQpUP5h0Kzq871y/orzi6
	Pmp6lGQnmTbt+3KiGRQkEKGBEba+lhqCPTS7cKJlMUGECnDBzIaV4qlZ1w8lq3VupTEw8w4wIAG
	mWVfk1g==
X-Google-Smtp-Source: AGHT+IHb+Zv/4CcMgQT32iC66PSsxBVu4fJyVtFcuECRvVY6yAdTVQgUPpLO4I1bFnUpFw9nkCh9cXpZUsg=
X-Received: from pjbkl3.prod.google.com ([2002:a17:90b:4983:b0:311:c197:70a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec8:b0:311:a314:c2ca
 with SMTP id 98e67ed59e1d1-313c0667dbemr976034a91.6.1749682077795; Wed, 11
 Jun 2025 15:47:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:39 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-38-seanjc@google.com>
Subject: [PATCH v3 36/62] KVM: x86: Don't update IRTE entries when old and new
 routes were !MSI
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
X-CRM114-CacheID: sfid-20250611_154758_781042_21DB6007 
X-CRM114-Status: GOOD (  12.21  )
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

Skip the entirety of IRTE updates on a GSI routing change if neither the
old nor the new routing is for an MSI, i.e. if the neither routing setup
allows for posting to a vCPU.  If the IRTE isn't already host controlled,
KVM has bigger problems.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 43e85ebc0d5b..4119c1e880e7 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -618,6 +618,10 @@ void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 				   struct kvm_kernel_irq_routing_entry *old,
 				   struct kvm_kernel_irq_routing_entry *new)
 {
+	if (new->type != KVM_IRQ_ROUTING_MSI &&
+	    old->type != KVM_IRQ_ROUTING_MSI)
+		return;
+
 	if (old->type == KVM_IRQ_ROUTING_MSI &&
 	    new->type == KVM_IRQ_ROUTING_MSI &&
 	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
-- 
2.50.0.rc1.591.g9c95f17f64-goog


