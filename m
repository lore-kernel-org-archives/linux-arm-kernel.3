Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C072C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYZzRE39rM1i8Kn24WfXB8ZLiPdAdycC2kyj5f6F4So=; b=a+ngNuesGD4Q/Xs0gdT4YSqYtm
	+YvyV/p4aG+D8OgdTmDX+aXpNCJRv1h6oIAZ6StpX6pbSy0dyI12x4+RcHjTIezwGzcyj9WZQNg7i
	6jPxm0E79eiicOieMZZ2f4UWZh1N8f0J67SUmTI1rqTab2hkS/c5hyYI7uvEppE/luQGHvPg7kat8
	qsKNjJ2wSTXcurhe7o911efufMh868YGGXUtapkJzK2R2G1KSwXcNAvUTHvWWe5G5KIaGQ4IzzZ9p
	oWQuvvP2pdrJ/8JwCNkf10jh9dKIQa/fLQQZ/4XuJrF4XcoAtnvFXC8/iPwDrhlWk1Y1eVkQTXNKx
	850x/5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTb-00000007HHe-17DR;
	Wed, 23 Sep 2026 06:29:07 +0000
Received: from mail-pj2-x24.google.com ([2607:f8b0:4864:39::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTX-00000007HFS-1gUB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:04 +0000
Received: by mail-pj2-x24.google.com with SMTP id d9443c01a7336-2d747f05ffdso2557225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144942; x=1790749742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYZzRE39rM1i8Kn24WfXB8ZLiPdAdycC2kyj5f6F4So=;
        b=Vmp74xWC0dJcRt8vk8wToHpme2R44J17CwxNCu2YldZhf8ix3w7bsbizeJaqUup1J1
         FFa9GYM3zr/D5kA4zkeBqAe8ZJOTou3fWJcupeLvVwtGgA0i95DlcHYzoIGJcSt/7V66
         FOTvtSlWnIiM8fqKF2TMVv6B6au6en6XwgkmdcZuWCqj2ZG650RuHHYnQ/T8Tj9yBkY4
         lE5iXLhhUFb9e0/YFGkXTuwguNxLBC2UJgNwaDuDs7uRe1ns7IsrdaB2EAoTWpCAZT2L
         kOMcKdOSVHxCTHZ9tV3TmGHhkjfS37SOhuKMJ4NVKWNQLnpoc2d2WJRh0Pp5yLUp6uXs
         RkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144942; x=1790749742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYZzRE39rM1i8Kn24WfXB8ZLiPdAdycC2kyj5f6F4So=;
        b=ZypZzoH7gzrxhAIFiX0n7p30A4QhFVhowNi+4CYy58kEGCzgbvMNycRi59mjZ+pfHa
         h+ljnNSRtVe6vKtJGtMbfxulrSJtSL5BRHBHnQNBhSsOcqByIN62IIGvb2kJyXUCjXiZ
         dGnagbJRzfrQcCiGGjcpzVhKfbC7qtpXH28fBObw7a96n4Du7Rq3k1vqmgHZSpblP+9a
         x/IKxCSoW4geH8q+eOMYxgpmcCJOhC0TQjaV5b32SLTt2n2h+uBx4dHb0nETEUKZXkGD
         O+Ph+5Vzp/Gs1CfLw+l/TUGjMhXb9h9Ww8h78emhsSif7fWIXQm9FS9xDCor9uxGOpvY
         ZoKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxprAubA6giimQeMHGl2oPJTITadS89ltbvN/vlCsLv9378mmFQQlTzWp9WQ9SdQlfMyZlChKqLjycR/4mgHJzJ@lists.infradead.org
X-Gm-Message-State: AFuF++nhnTbOiyJ+9/Cnvmyl6eh6p4InMFld52bsy/sCKWz7u1O6Vybi
	iCV5AkZjEgMvhzYp0SaoVYRg50yzwmRabBBo3luIaQXT9CTW4h4QhV/7
X-Gm-Gg: AYBFou0+2gVrdotGuUITafsx0JLG1mE0hp2IRejG0ZIgC6SUSLER0T8JQUNbIJG1G9j
	mo9WWDegh/kfvgNxbbrpgmR87JnLFwcQYj9R3fB3J3EeFs7yRpZrcWOO2A1K5KkEBdvAySanliZ
	1te+TnD1VHPuu+29RCnngfrjk41GcxPtAYG7D2gyHiP2wlAW90zTWop2gM4j3rWzFzCu0tCkeAL
	YFFaoH3ex2VyiXR0TpVC0YNtqFQI7EWw56s7NykGyUqyMkVgkqWtl/8dG3l/T4tES91/RqJZ9PQ
	oC29BeXyCNIe7Hk5sPLWH36Nai3ychBr6mDip++X2PNXKj9sKIs9Wqr5pmLA4m4OVbweovFV15V
	aiHCkpIAyBdSlWJ4jq7f4xMOptjAnG+6eu3MmxGz/ef23PEIQIlEsYtxHP2wF7pNL6024Rb1N5w
	FcWp4lhtuq0V9BXu9UmYeiZZawNs/n4Twro86Qn+V8Hk0JrrcYsaZ1Q7Sjua8XpHcpStVV26fte
	0ekxXDovkxll9JdA8VzbI8=
X-Received: by 2002:a17:903:2350:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2df69d689a1mr14297125ad.22.1790144942400;
        Tue, 22 Sep 2026 23:29:02 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:01 -0700 (PDT)
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
Subject: [PATCH v9 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Wed, 23 Sep 2026 14:28:26 +0800
Message-Id: <20260923062832.479455-5-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232903_456996_8FBA29DF 
X-CRM114-Status: GOOD (  11.69  )
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

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
longer a caller of set_huge_pte_at() on arm64. The only remaining
callers passing &init_mm are in arch/powerpc, which uses its own
implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa6..ce247b06fe03d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1


