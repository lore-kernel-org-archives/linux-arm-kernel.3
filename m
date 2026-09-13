Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34267C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=; b=lRXW/oGY5zKKZVFhAdMiVa1syx
	Ukl1h0Nkw74p7Bn9PIT6gmEIvtqVIVF+ibrGIvNpjgoLHHw7iKu9ppL1SHN1hxodvIceNonQqlSp3
	vXHC6GX8PNWRhTckfBMVlDluBRYK8YKTOzL2GnN821sr2CTF3dEWgZCD/ficYTpr6XaV1ibwCCUu+
	5MqhOts9v1OI7VDAatuHhjSCcwe/vkiMVosM6i3qTy5ffTjodXQatFfLq06ojEZQwEZj41hMEvYIJ
	+EIqKXqwswqndTCYQRlTEfJxB+pUm1pMPAWwDseMyQX3JtfK6pzeipAHJUVfc4f5aOQFXIdCedZNq
	n7SGNThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ld2-00000001jq6-2s1p;
	Sun, 13 Sep 2026 14:56:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ld0-00000001jpC-41Pn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:56:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so18420055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311382; x=1789916182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=LGINj8Z64osaqjl4PQ+FSOwGvr0JHlkVoWVAXQNDrZrR9xoDVNOXVpUm/WDqqGidIs
         NOT6A0NDOSPzjiZylBwHQ5U8YmlAmIYmGtsNnSsls6SVoBW+ieIA/9ksx0+IL3B2yHvT
         pK33KlglUpCXIwJGQRJzGwf3tJokADaOajy7n8h+B35Z9IORGc68dIfbq73GaPr7vxlJ
         gnU79/exZgdIQfhf0XyyAXOT+HertJ8mDUu9Oy7vgJKC4s2xwyMlwcBH7EUbrwoziOAy
         KJnsZei3TAcJO3oSKQNeNTAvO9WnuoAzvNwI62GTImYkjivORjNbROOGphiZtJgjR++1
         Znuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311382; x=1789916182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=NCVRoSRU1QwLHt5LlZgsxXwhKLSaVkfFUP3tyniFmsur6XO4t7xmZ9PFPFQFdLHZVD
         kgfDaKb3PsO7msoMLqaoHl4cmhVayb6CsC8AKeKaOB27B2V0dnmRogJRywGF4qTPDMF3
         l7t7AAXRF6atvNaf1H7PnVpHw3HGbuVH83jdlfk1sCWxAhE/RDfg1ODQ8flk89BdtGxl
         jpHnY8rsMb6O0BoE7CB/1RUL9tTy43e/pv/jiZFQDs9L6hOBne+RYwM8/liWAwwjtkx/
         F9+HRJLVttlPFvk6bW7uj6AvBeJGG85FevCUgxiMW4B+cZBN6NcCzDJqvg2Hb/WDeutD
         Cj6w==
X-Forwarded-Encrypted: i=1; AKwUvBwAuFjgGx4q/moPmxBLXnYd2v9bvMrmRPbVeV+bboBrLFgGqSds6fHtwBAhBW2E393vvWJeBSVk9WbYY3rOgWfn@lists.infradead.org
X-Gm-Message-State: AFuF++ln2/vBpUjqDc9S4rks6BMMnU2BefTiUlEecP4iwoPshPpJrcHW
	nPV5x++eLQQrPDlW8akOLjaK7pDJkWHlka4dmNJHQDy/A3qWXD5c8U+h
X-Gm-Gg: AYBFou3//cSrJv/b3keiD8I7I9vR0cw5Pir4GRuldffGjYWTRUmGfg6Au+/0Sroh7T0
	nYfL9y56+W2tYXiJTuEx5MRxwrPmYBQLNToSvalaF+isVIeGUDSTvY0Y9QzIsr0nsb+SENOtD9M
	z+xp4u02GyolwNpJiEM1tbYQTt0aVs/KOIXPyAvwaNfmAXV6IZ1Zxi/OeGAxUUJqfi7K9m/NqWE
	w+C9LXuKxTq6RfjKnIxJQqSOvQiUCJj+j39xI7OrS6wKooqU+hQ6vbiIDdiJ2qSDbk9zm9reyOW
	gF8Sd6BubEbG6JRPsqL1OU/BuCk2x3aMHyLCg2iO2Um+xJPXaG/rrAH/Mq01gVEW2AJoUITm8EG
	I/ib31LADST9XH2ClRd2rUU5rCF0ZZTO3sA3JaK4U3C98DPDmK8VS1wMBH2sixHWKTGtYe8IyLN
	+Xp9po/kKveio8u/8tbEK5aprFK7JZdza7nql3CB1mU7XkF6dNnImlAnykvp58HA5E
X-Received: by 2002:a17:902:f786:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd5f1bc196mr31924865ad.20.1789311382058;
        Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:21 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 2/5] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Sun, 13 Sep 2026 22:55:24 +0800
Message-ID: <20260913145527.18148-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075623_003166_F5FDB1F1 
X-CRM114-Status: GOOD (  12.13  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 284684137..1412bce63 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -341,11 +341,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
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
@@ -388,19 +383,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
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


