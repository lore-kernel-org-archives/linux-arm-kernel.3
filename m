Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B6BCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=; b=hkvgqqARWkeXuTKjLQFBrtZzSa
	kmopYyLtRYo2D+NKDJc9Xdhbku59iH4DmskIlxNLRJGnYXcpZDOT5UiYFNAbObRJBTEfOvBHHMldN
	FjBZHN4w9FM52EvyKYPLNHbOsXWqY0Xook8vaoneHBr3kDzscn+dV61tglvd2cO1XmgpXbuNLfrCC
	udnod2kJ0IeOUItbnDAnlj5VWS6ttFCmm1q0eOOExifuAx1ZB6qwYL7io3xBRgUGUoG1Gul0Tp+ca
	l6/LICc/u/XCtB79u9s41pb1kMmUmZz/1X0XME9y30+mr5w3GTDpo0WPw4v6xUTJDdutBJSWuTkZA
	r08LLnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bu-00000008fb4-279z;
	Thu, 04 Sep 2025 03:26:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyDN-000000081SG-3TDk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:52:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24c7848519bso5365385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756947157; x=1757551957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=;
        b=E3tv4Mz9zsnVO6We6uEFt5NXvGpoSGi1bWjgdnemxmSc6pCIOIR8BtS+NW4yezHf4h
         3nElEkqz6dogcL5fbDT7ESVTME/nMNFyuzLwYGO2C+k9FfAqCwIXIFm2Xko5CPo+p680
         cB2s30HzDKfdTeNz6Aaj7xMsfh61m7DY5haD7Zpq532iSNPKi0c/YsKT3QQSKMxwVSPG
         g+KCE6Fn8RGwFhvUdaFtgVrVwF2ZhfmHgh7Sg7b0aDrhqAecsDn/lD5pvqokxI+dZs+v
         eLZqrTJEffhAvNcBWyizmeGus9IgKIrU0cc9hn9M9rdMJ1u+eOi7giUn4Yd5ASA7eANb
         bYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756947157; x=1757551957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=;
        b=nqOeObsg4lz8OJ/R4veQlr0Nr2YJvfVzcJQoncJxN0nfvJ8llQOUDnIcDoZcVb4rvO
         qkMTeDzltMJC3658tS93G72d3KZJD6ZHcl97Nnak3LglyhaPgEmBhZeX5Ch+fmnIKKpX
         96qtqAtkkuiGC/gwCWTgi7sx9UF8uV2R4YyArU7OmfdsEws6wVEiMOd5rPUsIss3R8i3
         cCYqwdbOsKeEl3coHP+jJLrzUHjM8ivw2TQ+2ftuZlYz1q0TfjD85sPPlyKavBHH5usM
         ySAYQXUOPkB6WD4nEc4AhM8wmZo9xvRCPOxkhbpuclYx5xwvVNeuggtrP6vMuyw7jgei
         rn1A==
X-Forwarded-Encrypted: i=1; AJvYcCVQJMk0eDZmLftONHwFFvr5R7jZScTxH/syEHTHYnapeijdu5glGm8Na7WceNX7Yi7L9Gfz3vusSuI97Ke/NaYS@lists.infradead.org
X-Gm-Message-State: AOJu0YyEDjxzbgDpYWrQUpS8tUMN0lhaM/WYHXXm2NIBxoWXd8hA+hE5
	EEp9TV9ZhS0gnuJ1NQn4mXScxcvKDENlvHdF4wipTO5Sw6inrOTd3TwOFDSNcXpq0Rg=
X-Gm-Gg: ASbGnctyNoQBlpAGowKpZObYrbzoGRl9iDTvkhmO7jZfW4uEKl5UGrbcaPhzRI5RlGi
	5IR/vpuUMnMVBjB1Y3AyWWCQaLYyfbytuVUpEyON5L7jVCQnFzf2WCfDA+ABLyYqqBYIdJFwGL9
	s86Et6CwK6MA03B5yxV/fok3o+TS6aN7792S5zb3Ovi2rucrcmqvJmf4xY0n/1fvz7GhGrfoDaV
	6feYPvmSUzg6HoVkJvf5Q2Yrt1srnXF14pj9E68wBsoUISmQub1jHa23FlPawa0sYDoULjjSUjN
	TZ9Vf6awAfWYpigq08SFrSDDqpzmzFpjNu6YfkC1J43ObLs9u2r5gc7wgsV2x6eQT6hQSN/QPnp
	pDgJ2tafcqyyJglJw/0kXKGoCk7yQn5+XnjyAlipESf2iGEiY+agF+aBp0WLr
X-Google-Smtp-Source: AGHT+IHXTSNI5t71w5e+WgB8B52Hvu9vci+qQdskTPpSKSg3A5yenk7DiQMoYc/Whz1X4xBXi6xZAg==
X-Received: by 2002:a17:903:2cf:b0:248:79d4:93b5 with SMTP id d9443c01a7336-24944a9d32bmr220968295ad.33.1756947157070;
        Wed, 03 Sep 2025 17:52:37 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:882:283c:10f0:c999])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28b3849sm15748931a12.31.2025.09.03.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:52:36 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH v2 2/3] arm64: mm: Make map_fdt() return mapped pointer
Date: Wed,  3 Sep 2025 17:52:08 -0700
Message-ID: <20250904005209.1494370-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250904005209.1494370-1-CFSworks@gmail.com>
References: <20250904005209.1494370-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_175237_864085_C5494698 
X-CRM114-Status: GOOD (  17.49  )
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

Currently map_fdt() accepts a physical address and relies on the caller
to keep using the same value after mapping, since the implementation
happens to install an identity mapping. This obscures the fact that the
usable pointer is defined by the mapping, not by the input value. Since
the mapping determines pointer validity, it is more natural to produce
the pointer at mapping time.

Change map_fdt() to return a void * pointing to the mapped FDT. This
clarifies the data flow, removes the implicit identity assumption, and
prepares for making map_fdt() accept a phys_addr_t in a follow-up
change.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm64/kernel/pi/map_kernel.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 2b3047860230..5dc4107b5a7f 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -191,7 +191,7 @@ static void __init remap_idmap_for_lpa2(void)
 	memset(init_pg_dir, 0, (char *)init_pg_end - (char *)init_pg_dir);
 }
 
-static void __init map_fdt(u64 fdt)
+static void *__init map_fdt(u64 fdt)
 {
 	static u8 ptes[INIT_IDMAP_FDT_SIZE] __initdata __aligned(PAGE_SIZE);
 	u64 efdt = fdt + MAX_FDT_SIZE;
@@ -205,6 +205,8 @@ static void __init map_fdt(u64 fdt)
 		  fdt, PAGE_KERNEL, IDMAP_ROOT_LEVEL,
 		  (pte_t *)init_idmap_pg_dir, false, 0);
 	dsb(ishst);
+
+	return (void *)fdt;
 }
 
 /*
@@ -238,15 +240,14 @@ asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
 	int root_level = 4 - CONFIG_PGTABLE_LEVELS;
 	int va_bits = VA_BITS;
 	int chosen;
-
-	map_fdt((u64)fdt);
+	void *fdt_mapped = map_fdt((u64)fdt);
 
 	/* Clear BSS and the initial page tables */
 	memset(__bss_start, 0, (char *)init_pg_end - (char *)__bss_start);
 
 	/* Parse the command line for CPU feature overrides */
-	chosen = fdt_path_offset(fdt, chosen_str);
-	init_feature_override(boot_status, fdt, chosen);
+	chosen = fdt_path_offset(fdt_mapped, chosen_str);
+	init_feature_override(boot_status, fdt_mapped, chosen);
 
 	if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && !cpu_has_lva()) {
 		va_bits = VA_BITS_MIN;
@@ -266,7 +267,7 @@ asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
 	 * fill in the high bits from the seed.
 	 */
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
-		u64 kaslr_seed = kaslr_early_init(fdt, chosen);
+		u64 kaslr_seed = kaslr_early_init(fdt_mapped, chosen);
 
 		if (kaslr_seed && kaslr_requires_kpti())
 			arm64_use_ng_mappings = ng_mappings_allowed();
-- 
2.49.1


