Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F3C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7SpZDu8jv4dHbSla5ZPIdsMVsPrAFAZvTLD9tcwZgo=; b=j8xKW486thcL8YlM+XutudJTV8
	LnzNQ1dqt7wgP7JqPUuYgHoEbmeP4Q0/CHXznI22wZPCtnEaClJdJTMtk7tk9MfnDdYDgd3qi3i3U
	Jlg6yrvYaa+d0c2ifZ8mUV5a2+6IXND3H8eIFzMsUiZxSqxUPYTxHLT90O4ukagouXrOeD36HaSuo
	MAUnFW6tSZXyhZJMt5v263DdDiZyqHGuY3XE4zxantfBKErHkqtE0XOQtD3rk6fVyoSVoG3A8mc7b
	RFC+rlSXmsnwbQySbQ1UH9cetYESCc+Ghjs1evWkCrMZqWTfPwgW60RZ/wJOeEmp/aBQIz6P40Nvm
	3pL+I8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWOV-0000000G95H-3iSN;
	Thu, 01 May 2025 16:04:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWMb-0000000G8kx-0GlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:02:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1731105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746115335; x=1746720135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7SpZDu8jv4dHbSla5ZPIdsMVsPrAFAZvTLD9tcwZgo=;
        b=WNcdCCTmj512iCOAsiNiwbs3387+wBVgqOPWR8oUc5dLoCrurwO2ogCCNIYmYyPbU/
         ZFPadFt9c5rPpT7Mp3P/dhAeWFuXfCBfkuCSpqLbWND1OTxJgnrLl1AGlTUYZvgZWtgm
         ntsXP4yxmCniqWncYHChsfxIWqOk/jftYBPgJQXywZyddagex9xYeJI5qNnYb6bonip5
         eBL5k6n1R1DAiwhjWjrNmCigKxj+kmh6VEsxETiL87tfReeytqoRJK0SKN4hn30C2nkV
         Fsts6rQ0GK836hBtIIjWKK+jICjDsAFaWSdpAjwfG/C1HmlFDNsUJSnS/S8Qwj0qdqRC
         9ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115335; x=1746720135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7SpZDu8jv4dHbSla5ZPIdsMVsPrAFAZvTLD9tcwZgo=;
        b=MauI0AjaYEDjzbkJCaqumPhmLlZptlhCfdUkzNgar6lRFUmYbrMh1P2Rnp3YzUjVBf
         E2CRTdw712XKZeECdps1K28h+9bd3n1h4KDzoSibs2L9a5qd1Le59IU9JHWweyzE9nA4
         T6Dy7w4aud6AZsu14pA+e9SRW2UYmerFKOVaQf+Ei9l5t3cXf/3+dwRggYXBUmw7KahR
         IDnuQ4emzvgZl1YR/laXBHfVRmqrqO/V7FMGvIIMHd0sBKOpLFSg9zPFVbWoKnLghYZx
         FxQp87BB04gEi1zpm/g7CNyFKvGxh0Gup/KZfAGYiX0JBoX+5Pkt7R6sG2xzlS/oBu2J
         9oLw==
X-Forwarded-Encrypted: i=1; AJvYcCXoQkOiv2oJ1cXesvK2c3YxxdlE1QLG+/fgmpf1twZcZdfuJ3L5hxR7/fgiJEM6Oq5QXlWkiElqBs+iATxNZQ62@lists.infradead.org
X-Gm-Message-State: AOJu0YyBUi/zgfhSWmYMNH8KKUC8DdtrrvrWMvd3Lw+YAom0X74Y1e+N
	v4+CHN7KsYabwmYLr79D9pye8ywKCygNOO2bydQ0EIQw+CssK9DNJDwclfjqjFj+3Y2EJwgzeba
	4
X-Gm-Gg: ASbGnctT0tyAwi63MUImTyPPDiv8yL4MEy0AUZ+kCnfnRtIJ7C0/LXcHnBE0v7h02p/
	OMF2QqQqCSKph6lbKACCcfMXvjNzNAS8wOIQRgJD30D1QmV4dL9E4QUoOTq8+34QTpxKEYRpJ3K
	rrY4K7iryxaMT23sOa0IKdGH6B/ZKIjxvkr+YVlwn9NRcNLZrJxBjmHquncIvpawswhj73xR8JD
	+1ONcal85db/hZ9WY5fBKZC1lYrhTWhpk9qfq+6KDD47SQK4ZcHKto+rNWFkYBbx1EzMadPZKP7
	68J3q4nLAnJI7jQjp2OW6dojrMrfYQ9kX/oE1pL1iRh5om0f0g==
X-Google-Smtp-Source: AGHT+IHuAg916EAmQ+Jj9V0jJg4osfYO4iVeePCZYPPcsGtTccI+ph4PfvFICbp/E49W1nNjF8EQAg==
X-Received: by 2002:a05:600c:46c5:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441b2dea5cbmr24622675e9.4.1746115335047;
        Thu, 01 May 2025 09:02:15 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm16841485e9.3.2025.05.01.09.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:02:13 -0700 (PDT)
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
Subject: [PATCH RESEND] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
Date: Thu,  1 May 2025 18:02:09 +0200
Message-ID: <20250501160208.96451-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=MUVlOhiC+9LNR8vM+05XZ7Yaggp3NsZvqmvdhwJ2lSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE5sA6JKQyX5fhvHwlA+nyIoTrmSMgCFcHqcKA
 00vojarz1GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBObAAAKCRDBN2bmhouD
 15DREACNeham5NbPMRDlnqwiikOjOCE4rult541i2EqowVAZYJqvAXuYrIhs9NxWNTZGb2N44Ga
 cOCW2LOIL2YcjXO68yOiqivwMtBUR0CK7LRvuqSj3814L8T3BHICX6Ku9S5K1sULpfKKQ8Mbz5a
 p7HQSBjgfmA5AYINGFvqti5whdRjfWMIUm4XaNJ/u2VIghQUPORU1pRAmNuyy3nFSUTbAeWUrZR
 YRjBJubLkXDharXrVarrXWCFrsi8WaBoZFWoGVK+npHvcg1/Ak3QwpvYBrpMCcP0X60ZpkASZaS
 HO5PcFmisG1Foco3NE2bE8nhpFK4b5frM8BF59/aJ/d05rhGx1dHv+g5LfUcXczy+J4EUD6UUOf
 KmrlqjAgySMXjWuYpG710YX30R/L2Xvey2dw6U4DrPz848/rp6QKY9F4UKMIXvtbmO7/BsYQZu1
 s606jZLp3+z2G4Re6NbhcEOX8j5WTs/rtRdlgjhSRsVV3oO3Pr4AOI1oVnAOUTGmkt8pAncszOk
 NaeBxqAbZILRXPW+BesQL3DSd5lnPR8e/mbraOWSQB+u6dwTLA/l9rzB3itpcWwP2tKHwJ1facQ
 U6iZa/z9yK88yBHUK18AlUrx8TOrfAvtj/uFBBtbwo6r0uxi8B0LGKEuRkILM5ALwvY2wRIksRI G4dvhpbczyhT6bA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_090217_101629_ED6EBF9D 
X-CRM114-Status: GOOD (  12.59  )
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

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending  after dependency got merged. This can be applied as is.
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
index 9e4b12ed62cb..be3ae473e562 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
@@ -36,6 +36,6 @@ wifi@0,0 {
 		compatible = "qcom,ath10k";
 		reg = <0x00000000 0x0 0x00000000 0x0 0x00000000>,
 		      <0x03000010 0x0 0x00000000 0x0 0x00200000>;
-		qcom,ath10k-calibration-variant = "GO_DUMO";
+		qcom,calibration-variant = "GO_DUMO";
 	};
 };
-- 
2.45.2


