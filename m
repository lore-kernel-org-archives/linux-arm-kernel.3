Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baNPOtnreWkoR3AhhTVFf+uOWjoLtova69oE/tcCCJk=; b=4dSqw2/w/I5xatr6zy3CxGQRqi
	5MTaMNmg3oNHlIAQ5Mwga/vjLwBFBewojX8F/s4S6DywSPDzbhUQ7UsE6ocuXVU/TuhGu6U4R4MgE
	80+KLKrzcCEXdVCZgbl2e5HfkSpDDo1kxpbhBOzmFywNeQPamMfA2TJp2Ca8VX+VjBygtnnvunXb8
	Nwgji+Oyw+LrX3ah+TPghQsgnbZQt11q6xSSPkL9Zbnn+6Awcu0A7oAeKLbIzjF+o6pf6tOws8tIZ
	WO9+c2fNAU0ou4zh2mXdZdNQnvEJSy5V+poZ8LeitH+NMN+8VGjYeeTqLPH3uEDMC/WbJLPRlOxiR
	iM8PiFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xW-00000008bKo-1Ysy;
	Sat, 04 Jul 2026 17:15:18 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xU-00000008bK4-1G9f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:15:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8475eca3a66so2302525b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185315; x=1783790115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baNPOtnreWkoR3AhhTVFf+uOWjoLtova69oE/tcCCJk=;
        b=mHI4EjS++PGmBnGbhrOe71fKi1szrO94IiQEpkTOwLCMnUEwvUymgfcQUyrkO90qOq
         uD3DfRXWnI8Ceb1V4FFQhkz00BXucoVUUKd83H+F3z5EsCO18pHlyszaDrT7iUF5252N
         vEJcPnc8z1QWT49Z3YENGWstmAsWtOaoWEW1oWaqRDzZcykjexTmiZ0KK9DurctPQ6oH
         B9XBNsqcIMYJCd3egR+7xOA64VoyKK6XGH/Eqv/pE/yiLQjR/Y32Vd2C6acQ6r7LWOJ/
         v/NaRDm2YSTcCjsxbeJ4+SJvm3SaWKcFbiLAs2HdjJriXGsFthadcusUG94KtcrWXvc8
         WBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185315; x=1783790115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baNPOtnreWkoR3AhhTVFf+uOWjoLtova69oE/tcCCJk=;
        b=Mn0AxRYRNiJq+drUy1+RLvNNt09R4iQ6TskJMf5s4zIL2WkWmFosz4dr1trrO/8Wi3
         eyKgpF3I4LPENR+LF+hqsJc6LuHOwUHLwC2w5OuEWHNLHR3YZa3brLj0+uwQIBgkllSl
         N80597YNqB+5rI69OBc1cWpgili48wZE1OjPxDX9sUgTmO2OO5gCEmAxAiozJc7KY+Fk
         n+d/t56BEF9TsAtFVr+PSolRBIqo6+vT11b7eP+/KXeAnvbwDcpbdJgjhSFBDoa8VQDU
         2A7k+X/w/tbeinvxosOSTn+z3xytHNJ5X30rGaCvke2/MLqiVrG5Y52yTyUPPngHr7sa
         XFwA==
X-Forwarded-Encrypted: i=1; AHgh+RqhzenyN86RDCLCnxWuy/2Mj5ey40JhBM/GbU8Sf7B7/2JtexqqcMqs8n1/QcoA66xyQCYQ9G/m/UCKM6gfj5Wz@lists.infradead.org
X-Gm-Message-State: AOJu0YzwM42W0D02nGpwclFqqd4UJCZ44xPM9YNzBAsiu75vLuxixTV3
	fa1gnkVkpkzZNLh0ePpRWECeGAyf1+4Ag2b9AOSf03ZgHEhxCx8amXj3
X-Gm-Gg: AfdE7cntlrKFp4mXB5GLbJ2nGvCoc7H72msxWHa6VwfI/viWCFPeGn1RNl/8utUBsU0
	pLAwCChF5w+Ehltje8Lb5XY3EhE8qIXWGOtwMnFd1tHwMy4QLEZblEAv3gwGXXF/JrGQmFLxnJu
	16IbXLUOhHG/Z5G1SCbGXl+e+PJFOVqmaR0WBPRHw7KwwRHEX1YOShwk0al8GPvWvWGX2f0tA/V
	XbQoK5K5VgMRrqYD3f2OAuHqLibNZw/rmNYhtC6Iu4At889vA8K+H9BrScLxWU+LkkMkiD2PNei
	nRe0Javc7UdsiBslLRofeyqUQNhNL0Ms9NGluFz3gcVPihf6mtCP2I15ZHuhqmz9wCF972XMd8c
	LzSgqaUiinBuSRhh0yEtdB400oDWsHHFZiSA1ELiVsvCoC27KpJIp4lOQtxlt77yRapWZogno9P
	6pOeBL
X-Received: by 2002:a05:6a00:1c86:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-847f6ee42c4mr3927100b3a.38.1783185315280;
        Sat, 04 Jul 2026 10:15:15 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:14 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Sun,  5 Jul 2026 01:14:08 +0800
Message-ID: <20260704171411.1413349-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_101516_342740_161C0939 
X-CRM114-Status: GOOD (  11.93  )
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

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..df0c26970 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -342,11 +342,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -389,19 +384,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.55.0


