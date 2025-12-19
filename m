Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FF6D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVc7S6MGRFGsCbCRv42PvmwxMMf3ng26LOmJbRXLMRA=; b=26wudIcUxuoEKn
	qDMeItYkLhnI7JbbI8mYo+I1FUxwB3DODtP79fUMT1dSQl9C/+bHCIiGrGiXzBiXktYFb93tv/69z
	z16R6fB/XH9VrifF72MU699bCZH0AsnMOv+t4um1/xdspx09sqw6iBDjMIzYV38gnHVi95ZFqXx0j
	MZDmyYD3uQgeRAezmjWGWWfxXYVfxJDCCHhJ/F1TLatnU6vR2EEbm+3QasimpM0OGnnwR4R7KytK1
	LkQCLDPp/lY6wRlAHvQOYIEwwxwQtvUoqfLyESztwXdtABRHbLWMUhPo+0CaaOrtjNr8u95MmXJO5
	R0sviKXg8Vnvw5pU4DBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBJ-00000009efe-3oDz;
	Fri, 19 Dec 2025 05:37:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBH-00000009eeY-2jP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0d6f647e2so21774305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122655; x=1766727455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVc7S6MGRFGsCbCRv42PvmwxMMf3ng26LOmJbRXLMRA=;
        b=kJI1YkOVLwuakznLxyGk8oFmLtRAQPpNClBu5kLH5d9CqbD9L1RURzteMOISRmptxL
         DyY2PHHvaMdNHfi3Dzf0e6cKPi3rntnxiMoHocwNw/1Gek/nM/oGGcXwMxt4Dw8Iaz3h
         Sepe1K9x3r/AXsVdgNxStMI7RtaDL73EY/rWiJX1mxaiPqv+dLdeGy2VDLUnfbho/O87
         Wa1kPCBMZaXYuLYFsxUh8m2PkcBJHmnDZMGDUFpYZxzIYR/knld00ym3eGCo6AR7iODy
         oLXDhp6wPv5DiQLcApuG0kH5pIDQoeG4LaE/0p3dUw0QSjVDsr1jmU3H0Ko6s+RkdrJS
         Er1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122655; x=1766727455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVc7S6MGRFGsCbCRv42PvmwxMMf3ng26LOmJbRXLMRA=;
        b=cKw01vaNsICFeF5+cHpfh8bYotFzJ6VBx7985WVfdVYknRgY0NEryZytkArsR+Pnsp
         RCJhRICL+duDv4nXe4ubM+n2TRs4pvJuQVtO/pAN0xboqgppB2zlNs2MYYSTGQMcefMD
         XWoJ97eIsWozsyBnu7X9Jw7w7412AvtfMH8SDKhDcL08w570mVGCjJ2y5e0BT5bJORZ0
         aJTQbCMdK+iA+VJzYApVuTYIAJTPg0MgqBxWjKniUyIdM8DoSTp+Y/OFhNk/8yqV6776
         LTsGrkHfh3+OZMM4tdPQ1gNvP9FHUx10cpvY+03RLJ4kI3hhVwqG4UPxYckVzAvbZGFb
         2CXA==
X-Forwarded-Encrypted: i=1; AJvYcCXG76e1o5sYWjTm8LHylsDaJ3fdVmC+hhvF2Hmqa9NgLhqORazNlMQnC7XrpnO1vSkuzOnFJ3Snl1hvsrJTMxwI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn2r4NUknvAVKci0nY/HVhF57dlC4vUI7FSO9ESCOrOEu/feSF
	w6CykPmpv9BEPwW9P/kdGT0L4oYdX+SRt+/jlrCOHo28icACL9W7OQAp
X-Gm-Gg: AY/fxX5vsapvxtT3drUAR1+4U0CTRxqq+It+LN9fy97VaKRy1kNqxsU7tkwCTmKgCsR
	J/grgDi8n569jI1S2fZQMDlF1KKm5M4i36HhlzA8v0+KibeXU4s/u7N5cKW3pgnZ5e0LnybZzYf
	RapreoI7KUuR5FSgxjNW4+tP/WUh5/8BlsNz8sL5vBZeWCL1acbOLFNtuMPkIfX5dqBwbO+sCut
	NlYpNtEdnwx4lkWfPWsh6hwbBWlNQmHC/AdEsYQF6PsO/i3m3dibu/Vrba7GaKDEoEyGKVURPsu
	71hnTYcAoTcSCSkZ8gsTOvx/ojt9BnrZC+CPP74Kdhuu8ttR9PxOb98MocMTEZtp9LpRCThCPVt
	090XHV71D05uxvEWYBaI+Ta9JHYmvOeWqvl99EqCMmfnredNJsJBF7fG4YBMCxZaCVt3TvJ7lKE
	ElcKCDXORDfxvc5lBFTsA=
X-Google-Smtp-Source: AGHT+IEgIXUAtoilrAdOFUVheL04wY8Hn1GTTg9fp3Bh9Uns3qP+YxFWsnf+ZhkJ6ZTgBwxYZdARhA==
X-Received: by 2002:a17:903:37d0:b0:295:8da5:c634 with SMTP id d9443c01a7336-2a2f2206b52mr14068935ad.9.1766122654548;
        Thu, 18 Dec 2025 21:37:34 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:34 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 4/6] arm64: Provide arch_sync_dma_ batched helpers
Date: Fri, 19 Dec 2025 13:36:56 +0800
Message-Id: <20251219053658.84978-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213735_692626_9DB02F1D 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

arch_sync_dma_for_device_batch_add() and
arch_sync_dma_for_cpu_batch_add() batch DMA sync operations,
while arch_sync_dma_batch_flush() waits for their completion
as a group.

On architectures that do not support batching,
arch_sync_dma_for_device_batch_add() and
arch_sync_dma_for_cpu_batch_add() fall back to the non-batched
implementations, and arch_sync_dma_batch_flush() is a no-op.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/Kconfig          |  1 +
 arch/arm64/mm/dma-mapping.c | 24 ++++++++++++++++++++++++
 include/linux/dma-map-ops.h | 22 ++++++++++++++++++++++
 kernel/dma/Kconfig          |  3 +++
 4 files changed, 50 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..c8adbf21b7bf 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -112,6 +112,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+	select ARCH_WANT_BATCHED_DMA_SYNC
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..9ac1ddd1bb9c 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -31,6 +31,30 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	dcache_inval_poc(start, start + size);
 }
 
+void arch_sync_dma_for_device_batch_add(phys_addr_t paddr, size_t size,
+			      enum dma_data_direction dir)
+{
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+
+	dcache_clean_poc_nosync(start, start + size);
+}
+
+void arch_sync_dma_for_cpu_batch_add(phys_addr_t paddr, size_t size,
+			   enum dma_data_direction dir)
+{
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+
+	if (dir == DMA_TO_DEVICE)
+		return;
+
+	dcache_inval_poc_nosync(start, start + size);
+}
+
+void arch_sync_dma_batch_flush(void)
+{
+	dsb(sy);
+}
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	unsigned long start = (unsigned long)page_address(page);
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4809204c674c..5ee92c410e3c 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -361,6 +361,28 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
 
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+void arch_sync_dma_for_device_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir);
+void arch_sync_dma_for_cpu_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir);
+void arch_sync_dma_batch_flush(void);
+#else
+static inline void arch_sync_dma_for_device_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	arch_sync_dma_for_device(paddr, size, dir);
+}
+static inline void arch_sync_dma_for_cpu_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	arch_sync_dma_for_cpu(paddr, size, dir);
+}
+static inline void arch_sync_dma_batch_flush(void)
+{
+}
+#endif
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 void arch_sync_dma_for_cpu_all(void);
 #else
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 31cfdb6b4bc3..2785099b2fa0 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -78,6 +78,9 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
+config ARCH_WANT_BATCHED_DMA_SYNC
+	bool
+
 #
 # Select this option if the architecture assumes DMA devices are coherent
 # by default.
-- 
2.39.3 (Apple Git-146)


