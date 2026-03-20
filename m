Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E788B1093191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=; b=sjmBRLEzbGqJmn6zTTLl+GHNb0
	KsBGL605PFdImOmypwrl+IAnt7XoM3FKNQ4ZfuPcw4XLp09Lxn+a1VymzOrqKUviUS0yDCucxVNS7
	Swu/vb6LPO3q6P5c4zDUHT/45+N/6HTeFGB6Nni2STJ1+J6HM+AGzjiS5ZmPMLI5zldd1E48482YE
	wBfHay6glzLPDHQjaP7MKRHeZ7seSP2dln+QRggYp6geduXQHrGIuwppfp3sYOmrXBVGndYOfiBcC
	uo8wpEK3+3VGnOykM7YExVbU5nYBb8HQR1v7lkvzPOw+9KDLLuAX30tI34bRbwv18oZH/4QH2lu+s
	2S53LTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSz-0000000CNxo-469j;
	Fri, 20 Mar 2026 08:44:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSs-0000000CNoc-1eFO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2aae146b604so9799625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996258; x=1774601058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=;
        b=gOk9F0BJ5KOiXjpvKdcLcYErdOL1//CwX/Sln1EEIJBXLTM4c+/KY4Ez8/BP6NtK8L
         igzPWXpEVy0c41/uDGEooCFa60/mtU77jdm1zrSZkP0xwsOcx6TpBuqX9S9d3Zx1MyuO
         bcCoBAZ4debZHwXqyd07TvhW48ix9JHHdRyIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996258; x=1774601058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=;
        b=CBMV1Q/DrQlGfqNrbzxBzK0kNDugF1Yl7R0+SE04IRnvfD3rvNyFtGGYyIF2ldIWZP
         V3tAF9VtFgCexICUr3Q1V7RUSfxDASIhE+QSzzCPKkwGwTwcusYmC3V9ZhXEooavIEON
         B3gttad3MNoZTb3jIH3zUK7A62P31zWofkZp1Efe2q+dL0MPkkcggbJZnQx+swyp2GhY
         UlpcT+Vig4UhP9QOKWIrx6Q9NmwxmrWwOCZtJT0OtAmoulK5P8J7uygaCGI7Tv6CFVBt
         O2iyzTRza7k8oKpfE0SNAeebZfVitC4pemu5YqkxSnNt3v5OpEb2Og7L9mThjPIUDq1G
         G/ug==
X-Forwarded-Encrypted: i=1; AJvYcCUla7NhVFDrvexqg6An8L7o6EgifmhKT7gSitaUylvSUIy5/X4MOW5EqDx0eFeeqWcIbEobnuCNxAO0ZkHWq5aN@lists.infradead.org
X-Gm-Message-State: AOJu0YyWwPnJ4iqTmdxODPK+XXCCnTE7/pGXddZEwfV9x3TqiW6TkraL
	soyi7Gn3vHow98mqHHIX5er0plIz2IJRX+TRNHqNWXogwQ68QVcWkBDWNjwU69/snQ==
X-Gm-Gg: ATEYQzyBAGs+RIN/mYfeRIu4oB86ySijNvkFtgRqNT+8oaSV2n+M/jOwqo0Vw75/cgE
	LFDcag1YyS/wh7wdKDf3TLl3afr7Zl8mtY3Av6qNXT9aCiLNUL02wj75FHgecm06bas3xXbFNDh
	z2wdjdbChTGRhSoJgIk4K6+0tIoxTKclB2b0z42oxcVvava0GewkbWTxnuMj6C4wxhyqq2u1z82
	qLFHUSYzr6jjbYzaOXalNSBUj4ZN7AoNItBDHU6D5YPhKMxhA50Y+68ocdi9lY623ztNLZABemc
	sWlZDw4IMxbN+llfTTbkG1OpoZC4HDv8rGuVgh1Tbo7BlR50j//prLa8NHUCyODfs80LN37Fkwa
	4NC2rC3puIzV3q7sGmL3/r2ljIq9JUcPbwh8EVpjdoRE11KqzDaVQaAnpWlAY6nbpNY3pvVeXfc
	20Mt7VKefQMnroIowx69lXcZRZnZqPMGEHJh2hM5r5A/UHa1QoWFOJbXUSsumudyd34njeBhSZS
	3g6iK72h5qRJsIWkG0=
X-Received: by 2002:a17:903:3c27:b0:2b0:615a:53d0 with SMTP id d9443c01a7336-2b0827d5f01mr26569135ad.47.1773996257756;
        Fri, 20 Mar 2026 01:44:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
Date: Fri, 20 Mar 2026 16:43:40 +0800
Message-ID: <20260320084351.2461060-9-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014418_473703_17CC6785 
X-CRM114-Status: GOOD (  12.36  )
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

The WiFi supply regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b71c4c87730b..e2f722d19683 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -167,12 +167,11 @@ pp3300_wlan: regulator-3v3-wlan {
 		regulator-name = "pp3300_wlan";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_wlan_pins>;
 		enable-active-high;
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
 	};
 
 	/* system wide switching 4.2V power rail */
-- 
2.53.0.959.g497ff81fa9-goog


