Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=; b=2przMDpERWlf6m/t4Nh4rVl1uA
	dWi7b9KPoAfM3WQFhdEmpSzLU9vFOF7SPEi2w/hWJBWXPceb2M1Sr2Z2XGDEcsYeBC7doHqfc0Lyo
	XBvsc7VtMHppu8uHyaf05V3w6I7vJj9zrPKScsqjKCAlqgpfdVfMuuixWBJIhJ30zwwRxHTngzUcl
	z/k3hKqU82YvJTa560t0Nc0SoJuuTlNKv9nZRT26r6BKfvA2ZRPgxQ1aSbj2Luaj8iboCgwY4dFCD
	S63J3zWx4CDla/RlPxLym8v8282lPSWuResq1MGAO/ce2E2uVo6KgbTNQ8Euepqm9m42lOtjuJfV3
	cwJbnu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Wi-0000000CAtb-3INV;
	Tue, 10 Dec 2024 16:56:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Sr-0000000CA3a-2JpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:52:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso3822404b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849520; x=1734454320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
        b=Ynxetn85oc2PWgABwVKwcL4TMN1lnEDYecs3TY8JIlNVqDYcZ1zxjq+MODPe8y+1z0
         suLW1oawWQ0wi24HpCXS0st4vSNJmqh/4eqE3wI5jQRXptlzi56kp7u4A4YdnGQ7uV+a
         FEev8Ig+uZNrM8siMxpt+js2aBzNBHxprxZUGQSe0/Dp6jacYrv/8plG02HqqI8xgQv3
         CXXd0sHYJ55tEXRbFdoxRJN93rBKaHGJ8ZHWL57fai/nQi6R/5KuLrA4mGPn/jTz23UA
         E19975XujrLFIArXy8MP1fejFz1hpnKiXVXQTlNlbEl3UQzsVP2+Lmnp+MtIjzweHoxz
         b1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849520; x=1734454320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
        b=dPgr82Krv/qBo77it1+looFP8+pzDhP8C+Zj0Wkk1uIi9BnM5t9+WPZbsuCwWBAbJT
         /w+sy/ZdcI4+C/aSQit/qq6gFeJmiWaJfMNcFw8kXAFcmMHp+ZsNZuaY/iIk+utr66mQ
         hAI4tA1XGDVXks483AQOdHJbIJIIuSKO0kxQT8yw9STcCAKgcZ6sTWIDOp1ajCMKa/jM
         sU/dQ5goBBJG8izJCBXHlhXMZpmy+TneFpxtFrrlb/C4SiVu94WcvVt+q+1XW+BpC7Ym
         8lf/z0bkxAlGQ/M/MI7yXoqW9u5SpF++SYI7rupwV9527AMExH2SNlNKlxIMNZ27Dao5
         ESmA==
X-Forwarded-Encrypted: i=1; AJvYcCUT8V8wST6bVZcC3mF5rYSII86FiEFayQD6Za0K9HtBXDi2zpxaBkx8h79hdONimbcCsYP7OYgStUYczt+7agQY@lists.infradead.org
X-Gm-Message-State: AOJu0YzkMyCZv3FmlMKwNAdssRR5wsviv3NdBPrkqXp+vViqpUDhIoWw
	P5o7YbpFi3MnKbkhOZrXMw8c0x6ERXzXQgMbj6DtQJnZmpY3FoGd
X-Gm-Gg: ASbGncsv+y9yhrtl/ODAbDBoVS74jZqZ7HCN+KUbCJoTr1uQfZ8bzTRHq10r+Ihgn5P
	dQHVNjVs8CL+qSUZesHJsaiQeqVndnrQFaeWqsDt7TltHHsjyqok5zIIdnd8CtmIj15rvh3xU//
	VkYpi2LdskKOrGXYWCtMcpTMK/NaoYdTV/Ow/HK/qwhZEmae+NXhWvS2d+eOWypUjc4Hma7wH3f
	mowpfy+RGtRpHe2uKDt+IhmlHpTPJIZ4CHgD71+n1XUUbeRVHt5PXJjPDPvrkX1+v1THJWxwf1N
	SehcetXMDW7LKRql6HMQQjwQ49tJE6A=
X-Google-Smtp-Source: AGHT+IH1n6c0fXB/5rusM6KflQSKemThS3VyuHQY8wT9jvY3JVEpZqXFRbfZPqjeknRfEZ0z87Krzw==
X-Received: by 2002:a05:6a00:c89:b0:725:f376:f4ff with SMTP id d2e1a72fcca58-7273cb14556mr7832493b3a.13.1733849520359;
        Tue, 10 Dec 2024 08:52:00 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7261829be9dsm3195343b3a.89.2024.12.10.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue, 10 Dec 2024 08:51:21 -0800
Message-ID: <20241210165127.600817-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085201_592948_1E664425 
X-CRM114-Status: GOOD (  12.85  )
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
 drivers/iommu/io-pgtable-arm.c | 26 ++++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 88b128c77893..c51c48851f9f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
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
@@ -937,6 +962,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
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
2.47.1


