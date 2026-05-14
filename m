Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrNbLANiBcQr27ZSAlrK2cxuCnVeM2v9Np9AjqW/V2E=; b=L6byVb1uMpPREZWXbuWp/n7gID
	VRXVBM8TVjGT+msdlLUJjZNJvXTxpH7BUTSJFP4ECxcy6CJpC2ZsIv55QcffkQjjVC+EKMPe4nAa1
	MRbl5bkKCZc6xaWcE83oGyWd1YlGOpjhQ+HAOK6ZKxGiUy7EcwttCegRbEkuOImw3xsxZAy1CqfZt
	NJsQ4uOaupLqCMO6MOjfsOpcWUT7lQNDVnLkWoz5XLvDm5CFXYQiOhNsOi3M6qifWUvhjAmiU52KB
	0Fs+XHm2TRvEhiIANSFst6jc0RITozsjx9450EDsd04iBFG3y9vEArUlL79xfxR9gPtLiO1f2/Hmm
	3576a9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSa8-000000056Kh-3XbO;
	Thu, 14 May 2026 09:42:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSa1-000000056GC-3c4r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:42:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3283014a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751729; x=1779356529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrNbLANiBcQr27ZSAlrK2cxuCnVeM2v9Np9AjqW/V2E=;
        b=qFIb3Lc0rAYmWMGNhzS5wWAVYO6lDiB/ucyeRGas2IaOImzrlpJ0Z8erakaRBW90Gh
         h1+dLpaXUq573sW/wb2Bc/s/TBI5NN6vXO326XTh8sdEw26GP9rEJPIMpQGr123ekfp5
         3T7Mdw2cgqZzXBKeAF9XTPHNmkD+WvjCnEdr1ltaPg0uKKIBtAW7lotLHm3N/Pjy6BOt
         0vZxzwv9dFDK67+iMPWDxj4dsxxKhN4KolHZBxwqyvKrOzPgbST9zs6zjC8zb4sxJ4Tq
         BSyi9UvjI83dDy3rpL3klGrpDPShplBaBf35/9oLGRkIeTygPHhfaJdFzCAXbiKhnw5K
         wBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751729; x=1779356529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrNbLANiBcQr27ZSAlrK2cxuCnVeM2v9Np9AjqW/V2E=;
        b=XRzcLKzhyiLuBc17OTgYw4g/AzJhfvr3bwlSHJIWv/183+l2NoyY9GT/IXo0Hhw5vo
         /HVLbM29umqiL5vR5489TP+XjNjhnvM9ZC0HDtRjlNi9FmIMeKKPgP5PUDjJ3gGHtD7Y
         xqivXLSvQSnsYYUWsKWMzSq2MLAu3KxWJM8gqVRTAHaMDu/F9kKyWvxMI75KLI5LVgWB
         fIL9rFbx7+tcKxiqSCvQRgqO3s7vPnx3E8E2IYDML13pzpklcmEpb4fBjvpkiPKJbNMJ
         NQhsC/uDQRo2zFUT4yTA6mKcuhPFhAwoAZGZZwwCCSEscfO445cS5x37xlzRavs0mwlA
         LGUg==
X-Forwarded-Encrypted: i=1; AFNElJ/zVsVh+MQczvWjpXuN3IKC52Dtd5PKumCJIwD/wmwOssezRS9sK5X/gMi3HUzlUND/EejMus+tyXztFLSnfbkJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy4+plhRHsJCxKTCqFI0ZZOMRrRHEWl8wgyzVSfRMJrmI9GrJF
	FF9lA53W6wHe/QVT7t/RvqOUPbv/m+t/DKFHn+5ha3X+tUQB4m+iSwMW
X-Gm-Gg: Acq92OG4szkKjJtH2bvEyidl7uRAlVXKSKMH4AFYtccO5NiEVIdVB3i0SIy5ObcrSgf
	N91xHnMBt7Ut69Z2RzZQ/qZg8ekxrwz0fmnq/bCysKiO2tMa8d4oDV1632hLBX4grEMkpsACjLY
	VfO2TA3ae1U6nhMGt3T5p3QQ6ohaH8oZG3x/n7XSMf3sECAFecQytSjet2N6n6zQiiI0bg64GSr
	OhVnchsN+IRo6JAkadBvX7wBuH9d6smVFOq4QIrPsoEpK5HR+aPOnTStdagK7Oj+ihzr469EsPI
	0cx7LnP1ZsbTe4GiN7NjVf2YPAVFPC9/Xcm2orLxmJgA/2rudOsU/ZGTYmue6pxznWPt2lB9Ccu
	2+hBplnk2D2wYH7A2GFuPhNMXBwy500S545zBfFJCMG3cA1cRln1XpRxP1P/43Whk78K2MLO6QT
	P0aSgtddaA2i4kA9rnmxXlEYlF45ZGDjK0xa5CDUA8Zrbsyw==
X-Received: by 2002:a05:6a21:3390:b0:3aa:60e0:b2ed with SMTP id adf61e73a8af0-3afb1009aabmr7737701637.27.1778751728731;
        Thu, 14 May 2026 02:42:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:42:08 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 6/7] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Thu, 14 May 2026 17:41:07 +0800
Message-Id: <20260514094108.2016201-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024212_072158_6A1B63D6 
X-CRM114-Status: GOOD (  13.69  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index c30a7673e..b3389c8f1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3591,6 +3591,35 @@ static int __vmap_huge(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *get_aligned_vm_area(unsigned long size, unsigned long flags)
+{
+	unsigned int shift = (size >= PMD_SIZE) ? PMD_SHIFT :
+				arch_vmap_pte_supported_shift(size);
+	struct vm_struct *vm_area = NULL;
+
+	/*
+	 * Try to allocate an aligned vm_area so contiguous pages can be
+	 * mapped in batches.
+	 */
+	while (1) {
+		unsigned long align = 1UL << shift;
+
+		vm_area = __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				VMALLOC_START, VMALLOC_END,
+				NUMA_NO_NODE, GFP_KERNEL,
+				__builtin_return_address(0));
+		if (vm_area || shift <= PAGE_SHIFT)
+			goto out;
+		if (shift == PMD_SHIFT)
+			shift = arch_vmap_pte_supported_shift(size);
+		else if (shift > PAGE_SHIFT)
+			shift = PAGE_SHIFT;
+	}
+
+out:
+	return vm_area;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3629,7 +3658,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_aligned_vm_area(size, flags);
 	if (!area)
 		return NULL;
 
-- 
2.34.1


