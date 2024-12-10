Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BCFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=; b=Ad8QfkxqN38BRHvQ0ihOeHz8EO
	77xAy4k9C1E/f+/7iOVV+q7aWkkEDGpZ2I8VSV1kzrEd19EiBZwwXcj0oyDsTCCiteijV88r3F8x3
	jnn9J/d0OgID50HFH/NG4Qwyi93RAYUAONqatOD3QKOs/A6e6dzL/tEDWgR3TnKpidHcqBHfLOars
	oUANWeeOY4W1bySQl9n041qXXfUXuawIUKD3VzTF6iiqs4V/YSW6TpI4uBqXvDRWxEobhO9q9hsm2
	BaXJV61WltuRbea+O6arPttvWwiyD1fprYZwOxJnTXdNMSu4Inxnl6O/Ujgn3Dsyu+UEAvk1qU0Px
	p08/yeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Ug-0000000CAXG-20b1;
	Tue, 10 Dec 2024 16:53:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Sd-0000000CA0b-36ue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:51:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21145812538so49489955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849506; x=1734454306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
        b=m97IaIt97LYpefsvPeXqTFB50/PMaLleaVoVGHC2xZDybS1fEqFMuBG7dnC1Azv38w
         2AGd0Yc6ajNt+io1bPi8uFdVSJJdkYBf2InnyDOVtHI+AeedDqB78SwInJ0AraJib/No
         w+UcQW30Y0f14Rw69R0Fu20JvOLBHBTq1z6ZBJTgfklKqyR/jmiCq1arPGbHMf/GTHyz
         p8hqJQ6r4tgYiDVfQG4JvH19nThuImAA/LM7F7alEmTLme8R4JYCqoXJPtw7mw0crJ7N
         hvN+mkOvp0rkBEIeHphASHy2K82qI5Qx3zpjRP49NzEX5zwapU3CfRkdUkpW6JQZqgwS
         4mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849506; x=1734454306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
        b=dxIqxAuxA8wKV0EDOtQJMHN0ZW/XIen9tgwDjL7ovAE+3nNL0rkxUv36VzKa9McE0K
         YY/4i94eF52FjdDaBKwsQFBUTKRHXK+9GxES2/WTms5kZqBj5V+Rqzkh/Pc2HvLJ8aKx
         RQfEoCIp6TcVYw2vigQIMsQK+41GbDpG0g/ZJaGRFl0TRNet2JxLUbAEjZJZYkzK3RC1
         YuH5ORAqsJs5yyjgoznqM1T2OWNNhsm0CYiqHtSjUhORU/SRVIDPq8sV/8uSuhO0t+bs
         xW7DCoqYMcOAxNy3BZGDmspJK8ZZWGsmPmFZmS0eoMKE8cvZvawyAmayEYnDOnRaob83
         ZT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyKHiBlB6yRntGNGSJv4aOe3TSIKkqcvmlVl8BiiJnKPkRohoimUJHtF2o82o55tFJ2EWyWCmKw8alZpg7rT2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyXM9lILXtr3mOJtC+qXHFHxBATeN94WyRZlt7jDFMxeQxX+Q6d
	2x3hMTaT3mMElUl8ATSWmfPk0Ll8NfVlrj7F/opTY3a72gvoYNQv
X-Gm-Gg: ASbGncs76w7tkCYArGKcxS+UnBWwJTjfzCAWnxZSlbCO4B/6Zchy357cGyCar/pqg4Y
	A7U6xG+jzvNDR55WH74wlsQFZhraJxctgXMg9CXE+1CYn3Vws6TJee9o+6aPfBtOAUAD5yjBg+X
	jW46ZSLJW1bXYt5r2vtYtLyxtPuC0w3sD2ZSkMt7jdcGC24rVQlFxZnypyYxG0knCIs7F8kxe6N
	s118Mbmfk+qurd30Xrm2qBc9uCd9ckna3l5fUXH44IzfCCgPcy5ERZzlp3y19idl25rCWtNaCN6
	UQwB7gkHiBgqdyKPi+6jM07C1rI2
X-Google-Smtp-Source: AGHT+IGzJ9YtJRIXUx2WRftwh52jZYFp+OAl8TSYa6XERyxw2e0dtG6AQ2EjYin88gd4uM+Xi+ABrA==
X-Received: by 2002:a17:902:e94d:b0:216:7761:cc48 with SMTP id d9443c01a7336-2167761cd20mr46263785ad.40.1733849506543;
        Tue, 10 Dec 2024 08:51:46 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm91889225ad.146.2024.12.10.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
Date: Tue, 10 Dec 2024 08:51:19 -0800
Message-ID: <20241210165127.600817-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085147_780357_7B47184D 
X-CRM114-Status: GOOD (  13.81  )
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

We can re-use this basic pgtable walk logic in a few places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..7e9c0f8ae138 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 }
 
 struct io_pgtable_walk_data {
-	struct iommu_dirty_bitmap	*dirty;
+	struct io_pgtable		*iop;
+	void				*data;
+	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
+		     arm_lpae_iopte *ptep, size_t size);
 	unsigned long			flags;
 	u64				addr;
 	const u64			end;
 };
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl);
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl);
 
-static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
-				  struct io_pgtable_walk_data *walk_data,
-				  arm_lpae_iopte *ptep, int lvl)
+static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
+			    struct io_pgtable_walk_data *walk_data,
+			    arm_lpae_iopte *ptep, int lvl)
 {
 	struct io_pgtable *iop = &data->iop;
 	arm_lpae_iopte pte = READ_ONCE(*ptep);
 
-	if (iopte_leaf(pte, lvl, iop->fmt)) {
-		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	int ret = walk_data->visit(walk_data, lvl, ptep, size);
+	if (ret)
+		return ret;
 
-		if (iopte_writeable_dirty(pte)) {
-			iommu_dirty_bitmap_record(walk_data->dirty,
-						  walk_data->addr, size);
-			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
-				iopte_set_writeable_clean(ptep);
-		}
+	if (iopte_leaf(pte, lvl, iop->fmt)) {
 		walk_data->addr += size;
 		return 0;
 	}
@@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
 		return -EINVAL;
 
 	ptep = iopte_deref(pte, data);
-	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
+	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
 }
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl)
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl)
 {
 	u32 idx;
 	int max_entries, ret;
@@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 
 	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
 	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
-		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
+		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
 		if (ret)
 			return ret;
 	}
@@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 	return 0;
 }
 
+static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
+		       arm_lpae_iopte *ptep, size_t size)
+{
+	struct iommu_dirty_bitmap *dirty = walk_data->data;
+
+	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
+		return 0;
+
+	if (iopte_writeable_dirty(*ptep)) {
+		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+			iopte_set_writeable_clean(ptep);
+	}
+
+	return 0;
+}
+
 static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 					 unsigned long iova, size_t size,
 					 unsigned long flags,
@@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct io_pgtable_walk_data walk_data = {
-		.dirty = dirty,
+		.iop = &data->iop,
+		.data = dirty,
+		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
 		.end = iova + size,
@@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	if (data->iop.fmt != ARM_64_LPAE_S1)
 		return -EINVAL;
 
-	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
+	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
-- 
2.47.1


