Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD6D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9C0BuMfYpE52X3ZkwF2ddAC3FMTh1lBAow5RoiEAGeU=; b=4XJbeZ6l+L9nWaTGAE+fQ3heYZ
	izJa7pBT21WA4sU4vpG53sHz/2mwba0nt15dfOReI891LuqM0NjkU8W6yXIv62To9aP8h4stDz/zh
	SUMedcF/3ryXNdGkC0gZjksO//yRgKIAQNJbOsleb7gEhhZiAS2tzCzmyFm0i9IOur/2uJZuU7z24
	UNCN2veZHooS4L/CxuVPm+LmZTOXTk363m4F+gTXnvMkM+KsYwFVPkHHaAzba1Q+w1re4pO5SZcNI
	mfA9aWwp5UE2ZnLYzyd4f0GNdwhYIo9TSDvyRLfBvHDi1CgqE1/jhS3qCUxivLWD9pNmNCnNElljb
	RsuYZoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQEU0-00000004eH8-1gVc;
	Tue, 02 Dec 2025 00:43:08 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQETx-00000004eGi-3a0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 00:43:06 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so3327510b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 16:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636184; x=1765240984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9C0BuMfYpE52X3ZkwF2ddAC3FMTh1lBAow5RoiEAGeU=;
        b=dha2OIDxvdhND0f8J/N27md/hqqSp6eMZtrozCU8GzZHMoV0BmS6iHVAx84oOAfHmZ
         mlb/xST1bka73Z1q5rf8+Q9GHJRXRGkxh09fW27gE1sb0rJPwaC+d1BokD0l4uuvSba2
         rpCGoD9DcP6v2mmPPnTWN6pDU4CYEeQ8tS70aXLwSZy01ZBHvvjGqe4yQ9eqNFPrI9X0
         IMxsyfRD43GjCjoRI2Ifs0A9UutsD1EReGsuAeyyVDgdloGTQAQ8AIkR4ee0hHg5hddD
         BrirfMztNwIGh0MKSqAn5mcNRldGVUoi0TyVd/dafzBF1oVWBNSH/dD2OeNBNkW/+0z/
         +nyw==
X-Forwarded-Encrypted: i=1; AJvYcCUkzgGygAXQ4EDICmvK2bsiBBOqcdyoX4BFp0577AHZIqdI+5DhbegQ9Lh4p9N8TMRAYKU/gD8NIJWa1CtovvNH@lists.infradead.org
X-Gm-Message-State: AOJu0YyzuuaDQAsTjR3EXdesb38umdj69q3+7psfnrqH3tF+wlW4AqHT
	HWDMafJxFBGZQd9NK3D5wlXPnNUwD6Wg0peHvY8EezTHYl6MliDNCgP2SFTc2OPD
X-Gm-Gg: ASbGnctvBZWTyrCJQUUb2a4d+IHo25KHyOwkyJ8wvK6SOg4Xud0kuu4xpSKN3Dx0wFI
	BKLFTxfSGVPjHYBo/42ntMrL4Hbc394oitsIRnVXH0nRcIhNm1j4NbJTCgySjozFG0Bl2iXLta6
	xFcvIOqM2T571IYaCWqgb7UZRI7+HXkZPxBG8SaYSzJBmEwMaVvD+TZBIklgktfCF0Rh7ofGEFk
	OhQY+xo76UKBjssE8VvmzF33wYY06Xxg9mXoNCl+lrTv/bhrHp6lIjIXnldlch4mMYLlh4NABzV
	OCEp8uMNLdv9t4O2LJlSQGqHbVEce+LDwpJw+5c0yC1x1b6jRUlje7fd9ZlakXGWziSjGhikyOB
	2NRzeAWPaUgHUOzHiQepQ+AZLrXS3TiUWw5RCkNW7KgSPJFKRWrJ91vC213QSsDQOUQsnjpFkAH
	xmb5GXCPeYeN/XiHwxO5xkxOfO1LUGnw==
X-Google-Smtp-Source: AGHT+IFjl/QJBewD7kSmPY7WYm5wqwBCAmnQ0iouuo16tzvMnxlT2E8ljk56fl4NupM+SgcFNmRjbQ==
X-Received: by 2002:a05:6a20:2447:b0:33f:df99:11e5 with SMTP id adf61e73a8af0-3637dea5abemr30792787637.28.1764636184498;
        Mon, 01 Dec 2025 16:43:04 -0800 (PST)
Received: from lua-playground.. ([221.164.191.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb00bd1sm13300578a12.11.2025.12.01.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:43:04 -0800 (PST)
From: Jeongin Yeo <leo.yeo@luaberry.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	kevin.brodsky@arm.com,
	dev.jain@arm.com,
	quic_zhenhuah@quicinc.com,
	lorenzo.stoakes@oracle.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: mm: prevent context switching during idmap is mapped
Date: Tue,  2 Dec 2025 00:42:23 +0000
Message-Id: <20251202004223.108388-1-leo.yeo@luaberry.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_164305_893098_C7E94AAF 
X-CRM114-Status: GOOD (  13.83  )
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

 cpu_install_idmap replaces ttbr0 to install idmap. replace_phys uses
 idmap_cpu_replace_ttbr1 which is located in idmap,
 thus it requires ttbr0 to point idmap. 
 
 However, if a kernel task has switched out right after
 cpu_install_idmap, when kernel task is loaded, its ttbr0 is
 mapped to reserved_pg_dir which doesn't contain any idmap
 functions.
 Therefore, the kernel task cannot find any functions to run,
 causing memory fault.
 
 As far as I can verify from the current arm64 tree,
 no in-tree caller invokes this function from a preemptible context.
 
 Nevertheless, future work might allow this function to be called in
 preemptive state. Encapsulating the idmap sequence with
 preempt_disable() and preempt_enable() prevents this possible problem.

Signed-off-by: Jeongin Yeo <leo.yeo@luaberry.com>
---
 arch/arm64/mm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2ba01dc8ef82..c3da836ebe8d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -29,6 +29,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/preempt.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -2136,7 +2137,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 		ttbr1 |= TTBR_CNP_BIT;
 
 	replace_phys = (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
-
+	preempt_disable();
 	cpu_install_idmap();
 
 	/*
@@ -2148,6 +2149,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 	local_daif_restore(daif);
 
 	cpu_uninstall_idmap();
+	preempt_enable();
 }
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-- 
2.43.0


