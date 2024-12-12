Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF69E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRlluNjB7B7yhqcQsTcc7WzSgCbMOzbSDkNF00y+zZQ=; b=hWV5XA7UJnv+xkCklF9VucOycJ
	Ugo+0z2yMyNvPjCPWePaueXtHdNgrRDnNWgD9ORAYpDcqn+lh8JbaI4W9mdyG2nqxI5HyO2YI6ax5
	S0aCJLSK+J/oNlM83N79GESg3I+eBX5K+1I3owAxF29CTZqxsFz6m1vs4ZRq7HoJx0gBJpDtixNrQ
	m9fV26spqetcdu9r1zwiezT+NoNgSeHBzdFln3o7XBR5MiQ5tziPuA/tSgX54atFl1PWkw5OZqE+x
	UcqXsvfHdA5E9f2G0Ew3cwuAxuhgm/BtrienOOxqI/6kax0W2VTNEk0Imp11b2uk24RE+K4e5kyui
	pyWIbubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLniw-00000001N5S-2bTE;
	Thu, 12 Dec 2024 18:15:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYe-00000001JbD-19CR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso5504625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026702; x=1734631502; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRlluNjB7B7yhqcQsTcc7WzSgCbMOzbSDkNF00y+zZQ=;
        b=BmfjjpgeO5o9Wq+ubWezNy9QEvLMtMGQurnXXCAyOZAsLd1CDHZyKhQb7CzDKp8Wg8
         KSMBsOSaVbJgtIGp0GzSBobZ0CTiCtB4WYojP9PWqrUKlOkkGwJKoLXMm6kOojuHSdgA
         W0dflxR5bfNxGOTz8wMULnnV6aX1ldxUxgOEu/0iAnOb2moCk5RHYEn28q4rpVlZWfqO
         aRozf9G5YFqNR362PPNpl67DwEN1JztLExAJawq2MGL9ONMSiqagcVdfrZzXU8kaw9RX
         2RjpA1MNNFvbD8L0Ym2/SkTXUzeev0iImdGwJ/zsp62Fx0GxcHP+TFwXlP8ISFf7GZQU
         dAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026702; x=1734631502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRlluNjB7B7yhqcQsTcc7WzSgCbMOzbSDkNF00y+zZQ=;
        b=JZlKBvvugWUfwfSiXmTKGoMYKL1pP91261Vp7J0+J4Vc94UunCClvy2KS3/s8L3Hub
         12RY3TDY0Q1SFrvpiLIjwWzBzkx4w1mQodTXwTwR2to2U2ZPSKO3U3GU7vgmlf5dFxLX
         bFeH2tE/OGR7vRFAMOVFykrBRpVN7PyvdRhloKgBNRvRqcAOMmMOo9EgMkP3msB3Bao3
         lHljXDNhkR5dfhIoSmM2djs6oqeDo0rGw+aKHdGZI6WyQLbEaBrDWPyHthZnJuYJPVz2
         EDldWiOo9HBJEw/v+8haJbOi4oYcwuNCFLrPWHCXS7Tulrlq6pXdeyM2GntL6gMCZqwp
         znXg==
X-Forwarded-Encrypted: i=1; AJvYcCWAvSqkG3sV92wiJDxsVGGgAisGvRMfFwtPQKx0oHZ0biC0XcjEmmC4ws8nyFrmfzOC7zeof/wuT8VMTM46Avv8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9hHcRiAWXUI4J5U1Vr5G+CtW1kC1lCOX/U46l9yssIt7PzkjJ
	gK8EF4qwtG987khqc/2lqLNzYPV5aAGWiwVx7igY66ZX59fzQXucOvE/Sq1ZT1tYozd8+8/y8aF
	quIdIeeTwGQ==
X-Google-Smtp-Source: AGHT+IG8R7L09stXwqH3oYXhWOZy4o2kVZLVIfQiCvS7+nSVYxh7Lqp6AmiQAmgplzW2b5ucEblLkxA9Ex8Hjg==
X-Received: from wmik26.prod.google.com ([2002:a7b:c41a:0:b0:434:f801:bf67])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b94:b0:434:f2bf:1708 with SMTP id 5b1f17b1804b1-4361c34672amr67605075e9.7.1734026702619;
 Thu, 12 Dec 2024 10:05:02 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:33 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-10-smostafa@google.com>
Subject: [RFC PATCH v2 09/58] iommu/arm-smmu-v3: Move IOMMU registration to arm-smmu-v3-common.c
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100504_311434_C3F00DDB 
X-CRM114-Status: GOOD (  14.63  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The KVM driver will need to implement a few IOMMU ops, so move the
helpers to arm-smmu-v3-common.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 27 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 17 ++----------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +++
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
index 04f1e2f1c458..b7bcac51cc7d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
@@ -645,3 +645,30 @@ void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 		       smmu->base + ARM_SMMU_STRTAB_BASE);
 	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
 }
+
+int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
+			    struct iommu_ops *ops, phys_addr_t ioaddr)
+{
+	int ret;
+	struct device *dev = smmu->dev;
+
+	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
+				     "smmu3.%pa", &ioaddr);
+	if (ret)
+		return ret;
+
+	ret = iommu_device_register(&smmu->iommu, ops, dev);
+	if (ret) {
+		dev_err(dev, "Failed to register iommu\n");
+		iommu_device_sysfs_remove(&smmu->iommu);
+		return ret;
+	}
+
+	return 0;
+}
+
+void arm_smmu_unregister_iommu(struct arm_smmu_device *smmu)
+{
+	iommu_device_unregister(&smmu->iommu);
+	iommu_device_sysfs_remove(&smmu->iommu);
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 91f64416900b..bcefa361f3d3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3980,27 +3980,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 
 	/* And we're up. Go go go! */
-	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
-				     "smmu3.%pa", &ioaddr);
-	if (ret)
-		return ret;
-
-	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
-	if (ret) {
-		dev_err(dev, "Failed to register iommu\n");
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ret;
-	}
-
-	return 0;
+	return arm_smmu_register_iommu(smmu, &arm_smmu_ops, ioaddr);
 }
 
 static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
-	iommu_device_unregister(&smmu->iommu);
-	iommu_device_sysfs_remove(&smmu->iommu);
+	arm_smmu_unregister_iommu(smmu);
 	arm_smmu_device_disable(smmu);
 	iopf_queue_free(smmu->evtq.iopf);
 	ida_destroy(&smmu->vmid_map);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 2d658f15973a..63545fdf55f9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -349,6 +349,10 @@ void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 				   dma_addr_t l2ptr_dma);
 void arm_smmu_write_strtab(struct arm_smmu_device *smmu);
 
+int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
+			    struct iommu_ops *ops, phys_addr_t ioaddr);
+void arm_smmu_unregister_iommu(struct arm_smmu_device *smmu);
+
 void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid);
 void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
 				 size_t granule, bool leaf,
-- 
2.47.0.338.g60cca15819-goog


