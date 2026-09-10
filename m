Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73334C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RphlSgPaAb08rqh1mbaOb5Pr3zjR/JphX049e0NllI=; b=QAP2DGIK22Ej6uRMFpfiPdl8P6
	tu2z/EmAffRjEPnJI2GeZBhw/HWpETyZa7bPw/YKRZOF2pgYMobcbZ/E0ggQQj7nCHKmrH+zAWWH1
	KVC7jjOchbiZ9JyhqxRDL4fxzfwpAo6G9Iyzr61Gkvlr8xgKWTI00hCSh/MtcZFF4E3BcbRfF8wKa
	oCN5V4PMZADhuKTSoRhNiGTK17Z0jeNVFDauqOKE69n9/gdDe0vbAM+1pUpdEhByVaYzDNJUrct/5
	Ear4bWdRXZfpAzS2g/HoWNSwbW9YV3EavVVAv0hZNSY02qluZCZYJo3ewhJR2sKYiT7/PN4EmtSD9
	B1SNyVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOn-0000000DXZ0-3G98;
	Thu, 10 Sep 2026 06:36:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOi-0000000DXVY-0dOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:36:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so53244775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022194; x=1789626994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RphlSgPaAb08rqh1mbaOb5Pr3zjR/JphX049e0NllI=;
        b=RX5djEvkjIYSWQHekXOsuJ+nxyVrHixjHXDvTJSEnbNxPZLmbWTuY9Bkv8U1/alt74
         M1oPuWZLlS6WnpngazrvzCQkMh/0y2n9XLGqQS6vlWhYRJyPvl1oCMj9ecEYak9fDi7j
         ZKsLHhGVssesn2byHu/6YH7AbfbmmPzCyoAhAECGs/P8TgGGlAy4BGQbXOwlkQiywbh6
         cL8oI97I9KTSFr/wHO8I6RiNwzUDxV6onLRgWCRwPhErla5MWTT47+JthnLByAHWv7AJ
         AVOjQsj2FnkA+LLDOdl+zzF6s401vmh3ZHIXDDW+6L6HuDSDgBBmT94knX8VhCLxhtiw
         g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022194; x=1789626994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RphlSgPaAb08rqh1mbaOb5Pr3zjR/JphX049e0NllI=;
        b=oVrpLy87szhwItpmeJi19f7E2kTUNVAnLL1+foYEpd5wLc+tqhlrD6RDw4JVS/1FQd
         MYoSxhDEtH1C3aDvcsfNNj1Afn5WtQDiV9ZF8iNrXqZoQfcWmj4YPDQwOvbIx9ktFuEr
         StZjhVbvcnHNGLNJNLxnmU5udkUvmRl20kZHPpa6lDb2jbhPVnLGwllg8vFi1mSbwo+L
         /U83Ty0T+N1snHWstr5z86vVl6XFpmX/kiH7yrVWrfT3ZFZhqWQovCQ4sWdnDk1QvDqm
         U789GGNsG98sduRgfWk+c2c9y81O747z5GiYhVih6i6UJTzHXTpUFTotoXdRcn/JDKZH
         E2rA==
X-Forwarded-Encrypted: i=1; AKwUvBwPtZaF5aYMj4hK0BttHblnu+YKJS4FHqjyQAjemo2VnfmFHEJYZPKq60Lw4IxPRmiTn5QAT2D0CSSfJVl6Ip3i@lists.infradead.org
X-Gm-Message-State: AFuF++lyaUvBOwri9NZg5vwKTN6U6Qr5w4dq53iRL+mEKX+DXDUJqXk2
	jRyAhiXQLqgDNleu50cATazk+oXpQmGlvo5yZOeZzQ6MYiHlM5W/cYmX
X-Gm-Gg: AYBFou3w28nhO87+dAzq/b5RsuI/eEH4JngsT1QpyymDehouVdNaBhCeRho5TlM+q2G
	UbQkHaH/YDskW8XqVFBuacpc//RGCN5xLS8TeenVdpYLj71m2/hkpV+YDMvxGr5WLTH8NOmlfK5
	0Aq8VxP2uH0sarjOSSrUvLYzkcMyJt9FNb4zFTH2CxY2lzj3qFBO8DhNbx9FwjbdL1fc4ZEJ3Ov
	5dWrSjkAd+GjgxEV+unw2jd/5t7uk1C5vgNSHQVdUZ9SmkKEix11RbQVGcQSN2E/eg/KOX8FTIr
	b5/Kj0gcS9Ag86BbVIHhBrTPv67wynG7DBi94f6IgdPveHV1OxpN0843/h6zw5o4wvHIbQYKQlt
	tjKKbyq1O53wERH3eEeTR5VofRUsh2pTmClJh4uhbGbMrW9N3+uGeQ8LoFoymMu5CtoMElacx5r
	IpA6wy2jQDotEvIiEhWTDUnfqctDwwphqOq+1ooTHlFNfar8LqD2X0of3RyrBu3XlLv3vi3X7pJ
	4xe+cfFDpsAMJMkn9srIWLRg2SjcrbPwrhFeAD84fVk95mDzmlgo7E7ewCAbAiQVC05J9jPaUWF
	dBaAgnz5SQyjuNoRlxF6s13hLlxcy4wWGPWB5N7fahobF8InRhySWhGk4bvk0CKYZvI/l4lqXnl
	lwAfbahmKRINO0Q4=
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr369870615e9.8.1789022194212;
        Wed, 09 Sep 2026 23:36:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47766655e9.11.2026.09.09.23.36.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:36:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ARM: dma-mapping: preserve DMA_FROM_DEVICE buffer contents
Date: Thu, 10 Sep 2026 08:36:19 +0200
Message-Id: <20260910063620.17768-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910063620.17768-1-kmehltretter@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233637_284820_C1BB1ABA 
X-CRM114-Status: GOOD (  17.35  )
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

The v6, v7 and v7-M cache backends invalidate DMA_FROM_DEVICE buffers
when ownership passes to the device. The common outer-cache path does
the same. On a write-back cache, invalidating a dirty line can discard
CPU-written data. If the device writes only part of the buffer, the
untouched bytes can expose memory contents older than those present at
the handoff.

A mapping-only test on an ARM11 MPCore (ARMv6) system reproduced this
through the v6 path. The existing code lost 402,080 of 409,600
CPU-written bytes over 100 iterations. This change lost none.

Clean the inner and outer cache lines for the buffer at handoff. The
existing completion path still invalidates them before the CPU reads the
buffer. This matches arm64 commit c50f11c6196f ("arm64: mm: Don't
invalidate FROM_DEVICE buffers at start of DMA transfer") and adds no
cache traversal.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20220606152150.GA31568@willie-the-truck
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mm/cache-v6.S          | 2 --
 arch/arm/mm/cache-v7.S          | 2 --
 arch/arm/mm/cache-v7m.S         | 2 --
 arch/arm/mm/dma-mapping-nommu.c | 5 +----
 arch/arm/mm/dma-mapping.c       | 8 +-------
 5 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 5ceea8965ea1..149042bac423 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -283,8 +283,6 @@ SYM_FUNC_END(v6_dma_flush_range)
  */
 SYM_TYPED_FUNC_START(v6_dma_map_area)
 	add	r1, r1, r0
-	teq	r2, #DMA_FROM_DEVICE
-	beq	v6_dma_inv_range
 	b	v6_dma_clean_range
 SYM_FUNC_END(v6_dma_map_area)
 
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 726681fb7d4d..22897f98cc95 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -441,8 +441,6 @@ SYM_FUNC_END(v7_dma_flush_range)
  */
 SYM_TYPED_FUNC_START(v7_dma_map_area)
 	add	r1, r1, r0
-	teq	r2, #DMA_FROM_DEVICE
-	beq	v7_dma_inv_range
 	b	v7_dma_clean_range
 SYM_FUNC_END(v7_dma_map_area)
 
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index 7f9cfad2ea21..3ea5f047f43e 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -432,8 +432,6 @@ SYM_FUNC_END(v7m_dma_flush_range)
  */
 SYM_TYPED_FUNC_START(v7m_dma_map_area)
 	add	r1, r1, r0
-	teq	r2, #DMA_FROM_DEVICE
-	beq	v7m_dma_inv_range
 	b	v7m_dma_clean_range
 SYM_FUNC_END(v7m_dma_map_area)
 
diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index c6a70686507b..a396bbceee73 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -18,10 +18,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	dmac_map_area(__va(paddr), size, dir);
 
-	if (dir == DMA_FROM_DEVICE)
-		outer_inv_range(paddr, paddr + size);
-	else
-		outer_clean_range(paddr, paddr + size);
+	outer_clean_range(paddr, paddr + size);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 7761099dde9e..e2df8b680bd6 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -681,18 +681,12 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	dma_cache_maint_page(paddr, size, dir, dmac_map_area);
 
-	if (dir == DMA_FROM_DEVICE) {
-		outer_inv_range(paddr, paddr + size);
-	} else {
-		outer_clean_range(paddr, paddr + size);
-	}
-	/* FIXME: non-speculating: flush on bidirectional mappings? */
+	outer_clean_range(paddr, paddr + size);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 			   enum dma_data_direction dir)
 {
-	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
-- 
2.53.0

