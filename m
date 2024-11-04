Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D7CD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aiM+vVd6UIBfKnFJ4ciItRDXRUONO1YbxhZjMArTmQ=; b=d8lW9NpXIBbwiIMFJSqe18z4q/
	k6jUJC9zPYr5yaPIKw5/vKG0QLbES9nARE2WVQnzPb+yrlIWS2KTCU2tgfA+C25Nay5rEjwKdQIrK
	sGGpHdlT4xesooMr9rZEDyb6deEfLdyzd7kICz6EQu5HsnRe6ajozabuTQPiNzBzV2AET17r2aoQM
	9VXbO0jEBxcSy9K6l32eq9xfr1YMGd3pA7Bh44pLyUKsvZuvzlnaRTsZz+bBwi4Nq8Hq0nafvyzXM
	oqpdyGNA22vt+51vu95XLkq5r6cjq//AQDUSHWGfcAIvIOhkn12QuXcYs+OQKX/83uXWHryJaUHha
	yCFP06Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82RE-0000000ErDZ-0RRk;
	Mon, 04 Nov 2024 19:08:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Nr-0000000EqOb-2afI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:05:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90C90A4331A;
	Mon,  4 Nov 2024 19:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA04C4CECE;
	Mon,  4 Nov 2024 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747102;
	bh=IpevLm9zmMO/WRd+BeiK2wsuMbU3lla0NcYACvtD4YE=;
	h=From:To:Cc:Subject:Date:From;
	b=kAxJk0gPb0VUSWzcApxGGx8coNbK8gpwrnfLw3vl+JvRMGYNEwiAGt0MfbM+3mmoY
	 yE+zMLacNqVwyflLLp6H75oT2XZ39qeeUom0hFKO28o3YXe3r/60x/2eCMW5DAQZWm
	 1iwYew0JnXYxbZtBOX2c1skDFvEWcmbloQbKjitZhFWynICawctLz0LeFB//0Y5TSc
	 7f4oAufA3fxs8MOhuKC979iztCKooqZeQ7CAaFG8bvhECOAeco3Kg//Hx3meUhsJr6
	 aZQoIw9Autc9B4IPl8YsBq4DvLtHYKdhG/qY8i9hPDQ2lFoO0Qb0RqNdMFLPTe5ZAO
	 1Rlu1GTu0gsIA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:04:55 -0600
Message-ID: <20241104190455.272527-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110503_748858_E2F7A938 
X-CRM114-Status: UNSURE (   9.93  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 87e23d16ed0f..724b202863a8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -356,7 +356,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		const char *fw_name;
 
 		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_read_bool(dev->of_node, "clock-names")
+		fw_name = of_property_present(dev->of_node, "clock-names")
 			? "ext-osc32k" : NULL;
 		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
 		if (IS_ERR(ext_osc32k_clk))
-- 
2.45.2


