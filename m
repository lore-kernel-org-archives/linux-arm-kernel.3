Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF6CCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bbcoKjOxWp5rK+koIv3oGOfWy9Ig7vlkgEF+yecgH8=; b=rpOc0tpDb7GlSi23qSmB+ib0Tf
	fL8YsnXZhsTyyUrJ5AHhXLxdojwayw25SZz6YpgkEhma2FG3VmoAAkrWPZVCaRbtagnGeEy4AetUh
	i7bfC1U9jfwzQkychKMG1JepQziFR+/ulkGh/tjNwB6YBvi4kS5hXovcWY79vSexsqA5sRXaRKHtV
	mi6+5vKxKQ5ucUflQQt9MeKgRoffZpDbdyNjbLqTiVldP2pv7bUM+YNApqsf4eXHoNP9e8h2b0Qb+
	gnQP/6wuZJAL565sFBY5SkUBABnvW9ZgIagsSeOhH0iUr87AcFGdk0RRBMATOZTjDPxLDs4nBQmC0
	W9v8TXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pb-00000000ry1-3SrN;
	Thu, 18 Jun 2026 08:47:47 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8PZ-00000000rwp-1TG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:47:46 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so251584a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772464; x=1782377264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bbcoKjOxWp5rK+koIv3oGOfWy9Ig7vlkgEF+yecgH8=;
        b=i7760j7+ghbqbzPjmb/0HsDzy8VPSfd8OOWheyUn9vg3jwgZAdnzJR9lAbR22A3nD2
         y6J/G1uJVHnUTeABAPSa5S7UEknRqebwZ0qz8CTevCCHWo+hnNdkHQQIT7I4m5jMfZwk
         eWwGN5BAMC3a6QA9Z0PbV3IP9aVsrCqkOp6WoWrbDIBsnf+o8hIOhTU72+J4DrqV1HOh
         8YCmpmKE1M+dF0gqmLSZg95bhucmzg6HHPcVrXb1/pL5uPdX6fb6tIEUzdNuExk+n08z
         jKskNWfDDt4MU04Ve4z/kQ49s/Y7HJPmyMIR9Zw7qDcohnOfNL5ZrySWqE6PRpH6Tsow
         ITcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772464; x=1782377264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8bbcoKjOxWp5rK+koIv3oGOfWy9Ig7vlkgEF+yecgH8=;
        b=amAwP4UQjSKUgTLbSqTrq522RUu1z/uUvm1uqKAAGj7hyyzllsHiNyPI7qKjL+lg7/
         DgyXfZBk8z7Stg5ZrWA4+5ZYZwxhAxrYO/hOJiN6YDYTIPyQ8qmQsC6TvvyAykQgtPsj
         v5wXyh4BUhkxx4tSN37VHA+bACWAFHdQ5e9ynKE16HfJhWyJpdGb5otujHqIV68zcZcz
         N8mxU8f7V7JQpvdLmv8AiapXX64wFUzkzuC2vuMyFuvgrVdCivUfprCvixBIEJEOkP3/
         ydH/cRUEAd85ftfb5xweBsaiXAbwSMDT9kbHG3VGhA+799wITVdb8TazH9+cdBS3etWd
         e01A==
X-Forwarded-Encrypted: i=1; AFNElJ/J8WV96vBzCOBDuolz+nlDNTk9zXHWICgDOCl3U/QY8munqaqcJ5rtMqVvOVoXhj9AylJRqGMrG6wC+fOXYnoW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9f07j1/Z/wWv/xbphe6cBY9r597Goe2VRWDUkTlE1zUyZ9Woh
	xW7SPI+eVwARC9gaoMKqWVtAwhUIVe6OeB+YZI99JGjid44E4iCPQq8+
X-Gm-Gg: AfdE7clO4B7ix2OtRuvIW3ImrCuD6RdENPTQCDTL8dUQbNKztyu9/I1IJZ9vCHV8exp
	qgis4wG8SqkiLjvJF/4VSalEMi2OAs6yLMwy3Cx4c1btibirri4BamZHg2V6xYcQKyXpSEhoGx6
	NDsebjEVQ7QICaPlOO5n1eahTBSdqUzAkQ0Bca3KofOaS8xE+iU87UWsESiAEy0DMW8JbrNe7GT
	YbJJWImfUsQnHlqEYPdRwVKD/n5CAZL7XWV4NyOz5e6c28/IQ5/155NoV0D9Y1zQ2I0VAYwX4fy
	3yGXCrNQSvoKYjRekDeVEur/jxvVYklLYoA/PbibueeOkEMGaMuCTABMGJlFUOYb9m+GEFSDjnk
	WLjsfFYDrMJotHoAS4QSUqvFASGi3ME/2Dn05LIk+D4AAQJU4VJ0IzTduxQXAD9KTqft0tk2a31
	HCghqhKFNcWVcmaLop8uY69q6AA3TkSeO5RHI=
X-Received: by 2002:a17:90b:2b47:b0:366:132:fda6 with SMTP id 98e67ed59e1d1-37c9dbbdb5cmr7450798a91.11.1781772464450;
        Thu, 18 Jun 2026 01:47:44 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:47:44 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: [PATCH v4 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Thu, 18 Jun 2026 16:47:22 +0800
Message-Id: <20260618084726.1070022-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014745_395668_90342CBA 
X-CRM114-Status: GOOD (  11.18  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..787fd17b48e2c 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = 1UL << __fls(size);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


