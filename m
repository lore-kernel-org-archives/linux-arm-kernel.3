Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B7EC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYl1RTu0H7T966MjgfIs9rrG8GCdvOEJmaLrbPw3sSg=; b=Hh/9YWKYDCoY9xiD6cCPEtLGqp
	Gp9m4/Kmg/14C4RdsILThg5DrLQUrR2kl0VKVxXSC00d5Rjf+IcAPlRMHyscJFfYWr4Yvy7ebvJXY
	SW+RPCMmPfXCHR5QXyJ/e2QH+rqLlL1NHg9zWzcqQ8PWJhTW7HUrhfftobsNZYgLv9uSnY6Vh5ZT/
	ZQqTVblYbaf/vEwIyI0f1voeuQbdxb0QFr+csnOAlJDzTyIdrT6v1cLR67XWIB2RL/+sQYKyw7jzM
	aSXfrinkQruzYzvqnv4pXrqGmf5zyYthCUpqTdbi//pMTNxxh5W/4/iUQGBjITDfvEHkBNEl2AzYM
	mzsTPgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C4N-0000000AvB8-24uu;
	Wed, 09 Sep 2026 06:46:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C4L-0000000AvAb-0WI8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:46:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so64503055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936363; x=1789541163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYl1RTu0H7T966MjgfIs9rrG8GCdvOEJmaLrbPw3sSg=;
        b=OxWgq/U7afN/6CwP2brsgpuKvNodB4ZThfT8y0r4ZZSyjFbRkqvdHTPsBoFqHF0SH8
         4NXySqNIXElxdzYDGKel4O2FehlCcvFCT5RkeIDM0Tw8n0KCGkg/V5yju0N0YhRFyqMB
         Jdn6jaHeks0XKPES9DBg9hVaW8pwfEgFNT78gVnZh+FWxrNXje9dD9yv0z93A9yI5fnD
         p7liwFvloKLv8hGZdE16FmE8zVEmF3ZBSRKiyDSqEyoyBdEEZwNx4MzhqDWBpxsyisi3
         w1nd/6FbVpSbasmF0ZUEmSYic9E4Oq0+7bhPfMTP+FgK3bK2+0dfY2pwo/kXdy5O4CES
         IeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936363; x=1789541163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYl1RTu0H7T966MjgfIs9rrG8GCdvOEJmaLrbPw3sSg=;
        b=CzqMYnQJXlVmalfZ9sniNbvCOQx9rtXKIzTsu+4xul5+sq++qm9eeC1gsL7lbzwDaq
         GmYUU76WlYNsurOtsoMLK5JLlp6w/7ZegXuz/nGB2my37+oFrhwqpCLvbQMHbdofI6si
         u/K0GVFAakCN3n03CbZgdtmYoukLBSqT1TPLdWSXoWleZCuaT+B+AL+1lVS4uh/YK1ZU
         uL+Q4Mkez+ric+duvs5zaac9OVbAYnBCI/B3chypylTuwWUQGUY1OvlAmzH7yZITDONs
         crd4PHg2AYRhCLG9cU4GbvPh4/3z2k2HSsOTjXNlZE94r+hjfBSlAgHCoN4s3ZMz4S7f
         OIiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2xogXd/OP9iox+yFZC4w2Ui6ZxNtWy+Wcw2qO1cgdBWEWM57Cacb8SXoakYegQv1tOOJFsEkoM5ZjQl6tIXAh@lists.infradead.org
X-Gm-Message-State: AFuF++lomUWrwBa4HEn3mv6WLRjXV9Tt85TgTuVKTXv9ZOjxhQo+O6hH
	lOdF1aN8RXTnnNIWJTYJw2FacMuwxK6AuCoTbZbKe5vU9aNVY4KxrRh/
X-Gm-Gg: AYBFou22ODMppnZ+TyobOJxL/VRqwFckA/cxT2mWT5qMHHQyOTjvzKxpJ3u9YNWCE7S
	HejyxSYx4s6g63RY0qVnY8dxSP5jdlRBLn0yCjIQWVR0WCUmPsSFR2r8x7MBZNkdzWWuPtPFEDn
	rRK2AhardS//VqTK7zXrK+NVB0ojf4UkhufaQSAoZdrpmX3vQY7yL9dFkeGVHvZkGWdGKJGOf4s
	zleEesEWSmjpy7xQl1t553OF1g6RLJt1a3WljmMN8R8hkKxQViS6U8jJPEvfs4kGIvfRNYFNkVL
	Q34zrBFgIdsPpANUBKlNPdHTun91lp2BuJm0YFJjbk48zeohmMFQqhE0ECrT8LaUOCpWIQWxtU9
	8VueRAiqG98Un9QUKwjBxpdQHte6yn9tIsj+gac/EAuzwxQZ2VAfxiVihiIUb5NZlzgnoyxVvsa
	BzD5x3qXcebzGiXT0Q6oa3V8Wacvs2cs/P+FAfgPK7B/yZcVCS5rf6HyNa2RoaHlL7YUz2OOLcZ
	EsyYAxG5E5HZuj3kFOVwz3GX55NGq1uHLdR2mfWdepDmDkmg39LgZXDdqgmHZbHaRd1QBkBUQlo
	Q6vuv8seoefqDDqeqEQ7fgHxJ/XF5xn4FNcgCOZDtXW0BMbrI/1G
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr325273315e9.13.1788936362969;
        Tue, 08 Sep 2026 23:46:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm17238355e9.4.2026.09.08.23.46.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:46:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dma-mapping: split cache maintenance at highmem boundary
Date: Wed,  9 Sep 2026 08:44:43 +0200
Message-Id: <20260909064443.90544-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_234605_184983_3A04DC17 
X-CRM114-Status: GOOD (  14.30  )
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

dma_cache_maint_page() processes highmem pages one at a time, but passes
the complete remaining range to a cache operation when the current page
is lowmem. If a physically contiguous range starts in lowmem and crosses
into highmem, the operation continues beyond high_memory through virtual
addresses which do not map the highmem pages.

On a Raspberry Pi 400 running an ARM32 LPAE kernel, an 8 KiB scatterlist
entry crossing this boundary caused a deterministic data abort at f0000000
in v7_dma_clean_range().

Limit the crossing lowmem iteration to the end of its page. Subsequent
iterations advance page by page until the existing highmem path takes
over. Keep the bulk operation for ranges contained in lowmem.

Fixes: 43377453af83 ("[ARM] introduce dma_cache_maint_page()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing:

- Raspberry Pi 400, ARM32 LPAE, 8 KiB scatterlist entry crossing the
  0x30000000 lowmem/highmem boundary: all four unpatched boots panicked at
  f0000000 in v7_dma_clean_range(). All four patched boots completed. Three
  100-iteration patched runs checked 409,600 bytes in each DMA direction
  with zero mismatches.
- W=1 builds of arch/arm/mm/dma-mapping.o passed with CONFIG_HIGHMEM=y and
  CONFIG_HIGHMEM=n. They emitted only five pre-existing kernel-doc warnings.

The hardware kernels used base 986c24e0fe44. dma-mapping.c is unchanged
between that commit and this patch's base, 893e11787f78.

 arch/arm/mm/dma-mapping.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 7761099dde9e..887209a09226 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -663,6 +663,9 @@ static void dma_cache_maint_page(phys_addr_t phys, size_t size,
 		} else {
 			phys += offset;
 			vaddr = phys_to_virt(phys);
+			if (IS_ENABLED(CONFIG_HIGHMEM) &&
+			    len > (unsigned long)high_memory - (unsigned long)vaddr)
+				len = PAGE_SIZE - offset;
 			op(vaddr, len, dir);
 		}
 		offset = 0;
-- 
2.53.0

