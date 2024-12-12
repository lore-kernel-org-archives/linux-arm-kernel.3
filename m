Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3545E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmBCnVYtGke08HK2kECtnnkNQ3abN9ao4VlCDDt7BzU=; b=zLPH0X0Sd0IuRRKDIoIC9f3NEg
	iL0Oim85TzC8Wsqo2St3kgRAITtDG4tDurUpeobRqvXNtVMmZxjuBAFrGJczhY7VQRsmhNvfjtNik
	LVeWJOdK5Q9zJY02QuJ+wYKY9OIleFIdRCLYTExM1Xbmxc7tkRb0EiFClEvCP5oyVXVnTWAVrdsD8
	FIjwEkbLWE885gHBy0u/v/h1z2uG/y//OZWxBhIc9u9FBrrUkR6R4yGp3PFw0tLqcZqPTWRmDvit0
	xkqM0cxEQXzIQHhAlQqvnHQjlPtc/xR0PKzrhRz2iJEjf50TzRiRU5dRetYJXmHfIaVAt2CuwtsOu
	fQcLW8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoDL-00000001UC8-1Gyx;
	Thu, 12 Dec 2024 18:47:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZc-00000001JyD-42M0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361d4e8359so7198125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026763; x=1734631563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmBCnVYtGke08HK2kECtnnkNQ3abN9ao4VlCDDt7BzU=;
        b=bCU8Lze6rkZt9ys/FObJNCEJnUzoDcDYVFf+MqjEzAucj6gZBSegbUfvcUkhOnjEDz
         zT1+eFZoMCK2jCXkftkjkiy9HbeUULnk/ay4vliYbMqlMKSOdcaVnPpIvsN/tVaIXVTz
         Gvbz6twOFCMWrVa7NLu/ATVbXn5Zez7CrQVXj91dnvsYrV0pYxblrdW/CNcKS4MCzGjs
         0eTfSrYFWIqQmBvjcVKAMS1s0WYMCQWcuoEeiGDA220QLr862t4f4YMBFoXiyoSuOgpX
         idGooePDzR6NF8wMCVmz0nkLHzxqgmGB0RmJU0g62kzVmEaMpT2nELzJjpEjGYxwIwr6
         6H3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026763; x=1734631563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmBCnVYtGke08HK2kECtnnkNQ3abN9ao4VlCDDt7BzU=;
        b=BvpwhiuE4e2/qcLaqgF8FLUnwbpf2Iutl6TEpPNv8EMzMOeMyQ4FhV64OPps1V+XT1
         OjFo6FBPhMYI78kVT18mpqxP6mPD15gaqjBFI0cTdn9d6Rf8tTPXI37C8zleFARbcNyZ
         WMuXglCWm8s1l1bmbB/XhfT9dwQgIqHDdAoLWAtkmwt7SuOLMM4qJPLw+vV9OeUL38Ut
         PqBnYaOw96PtZsA+kGnLeOCETVJHMsP8KokuonzbqLEfStiza2x26ECJq/voKnBuesbm
         yF9PCckrZgj4aIZF3QNO/2PZ4wBsJSUCN/tVBneaJS++ck7VPHrDOwZ9ujXBzwzBbPQN
         FpXA==
X-Forwarded-Encrypted: i=1; AJvYcCXncLdWMsYr6bg6XBaXBBgFv4wTpXYzKYxdQHiq0OPWXT/BMXeXIX+kvq1uosckzizMLxwr4hkrwQ5Cg3FUYBhm@lists.infradead.org
X-Gm-Message-State: AOJu0YxecoI+3u/f/sRptoogUpu1kcUXBRAmSK9itiwIJclRC+eZi/ZJ
	PHvNsaU7bteTVTrntw7ysgW2BqtgmH1T1DRcKeFSkbP6n6krnPvuC4NrAq4uwQ1useThra00yMO
	xXS13Tlgowg==
X-Google-Smtp-Source: AGHT+IEPQay9Y8CPc4NCAf9wmXyxCMeYXXSRQnwHxxS/TYx9u0H9ZZe4g9YLXll0aeY364hkPCkt35VntGEZQg==
X-Received: from wmma26.prod.google.com ([2002:a05:600c:225a:b0:434:f299:5633])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c82:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4362286399fmr35483095e9.20.1734026763212;
 Thu, 12 Dec 2024 10:06:03 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:02 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-39-smostafa@google.com>
Subject: [RFC PATCH v2 38/58] iommu/io-pgtable-arm: Add post table walker callback
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
X-CRM114-CacheID: sfid-20241212_100605_008952_50E38056 
X-CRM114-Status: GOOD (  12.61  )
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

Add a callback for postable, this would be used by pKVM to
cleanup tables next.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm-common.c | 15 ++++++++++++++-
 include/linux/io-pgtable-arm.h        |  2 ++
 include/linux/io-pgtable.h            |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm-common.c b/drivers/iommu/io-pgtable-arm-common.c
index 4fc0b03494e3..076240eaec19 100644
--- a/drivers/iommu/io-pgtable-arm-common.c
+++ b/drivers/iommu/io-pgtable-arm-common.c
@@ -523,6 +523,13 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 	return 0;
 }
 
+static void visit_pgtable_post_table(struct arm_lpae_io_pgtable_walk_data *data,
+				     arm_lpae_iopte *ptep, int lvl)
+{
+	if (data->visit_post_table)
+		data->visit_post_table(data, ptep, lvl);
+}
+
 static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 				 size_t size, struct io_pgtable_walk_common *walker)
 {
@@ -530,6 +537,7 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 	struct io_pgtable_walk_data walk_data = {
 		.data = walker,
 		.visit = visit_pgtable_walk,
+		.visit_post_table = visit_pgtable_post_table,
 		.addr = iova,
 		.end = iova + size,
 	};
@@ -562,7 +570,12 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 	}
 
 	ptep = iopte_deref(pte, data);
-	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
+	ret = __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
+
+	if (walk_data->visit_post_table)
+		walk_data->visit_post_table(data, ptep, lvl);
+
+	return ret;
 }
 
 static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
diff --git a/include/linux/io-pgtable-arm.h b/include/linux/io-pgtable-arm.h
index 9e5878c37d78..c00eb0cb7e43 100644
--- a/include/linux/io-pgtable-arm.h
+++ b/include/linux/io-pgtable-arm.h
@@ -21,6 +21,8 @@ struct io_pgtable_walk_data {
 	struct io_pgtable_walk_common	*data;
 	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
 		     arm_lpae_iopte *ptep, size_t size);
+	void (*visit_post_table)(struct arm_lpae_io_pgtable_walk_data *data,
+				 arm_lpae_iopte *ptep, int lvl);
 	unsigned long			flags;
 	u64				addr;
 	const u64			end;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index da50e17b0177..86226571cdb8 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -193,6 +193,8 @@ struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
 	int level;
 	void *cookie;
+	void (*visit_post_table)(struct arm_lpae_io_pgtable_walk_data *data,
+				 arm_lpae_iopte *ptep, int lvl);
 };
 
 /**
-- 
2.47.0.338.g60cca15819-goog


