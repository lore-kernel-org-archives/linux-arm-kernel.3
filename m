Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC49CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwX2V/6o0Kptw/VlXJ/4Jp9bBaiXMijAHR2YrE2LL1c=; b=jE5tEUPqJz4sodC2FTTZjGr0Es
	nfGi95jv2NRd386dycf/LXCu7MCsRZe3Fzlyt2OZ4ooJuwQgSleyWgxnEvzFZBbGXhbgjwBtIf2RA
	O0E5NHvB9QJYMMaCSAdY8NkFIsk/JsuDc7fZ25kSOif5gIm9+b0LxHQn/qigJjpi+OcZsuweQDL28
	hkL+a/kqarVr5yOVdHpkqQIcEaPMcwBw5NCYu67dA6LD46RIdEXdZjhxik4guQyC2BwpOhYOJ9sA0
	51SaN1AObU07l9xQHqsOCU+XtjI6LTip8mkjW4UknFjvQVrZCjXquXIhRr5vgXfDAIFzo8JbYUz2i
	622+maPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDg-00000007uw6-2qQR;
	Sat, 10 Oct 2026 11:26:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDd-00000007ut7-3erP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ab98332238so100767a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631585; x=1792236385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwX2V/6o0Kptw/VlXJ/4Jp9bBaiXMijAHR2YrE2LL1c=;
        b=cohJkVwvNdZG1N7z3IJlT3eGBlqqAAki52Y4/1p+ylmWxNxyprkM4LrZxytOM6n1mG
         63WVFhxSgSEo/CBATTGei2BYe7VB31sR5aSbr16YF5RRaHcx0+ZUlQU7r/U0TjoZg1+h
         nzwr6mDbf1NOCCa2Y4zO4SOQVIQ871wcocCMmr2gHJA1YgoHKBYSjZLml74j4zwzKVFy
         hC/LHhIrrsHX0ZUicZuLoBQsyp2EDT2nqMh9goeRgW0a8BprLsFusuzB/LAOOcbXrBTV
         jhse5xctu4+OsqQHl2748GGWbK8WD1yzORkR/PvHhTDebXdalHWx8IMYqfj6YmkQ3llC
         HfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631585; x=1792236385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwX2V/6o0Kptw/VlXJ/4Jp9bBaiXMijAHR2YrE2LL1c=;
        b=qYNbiOxtbXmS4DgOr6HDJHAQ6fEUayWCmuoZYoaWtRy21ss40ZdICyaI1trPrt+qlo
         Nin6Sj+jlW8OZlsa7B0AZ0ubSTJw+e0K6SQ6q+tQrBOc/M7HUx5KUgFYPuuv7htAWi5e
         87ARrdPPTIpk9ikkiB2UD/39KG1i7zdL5+NCLWSTLnKnbIxVFLSg73XEWnjV8xva9Y2p
         XGo0EFWMMWbMPZtZ/F8xFAcmSmcBmDvhFZAWNHB0hQmZuBetjwIFf3+deJ4mI5EJW1fR
         VqdyYNTNrURfzQecrn9As1DBlnBoR4S7lakcN4/7gxlvt+AfSo1kfKWB73BqE2RSvmQk
         H1pA==
X-Forwarded-Encrypted: i=1; AKwUvBxLgwhmCoM2niQITIA8nybfWPzWeWa3iWyOM+g5OTnBri1o50niApQxHPsCPMtAX/J9msoZxeR10Qy4zHhuy7WK@lists.infradead.org
X-Gm-Message-State: AFq9FYLDvYp85KCqTa2pf9/kWL6YdV8e43tl+qlMJg1enSkwK/oNekDo
	zNbrsCZZ68Hj/SSt7BvcMyn2isMOueiMplnkba0otFytsJ6CX8AW1MMFFIn2CjWFIROLzwyv7Qr
	glL8+dHsNMg==
X-Gm-Gg: AYBFou3hjZ34Lj1m3il9xa/tP8ugZcJeHY0ABzSSxpCOokFAGXnWTf9es2y6Wn4aM3W
	V+agDjPf6nbDTD33KUTFvUlQLDuaipmoc+cf2e1e2jnPhubFvvVdxMvotdR6dkDRIMyaajn+HKa
	o5l863koWxLl9KKwkI8ryve1caTJUjZb5Ri2Fw6aFqBBCeY13wIuBEZ6NXjn7eO/pmly0aAqrFt
	7WZmYeU5kwxJoJ590VMFAMvdovs8lpYAXMZJT7C9n79A3sHe+5Ur4PdSgPETvfXUr6ryP7XILmb
	D69aJpk6LqMR4Wb4+ZoeNHGoUMkoE33pDz38t7hQ4BD3fgTpLFxNmhVck+93obbYp3c5081NqDj
	cXSiXvw12Ki04LsxOkiURj6dparZxzaq+dNBR7y5VAlVEF74kfT64RRhfy6RbJxZCGF6Bf/zqCs
	lxGVlwPm8XspWFEdF2IS2EaLlfJPCgo30ZGUnfOwPFzJwe0NBsS1vLeF7kA4bOUbLGt+veHPYCx
	eBKa/NAVUJaq5L58OWmARFdmhSytKbKqNF4KQ==
X-Received: by 2002:a17:90a:e7ce:b0:3a4:ef4a:4f12 with SMTP id 98e67ed59e1d1-3ab3b01ccf0mr3608742a91.61.1791631584895;
        Sat, 10 Oct 2026 04:26:24 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:24 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Sat, 10 Oct 2026 19:24:57 +0800
Message-ID: <20261010112457.49485-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042625_931349_1FFADC9D 
X-CRM114-Status: GOOD (  14.23  )
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

Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
hot-removed page tables") made free_hotplug_pgtable_page()
unconditionally run the page-table destructor. This matches page tables
allocated by the arm64 mapping code, which runs the corresponding
constructors.

However, arm64 also uses the generic sparse-vmemmap population code.
Runtime intermediate page tables allocated by that code do not run a
page-table constructor. Freeing one during memory hot-remove therefore
runs a destructor without a matching constructor and corrupts
NR_PAGETABLE accounting.

Free intermediate page-table pages through pagetable_free(). It runs the
destructor only for constructor-backed pages and then releases the page
through the page-table freeing path.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Free intermediate tables through pagetable_free() (suggested by David
  Hildenbrand)
- Update the commit message for the page-table freeing path
---
 arch/arm64/mm/mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7343ac9294f8..26a8c665ae52 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,8 +1495,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
-	free_hotplug_page_range(page, PAGE_SIZE, NULL);
+	pagetable_free(page_ptdesc(page));
 }
 
 static bool pgtable_range_aligned(unsigned long start, unsigned long end,
-- 
2.54.0


