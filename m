Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPJqCmoSsx1GevRwEqwTz+KiO5ldodlroUJvFu2/V3o=; b=JsCDCq69DG+VRaWu1/BtNAybrn
	C+6CP84hANyLagnQHP+wVM/MUNLNSlMP1B9FTt0NCw2pt81Rex9oCV2MjQxSn64GGgMx45PkQsaxr
	PAsnBhXTfYYTpWHc8S4fJsp+b8EHedT4syxpppJSxOsEa1PZJ2Dr3DdEQB1VirHh7k6fDX9niBwYy
	GjJQY5AbEmwWJl0zfzMqXFCJIAkBAZCOV7NPwpw8BcBOt0qSM2L+A0HWKhi20Ta5237OmHKEEZwNw
	vSIm7bWxkgUR/M1syHTs96Az6xOiM35ajb3Lk3Xs7cYLDHEDmVYQ+tmgGSZ9fsWljKjUK3w9B17Ys
	2ev7yaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DsS-0000000DoVy-0XDn;
	Fri, 11 Apr 2025 12:53:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dcw-0000000DlNI-3cg9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:37:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227d6b530d8so18940235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375018; x=1744979818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPJqCmoSsx1GevRwEqwTz+KiO5ldodlroUJvFu2/V3o=;
        b=l+uyAgl6JEJrFYnK5rESPGbApZtv+6J+rx5pA6va9z4oxJvhB6EaBH1DE6O5hidGra
         71+V96el+fz/R1JBxguvW1nP2bvvFLnwPNcigOcsvYdRYhypjioQNulQ3EqwrJkt5Djw
         QD5nT/NBYOxX6LpngjQRSTV7Uu0G4sN7IfJ1j6kd5XWKxVK+CKaZG+u18xnxmpMy+2nt
         SR9v2wWA8KJ/dTFOIiobmAxVTV/SRvlLkgQDjLFz9YvRUaEqwwQgS77sXgRewM/br4Vt
         ZNUU+vsMIS4aUosCXPnps+WIm+n4+x3iaSUr4FKbpCZBXMlCPzeeg2igRMCJmoB/U7uq
         WX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375018; x=1744979818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPJqCmoSsx1GevRwEqwTz+KiO5ldodlroUJvFu2/V3o=;
        b=LimnDq8xOBENL6Dp/jIkti252x+156hnAKIZ4boo7xSDsZ21KiuXq3ZkV8hlwvg29c
         6a0lknD5rVSx/uyBuOL46peieIr4dqQgFa2rraPkFRIi7GNLlc012CNFFS0TWBuaLUzh
         9RI4IiyiWoykmMpCj4Uf7Xgosm8O00M8YiRZEd18UyHKrNW/BCYJjoonKvbqndXQjbrh
         SbyuP/7EGqwWtGe+fGO6wWceiY69p1D86GowA7CmcO9FW2uUEmtT43zDXk9/bnDxUmop
         BrdlGaz/18f2MdPnGCNGXwxY8FAev/nZUGqMXb37PoAYetVaD+WxImSB45pG7UufKgih
         ZXcQ==
X-Gm-Message-State: AOJu0YxWPkLPQITWaD/emQ+Spp5Sxnh3Y51A2WauC9r4AwkeRnge9I4o
	9+1oETt0LHSWE4hZXtRm4tbBemHqb8miYGu4Xx+QqY5hJqG2I4OfV5RPizH6KcY=
X-Gm-Gg: ASbGncvVrvl+X45k59mwtNgyff5r6aNfDd6pxHpm13t6PewCup/dO0mKhZpDMPRajVi
	laRTlQJrwYe3w0bgcHMSxPYvmHbrVvlX2r9PZC6jcwmn9be6vTcxGYD3KXNO+XAEJ3yfpJYt30h
	fGIHkuu3AwV/tfrmxDwMdQX+BZGlopZRiuCdF5Pgqqgi/Orl1PcgBccGRm6qXMw0rQnY2xfy2fA
	TMQsI9eEsar4pcMhP43JQC3k9Bmu4SROvq5hGjI94qLu4gCULOeIQjomT9olPLCb76plfXaE7m7
	VG16etzfhD4d2yDXJtpnATfdO/gPFNZm2YYp2wWQ3w0=
X-Google-Smtp-Source: AGHT+IFpLD5B7k7fXna43PL4COCo2fb781nBQohi+uOKDq+PQ5C/xXOE6xN0MQ0jZ8H8pyV6WtJL6g==
X-Received: by 2002:a17:902:cec9:b0:227:e980:9190 with SMTP id d9443c01a7336-22bea4fcad1mr41903285ad.44.1744375018241;
        Fri, 11 Apr 2025 05:36:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:57 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:58 +0200
Subject: [PATCH v3 5/5] arm64: dts: mediatek: Set RTC start year property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-5-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7fUfH1eE+n+zmzKhP4D/88n0duk+DQJUKxhnlJl8LM8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+kE39onw4c/4Fkz528PzOFaSGz5L4XeHhWzBX
 hDMFF+eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURZFAEA
 CMgGOq5n82NrZ1LYEtWO5FV0efEnXxIHS7oTUff/+0zjS/Y8jlqnNx8HPZO5nwUH8Nf9LGtZBslozP
 vWuRX7cK0jNVQfcIjqh9mpcZ2kT1QJoVCsGw9gN+QqAL6mNPZVhvCwG2HIOIEsxRF69xVDOMZbGJMH
 DRGrZpV24VYPp83m3Rgz+RqqYjOsB6go3Cppb67f56Go43Wa7Bh4h5bL0jMyT9wvc47+ZzIhF8Dsnu
 tL3sRzfjBIhd456WR4crywwS+Le3HSdnF0s0KBzUmHhKd4e9llBzJ6d9jxQfZmsNvXqlatDiioEYYz
 G2WgVthTQ1zPwsLFGvmM8dAbs6P/tc1O1RRVxU1RIdOaRjwIh2+BuH6Nf9TC9a748hBugjATRYmiTX
 5DUCslbH/zOfvqxbGqVbwjZhdyKXFSTewkXwDt1YuxWaE8spAjAFQYBu6Wcf7p79iPZy1Eoq4D2VtD
 4VbzRlik1xMo/9KPiwY3Np5IFPJpEqx2CnO2uCx27ns+84mWkSUIPlxhQVC5yrk/qbbU/hc+7N9uCZ
 EeICxRI7pmEj546cN1sweBOzcU67+ct8Kd4CZ1plilw+i65YAUP0JXj5JJVcxsWta+SoyGzIojnLcw
 HDa/GKX3CnNeQrPYSTWlTk7V9dW560HevmEhZH0M64UhIbAGF5pDYsk1OjIw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053658_904832_0A71D05D 
X-CRM114-Status: GOOD (  10.80  )
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

Set the start-year property for MT6357, MT6358 and MT6359 to have a
consistent value between the HW registers and the RTC framework.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 5fafa842d312f..d79ba87361d00 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -267,6 +267,7 @@ mt6357_vusb33_reg: ldo-vusb33 {
 
 		rtc {
 			compatible = "mediatek,mt6357-rtc";
+			start-year = <1942>;
 		};
 
 		keys {
diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index e23672a2eea4a..226259a51188f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -340,6 +340,7 @@ mt6358_vsim2_reg: ldo_vsim2 {
 
 		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
+			start-year = <1968>;
 		};
 
 		mt6358keys: keys {
diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 150ad84d5d2b3..7f9182be79724 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -299,6 +299,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 
 		mt6359rtc: mt6359rtc {
 			compatible = "mediatek,mt6358-rtc";
+			start-year = <1968>;
 		};
 	};
 };

-- 
2.25.1


