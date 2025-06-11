Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B525DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQMxbahOoMV/Ka2zZMRG3HjDjex4nqWH9a70Z5WrrOc=; b=Ezg4NUXHvDNKUJy0bkjyC/iDtH
	65Kczywg/b1Gkibimr4TJd9QEgSqTfQTRo83F/CaLIWoRPNrR+LirNHBs0/GtpAuaP4uG3OYhYlBu
	B69DOqBIEqHBXgKw3alw4O88WjEXNiRFi+qFVpIWm0c/rm34DgMXB3oC1YyLQfucAHk54TVIBIlqk
	QLVsiqIokc96hkPgEicTOPdxfLbrldmCcISnAJVjp+7Z2wUs303Ckxw0W3NMNbZ/R555J3GdA4/hj
	4fO3EhaMyoTkVPIzCs3iBiuVc0pHz/L3bbsYwE5MbVsIDBw60LG4NxNh23VtZ4T+FzkKuRk23vb5e
	Ve88HX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVm2-0000000BmiL-2P9e;
	Thu, 12 Jun 2025 00:26:30 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDv-0000000BX2E-1D7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:12 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7462aff55bfso240793b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682030; x=1750286830; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bQMxbahOoMV/Ka2zZMRG3HjDjex4nqWH9a70Z5WrrOc=;
        b=hR1FPRrIQYXqjAchHeerX8rN5XXiCo7YL1tvUxBhho5ZBl5Dacr3dwyyiMsUNfTeZx
         +TNNpNWo8CzE3S7TDMp8J9imFVSswRlqtqxmTjaB5HIhY9kxRiaTwUUV0471RIjRYpWr
         bDwzXQTSZpz2vo1fwVAfb4vAOdsquH8Rv5+29WalQ3GXl1m3x1FmIJfyKV3x4d92q/mo
         vVdYNo4Psv3YJAGdqXhQDs1eN5n1QswR1XO7T1O5A2ayR+5MCjtXR1tmnfFqunpaWzUn
         EORBUPYydO0OFubC+ly0Xpcnm9jem/j7cuI832VVsNsbZUphodsH0YMymRbfpICK3Zxx
         6LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682030; x=1750286830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQMxbahOoMV/Ka2zZMRG3HjDjex4nqWH9a70Z5WrrOc=;
        b=NBPx6L1jr7rYrbQXlfG4LAON23EICZ2RnQEY/RaRfB5Wp6LFusL6JoAx5jCxU8NGSV
         QhgjeBHFchMBdXU4tTxWqhTgiTnARLoGZcRxqd1Ynnn3miKfHvkrttaYnbyL1F8qqoPD
         gNxL9pE0qDlGA8/L8klW/Zyn93ZTsefHMfCOdry2oK3EviWP3h1UO0rAxliGMyCnNMdh
         MpdE+7wFZgICjBgYey3ddz91kDWrcaXzRSmFZww1Cqg3GkMn0KyClBqcGHKttLHinRUR
         lnHRfFD33zCbQRTLeSClVIr86PS3K5mff5afMmv+l6UbeR4A9fibXTq73mW45Divzn0R
         aOMw==
X-Gm-Message-State: AOJu0YyXet50avrTVkB0BvGLjkreiSNlVwtJbHnHnlxXJpqsLhYZE8Ee
	DJcQkktXbLW9+a5Ni40K2EVTjeU6siUtenOyhRAo0v080w6Q0pQqC5JVCMnp7soI0TxUgkCHtzn
	m3pMRsQ==
X-Google-Smtp-Source: AGHT+IHU4UK6dAUOCbwJWWrdH0PtCWdxR/jj188N0b0b6EvIJsVmByJnhGgC9nFYnYfLkqG3Y4MI9nywi44=
X-Received: from pgar4.prod.google.com ([2002:a05:6a02:2e84:b0:b2c:4ef2:ca0e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9a:b0:21c:faa4:9ab9
 with SMTP id adf61e73a8af0-21f866f2d2cmr7405522637.22.1749682030084; Wed, 11
 Jun 2025 15:47:10 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:11 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-10-seanjc@google.com>
Subject: [PATCH v3 08/62] KVM: SVM: Drop pointless masking of default APIC
 base when setting V_APIC_BAR
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
X-CRM114-CacheID: sfid-20250611_154711_323553_0B185EEC 
X-CRM114-Status: GOOD (  12.61  )
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

Drop VMCB_AVIC_APIC_BAR_MASK, it's just a regurgitation of the maximum
theoretical 4KiB-aligned physical address, i.e. is not novel in any way,
and its only usage is to mask the default APIC base, which is 4KiB aligned
and (obviously) a legal physical address.

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/svm.h | 2 --
 arch/x86/kvm/svm/avic.c    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index ad954a1a6656..89a666952b01 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -260,8 +260,6 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 
 #define AVIC_DOORBELL_PHYSICAL_ID_MASK			GENMASK_ULL(11, 0)
 
-#define VMCB_AVIC_APIC_BAR_MASK				0xFFFFFFFFFF000ULL
-
 #define AVIC_UNACCEL_ACCESS_WRITE_MASK		1
 #define AVIC_UNACCEL_ACCESS_OFFSET_MASK		0xFF0
 #define AVIC_UNACCEL_ACCESS_VECTOR_MASK		0xFFFFFFFF
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index c981ce764b45..5344ae76c590 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -244,7 +244,7 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 	vmcb->control.avic_backing_page = bpa & AVIC_HPA_MASK;
 	vmcb->control.avic_logical_id = lpa & AVIC_HPA_MASK;
 	vmcb->control.avic_physical_id = ppa & AVIC_HPA_MASK;
-	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE & VMCB_AVIC_APIC_BAR_MASK;
+	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
 
 	if (kvm_apicv_activated(svm->vcpu.kvm))
 		avic_activate_vmcb(svm);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


