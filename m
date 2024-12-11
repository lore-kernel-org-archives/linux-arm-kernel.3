Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF0CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=; b=aW4Nmr/5NkL+1hsMwXkLI4raeD
	bOpnpGDkd9zoWFnyA469zxyiL+DxwuI3TVHgZW0sXX4Zpm2XABw/P4YosXg9kTXgerORg1tzfiNe0
	Eiguip3QuRItvzhT85SeD9CRf64pLnTVJezy26UqCuV5XK9TS3jujyWt7SWDsycFO2RhgHlJYJg6+
	I5LeNDP3P7H3jgQgD6QwOKYnaBNbGYLDINtAct3BQONHjeZSVh34sSY4L/8SlVDxZC0aNjm8umd87
	DqDm259rEdCvWnaiGfSRHoOUNM9Uf70ljpkTv3n0RC+nYTaNTp50ywrkWD81eXpGfr8QI05ouiyyK
	0GKKLO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFJL-0000000DqDc-0uW6;
	Wed, 11 Dec 2024 05:30:59 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDM-0000000Dp7M-2C23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-8019338c2b2so975318a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894687; x=1734499487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=;
        b=ewwhL/Rx9lAgMht63bFWTs8cwhfuZcK2LTI5GtNb5nAFx1SCpnyTtuXJS4K0Nygp7V
         yK9FmWFOVRNdI0X7d0lQpva801j5WSiOVLUnkmTbmKa+hrvS0OUNXHikWpYBRxBWqZMj
         9BlN2PRSMZN0QFz+2YJLLahb3OD/iQ30tM62M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894687; x=1734499487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=;
        b=rdX5+9toeKEKZ3zYyDP8U/X8KZidoy5ASBKKeqXlIA5Rm+9yRNmCPknlshFuvPnOJk
         rcr/rF/YswSe4RdTTB6E4GYJyhLg6UyWKLebIGxjp2PnUf6fmXJTia5cbcLJabU+tkZi
         bhh46ejIZnMhcTQpRfGN02gmjDFpY0fUlqLJXpnx+ki6hH+bFwnBbLMSI7bfXtmF03nu
         iKeZp21EFvemOkp5aet7M4fV3YaA5zPYwhAIpdvdoN6E2yjY0W6LiHT1UIiMNnwP7V8k
         k6GFYGeKnuDWYakK7LkHHdpyIpscF0LWEEUAtkI1tT42fXaF7vx1G5xTUmZ2Xb3Nfjq3
         YEnA==
X-Forwarded-Encrypted: i=1; AJvYcCWhcUCfJtTOo6LWUaTFWm8F4KDV80Pce8LRVyA4l/6jZ2KITy3sQxuQyDxdRkX7o7d0Sk/kXws/DAXqE7ZuW0bl@lists.infradead.org
X-Gm-Message-State: AOJu0YytSHQH1RrZ8bH8mt/XDVAtQHTGznhvLIxCgmF+gJl5Ot4BmMOy
	Ap5H42tFzeTwSCJu/WV0oBXzRuMcMII5Rg2cv0M5dnf2szhJm6/DX/DlKS6C0w==
X-Gm-Gg: ASbGncsheLsKNqZIdLGGR3mv2vuYrFX8Q03x87l2VExuXw4WuZYd4tLkV1r+Plpl00w
	4vh9lwoemCaUWrdPwMDmWuvv0j+bwGntJ+a8GgyBVr39J+WVYpEk8am6fCT1cJrUh31IBrGpw3y
	ovrWMPjTC7AXk7rc6i+bhfRz4floMUXnCXG1MaDfPyg7zA6fZDfI46L1qhjShWnu2lOsC3fsr0u
	pDpYMVmMRrxl1bj740OtUIR9YsSReDarsJo9XbnWf1kixgUwa0dQYIXS0RRQ6R04Fsm7jYT
X-Google-Smtp-Source: AGHT+IEnDOL+LPNNcjtycQIWGHlAJTgKm/mNrg0sjuKMLfoIK4R2jRd0ukkjYLye/s1Gfn5Kr4iv/A==
X-Received: by 2002:a05:6a20:3d96:b0:1e1:b062:f403 with SMTP id adf61e73a8af0-1e1c1337146mr3393676637.34.1733894687682;
        Tue, 10 Dec 2024 21:24:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:23 +0800
Message-ID: <20241211052427.4178367-6-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212448_558166_A53A9B78 
X-CRM114-Status: GOOD (  12.63  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2c7b2223ee76..5056e07399e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1285,7 +1285,6 @@ mt6315@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1303,7 +1302,6 @@ mt6315@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
-- 
2.47.0.338.g60cca15819-goog


