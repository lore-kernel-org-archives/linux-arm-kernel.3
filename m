Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A4CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/5XOnfiZIWhHaazfIksBYAhb1bM+JDK1FK2T/8kf0k=; b=iiB3sGBCRf0CHzIQRrPwaeFPc8
	IC0Zeb/Crzqqp0/HsSyISwrLi0Qun3BqQDCaaESgxXhU7j2gQCu3ZNsM7GXeKDVkEnPisuQ0o1VYD
	XQ5nCcDhlCYnn6c5bnq1ktGRc5XZSvBbbvKYF5ypdQyyvhk29EGT4SemiayKKg8eKB6N3yrMb4Xo8
	45LRSfyxUCvVGCVWoN6aS/9pEnJWL4j/+rmc0KW7BdsaNq+sY/Suxh3UJkJ0+zzY4LmlLLYIOBPk6
	009U30Z7FBOgKD738ojDdQrmvOd4RtgWRP8qpO0izwfOjKdqnVYqUXCjymZ2PokyvB7aKsJM/4UfJ
	fvYFb3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHz-0000000B56b-2BA3;
	Fri, 02 Oct 2026 09:10:47 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHw-0000000B51b-0LfG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:46 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd77300825so40066635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932243; x=1791537043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/5XOnfiZIWhHaazfIksBYAhb1bM+JDK1FK2T/8kf0k=;
        b=s7J9SZaZ5MmmVXB/wYywlKOIzX1LcfOYay+G1cSIKOaU4jM+9wZKR5dMUZEnqa2iWn
         aYQYfhUxfqufcTrGsWAH5i3YaMb/k5b9e5/bzA7ZvAeTV3vmWZUDNFb/qYOrl+FLKakq
         PdDQHfUY69AVO6r6C57C7Ppwrvr5crGJ36VsZRbn4U4Y527g2sUAhkMvrVgD7lQBkmgl
         L1xwrsfQMBf/hrHYjAKUGm0wfdCgagwBLanelV/HOKKX6a68QxaxB3DbuaQ8U4teg3tX
         4WgeWzRIlCKTbGk5wCToO5UKmfXTHR7plGR5tAXe/r0n9kOVu9t4rVsitAVQz1ub/47D
         gFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932243; x=1791537043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/5XOnfiZIWhHaazfIksBYAhb1bM+JDK1FK2T/8kf0k=;
        b=j0XF6f16Bx8k4s4y/IhhnEkz3JDHGciLdIHuvyvNACIfQLtNoRgeL5p4ta15hbo+2l
         DoV64GZxrL19ZarqrasOLcmchh14NuVgfOL90SL5YMMhLYH541r/KbVAQdOn63Wu2fIY
         la4KurI8lBkJoc6mx3CuPgA8a9YHkcJIpEoIPgWnnZxunfjRRnLA1lvMWrg9RrFmCSZ/
         l/XLlzKXrm6EtVQ5H4wvvcBejDIBxeyNZfkYzq8E7HdyLaF/YDQtnS7Q7PYBARO1P9q9
         n0jZIi5TmB3CC6hBXjlVP2+UPWfEWfjX9w2wZ7cL1PUQ3b8D9XYRzrs5RcNAEsSxm4vw
         8wGw==
X-Forwarded-Encrypted: i=1; AKwUvBwDC2V6PSs1HtGZ4lT/1p1liUzecJ5oaBmhyaim1VJoDofqqQP8mYAQ1WC5fi7GLmfnpkzJXnitNiO3d2fZ0G+2@lists.infradead.org
X-Gm-Message-State: AFuF++lqNQkYiAigPNCA1+namt+3WJLtZwvTJXLRPM/YgWz98DNASvfN
	csMJOMk0B+jbPmnpCcyDsZXMms1mjhqeDg7p3m3hCu5F68Ulc8fALwuv
X-Gm-Gg: AYBFou2WAJWJblJwPxRYqSzUsI9kYRVNl3CwhTx16BkYO8tcE/OLFQemvLTFCjxMHoN
	Du7nqOgnbGch1HUr0QGqevMTfAp0/4v8gIVkIGU9nLJALoFxB27azY9leGO6XvFaLpHTbi/ZlC0
	rwzDYF8KFWI5XQXH2u57E32H/yQZXlZYx5zi44SefC43n8B3ZE7aFkvW8trDOCy3f/GX8WLcrNH
	kGdgQ0wK5Rmb9BVyhsS9TZuckemlF0oaDnc9y+6yq94UQ2+G8ImvlBddxjJNNnj82Fb3wtn3NWt
	3js5WaoLDUtj/WPqi4gW0R/Y449qcij0ygLaxvLfaB0rfIW85RLxe3HX/FHWOZxG++zLF1WRqjo
	g6VGuxyJLdm7UFlwgR49TOmUzlxFPmBw39g3S2I8Pfu37RBwYmR0Sthu86mdrZ7gLtXD1LH7FGf
	UAZwZq4EtJHb1s1Ma8hZxw+t1RrGU1/zmhTgv6Ea9LMC5/FZOn73MUQMH6SL4U6g5qnGT33fMxF
	lRVKWUhfjyOcgagYu3MQg==
X-Received: by 2002:a17:902:ebcd:b0:2d7:107c:917b with SMTP id d9443c01a7336-2e498517c3cmr18629185ad.0.1790932243081;
        Fri, 02 Oct 2026 02:10:43 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:42 -0700 (PDT)
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
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v10 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Fri,  2 Oct 2026 17:09:45 +0800
Message-Id: <20261002090947.869220-9-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021044_324320_A85A30C2 
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
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 99bd22c086bf8..aae6141aaebf5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
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
@@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
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


