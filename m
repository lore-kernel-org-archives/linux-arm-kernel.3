Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 06:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pQgPhs+dZcfRNPuJReU9TiVxwha1e01HcHWKyyYl0NE=; b=qOVQ8iEOCsgM+zQwMZwvREWkDt
	CeTwgzgRkLgQejdJvxFgYNLd0rI5qC47MOQqKwArPdn3lWCbsP/5Oms0mswuu7hGCzEJMB98oym+w
	NLZMRCyd8nykR/01yTFQuUGT32vzfvhQYZp+x0jKOvS+H+vhGf8DZ0F9VSBfjktLhq3I2a3LGo/zQ
	lQh6hPAWQj/W2KOQohe+9SXyPrIrBK8EQ+x1oGed6XSZah63+vO2MCidBzVtJnW53AdRYuVkLrew9
	R3ssDJsgq7fgqd9Jsib6pMUgJoGz3bcpnp8SL70vH7fMAEorAKyWRZd2HhTuLo25IXwmRRc50bZCp
	hiUaNT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4MY-00000004F2Q-0hxI;
	Fri, 10 Jul 2026 06:05:26 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4MU-00000004F0g-0ZRq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 06:05:25 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2ce7ac92dfcso5324495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 23:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783663521; x=1784268321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQgPhs+dZcfRNPuJReU9TiVxwha1e01HcHWKyyYl0NE=;
        b=VRgGW+szlAy3DGqKXRPo+KCYgTdX0SAGe4VOcpVIQnGJwa1S/TqFWsDOXm5FvupD87
         Q/v9UtMO4iJGxlH4V2oi8i0HLqBBzLXxOjjXOIUQWkB9CIMV5rNVv709eRmQ5Xos6vuN
         E4AU88swa38D6Kz/rocMOGdMZlXc2DQdqNgc4tFdE1Chq9rTEd3GavVPbbL82F14ayxR
         PNIOQ8ONYtUEYCNu89g4RxFk9vkSL00TGDvHDhIlpRmUDVKi+4Bd9aiklqrpta+URQfe
         wH/B/8fjdxcyQYqwbzFxLLxat2RACElkEku6rTSJeZW4yBEPNcyOer1Ht93saN9FVWPy
         ib0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663521; x=1784268321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQgPhs+dZcfRNPuJReU9TiVxwha1e01HcHWKyyYl0NE=;
        b=qjAGOdJMl44MMQvW/hsltgXHmnxfS5PpXBRPlQxQdcrAXv9w62TVzDBBSmdPYBozyo
         e57ek33o15ez7DO2AUr0t81eFx7GSvD+G0Kzm+ZwV9YQybDj/f0Vxj3noTljvCB0aqV3
         H7lkZwrSXpuDCDaPyghjYlunUW6tFSwANeI/P7c6MbCZNrmztMHK6lmbTOTm9tVMc1rm
         xMsSJMlSDmui8Bk5E8yTXzcQQZlqWw8nmXN2zez6HyqNBLoqg/zCxNXe+8Otz7Lmya0B
         XjTsXg/56IYNkPfRa5Vp8sP0QbmGL4iV+ltKB3YZE8kLJgdf4P2GiEErdrf6gasDkSOz
         MZGw==
X-Forwarded-Encrypted: i=1; AHgh+RqVZftzrhGO7DC+nGb1wTRaNRfkM75CY+dILnt/4BsvVdQngLtI/2AOtg0ngQAm6vcFgQ0goOb8qKSRRgIIwjsl@lists.infradead.org
X-Gm-Message-State: AOJu0YxL6UmiPLcgmabqrkz+QjNOTTWLMnlLK0ZHM+Y6bfROCYhD9xl7
	uu+v6hzOKqfF84cPN4jOlQaeiDIAzALr50/WIZVYactDmcaNru+I3j0U
X-Gm-Gg: AfdE7ckKsk2hZir1IJrrNgICs6ahuhsJpsTq3VXPpVV4X+CC5bNcVEAGKHYnqDxbHuV
	9azqiSPI4i6BnQw0I25tbDypEEviCJBQXFylKR6pmY2lUtwAbKvRxMEPqHKmU0UowpIwDhWAAq/
	9psygjTxCKF+3SEhtHrbFq4Z+CJuQDLNp3T9ABj34RDH9BrtTOYKg0kYyIhsQOkou0UZUBfm/bx
	mwepEgpVnbMbxnnuDKGkJanHNqb+0O0LwfONXXMU1Qwrq99rCw1MfvU1G2YMNhZohUtQ/FUbi6C
	AN2XQwiY0ik8VOa0Ok+mPS8ssTI9UdCnd007FEBcRHAmvZ5YeJuXNZkB45smTOqanMXeR5XD79j
	YmFfZhJLGhvXOFYEhhiDE8xNgovFGYZoDXHXw2tG72BuQsEfoyz7Q7pzgtuUYPzBzpw8eLY7pbf
	xFONPEnJE63wFzzH5rvs2V+2nMFMtSr2H6sr9RAwtAfwdZyuSNIiRzP+8zp9BCjpEO1Q4/2Bo=
X-Received: by 2002:a17:903:1b0f:b0:2c9:c95e:5836 with SMTP id d9443c01a7336-2ccea2a5748mr105552515ad.5.1783663520722;
        Thu, 09 Jul 2026 23:05:20 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:61b7:bd9d:8d64:1bac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb76asm56314635ad.12.2026.07.09.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:05:19 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Date: Fri, 10 Jul 2026 18:05:13 +1200
Message-ID: <20260710060513.863714-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_230522_171618_2F27B57A 
X-CRM114-Status: GOOD (  13.68  )
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

rk_iommu invalidates the IOTLB synchronously in .unmap (via
rk_iommu_zap_iova), so it stays consistent without a deferred .iotlb_sync
and does not advertise IOMMU_CAP_DEFERRED_FLUSH.

It never implemented the optional .flush_iotlb_all op, though, and
iommu_flush_iotlb_all() is a no-op when that op is absent -- so on Rockchip
a driver that owns an rk_iommu domain and calls it to flush the whole
domain's TLB (e.g. before reusing a mapping, without unmapping it) gets
nothing, even though the hardware can do it: rk_iommu already issues
ZAP_CACHE for range shootdowns.

Implement it with that same primitive: ZAP_CACHE every bank of every IOMMU
on the domain, under the runtime-PM + clk guard already used by
rk_iommu_zap_iova().

Found while bringing up an out-of-tree RK3576 NPU (accel/rocket) driver
that flushes before each submit; on Rockchip that flush did nothing.

Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
---
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1202,6 +1202,30 @@
 	return 0;
 }
 
+/* shootdown the entire tlb on all iommus using this domain */
+static void rk_iommu_flush_iotlb_all(struct iommu_domain *domain)
+{
+	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
+	struct list_head *pos;
+	unsigned long flags;
+
+	spin_lock_irqsave(&rk_domain->iommus_lock, flags);
+	list_for_each(pos, &rk_domain->iommus) {
+		struct rk_iommu *iommu = list_entry(pos, struct rk_iommu, node);
+		int ret = pm_runtime_get_if_in_use(iommu->dev);
+
+		if (WARN_ON_ONCE(ret < 0))
+			continue;
+		if (ret) {
+			WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks));
+			rk_iommu_command(iommu, RK_MMU_CMD_ZAP_CACHE);
+			clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+			pm_runtime_put(iommu->dev);
+		}
+	}
+	spin_unlock_irqrestore(&rk_domain->iommus_lock, flags);
+}
+
 static const struct iommu_ops rk_iommu_ops = {
 	.identity_domain = &rk_identity_domain,
 	.domain_alloc_paging = rk_iommu_domain_alloc_paging,
@@ -1214,6 +1245,7 @@
 		.map_pages	= rk_iommu_map,
 		.unmap_pages	= rk_iommu_unmap,
 		.iova_to_phys	= rk_iommu_iova_to_phys,
+		.flush_iotlb_all = rk_iommu_flush_iotlb_all,
 		.free		= rk_iommu_domain_free,
 	}
 };

