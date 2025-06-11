Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84336C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJpXUJytIbm3VAV6gPKHVB1w+/ruLJcvPcUst+w6WTg=; b=BefmbF5iWhnv7k8/LEVr56YsT7
	jWHDMOF9mKeMraXzbkMmN1vZ/UyPz74GndXuibCkHIrV6FwNuApW9C3J6DgK0FVly6NEHMJ1xVm4e
	kXO3KIivpPO7qkjughmJb4KgSXemUIVmy0NqaVAUXmgRc8KDw9YKYa1xUfNDgzJGksnkHtLEdFXdh
	bn31GAWHEKj2cfN/W/D3zyhvBEUmrUbb2+jjWGMyqeD0iRxesk0++2+FDXRLHOxILxzxyQal/ttVg
	yvWD09qhJf7Hap/VT0AnRmoaDoUuP11yzjJzK6jP2In3r7R+crPeZW+BkeaJXLi19pkRfekOE0FfB
	LAMv16eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWDL-0000000Bq8c-0AdT;
	Thu, 12 Jun 2025 00:54:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEG-0000000BXHA-2hK0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so307090a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682052; x=1750286852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpXUJytIbm3VAV6gPKHVB1w+/ruLJcvPcUst+w6WTg=;
        b=2dpzlsZJqSbPUWTNqJJL2Mma3GgvdONhF+Gdqqz6VSEreiEGh5dWSh4l0bi6j0PmrP
         x2bPhlhJkYaLa6YpWTtnOk+NeCtv6U+M7JY70gsHiidXwVwYJS7zUOO8n237XDjHXjJF
         oAjLqUb6LHhXNeWAL6xIh64xRuz14CvcWmEoeRrOQMAb2os1HT52U8DqgFq+2LXf9WFZ
         i204G25RrAmhD/2yQVLRbRh5FQavpQK2ZiR/syaGVw3wUAdpu4ryPu5sMQ5xQT75xv1c
         N67ORuoEvFxgKKKetXY7H7ig6aqkDo999KyDWi72PUTVuuDgzeslx269Hjfpzvf2xKZo
         sxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682052; x=1750286852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJpXUJytIbm3VAV6gPKHVB1w+/ruLJcvPcUst+w6WTg=;
        b=agL7uz41M0QPebBQ7NK/i8PE0ROf9ZLTty2/by5uwCv0GljxHzu87/WrFChPH9vqZs
         qVOrbmeVWgGRQ9KpU54pk5ohV3KquzFTgiGBuffw7P2lWolC1TYekSXaQYoJDxgMKVlU
         66cXtLtOCjz6bifLiHmvmMHryLwi6kJoPNSVdH9f2qs3wyYvWZWtsMdbZ37FMvitGbPb
         20hfydDo5ewn9LjFd7igvf49im4aaIXTN1W8ZmbcoFOMe8tlQC1+uxnEGtnNDdAJ0ohE
         9yZBXpXn44HJDujeDfylrB4bq1iQWhkyQ/lE6y9GxFLC+LN/Njq9HT7T6sPNtP2RMJ/c
         5tLA==
X-Gm-Message-State: AOJu0Yw7RRMEHP2VgQwysteWJ2ba8DAVW6SldLY2d//fimdhikeH0vAJ
	IrpWk3H8El7YNlxmi1cKYVVU/9r9QSxBbafUciaQ/My6IBXgf08zb47OSYf9F9+5T9hyHMm66l+
	oV6NtRQ==
X-Google-Smtp-Source: AGHT+IEOHSUY5e4l9pkIll+BMnplm+wj/Pa0wfxvBvvvlZSyn0/I6Q4pgQjupbgMtAUIFW7CStkaT9e8/ZQ=
X-Received: from pjf16.prod.google.com ([2002:a17:90b:3f10:b0:313:221f:6571])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c8:b0:311:c5d9:2c79
 with SMTP id 98e67ed59e1d1-313bfbf5074mr1496750a91.21.1749682051843; Wed, 11
 Jun 2025 15:47:31 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:24 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-23-seanjc@google.com>
Subject: [PATCH v3 21/62] iommu/amd: KVM: SVM: Use pi_desc_addr to derive ga_root_ptr
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
X-CRM114-CacheID: sfid-20250611_154732_699739_AF85FB33 
X-CRM114-Status: GOOD (  15.04  )
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

Use vcpu_data.pi_desc_addr instead of amd_iommu_pi_data.base to get the
GA root pointer.  KVM is the only source of amd_iommu_pi_data.base, and
KVM's one and only path for writing amd_iommu_pi_data.base computes the
exact same value for vcpu_data.pi_desc_addr and amd_iommu_pi_data.base,
and fills amd_iommu_pi_data.base if and only if vcpu_data.pi_desc_addr is
valid, i.e. amd_iommu_pi_data.base is fully redundant.

Cc: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 7 +++++--
 drivers/iommu/amd/iommu.c | 2 +-
 include/linux/amd-iommu.h | 2 --
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 3cf929ac117f..461300bc5608 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -893,8 +893,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 			enable_remapped_mode = false;
 
-			/* Try to enable guest_mode in IRTE */
-			pi.base = avic_get_backing_page_address(svm);
+			/*
+			 * Try to enable guest_mode in IRTE.  Note, the address
+			 * of the vCPU's AVIC backing page is passed to the
+			 * IOMMU via vcpu_info->pi_desc_addr.
+			 */
 			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index f23635b062f0..512167f7aef4 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3888,7 +3888,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	pi_data->ir_data = ir_data;
 
 	if (pi_data->is_guest_mode) {
-		ir_data->ga_root_ptr = (pi_data->base >> 12);
+		ir_data->ga_root_ptr = (vcpu_pi_info->pi_desc_addr >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		ret = amd_iommu_activate_guest_mode(ir_data);
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 1f9b13d803c5..deeefc92a5cf 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -19,8 +19,6 @@ struct amd_iommu;
  */
 struct amd_iommu_pi_data {
 	u32 ga_tag;
-	u64 base;
-
 	bool is_guest_mode;
 	struct vcpu_data *vcpu_data;
 	void *ir_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


