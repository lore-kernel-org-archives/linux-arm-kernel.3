Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul73Yg1mYpP2TE2GLk0RQV/vMJ7XUY0pYKrpo3kbkOY=; b=PR0l9wYP0f2iedgQm/hVvxWYfU
	kRwk7MDCx41iNrVn9dVgAp1XwfynRRYG4HT/UQmH4bwBh02XEGEVC6pRi/vtqEa3xywQV3jPOfLsR
	Uq5AU08yW7tgTDvPL/qthx7jMy1YD9UOqcGaa4scwvgFzorWnNpaPdwhQRGAqsvbRABc+kr7ntPew
	xTWoUbuEtiDx6RoOxwlR3Ybj0bCQeYnZB+5ddU3NK9AZrjDlUhgh04/VBWOgqrEMw1/OPhrRPJZ55
	5GeWH4vaIaUNpIhN1AKlrJZe1muwPrCAyX2G2Ewh0EkewBfZ+DxVrZlLebbrGOAGRbiaRYEDFIzx/
	03tMKkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVhp-0000000BmJ3-0NkY;
	Thu, 12 Jun 2025 00:22:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDr-0000000BWwL-16s3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:08 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso234839b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682026; x=1750286826; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ul73Yg1mYpP2TE2GLk0RQV/vMJ7XUY0pYKrpo3kbkOY=;
        b=pmqjXC2xcQjNbejdu7OYB+jJZHSWEMn3clMuMJI0KJf1DHZEKxUaBkkxAs42XA6lBl
         MYk3tLWjlDJZjj8VA77I2kh0wepCsgkEFoPB6VVwoZlo2NNoKOkbRPTJ8MlvXjv9iBsG
         Gw7GgQ4k2p1fkj7DLujMmrztVcLQB/Yb3iw6YKZ96rlpZjiDhWXN/rGPo6DZv1ceMTVj
         06NSjZ5aSZJIVL/IBnpIT/i/hDsqPW6yaICjh2Q8eIkfkM2xYSfOGx4C5fOOnLYVCRv7
         Va567Oql+kalUlj89t9g83s0deyrHKMu3btKEjcxFNXKzKV0xVroT+c6EtQG725DTZhP
         fr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682026; x=1750286826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul73Yg1mYpP2TE2GLk0RQV/vMJ7XUY0pYKrpo3kbkOY=;
        b=kA6A6XNiZarakUtKnTdObS77RTlcDjlv5ODDUsg0RYtqb53hDHpPPq9uboilYNheCz
         BOtkM01z5xqC841V1PIinCzdEgowJPtnB6/fXprm9YUdcSTPIfRMsE+OpvwJrB/YerEo
         rYbjNR2ZlXBbsY68D5rXCxQATkDo+6g6bbK0n3mMf7UbWIZuFrvY1Mx7fPAbxKi5jZeK
         Biht6fvajMOb0C7AtC9UXQJ5iQVmzoCFCVZ1XVQfbayKrFULvon2c4LPzG+NRJ0nnYg0
         Ibelx5LZK63GLuXwPmVUiTSWE3aJChdFPWD2ZWr0PR95vk/27mez4HnGZbAw8TVYprHY
         fUiA==
X-Gm-Message-State: AOJu0YyvwrEic2Zva64xCUiIRulf0LSkmw6YK+/IysNP+DA7GzmH3/pZ
	hWYGWi44/1XUEOrpgC6IOtgt0wrQNDjp1s8sWaZGDY3WEDQ+aPazM7Iew7Ck9LgMhFBYCl0LdNd
	WlctZ0A==
X-Google-Smtp-Source: AGHT+IFnXBC/dw4RfxpNimXIzZIuT6MvY9BKC/MvZnHdhiI65erLZynkQdLm3L4jFFBDrmchy9AfkMLulyY=
X-Received: from pfbay26.prod.google.com ([2002:a05:6a00:301a:b0:746:223d:ebdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4e:b0:742:a0c8:b5cd
 with SMTP id d2e1a72fcca58-7487e2bf8cdmr1044283b3a.19.1749682026328; Wed, 11
 Jun 2025 15:47:06 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:09 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-8-seanjc@google.com>
Subject: [PATCH v3 06/62] iommu/amd: KVM: SVM: Delete now-unused
 cached/previous GA tag fields
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
X-CRM114-CacheID: sfid-20250611_154707_303111_F26A1443 
X-CRM114-Status: GOOD (  15.38  )
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

Delete the amd_ir_data.prev_ga_tag field now that all usage is
superfluous.

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c             |  2 --
 drivers/iommu/amd/amd_iommu_types.h |  1 -
 drivers/iommu/amd/iommu.c           | 10 ----------
 include/linux/amd-iommu.h           |  2 +-
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ed7374f0bd5a..4e8380d2f017 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -938,9 +938,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		/**
 		 * Here, pi is used to:
 		 * - Tell IOMMU to use legacy mode for this interrupt.
-		 * - Retrieve ga_tag of prior interrupt remapping data.
 		 */
-		pi.prev_ga_tag = 0;
 		pi.is_guest_mode = false;
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
 	}
diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 5089b58e528a..57a96f3e7b84 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -1060,7 +1060,6 @@ struct irq_2_irte {
 };
 
 struct amd_ir_data {
-	u32 cached_ga_tag;
 	struct amd_iommu *iommu;
 	struct irq_2_irte irq_2_irte;
 	struct msi_msg msi_entry;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index f34209b08b4c..f23635b062f0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3887,23 +3887,13 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	ir_data->cfg = irqd_cfg(data);
 	pi_data->ir_data = ir_data;
 
-	pi_data->prev_ga_tag = ir_data->cached_ga_tag;
 	if (pi_data->is_guest_mode) {
 		ir_data->ga_root_ptr = (pi_data->base >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		ret = amd_iommu_activate_guest_mode(ir_data);
-		if (!ret)
-			ir_data->cached_ga_tag = pi_data->ga_tag;
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
-
-		/*
-		 * This communicates the ga_tag back to the caller
-		 * so that it can do all the necessary clean up.
-		 */
-		if (!ret)
-			ir_data->cached_ga_tag = 0;
 	}
 
 	return ret;
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 062fbd4c9b77..1f9b13d803c5 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -19,8 +19,8 @@ struct amd_iommu;
  */
 struct amd_iommu_pi_data {
 	u32 ga_tag;
-	u32 prev_ga_tag;
 	u64 base;
+
 	bool is_guest_mode;
 	struct vcpu_data *vcpu_data;
 	void *ir_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


