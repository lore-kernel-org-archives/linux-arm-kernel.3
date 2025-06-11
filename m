Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD672C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZIGTXeypHh9nAzQZBQedf1Xm+LoLGaDX4jKjQeTbIE=; b=hC4kTwYoNzvXdThAkOSTPB6S5c
	TTYnn2MmiNsD0cVGUbSVHJDAp74w8w09EfqWORmWGf4w4sDaxQXPkXxtsFMq96yClD35JhKA2iND3
	rnxvKxitkuRZvzWP0XQxCNYBZqz7aJqrnKkd2daBmMuavpCODmsVBmnUi3DWirx01miMbFCWY26si
	2i2EXyNaISqhr7Fssm79BMLw+myGkbXIXOaaOYdVkPMOP8GihYRTyfynyrL6w8i0jeDT0mWtKBQaw
	plKAGxRHwLjjPDZJvQE42qQ/eNxw0S+bm6l+UnpGFjj8eZCrllK5/y5tWuH6YMpX7QVvSPrMSrMQz
	Xgn7WCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWFQ-0000000BqK9-2wkp;
	Thu, 12 Jun 2025 00:56:52 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEI-0000000BXIF-2zcS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311e7337f26so245877a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682053; x=1750286853; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZIGTXeypHh9nAzQZBQedf1Xm+LoLGaDX4jKjQeTbIE=;
        b=UxlPwSHNW3Aivr7kcecvL1+T9czANEOekomthBiN8DK3i5n2dSYuZW2lPhUiQZdzBs
         /1/WBPFb1JcgL3EwCd/hwO9P7oIJMkwzZZR/knsDh69EiRtBTBIS6CRnh5HuqRVSoelS
         bVhoOYntK/U6hCLvp0ZVYz5Z7WOT6IozPcWnUyavvhyJtiHImGLR/3JyvKEwKiI+12jM
         5sVFZNjCgoNeI+Bm2o5zMQv6LATpa7cm1tpa65aVdPZH9dvgTHQOoz09s62yENY15ads
         fpH+vdWSmfoe+A6G2Kss6L5CoQEPxXqlcj7hlEHJR4hgNcjB79ilWbM6eVqWcCUr0tET
         AmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682053; x=1750286853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZIGTXeypHh9nAzQZBQedf1Xm+LoLGaDX4jKjQeTbIE=;
        b=P9AP4d9M2DMZm0uv/G86weVaTaBtbw72VfDX2y+zJoGxzxOsTmfP9zNZReQE6xUT2t
         Ngcob3pHFipjRKrzlZItj112resg+IgAa53JB7XR0G5onCdNxa/GWFJMlT3yEhbpFBkI
         J23GQXcWu7Fix/6Ywj61kzxdwQZmXokmyT3p58yQgu6QbB6w9zv0baZHS5vT0xvFhQDh
         lSQARgU+maVFLTa5eyIWv9+APaj2YYniz/XBFfgqBjfD8wlpCTbjtA4fHK5WRSBsYNbX
         w3a4Id/AQTRSUTsf0H1YbdJXHC4Ely3ZlddtZHmi4eEdej03jfMklt+vY1+K5W5yZDAz
         Iwtw==
X-Gm-Message-State: AOJu0Yymku1Xt1PiK92fGuPSMeVj/twXQoC6ETtD4h/R+rT0ZXeMElPP
	4WOwXDYaKA9K2oKPQTT6y1qSzfh+Xivzpr0DIqlYTJpHBRMlqLYn+3Gl9AdcKTS5DYgNkGnDjjk
	7HnXMYw==
X-Google-Smtp-Source: AGHT+IEMDc4s/X6k49FZuDgV3o04isaOgZ+4Gyq7hnGZguC+YKTMyGOmyVtkAPikERIj/O7QNBKSeMcDWAk=
X-Received: from pjh14.prod.google.com ([2002:a17:90b:3f8e:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540f:b0:311:eb85:96df
 with SMTP id 98e67ed59e1d1-313af1abb7bmr8018754a91.17.1749682053580; Wed, 11
 Jun 2025 15:47:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:25 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-24-seanjc@google.com>
Subject: [PATCH v3 22/62] iommu/amd: KVM: SVM: Pass NULL @vcpu_info to
 indicate "not guest mode"
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
X-CRM114-CacheID: sfid-20250611_154734_758221_9F4EA256 
X-CRM114-Status: GOOD (  15.06  )
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

Pass NULL to amd_ir_set_vcpu_affinity() to communicate "don't post to a
vCPU" now that there's no need to communicate information back to KVM
about the previous vCPU (KVM does its own tracking).

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 16 ++++------------
 drivers/iommu/amd/iommu.c | 10 +++++++---
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 461300bc5608..6260bf3697ba 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -927,18 +927,10 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		}
 	}
 
-	ret = 0;
-	if (enable_remapped_mode) {
-		/* Use legacy mode in IRTE */
-		struct amd_iommu_pi_data pi;
-
-		/**
-		 * Here, pi is used to:
-		 * - Tell IOMMU to use legacy mode for this interrupt.
-		 */
-		pi.is_guest_mode = false;
-		ret = irq_set_vcpu_affinity(host_irq, &pi);
-	}
+	if (enable_remapped_mode)
+		ret = irq_set_vcpu_affinity(host_irq, NULL);
+	else
+		ret = 0;
 out:
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return ret;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 512167f7aef4..5141507587e1 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3864,7 +3864,6 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 {
 	int ret;
 	struct amd_iommu_pi_data *pi_data = vcpu_info;
-	struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
 	struct amd_ir_data *ir_data = data->chip_data;
 	struct irq_2_irte *irte_info = &ir_data->irq_2_irte;
 	struct iommu_dev_data *dev_data;
@@ -3885,9 +3884,14 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 		return -EINVAL;
 
 	ir_data->cfg = irqd_cfg(data);
-	pi_data->ir_data = ir_data;
 
-	if (pi_data->is_guest_mode) {
+	if (pi_data) {
+		struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
+
+		pi_data->ir_data = ir_data;
+
+		WARN_ON_ONCE(!pi_data->is_guest_mode);
+
 		ir_data->ga_root_ptr = (vcpu_pi_info->pi_desc_addr >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


