Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28025CCD1AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghmrnfvpmdVficormzFtjrdFed2w8rPM+q7JEBeD1F8=; b=SGbGIUy9MyyUmydfn69bmpa4yj
	RopO/GYQOKmAKxxzBvoEJwnlMWNjsU/XZ9HCxFWgy0nH22mvYOM1OFT0MkXTKlp4UtKHR8AkKwak5
	NkcgpUrz0nrpNj7rlkqCYmCODGDZcUzP5Sm3aOgfFSibL53A9NQRZQYAjj40zLz8XAvNTS3HZxE5i
	aVrn43jmiUgb1BYc6RtTYAuuWWaLMX6GaTnIrc90MYrt9oGS5NJNZfYYRHmaJy5eVFonNvxDXbk2J
	PCLOhEIbabOWu2sZxUNA7+MWxE7zcKELDfpp/eq74HByrqxwBbrmpQ/aV0JRHeh4E3WY6NWNo0+dA
	AKNIZl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nZ-0000000Fq9A-2vAo;
	Tue, 21 Oct 2025 05:20:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nU-0000000Fq7j-02i6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 05:20:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA446175D;
	Mon, 20 Oct 2025 22:20:26 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D9943F59E;
	Mon, 20 Oct 2025 22:20:33 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64/mm: Drop redundant 'level' range trimming in __tlbi_level()
Date: Tue, 21 Oct 2025 06:20:21 +0100
Message-Id: <20251021052022.2898275-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251021052022.2898275-1-anshuman.khandual@arm.com>
References: <20251021052022.2898275-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_222036_085659_792B1F0C 
X-CRM114-Status: GOOD (  11.10  )
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

Page table level value has already known to be in the range [0..3] before
entering inside the conditional 'if' loop. Hence any subsequent trimming
is just redundant and can be dropped off.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 18a5dc0c9a54..131096094f5b 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -110,7 +110,7 @@ static inline unsigned long get_trans_granule(void)
 									\
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
 	    level >= 0 && level <= 3) {					\
-		u64 ttl = level & 3;					\
+		u64 ttl = level;					\
 		ttl |= get_trans_granule() << 2;			\
 		arg &= ~TLBI_TTL_MASK;					\
 		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
-- 
2.30.2


