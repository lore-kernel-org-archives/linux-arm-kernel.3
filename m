Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142DBCFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2SBUjU42Sbm495ZmFakW4ID8bbWQ9JN9OmAvmJYfmus=; b=L+GzJ22PF4dTDMqptcdvUVs26r
	wUsfebCN+hwKW+zlakceiXdO9dEY4A+KiuMuXevvtkdYrO/akAT/gWiw11x1UUZWqBLKrr8I64xun
	wy9C+5aasGtsGVpZacp3ZlIcviKGwC5QfaLxjFYdmZFDLUvv6bk9vDRmZgRXEm+fnTX8iGIyzEjmm
	BHgx1/OHs9o39MAzvfQ0Hp6/aBDJvjGjB74ig3Ay8g52twRhTWYCTajDO2HEfza1QSvIyHh+vKtiY
	BFeTpXX79kn5aX4ZvCAP1j3aAOJyujd6BM4UKq9Ste4WYp/0CxKbgPB3G2uqDe3icReDTEnFy8nj2
	bI4YbZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNDfI-0000000AZpa-1YRR;
	Sun, 23 Nov 2025 17:14:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNDfC-0000000AZoN-0ZQT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 17:14:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47778b23f64so18448235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 09:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763918052; x=1764522852; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SBUjU42Sbm495ZmFakW4ID8bbWQ9JN9OmAvmJYfmus=;
        b=MNSfvDTl8UHuDNu9KlPNObewfZmhZIvwdVsFGhPXhh/TlTZSLm1kMS6cyXIiztfaxw
         P/UC23t/I20yivGCZjNcOdWaU8CuvAiPfqNPbenUgpoIm9Wk1Je7OWudRvvti8TM0N/k
         b45Z2N14sjxMy0cRvmKiXthW2IsZNrStU6l2dFMG1N2emsNVNg8fWhql4rO1Tx7OjcUS
         hQCfR94p2HLRWao0TE6hLd11SU02UYowXG0iDzqBCE7x68Do1K0wlMhjui/vRrncUnuN
         MY2CfydgfRcU/TbJ9u4oELQgbLeN2v/8omCYTJWnZtBb5kEWHSBUCM56ZwRQGUP6c2Hu
         Oc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763918052; x=1764522852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SBUjU42Sbm495ZmFakW4ID8bbWQ9JN9OmAvmJYfmus=;
        b=nSwAHpdDrOo29okJPBuzZrbSXT3k39IARu3CZVF/NO168KxpR3QN20poQZ8TVCTyNg
         M85K81p0o3b4/ct+92aXHTKbAOD0422fckaII52bVHQDMwjpm1shMB+RYlJz1qGHAEaZ
         wtKnxrM6ZURl75Qg5YBwnb2yPw3zmkBX94faKbaWVpGGSbAmMP8D/dkNkd+c2W0vBhfK
         88FfErIbPAmbwtBMN/xVsjFc08KwXQ+FXKtLT2exXL9mPxzjYirr32lwYBbnuUfjuGDn
         W1M5MazphGsvMT1u1LmHgzkciMmJ5CO++w75ZAPJfGOMpW6FU7gLti+TZvxm6HwCxr0w
         1O8w==
X-Forwarded-Encrypted: i=1; AJvYcCUPyjB+gC9qhCUozny13/GrLE65vHTPzMYWGSRfiuNN+6QHJcU35QxpeS2sYEX0VqCFPUW6i09bB6t3VGBzkJib@lists.infradead.org
X-Gm-Message-State: AOJu0YxwtIZMQ14kR7gwzFP+07fKklwV6DVGLX71xB/jJkBhxKiliWBI
	yf6y6i8585A0p0Va0E8XxY2qZi0Vr0gOSDIuh84tcjeiQA6I3gw2GgVHkoeg5tMPdv0=
X-Gm-Gg: ASbGnctZNeVsu+xTAM8zbAjuXCM4v+Oi8hCJuy5Znv/+10a+coT/qY9q4sosf/U+Yll
	4FGVzEnJqwb6R/h+g8OMKvoVHBV567CsMh/Xgfz4KGYkLtQbiq6sVEWCwzM2ZzXNr8GZt1YR7HQ
	TLztEyxUz+FuiM1a0BddUCV5iW71Id+jTPQF17I6BOG71h1e37hCApbd2YPqSd6Ro4l/8zaWkDU
	mQYmi++L5wp0eislP/f48vTxO7dXoN74o4wTkcSX97skySGgsV/+cBfSjl7xJSvmZinwpqO9qUZ
	guvs5nqPDiXW6yaaZ5TEZRK/1G9GcBzL2cAJPC7qnuZwKkgSlMSGPPhEiii/1IOyacJapkdlfGo
	k4uiNpxZVl9JzJziAKktUpTve1ckf1vc7G5loGJoS4uuBCJ5YXYeGUod+8S1929o8IZmylkdChx
	SLyHj0tlPDWgPARg==
X-Google-Smtp-Source: AGHT+IEMVHajdQc6mO75+50UqpdHBDZGtu0DQkU6l/qte3nrP9B8VROGytjnVhIoLoLV5NlrKgQsTA==
X-Received: by 2002:a05:600c:3b01:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-477c110325dmr74538475e9.6.1763918051866;
        Sun, 23 Nov 2025 09:14:11 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:51a7:9db7:1d49:a8ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0ecsm151637785e9.9.2025.11.23.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:14:11 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Sun, 23 Nov 2025 18:14:10 +0100
Subject: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference
 for S922X CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOFAI2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNj3bTMiuyMxJTEYt1kC5OURPMU82QT82QloPqColSgJNis6NjaWgB
 xAQqgWwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_091414_317250_EA761409 
X-CRM114-Status: GOOD (  11.98  )
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

The original addition of cache information for the Amlogic S922X SoC
used the wrong next-level cache node for CPU cores 100 and 101,
incorrectly referencing `l2_cache_l`. These cores actually belong to
the big cluster and should reference `l2_cache_b`. Update the device
tree accordingly.

Fixes: e7f85e6c155a ("arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC")
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index f04efa828256..23358d94844c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -87,7 +87,7 @@ cpu100: cpu@100 {
 			i-cache-line-size = <32>;
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
-			next-level-cache = <&l2_cache_l>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -103,7 +103,7 @@ cpu101: cpu@101 {
 			i-cache-line-size = <32>;
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
-			next-level-cache = <&l2_cache_l>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 

---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251123-fixkhadas-c84da7d7c47c

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


