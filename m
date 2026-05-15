Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C1CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sf1F0/C0m7vbnS/gpjFl6eVZuvQ+HK16qEk1R6APd5I=; b=OSfvThX7NmNBIdl1kUtzg/7EaZ
	lckaTGU59GXTfJl4s/ZK4z3TXN2mFW+VUOpnMGeqfdHExDPic5DdyFnK6cUU37DvAKm6jK0ZC1Wuj
	lt0QFVs6DQDv9DY2FCf+WOPITGFycbcUTste/ew1Iky8SQwXzl1I1nbUkEh7uYksUQMu1IYlGypQg
	ZBQLbHXPv2ghyFM1pkmaWYPwerTWVM8LGzsEqLemwy7y/oyI0dY04A79je1gBfJygvK9WhyE7F0PA
	M8yGHHsWNcwHveRr/Euh5ekFRbfXzP/NkabojruwHT+NfQEaUkWfbbmn884Auj6x47w2L2ZT/0TZp
	vpXnif6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsjk-00000008SuC-3zod;
	Fri, 15 May 2026 13:37:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsji-00000008StW-41Sm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:37:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2266327D3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:37:47 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D23153F85F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778852272; bh=2j8jeCXFUoYsOFX1hD6wuGvMBsdQ39Kjb3acDVAV5CY=;
	h=From:To:Subject:Date:From;
	b=aC4jBPQAkmYCrDwDArFi4NZgi5l7Js22jU9FwVjTPRfMnBHadnRjSZy9N8FavV75p
	 3iK74HYluDgr13ter3FTJydjz16bxzJMRZxQaHNjP7TBnklrFyHGcm0pPyjhijdnW3
	 2sizL7tg6xDWSqQuP+YbT1UynBv5iStWOYCoS5m0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: probes: Handle probes on hinted conditional branch instructions
Date: Fri, 15 May 2026 14:37:29 +0100
Message-Id: <20260515133729.112196-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063755_041994_15519D3C 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

BC.cond instructions introduced by FEAT_HBC cannot be executed
out-of-line, like other branch instructions. However, they can be
simulated in the same way as B.cond instructions.

Extend the B.cond decoder mask to match BC.cond instructions as well,
and handle them using the existing B.cond simulation path.

Fixes: 7f86d128e437 ("arm64: add HWCAP for FEAT_HBC (hinted conditional branches)")
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/insn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index f463a654a2bb..cc0702fa64a7 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -409,7 +409,7 @@ __AARCH64_INSN_FUNCS(cbz,	0x7F000000, 0x34000000)
 __AARCH64_INSN_FUNCS(cbnz,	0x7F000000, 0x35000000)
 __AARCH64_INSN_FUNCS(tbz,	0x7F000000, 0x36000000)
 __AARCH64_INSN_FUNCS(tbnz,	0x7F000000, 0x37000000)
-__AARCH64_INSN_FUNCS(bcond,	0xFF000010, 0x54000000)
+__AARCH64_INSN_FUNCS(bcond,	0xFF000000, 0x54000000)
 __AARCH64_INSN_FUNCS(svc,	0xFFE0001F, 0xD4000001)
 __AARCH64_INSN_FUNCS(hvc,	0xFFE0001F, 0xD4000002)
 __AARCH64_INSN_FUNCS(smc,	0xFFE0001F, 0xD4000003)
-- 
2.34.1


