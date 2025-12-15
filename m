Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EFCD5B17E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFzOzyIaPF/BcHj43WHLeZAy4MfnB9fPo1lRxZ2QE7Y=; b=GX4U0QczGtJHrvtldPIr/hHKfU
	w9ZeHtXYagjw4lCOct5rRq8BNkFNytPBdleM3JkLhB9+p8bBUsHyqEKlRRMHKHkSXwBMgR/BFAI2y
	niSXEyr5Pg8iV9HoJygAZHlCAfV7eblqxMlhje9okI4WZJY7PIEMTXARJfxXdgv0RDOag7wnNv1XE
	edTDGNwxINl2/zM9ix693cYSOu9Qzb/ViADyOfKX7hfQBDVJPki2PdN2lB2LE7phboD1MOLZvjooQ
	S+mTUF/k5bk7auG3ZFhc1WHsVQjoXJjHfOUp/0mw9frEc8tqZ3wtNBsbzcD4j0Pp0F4+2brUn+WiA
	hJZhvEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA9D-00000003rWO-129P;
	Mon, 15 Dec 2025 15:06:07 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA95-00000003rPl-1kWj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:05:57 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dVNfj3xxBz9tkJ;
	Mon, 15 Dec 2025 16:05:49 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Date: Mon, 15 Dec 2025 16:05:24 +0100
Subject: [PATCH v3 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_070555_676982_90B332F2 
X-CRM114-Status: GOOD (  13.73  )
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

The firmware trustzone needs a special call to bring up the secondary
cpu core on the Manta board. This seems to be not needed on other
exynos5 boards and comes down to the available firmware on
a particular board.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index a5e22678e27b..e9b0ed07bb90 100644
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
+	    !soc_is_exynos4412() && !of_machine_is_compatible("google,manta"))
 		return 0;
 
 	/*

-- 
2.52.0


