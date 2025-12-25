Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F390CE784A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 05:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awLWGoGgdpXkNXwkBZeX3hqOx9uYLiEWuERrTaaxVGg=; b=pwthH+Pu/h32yw
	HaqDPTpYolpV5rr6P7rtk91+61rBXdMxM4Xb2HbtM85PdjHMQMq+Lay2rjizMRJgDUpg6Oa93Cjzq
	OdmkbbOZUN9F+u5pzIrJt02MCgE/sC273iDVIpOHxhIb/Q6KRvUj1NjalCurCPsGunMDzfTwiqc20
	rSMsaq+GlqujAPGTUt3hfRfzQlJyIH+rWHDyoR5+itokUn3/faaqJiIsqTHrQywUJJ6NMcXRtInqu
	ZmCsmztgDp9chkimLtJLm+EYB8hWcoibAx5Zsr8tQTc5QB6sbZ31LPFvXQhuLt2Uzp2FXVPOhvhA9
	6sN7Qp7XBb8r1UD8TKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeAG-0000000069g-3vvt;
	Thu, 25 Dec 2025 05:45:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeA5-0000000068y-1foM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 05:45:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7750406b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 21:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766641520; x=1767246320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awLWGoGgdpXkNXwkBZeX3hqOx9uYLiEWuERrTaaxVGg=;
        b=Ibr6ooHssvut7EdIHMWFh770wN/8N7ASBEQAAmNlI5V6MxUGqwwuwfArfTWQV1pUMe
         ZwJz4wrtXbgcbfpdM6aqDxOrEfZiBNZ0NRHMJXe2ebkILXnvzGjeJujJM5IZqxmDv8aK
         wBu/UyN8HjrZMFnEZfuTaC4X61ChpmBvvT03fDutqJjHwWRZfdTWunfUkgO2FCfKubde
         1a/55T8/iDtfZ43rjybxIE5jhYpo/PuXCv63f0EP5+Klc9xn63jwHqEak62AHDUn6AeX
         NWbbnOZPjamRO/yxQgAuJXMQqhD6dqFQd0TZDNTEF7CV0lcU5weJowdpDjnL/L1PMgfW
         bZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766641520; x=1767246320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awLWGoGgdpXkNXwkBZeX3hqOx9uYLiEWuERrTaaxVGg=;
        b=eO+SDL7/GK9mqwwopeE+MAhZ2BceloSACtqXyRgbVWvsFY7wzrWrf0oFRJ9c7bPsKP
         arX1waQ9Fcel2LrGnzlNTKQcGZwJfjrm+lTtA1ox8EZu1LJFmzjiDD5fAKYF0bAIt6af
         zqw7JylkvSo3Seh1/RfzhQDriEIJ5ssZZUplgQA5F9BOVKMfp8cSfrt33UCNLECZ3G2N
         QMyAiiO9xAItlOyAHzi58epMcwWJvyuwzFOj30ue7Ipc8fOyofy4rK5B0tsJAp5hH7JB
         qPqt4iIq3Zv6QDACARKR/b8Dmt6JMEwDhl2ZPxbtcR6DDBccOxb06QoSO7bnOncc15fC
         jH7A==
X-Forwarded-Encrypted: i=1; AJvYcCV/BGXTpNe4a5VV1TEdPM4mHQpaopVT560vBFVWGJCTTiYvAC9EoonFuBNdlwpqLOEyG4vHuVKf2VRP0wOPmdMl@lists.infradead.org
X-Gm-Message-State: AOJu0YxePz6WlhVNaoAJApkFq8rMlRynLQyiwbFkSkLCbjhEDtOIKFRx
	VA9lrfc9+BWnJZTkwo3WCiFk+gOjC9HZorvH9isJVSJmkFSZF/qzczQy
X-Gm-Gg: AY/fxX6GYiEFdy7h4+nuUgphUFrSPOQ/2Y3SbPi0uZc6s+LLdj+WON7lV12ejja9tbT
	smcBg2Vebgsa1fhwi2ehCRqbG24QylJrWGUgzDFuw7T1sHfmRwlZXjCrO47aZkHtsNcpHezkyVM
	JG2Be9QbEK3dAvxC/3XkUAWPArSPknDrJKDz0sCxbessP4xyPycalXobO3WLKhfWN959MfGRorh
	elswiDMHi2hOgP6UvLQGZiLGNYVsHKhAwyNhkQvJXAbdJf1JTZqC24kfQ9MyZDFKoFflOTaH5hW
	6ONmYkZO6Eetz/9/GBG9JExRA5qJgriXLAMH42D0RfeTGztBbPZ7voTJ7kpObY+54ZzgSIn4qvb
	UVKb5znqMAbabvNSy3dEzN8ww9rhtebXra7r9FwaW3r44fjth41McmPftWFiYy2H23HiwL+K1gh
	yn25NGBPcGykmb
X-Google-Smtp-Source: AGHT+IFjiH0lz0LAVTw+YGN3qXPK1250UhDPFxtbuSuejwFf6Kj2hl7RPgmOjGUptvke7p9I5vERZg==
X-Received: by 2002:a05:6a00:35cf:b0:7fd:f3e9:5a03 with SMTP id d2e1a72fcca58-7ff66f591a2mr17677975b3a.40.1766641519773;
        Wed, 24 Dec 2025 21:45:19 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm18385848b3a.54.2025.12.24.21.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 21:45:19 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: leon@kernel.org
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Thu, 25 Dec 2025 18:45:09 +1300
Message-ID: <20251225054509.39917-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251224085145.GF11869@unreal>
References: <20251224085145.GF11869@unreal>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_214525_931749_7B7B0BE8 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> > >
> >
> > OK. Could you take a look at [1] and see if any further
> > improvements are needed before I send v2?
>
> Everything looks ok, except these renames:
> -                       arch_sync_dma_for_cpu(paddr, sg->length, dir);
> +                       arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);

Thanks!
I'm happy to drop the rename as outlined below-feedback welcome :-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index dd2c8586a725..487fb7c355ed 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -87,6 +87,12 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+static inline void arch_sync_dma_flush(void)
+{
+	dsb(sy);
+}
+#define arch_sync_dma_flush arch_sync_dma_flush
+
 /* Compress a u64 MPIDR value into 32 bits. */
 static inline u64 arch_compact_of_hwid(u64 id)
 {
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..ae1ae0280eef 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 
-	dcache_clean_poc(start, start + size);
+	dcache_clean_poc_nosync(start, start + size);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
@@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	if (dir == DMA_TO_DEVICE)
 		return;
 
-	dcache_inval_poc(start, start + size);
+	dcache_inval_poc_nosync(start, start + size);
 }
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4809204c674c..e7dd8a63b40e 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
 
+#ifndef arch_sync_dma_flush
+static inline void arch_sync_dma_flush(void)
+{
+}
+#endif
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 void arch_sync_dma_for_cpu_all(void);
 #else

