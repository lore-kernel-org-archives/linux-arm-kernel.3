Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A38CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNaUgI3CtCWyHWdRlJq0xZGnOnJtcDe+W2oSC+iqpLQ=; b=OzvasYJRWz6M+YnDC/WfFrxugG
	7Bi6b8naW/9dd+OC00SX9pvDWEumHs1zAxqHYbsRuoXL5DkN7PWTVkMwu5Zm3znHouMEJNthcVQKu
	MjvR+TER1u+qZ7jFMc63SUV8VfbUP6y5y0IX4ehFEbwkA+bWQDJfPni4nxsZHQ5NANuAvUT0VPnFM
	XV66AvSPNyYOtCABHJ+2+4OM/+ul8AN8Ap6m0IVkUOKYqSRXRDAMj7kWrHBEfZ04Hhkuho7/ARWCI
	iqeL5wq64VL/TG+L2GBWBPcmn2Y3sgKw/YjS0AI0OCQSqkNyLbGuX0TzbeLRt+yZX9F2oOAROjOgV
	MM+vC/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8m-00000007FlE-3NYJ;
	Fri, 29 May 2026 11:12:36 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8b-00000007Fek-0ivP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso8864788b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053144; x=1780657944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNaUgI3CtCWyHWdRlJq0xZGnOnJtcDe+W2oSC+iqpLQ=;
        b=IdSYnY3lspbMRuZ58VMIpClM5H7mvA08IJ0q9/Kx9O/BVkPfTEpMUvnjTuQ49LbaUE
         hDEKyM7gDXLT6h2d4GRQr4yEo1BCJxyfnr8qYTNJMN+pAj4CAcVcmiumIezzPiepZbEu
         F7FXqyiQY0LCUvKZeGPBeP2ZgOaIytldsNTYUih81BvQK26z883bzpfGSdpEqVNjKGsE
         S8UcGbfWmCNxif1I1t4WzY+gyFnGBJMlgcGKtEiV4hOyAWDAlXQdDjqi2POv/iPN4Mt2
         ePFBy1I57jvd9ASmSwEn/p3E8mJ8g7ia3vBB1/ZrwToOg3I11Ad+nRhXYXQg3ydsLxrZ
         MmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053144; x=1780657944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNaUgI3CtCWyHWdRlJq0xZGnOnJtcDe+W2oSC+iqpLQ=;
        b=Nx8VXkWu516T3gkd7mjNFW+PP/y1Kd+UrsLOhnH0odKjIxxlBZ2X9h21prkgcBbd+a
         SgqJlGH+Qhf6Fxw3nAsd0+GyUFjIM2Divw4Ka8N5UGjFOAZGggOVFqp/HZomwdel1FuI
         pCha+nQkq6uN63UoNge5KwD63KQMPUTtOZknPriUVcSNZ8GLqjkeSB82PkFoXzJ2rzZ3
         Bj5CkLK0B3fMq2sayzesUWvgfvtEy2YSPd8v66Cp5rjUsxBvtq1BYf/NDUu5ey54eT5Q
         v9iLziMZb3siKWtefLyXxxnYGlZGHatHhC4I/Z9/n3HRDet0+tgpwLyvs//oX6ecWIMt
         ke/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qcq878oru+U/ozd6zwcPozrOYEDzHFzifeNyJZe8Os2WNwCI1A7ZmfcKpHBRaUYsWfNU6XD0OWbvOZlj6pZSf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa7mQ/6NfviSMH+6zG79+H1LrkffokyX4HACw4zKqGepVlpCfB
	a3TCw2MnHSCq5PgKJrmrIViNs7ulXQkL25WulRSJlGuty27zg2pp/34Lwh99xeSGnChTlTDV75R
	R3g==
X-Received: from pfbll21.prod.google.com ([2002:a05:6a00:7295:b0:835:429c:76df])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:848:b0:82a:7471:eb90
 with SMTP id d2e1a72fcca58-84212ba36e5mr2711651b3a.30.1780053143552; Fri, 29
 May 2026 04:12:23 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:07 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-6-praan@google.com>
Subject: [PATCH v6 5/6] iommu/vt-d: Fail probe on ATS configuration failure
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041225_215928_C2DA5F72 
X-CRM114-Status: GOOD (  14.38  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Update the Intel VT-d driver to handle ATS configuration and enablement
more strictly. Specifically, update the device probe to fail if
pci_prepare_ats() returns an error. This ensures that any ATS-capable
master reaching the attach phase is guaranteed to have a valid config.

Additionally, update iommu_enable_pci_ats() to WARN() if pci_enable_ats
fails. Since earlier checks in the probe phase preclude config-related
failures, any failure during hardware enablement is considered a kernel
bug.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/intel/iommu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 4d0e65bc131d..22308e4911e1 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -873,8 +873,14 @@ static void iommu_enable_pci_ats(struct device_domain_info *info)
 	if (!pci_ats_page_aligned(pdev))
 		return;
 
-	if (!pci_enable_ats(pdev, VTD_PAGE_SHIFT))
-		info->ats_enabled = 1;
+	/*
+	 * pci_enable_ats() should not fail here because earlier checks
+	 * have already verified support and configuration.
+	 */
+	if (WARN_ON(pci_enable_ats(pdev, VTD_PAGE_SHIFT)))
+		return;
+
+	info->ats_enabled = 1;
 }
 
 static void iommu_disable_pci_ats(struct device_domain_info *info)
@@ -3288,7 +3294,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 
 	dev_iommu_priv_set(dev, info);
 	if (pdev && pci_ats_supported(pdev)) {
-		pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
+		ret = pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
+		if (ret)
+			goto free;
+
 		ret = device_rbtree_insert(iommu, info);
 		if (ret)
 			goto free;
-- 
2.54.0.823.g6e5bcc1fc9-goog


