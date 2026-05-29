Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC8CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=; b=k23oewXpuE16WtKdiQcRoeSvrz
	oLHeoVYuNpJL1Dv6PV1u7KO1GQletRoKZx/f8HP86Pb7zTJS1DJd9BcB8zqh7cgSw7QXtUHOu/SP8
	GqFpHTMmYq/q2wpQVVNgOw+uXCuzsT6Sm4FWkV5FY4os8VzYrUaLMWc5d5fubUHMKejjnRNlErHEs
	vhVekXvJseU0cM6NDBRQkTePQPT/KVn4QiN8QoPk6S0NjrKfY+Dty5UIw4jdJR7KZhl/C5yuJtWXF
	RGEZRO1o0pjtFaocYxld0T1vIh5bemL8a8N02T6LGAm++Ke6XJF7zpYGur2CPQ0GhQ8P+y48Xiuru
	VPgMS6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8m-00000007FlX-3oXB;
	Fri, 29 May 2026 11:12:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8d-00000007Fft-07O1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:28 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf160f7191so6775165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053146; x=1780657946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=;
        b=ckU/1Sv13E5fPsQcwbe7B4tgzNZjL0txwTpLkjf+NOQ6ZO/vA+h+k9ICx7nCi2x/r2
         3ecLQfA2JWZjE+WAqzJfxsuzVRclykKK/AuvftCjI0U9ewgE7FR4IG30cvtWk6yh06cC
         zBOAEC4mlV/MwEXsqKSWZtvFs0gfG4BX7d4bi+0ij1szE2pl6i+mBm7VEPzz18tf64uq
         FlTt2eBylaB83EC+NSGdVSZtVc+QiJCcd29THHWHEI0WvqpMAzUMHsvTBVRsFljAzHG0
         NnTOXs88BeadtycI6AeTCSYOjccS+frJy4vplRWXG8zqWhQDXZeawFkQK6JdkiUBlgS5
         Uu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053146; x=1780657946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=junrNZ+TOSSnGGCt6IWg1rMtIZuzEOzNu3RMYtfyWkA=;
        b=XxgAyE8h8PPLS1bdoYnjD4RHaRQd7zuE2x6kRkc9KruGpPrVcI9/GefdYh6MLc4LXx
         e9gPnrCJYOLMrmWIc/ih97T87sAAPUIu9ybfte8XHEYpDNSwF9eb3yoHPm9Vvn61f3sB
         BRYkdKbvW8m04xxG4fKl600T5MYrqqioWzyd8jRKgzTno9BEny9xd6oR8fzkAjdwoGZJ
         Dj/k31umycsK+b18cZHifq+C9vdRrQytd1JIz5uEP6QfJkrDYwT2TxIGlbMK5Z9fl7mT
         orcPZUs1NrXve7ozTK+EtOmwhxWVfmelcXGlowWuIlqhMKdlWQgkD2Zh+ZroeqAvFall
         Jdbw==
X-Forwarded-Encrypted: i=1; AFNElJ+mGw4I5GzQwPkVzwAc7G1MOgLsurYeYOwv5PT5bm8PUskeBw1JILTXR5/hEFXpZh07r+ayz8Nz9JC2rBRKQdBx@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ5pRW0JFtESTLdMopn0TeIZUG3kvoW4HDLANcUBSPQ+c7bGul
	xaU4Wopz2baeLJeumr3KCBcyCetlKg227tyuI/OyTB0vQooX/AXkJCjpFSe0OMej0whlCOIwR4V
	ZlA==
X-Received: from plav20.prod.google.com ([2002:a17:902:f0d4:b0:2bf:1a98:5111])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f551:b0:2be:3850:297e
 with SMTP id d9443c01a7336-2bf2098933bmr34166025ad.31.1780053145610; Fri, 29
 May 2026 04:12:25 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:08 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-7-praan@google.com>
Subject: [PATCH v6 6/6] iommu/amd: Fail probe on ATS configuration failure
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
X-CRM114-CacheID: sfid-20260529_041227_062581_2AFC08DF 
X-CRM114-Status: GOOD (  15.81  )
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


