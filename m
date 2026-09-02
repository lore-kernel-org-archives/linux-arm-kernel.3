Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A005C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gODwxuTtOVKQ6CMnGDMT0l3+wYWk2p1Ok9ZsUXJwJCE=; b=S7GY6zEyHuGUa7xFKXYPRbfc7/
	xvmY2ADkmzNdt6JsyTqsvv8+8yFxmRGcBHAnDW0lM41c49N2c+xL1DJVRdcLM/KSOtSdFY++p/8+o
	/mVmY+RSCHEebKwl0APyDmOL7yB00JSgppouVXJHB0UlaEDsxNnI9Pb2ZaVNK1R61LFwQa4umISPz
	EFjhzvp0f/Pax/JHENwKA4WPiAKaWjP+h3lmJ57Vv4KdVbxGMy0eczZRITds+PVdjSfnwIK3yzewy
	PCtRhnVWwo3GWnyFH85sXmgE1H3OftK2ecmfvUuO+TBKumnZisB1VL6K4nPW+XgsksLNUPElwzRSP
	KfQQmc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYr-0000000EP2P-1Dlj;
	Wed, 02 Sep 2026 10:51:21 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYn-0000000EOuM-0p3T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:18 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a18e611c82so1083275a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346274; x=1788951074; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gODwxuTtOVKQ6CMnGDMT0l3+wYWk2p1Ok9ZsUXJwJCE=;
        b=AaoDceEE74LK27T3HD8W/sr9ncFM63Gmdbyh9UAWPE+OAX9RWQ2V+G/f+/EWI/h25u
         p7HhSXBLErlwDWQ0q2noD+/zVkD+d4gD//nB7rtlpTIrPvr54krpmuIv5zjwZ9iAaAyv
         sCpbpLI/eTI6rDZffqzIJzfCti9GO53pbRWmS2xR3vQNmvUYqpY8VF/FXXODyXN1E3Ma
         XhiAtBUgAcyrrCa3IFb5WuFHLK4rSj5JzBv+is3hx4Jb5hTjdoUCBJb3dp4KpsskY4o2
         WNPfasK3ODUyj0Ro9z7pW9G2Q+uT5z9ZZc/LmaL3d/dq8AQEOc+W/1UEXreWww+10gxk
         81HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346274; x=1788951074;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gODwxuTtOVKQ6CMnGDMT0l3+wYWk2p1Ok9ZsUXJwJCE=;
        b=n7MWGbpCwJug8lg+ho4cORSxuiqTlMm0ydmpKEj9Xdn7uw8pgCSISkBr9+gZlylU/n
         WLXmEtxTgBtT2VElsqsbRFSoB12YTSycD536EFr94uTZcqs1p6bbzJDDgdbdTGjuo3+q
         /UhrF1zrErtJ8bxsprbZo9ZaGmZChLpuKugEpjEYK1FLMl0J2nqCUSi0UOO/JyvzpbqX
         ZH/T63AszyUvHRdW7J7tNzyBmPpKCr0gfepitXoy+FwJXNp1JAQCwmjsj8gIZyEwSwGA
         Xk0pzVmb8Z4otUBKsc6mfT6IM1oK3Q3sBVidt6gCTZjiC5p458RjQ2FKGUmwMKXM/xNb
         KtAw==
X-Forwarded-Encrypted: i=1; AKwUvBxEobrCLAgdx+tyQddvqVfTuMjBA3nbh5LHWCE/L7OzAiE1VdpIIGpmIrbtixBK9ep2Vb/Au6fDBJ6Rz+F9NH5D@lists.infradead.org
X-Gm-Message-State: AFuF++mwLK8Wps92PxpTvULaT+cNsfnJHt95axVYUeiJHigpOjkKtrc2
	+edEJepDVeRli+N7WB26SPpQM4vG7wluQ5h9X1wRDWKyHc6rHnYGln3xPwALXj16dy4/Wt+s+X1
	QYB8u7XmmwuTakMdZzvnjEg==
X-Received: from edy6-n2.prod.google.com ([2002:a05:6402:5346:20b0:6a6:8ab2:8708])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4284:b0:6a6:32f5:ff40 with SMTP id 4fb4d7f45d1cf-6a682af8134mr2906512a12.20.1788346274084;
 Wed, 02 Sep 2026 03:51:14 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:08 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-7-vdonnefort@google.com>
Subject: [PATCH v9 06/10] arm64: Implement can_set_direct_map_range()
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
X-CRM114-CacheID: sfid-20260902_035117_255672_85D8E36D 
X-CRM114-Status: GOOD (  12.09  )
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

For systems where can_set_direct_map() is false, it is still possible
that a subregion of the direct map can be modified if it is mapped at
the last-level. Add an implementation for can_set_direct_map_range(). It
falls back to a page table walk to verify the mapping level if
can_set_direct_map() is false.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..1a37f4ef130b 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -9,6 +9,9 @@
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool can_set_direct_map_range(struct page *page, unsigned long nr_pages);
+#define can_set_direct_map_range can_set_direct_map_range
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 58898ae53f5d..c59ef17eb0d0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -103,6 +103,48 @@ bool can_set_direct_map(void)
 		system_supports_bbml3();
 }
 
+bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned long end = addr + nr_pages * PAGE_SIZE;
+
+	if (can_set_direct_map())
+		return true;
+
+	/*
+	 * If !can_set_direct_map() then no one can split blocks and it is safe
+	 * to walk the page-table lockless.
+	 */
+	while (addr < end) {
+		pud_t *pudp, pud;
+		pmd_t *pmdp, pmd;
+		pgd_t *pgdp;
+		p4d_t *p4dp;
+
+		pgdp = pgd_offset_k(addr);
+		if (pgd_none(READ_ONCE(*pgdp)))
+			return false;
+
+		p4dp = p4d_offset(pgdp, addr);
+		if (p4d_none(READ_ONCE(*p4dp)))
+			return false;
+
+		pudp = pud_offset(p4dp, addr);
+		pud = READ_ONCE(*pudp);
+		if (pud_none(pud) || pud_leaf(pud))
+			return false;
+
+		pmdp = pmd_offset(pudp, addr);
+		pmd = READ_ONCE(*pmdp);
+		if (pmd_none(pmd) || pmd_leaf(pmd))
+			return false;
+
+		addr = pmd_addr_end(addr, end);
+	}
+
+	return true;
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.55.0.970.g62bdec98f9-goog


