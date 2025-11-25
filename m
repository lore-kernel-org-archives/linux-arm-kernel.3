Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94CD0E6FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyGOy9S8Dgx3p1fOFeVjliRj4OQR+/ryvkd1Ganc0MM=; b=qn0D35nDXVbSNSxOxomZkw/w/T
	gsR/FsVO7AdFZupCDDwn1gnqmFCi+hYiOA7LMprWx47fX/RJuTjVkp6WHCHUIdemV3opkBxpZqKeR
	xwXgzQeU6OTK9h5r6lOliDK5ei8jjRfyQNSxAgVlwmEDkzfsgpZ4VW+fuUHOiW8L/IF5AmCYKR3tI
	I1jE5Zt1ZkuW2zfLlWjt+SpX4LXwvm7bD95EkzKWHDV9Qa3Jj2bXlO36vPB7ZOOpn1FGyyujvSyim
	UHl5uTTUoRdDNQ8ug1noF1O8yIC/cmRLwxbfVps6zCrDSOP/WgKTUuIMUUYoIdvXtDr0yvENdyLpJ
	AdvaA2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNujI-0000000DUKi-41bO;
	Tue, 25 Nov 2025 15:13:20 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuj9-0000000DUHr-2L0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 15:13:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dG5mB0VF5z9ssQ;
	Tue, 25 Nov 2025 16:12:58 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Date: Tue, 25 Nov 2025 16:12:42 +0100
Subject: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
In-Reply-To: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_071311_737902_1721C5AD 
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


