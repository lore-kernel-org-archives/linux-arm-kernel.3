Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9DEC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAqMQv4ZCiS/o57gwDnKWsXRvD97E5JGl6V3dBiKRrw=; b=U5otpbc2IO8EUXBvMJjbkteBoN
	jcafws2EqgvOccAajOfPEWdrctX5MQ7dJPVE0Pf6JtqFyDai7MJinkR0T+6u66qS8uZUPhgnfZMn3
	dAdP705/xBQePBgQlIgsHdamtJc1ixdHpjwQqdaCIgfQ7FbnzWeWW0ljF1i4RyA1XCEtGiW2HtZ4R
	c5sC+z15DmFCecAWwOECbwa+NVJIGZMZYnUO4XFntc1NTm3qJnkyKOSZslZ7cxvZw2m+8JbAL0btZ
	UlTT3RjZknja8p7Q8zFSvHeIm3V5A7CG5Y97dgcEYaIX/BdTx2l8babPr/jHy5BM3cx4E4kxfQBsX
	xvml02Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXOm-0000000BwJS-3yxZ;
	Thu, 12 Jun 2025 02:10:36 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFF-0000000BXwZ-3XaC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:35 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747cebffd4eso233610b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682113; x=1750286913; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wAqMQv4ZCiS/o57gwDnKWsXRvD97E5JGl6V3dBiKRrw=;
        b=TfH91oV+lJuyZPEqI5t+Ax62N4YAhC28qGKW3gNLHFhsC2GTG8bciGA8q4eH3fSaWG
         xmYwkDdm7CFzVB+iliqPwDPwRWziCjm3olwnwWxCLICUAtx+VG4AZ5imFQpnYaIvNQCa
         av23APJ/UeJPtA+8eJJfPSiQLAdxVBc3cYnZkrjkHnLHV+oJpmNPAGeVslq94ZykfVqM
         e1nlpX/30mSo+CT/WHnD/3lCQuHTPv9zvRAF+i9h0mQP8sdJUe/Y8gFMgieaIRcBTtlC
         waJTl0GT0JYIrbJT3i2NuWpQf0qLB0lVtNnbpMpAP7BtnnTqcxXrM7QJMLMkAJFVPc5n
         SIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682113; x=1750286913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAqMQv4ZCiS/o57gwDnKWsXRvD97E5JGl6V3dBiKRrw=;
        b=sUjzktvc/NabdRWcVlw+GV+HFlwoETxOzjmgxzci4sn6rhjQrSGQyPchkQlvhwwXUF
         oDKpuNJlHnJUn0Hsn54ah/Ci3TjQraYRKvL6+67F5krzbuYqGpAQUh6kc7jRa1qJ8qj9
         VT+NiDzOBaoRBEqa0J4IDTZ+rBcjG4CiXLQ3AWYeFBRITCgT3VvX3Sv1odyZfZ7dCjIv
         98PIym+eMitoDgyF+1Wq7DBBOLSlV3gtvryPOiB8e2dsIpJ98S+1T2o/KM48ZJU/EtNk
         cBhvLmdgNtN/rgkS/etsdkLU1a4h+WGu+vTRJPhKGUCRhWIMmxbsPpaVD/UNy/0H00YH
         Qgvg==
X-Gm-Message-State: AOJu0YzsmXT7tDnfJEnc79MrSSaB4ESsrPVNy6fPWLhZ5Sf1nSbaoMK4
	DJ7VSAaOD7yGJsqrvI5445FzrSXDtbr+/OUkdjfZTleEcJX2l2ndg01xKWFBRL0Y9SP7sijRqAZ
	drvPD1w==
X-Google-Smtp-Source: AGHT+IGWXeo6wLxobJN8weuZ+dD2iRb7MDLZVxncM/6se6ioUirEafScJTOie1Jy0cagndCeqMrM68HvN2k=
X-Received: from pfms8.prod.google.com ([2002:aa7:8288:0:b0:746:1a7b:a39a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a86:b0:736:5f75:4a3b
 with SMTP id d2e1a72fcca58-7487e0f2cb6mr1014723b3a.7.1749682112843; Wed, 11
 Jun 2025 15:48:32 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:59 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-58-seanjc@google.com>
Subject: [PATCH v3 56/62] iommu/amd: WARN if KVM calls GA IRTE helpers without
 virtual APIC support
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
X-CRM114-CacheID: sfid-20250611_154833_893119_5F50BF5B 
X-CRM114-Status: GOOD (  11.76  )
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

WARN if KVM attempts to update IRTE entries when virtual APIC isn't fully
supported, as KVM should guard all such calls on IRQ posting being enabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index becef69a306d..926dcdfe08c8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3836,8 +3836,10 @@ int amd_iommu_update_ga(int cpu, void *data)
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry || !entry->lo.fields_vapic.guest_mode)
 		return 0;
 
 	if (!ir_data->iommu)
@@ -3856,7 +3858,10 @@ int amd_iommu_activate_guest_mode(void *data, int cpu)
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
 	u64 valid;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) || !entry)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry)
 		return 0;
 
 	valid = entry->lo.fields_vapic.valid;
@@ -3885,8 +3890,10 @@ int amd_iommu_deactivate_guest_mode(void *data)
 	struct irq_cfg *cfg = ir_data->cfg;
 	u64 valid;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry || !entry->lo.fields_vapic.guest_mode)
 		return 0;
 
 	valid = entry->lo.fields_remap.valid;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


