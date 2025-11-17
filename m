Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1291CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuXcd6ZXNfZRwCh9su49jDLB1TDteKCX2U/VlZmUj0o=; b=RhZBfKzuJK8aLL
	qcRIYik1DHaLrbFxL7t522dw7h2fmB3+4cFEzVzDtHEJ/Nck/AY+BDOhe1JYfn4OwOhq7c/t7llti
	2IGj2vOC8RLcIVPG63dCyIfVQGbndeBXbtGom2VkQAzn4KD7D59G/xhOKcmN9MHXK59e/Cjh4hIyV
	pFKlxVcRS6zRNiE5vUVN1QJfGqysGkaTnrDLr8md67vwjAdeRLlMqmlrnclh+OXmzcew/4itS/yEu
	sXaj0P4MLECvN+8iI71ncAC4johcemSGm7EHKdXBlWgnY8T2SUmFk+eseeobUB1Y91vCfKOBI5pNP
	zSa2r7W1Kql83ewT1SpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Wp-0000000Grsm-2DHd;
	Mon, 17 Nov 2025 21:12:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Wn-0000000GrsP-0xKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:12:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so3246045b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763413968; x=1764018768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuXcd6ZXNfZRwCh9su49jDLB1TDteKCX2U/VlZmUj0o=;
        b=Uem3mvaTjGxnJOOW7MuxQaRcZvh5Py3J4eoINEw+YJUNmmKfCZyx8S81CG0Oe+ff+v
         0hLpMsmSUrPmzc+Qw9oEX8Mwrfs1q9YFojLcPLclUXIvGg8KxQMrA70nfDXmRmv85tRs
         SB4ZnQsRXhnACkbBpA71GcyH591FW/rAfk0LsuhGmrS3oO6+/g2ineZtwtGFs5RD0jS4
         mPfjcEar5+OvOuECiZqF2FFhx7TkO7PHpTlxPd1f2PYyshSEcMNjPo4kTvvZ2zTIkAis
         Vm7uVUtFFVwyYU7+4dL01XUU/MTTGX8NwN+sGfuRtktgEteZE5NgEo405ivcKDnpJEbD
         seug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763413968; x=1764018768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuXcd6ZXNfZRwCh9su49jDLB1TDteKCX2U/VlZmUj0o=;
        b=V+LlBOe0xRdMzXC7x8HwiOguc4RNjOqkrzly6AZ36P5G6nCl/0vHLUOOS4LO48I+X1
         T+vloUds/AqQ2DkD38pLzICeFqZ4Cbw95FIMNI66TvCoxMCgkNd3iFQUel/nuV3mpTOy
         YQUpuU7npITwMYxJ3LSSIu72dpIqjoFEucy1R5dO3o5sKVzqxHYQpPcBUKTQASrQY+yO
         bDuZBlLNVvXxxfYuy3wgDhJ7wl/n6K/ul27WuW/QT3YSJsIgzoiHItEF/Ww0HB29IZYP
         0DykDpv+2NMttg8P9/dYqF8L7P6YUhnjwOnpIqkuLPFxv6wcg2dSTbKJcPZ+W9pSeZKu
         82yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4zB2A6zgzIWPcwEc0R6DIQHfzFdrnYql8UCHEbUKLJ7g1Ie6NH2QvdUX4xQPZ/LamRvt/QCehOXo7sA291qLf@lists.infradead.org
X-Gm-Message-State: AOJu0YwxYDQbMv+8HW4OrESf4UklMTPD4NC0mdIw8mtIumsomJ/9duOz
	SFdYavkH8FYzZnGj6zhi4x5B1b3lr2FkZyVaWkPA4kZlW7ui8GChn50I
X-Gm-Gg: ASbGnctDVpE3a33U04HuxaTIqnt6I4/tZT/psAbbnPxhg2TASaXQcLu6XPY+TJPiqLB
	zoUHd38aqHzq6OcBnFWMehwO38IIDYo/4Q8YXrVaoVfKiNceMsOspRk6l/xmmVEx+QNiZzeD/2c
	NC/f7FAvNOS1uJL8vNsG1zbtlkMbq0PEC3CLsntGKxT+RJkxsOSIedbrzh7C65PRSVHIDTlmGZl
	tO1z+DyYhHn5GYu9BRHAiMcGXRoBrZ+JvNCXaG7L9uuIs+UvGGzzzOzRFKA2jFZF7qUaYFc6ybK
	MPoYCfcerTF7jjuN82T4hTALjkF66ANZJjrlY+D6+3az/B8Li7ZmaR/bROodhQtox1x2Q4sB66y
	OxUU63eXpowXkiLX/ojv4o6DQ72/7QUByTiz7ZNZoRdYoHah4RKUt/cEs4NRGTneGtKxv7cX4iJ
	uQ1Kgl/UE81jQkx8apYgdxUmHKlSkGnVYB5C4=
X-Google-Smtp-Source: AGHT+IFSEUgsiZktulUmeB8pXWguWvj7s6zr3OozfhUDrxizwYtKAoo18Qyw1X6M+Z13BxEn5inB/Q==
X-Received: by 2002:a05:6a20:7352:b0:34f:ce39:1f42 with SMTP id adf61e73a8af0-35b9f88dec1mr14685872637.8.1763413967976;
        Mon, 17 Nov 2025 13:12:47 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37703a0d9sm12820297a12.31.2025.11.17.13.12.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 13:12:47 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com
Subject: Re: [RFC PATCH 5/5] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Tue, 18 Nov 2025 05:12:38 +0800
Message-Id: <20251117211238.50126-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <aRYhJO9_eR9W-EnZ@arm.com>
References: <aRYhJO9_eR9W-EnZ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_131249_277255_AA4EB835 
X-CRM114-Status: GOOD (  21.03  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, maz@kernel.org, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 14, 2025 at 2:19 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Wed, Oct 29, 2025 at 10:31:15AM +0800, Barry Song wrote:
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 1f9ee9759426..a0b45f84a91f 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -403,9 +403,16 @@ void dma_direct_sync_sg_for_device(struct device *dev,
> >               swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
> >
> >               if (!dev_is_dma_coherent(dev))
> > -                     arch_sync_dma_for_device(paddr, sg->length,
> > -                                     dir);
> > +#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
> > +                     arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);
> > +#else
> > +                     arch_sync_dma_for_device(paddr, sg->length, dir);
> > +#endif
> >       }
> > +#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
> > +     if (!dev_is_dma_coherent(dev))
> > +             arch_sync_dma_batch_flush();
> > +#endif
> >  }
> >  #endif
>
> Just a high-level comment for now. I'm not opposed to the idea of
> batching the DSB barriers, we do this for ptes. However, the way it's


Thanks, Catalin. I agree we need batching, as phones and embedded systems
could use many DMA buffers while some chips lack DMA-coherency.


> implemented in the generic files, with lots of #ifdefs, makes the code
> pretty unreadable.
>
> Can we have something like arch_sync_dma_begin/end() and let the arch
> code handle the barriers as they see fit?


I guess I can refactor it as below and then remove the #ifdef/#else/#endif blocks.

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8fcd0a9c1f39..73bca4d7149d 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -373,6 +373,20 @@ void arch_sync_dma_for_device_batch_add(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_cpu_batch_add(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir);
 void arch_sync_dma_batch_flush(void);
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
 #endif
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index a0b45f84a91f..69b14b0c0501 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -403,16 +403,10 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
 		if (!dev_is_dma_coherent(dev))
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 			arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);
-#else
-			arch_sync_dma_for_device(paddr, sg->length, dir);
-#endif
 	}
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_batch_flush();
-#endif
 }
 #endif
 
@@ -429,11 +423,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
 		if (!dev_is_dma_coherent(dev))
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 			arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
-#else
-			arch_sync_dma_for_cpu(paddr, sg->length, dir);
-#endif
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -443,9 +433,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu_all();
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 		arch_sync_dma_batch_flush();
-#endif
 	}
 }
 
@@ -458,29 +446,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 {
 	struct scatterlist *sg;
 	int i;
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 	bool need_sync = false;
-#endif
 
 	for_each_sg(sgl,  sg, nents, i) {
 		if (sg_dma_is_bus_address(sg)) {
 			sg_dma_unmark_bus_address(sg);
 		} else {
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 			need_sync = true;
 			dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
 					      sg_dma_len(sg), dir, attrs);
-
-#else
-			dma_direct_unmap_phys(dev, sg->dma_address,
-					      sg_dma_len(sg), dir, attrs);
-#endif
 		}
 	}
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 	if (need_sync && !dev_is_dma_coherent(dev))
 		arch_sync_dma_batch_flush();
-#endif
 }
 #endif
 
@@ -490,9 +468,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 	bool need_sync = false;
-#endif
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -504,14 +480,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 			need_sync = true;
 			sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
 					sg->length, dir, attrs);
-#else
-			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
-					sg->length, dir, attrs);
-#endif
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
 				goto out_unmap;
@@ -529,10 +500,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
 	if (need_sync && !dev_is_dma_coherent(dev))
 		arch_sync_dma_batch_flush();
-#endif
 	return nents;
 
 out_unmap:


Thanks
Barry

