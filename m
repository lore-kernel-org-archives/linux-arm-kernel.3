Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54754CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3+BmyLOtp7xUTMRQtQMY1TWwM+wvGI7ScMcGnjI6fc=; b=adl4Wy0zieITy3W9q50ML+HvRE
	P0pigkHpXjYUNiXBPhJuzsTeTpow6JKeUSwq2vutOquA7jpNoPZddJQRZ9BPW3YUTCr7tkRqkGDcV
	F7qQAbXmntmZFdIooq13lUd/I44ejeuJXBHyP7xvUAR6ddAOVDvV2YL7vdy1rcJiBOmoiz31C7GqK
	flf1Qga+R4dZUxAXV0TGLC1uN/nyE3XunRzMz6bQXA2dPL/LraZn2XG5bBikthn2Swkffy1TLtHch
	huMwEk88FigNbBMazaajdT3EtF2zgv3X9T8JilYMHInmBV9yFf37E0J0Fze9gSOJ4fGvyaVH6ArbN
	lafT2xBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVxN-0000000Awce-3iVs;
	Sat, 25 Oct 2025 04:32:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVxL-0000000AwbH-0l4I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:32:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-586883eb9fbso3291631e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366761; x=1761971561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3+BmyLOtp7xUTMRQtQMY1TWwM+wvGI7ScMcGnjI6fc=;
        b=Xt87ry3B0SPjOUIQc+32EHOEdCR6LTTXTKSE9NeNewwyIDtuCetp4WaFDY7dVw+DBB
         EyuAchXXs/PYIjsBfGTiYk5O/qU4Shyf8ROj+wS31o+PYGrONyn3ttxto3Iaurm2KVBK
         aDM3JWcMZajwZkDub+M/d5bKYjAlfxO/dP3C9mJl2lyO55vz5HsLZftokWHH0xb3TZrc
         PqWF2JgXiIkFnFtEzk7tHguxvrp8fT/Fba4mPgQBxcFW2fK0MhcRpYUXwDqVX+v23/wS
         Zfgkau49XYRtHSz5OAc7227iJiPqtQ6u9fjPtBtvWzwsWV3UkwVk25axxMRL5FSK1nQl
         HKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366761; x=1761971561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3+BmyLOtp7xUTMRQtQMY1TWwM+wvGI7ScMcGnjI6fc=;
        b=D12flKuluJAdTbssPLznBNIuJPLCJMj0LTpPJN+BRRGZyVCX6E0WLpSBBKS04CQ8oO
         MzQP57x4+pS4EumBA6W6yhSnyHyffNYsTH3ZMkSyUM/WyrHyPGA8/E3l3hM/Ggvbi01B
         OZxGhuC3S8tqs3b8RRN+/6vwR1Vx745O5XMESO0mQY8M/v/W1x5DYJeQW20T0ZIlDHBS
         FCtTdFeT3pL2VlzjV1gSDBLMCNbmyNYjdjmp0J+6s3Fw2yDmDaRn3o/QMIMBdZWq0owa
         vEFO9EbdfiKFP9gQ2qXb9gXuMFsSa9XpUL+yh9/SZnJBlgT4PRPpI4q9jezUb7PIxU0Q
         PjVg==
X-Forwarded-Encrypted: i=1; AJvYcCXxiPyhG/Vjz+RH4fnPkZh0+PNv//2it3udm1eziqP1FtUOf5ZWSQvbPy6vMoEGXKFzWIrz/5+FOLDo0Fs57ZRO@lists.infradead.org
X-Gm-Message-State: AOJu0YwePFOsC/ntzx7tWn85A9jRWHr4+3Qu0yVWHc34jjxvx9YQ82IB
	uBWqXxPMzf2LaCP5Ca981iaHO73cWWdux1lvXGHTG+xMxCWBYBeLKifN
X-Gm-Gg: ASbGncv6VAX1uDtAGvKdzp0PteeHWUZ7wQR9VUMjmkgIh2fH4BG2oD62soY1ISqKS+p
	gWKukY2wrJtANG/imkxSrfUKbS/Qvwy3Yg1A4FFRf7oFywPUaKfOCBuhoRdYF8VsDu3ng38bOr5
	50uFdbjD0DlNpIOMFRQgt0l4CHHrGexYE56yZIYOOCe5c4J5JM/j3h49+NRxRb6512rSkMf0kWt
	ZQb8SXYE6asnPyqtwA/3XPK3V3HaYQgkZ2Cl4FE2dn8PWTm4AcKWh0PA6+ok6tVSEq5XSQmJmoB
	1VxQFm652wWr31NOaT7q6BTQBKXQZ6uns2WPdPYwxrT1o8EQRvY0+8lGg5zLJIhBhpMzVqPGIn2
	r+NTsNj5pr2Txy7OY5/XQymsUjpIWyp7N8UAN/CZ6/ZMNcwA2lRPwyoa2B6ge+WEaUA==
X-Google-Smtp-Source: AGHT+IEKvrwo7BMcvdLr8sMnPaVHb2OI/tgnv1kSKzQDgd1sc7jso2BrG2SWkbje2QobtPqCs0yKQw==
X-Received: by 2002:a2e:bd17:0:b0:36c:2367:b3c1 with SMTP id 38308e7fff4ca-37797a58f18mr88205231fa.35.1761366760931;
        Fri, 24 Oct 2025 21:32:40 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:40 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] thermal/drivers/sun8i: replace devm_reset_control_get  to devm_reset_control_get_shared_deasserted
Date: Sat, 25 Oct 2025 12:31:26 +0800
Message-ID: <20251025043129.160454-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213243_237750_186BC01E 
X-CRM114-Status: GOOD (  12.26  )
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index c02c398b0..aa496e1ba 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -344,11 +344,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
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
@@ -391,19 +386,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
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
2.51.0


