Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A247E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=; b=cd9Yqou3iwQ54ZwITQOYjl0HXs
	UTX4g/dpcdotRpdNFL0294v+S+VVXR9h05GqnagB6GRd47aHoS7ApnDsQaz84rJa1243L9RHebNvb
	qG4dsa/Ynz7P26cqFovZeh99txBQ/Wioxd73ZVtUSky90eLtZw9WWH5+dMNJmhS7Y+gl89nqNqYMt
	rTkJtnW6DYlBX1mNerlzu4zWuAb+jS9u2g5JHlIefrccrg8uXRTcpDtGSSNVglIXur31COXKWcfcy
	h3qNHJMBjyUEtYXQh5ayB1qKALMhvgbaDmbLA5sCT1yqRfpbvwUCbb7SDbPZ4K2MZSD3r+jAAdMw1
	AxrDdwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRZu-00000007bJp-2nKj;
	Wed, 08 Jan 2025 08:38:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWM-00000007ZiF-20y6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2161eb95317so250348075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325274; x=1736930074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=;
        b=aJ2g3lyICfWATPzcxgTeHmmLf4yXBziCaZJYrdTcCegA/kLs3LF5wPwGp/uxuAe7+T
         VieosqAAAAgTMpdeafDmB6ZAhrd/pUUMDR1GufUSMv631zlYUPSfKF0J2QTMVp6uqL27
         xTDOuPlOFJK45tJmUQBu9wuK5HpaCtftxAF4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325274; x=1736930074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=;
        b=RFRgwEqL3MITPDGQtvmAgbMnitYNzSusxZO2A0PAUWCo1EBp1L/2xHsLTMbkpDWWPR
         J1vnIKveoTL1nECQu+MZJi7R46UnVR1HJMoouRb/TV513HW3sm5UCJoJqtvb0iXW6EBw
         HS4l6AxyPWZTYsjmSErfgD567vbl2PwQ86oUbFNbqZxLqZWpBU7TnnCIejSOMabghujW
         RKytnv9MiFTnp7qw1Q/UbSJ4lzLxpxHTaKNTYgK78lfbNrg41djfFcRdFHa8woQxw9Vy
         7Ooq4djZEyPvStTX8NteiGBX1m6BkFXSggo2+sSrEAxoyUGzyLp6ADHUMnF0+0iIzsuq
         XLOw==
X-Forwarded-Encrypted: i=1; AJvYcCXQVtjorTdpervy7Bk3hFH+cak/eoiIhuIijCcjTHdHttz8pDuWX+Z/3KrcCECQXIP+AHwI2cYOIkQyulNKHH5O@lists.infradead.org
X-Gm-Message-State: AOJu0YxNUUOUpay3nJPKlrTpwgXpR3oZKWglTTiIuomo/Xa5mDXCbTPq
	zWViUWTCyCABz6Fe/W4UWRbT3BFTSh8v2lM/+4qiQXZpa5//pzsKXD/aQL6TBw==
X-Gm-Gg: ASbGnctDJURn7p7N7Wxa04BMAGV2TlXYY16nP/5JfxcAbzTQZE3MV1UC+geFq+PSnsu
	igkUYDikK8zxOG5mdNoGr7fVGyIxdR1aIa1LaJl8N9mtsSHrpg+g7b6gSXChnkGvVHRr4N6dSfU
	sx0Zv4ezFr43eL0viyBQgFxCngAc6larUrV+fXTz9rBDoHS0E4EHvetVXEH/G0pYBJUNOFotbyC
	5Hgdv4nF/MvYPuUOMmj23vY/uQ9yYWJZFuYulA0QaHVENsBHLEYBQY0t9tMWyG4LjCWhuJv564=
X-Google-Smtp-Source: AGHT+IGoE453H+6MpzjtZuhQVjLh7PmBh8mNjt0KKWtYW5XDmoMsP3lohDn3YLYpcAwJgLD11Zw5LQ==
X-Received: by 2002:a05:6a21:2d0a:b0:1e1:adb9:d1bb with SMTP id adf61e73a8af0-1e88d0dd4a6mr3868377637.44.1736325273798;
        Wed, 08 Jan 2025 00:34:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8173: Fix some node names
Date: Wed,  8 Jan 2025 16:34:23 +0800
Message-ID: <20250108083424.2732375-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003434_514563_647E88BF 
X-CRM114-Status: GOOD (  12.21  )
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

Some node names are incorrect, causing DT validations due to mismatches.

Fixes: b3a372484157 ("arm64: dts: Add mediatek MT8173 SoC and evaluation board dts and Makefile")
Fixes: f2ce70149568 ("arm64: dts: mt8173: Add clock controller device nodes")
Cc: Eddie Huang <eddie.huang@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index f49ec7495906..6d1d8877b43f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -352,14 +352,14 @@ topckgen: clock-controller@10000000 {
 			#clock-cells = <1>;
 		};
 
-		infracfg: power-controller@10001000 {
+		infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt8173-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
-		pericfg: power-controller@10003000 {
+		pericfg: clock-controller@10003000 {
 			compatible = "mediatek,mt8173-pericfg", "syscon";
 			reg = <0 0x10003000 0 0x1000>;
 			#clock-cells = <1>;
@@ -564,7 +564,7 @@ vpu: vpu@10020000 {
 			memory-region = <&vpu_dma_reserved>;
 		};
 
-		sysirq: intpol-controller@10200620 {
+		sysirq: interrupt-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
-- 
2.47.1.613.gc27f4b7a9f-goog


