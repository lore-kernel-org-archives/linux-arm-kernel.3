Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FB7CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejVfo6aDK2IjkhbswQYdZPzC7RHqvBJONF1IKeVRso4=; b=Qdjvs5R7DviezYzvyNgSTzrTMo
	GCLQJhyLqMw2oispzIctJfJB6YrNos7achPjeoXoyquceeOPoWNVHTFO+lj0T6aqiNuMYbbcLg+oZ
	CioEYYnGrlz1zYE7B1TvWOw4iKDco9D2tyOIhLTO2H8xn+FZqZorffAa4hf28FjsxGrZRvA5X4HR3
	/k1z3DtYw7bJgMAcOtPlhL2m5M8KH1pT60Zo6lI7M3zj963uJRIkdRoxeT2a/81xCy10X91LI4jQz
	gngGMJMiwUadQ8/yaO4sBjcDqxeBZZKapdpZ6FCOzIHH2vA29O+Dnx0WmYOJOJ963RkJT4+La9X0d
	jHjyPIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHZ-00000000G2J-3IxH;
	Mon, 25 May 2026 18:44:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHT-00000000Fyi-36AJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:44:04 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ba718173d1so26565545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734642; x=1780339442; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejVfo6aDK2IjkhbswQYdZPzC7RHqvBJONF1IKeVRso4=;
        b=dVsef5DtL/3oxKCiXZeGKyckQKVeaaBIqCcUFBd6m4eXmjjiUpFHKqkc56kH2Z4YLe
         lfkNixGs7D2irMScdBkQeGUIuc1lhrCD9X2XAepxKlu5wJARyt5eKyiM81nFDuCBvf4T
         2rE2UOCo0Z3/5habAXiZTdr1WmTSEghxSwXPl1zG2Op5yn0PVm0YyEwTcYE0QUiaIjz+
         abjemwmi8SGKd7AvY40n6sJjdrVHk86VrbX5gFX5NyRjUyVpG/ZL4A/4wLbmlRXrWPP7
         5duHmlQqJ3mORiiFWbjN3fI5YMJ9XwDyUY2kQJSqldSC7y9/smyle5fIy65M5MRNkZ3X
         gcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734642; x=1780339442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejVfo6aDK2IjkhbswQYdZPzC7RHqvBJONF1IKeVRso4=;
        b=QoI0JzwocERNLZGBYqYRAQD9fy+oQYNhrqlsZo1IeZjJco8EmgmtmSEgTw5+Q0tuSQ
         HNGimvlzxesZm5hWRabnBHANVO9g0qHCEXFEjcV5lGURuajrFvzmlBwrBeMMZT9ViyC1
         M0V4/Jd+qxr+nLS+Itxb37h/7vnIZmQpIqejgP+jD7Kj9hQQ1ubmgLQM/PuTHj4IpyoE
         3A+d1x2npiVONk1iVkbDRwbnZSU0wXQEA8elBWbiVrC6QUjXyc381+565ZHfB9yMVdcB
         09BxFNvemKdjMj8HOpMgCWWC0oIGEzY4wJQbN/fzjTE3WQDhJLLmsd4au0qvjmOkNMth
         5dTQ==
X-Forwarded-Encrypted: i=1; AFNElJ91ri5qnar+rXbjs7JUSvaFGlXt+APAeW8w5VvRtxkQhby70szh3WHrincAq3yDKg26ZOGd5q8qACwaIJghOQJa@lists.infradead.org
X-Gm-Message-State: AOJu0YxwqHq7uwa/1eyOafsUiei7A7ZQ69wx2EqllUQtMpddYCPV+Hv8
	dAnb/pT9qNGBjlIFAg9Qb2r/GA+O/7hl1AvfiDwHSmYF2DHEtVlcC8+KbmlciustYeUXTHII/Cx
	lDw==
X-Received: from plbke6.prod.google.com ([2002:a17:903:3406:b0:2ba:2935:3b4])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e78e:b0:2bc:8359:66f
 with SMTP id d9443c01a7336-2beb06db375mr172687615ad.35.1779734642223; Mon, 25
 May 2026 11:44:02 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:47 +0000
In-Reply-To: <20260525184347.4059549-1-praan@google.com>
Mime-Version: 1.0
References: <20260525184347.4059549-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-6-praan@google.com>
Subject: [PATCH v4 5/5] iommu/amd: Fail probe on ATS configuration failure
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
X-CRM114-CacheID: sfid-20260525_114403_783070_5FC8F53A 
X-CRM114-Status: GOOD (  15.84  )
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

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/amd/iommu.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 84cad43dc188..1dddb08e7b22 100644
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
@@ -2502,8 +2508,17 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
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
 	return iommu_dev;
-- 
2.54.0.746.g67dd491aae-goog


