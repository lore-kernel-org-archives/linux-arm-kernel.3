Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23167D11718
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=; b=u50ZLRKcIocMqnv7J/EGObllVs
	U7iSU9oRkWlf92uuOxmJRNObwTuqettkk5yXFrxQo+aZYB3sSZp1m6RY9hB+hQylQVGK1RU4u6fus
	nJ7SeQQcexicMMtbAk0ju3QYHdyDwMPHgfvawWYdrKdtNsU4Yd3IeFP+9im9DZjrUsxiABZpGYCHa
	yf9Im6uEp2jTXRr78Nn9wCAt9MLIXNVsb1VnLTwIuMTySP1IhmUfKmxl0U6VABk/SJy7iy675ze88
	lVasGV4bxQBqC1bJrL3ab1G7fLc8vR5ZPhkNA03TMkDXLjDQPzFne7iikO6qxxunt5ttc1gf3mIdI
	ZD34dNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FEh-00000002t81-2slG;
	Fri, 25 Oct 2024 07:59:55 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FBZ-00000002sYT-44eq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:56:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so1329478a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843001; x=1730447801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=;
        b=X0yFuEieUeXYQ7rd2MQ43x0rRA68NWy6F1FbGC9nGr2BvKfkB9hTRgzsr4cmsEUj2I
         MWIeAqIRN+RkF8fFsgzfOSnJpsFugz0SchlUYFiVOOcrCRaAjykAkSy5crWC6N2ppkZW
         X2HiFkYt/vEPf8jmjhpleb24bWrWCBwoP+PWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843001; x=1730447801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=;
        b=kVZ6E6u+D+aWDmcoKlvnJ8CtM+sDUR5IeDKiw2Q4MPN2hneUr1Zph+pR5xbfE812V5
         +yOuL0xrxJYIDUA7LELwNGBCdzYQX8vqAHNT1PByR3VP5OiClEEWyc1ZnMhy90hrGmIM
         XNYRjw1g90twO6zFjk26b0tQ3NKFHrsLBHClh8v4KoLvKGJGLuHeb3jrG7NZuFg/xVwO
         xL/mU4xLAnC3+SthhMykw8a1/2sJLqRiNVvkwzrix28e9foT1v5w6mDNRYX/SfO39Sod
         70heBZv2KBg39zdsQ3epjudSEN2xKS2P/dT/Yw0FbYdKZS/cgqkZwIOTwp3Lvamap6VS
         69rg==
X-Forwarded-Encrypted: i=1; AJvYcCW/BsQ2RBSmv+zQWkqa75gAKTlacbtzf5uW3cHxmNw1GZ2tGh9y1opbJ7RsYOlxbZuWjvrcM0RCT3tx3qXZTOcF@lists.infradead.org
X-Gm-Message-State: AOJu0YzkJAR7ajmEVOB2eJbDM5VV96LHfiQLZyEUnPa6jA9fhbIBRAZm
	awfi2sYCXXy7UbRS60BAE61aOD4UCvrcZGjtpP8QJsZqZK1CjcpCA+ZxjQ5qUQ==
X-Google-Smtp-Source: AGHT+IEhpzhZePgnGrlXh89W3IHK0viadpu28ous3jPT9MS8vhveF6ukqC0oYeARpOE5I3mtsl0sYA==
X-Received: by 2002:a17:90b:30f:b0:2e2:e82d:48cf with SMTP id 98e67ed59e1d1-2e77f4a274amr4863299a91.16.1729843000877;
        Fri, 25 Oct 2024 00:56:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d8f:752c:c7f1:3169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4c9c1bsm2797553a91.19.2024.10.25.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:56:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8183: Disable DSI display output by default
Date: Fri, 25 Oct 2024 15:56:28 +0800
Message-ID: <20241025075630.3917458-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025075630.3917458-1-wenst@chromium.org>
References: <20241025075630.3917458-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005642_026319_8B1CA670 
X-CRM114-Status: GOOD (  14.08  )
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

Most SoC dtsi files have the display output interfaces disabled by
default, and only enabled on boards that utilize them. The MT8183
has it backwards: the display outputs are left enabled by default,
and only disabled at the board level.

Reverse the situation for the DSI output so that it follows the
normal scheme. For ease of backporting the DPI output is handled
in a separate patch.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi        | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 61a6f66914b8..dbdee604edab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -522,10 +522,6 @@ &scp {
 	status = "okay";
 };
 
-&dsi0 {
-	status = "disabled";
-};
-
 &dpi0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_func_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8f31fc9050ec..c7008bb8a81d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1834,6 +1834,7 @@ dsi0: dsi@14014000 {
 			resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
+			status = "disabled";
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.47.0.163.g1226f6d8fa-goog


