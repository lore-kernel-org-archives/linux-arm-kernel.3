Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082CCD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=; b=zEnmk8GlAVX/tVpOHO7VbakXEc
	EY46GUkBLwcYNlcxXZPqVFF7zxmMzHND58UCnOJvVs+bdI2BStZyEtUri+fJanflii3V3CVRRNU+n
	ce/suNCmqOoX+AfgVxBJ0aNezVbp2YMxVbpjVpDrGWKmCubFxzHF6QSYVBwKNGP+0p60BPaxQZlRN
	8jkel40htfIgvkIyJoHU5+muS+DqxlSFMOe+GaSKR3vIXIL6ZSsQZwmJ3O93QEOEidz6m0wczfDhS
	kICy7yzR2Aj8ZLj7XlzdF/N6KX4c1wzL3apet+QsL8g7Gfnq0chryvWI/X6ZSj8XRhwusMODhvbLk
	KH7goKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XtY-0000000CTdg-29Sf;
	Mon, 28 Oct 2024 22:07:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XOc-0000000CM1c-17uG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:35:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-72070d341e5so1610998b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151329; x=1730756129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
        b=E6Q4mwqa1fY3Ua/T+1IF0icbf9/rA1q9bC5PmFA70myWPr9v7vSTIey3wCTMvz1COV
         fnfrk40rM9zPhUHZxihUCDhg6CZ4p+qjHzdqCGfrRuMtSLO1usi9Ew9Qo4kI7z6NcGfr
         XJB7fqCkakm+XwFybfRXlVN/zfh5BePHYmSUbOxmdCKdVW9MHv/ir0rIAfJ9wyRBMAfG
         I94AfYBTjgKvsC1munG2UHO9pzX6WHn+XqjStJTc4uqzoFxqtsrF0HU15/vcuefqPfvW
         F3TkdiuqDrMl+sFV0iLY40WAdn6NodfBZoSsOscuGfxQCv/YUM4EWcnkvHoPEUQzI1li
         VVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151329; x=1730756129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
        b=GD0dlo3G3VvdEZ9M8+KjHPKKlqhUsepnVHKTgQj83xOQiUWPot9T4/rl1D+++Y8JMj
         UTypVHCFmMypOIOWXddYFZsjgtfilKH6iIwaGMH0AYL+Vxtjx5m9lx9Ji3WadS5jqgXk
         o2Xx4dKiEaZNTc5cH+s1t/PNqerAcqvAHchXrsM0sBAOgb+EGFPLUnTEwcqT3sNb/VPA
         Ft9dj6cY6i856yXyTWBfS5V4eLvg/tyqaOc9x3HlmyyoI0GXr0B8cWBo5erP0J0WJZww
         7RG1k0BQ/NmnwUYz+B1OcDC7lc1pU8AKlJ2FiknXPe4+ueeFDHy0Sr95bU9gLzp4j2Bi
         deSA==
X-Forwarded-Encrypted: i=1; AJvYcCUAbpWy/hinUH9mBSm1eeuMzqcRJRIrzrQmFvw0RVQl3eOqpC5SIDxkVVwBNzWjmxwSdRnvEYVXkrQIcivpAr2T@lists.infradead.org
X-Gm-Message-State: AOJu0YwU+G6DIdG5VF18kUILTLALDt75ytG0tx9SeyPkxwfnCLLUJdkG
	fK9Qw4Wdhz8mQa7airy5W4QyuqpHxfECEDDiW+fELyZ+NcNiPwvC
X-Google-Smtp-Source: AGHT+IGJ/vSmxwIqBeNVXBSzAWZP5g2tROL+0Y2wcPzndUVsioqMA6yobuvrQ/JZESgfajh0W3hfHw==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72062f86088mr14718581b3a.6.1730151329086;
        Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e4dasm6207770b3a.25.2024.10.28.14.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:35:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Mon, 28 Oct 2024 14:31:39 -0700
Message-ID: <20241028213146.238941-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213146.238941-1-robdclark@gmail.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143530_333227_518F9814 
X-CRM114-Status: GOOD (  13.38  )
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

From: Rob Clark <robdclark@chromium.org>

Add an io-pgtable method to walk the pgtable returning the raw PTEs that
would be traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 88b128c77893..6739e1fa54ec 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[data->level++] = *ptep;
+	return 0;
+}
+
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 void *wd)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_walk_data walk_data = {
+		.data = wd,
+		.visit = visit_pgtable_walk,
+		.addr = iova,
+		.end = iova + 1,
+	};
+
+	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
+
+	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -937,6 +961,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b1ecfc3cd5bc..d7bfbf351975 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -178,12 +178,26 @@ struct io_pgtable_cfg {
 	};
 };
 
+/**
+ * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
+ *
+ * @ptes:     The recorded PTE values from the walk
+ * @level:    The level of the last PTE
+ *
+ * @level also specifies the last valid index in @ptes
+ */
+struct arm_lpae_io_pgtable_walk_data {
+	u64 ptes[4];
+	int level;
+};
+
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -197,6 +211,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.47.0


