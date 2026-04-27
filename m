Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34CDFF886B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc51wPzk67h/KJWuIdvgej4c5wVXm+tSlcwLrREqPXw=; b=cTpbnoGaVgqQEebP3RibuNmuNP
	UiRd3f219uktzbHQRoMzkQmSN78FZvcnmlItpwUtA/mId/WuuTcWUcumOC9+4FPM8ecs6a2M57Ifq
	dttNlal1BNacpC1UCEZGYomdWRN4tMy1A7Gb9QQHajPktxkcfecEqDJF4RX3yh9JCKJC5Q8Zm345i
	OqtdBZG70YIQu/5q9KGA4vJNEVCapTqD6QhZgxqS817yQJR84V6gTDrf6bYHvBCuBvrcTNSvZT/bP
	sEl/IE4z/ca5uCizmokEAiHuLMYAKn5xT/V5zHS3WDnoZLaKZJ6lyfs59p3SbJW9XK3xkDxTW23R4
	uaWP+sUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzw-0000000HCVk-1b7g;
	Mon, 27 Apr 2026 15:35:48 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzn-0000000HCQD-2DXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:40 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so111412265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304137; x=1777908937; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc51wPzk67h/KJWuIdvgej4c5wVXm+tSlcwLrREqPXw=;
        b=EgBpKn8/e4+BlHuPXzvMLt7Z9jGndOF+WflYM1eYRJYi7Jzl7CtFLKbMBgsScXntrD
         kJoAlE/VgWK6Pb5M6hLCwd7HKNkyjbQiXk4P0BdkNHugxp8pwIN5edfO/sYrk/WehXbb
         FDojzdkh+yCsV99nnBaAZVY38v54UPf7FTTvaEB6gWMtw5kmaMYvDPdqtcdV/DsT8VEP
         Vgmi3NdRaaJ/j1kwOQVW3/4U0NJeujmRA/JiNEGvMgytx9vC0W/FTGF/m8mB64oNWb44
         /QgOUBxVW7GFrDCSSxEFSBcbyxV/ekoM7+xf13wk6RYsOV0eOZdmmI10vmrR3RqN6OoH
         rZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304137; x=1777908937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc51wPzk67h/KJWuIdvgej4c5wVXm+tSlcwLrREqPXw=;
        b=a0GxuAxxNhMgjL4vuruxY1k+hmWNN+H52KzKyFNUaiHU8xy2PuUAwUy1i6G4ublmfq
         xeQiGhENd46axiGJ0W79xrLgr5GKAtjsOzhO6oI1yv2rQFnjxsTHSEmCQWkeVQ74HVsw
         EPSXLymgkfFfRw2HT6byJ54XZEirCyvkB88IPMg1DdGD/JGcU58n9eEZ23abs8rgfUHp
         kfbUUD5C+XJ22aQevmTGFJ2C62n5sFxI5r4X6UjO4E7CJczYJRM2+sD512h2QNNluqqo
         HC9gsm030XIYHICoVmKS5FQnDcELPC+/mwfzlf8hOXf/c+eM02v6Ovet7UoDFEDjt+Ff
         chmg==
X-Gm-Message-State: AOJu0Yzt/R9PNEOWqXXPXPm99j7s1v6RVTyndFtc5/RR4NsM7HbR1aca
	YA4mBgKgdhDAgZeyXwy7MteDRi/ArnAkjFCu3BAl4fR7RX4NFtNMCkYKgI99TG0IphfiOXQqf1d
	2xDj3SPJOPo31m95GrFKxcRKAjjobYvWrPOAzUA7vLj0RFdY/ahmTx+MsB5YX9YoHGFBWsQ/fT6
	ybfx4LvChGGWp6oStfrTUss9f0tcYHNojDNDIVMPNi4+Nx
X-Received: from wrrf15.prod.google.com ([2002:adf:f98f:0:b0:445:9b34:32eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b14:b0:48a:52d9:54ab
 with SMTP id 5b1f17b1804b1-48a52d95604mr460176645e9.30.1777304137397; Mon, 27
 Apr 2026 08:35:37 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:20 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=ardb@kernel.org;
 h=from:subject; bh=GHwWYq60lqNuozERz0S434bqDfMxYbnUraaeSVA3Tn0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN947/7X8wOXuLePiOp7MONnvXiUl5NBamL377hk804c
 tjhpENeRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI+npGhoWiYueTlCv3njc5
 eKI4u3WiW9EuwdunmA+vma0g5vHDOoKRYavEAeGovTdWuwnO7aw0j1t2v8qU20TqZU3o42gvDsX t/AA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-20-ardb+git@google.com>
Subject: [PATCH v4 03/15] arm64: mm: Preserve existing table mappings when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083539_576650_336AAB93 
X-CRM114-Status: GOOD (  11.52  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Instead of blindly overwriting an existing table entry when mapping DRAM
regions, take care not to replace a pre-existing table entry with a
block entry. This permits the logic of mapping the kernel's linear alias
to be simplified in a subsequent patch.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f084993024ab..801a54ade76f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -256,7 +256,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pmd_table(old_pmd)) {
 			pmd_set_huge(pmdp, phys, prot);
 
 			/*
@@ -379,7 +380,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pud_table(old_pud)) {
 			pud_set_huge(pudp, phys, prot);
 
 			/*
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


