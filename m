Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F59E8FDBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beONI3EcXYpecg+Q1bsEm+B77vz1JdIzHQgAsq5N5yU=; b=YF2otvT56Eowru
	VVwp2GsGz9WUp/6J0F7gStqZ26DNV/6RN4t0DXFlsABeVHNd1ZPNlgobY8ftSRwQ8VbvOEx1QMiTQ
	B0GxaWq/I3kFXC1vHX14QODU/0yWDd9YBl+MvMvCfX5Mit80LN3x9uE+FsMv93bfgHgiHLwUEmyps
	CbeA4IK12RsMwe4Ofdodi0uba0MUNXeI2HcIC9ks65QJujm4xIcoxQ+7H051RwZmMj6Vw1DgfIREs
	9g3VDNhI23cSXxuuwSGqqfbuJeIMvgU1100eEGwdcn/QdqcblrvkYpEW57BXq4OPCSSvhopk5W//W
	XYFnOblDffGG6vTba1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhV-00000001XRy-3iFY;
	Fri, 26 Dec 2025 22:54:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhQ-00000001XOo-1Tqv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:54:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso4971682a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789659; x=1767394459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beONI3EcXYpecg+Q1bsEm+B77vz1JdIzHQgAsq5N5yU=;
        b=WdWXL/YaZkfl0LzNfqF/v+LubVJlBK9uwMCEW0oWJRztCxqpc751Q+71n3gs2eJ2/h
         QEUkd2AenOxl/SshZekdgBkfz4kgoJwLf4AlLMtBNL98j0U2oF2bAblvjC9J1tJWQmGY
         KMESdxNBoM+O6ef+5X/FNOOWiLvKxruRvvXhb4sJPgfHvSqfny2RKZNO8t6L6C3KARnN
         9qPDNKBs4Cum7UxAgHT8Wa6vs5YzTugm2SQUuc6yslyKw1sPkSMBM2wkp63kPjim9wh7
         EwewA8IwP8be9J8wH5nY0ek4RFDH8TnbVC4XSQL2XblTw5SdLoYp+Kj8ejs/y23UEQ7q
         DPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789659; x=1767394459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beONI3EcXYpecg+Q1bsEm+B77vz1JdIzHQgAsq5N5yU=;
        b=Sfxoy1ni5wafELMchrO1Pxqw55UGBp3Evxh+UAgp/1O3CA3vu11vfMm4bpkZhR2ZbT
         BtrKF+DdMdN9DD1N9qPUH0JjnF/Hsyqa7Xu06/Ej8u+YIca2agOI53+F4QLshQKIZ24c
         /Hj/mVoG06kCUZCgvHYvhYpP7JOmAOZ1RVt799JbO8xjGFhwQ9Bsnrkf8ue4xBzo0+j/
         gvS/kLDq5hRtnk4AONsyV7hrmFn7Ob8Kpqi0yzd8sNRH21idk0Zl4rIeAsqtadU6m2VD
         lwSjOCvBlhzSz+lueacDefImhDId7DjFq/tPQTmi3ec20V2fM1qzfBJgSDsnpEZls/7F
         vnNA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Oo6dPElwJ9o9NQFDKtkZeQeXbgFsM4Gw82UDpOwF2ZcP/0zHBXqOfbqEGD5p7kgvZeZa7M4G53TdsR6NJQ4I@lists.infradead.org
X-Gm-Message-State: AOJu0YxaqxcZx/0f8WLj7OSal1fKgnM6uih3EMNQA7QGMHcol1eXQFOd
	LUds8PcU5IHuR5qsOn9iPNqovXwiFOViaCgFF6xLCa47QcSp/fGfaj6p
X-Gm-Gg: AY/fxX79tOvWid8243vQg9K26wyaS6CAqXV/wGXRKwUJ60fkibzHfo6yjgzSlh44ef0
	XfOqOngpNjhBuLxU7SkgecGVDbf6Ax7o25PrhHcMXysaQg4RNYAoRDu506eKq3lCqjXeYGuqDle
	i3aOMACdWEg6aHFjc9JXRyKnaXNcVN1RkWyffzcYFvr0bHYxPQngmdUoVrLQ+He7K/gJAhTtbaN
	4xXXbE+RZRtUB14h83l4VRgAEW6gGZbCP0D1o6tDznt/NxNbEM9UfJgoS1DRVik6+1ahNkp97Uw
	KsLjcbkOf3KCMIj4cGI3lzKaw65B7xeldqL0TJq2NlopAA254UngOHkdh8pRjIbAF/YGV2jvyUc
	Q5inTmN+LKTm+ag+a02L4QlaKaRNjBemApZ9es8nOv2Kq6DMb8xq0c7DDaBggD6+30pPEqp+Xh/
	mlIAZFyuRbNoAq
X-Google-Smtp-Source: AGHT+IF3FBOgnhAE+C4yK80l6tVlXmB4Rfi7fJf1frV3RXQh1+Ry7oysljXY9g9IJMnKqHJpP4IhrA==
X-Received: by 2002:a17:90b:2787:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34e91f6398cmr20025228a91.0.1766789659345;
        Fri, 26 Dec 2025 14:54:19 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:54:18 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for iommu_dma_sync_sg_for_{cpu, device}
Date: Sat, 27 Dec 2025 11:52:48 +1300
Message-ID: <20251226225254.46197-9-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145420_433096_7445C44E 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
a single flush operation is needed.

I do not have the hardware to test this, so the patch is marked as
RFC. I would greatly appreciate any testing feedback.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 drivers/iommu/dma-iommu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ffa940bdbbaf..b68dbfcb7846 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
 			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
 						      sg->length, dir);
 	} else if (!dev_is_dma_coherent(dev)) {
-		for_each_sg(sgl, sg, nelems, i) {
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
-			arch_sync_dma_flush();
-		}
+		arch_sync_dma_flush();
 	}
 }
 
@@ -1144,16 +1143,16 @@ void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	int i;
 
-	if (sg_dma_is_swiotlb(sgl))
+	if (sg_dma_is_swiotlb(sgl)) {
 		for_each_sg(sgl, sg, nelems, i)
 			iommu_dma_sync_single_for_device(dev,
 							 sg_dma_address(sg),
 							 sg->length, dir);
-	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i) {
+	} else if (!dev_is_dma_coherent(dev)) {
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
-			arch_sync_dma_flush();
-		}
+		arch_sync_dma_flush();
+	}
 }
 
 static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
-- 
2.43.0


