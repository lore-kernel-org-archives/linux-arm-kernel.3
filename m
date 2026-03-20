Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B9D1093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=; b=w0QRLYd/Al7udEmnKgzzZQ5G5w
	pORQozolZENJwQusZ4z/dLp0jM1YKOt/XgbuooFViWbI3+OjXqIiPGV92lcFcMOoQNa6aavCZu6JY
	bzafHSgCBCXJKDUx+UTySP9jZauuDaBxdkubLU37tBme+rYz36aha2nqQAfuoZqc4rj//3fLLUGuI
	Q2HUi+OGXYiQwzwE+BLVA86OQuJC2TsDJwfR5txfzraw4tQSZEVErUQh5aPrE/yiKCC7WJzNdBF42
	1n8687vzv5t/+rf5/hKWyL1V/GWrLAfbRv5RyrtlXmBSjgSrsgyOys+UmSPbauIhKJnmjC1od5uBN
	nCinkjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSw-0000000CNrv-2KbC;
	Fri, 20 Mar 2026 08:44:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSj-0000000CNfq-1z5D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ad21f437eeso15121405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996249; x=1774601049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=;
        b=PlUqTrQ8KSYyJsOweDq40gXx1KQ/00WpXAWpz0JcG7aBT5tmT38mO7pMQ0Vq6Pctdt
         o/FxZV3lWv46asFpe6JpIGalNhBu1wsMqaJWHYmeEqvjE6G6RnazYAoDrwZQ6T1nnrze
         tcw0cn8189r4Wug8S5/0iThx2dZh0DvOcWZhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996249; x=1774601049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=;
        b=BjAsivqUH6N/OYTUh6gGGmX8kI/VYpIm+Sefht7IlkpaNTMp1lD/EUsCaCqIwNu/8Q
         I2BmgKfpZ5JoBCzut04TBN15igE6j1hXtTTRTKiQdECJn4uAIIJYpIvHu7uTNL4P/lxs
         1ZOad93pdyLYpdpPZh6p2bvQP09i5oo1YpE/jg1oYv5vy4wG3t8iGSJt6S6onHp8QjpN
         hYZGEcQ7LoI2G/DaBgAx4C3wqJXfEm40amqvHdOXEo88L6nfH8+D2YTwUAee4fRiWXZH
         GDFHNBsrmLKMt93hrXGD07mg/3DgWHDUAazWXv3Bj7p/kQzj7QhAAgAtpBR2Am/z81Pm
         aj4g==
X-Forwarded-Encrypted: i=1; AJvYcCXIVDQ7NQuDWDsQ4hWclg7nluKaUlCZV+/w1GxrdP0FpwUIF1IDfqmp8xnGpjn8Q/79HrlQOEokP+wId49olPDA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6tx4nIq1MnyXugIQmvEHCaceX2GFTBFBgKi8/Ape3LJNtWANZ
	Wtle7ap10lNThyTbTcm+7AlR/bybkEohCvSFTxyIMhmKuMrX8buZQYNAbsfPCoH3lg==
X-Gm-Gg: ATEYQzxmgV/4Rggb6JrQ9gQQxU3lNe5Vr3mf3R4AqqzLO89XlHDPCzm3uq42SKkADHj
	Myu1Ro/gLBU++cgs9xsSWmumDmB6yIgUFzpxXT49lMzxY6aWRCoWPcY42QvAJpp8+wxoYvgqg3S
	2ybfqS5r1vSbnE0BDstpmr/FeLEjZ4nQgqhuXuX5fZ8xMmPc9x6ABUs/xCCxI5ad/BFohNhJe26
	snA7AOMs5X5xmEMB003idAaWMtpn6/kAK7nmoQ2fns83mlQBKpBPKYVwWnhwTQK7UyQ14KE7Rb0
	aKLu1ACpsjKhbstq02CQbLwt8Ml7Jqv4hNSqQiBYPgeIwmrk023sUmuopIv9T9CUKXXo6KclIhQ
	p+7gi1Gc57r6ZFin25xF2egOzGY/3Kkqm0ZZvEVcPW/ojHFdYKeQ3AH2OQy9D2tn4JKog2h9qc1
	q838C/AqdYgRzQcn4CHP9ib3UuwM6nvdBvV8B35GX3A9Gb40qLTTA7/NFqvY7iBjEGiCfWsDArw
	U5FAMP/AhwF/WbtAdc=
X-Received: by 2002:a17:903:283:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0771d6e70mr50846735ad.15.1773996248677;
        Fri, 20 Mar 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:36 +0800
Message-ID: <20260320084351.2461060-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014409_516419_3EA7856F 
X-CRM114-Status: GOOD (  11.70  )
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

There are two MT6315 PMICs in the MT8192 Asurada design. One has two
outputs ganged together and two outputs unused. The other has three
outputs ganged together, and one left independent.

Add supplies for all the used regulators. In the case of ganged outputs,
add the supply for just the first output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d16634e9f342..318903b112a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
 	};
 
+	/* system wide switching 4.2V power rail */
+	pp4200_g: regulator-4v2-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_a";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -1612,6 +1623,9 @@ mt6315_6: pmic@6 {
 		reg = <0x6 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_g>;
+			pvdd3-supply = <&pp4200_g>;
+
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
@@ -1637,6 +1651,8 @@ mt6315_7: pmic@7 {
 		reg = <0x7 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_g>;
+
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
-- 
2.53.0.959.g497ff81fa9-goog


