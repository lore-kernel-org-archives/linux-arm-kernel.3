Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE00CA1018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=; b=EfVM9AOEhSxsR+KHKg+ISkYdvZ
	w2DtembcB45L39hoxVX8aUjYCKng9X7BJ02XyS4ofRgM5QAx76hviSzaX+ddkxu1UdQoKyfVUCjJA
	JB6eM4MB3qLcJM4g2jwxpft5LAAbFecpZEvtY357pn0KS3efwGrgkwxYLQ+2HsBMiVzieZ2bejGFt
	YlHoAeS9y3/8XE4JwZ3XGU45tMC2JXMcl7mKejaQZecL8AzENcegvntcdPQ9Igr7Kd1kcJ+Trd01J
	0mY7iECttwti5OtyNB2Y2wVHKZB7ZYoTm8AwD8Wq3BH7Y2fGksF0GGu4W1dWGus8GKdUBUjfd4bTK
	8CzvKimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bt-00000008faC-40ya;
	Thu, 04 Sep 2025 03:26:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyDM-000000081Rv-2sSb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:52:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso485747b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756947156; x=1757551956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=;
        b=gw2fDACt5hnmfA7YriyZJjdDj4MXtsfwFBVnHwBZ2d2qFRYbsSlgf6YQTV2KXMnYeb
         8RwL/zUGojnN78ugD4xWDM6wo1BVFkCQjP3feX1RH26F/zLcofaytfjTNfQfmQhXYGki
         fpovirKN/1PE4LAioNP2OClX5h5PaNq0IgP0ZACeMx8RUK49EK3KZOZccWAmE77NGFwB
         b5b9xjnaEpEIwfpSSweP4hk0mO7JYMplIRhU7eyh0Bnh+9p4f+Er9wxonhKDd5m+UXZB
         K4FFUwk6hYSZKKzAom93lchrWXq44eP0oYvlwRswSQPhPMoYUWyEYxwO8fp6gcot/LOI
         73Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756947156; x=1757551956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=;
        b=pSjIEoMPwcDHIBCy135Ta7KQgZ0fw9oaAXCADXFODhRyRMt54n2lkfW4Qe9CAb9FE0
         lgUr/OxHkGVgOw/eOvkhi6We7sndN7/056YpsRUkgTca/hMhhdkI0YtJG+zJxFIOU9sU
         Wo5B5zEht7nt+7jPbjjOM0ENgMMgoD5p7Jiy87P4TSuLq16dkoFF0yoXYK1icanbh65M
         RKtmUmgy+4kPDzBj1qfB2r20hoj6Ktwa8EZZNnFV/l6ZYsUj8aOgwx8SBSud0z23GYog
         sRNTjCrYkp3oQiF9/PnOGZq9IaKd2GnY0t+7cQda70ggO2SiQNHOIxRiUHcJoR5w7hqz
         ju3g==
X-Forwarded-Encrypted: i=1; AJvYcCVR+OZ+N8rShqkjH2ZRTVwXSuf00Xo4UJgC5bNzLIsRJUSjCuABUF+U5uC5PfNzlmp0d2/Zj8ok1sgyZtqQNgGz@lists.infradead.org
X-Gm-Message-State: AOJu0YxtkAMZ/5TbLzeBBLrtwtkKqhYbZCd1IXhn1c9KskXYYVyFykfY
	hHvT13ox5MP4K9tJnIigPMgrrMGf0baQp+Avm7kM+C0UAk7hDBwAj8nK
X-Gm-Gg: ASbGncu8zfbFObuLBEX7Hp+IAuw1/ptqZR2tkgAUesQvHQRASaO7oPgLdgkA73KRxQS
	/ZOw6xu6udviwEezFPpMSZLBKZb6fqeqRB+gNcsb16jw/NbjFtFvp0Lb8LWGT0SNnzgWAq9sVCR
	JrpYjG1WN0uoMFzh4kH+A4DUQo2YIJd17+ycPiB9Hqou0qQIloBDgmYRnANYgkCgLF4GdsRGY8q
	kc+qsdjI8Jgq5C6jqI9YImXBue9G4i+9XuiBxCFNFJsYslzyrP1gESxiIxVfSOaLH81FHCtCiKs
	uXKyHdlqZ7Z9GlKOlOQ3rb4D1kfzmmfv8+ACK5N4AK/304oCIJwkY6qSHsc0YnG74GdqT7jUcfi
	X68fR6LQwbJROCECMbnL1SKfws0LyK5/ATNEbKcs3iY+plWM+MLeEk03Zqqqu2gIA3SSeXzA=
X-Google-Smtp-Source: AGHT+IGZaqd4bARj+mLl0wXBwvmUgoSDL0+9kDhmB01XllE5NOEa7P4aqnIE1ZquOyLN5o/MJ3L6Vw==
X-Received: by 2002:a05:6a20:12c4:b0:249:1867:c905 with SMTP id adf61e73a8af0-24918864e0fmr5294229637.15.1756947155824;
        Wed, 03 Sep 2025 17:52:35 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:882:283c:10f0:c999])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28b3849sm15748931a12.31.2025.09.03.17.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:52:35 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: mm: Cast start/end markers to char *, not u64
Date: Wed,  3 Sep 2025 17:52:07 -0700
Message-ID: <20250904005209.1494370-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250904005209.1494370-1-CFSworks@gmail.com>
References: <20250904005209.1494370-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_175236_721565_C33F4846 
X-CRM114-Status: GOOD (  15.76  )
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

There are a few memset() calls in map_kernel.c that cast marker-symbol
addresses to u64 in order to perform pointer subtraction (range size
computation).

Cast them with (char *) instead, aligning with idiomatic C pointer
arithmetic.

This patch provably has no effect at runtime: I have verified that
.text of vmlinux is identical after this change.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm64/kernel/pi/map_kernel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 0f4bd7771859..2b3047860230 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -179,7 +179,7 @@ static void __init remap_idmap_for_lpa2(void)
 	 * Don't bother with the FDT, we no longer need it after this.
 	 */
 	memset(init_idmap_pg_dir, 0,
-	       (u64)init_idmap_pg_end - (u64)init_idmap_pg_dir);
+	       (char *)init_idmap_pg_end - (char *)init_idmap_pg_dir);
 
 	create_init_idmap(init_idmap_pg_dir, mask);
 	dsb(ishst);
@@ -188,7 +188,7 @@ static void __init remap_idmap_for_lpa2(void)
 	set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
 
 	/* wipe the temporary ID map from memory */
-	memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
+	memset(init_pg_dir, 0, (char *)init_pg_end - (char *)init_pg_dir);
 }
 
 static void __init map_fdt(u64 fdt)
@@ -242,7 +242,7 @@ asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
 	map_fdt((u64)fdt);
 
 	/* Clear BSS and the initial page tables */
-	memset(__bss_start, 0, (u64)init_pg_end - (u64)__bss_start);
+	memset(__bss_start, 0, (char *)init_pg_end - (char *)__bss_start);
 
 	/* Parse the command line for CPU feature overrides */
 	chosen = fdt_path_offset(fdt, chosen_str);
-- 
2.49.1


