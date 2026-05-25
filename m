Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF3CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrjCHBiuBsjUFngiV4EYGqc8MUFFnHs0ozhKw+gXIDU=; b=QsbLUovXTI44BbqJ+ErzoE42B4
	5sy47e1OY6dvmnSXuePYMwb+lQmdtFKaMIVuP18kGP90pX1XqsExwyiugLDMmjQJYOam4V9xaI6NP
	6YFzAY7ChsHbLdqTEszb+irjjfd9GuLsjmK8kzqccQkH4S7kPF2GsYdW8jRzN8xzqKzhbQhlx+NgF
	hUD4HiXo9u8oJpEUgTxwSixoyRLQhsRtExenwvS5+0IhkJL8yQ1tMI1EnaQclBEeoXCZWLscBvVUO
	PFyzK1x4DAP9ApK7bLy+sE3kutel662uPuaqNXFmD2j50zXh6nIXg70TJU9VIe6miOiL9sCyKy1eW
	Ua/Oappw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHZ-00000000G23-2wAB;
	Mon, 25 May 2026 18:44:09 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHR-00000000Fx5-27g2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:44:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5634561b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734640; x=1780339440; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrjCHBiuBsjUFngiV4EYGqc8MUFFnHs0ozhKw+gXIDU=;
        b=PkRQwLkAbmQgIIkdUOS8DwMdhn+PxJkfJ3cfh52dpjWlH9H3RbWlysHS6Y7dP+gNDC
         QLfbzt1P0GS+Z7W7iV/ogaquA4AoK51OzXR/A4IugqoSfThF9w5WOfA/fCs/Kz0AMNWU
         xq2iWvcnuOP7pZl6jkSY4Lsy2ymCrqPtqBn2xBOHCbuyiXWqBFmaiQV350PoMp74/Y8n
         1UzeJpkd3zGaZhV2vOIK1S/kN8jovAbuvn2J9/50VkPyZZmdYuiA2W8uiZUdFKaTvdhE
         hjoK3cNzPK1FZ5e/L4KE5zBvfk/Yr7AI7vpegSwEgMZe1lCksuw7toKw0QiV960hiB76
         tlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734640; x=1780339440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrjCHBiuBsjUFngiV4EYGqc8MUFFnHs0ozhKw+gXIDU=;
        b=gg2lCGDRkFrPTmyV3ECSwiHhckyth1DYrcg+9RcCNBMnBg720UiWs6YDP0G6z8OzJc
         /AR4s6dgN7FAAdm41OW++BTfCFMC9wXAWGDc7AA+5woGI0+qP5PpHVauJDwzDtJ5tMAI
         Dwh1KL5ZUqSBaysgcf+D8N9d8RGGcw5643ZT0EX0SiGmYygMnuIcIswqeCdfLwDt9k6s
         kAkr6+jRUOFGxjTS8wpU8Iaq9lALY/1AiWyFF3i/lf8iEsFgNpKJvEO03RxA5I6Xm1d5
         yjkhGvrJkAj7ACSvB5MlXCCNkwkX8w8oNqAkOkvfNq0Y1lkDfIy9a7TAcJWpCwiNtWxa
         3EIA==
X-Forwarded-Encrypted: i=1; AFNElJ/S68UXMY+Cy+Fk37qBJ9Ugz7c3NptpuMsv8wupMRTM88kn10+qh14UpXBEtVEE1BXSsbSp4+EYqhsZNwSYKxnP@lists.infradead.org
X-Gm-Message-State: AOJu0YxB2e7rjoUT7kO1eG0oNzWmeML1zCwUXK7X6z3ECN6K9Uwh9vRa
	jkQ3zIyKjJbq9fGnepae5KW2vAQADqrt47lKsOL+oO3JRTqL33o6tUIpKlQrwSV4NYH+CTQcfIA
	3wQ==
X-Received: from pfbb5.prod.google.com ([2002:a05:6a00:ac85:b0:835:3df8:d72])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:421a:b0:838:af72:fb44
 with SMTP id d2e1a72fcca58-8415f0f16ddmr15589020b3a.2.1779734640045; Mon, 25
 May 2026 11:44:00 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:46 +0000
In-Reply-To: <20260525184347.4059549-1-praan@google.com>
Mime-Version: 1.0
References: <20260525184347.4059549-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-5-praan@google.com>
Subject: [PATCH v4 4/5] iommu/vt-d: Fail probe on ATS configuration failure
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
X-CRM114-CacheID: sfid-20260525_114401_561739_030F09A2 
X-CRM114-Status: GOOD (  14.65  )
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
2.54.0.746.g67dd491aae-goog


