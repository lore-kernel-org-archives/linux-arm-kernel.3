Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C711E8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SwUY+FTc0pZhvaABGOEZvH4DFh2qP62P2nENr8WNe8=; b=GF19jwBvvTAyh3
	wyxmELM+zXLmsic8eRTmIUGCfUliHRZCLOEj0WZ7tnGhh/8JDR8CEfq1TQlzhIH+tygbKTSS+r5AV
	pRrkyB79ba0668CEgIjQ0+8VMpxirIAEpcAzPqAV3ymBt4LaqgqEtWQaGnZpCmiTz2N9RKXuGpVYO
	MlkvYBSmI4uNcPH1tzYiaIx5wa6rTnOEqv6Tnpck7qd+GGmdBAWeIQqgCurn4mZ38J29Wg46JAfWd
	LAOKhwS8vftazkdWYMZOcoJbamA/Zdg8zKjkkMwCctIW+nkU0DHv2eREAVB+7jZsIrkqXpmMI9drl
	JvgmfflNYsVTXwBsl4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGh6-00000001XDu-0UyJ;
	Fri, 26 Dec 2025 22:54:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGh3-00000001XCC-2zIu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:53:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a1388cdac3so70187295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789637; x=1767394437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SwUY+FTc0pZhvaABGOEZvH4DFh2qP62P2nENr8WNe8=;
        b=BJQRKSxU39EqVT4sb1vnaUNL8MYmP8SC9dnO3pFxzpTPLxYvTyWGvsAYxtpqh7I6tY
         Rv+mKICdUyRugDCuh6qWuXNhn4gAmCfTVxV6xOqI9PSFR1PRj24f7OBT7BpM8H4CUkn8
         ACDxORsVpBay+CfO9R/SJE2rezBlqXBs6ZvbUr8vJbw8sS+8JJ/ey93slH7lg8Jn9lsh
         RTw9r0+ip7yseMshmlhW1CwGbZhelzNolPDJzbSwMdpEdKEZtSSTvO4nZ39igwkhysUU
         2AZ9nirYNDKGZK/+7jXOuVzGXMdWPBYy0dB/fwKJXyKggBeztfGEL/LHFbFUIyrPXDCP
         lyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789637; x=1767394437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SwUY+FTc0pZhvaABGOEZvH4DFh2qP62P2nENr8WNe8=;
        b=LRpLg9hkX2dGs8Nl5hWsyf7TCRRieXCMCWVWad9HFKeF/68f9RrZV9LzEfguhQ7Y3R
         EPQPj+KjwX3pmwpaCmoKQzzTpUs3r7OhAL79M/qm5EueYeQTXeFY+FCA9nmlnuW13Nis
         4YYWb9KrvQVe0vty5xDWYh3oWtaE8nhW4k/mEasF4iT5pW3si53tReVhDdC5JBSN8A8/
         JZ0lVoFXKfCEKZelAXBZPZgj8AvYV1n3rC9/h7G+wLikwn9CorBBbNGFckdPyb75RndM
         3jh+KuRYvFs+hg48+MUFi0M5zNd6YEXpG0jrNIeMHCX45bJdhDu0UueDIKckuolTUTml
         Dslw==
X-Forwarded-Encrypted: i=1; AJvYcCVreVGOLbo8Wr+l99GXkJcOK4ao0iS6KPiVaq3WTZC/vP2nEPxiPeA9/9nZ+cg+qgFPI9YlDIkBvLaTyWRJGaj9@lists.infradead.org
X-Gm-Message-State: AOJu0YzdiW7k52b0BlfP12KY2u0fjba5HKm416+vs+h/9gnE2PMk428u
	toAyZ5yF3HWLBCKe6vcFJZ7uoDTL9P3zzLCEtGGytAtrCFqZ7dRvHBgg
X-Gm-Gg: AY/fxX7ClbEiqR/jsD8AW5jIl6rexcoNhb4bTccn5maM4S8/wbqRTRralYz/XlcJPrm
	ZyJCCJ8u/8NRWICXtnLqNtAyB8hZF6+LEtQLKltsaS9vq60o8iniyKw8lS7KkCvT53/YZ5rWhkf
	2QM3VHH24j0YoIHyRaQNRkh897ur+2J7XYW4CzCqtJ13qrmQBdEzbJO9agVITX/upFFz3hOAUcb
	5QGfU+xt03Bey1X1JSRzZLKBgbK783GXsqssPZbx2cKy6yP/kOBHwernwwRhX6wKXJzfUxS3Kd2
	frbw29+tZdPueGE/CjAky8a/RJy0GHOL6yMVCLbpXbcXmFbHjHYZyP2Npl4Vs0aH3GJ2fkrv8Kd
	DgXthlOW9Ez1CETjRc9zV1OkTsfZYWBwnvwNauoUAXq6lcmsoj1ZE/lOIR9KeOagrKa7hSceg+n
	mPcPvUhuWDZYJOQmzNeimBW1c=
X-Google-Smtp-Source: AGHT+IHzo7zg63L6IUIixvYNdgE1EhLj43E4LWUqmZi99iaSKAA/lUr+ts9Nayt1nnGWbam/Z3t7Yw==
X-Received: by 2002:a17:903:1670:b0:2a2:bff6:42f2 with SMTP id d9443c01a7336-2a2f222b664mr247962585ad.6.1766789636697;
        Fri, 26 Dec 2025 14:53:56 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:55 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
Date: Sat, 27 Dec 2025 11:52:45 +1300
Message-ID: <20251226225254.46197-6-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145357_790059_FE8A74C3 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Instead of performing a flush per SG entry, issue all cache
operations first and then flush once. This ultimately benefits
__dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().

Cc: Leon Romanovsky <leon@kernel.org>
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
Signed-off-by: Barry Song <baohua@kernel.org>
---
 kernel/dma/direct.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index a219911c7b90..98bacf562ca1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -402,12 +402,12 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
-		if (!dev_is_dma_coherent(dev)) {
+		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_device(paddr, sg->length,
 					dir);
-			arch_sync_dma_flush();
-		}
 	}
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 }
 #endif
 
@@ -423,10 +423,8 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (!dev_is_dma_coherent(dev)) {
+		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
-			arch_sync_dma_flush();
-		}
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -434,8 +432,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 			arch_dma_mark_clean(paddr, sg->length);
 	}
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
+		arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
+	}
 }
 
 /*
-- 
2.43.0


