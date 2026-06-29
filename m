Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DCDC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KKnANHej0qWeKajL0See0PPtXToKg5SY7mQQxPEhovM=; b=wH0P31JMGQyRXbe9W/0Up1m075
	G3TlnB4Iua6tsi3i+oX6z4FSof3+LdBJHY3o0jJtB1kMkNbGqAfc77okI6Al7493s+FNMCeK1xLoL
	F+WxA+FNmST3XyPc6foVY+ibPLqZRlh0+GWY/4IaMwUJI6q7A8CuFVNO/zGaxeyAMvfoR/znSqHNj
	dpxAmF7xcbSnwYGeklDqD+tUkaeRillU3Ba6B6zA5iuDJmi9XNcB+ayhs8YCEq9oWUD40HKjfc/e1
	5tdN/4B8mxmu1E8ALaskBuRrf6txRXomc5jiD2IjXqjP1kwGCzPFITA16UkEIOkeJ48R14yluLmfk
	ZG0iszqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBLj-0000000EbHD-36Tf;
	Mon, 29 Jun 2026 12:44:31 +0000
Received: from mail.ksb-soft.ru ([5.167.76.63])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBLg-0000000EbG7-18lp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:44:30 +0000
Received: from ksb-289.ksb.ksb-soft.ru (unknown [10.38.22.14])
	by mail.ksb-soft.ru (Postfix) with ESMTPA id 4gpmDw48CJz4LJWR;
	Mon, 29 Jun 2026 15:44:16 +0300 (MSK)
From: Markov Gleb <markov.gi@npc-ksb.ru>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Gleb Markov <markov.gi@npc-ksb.ru>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Changhwan Youn <chaos.youn@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clocksource/drivers/exynos_mct: Fix an unexpected sign extension
Date: Mon, 29 Jun 2026 15:44:12 +0300
Message-ID: <20260629124415.1571-1-markov.gi@npc-ksb.ru>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 197590 [Oct 29 2025]
X-KLMS-AntiSpam-Version: 6.1.1.11
X-KLMS-AntiSpam-Envelope-From: markov.gi@npc-ksb.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 72 0.3.72 80ff96170b649fb7ebd1aa4cb544c36c109810bd, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean
X-KLMS-LinksScanning: Clean
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 10.0.0.7427, bases: 2025/10/29 20:57:00 #27800623
X-KLMS-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054428_497670_5F43C263 
X-CRM114-Status: GOOD (  13.23  )
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

From: Gleb Markov <markov.gi@npc-ksb.ru>

Due to implicit sign extension, shifting a signed iteral 1 before
converting to a wider unsigned type floods the upper bits with ones.
This produced an unexpected value (such as 0xffffffffff80000000), which
breaks subsequent calculations.

Add the UL suffix to explicitly convert to a type with a larger dimension.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 30d8bead5a30 ("ARM: EXYNOS4: Implement kernel timers using MCT")
Signed-off-by: Gleb Markov <markov.gi@npc-ksb.ru>
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..ab607dc99004 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -378,7 +378,7 @@ static void exynos4_mct_tick_start(unsigned long cycles,
 
 	exynos4_mct_tick_stop(mevt);
 
-	tmp = (1 << 31) | cycles;	/* MCT_L_UPDATE_ICNTB */
+	tmp = (1UL << 31) | cycles;	/* MCT_L_UPDATE_ICNTB */
 
 	/* update interrupt count buffer */
 	exynos4_mct_write(tmp, mevt->base + MCT_L_ICNTB_OFFSET);
-- 
2.43.0


