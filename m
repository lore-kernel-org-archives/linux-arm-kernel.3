Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201C0C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o3WGFG+EaR4ZcOuVZ9zENMrapystEeQsKqGzB4EF5M=; b=pHdWMCSx8XKuB5hR0NA14vLKb1
	1jjrabdT97T9XJ/VCvbfwhleEPMYwenOg0N9OKtWDWysjBpDXMxlijmn5FAlpXH0+wnZKevEvgxx2
	mRPLr7ASwG1tAl55ihKbmSP86aEtfXqmOw5nGQCGD9sR4YUteDLbmocvyyyAgPBFE+OByKa4bwLEK
	VqFRG4DrYPcuU2+g7idGXdriZCdwknVWnIR9dAcY0cv8zYHNbVH4kRKg4SeVqMFjurl2gqKvGkPg6
	ppS5FuA8Djn+MY52nacJNrJAw4fTvzHFUg75yitPIVXX4a6QfxiDBaFliuKleQTb2yeSGJwc4+aTf
	WCXUDa5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWp4-0000000Bsxd-445J;
	Thu, 12 Jun 2025 01:33:42 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEm-0000000BXcT-1ZEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:05 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74847a38e5eso208491b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682083; x=1750286883; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1o3WGFG+EaR4ZcOuVZ9zENMrapystEeQsKqGzB4EF5M=;
        b=iz6MgukvVRvHCm3SAutDT8HWF6/cddElU7LPH+cLMh+khCJxytZ3/mecoef05jxNfh
         v9TGcmJF4AUNog6fs0sg31qzUOEWWHEnSGbLgHDAWixeoTCfELt1BmIkJeVtPOI8LFcC
         6rBv1uoSA93ONgcS6c9uuAy/NqG8h1ah79ipsmGnesDSTfWAVt5R0EiLI7Ci7Vrn+2pO
         1Ii2KW/dvUEol7c/Rkx0qmWZ/ONJoYs9LdhE5Rd14dJ5cmcr9otpDwGkEVXzuoRM3n/j
         I+CJlrWHm1nfxoWgZqpLQPFBYNy/gIlaaJ1IEuT0stFfG79S1DNcSs2lRHyW5T0otL7Y
         B9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682083; x=1750286883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o3WGFG+EaR4ZcOuVZ9zENMrapystEeQsKqGzB4EF5M=;
        b=oBgXM9wCeEadqLZYuYPupKnQu9mAKGl+BNhSYv1bPN3T+S36ENKxGvo1/O9ywtQHBY
         DG95ZreXDhv175DmdUqDByT2DLFzSw62eXoCs7xNvnFYeCOEVHDxHGmMTJDobGEZnax+
         9xNqZBIkI+Rf44Y8pj5K9A5AgheimsXRoYpKMNArcw0dZ1IyERHFg0O0BlaUqyjSCR8W
         8xa75xi3s5XNJvr3BN8jS9c9T/FzGBLYz7WozE+SqcCZPnrV6TwyySeG36240HzI9qFt
         NruJVUsU8kv+LrAIlDz/IhWZ57YCC19Z7VBsa2wz9Q3w64IpPIVrPkqBk4gsFBmnvalX
         BlTQ==
X-Gm-Message-State: AOJu0YwQul/B86/FpJqM7McR81QFph3NefsiivD2RMJyaeRBAQB6Mc1z
	L4yd5h/V4yvbuw2HERknZi7fhRGAbChqFOTZmYhLs14qgpEuyfh7/J1HfmfZIF7/y2M8Qtvr1iA
	PvtQR1w==
X-Google-Smtp-Source: AGHT+IGR4w9J3onYODzU2Sfz5wEnxfVemQzL0W0aJt8YvQhN18RuJB+dzan66R+cAm17xLYHnG+IrBPZWnM=
X-Received: from pgbdr17.prod.google.com ([2002:a05:6a02:fd1:b0:b2e:c00e:65ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8cca:b0:215:d4be:b0b2
 with SMTP id adf61e73a8af0-21f9b93f637mr691254637.34.1749682083132; Wed, 11
 Jun 2025 15:48:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:42 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-41-seanjc@google.com>
Subject: [PATCH v3 39/62] iommu/amd: Document which IRTE fields
 amd_iommu_update_ga() can modify
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
X-CRM114-CacheID: sfid-20250611_154804_413849_FF6A1BEE 
X-CRM114-Status: GOOD (  12.14  )
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

Add a comment to amd_iommu_update_ga() to document what fields it can
safely modify without issuing an invalidation of the IRTE, and to explain
its role in keeping GA IRTEs up-to-date.

Per page 93 of the IOMMU spec dated Feb 2025:

  When virtual interrupts are enabled by setting MMIO Offset 0018h[GAEn] and
  IRTE[GuestMode=1], IRTE[IsRun], IRTE[Destination], and if present IRTE[GATag],
  are not cached by the IOMMU. Modifications to these fields do not require an
  invalidation of the Interrupt Remapping Table.

Link: https://lore.kernel.org/all/9b7ceea3-8c47-4383-ad9c-1a9bbdc9044a@oracle.com
Cc: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 36749efcc781..5adc932b947e 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3986,6 +3986,18 @@ int amd_iommu_create_irq_domain(struct amd_iommu *iommu)
 	return 0;
 }
 
+/*
+ * Update the pCPU information for an IRTE that is configured to post IRQs to
+ * a vCPU, without issuing an IOMMU invalidation for the IRTE.
+ *
+ * This API is intended to be used when a vCPU is scheduled in/out (or stops
+ * running for any reason), to do a fast update of IsRun and (conditionally)
+ * Destination.
+ *
+ * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
+ * and thus don't require an invalidation to ensure the IOMMU consumes fresh
+ * information.
+ */
 int amd_iommu_update_ga(int cpu, bool is_run, void *data)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


