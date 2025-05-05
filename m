Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxOTvBJSPTKSC4gcJweXsZ5Vb0u0owvlpp2W/2Mc7H4=; b=SMNZJsf+aT71WLi0JcCGdmKlU3
	hf+Lpv5n2bwJTODlkLdS/BdMZo4O5Sofe6t+Yi21eNEYAJ7xRqZpxcGbRsEvBPervRXgXfYN/VBTW
	j/caDRhy7J/e4LPHGolWp4DknmqEoSrKxJwTjiWQw3wjvP0UbftXegiRNrrL34aD1HKjydxvcngIO
	1BjQdNnHeg+rN3e9uo11ydpiodHCLPvT5Pyg3S6NcYOuchRAb/yj8349EEapH17wjyJRbwZxAEbBR
	NwQNidG/BW06MYuYWi59Q+tlFmPNO1mwKWuVaHFgcGhfPQyUUGLelKMFwX6+6gYdBoHwixOOobuS5
	4SBiYlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9kX-0000000AB3t-40yM;
	Tue, 06 May 2025 04:17:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC51U-00000008zdY-2tuv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:14:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E523A4D3CC;
	Mon,  5 May 2025 23:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8A8C4CEE4;
	Mon,  5 May 2025 23:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486895;
	bh=2XFm1n3rp0v8R1kDBJ2wjznnUIXVrgdlFCkBNUHrBcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQFn+DDOASPs/4XyCfqkgqUGSpPqqXIfM3CjF2KvnucaKb3V6I97Bo6yaiy4T3awD
	 tq53l8uKbz+L0Fs7o3pMOTXfUij9D7UHCdhAR3lcIurOpnSPGNw1VITR/1kmF99GpS
	 GxNiOZyMvTBGrqPVs4ED821EfXCX/I82HCnS1RSg2h1fFiu4yDK7A/ZZ2HcMXUe74x
	 9T04afWWMxgYJOjLQvOTFQfAgMn+xN6Xvs/xHbjBekcBHnRE08XLsg9aTfGunFDN0R
	 i3WFXISKJgjUMfRbSJVHYRvbWN3Tl2lxojroEOcnw0Gq1OR8eNUm0wvz9fNdUClCGe
	 QnTWEcqGblWyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	ioworker0@gmail.com
Subject: [PATCH AUTOSEL 5.15 049/153] arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
Date: Mon,  5 May 2025 19:11:36 -0400
Message-Id: <20250505231320.2695319-49-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161456_795880_E145643B 
X-CRM114-Status: GOOD (  11.83  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit bfb1d2b9021c21891427acc86eb848ccedeb274e ]

pud_bad() is currently defined in terms of pud_table(). Although for some
configs, pud_table() is hard-coded to true i.e. when using 64K base pages
or when page table levels are less than 3.

pud_bad() is intended to check that the pud is configured correctly. Hence
let's open-code the same check that the full version of pud_table() uses
into pud_bad(). Then it always performs the check regardless of the config.

Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250221044227.1145393-7-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b5e969bc074d3..a0bfa9cd76dab 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -623,7 +623,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	pr_err("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
 
 #define pud_none(pud)		(!pud_val(pud))
-#define pud_bad(pud)		(!pud_table(pud))
+#define pud_bad(pud)		((pud_val(pud) & PUD_TYPE_MASK) != \
+				 PUD_TYPE_TABLE)
 #define pud_present(pud)	pte_present(pud_pte(pud))
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
-- 
2.39.5


