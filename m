Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8BCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRLGX0BSFbSkbyHv+vppZ4+v0T0SuHCAkvGOI/AsUU4=; b=SQR1sWInj7+nh4tjBKG5QF8qwp
	852I7jGb8AIreWDmdwPdAIqvgKUGlBR1SQ1X9BsPz+owLw2FLLpQyIpmKVaPi4vLbJa3PE0HZLWwm
	teyhFwsdG0Q20TgNs3Lc10cW61I/4hylTkPbUV1qZrEEDDXhlSZ70YZTAhCZysM42YY87fSx9wjZg
	5JT0RP5CdkwuTnCW0iLTHy4dKfMUkm30O24UshEfayLfoxwosfsa1Ns4nqYt3vhpKh7M9gbJCytAP
	hpJs2Dq+aYZG/R4WpbeeLGbeKss/afZ06g5ccDOcsEGe5LAKpW/8vfSm9tbh8WjxVhaaWOpx2gks8
	Alp55ObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPlr-00000004FNk-3exN;
	Tue, 04 Mar 2025 10:45:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPiv-00000004EQU-0YUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:42:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bca569b3bso1290165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741084923; x=1741689723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRLGX0BSFbSkbyHv+vppZ4+v0T0SuHCAkvGOI/AsUU4=;
        b=YqxcZl/02cx0NzcuXbnpSYvy+7FxD/Hu+DF6Ox121/a8NrbK6qS1W+/uLlG8YLRNUo
         eVJg4SAmsPkPBXmLGI9mjCt5WhPPp8Z75RA4rYuWI8v5Zs3MDfsbMoZhM2/ppVakmJxt
         0Yhg7hlYNZZk2jbyPd9VTvaXoA6aWYeJKK4Z2x+ITFUjGqzmyvhSiRtLGwKEPx2nvVYr
         L90Zl3OXZ42gvhlts+aApdavEEBzuyz8gvvoFkxpUuIlXTKpLM50sLD81h503ung6q/w
         4nVMwZcjyPwSFYHupBNgP4vd0mvF4tlcabITlFpH5Nhs/mJ+jlhfx9vWzvkJw1k/lhZh
         KPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084923; x=1741689723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRLGX0BSFbSkbyHv+vppZ4+v0T0SuHCAkvGOI/AsUU4=;
        b=eaCgvyRwnE6oJNd4AA2ukwatW+7mTA8v3OxbjGytzRzq4zpMOdeDMfVIkhXzuKLA7m
         3Lg0kVVYFRH9uTerJZkDijI7bxq/CyAogM836MS/RufFWXgM2nkyUnzhxP9QvU6YY4b9
         UO9iuqIb/1WIx6bSt9sgcNwN4o0vnHCTF4g3cGpBoXtzoEQZmFUAdsft//w2OgyS51pS
         COu4LZ7upJUIGtDTOj07XB54+KlEoZNDPskt7PTlGPw/5EzOmKgZFR9eBAYyzhNL5OkI
         Mdoe3Cs/2YB3OWFQOb99oqRJzj/wGzkHr0QNM7UHI3j6OxTBwmxRDI2aQ1BAYnvY9qcp
         rfKw==
X-Forwarded-Encrypted: i=1; AJvYcCUUP5oE78ZoRGcPip871DdWhvh+5J5VLt5YrxR1pv0bW4Q+6GcUlX9YWaOv0rBB/+F+xAkVMKHfCSdVCjwFUWsG@lists.infradead.org
X-Gm-Message-State: AOJu0YzXp3nOPysJN4QP8NRLes/4Vh30QEn49bhcAYC/h/3VTnl8fg18
	abogcrMs3h9QHsI9ao4p6NVFaO/2gs4WufsTH02zzvAQmQFNv3s94i960PuCx3k=
X-Gm-Gg: ASbGncs+dZ1tmOR7wzsn3hONMCTh6MM1ZHM73tjEK/05KbJ8Q/TkVB6NKb7+YmfR5Ge
	5Qha2Gut33NlqX7vX2O0EvVL5X6U3xK/RZbfnThfPXOQ5SOUQZfj/wrCZA3li+dO5LxHbfOeus1
	r3yQ86vQGOf8PYWkwxnX6UgX1XqSFgxufvrqZktRZ2F1zXkADiyf8uR/X2J6UT7E7KTc+0peThr
	UbRNSxQHjpHZ6vBnWxhqx0pgzHOBnId56gd1qi77uxsvOqKzF+NDFBvb2K/R3wY92Gv1BkR6Cgx
	BSfi1EGG+rOxTm0sF7ocNILgDUjwmIPgNPXNURjGf6avYHI1c8yujY7lNQQ=
X-Google-Smtp-Source: AGHT+IFu+lUWQUJTNva4ATWrG4BJPlHZWRTzwg/XUajrbEnxSw1V0tjsJYbZeKjxr47p60rztgJf0A==
X-Received: by 2002:a05:600c:1d86:b0:43b:c0fa:f9e5 with SMTP id 5b1f17b1804b1-43bcb969548mr7400795e9.4.1741084923281;
        Tue, 04 Mar 2025 02:42:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm17202257f8f.53.2025.03.04.02.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:42:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC PC PLUS
Date: Tue,  4 Mar 2025 11:41:59 +0100
Message-ID: <20250304104200.76178-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024205_177332_7F71AA63 
X-CRM114-Status: GOOD (  13.89  )
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

Devicetree bindings for ES8388 audio codec expect the device to be
marked as compatible with ES8328.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changeset depends on bindings patch being accepted to ASoC:
https://lore.kernel.org/all/20250304103808.75236-1-krzysztof.kozlowski@linaro.org/

Please take it to the same or next merge cycle as above ASoC binding.
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index e2e9279fa267..8e3858cf988c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -112,7 +112,7 @@ hym8563: rtc@51 {
 
 &i2c1 {
 	es8388: es8388@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		#sound-dai-cells = <0>;
-- 
2.43.0


