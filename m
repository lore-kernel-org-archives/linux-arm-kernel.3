Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F99CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 05:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=; b=bw2K7Hej7GvhVfGQWlsmYVfGhS
	K563eoGGpIj2gzC0LTHp7OxSAGj/4zrGQUlwYLK/QWgqAW7HGPX7WfVNRvHLQKpRyTML1xiumt2v4
	MIC29NM5m0UKXgwJi51Enh2duXrlPiFpNHn9ZVlnaTDLvd2JMDfGO59EFOy9Iq2TPTTovQazOvGHU
	Eb7zLXtevY4ywi0mFqy47wGK06nr8Ud9NQCZsQAxanyzfRTRs+zx3k9tm1/FU24SGSCUmv+Yordox
	GrW7q4aRemR9yhQ4qZ/aaJ0He0gTSwKhNWXz/rC/lJu8oO3m7v0I3eHHeGGrhVWjUcZamO36L6J/a
	Ez8UDBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlT5-0000000CNOv-1Wxo;
	Mon, 04 May 2026 05:03:43 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlT2-0000000CNNe-3gTs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 05:03:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-365312a27abso816644a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 22:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871020; x=1778475820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=Sj75SsrDk+clV9BRutXcxn6y2BcONOT+24uOxnk4JbYhQXoSoenK6biq0as96AfmTE
         V6e5akgKhaOb3oivjEJUcLf67wPKmtZeRgAmm1kLaOeGT8l0OC0kb5zZVhq0nWJyO8UE
         ak6X2a1XzqG33nblffIDMOs0HzchA4kQe5ueflaR1EozHTGYOizzBpo9bytg5JIV3WeM
         6slA02fgZrvUdVdFGCMLGsoah9WAavpaCqGfNwUaMK4TPyL2Sk17LHQKRK/piodBPs3c
         55rZg6dmBJ3E0Orru42fUicxCAv8HWnCWzcM0gozwMz1GWzHK025EOpvZVg9CM76L/Eq
         KjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871020; x=1778475820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=eZldzqyyVEZzSBG9Cz26jm8IwIlUJjKO+REPq48Jw+w0UsWMLD3JZdm/QfenWuAmNf
         Gr1JBf5hUgb13BdHsoIprtElgetsWqkxwpch+wtzJKDfBYWeZYbLmWySFLFHkvuKFA/T
         KWkh6z2//1NXxuMWhf4rlshsiJ/y6JK321sADWXyLu1KSoJ+es/Eg9+OlSnHzFCHufsg
         kASbDVH+08+V1JhZof2SWgtKp5SMbYTvq08JXXEfXt6L8xJBrHOo44e7V++g8fbGQ1xn
         5O8Ia03VsuS+iS+guXyKAG/BX3BdLkq8L2pq1Hgx6DrE4o0hQCp8SwE6OukTcDKKh/dz
         fEdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8U0pba9UusZJA6kgFb4ATgjKDLvVTvs363WqTGDUjFE85sNH+FLNfZ1ad5MCjZlnGPJEMF4WpV1T1F92+ZEbBr@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7yuBIqvKEoAwS9xFj2hYbs5UqQCmymtf+MjiLtNuz589WVZx
	TInOBgqqu94ZzcGmQ7nTIRa87TQ5ZMYd6im4VgQvQmfXzgP1BMO7r9lN
X-Gm-Gg: AeBDiet3WqoCDfQRUIlJvpPLSyQGGamuyZwXbMFPNt+ie+yD5Iv4iJiY5Q7X6jXnY/b
	fIOpv/QXrPYyg0RyYFIrrrpGensLWIn5WcyF+0KFHZo2Bi+OxJsVOD5ysBuy7MdFy9GWlWsu5ZD
	WRKgIVF9xydObbjgihU9LjQCfNepGrFpdE2FgE8Wm5zRXkqagyPQSusujHJGvCHeGvO0SafV5pu
	qdOke8l8QLTAiLoeC3cnSH1b1JxDR7ssY2OJkP/3IERFXkDayc/QjsL8CilecNmvLDP2yH8zrS/
	/Cv3hHeWGdzhchEgb8NOiKWijl1qwnZVqF6qqPL0v+TyEX6QtMbxV5GO3FivCVzmEAiY/JXsu4I
	iBymZCW+FZOVpN+g36d/SG2mXQ6OgZj/+ecFd1gGwtR/WXyRssb8tcAkLeQr/AX1UHqTQhNfDSV
	eUBVE++AXloSds
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr8265243a91.7.1777871019885;
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
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
Subject: [PATCH v4 2/5] thermal/drivers/sun8i: replace devm_reset_control_get  to devm_reset_control_get_shared_deasserted
Date: Mon,  4 May 2026 13:02:42 +0800
Message-ID: <20260504050245.646078-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_220340_965033_636DCCA6 
X-CRM114-Status: GOOD (  12.11  )
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
2.54.0


