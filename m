Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A6CCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=; b=jV70uOjtS0bntUdDv2NTM+wDOG
	wdW7QZ7XO7MNXDEyK7ePAQd/F1HAUr8CmLXesjLYfDaGJzuNtcC7uPYOBu9wSSy9B8JJGOGkMzoHf
	dIR74SeECggxwFCv8BkACM7a9xwRvKd0YZuqc3pJ1X/Fo6o1MdSESMnQY7wC9SiKX7pxGLD8jHyN1
	EMY0Fy9zrFuF7HFTi+LhQ15d57HM3qDA4zFw9KNH9a2kL3rtr8bR46igxMOOn1pXmU3uUxun5n2fp
	8Mrz0jGBZEpkTbpElurqZdjYvPVglmJrtqLgHgvY8NTfZhcurD5oomxH2Hv615lmZmqGTryY8+oSG
	Qd1hI3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEian-00000003kqc-09ZS;
	Thu, 08 Oct 2026 07:31:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiak-00000003kno-1kuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:31:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so175731a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444661; x=1792049461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=bRoGoxtPyKR0PvdfwHnniioadE5t1dkbOCvJUDeHLk2ZLCbQyPpJx6eSQJtfFUALr6
         qHbXc0DgMoOnaSri0Btz8RkIN2rSLU2Fiy/mdOe5meoILSSgm7TQDHZjPnB1Q0ky1xLb
         rCx43i7Y1lpbzQJDmYlOFFXESE4rcV5u9jFPuNI6kctzsVBheqMG0FNlEMBge0C7kdVs
         vN2p70PpkPuR8l3dM/BD2TwcC0RiYBHpfheDdY8TKMBv5/YF+CoxZF6eFwQ/tWwdvFaG
         4rakf0U5mZmptlDbvzyJbrhkeauSfWW0AZd+x5+6TTAFCy2i1PuOLYEVbO8v2Du1ilDq
         DWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444661; x=1792049461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=veXVIhWLShqK+xpS5znoiWOt7QQg1MYoArdj4KVsSdcpefZNR5OMDS/zirov29uLZW
         +OWVU7AJhYRsmP0zYlO5tM2iF+v6a+KL9FV8KMUDhnBMTDD7Wgp9assdXA3W7NASLVaq
         y9yHRPf+Uwm9xQ7nDhoWk//4JWKwcSs0DIZlu8pIoJ98VGIQ9CP938mCjazi3Bsf+I1A
         pS+hMXfWysXUJ7jdixSu5o5eB0nFVU4t/S1zDq4sRveufHjmsb03b3KZ07IHuiTV0zw7
         r4Crt1haF6bh9EZyxA5BA/ilQ63HRr1dyLRoy0hPLC1nW4wvjFqPl33ses1U7wseRi4M
         y5NA==
X-Forwarded-Encrypted: i=1; AKwUvBwH6EKu12SYM9q1c7VA521k8O1XO/ja7uKAu0JV59fNGJ3adtDX44vgqSl76va1Tmudk8zKCph1hK8a9k7yslgx@lists.infradead.org
X-Gm-Message-State: AFq9FYIuzLUNlnjqVr8Jv8RBUR+HiMsu40miVSuZTmVfjsJhiE2krB5b
	p82m6pVSTomyzo7QemQBP4YQ9r8q+Pa3uZ6nw2A/3W1yjR2DN8SPztadNou0X8PnJXs=
X-Gm-Gg: AYBFou1aw13ob7UdDO8TkvMORGCjXToEOKasIewdD6e6woc2PxkPXigtvfSGjLenRR+
	obXkP1TNKAvOddAgKVLW4nvjuFldpgich1HEWWOP1jLLhPcwGLtVizkPO8XdnP7QVEK+YwKoJc0
	ihwGwLrkU8ihLZAZRT1H23aOtlu9w43gfWT82LDZF51uOwvhjU+qy/r53tHx7BUSoozo8ag24q4
	rSKxRf6yMnhu9zZVymvs18pJVvSQ0LTPSHQcAHWvKuHqImQsIhBGCE+VpSiBh9x9G2rpEBCvE4U
	rOt88qdArLn8XYp1CyIX/GBLKioqDVCoss/fArk+F11vHcJ9wctzXIjp4dE7U5D9YT9SW4lwSvi
	RMnEFoO1KJjuoN4+nCJX/WRLxCzfUxtbdBd8zSSAN+TfFPLVG+AZ454SIg8HmmGrY5gEki0Pm66
	rw3/1V1f+Eqk8Npx7wn5bryoJAdIYk86DzNtU/wkXVnuIyDjJ/XMeG1uKX/3OPOXPAOVBVAQmHf
	CShHikay1tpI3E2q+E=
X-Received: by 2002:a17:90a:610:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3aadff48952mr575784a91.8.1791444661248;
        Thu, 08 Oct 2026 00:31:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:31:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Thu,  8 Oct 2026 15:30:21 +0800
Message-ID: <20261008073021.2512665-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003102_457849_D2F91222 
X-CRM114-Status: GOOD (  12.20  )
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

Use PageTable() to run the destructor only for page-table pages whose
constructor initialized them. This keeps the arm64-created page-table
lifecycle balanced while safely freeing constructor-free vmemmap tables.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7343ac9294f8..688b33095651 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,7 +1495,8 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
+	if (PageTable(page))
+		pagetable_dtor(page_ptdesc(page));
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 
-- 
2.54.0


