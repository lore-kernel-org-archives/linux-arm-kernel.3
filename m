Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0943D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1IrJKg16n0r0CIEBnXbT8hq0ulnTBn4qAKgmCelXFeU=; b=CT1k+1JtjC/bEb
	XutaJ70gXiAjDsYZexFAJkNdrKBJ0vLAVJ4ShJdlmT76e9nC0N1PYkQeIf6Bmu4ENummaC0vKTz53
	rc3OzY1cC5ASg2k8xJy8OL6hJ1md+vhPYqZ18fxvTf3Xi1DGMaRDAReCU3bi9L3XPH3nvNX/qfepZ
	/wxYnS54CFgkKfeBE407geKHq7OMXqZJmhWxcuk0oa0jn90BciQEjvy8i+z6At3FNRA9UEcdpFPRN
	3XzrPfbsX1nZ3LeAwMheNuOwR/AS6joP5PkEsaMzfOLXWox9aIyv8goX3HhPJOhuPrtXEjP1k7pR1
	U+BKZUbmJeUou0VPWH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUl4-00000009kkA-3bZX;
	Fri, 19 Dec 2025 07:18:40 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUl2-00000009kj8-1zNO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 07:18:37 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1614393e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 23:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766128715; x=1766733515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IrJKg16n0r0CIEBnXbT8hq0ulnTBn4qAKgmCelXFeU=;
        b=E7j6yuLBjvHuZQgsE5Ofm/dbxBTh/EcZWWlJpcOP2RZ5Fsdihy2QeB9/upXNBROTMc
         HfEPJ/dHnvCTbjCDXnK4Lt145tGBHCjNVfCDVylpOLdAk88q8C09Uvfdq5ysjz59WVm1
         rAh/C+14dsExRYxfyvusf+JwOPtBVZxmdcZvc6HRi2omjI0KRJQ+sGAQ2x5h9NRUNQn0
         Lulb/vDqhICNJR7NiTgDhGDJ8sDrtOEatx5I7ESNzByTsZ5yZLf+nUKX1u4KcpTjucD7
         RdLroiwCEJCPCoZ6fXdS7i7Yu/aj4DdTepFLkFMbsGxT7bn9LQh4BZXTfC7aZxD7Yl7u
         NG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766128715; x=1766733515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IrJKg16n0r0CIEBnXbT8hq0ulnTBn4qAKgmCelXFeU=;
        b=ltP47PU8xViwiMMzxRe4JQ12A5FLLCFcKtvxwI3V/hQk4D2xqyELywna479XM5vIO5
         6cxe1/oSEuQxseOp6z0smC/mtRaSU2CCmW2LxK4CpzyKviZV2nX95a+RYBHzwba/hv/j
         0AVGDZDG0UPD3UmQpw4rP3GxsxXLCw7IXRtFK9e+AYR3Wg3e9KALnYFKlE/v6zqSpqHl
         zt4znJKS5auRhltMC1bDA8eHW5qk5ASiReaBXSsYPWbJQ7KNmiroRd+DvVQmUFccU7Fx
         xo2fDlLk/gRaUSX84pOzFn4GHXnpUeb4xvUa2qKsntrA40iGCXnfeR9h2z3xgmzb+D+v
         IzbA==
X-Forwarded-Encrypted: i=1; AJvYcCWMX4JmdKPtJ559QSkP/7tpc96WoUSzxWpMAbP2w6Lxji5r9USitoNaUAAEexu8Fwe46McZISj2nI1R1qKD0S0u@lists.infradead.org
X-Gm-Message-State: AOJu0YzwaL7SUySXCoQC+ooV4KYqRtM4OxVl7Ian4uKecRWSF8Rhlahh
	Wwjp5Woho4ZGzg6PEl5855n/zoGk+XBugBL/KDySQqnMqdS8lEroTlssACxzYQ==
X-Gm-Gg: AY/fxX6N43bsz8d6B33WkQhNeJ3ZjroLn6+tfM10ZYHYDQMu1/s6mJmr4f+HSps/6A2
	LnfgtgITQeDyyI9ZWQsgQDBL8lhRyrNL/hJnO4eU/uHItUfEJND523F99dUoBzZcz0XZZBfufHb
	eYcHPywASYSADz1dTAOghKzFFlVKcD2FyPbJ4OeSLHkGFdFrxjHXTdaWJAVEq9mZMrmoRXUHUXB
	bHSBYXZtVI+TOiVoaYs7cmScWv7hVYLv/4iZrTuCaiQ/xWrgXwS7CSNlGfa38CKbRoY48vxlopo
	XRUJlugtkgW50HBAycWOJm9T+I9+i0En01iV8acNRfF5HOWygXHzptXSwEBXcUlATaYHkDNC5ay
	uRDKruguzh6aVi3xAN6FtriQXMA9G/GnT0Q1tL+5XhZqN3vvPeJYtXv+3E6vcssYQxWtrlSV+vz
	1SUd70ViDOJ6yOGzH2PPunL7jHgxJWEQ==
X-Google-Smtp-Source: AGHT+IEkWsdLvc7hzxOYBMMAqCPp3sEUnqVWT1X9Dvfup3Q7yPR3CDi//lUU3Iv0eyLEQk9EdacVTg==
X-Received: by 2002:a17:902:cccd:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a2cab15ebdmr56821655ad.15.1766122630230;
        Thu, 18 Dec 2025 21:37:10 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:09 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 0/6] dma-mapping: arm64: support batched cache sync
Date: Fri, 19 Dec 2025 13:36:52 +0800
Message-Id: <20251219053658.84978-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_231836_539194_77F7AADE 
X-CRM114-Status: GOOD (  11.15  )
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

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

I also ran this patch set on an RK3588 Rock5B+ board and
observed that millions of DMA sync operations were batched.

diff with RFC:
 * Dropped lots of #ifdef/#else/#endif according to Catalin and Marek,
  thanks!
 * Also add iova link/unlink batches, which is marked as RFC as i lack
   hardware. This is suggested by Marek, thanks!

RFC link:
 https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/

Barry Song (6):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  arm64: Provide arch_sync_dma_ batched helpers
  dma-mapping: Allow batched DMA sync operations if supported by the
    arch
  dma-iommu: Allow DMA sync batching for IOVA link/unlink

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/assembler.h  | 79 +++++++++++++++++++-------
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/mm/cache.S               | 58 +++++++++++++++----
 arch/arm64/mm/dma-mapping.c         | 24 ++++++++
 drivers/iommu/dma-iommu.c           | 12 +++-
 include/linux/dma-map-ops.h         | 22 ++++++++
 kernel/dma/Kconfig                  |  3 +
 kernel/dma/direct.c                 | 28 +++++++---
 kernel/dma/direct.h                 | 86 +++++++++++++++++++++++++----
 10 files changed, 262 insertions(+), 53 deletions(-)

-- 
2.39.3 (Apple Git-146)


