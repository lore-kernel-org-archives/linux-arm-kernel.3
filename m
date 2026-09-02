Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA028C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlzRHwAUXMpKspjrSSJuu5KTpj2eywEkwws+9IOUBiI=; b=gHsRnjZJZ8Rhw+axe0Sd8Y0mFq
	qmLw+tCLIbAqOPSrb+z/Sn55FCXIXuNpvJvrsOKvcfMWkefw8qXYBUVfNk9EN9Bckc2eOmoyJbCFj
	qsqH9HWB2a6Fkrn/63oCnpIqFpU2wCc70heNOKu3a6WKLKtNNP7D225d+XIKtq9wMTRpONYb7f12y
	AAFKCbb03832m3apGFKlxXFV2bBLCeoLJetJVYvzniBB477gT80/qPs++rD2FmhXI1Fq7nibvynRZ
	GaCHRaHSUoyeL4i6TDBLm/krAHeoZCDC+OmLKAOLCYI7eeLO3hU1ybe6uJFjj++7sFUn68UkVcz3I
	RNv/jWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYr-0000000EP3B-2eEs;
	Wed, 02 Sep 2026 10:51:21 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYp-0000000EOwg-0HaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:20 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso699762f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346276; x=1788951076; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlzRHwAUXMpKspjrSSJuu5KTpj2eywEkwws+9IOUBiI=;
        b=RR9ew3dZKFFS6kai0wsIx0hmpG7E88yrXZuO5MptNTUcKmjWAx3RZvkGKgcHvIRuhj
         hIosDvUnXXj9gZdenOBzfz0GpT9nV59ZmRfdCndQNFQS6ij2dMoCrzkapVOjDjd2ImTW
         BRqlL9JapckUj/+mayC+vvCr3k3+aqC4JfL7BK+shF3qsPP6qA7wyQA+4Ow86Ins3ZFa
         4LL5GNY7S2JbZyr/pJYqz578bgFnoVb8JuBL1ycFcCZ3G8X6sHdM4HWVt5h15cBgIz19
         ukK2vP95uOHGMLbHbucTBXYebRV+ktzHvwlr92kNEIpE1Edf7AVKUWoRNNOVW+OIEMJX
         PH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346276; x=1788951076;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlzRHwAUXMpKspjrSSJuu5KTpj2eywEkwws+9IOUBiI=;
        b=Hm9BPqY7Yt71eESqjnALUAjUTnVf2vVVYcA5w+LS42EQTYIgg+2mEJJ+kA+3A9+DrQ
         UVSsxJdcBj2r7ELc8qcgdKL+7CZYo6/0QEHBLz8cV4anpltLQHf1aRNqQ6XqCl3I0MPm
         vBP9cmV9OvgacIhI4WSIef0R1WDPXtP1SxaFWHeLHLqdN7sVvgJT2+LgubOMtpQA1ZA8
         Lk7T24VEmmWcvyf/ePfIByXs7I54UMDztYxqGYCCA+oL3PNLW2tqJ/XaLC3eEu+PCDUJ
         e2HJ1t65MRPgXElJr0IJ1h5cqQ4AVmJGhO0jjBtEgyYCl/8aXj607jM09KuaksJ+Dszc
         BiaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRJn2MnDrybiy+i9vrQuRw4ZUc6k/JszGl3lrkmy42yuQia3TwQ4USGiKS3xOJFA/8o4vwOc8ptLJP3IrCBTfN@lists.infradead.org
X-Gm-Message-State: AFuF++loZVGKOFnunn+rnwEPxOKCpoIzyKmM2PCfWEDo2TGm3XuxeKT4
	jNUsFH0BSe75OJ2oUKoYWymbfGIJs5qbMVHXLAzWL3H354bq8ZLOEDbQKqtcy333TgWWgm1kooR
	Zep0n/yfRVVXbO9LDwDMM9Q==
X-Received: from wrqr17.prod.google.com ([2002:a5d:4991:0:b0:482:abe4:58a8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:482:fc30:a1b4 with SMTP id ffacd0b85a97d-48488e03952mr6019121f8f.5.1788346276079;
 Wed, 02 Sep 2026 03:51:16 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:10 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-9-vdonnefort@google.com>
Subject: [PATCH v9 08/10] arm64: Add support for MEMBLOCK_LLMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035119_153936_B35F17D2 
X-CRM114-Status: GOOD (  13.11  )
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

With the MEMBLOCK_LLMAP flag, force a last-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..c0fcc76914d1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,9 +1184,8 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
-	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
-	u64 i;
+	struct memblock_region *r;
 
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
@@ -1226,9 +1225,13 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1240,23 @@ static void __init map_mem(void)
 		 * regions. The cost is at most one page of unmapped gap at
 		 * each boundary.
 		 */
-		start = PAGE_ALIGN(start);
-		end = end & PAGE_MASK;
+		start = PAGE_ALIGN(r->base);
+		end = (r->base + r->size) & PAGE_MASK;
 		if (start >= end)
 			continue;
+
+		int rflags = flags;
+
+		if (memblock_is_llmap(r))
+			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
-			       flags);
+			       rflags);
 	}
 }
 
-- 
2.55.0.970.g62bdec98f9-goog


