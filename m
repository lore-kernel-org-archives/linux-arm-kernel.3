Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97935D74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJO21xU2H+bRt1oLrdkCFshk8QlbaOYxvZtIbsr9n2g=; b=aTyFQaHqr7Ghvg
	eGBY4IlnTWiSVHujLvTw/UsNSwIdrr4hzC/WUAD+DnEgdwjs60MSl9CUUi+UAX3XD3cDGNjrMz8pq
	GrDKgfIjdXDJoFAAPQnrNDNBKI2zJogJn9fuZo16WtkTO6DNIdkFn7R8UdZRKfsXqLVrHISdcTx92
	TXQlJJcMeMW9lJIfgv88z4aySZPyguKzzRssgW1BGcqE079/5bbpWm2Pzj54ZrIU53U1Njjl3f/uZ
	O7WK6lrZSUMjFJBUI2A+M1TGNn2Ke1DyUty3O5RYXxHHdMz2gn7oylowgJP0Q9m8/0OG4znAh15R7
	jyfeIRRh2lVYAMdzXFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBY-00000009enb-07f3;
	Fri, 19 Dec 2025 05:37:52 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBU-00000009elB-1CQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0bb2f093aso14246495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122667; x=1766727467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJO21xU2H+bRt1oLrdkCFshk8QlbaOYxvZtIbsr9n2g=;
        b=My3nx2V1gSS26itEDKbAS4YHS9ZODet5VqRKEsrq00jVaB5mLmh7mIh8AWnfex47wA
         Rbkg676EH+8G998pyoiFlIThl07o1l21GNJgyL80bMsNK4H+ZfsNB1MTazl2ptLY7ODI
         hd7WpTI6CqMiFpGAtx+vIK1qyhnBeTYxdSdPwJLgVEur6ovyK/bjc8U840XSLBzE2Psi
         FHF3b9PV9mi6fQvZwUG2mwGyc2Uk2ixHbErEPefc87z4CxXeUsW13uk5r5qa8WXEcPHz
         MjzBF0qRal9TuJfOn68IGySEEUukJaWtA/XoOPRHvo2sjCJ+eRbB5XJT2BV+HOjMfmBR
         t16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122667; x=1766727467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJO21xU2H+bRt1oLrdkCFshk8QlbaOYxvZtIbsr9n2g=;
        b=IWoDWfWSLLPUDQJ1tvHAU/GqZhm6I8OxO88RJ7AnAXG5IyoubsY1rdcKWkNI7ALqQG
         +OYaMJOh3TrpUrab3IEyl0dpc4y6QRSD7u8zL/H4SCMWkH8109JzgG3AY3TdA5Z+Jc4S
         sG+LzVE6BLfNP6MFQfsMyF87cT84QjQasYtnfAteVklvUFwLbnMKx/M00GeUL8i9ieVw
         IpqF5TZhmsWWQrkbbxCUTFp55x/6rCwkcU91FLajN/4oF5vo2MJ33SeMEktcJLWh/aFK
         +6llf5FIo/djCGqyt1nF5VdaIDRk0gnQ9nVj1P4rhuKimhrMBhu74pyf6FUVFCIeW/Xv
         nT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXITGEZGZpCNwu2CtyZd5z78GPm1Zrp47+qk3KlJg8lTP3Fj+mYrDkPXuaOuScAcrwElqvacozRiNjoerAH37JO@lists.infradead.org
X-Gm-Message-State: AOJu0YyxAlzdFdht+HFtF+wyMt/lsjEYopUzMIgc49apBJNAYC/t5ZTh
	JrJuvAXXZN6rR8dRKOnCaV0I5Y0QzJ6d4dZzwweDis/7/KPwMplnZpMf
X-Gm-Gg: AY/fxX7+QyUSezLl1lLjMYzQcPkQ6UHxQMrNjq2WrM5MDdsHArig86FirbFAEuuQew8
	8a4+ZQaNOIBqBsJlNOLIx3+NXBDr6w3cSsypKPay1sV7XFtA0DNyXm/SgBz4kjHVez75mnKcBMo
	P9ayxvxSyeKnxdxOQeR5K8enFmtLxjOsuGg0Cskupk0OYfv+kcqQSJGley72B7l2+wpATrqJSzH
	MAWifSgP0oY4IAtZw1QPPKEukoEcmSO0NV9igb2KfAyCWAWxB6NKE3uFQFwKVljbKh+1OlgvxKs
	oUVPK6zUsFPGUxv1T+9CJHvFxaSoqG3LtrwXf5Vjt6tIGbfASPGjKf4TuvENN6XKc0cr7JxL0BB
	Cy+qfvokpWbimMcWTOuKgX7KF+T6GZ9pxn7ZHoQzQFsb4kg0jOlnF+B9QUscD1kiKbRauay5XEp
	h+RLBUUHW6VK91wVAI9Xc=
X-Google-Smtp-Source: AGHT+IGDMYqEG2oDqA96bVWjmxK1/Wde940fAntilRs7/x6PwBG31jTbdPi/FUUfggX13zuKgo2NiQ==
X-Received: by 2002:a17:903:230c:b0:29d:a26c:34b6 with SMTP id d9443c01a7336-2a2f293d4f7mr14844825ad.50.1766122667279;
        Thu, 18 Dec 2025 21:37:47 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:46 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH RFC 6/6] dma-iommu: Allow DMA sync batching for IOVA link/unlink
Date: Fri, 19 Dec 2025 13:36:58 +0800
Message-Id: <20251219053658.84978-7-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213748_353239_DC3AAEF9 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

Apply batched DMA synchronization to __dma_iova_link() and
iommu_dma_iova_unlink_range_slow(). For multiple
sync_dma_for_device() and sync_dma_for_cpu() calls, we only
need to wait once for the completion of all sync operations,
rather than waiting for each one individually.

I do not have the hardware to test this, so it is marked as
RFC. I would greatly appreciate it if someone could test it.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 drivers/iommu/dma-iommu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c92088855450..95432bdc364f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1837,7 +1837,7 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
 	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -1980,6 +1980,8 @@ int dma_iova_sync(struct device *dev, struct dma_iova_state *state,
 	dma_addr_t addr = state->addr + offset;
 	size_t iova_start_pad = iova_offset(iovad, addr);
 
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
 	return iommu_sync_map(domain, addr - iova_start_pad,
 		      iova_align(iovad, size + iova_start_pad));
 }
@@ -1993,6 +1995,8 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_start_pad = iova_offset(iovad, addr);
+	bool need_sync_dma = !dev_is_dma_coherent(dev) &&
+			!(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO));
 	dma_addr_t end = addr + size;
 
 	do {
@@ -2007,8 +2011,7 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		len = min_t(size_t,
 			end - addr, iovad->granule - iova_start_pad);
 
-		if (!dev_is_dma_coherent(dev) &&
-		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		if (need_sync_dma)
 			arch_sync_dma_for_cpu(phys, len, dir);
 
 		swiotlb_tbl_unmap_single(dev, phys, len, dir, attrs);
@@ -2016,6 +2019,9 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		addr += len;
 		iova_start_pad = 0;
 	} while (addr < end);
+
+	if (need_sync_dma)
+		arch_sync_dma_batch_flush();
 }
 
 static void __iommu_dma_iova_unlink(struct device *dev,
-- 
2.39.3 (Apple Git-146)


