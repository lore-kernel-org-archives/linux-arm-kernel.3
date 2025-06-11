Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8231C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1jGPlsD+uHDpRgxTkjVCkrhVGHj4h2DSBv3sZnUZ6I=; b=36WvA2piZiR4u7bupzM2iNW6v/
	eAI0MfE2BSy8Gx/KTudjLMKgWB2jIrBQQGVZlUBx6BiqjayyL8uuJpBwHXh6rzyiDBBR/V/xmnJ7N
	6O5RBwoMILwke8HzMxT25eaVRTOQPt4DWFO4N2qujQ1JmF6/ey/I623vCJgl8c3TdRGUVqA+FfPSP
	a3x7f4Dw59kBePbYQVJdBnC+U+fAonLShjpUJ+KNg3odY9UXzhPgzt5SN3X22UhwXix6OMoSZ0fMo
	DtPXzbRwfxbmTthW2I4DoN+lin5m8o3Zp+R3V3jkFL4lpXJqwyqc2LlOPMjz0oFAM6hGvQpxkZ4iI
	Qad6dIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWtG-0000000Bt9I-2Oka;
	Thu, 12 Jun 2025 01:38:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEp-0000000BXgX-2gE2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so355247a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682086; x=1750286886; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1jGPlsD+uHDpRgxTkjVCkrhVGHj4h2DSBv3sZnUZ6I=;
        b=WlkWV8pyv8kvKkOw3HQ23TkkKcWvHv36/8NaWAO89kz4lC249JHgJsm5dv2pj2eBFi
         vHsDcQZyX3V17HqPTVcvXoYMd60PsklDKej9EidOwu3s3R9CJSvEyhdgbjVG3W+GeR0i
         F2Bqnwum1/1gvPnKgGXLpXDw2duYWOaebUqEF556M/WNksw6WJvOgXA+c6Wm7i7bSkPY
         5DjwzApbhfXtQu6+jAIrMnm9EjU9vVoKgzsLr9k2o5YmkPsZDs1+o3EPVhoEsUqqmtdG
         sfspU3nKcGI8uf+ZVELFZl2C/WxVFpP/d0nk01U1ZvcgAvie/qVtaE1ZP84pqdYV+4SU
         3aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682086; x=1750286886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1jGPlsD+uHDpRgxTkjVCkrhVGHj4h2DSBv3sZnUZ6I=;
        b=iBmHt6evnG9DY2OX4/CdBOc1aI3DLmpyRWbdZ4ap7WfIq30sWJRX2Yblp+kjzz6gEc
         cYCr+FJpji6bFIsna9m13U0usSY58SoY+7NeA56tRbLYzeiF3n0oJmNPcR3D6fPmD8Sn
         Ts7as0V4lcdQZEKcAhBVS+Abyt7qwX3Osm/O8PEsxRHqQwLW6r4WuzaUnrRtzSlwEunM
         KWJo9sKQVeZKUp3PFLR6IeHfCYcRh6UEbQC/j4qcKIdLJFMHqeee+NYf2mb/DOmtW+NW
         SR89gEASRBzA/+3W0AvJrpXIA4lQNjRCNDFT+CsjXn832TrldLVWBr6zr+IMvV5+L/YH
         58qw==
X-Gm-Message-State: AOJu0YyYZ3/XuFAm6ujWsIXd/Q6aImjSLcaP5CVgakm5X1/JLk/gAz2U
	Ndm0O8qRvqUKSnNUila5FKQ5Oq5A6JgG6fytuslpMx1IfiQ1TICHZrZM42T52cL1WhsKdHP1DwS
	xH28IvQ==
X-Google-Smtp-Source: AGHT+IGHoNvr6Cnk8J+KREg0HNO21SSc1Je6u1/AJsjFVgdYxx6GvgmCCTNG7aYe4NPsZfXP33le5zKfeT8=
X-Received: from pjbsb6.prod.google.com ([2002:a17:90b:50c6:b0:312:2b3:7143])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b41:b0:311:c1ec:7d12
 with SMTP id 98e67ed59e1d1-313c08cf229mr1001910a91.23.1749682086599; Wed, 11
 Jun 2025 15:48:06 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:44 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-43-seanjc@google.com>
Subject: [PATCH v3 41/62] iommu/amd: Factor out helper for manipulating IRTE
 GA/CPU info
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
X-CRM114-CacheID: sfid-20250611_154807_677201_830EDCD4 
X-CRM114-Status: GOOD (  17.36  )
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

Split the guts of amd_iommu_update_ga() to a dedicated helper so that the
logic can be shared with flows that put the IRTE into posted mode.

Opportunistically move amd_iommu_update_ga() and its new helper above
amd_iommu_activate_guest_mode() so that it's all co-located.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 87 +++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index bb804bbc916b..15718b7b8bd4 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3804,6 +3804,52 @@ static const struct irq_domain_ops amd_ir_domain_ops = {
 	.deactivate = irq_remapping_deactivate,
 };
 
+static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
+{
+	if (cpu >= 0) {
+		entry->lo.fields_vapic.destination =
+					APICID_TO_IRTE_DEST_LO(cpu);
+		entry->hi.fields.destination =
+					APICID_TO_IRTE_DEST_HI(cpu);
+		entry->lo.fields_vapic.is_run = true;
+	} else {
+		entry->lo.fields_vapic.is_run = false;
+	}
+}
+
+/*
+ * Update the pCPU information for an IRTE that is configured to post IRQs to
+ * a vCPU, without issuing an IOMMU invalidation for the IRTE.
+ *
+ * If the vCPU is associated with a pCPU (@cpu >= 0), configure the Destination
+ * with the pCPU's APIC ID and set IsRun, else clear IsRun.  I.e. treat vCPUs
+ * that are associated with a pCPU as running.  This API is intended to be used
+ * when a vCPU is scheduled in/out (or stops running for any reason), to do a
+ * fast update of IsRun and (conditionally) Destination.
+ *
+ * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
+ * and thus don't require an invalidation to ensure the IOMMU consumes fresh
+ * information.
+ */
+int amd_iommu_update_ga(int cpu, void *data)
+{
+	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
+	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
+
+	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
+	    !entry || !entry->lo.fields_vapic.guest_mode)
+		return 0;
+
+	if (!ir_data->iommu)
+		return -ENODEV;
+
+	__amd_iommu_update_ga(entry, cpu);
+
+	return __modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
+				ir_data->irq_2_irte.index, entry);
+}
+EXPORT_SYMBOL(amd_iommu_update_ga);
+
 int amd_iommu_activate_guest_mode(void *data)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
@@ -3985,45 +4031,4 @@ int amd_iommu_create_irq_domain(struct amd_iommu *iommu)
 
 	return 0;
 }
-
-/*
- * Update the pCPU information for an IRTE that is configured to post IRQs to
- * a vCPU, without issuing an IOMMU invalidation for the IRTE.
- *
- * If the vCPU is associated with a pCPU (@cpu >= 0), configure the Destination
- * with the pCPU's APIC ID and set IsRun, else clear IsRun.  I.e. treat vCPUs
- * that are associated with a pCPU as running.  This API is intended to be used
- * when a vCPU is scheduled in/out (or stops running for any reason), to do a
- * fast update of IsRun and (conditionally) Destination.
- *
- * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
- * and thus don't require an invalidation to ensure the IOMMU consumes fresh
- * information.
- */
-int amd_iommu_update_ga(int cpu, void *data)
-{
-	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
-	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
-
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
-		return 0;
-
-	if (!ir_data->iommu)
-		return -ENODEV;
-
-	if (cpu >= 0) {
-		entry->lo.fields_vapic.destination =
-					APICID_TO_IRTE_DEST_LO(cpu);
-		entry->hi.fields.destination =
-					APICID_TO_IRTE_DEST_HI(cpu);
-		entry->lo.fields_vapic.is_run = true;
-	} else {
-		entry->lo.fields_vapic.is_run = false;
-	}
-
-	return __modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
-				ir_data->irq_2_irte.index, entry);
-}
-EXPORT_SYMBOL(amd_iommu_update_ga);
 #endif
-- 
2.50.0.rc1.591.g9c95f17f64-goog


