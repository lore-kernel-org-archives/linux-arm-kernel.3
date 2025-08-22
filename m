Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCB0CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=; b=sAOW5MO/AWL34fIogyx0V+5ZVY
	RJL5/B5sfaUeUkQfRNaUCNnuFLRGApHGZvg+Ro2/SJrBneihILIiV7tE9Mk3s6lOb0TwnmbSpyoCe
	w5e371/RLVdmDb/WEnDDjcZCyoAfKErgpxCvCbG+zdsNylkXRyCUtwkZJ/q/MTKgXYkvTJiKLwpi/
	nL1BPT+lqgMg7tNU2qizzeuljUYT9rp4h79Hsmb7n+mwVsQSRolEz+iythjGgagYWeq08vjXqF0cz
	Y+U6fQ/n2bLkUhmyDTovI2nkf88ribrWZP2unhJj/woyoZ3F033Mg7n3asygFavlwR5/vK6ioQM+I
	8nTuwDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG1-00000002Mxx-34Aa;
	Fri, 22 Aug 2025 11:48:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJF3-00000001UUN-0KsI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 04:19:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso1635939b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 21:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755836344; x=1756441144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=;
        b=L/nwZMHJus4tMr5xnJSKEWJ1myHWQtxRrOhUNYa4uYjXYuEEwDyTSxd0XbEGWFdEZr
         VhiLnBFB8Bw0n3PZd492RiLB1aGuMWssFzhBpBlRqP7BDbuLg3csY3wk32byF248ncZ/
         PzVAVDgE1Hh23/abK0e0B0vv0FGy3GIdbye1wz+0bJzYptI7N7Q1QxyXNPfxC9M2eBsq
         E2CVvxN8MWDur+e45KVhAOSIdF/g8jOXtJISjNvX6JkWr5TaerYIJODEv1PKhshe3DxG
         zNJxCnZI9iLDptkWZb40J/DjjCJx59tKO+SjnDRonfyhhBoF1lJDLJdAHbSMo2ttmIzG
         c+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755836344; x=1756441144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/th4jop1O0kFuAVgwskLm3Kft+pDSyOKRwu3IMOkLA=;
        b=egMyP7yFsh4CpcYwpTnSGAo+hfNcdC0rJWwVihMCNZYgMSWFhwzZr96dVuFVRyARyX
         LtYZN1e7GFNIdSlK0/ut4dMlArT8Nam7SQbnQzU9BTP4k3avmT2ft5PR+gipTKc5dXwD
         JVUrHRVDngyVGLpqHz9uFXsDdNtQRykXB7EzPa1awcFIyjEXSKMEX0J0Y0ejnu3XrVEx
         H3gyZrNF6cfQS10ZRakqZBUrVocS+NOczXKvnZUuiLVBoqy7dpItTAKgNZlNV5cn7UYz
         4qs00NA57w7EfnzmV6S7FKmKHqZZXGkz1D2YzRNo1VjDI244DsGjT/81M19QdnKS25SC
         gR/A==
X-Forwarded-Encrypted: i=1; AJvYcCVCYVgBNtWj2QaHkI+8izSHKHVXus/hQWHdyV/YfI/87NgCzcTx1VjwE4uM5x//jcw6rNTQDY1f7fJWX3kRnld+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6g72TO7xabJZwmGHKd/0y9BrpL5fu65dm2hr/HsRBGZucHkGR
	OTcclhBagfkCWqVL6bEcL4lUNtPXDznNyZukdxlsrmytjH4eeaQOiizncmrivL+gISQ=
X-Gm-Gg: ASbGnctmGqP+klh145pYx2M+sdmq10Pfp9ctGpWWIQw9QiotFBCMbhBZO5wDqHnnULB
	V8PyGXCFOLzb1eXJZuNT+k1mPKkiy4Sd+KvbJplLtWL6p+kN9MeQdpNCewuugAsQqX+q5p3RY+U
	2X3kIhKIV7N3m/pTO2e5JrOfC0UBjc9DC09f/58A+wWUosaXznYTlAVDtKoxRvaSxmATRxGHU9g
	AipWSxiZEUpqsMIkR9XuCjfBIRWNKYQhl47WvXrpwIhYim8hl4FFxS/+XQfZaQqXgqRGN9EM/tj
	m7UnSoqdaETVS+iKuMtmzIvAa1bGi/4p6Tj+Efzfwox7Gr5jgdB588ay+XVRqtV75Ej5rVGP4qD
	OwAiZOBvkFVl82f7upZxMFsxUtatRPVVOS0Zfp25RcU2M3nE3s/p6VksIaDJCtA==
X-Google-Smtp-Source: AGHT+IEli5jcECjFb9Oq0WbfZLt07FMhg6/dC/kxKv6cWdo3v9Z2pQFAHs+/6NRV69eweeHR/lMWFg==
X-Received: by 2002:a05:6a00:3c87:b0:76e:3a11:d23a with SMTP id d2e1a72fcca58-7702fa0f07dmr2276936b3a.4.1755836344270;
        Thu, 21 Aug 2025 21:19:04 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:ba38:b533:dcf5:1e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d1375a3sm9534559b3a.43.2025.08.21.21.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 21:19:03 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: mm: Make map_fdt() return mapped pointer
Date: Thu, 21 Aug 2025 21:15:37 -0700
Message-ID: <20250822041538.467514-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822041538.467514-1-CFSworks@gmail.com>
References: <20250822041538.467514-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_211905_121978_630DBBC0 
X-CRM114-Status: GOOD (  17.36  )
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


