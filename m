Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8919FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3pHMdsibx37YzyzqXGwFL/dQqT2DUhJgZdMFQuT3hs=; b=w7geoAfk5ASfaZWE+GUwZ/QZOR
	O8C5jcZ52vEexEiAdR3BjY1ceCaUpFNCLoNADxraSHMVOaQzl4C182YWQeZqzxqjkrcGZr0ku01fw
	pL27bkWXT1F8274hPjI/VERZAMuL97V9drGijdXl2PFFLr4bR6UfTWse9i1biPftcaJS6+BhnK1h9
	WWGL/WM6H1oZpFKY9oYPEOn/ybN+nc5OQEGLdU5qu2bLiweuAsby+nvwH/o457vQxoh2r9jLY0On/
	FyD+xgnA7ptKmGp2nuv9L7KB39U3jfkcO9tnZSIs63DD236x4e/YIQtZHL4ZmeloEQk2f4Ra3JW5a
	tdFWvbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyQ5-0000000EidJ-1MBQ;
	Wed, 15 Jul 2026 12:08:57 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPz-0000000EiYW-3z0H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ceae1ed204so24852975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117331; x=1784722131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3pHMdsibx37YzyzqXGwFL/dQqT2DUhJgZdMFQuT3hs=;
        b=bqtVBvBXfjFtplpQag0pACkB1OFJsGhUAMuqtZJ2zb6m9vqFA7yTlfb40hphMCcudP
         05D0qxtWBNpycTG2Z+iyJe34Z69vPPBbNXm0vzPyvVqReT/zOQeuGTDNIHpqkGB/dk0C
         TIYbpC5qyRi2EG/4IiwSHcScbiWK+og1deHR9lFBBsxh1oanSIpA9E5oipUIsYzXcU5f
         lZGzOoGVPG8DTjvzg7nunWPV+z9ksxf6/uc/7CyGUdyv741pIM/C8oWdry2l1xAqAtK3
         VkwZHXrSKr+goUv52EhlpvwgonqvaRzLfVD2n47RJVEWZo1dBb9IQNPeZsHe+IyLfiuQ
         lQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117331; x=1784722131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3pHMdsibx37YzyzqXGwFL/dQqT2DUhJgZdMFQuT3hs=;
        b=LamXJFtssD75uJP/PXONIvHzNecN4mM5W2njL/WLZ73u8ED1R19SMtGaHSDYpPrfQc
         3ctjryYa2De5uWQlwWFqFXY87VrrFs1dPZp6LflxYyHxA7moQwTukPaQj+GQFGh1S0NO
         HQaqbsNZ6HRmcCmY19ALBQgaOicL4Y0+A9mNSkN/NeRgtG8HODnykWAtdG2jHShJ097a
         hN/jv45RFDlHGfGaiyHgRl5vzYszAF/iCTkvxXwAxRh0DXDzU8wQk9qXS5alqTX0H/GB
         eOVeURSVcX2BwBtrPEB7WT3c5PuCymk+y1/+wnbY4KmfFOqhHFvDCsBqppGVPWdDWxDC
         kPcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpzn29wLlFGQ8ymehRjEqOn9qx0ceu10Wo/4HXA9bm6RAX3YBjMoBYzX6TwPp8+dlyVYVOOd9Vgq/7Bwgd2CmVy@lists.infradead.org
X-Gm-Message-State: AOJu0YzwTuUo2qlpG92tdlP3bsMwAkl6kf2D+h4x4EgXl4X78cDVKhw2
	/1ovrDa2jcmyxZPkQ5x+Ux4w3Ej7mCUtWgcOe9yzWR6RoaQ5iMOdeMjg
X-Gm-Gg: AfdE7cloDbY8Fza4L7FX6t7jEtFUuu+jW2j1SqXGKT2NphxPmWGhYmEpDRwiVGLYuDl
	asg1A0l02OY0jBBLBwNru4RXbZjouaJ0+SPU9VPcgxgOy0YwkxUT4d9rZ1HpVdlKQgugZ01t2yV
	rWB1Ejt8Ff5U8/mW+OqQPhHkBAg+OqvRIvDIHSQ0ecyZUnrvnKGgMGPdUGm/nIuQSa6oxLAY/u/
	QuVQA0MykhaUBWCzD1NSniRTAOnYcbWJUs6aVM22HuBtR96SSHv5D4oArvEd0qgFwdQm2oOlRFv
	sOODu6cRofvtBiZFpBCbh6UhMWsmcsprHei4lbF16OTm6MoAFXvHC+sHyhnt8+yQUhE8wXLHumK
	AN1vEmgtIGDfZ9CM0K6nTUkWzHSlG0cyjPnvPWnnyEBrITr9v94nYIawfb25Z/z4ffvsFoc7XR1
	XeF135K23m2Bq7eqPgAwObrzr0ooKWO5nTpn+Bpy+WErwiHw==
X-Received: by 2002:a17:902:d2c6:b0:2ca:cb8a:f26b with SMTP id d9443c01a7336-2ce9e5a5774mr161404365ad.10.1784117331030;
        Wed, 15 Jul 2026 05:08:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:50 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 5/7] mm/vmalloc: Extract vm_shift() to consolidate mapping shift selection
Date: Wed, 15 Jul 2026 20:08:11 +0800
Message-Id: <20260715120813.3609949-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050852_005170_61D22368 
X-CRM114-Status: GOOD (  10.60  )
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

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index afc695d5973e8..a1e025120e9df 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3549,6 +3549,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);

+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4047,11 +4055,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */

-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}

--
2.34.1


