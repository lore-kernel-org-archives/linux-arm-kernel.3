Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E4D38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kTWfAnL5z5OhS7oeDB0hU1ojFDJcKULyH2iq6TuTBE=; b=QzUFAnG7FC0cN7YOySjlneSYen
	3S25JrN4c/laJtcF+rmnnWsg4lta1W3+kF8X54hqiCHs30fz9IVHY/G2PQCSPHp/z75IS2TsmfLTO
	LNSR1kMAvMAO2n6/eJRTG8hJTG1/n/puFh7YndYKyfvdpPOT/V7y4qU/9bFowxEJbJ5BSiafo+er3
	cDCG1kO1Ej1Zb2EoNQ0vA6mll1EejUso4U3pHyBoAk9tIBLc7zfeVUrqxFTyK7415zO68trVFtOGm
	yqtn8b6qzojQfg1ogOtmcS4tIgVkmmZUwggd2LRNeE/oqN54B4BaivegQYkIr02Ym2OKqdSWrvtF0
	4Gt6cJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NN-0000000A3iB-1z1y;
	Wed, 14 Jan 2026 17:09:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N9-0000000A3Td-1Y12
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:35 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so674965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410570; x=1769015370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kTWfAnL5z5OhS7oeDB0hU1ojFDJcKULyH2iq6TuTBE=;
        b=Vn161/zTmyfGNr4S7akriyZN5xa0NGMaKYIlmK9KtvtLspuZ2HrYd88m1Ug+hvqq+A
         qXkDJhWZgGgDbih7VwSHiWyDyPq1DxchL7pR1S0o3jybotDVTrgMB2cEqpL3wrZnMJLm
         yNA8HDpRhFcQ2JESj/QW2z8VdMEbhfA+mG1XCGWKznuxwK2S9erEHAwbWlMY/0eDSrNn
         7VkwpkxXduCXNzRXcmIcY7snAdSnXS/glRXd59Kpg56z9h4jaobTowxzVGsMuOssyt/T
         zGavAG+x8zsDua8y1o2xhsdwO0MxwLjZ9zKnu6z4NZjeslY2dFlZ1CzgZBKqZ2vYVYFh
         Yg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410570; x=1769015370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kTWfAnL5z5OhS7oeDB0hU1ojFDJcKULyH2iq6TuTBE=;
        b=qJy6lcEm9/hyNmmYivu3Leg8kN6CcPXuVnlsJIEPzxluuJXvemM+n/SjLhxvE4sawC
         YMuJCGc8/PjndxHNZd/hzbZ1s4Fo0aD0otEXa2rjMaczUOmvBjlRu8BfAF6m3wK1qKvq
         Xg8QzuBdpJyZbqce0jTIUnlAUT/7WeVnmg+AddH3Emd9c9C+Xd1EMN5BUIe2EiJb0MQd
         bb/8rEtD51SzrZjgaw6q7ZIy9Sy1SHJGZm84LS5r5o4hTxhHhtcCdXxyhNJt/MW7tSEe
         3Nt8cpAX7yakP+6kXTIcH/6CJi6Xx+tvpdS2Vj9J6ddlei3+qARCMSYlWpr6cjvGkuvx
         D/1w==
X-Gm-Message-State: AOJu0YwSiXe2p85egr/PWmT1/6kOoBXUg2HDtuB/BWJROIHHFqXF19at
	vD6H93BG/RIfdVyW3QMkgdkmsInQG52QRJ5kCoaU1/kTCQelbk3jNXxZ1LzS9Jh0jz8=
X-Gm-Gg: AY/fxX6vr099Ho/tN4Bse0u/pecDi1I7IIkX13UGp3SIn1SHuvFDtjtJi+D71eAIxvO
	FhlE4Vx8PdjxPO5DfuawyELg7gU2qftvBvPOj8mJiWbAX28dIasrKOxrdJK+bv42pOoviE77Lkh
	SeQF3XVKOl+jo44T/8W7eG6Xp2AgXnTor7tBh2ihEmgG+dOhKovyTJpbt1HOk8VFL04Ag9qzBJn
	M3P90ifFp6uGiN6nKEmCnc2aUfkWDQRsWdMxaC29kNul0jGpq/PQgRRVmhAWm5j+xmr8yZe4hpe
	iVsxWBkqT7QAV9kmckWS8fVrhc4v9CXaw7xDEP3z4lLC3KAMDgDSg0fwXGHiDoEQMqvr6Mh1phF
	JvHbq8M0b6tXfaxFBrkn3dCow0pWsSkhbuhF2TzkCX5a+s+anG6mT0QpYgBSFcslTSJKJoyk+Mt
	XoeXzR6v6cm0vEcys5XbxI
X-Received: by 2002:a05:6000:2004:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-4342d5c39e8mr3948863f8f.39.1768410569619;
        Wed, 14 Jan 2026 09:09:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af653787sm392682f8f.18.2026.01.14.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:53 +0100
Subject: [PATCH 6/6] arm64: dts: amlogic: g12: assign the MMC A signal
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-6-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/PhsslUI7oDbVoSzVh6hBjUgLUvCgo1Un4J0+MmBYI0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ827+hqCodT7BhBobrsVc6GPpXPR/mUIltr/w
 NN3POGH7ZaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNuwAKCRDm/A8cN/La
 hUrJD/9Bux8MYYOOciJCbRbpEyXFtkOTIkP9eOvzltnWiMuDOzmypyQb2uSeeRu4fp3hDClDAEC
 pkkAvkKuQa3RO3tXR79OgfOquhS0n/eU36O9kEFv/n88itYp4AbolA6087pzCHIvpglgUSQrvhU
 n66bZQuoGeCzS7Je9nHsYxS/HmlQmOFeSwOBGSjnySXlSDY+qzKWAgU9s41Wp6q6s3g0qU8NjG2
 3fITWHfwU6y4TBdaR8l+HwGuy8OGzyJh8AuvWlitQgmVDzFZ++QSMF/9+BvGHBmfPTUlhwX/QYg
 38doGi7Kp3IcnFk6GLxA55YxzWx/VAYxeEQ7neZiA7OCLnxshUe1iacqobSY8CtlMnOR1Nao+4l
 AN1s8G8nue/0KwBb/uT3RiWmt1+4x7nVgTdx/n/ShozmBfIQ8s5lFc/7x26llkdAaa41R3NHJol
 +H4fW8Cqx2rI+fSYH/PxMWd80LP2dJxWSLpQPYbQqJHCilm72rLwU29+6O97C7xFrRia2kpO0RX
 eetrGkaYojiH8o4AVxkhkPQShe+fsDtCJADp3kkcoyQY5ZQCKb/1zcfGP3si3NAGgEdHD16SRjt
 twB3A2ntaaC6Cjivt4LHjRpxO6xnTbfISqXGe2FolhnBMYZHEb5cJXD5vB//Uv0XV0MPueHNv3+
 TtizwRaL48HGHdg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090931_478188_5562ADBF 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clock to make sure it is properly configured

Fixes: 8a6b3ca2d361 ("arm64: dts: meson: g12a: add SDIO controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0085612cf735..00609d2da674 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2431,6 +2431,9 @@ sd_emmc_a: mmc@ffe03000 {
 				 <&clkc CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
+
+			assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd_emmc_b: mmc@ffe05000 {

-- 
2.47.3


