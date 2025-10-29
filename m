Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F886CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbaG5t0eQSgPX414bWojxTfff0IaUO9MDOrZ/xFSz38=; b=tPGvcAhUgeFx6s
	WUXNxxREeXl7Pp+x/kCX0Vvu+LIGIadivIXZol6uih9czeyf0DCOyc2//iJqfMllgN+mhEh5Fjyaf
	s4zy7jzQh8LbAN4yzPRDvJXbfwKJeidGalvh6/EFvIpM5vx8hnxawqd61nioGSwdb+57Ps7PZ/Tqr
	DQbkn50htjgGoyz5lNp0vKGLokCQXAXPuQ4kxOyzLBDQeYys5MpioNUwh3Q1i6Yv3mXvax0f7L09o
	l98Z9JotIkaMOKW7QejsDklphnt8SvOqDB/gFCjmEtykWdp0fQ36svlnTBr622vPMdgj+55IQak1P
	eUnZK3aDi8qzPPQjEFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvzD-0000000Gz5t-0tqF;
	Wed, 29 Oct 2025 02:32:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvzB-0000000Gz3o-1TK2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:32:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so5179611a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705148; x=1762309948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbaG5t0eQSgPX414bWojxTfff0IaUO9MDOrZ/xFSz38=;
        b=XZbK2og945obzgFENgLMNBnrKGlo2Vb+ZhckP40KwQ+OW9LQZw7XRmgpXeCYQdaJOA
         Tbk5tXA9ntMfl0m4x2+gZjfpZEkVFo2z0L0Su1P92OCsV0QkyBfkDFlD4dvol3cGCFSk
         9kW/Lf0ZbfopizZ6rQm2xiNWx2PRIwurxEDCN8U3nAWE2AJ1IBkZj968wXwSKswZ7Uvm
         yOzDXvWU/VAhUfIx61r4Y8VyER7QjJDxTeXuN2ngqXbU7G+FQfyWCppR1qX7XZGI2+Bz
         n1l3ookKmwJh4UERVM1zkloE8IpZ8CV8ASNTJFsptJHlA/wrXrWAJ+y70UIudU/aXEjO
         5jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705148; x=1762309948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbaG5t0eQSgPX414bWojxTfff0IaUO9MDOrZ/xFSz38=;
        b=r7qBRp+zI8wf0H8PUr3ZM5ajnrk/mEaSPEbirh+Y1UujqfCqaFwIVeqCcC8A5jshJq
         2q8hr3eyupc3UiP22Ni6LZ5I0aEose3OaDcyRS+ngYJyfwRjNIElNBRwLfePyYaF+2E4
         iAQGfKDzr7X3lpbvZ5ITtYa+IPvMSID4kqE4qmHi4B3JOc0vpnTnuqb5qeMYq0dWTRK+
         G0qN8H4GFS3KBxAl7+g4NdmSH+/CzIbEQroDSqkVQaUMwETCkmI/px4ua+lfreAWVAPv
         cqzOAHXaPX65T4snIvwgXVGJQ/QyiSCuw0YbLZHDwPMZDJQ+usAz+k8sipnBQp9LxzUE
         W7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0BtW3IUXAbKEznZSbBFzA6VKyWNozqOFKmoZGnrzNYFiTGnf+pXVR5qPEfqCY+lv3XUcLyEi2l9XiCcYRSAEc@lists.infradead.org
X-Gm-Message-State: AOJu0YzLjh16tcCYqKPf6hrPz88bCdBy+KObRRiutVa24C5u4Emf/y7+
	SbaTvGp/PEhJXwCOAVsLs9AT7K9YHO2rDjxIL6MCy1lvkRo2o8wQL1MP
X-Gm-Gg: ASbGncuE1CwftOb27vBY2l+mPiHplHsTFuh+OLkqlmf2aBqBCkNk1LdMoCYm5/9RQZC
	eQwsc3tGfYiLYJY5TQnFNmQdnqoBRdwL4JiP/Fx1fSXyOENynanooZ1B8i2chsq8ycD5C7G2Sck
	WiuG1jEPy5QvgqoRWHo/q2+sibALie8LjIpf9brvV+UJV9gSLjyrwMeIgaMKSPMibot5/IWiqIO
	meFJP8XUibaIQCU96PNz3hg0JS3cC8cmbqpujNxvde6ChBvkMn3lKbj4JE86q4sjAdEkjtG6tbi
	cxfpjeg4HZGp9esh+SAY7GL45Aot5XhtNrieB6HZGR9OSL0U4AAQsNMDWQo+qbcbJg5giglxcFf
	MRNHsK3z96NWFtwAxxjZ9u/hhgiPOC581aTDdeNIezDLPJ9i6hkJtcflGxlOfximttI0cuwCrv7
	EBlJ+85jOPiUJp5Rq1m0ZPhnxrfT8ihtlfVVRj3YfJZXi/oJgxaSt92ze2Bw==
X-Google-Smtp-Source: AGHT+IHJ74P6d7A+INVwA98f5iJflbVrWJao3lGug3xK3l6qx0+mauB/rdLhpcHFC1X7v1I1yEMgnw==
X-Received: by 2002:a17:90b:4a4b:b0:33b:b0d6:6bc2 with SMTP id 98e67ed59e1d1-3403a2f2219mr1197121a91.30.1761705148273;
        Tue, 28 Oct 2025 19:32:28 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.32.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:32:27 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 4/5] arm64: Provide arch_sync_dma_ batched helpers
Date: Wed, 29 Oct 2025 10:31:14 +0800
Message-Id: <20251029023115.22809-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193229_396256_C11D758E 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

arch_sync_dma_for_device_batch_add() and arch_sync_dma_for_cpu_batch_add()
batch the DMA sync operations, and arch_sync_dma_batch_flush() waits for
their completion all together.

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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/Kconfig          |  1 +
 arch/arm64/mm/dma-mapping.c | 24 ++++++++++++++++++++++++
 include/linux/dma-map-ops.h |  8 ++++++++
 kernel/dma/Kconfig          |  3 +++
 4 files changed, 36 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..1ecf8a1c2458 100644
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
index 10882d00cb17..8fcd0a9c1f39 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -367,6 +367,14 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
 
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+void arch_sync_dma_for_device_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir);
+void arch_sync_dma_for_cpu_batch_add(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir);
+void arch_sync_dma_batch_flush(void);
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


