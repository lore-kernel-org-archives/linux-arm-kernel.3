Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57520C369D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt46wyX3vInf9nEJO3STUSubJKhNa7Mq0IAjgmyGm+I=; b=t1LlQGPDtinNC9IXKDfLlCXnfe
	HEDr1ziLlJoeq701xaed+MmvHmk5c9dN6Xghs0x2E5yzXggkcdgIWt4YFKWGcretEzY0y8w7n/JBh
	GCYVu9uCPdhHJk3LK5OheyEDKnnNmOpJHSmEDQgtM6fuSp2UHBgP+LD5NF8SEc5zYv/NEWDPWRM00
	T+ENtfVW8lJlNf1Au7oUFuqCwsFRUgnG7y2yZ0QqdFFtrmkZpFng5nblWZz+dME0TVYKQ23g6RR8l
	eAXz6KBtBORUxvDT6VP20X7O6l5eQknMEoOU7jU+L+XTYKQubZTzOzGs9XW3963NteUHpRhzG+i7T
	GNq1yZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdT-0000000FXov-1jyD;
	Fri, 18 Apr 2025 07:59:43 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gCg-0000000FTsD-2aYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:32:04 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025041807315844f55178873c0f1d54
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 18 Apr 2025 09:31:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nt46wyX3vInf9nEJO3STUSubJKhNa7Mq0IAjgmyGm+I=;
 b=ew0/N7SV8ocpPGEhZTz/xQ+DyeZbuMX14POxCPjdsGVFWNSMS5S1mPfkMH7o7gJKLlwyY/
 pCvAEvD3KsHwOU59DVCIcMKh169q3voszK33WG4F50eYslAn71Ysc+19mNiaTuYCLlHgaeNT
 1JF3popdz30s9xnL7PFitb8uNE3CUTgUBY9DOa9pX0eSzAa3jZpbaqDfPJUdiwUzedHiqz2U
 a5RdyNEKx/yvTrDixV27oUAiLeXHaMxOxg+KMqW55TVYD4A8jNV8nu5FuJug6KIPfH86NzUI
 xVBSPIHs2Xj34+25AhFfWpvYf21V4Kue+T/64+g/fCusrFI+EvBvOWMg==;
From: huaqian.li@siemens.com
To: helgaas@kernel.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com,
	iommu@lists.linux.dev
Subject: [PATCH v7 8/8] swiotlb: Make IO_TLB_SEGSIZE configurable
Date: Fri, 18 Apr 2025 15:30:26 +0800
Message-Id: <20250418073026.2418728-9-huaqian.li@siemens.com>
In-Reply-To: <20250418073026.2418728-1-huaqian.li@siemens.com>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_003202_798238_1D67F8FE 
X-CRM114-Status: GOOD (  10.87  )
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

From: Li Hua Qian <huaqian.li@siemens.com>

In some applications, the default value of 128 is not sufficient for
memory allocation and can cause runtime errors. This change makes
IO_TLB_SEGSIZE configurable, allowing it to be increased if needed.

Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 include/linux/swiotlb.h | 2 +-
 kernel/dma/Kconfig      | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3dae0f592063..145c71f8329d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -23,7 +23,7 @@ struct scatterlist;
  * must be a power of 2.  What is the appropriate value ?
  * The complexity of {map,unmap}_single is linearly dependent on this value.
  */
-#define IO_TLB_SEGSIZE	128
+#define IO_TLB_SEGSIZE CONFIG_SWIOTLB_SEGSIZE
 
 /*
  * log of the size of each IO TLB slab.  The number of slabs is command line
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 31cfdb6b4bc3..38bfa84b96b6 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -102,6 +102,13 @@ config SWIOTLB_DYNAMIC
 
 	  If unsure, say N.
 
+config SWIOTLB_SEGSIZE
+	int "SWIOTLB segment size"
+	default 128
+	help
+	  Set the maximum allowable number of contiguous slabs to map.
+	  Must be a power of 2.
+
 config DMA_BOUNCE_UNALIGNED_KMALLOC
 	bool
 	depends on SWIOTLB
-- 
2.34.1


