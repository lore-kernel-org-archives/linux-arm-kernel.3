Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88037E87846
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+pt4l9TqYWH/T7Do6Ju41FZVudJ0+eKxlOUber2la5k=; b=Qaz8jT42NIyXnr7XDiLqVk6OJs
	5m9KI/c30CuD2C6/kFMk4hNMp9+Pwi77Vk+GflZZLVqseRsdg2YIN4oWri2riklfDha+Y55mrxxvs
	uO0HaERVHh/+sFkDLb3OJ2ELEveY6gAYYMrQy5AtsChD7d3Ro8CacP/00PmRn1wIqiFweJuQ1gNDm
	hG5NwcCWz1k336Yvt5RxMIlB9zWL0qefQ1VaG+uhLjh080ZUn0dmokQAmuYRkONjS/S0+7qvn8khH
	cD4P2Cl3UTAYM/kqGOkbW4Dvj928vbjMyTEEp62J0PozcRv5mdE3LKLYUgi5zmUZOE566qQIV60b6
	URq7u5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJA5-00000006vzq-1LG7;
	Tue, 03 Feb 2026 16:21:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJA3-00000006vvL-0HVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86CB043E55;
	Tue,  3 Feb 2026 16:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96454C2BCB5;
	Tue,  3 Feb 2026 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135712;
	bh=2AFdDEf7QhCVAOERnKLkWf9FkQj67+3j7cGqYpQNlww=;
	h=From:To:Cc:Subject:Date:From;
	b=mzFgH3Od60+lezk1h5xO4qYAV293+Fmyk9bqj6PdjgWSaURnU7nTd+Mu7RMeaNJdM
	 Mg91/VT54F+fhhyjPSTGTHtDCuWaJWSFcDSdwqH1wsZPWpu+j8ukRpA+TS6E47uZqd
	 do+3HgbjAsAPNFEjhZpD9+Q7CNIdFZ7fSVZPOBG9BpsPoZLQNrnTz8kX8UDAnzlP4T
	 Hy6cn/0aE2sQ7Jr0rQhZ8ke4mFyhlclppBXEHwBcj4hF98kLa2lmaMNQjNME9JJezd
	 ts/1N9KVCKNc8dHt/SBjh4nrmyBB5FQAhWTatxhYtVi9GHrrnVyBw4uGsK167WBlLj
	 p8LLawLOE5RhA==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
Date: Tue,  3 Feb 2026 17:21:23 +0100
Message-Id: <20260203162147.2103175-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082155_216507_430055CF 
X-CRM114-Status: GOOD (  12.93  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 warns about an instance that older compilers did not:

arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]

The issue here is that __pte_clear() does not actually use its second
argument when CONFIG_ARM64_CONTPTE is disabled.

Reword this to compute the offset each time instead of updating the
argument variable. I checked that the resulting object code is
unchanged.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf5640..4ad7662e8323 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -374,8 +374,8 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 
 	ncontig = num_contig_ptes(sz, &pgsize);
 
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__pte_clear(mm, addr, ptep);
+	for (i = 0; i < ncontig; i++, ptep++)
+		__pte_clear(mm, addr + pgsize*i, ptep);
 }
 
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-- 
2.39.5


