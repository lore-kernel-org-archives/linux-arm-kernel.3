Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207ECCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7UJLNVkpdPww3mteKfmSVmHt+OJdAAQ7hsDxELrWtY=; b=ChAHENl/lCGMHID8maOFVq7ak9
	FgVon1cc/ExuBeAzBsE3sZYUCtROEzawvnq7gHfAXAKO9i4W+2kDyB7Fayc7rGlB8AD3kdvfh0cXT
	DwRNN2LfEtlk0UTV7ZgB9eDUeL/cx0ICyDQG5SwxRHjNackMpNMI5nV76w3QzTMGr/LACL8bpAJ+N
	z0ojhfMHPbRyemEVb3EcaWiNFD4lbPq//tgq+ILwWFZ4eprH6Wss+dmX8oSvqRrHTCKfqCk1Havrx
	bPoW63cMM/NEpWfFE80iD+KBd9pCFWeHNFXMFABRr9wh6hj/lBK0pP90SucQNgMvOAn4ye+80kN7W
	23hQs/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH7-00000006Kza-2Zsc;
	Thu, 28 May 2026 20:24:17 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGz-00000006Kvm-1ZpL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:11 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2babbeff9e4so146141885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999848; x=1780604648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7UJLNVkpdPww3mteKfmSVmHt+OJdAAQ7hsDxELrWtY=;
        b=PG29hZa2gonuEmJ6j5mjxFG/3zYjnjCyubnSMI+ST53OiBsS2Prk/SA3G5uMwXZHfD
         ldQmK1LurphTtN/6UEglCkaUbJOC78QZ2syuVOTdNYY2fQMudTD1mH5xke9IC2f1cLnE
         KmDPIf7Fa+2ofNCTacIfkXAUEAb3xZn7UlNvJikEcz0wO06yEuG2Z9/MrPsiz0aZPk9c
         sewh3JYC0QAXekliohUQ9EnKMjriUsDnylCwk+yejltimUaZeWdlDpsGNkmkVnIYeMw2
         KFiwvRtwCVG7FAqfXd/oEVjRt9VRpN8+/AmoCK6keXb4/WCE0GWbAtD83G4kEw9Ilp06
         OXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999848; x=1780604648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7UJLNVkpdPww3mteKfmSVmHt+OJdAAQ7hsDxELrWtY=;
        b=br6OYueUnfmxnP9jhLwuGQp+UkjsF1XFhQ1sYOYz6T99F+t88BPm3+pOVyrBhFQci4
         4ie2rjCcDvRgEw893oWEkbXEbllfWLduiSztNDnm+uhJtl5VF8d1iU5NXmSN+mqLEWTm
         gNyqh6Pw6osisioFybMAkPk4d+1WjF+Mn8t2mFDXgipNdn0e+qThNZqW2yZ6LySl/iXZ
         k8jIIicDx8hpG3DhPqvnWLcyjv/pKTkvmujjTqXz8wfW784ESucOy9hcrYYykr6iDIop
         Y9cxJiglvq0gMpOzEOLW6sxavsLa+DCMFm8sUATm/Qtm2vxMe9uTvwhHBGh/r7r9gb2/
         oFUg==
X-Forwarded-Encrypted: i=1; AFNElJ8zDnKRHHD3xkZbtZJTQxns8AWAVyFeZjUeTO/1EFM25HzG/4VNNiavkUbQacM9pd3eeDePhPHLDgds4Yili/DT@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaaM34WEPTTb61/0K0hO3ovhSNek+cww0kDQpH3YhFGxk8LV9
	/de7gJoOAzD/RCdaURDRCSGBvA00XpYy7qAn1l8WNFjgTU6TkW/f8oYmE6UvhloUZngnKGFq/2g
	Tgg==
X-Received: from pllh12.prod.google.com ([2002:a17:902:748c:b0:2bf:8c:2de])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fa3:b0:2bc:8e7d:3dce
 with SMTP id d9443c01a7336-2bf1ffee251mr1653365ad.27.1779999847992; Thu, 28
 May 2026 13:24:07 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:52 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-7-praan@google.com>
Subject: [PATCH v5 6/7] iommu/vt-d: Fail probe on ATS configuration failure
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
X-CRM114-CacheID: sfid-20260528_132409_435793_D71D0B1B 
X-CRM114-Status: GOOD (  14.24  )
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
index ed6d3a0203f5..f13da16717fe 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -876,8 +876,14 @@ static void iommu_enable_pci_ats(struct device_domain_info *info)
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
@@ -3292,7 +3298,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 
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


