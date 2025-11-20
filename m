Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6809CF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh0QRQMP7j7jtaQ0ZUuvGXMi8I/emcsmn409389at68=; b=goVUkni5GM4nE4tR41zTcDZxYq
	/Yx4V7eGuKOMqqLXiXWaDaoXuaFs5zI0cq5LjdN9gy24yZnt0Dgj7WcuUW1ZvaeoxjGO6u3ZaCTqo
	YZ671EYgeiVJeWKo3t0KaJBnifrt0fHJ6MAsxinky8L04OCB5mhWH7aNNik3WK0NX4AbwJvimLXsc
	bMMSv8yKArKC2/GVk6+4VK4aBjKU+ogObKz9ABJN6aKLDUGc2CEGdEVbDorJGNMkSZgKnjmDrx00Z
	cSKhOSf5wkV2l009ZqaseRYdJIwzGZVWGCij5BDAR2ThJMmOPCDACET/MdOEBZMwvRC7+pafp03zJ
	kjAWxwsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5sz-00000006roh-1BVu;
	Thu, 20 Nov 2025 14:43:49 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5sx-00000006rmV-07np
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:43:48 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dC1Lb4PKGz9tx2;
	Thu, 20 Nov 2025 15:43:35 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
To: Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Alexandre Marquet <tb@a-marquet.fr>,
	Lukas Timmermann <linux@timmermann.space>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Date: Thu, 20 Nov 2025 15:40:16 +0100
Message-ID: <20251120144018.961604-4-linux@timmermann.space>
In-Reply-To: <20251120144018.961604-1-linux@timmermann.space>
References: <20251120144018.961604-1-linux@timmermann.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_064347_209207_C512DE59 
X-CRM114-Status: GOOD (  12.23  )
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

From: Alexandre Marquet <tb@a-marquet.fr>

Add an exception to let the secondary CPU boot.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index a5e22678e27b..80e645b4d338 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
 	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
 	 * because Exynos3250 removes WFE in secure mode.
 	 *
-	 * On Exynos5 devices the call is ignored by trustzone firmware.
+	 * On most Exynos5 devices the call is ignored by trustzone firmware.
 	 */
 	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
-	    !soc_is_exynos4412())
+	    !soc_is_exynos4412() && !of_machine_is_compatible("samsung,nexus10-manta"))
 		return 0;
 
 	/*
-- 
2.52.0


