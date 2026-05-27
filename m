Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C49CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daz08EfrJ4p/ZHyn7R6Z/1LWdy6ghXZSAUnbV6ql+LU=; b=qp8DTUrnYjnmxW4dgZFmyCNHJ+
	3Vl6usLEFw7/r6jz/FQMpqx66nQ1uWqnaKPWfg/B8qJw+C15BSrKqhnze8lnp5t28DmqbraeQvSwE
	2p4OjZOrtEkX7PCHpdwBiQTTzM9Cl977JgsMijw25AYtjB3g8Hbt+A5N/eap836kc2dFeGgAQI56t
	20mPQlTcB3+706g9w8/rLgqt7CiwvC2Y3RjbPtYGUDvEZVs2ybdL34QpnQAJ1wdMoOciWspbSaRaZ
	kyGZKOMpGvxqz+fRkcMkHKmKgZcSIwvZ9PHYHy1jps1rrZ6EL4KPdI8UpJK6ukN8+gOsRN+AIjJAj
	b6qMmDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWd-00000004mka-1YCs;
	Wed, 27 May 2026 22:14:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWJ-00000004mUS-07Gz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:36 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ba718173d1so72587725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920074; x=1780524874; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=daz08EfrJ4p/ZHyn7R6Z/1LWdy6ghXZSAUnbV6ql+LU=;
        b=hX7MG8qM8m2Sn1kcPhS247sOKcI94ruvErso4+/PFikCYqI32BQ7CW3g5M1i3Jm0o/
         MgTQXbt3ZmOBa4j96KTAehrFXNpquiifQSIOD6PjtDJMMUDvEkTBXJyKLBfg0Y+oGHvG
         vl29QPx75tHhpXEOIHyURLKWzVJv8Qtb8HGXvCegPP1lQRQOLxT8Y24yy9f9865BAc64
         joZvb50YBnqER5P8MXLcbRaNmlg5KU9pZJJgRY4ydlz1q2ayr8tzWMYR23ObsYX6j8EO
         I9u4RbqSKYchEpxCFE1Fwqqdg5FRF15hpw3E15/Wyn7qE+H6WvxOo8mU+niC8JgpGrT2
         VTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920074; x=1780524874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=daz08EfrJ4p/ZHyn7R6Z/1LWdy6ghXZSAUnbV6ql+LU=;
        b=D4uTYveTax1StP18UEgUPnDhAvVN51VO3TWaZ0sFb0hUPAEMEAPcLTO5ze1pNfI4cT
         b5rm6wC2iNJZNdxeOPnzepgifkoLLi5ddlOsW+Kpo7FT6QxrRDx5aOmhYYzOg8DqH2LE
         xwUJDo9tCF0BA/jofgdJeiGKeCsRPsmG203GacVp2//ImktKcB5VCQMMZ/fko6lC12lc
         qU/188Brtyg/J/5GkNO9pNnxU/fRCy4wITUusDOltAiGvLIfo9IWh5+tug80pVeNQxZq
         uh7YjOSNI+nAU/uNNstvAuqxqcpe0J0iCpXaupPhjzViUXF0CjtWdHaPHitkq0QWQsvD
         Xyfg==
X-Forwarded-Encrypted: i=1; AFNElJ/ipVS3UVpKpfC9X3Enrv7lrvrNRWmKt4R8sFjgEBb+3UPMreFxZhaLkyktq57ELwbMw5y51WOwO6f3i87mLOHt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6hsSd+89xP7zPXDKoBzWh/r53IHUmszZ2so+fZ99/17GyM6v5
	3SqVwMCXGtTpjk6qwwNZPZgSfbmaBecfTWXGTVfvlxzgyJgb9FwEj/19iY/FbkzfRhwUFIvvGoF
	FKg==
X-Received: from plpe3.prod.google.com ([2002:a17:903:3c23:b0:2bf:106:cced])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a2b:b0:2bd:ef12:14d6
 with SMTP id d9443c01a7336-2beb06cfc33mr275251325ad.34.1779920073336; Wed, 27
 May 2026 15:14:33 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:05 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-10-praan@google.com>
Subject: [PATCH v7 09/11] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151435_066762_CA961574 
X-CRM114-Status: GOOD (  12.51  )
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

Enable PM runtime for SMMUs having a power-domain during smmu probe.
Add a devlink between the clients and SMMU device. The absence of a
power domain effectively disables runtime power management.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6cbb1724b377..34e249656ab4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4240,6 +4240,9 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 		pci_prepare_ats(to_pci_dev(dev), stu);
 	}
 
+	device_link_add(dev, smmu->dev,
+			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+
 	return &smmu->iommu;
 
 err_free_master:
@@ -5592,11 +5595,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable;
 
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
+		pm_runtime_enable(dev);
+	}
+
 	/* And we're up. Go go go! */
 	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
 				     "smmu3.%pa", &ioaddr);
 	if (ret)
-		goto err_disable;
+		goto err_rpm_disable;
 
 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (ret) {
@@ -5608,6 +5618,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 
 err_free_sysfs:
 	iommu_device_sysfs_remove(&smmu->iommu);
+err_rpm_disable:
+	pm_runtime_disable(dev);
 err_disable:
 	arm_smmu_device_disable(smmu);
 err_free_iopf:
-- 
2.54.0.794.g4f17f83d09-goog


