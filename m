Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA738C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMhtuKKM9junrQcHfwBMD2RoOkQktkfIp1wjOSUMcpY=; b=sS6y6Uv+F1qmFITKW1BEe02hn8
	5V6Rm0hlbhOgE63PJkzQOrXFWtUVaz631nl4aErsKYfIkppdzYBvPDHEeP7Ej7gTfbY6s4198Dqa1
	7GQBeVQkyTxxq+G7KWdNoufScuLoC/lLlkvEhjPAT9RybXeu3fEO6ImuDdgNliQD+EezVu9y4FFgm
	1BtAFBRNGZ6BX/B2U04jeZjDe7Jsj16fBKTXTpI3FpLujez647nIMs6WEXC7lmMB7OTzGdtd/8+ND
	mN77EeVrduoiM3/Wvd6IQ1NJmBJjylTui5svstENqbCksPnW7zFmLhNhpwNUxfs7Qr6ys6ibVGUS0
	9y/DYdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTp-00000007HTJ-2oQn;
	Wed, 23 Sep 2026 06:29:21 +0000
Received: from mail-pj2-f43.google.com ([74.125.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTk-00000007HOL-272h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:17 +0000
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ec6188so2474635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144955; x=1790749755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMhtuKKM9junrQcHfwBMD2RoOkQktkfIp1wjOSUMcpY=;
        b=aG9R3sm+K7Ht/ZPaAvCwxXGHWA887RqxRXv7wf1siwyPO7QrmsGxcDyTG11z4bdZel
         MrEHf6XbAeZJv9CvNzKBAgqYlBrXxSENv9n5p+e7JLpemuSgMUsZPSN0A1qjvjcbYyiy
         QM2hwhJ0RhAeI6k39DZt+yW0cvYvsOSl6M+MnaLQHMnVR++tPOYr8cDczEoxSg4NNdDO
         KwIE5T2tVdxqja3eCJHi0BQL28CqP3DZY2Zv5hTVgYHaY0T68zxJX5sRNMr1RnH1Txyp
         xbbfjUdsOY2BUHqv/0CgdXZsa4pak6oSdg9efDvMVUMyFM18UoukT9EahAA+y0je+fVZ
         fK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144955; x=1790749755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMhtuKKM9junrQcHfwBMD2RoOkQktkfIp1wjOSUMcpY=;
        b=KZaHv+d4Y+Ecok+pYiu4h0MPlj7HE+PC9kK2kfnbJtkYDW/qplCQTHwX9O2aq4YSAj
         ZJ3FmioHIsCJyNJl5hyYVfYQnsEEqI0G+vtdPsj20+o0T8MnaoIHWU8zdDwqJm3b6N1/
         u9GZ+PjyENDJIs9bab/H3/wSNmB7YWC9TwaynEgmig7Bc7ItXd0O7M12qcADHCzWdlzS
         JSe4C3RT/mP7wvljgQReVAQN5m9aXjpQoZiKCNd2TJCwK0JJSxBDoOu6qHDn15/YKWSq
         C1Ibr72hmvbWz/UzMK+oldJvRLnDsDrN9n2RvDvqoADZcPlJH/QSPlUy267/JQ+P8zzw
         osuA==
X-Forwarded-Encrypted: i=1; AKwUvBy8jEQFO3G8ZVCtp96GYlgZ/JLvoBjSr3pw5HeIQOJaxGBMBSD3xLz74c2qqcBhj2YSiHZMw0Zi8IlaVP0G/SQQ@lists.infradead.org
X-Gm-Message-State: AFuF++nTw2zaFAzUZ+PbpYbKFOu/QNs0/oQGWMZHgkTi/zF3ykQK15Bi
	2UJhfVIifJEfutzsqSrd/v096hAN01XRhmB5tPdo0vSxE/BXLcnpRpdT
X-Gm-Gg: AYBFou1ZIMc0vIEoGNKviF1rBVzIEm9mvqkg0VAxnB4cC+v7seLXfk2BWqOx7du3+d3
	Uqxv98wPCWAfpkoFVF2SWi+yxfDRCn/PX6zFkIIvd56JlDL4u5uz6w0afP9pt7tfveYyyJeM9SR
	nSviQea/uE0vS9PhNSLjhO076VcbwylXbzwnGlz7oqapg5rbKF2qoPyamL9JqOHsAPobqfdyLK6
	DVBPUgHEepRq7VpSZyT8CJDjLHOCN7vOMIxFn+g2B8AekMQyrY9sb0LPgru3dpjmEaVb7s6dpz2
	SCO713vDdxPqeIUXfBvolqogBohpGL+9J+waG+O5ld40atCGNB1V+2IUa9zVfcZ+9moYXodIDec
	q5jZv7deuKbDymOL4IZed29xqSjNy2/ePu7K6dXNYL6kdVXDw/6SQ1/K3uTEZbMfcERBGr2pLFo
	EH+MYMr/pTLs30abHVM2QRvXREcYaYKFUwiQXou4wQ7SnfKd8m2v32D8P7NAPm7sJXbQa88M58E
	jw6tx8vnu0twaky9xRVBQ==
X-Received: by 2002:a17:902:ccc2:b0:2dd:c100:4249 with SMTP id d9443c01a7336-2df69de978fmr13493295ad.45.1790144955081;
        Tue, 22 Sep 2026 23:29:15 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:14 -0700 (PDT)
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
Subject: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Wed, 23 Sep 2026 14:28:28 +0800
Message-Id: <20260923062832.479455-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232916_556839_78232A2F 
X-CRM114-Status: GOOD (  13.95  )
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

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fb757d95bde25..d475e52110e4a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, pfn += steps, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1


