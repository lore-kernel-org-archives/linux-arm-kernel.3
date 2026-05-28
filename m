Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F7CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=; b=10HpCRk5cw/GIcAJrLEl3U6L4O
	RsPBkQG90WFbuWvpJWGaS/WS+Ep/JOdZIjOTtF5IyhY3aIqGZSSwwy4lxP+tlx5PofxtbqyC5XbBE
	+VXlYboZTpNsANaW//OQhsQrUZ4hRVliOUAjwU3LJrSHPCb8RnvsORBdMVdZ/6xpoCwRjFiDvFnRb
	Bt5jzPg1Q9LKKUt8TQWDLqptDJ+no3meYnQwaRh8Dm8X4chkpyTj49m0uwyl0qGL3xG/Wt/yVqnui
	/U9ic2ZbMC6Agan8CKDHFTxPkMeL6IBO8ffyxhd4r3SIncicApTB1j7HQ+C7EksK8G+HeGJynNe6c
	w48x4J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH7-00000006Kzx-38Zg;
	Thu, 28 May 2026 20:24:17 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH1-00000006KwQ-2bcS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:12 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36603ad6709so11129097a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999850; x=1780604650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=;
        b=eoJAZBxQArYzU8QXPXzSjAWWidLe57DIrAKRFAWZST1Mp4PvcrXeAvB/Cj4mO4QLzL
         fa4eaBXHeD18+suim2qHzh2ZdkuQ7FTAnQ88OSOQN0LGTx1HmirxVpY3m2BaxLvXkQGT
         KB94s3PzCeLCCex8OcNDxqaFVfBqZ83BQUgfekGS2dQFGNe4ixLqATqDm5bpOMaM+y2z
         Q+Q0rU5etsJCFtC9gXxSnESUGPTkZJhdNwkAGKOub3dr24vNQmXUX2V3FjYN5KDTywF6
         rwvSgmARwgVQ4Pi6aj019df33RxoY49eAWtqoNqhSYzaWwKPm+qay4LocXvMcIfpkG2t
         vRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999850; x=1780604650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=;
        b=AfiUHBimnr4Xb9//y/9qim2MZBl575yRfS4Su20nCiNaSsBehrgnNruHgZjlw1RvZY
         3EcxiGbvnDiw/B6DYkQz9+Q8thYJoilfwnARW861T0JvNhZ7SxAsMCe7pnR0DUciQIeh
         F32VUSYewA+0SMwOIm7Hd0BcXe9JIBGbR8EZavz8UoE0q7wy4p5qoEAiaGn4NHR3m7BW
         j6vaqrEceoU9t1AyD/Z3FNQBY7XcNSgaqmbx8sVaXyGcfgx78OhK2NINbU7xTZKXjgSM
         X2lrxfE0bH6jThyoTYekh8TYd3D3kmNPLiImBYYbfl6XaMAJNDFUJJVnlEuIN5umSOMm
         KjbA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rmyq9R3pqzp0SDpz9wXdVcGv5qgyAE3ZDVxaJE7bUq22TKwZb2EjO1N3myQQ7ZHXH+GiH10n0I916i5d4+sJT@lists.infradead.org
X-Gm-Message-State: AOJu0YzbrV9HOUzKK97uVtW4Jg/Q6I3WRJQKpFtY2n27x8afl7K2xG9o
	F7JdxS/TYWM8PjnG1PFYlc+Cn2e3O8iBX/zLQIh7ShHL6Ycc2NfHlZkUFWv3im6XcM6JjZjgVM4
	tfg==
X-Received: from pjbbb14.prod.google.com ([2002:a17:90b:8e:b0:36b:bdb2:1426])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:586b:b0:36b:abe2:bc82
 with SMTP id 98e67ed59e1d1-36bbcc16bb4mr121972a91.1.1779999850016; Thu, 28
 May 2026 13:24:10 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:53 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-8-praan@google.com>
Subject: [PATCH v5 7/7] iommu/amd: Fail probe on ATS configuration failure
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
X-CRM114-CacheID: sfid-20260528_132411_661458_562AB633 
X-CRM114-Status: GOOD (  15.88  )
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

Update the AMD IOMMU driver to handle ATS configuration and enablement
more strictly. Specifically, update the device probe to fail if
pci_prepare_ats() returns an error. This ensures that any ATS-capable
master reaching the attach phase is guaranteed to have a valid config.

Additionally, update pdev_enable_cap_ats() to WARN_ON() if pci_enable_ats
fails. Since earlier checks in the probe phase preclude config-related
failures, any failure during hardware enablement is considered a kernel
bug.

Fix a pre-existing Use-After-Free risk by ensuring iommu_ignore_device()
is called on all probe failures after iommu_init_device().

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/amd/iommu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 84cad43dc188..b74c4504bee3 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -570,10 +570,16 @@ static inline int pdev_enable_cap_ats(struct pci_dev *pdev)
 	if (amd_iommu_iotlb_sup &&
 	    (dev_data->flags & AMD_IOMMU_DEVICE_FLAG_ATS_SUP)) {
 		ret = pci_enable_ats(pdev, PAGE_SHIFT);
-		if (!ret) {
-			dev_data->ats_enabled = 1;
-			dev_data->ats_qdep    = pci_ats_queue_depth(pdev);
-		}
+		/*
+		 * pci_enable_ats() should not fail here because earlier checks
+		 * have already verified support and configuration.
+		 */
+		if (WARN_ON(ret))
+			return ret;
+
+		dev_data->ats_enabled = 1;
+		dev_data->ats_qdep    = pci_ats_queue_depth(pdev);
+		ret = 0;
 	}
 
 	return ret;
@@ -2502,10 +2508,22 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	else
 		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
 
-	if (dev_is_pci(dev))
-		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		if (pci_ats_supported(pdev)) {
+			ret = pci_prepare_ats(pdev, PAGE_SHIFT);
+			if (ret) {
+				iommu_dev = ERR_PTR(ret);
+				goto out_err;
+			}
+		}
+	}
 
 out_err:
+	if (IS_ERR(iommu_dev))
+		iommu_ignore_device(iommu, dev);
+
 	return iommu_dev;
 }
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


