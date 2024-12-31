Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283EBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=; b=EGOr+hCO5yDU2IFP1FDmcbPp3/
	oxuzlDzBhS2/sAbVRZLzl3xmU2eJAq4eVG2QyH0Dup2CL7nRBUrHNeGqV385nCOlI3//+nFDSnPHs
	/5lA0VCIc0HVLT+bbMmeJ5rdS8x84WnWvAynsEjoBh/ww+s9hVxzf7iNcxNmkgKwcJ5/y1bD+mSaT
	w5+tqbJUUbmOai5Ir6WjH+aE2i8vrtYJSx8HBK3SJ9im+MS5fuE6gh5J92qczTzoyzJHOJ6GG3uXb
	EwgEA7YYvLLJ00jgZhK/InVVsjyCK3FqRcyXQm7d31K7dTckVeeBBD2dTRcivABAFp4dYUaRVknG5
	N6/RS6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScAY-00000007FKJ-43mD;
	Tue, 31 Dec 2024 13:20:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc8B-00000007EqF-25Bq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:17:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436381876e2so14901525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651074; x=1736255874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=rVlPPpI2uabFAekjMCS+T94i4NC6ER7zodWfVpa1jQla6WsZwFhy5KPbJkIU/AZce9
         xQu4tuIG5TZLOzxJZDg2DK4QbjCnzIpjQfBjEbgovw9hZ6eZXqzRiGecmrrKktj9k2uN
         hQ7EivV1hm1Zrs5pg4Y2WK3aj8pSOgn7C1mA4dz1BCSfwnM4XHIqwLIXQejMCUOoW4BM
         F1drZ4apYIA+X9G1uJX7giThtFwANo6sNIG/SCk2hsruzDO7qCU4LkdCuvTswYFVRv8l
         oYYS4iBt9XKJ2+uJ92zSIBTA5xwuCXOquUBDvEeaLbp+H0eVdspgP01OwCZRaRsexIIS
         dtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651074; x=1736255874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=XrnR503wOM2oJNihKGr0ihorWnPRHnjc9TetqapHyWtzRZcO7lUdjIdI8l6lhF0gD7
         Et8QqsJz4KEau3XRXQjrihId02XZWA1HDPJdbtnnOzu/taxutGCTP6VsW6A1RtxJceBp
         rEXcVMWXXSdaV6JBgOzJf4C/Tfr9qlcWqsLscUMXlfR8xTH2h3BVGFsvaKTQBt9YsgVu
         FZo/f/hMEW3sD1hJ7rfO9EV0QMsDP0AqQjzafs/e/h/yAYh5xWdVl6Gf+hm+kn0FjQtC
         uT459ZvXcCjQJ0b08Il6tR0hkHQgr4gS485MlriLwU6JuoyBh8PQ4OFhA2vzAXwsw8NB
         tjKA==
X-Forwarded-Encrypted: i=1; AJvYcCXYEI4Zcc0GepFP6xyTcFoIJOPveYRlgPtgV/axyX0oMPSb5QDXugSr/Ncbna/aJdv0t1ksso0pMFVIxuZXQm8O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw90ov1tNE4jjfXi7np6dC52shOvLj5d1FRNpvHUAx1z7psgsUt
	ulCyC+M6HBBY4BpvQCxbOu+VYFfQ0UYyKI0RUFoXzmxAVJ0YeLQ849zwU/s7vE0=
X-Gm-Gg: ASbGncvYpdN1xOKxrfOBXX2EnvTkqrfBQoltukz4glu1rhMVkoCYLTP1+vgyVJ0vLMT
	0Y6d/Y9cw6rRl0i6tRgRVLgfRqiCjXfmd68vXooSdGKjithaanr4sxBz1RrLWG6LQMwNhZGj9HC
	KELTzhq+JPwHnYk8856FOsgzMEApIC3whzcc5GySuERFQ0J7pCBmuWLvg2uJsXXefRW7+G/kqBZ
	sTr1m/B/OyeT/dxoOqK8pYzxqjCbeoMTZzaHpz4+Xzh22lxiSd5+R6kXME3+RmM97yHrKY=
X-Google-Smtp-Source: AGHT+IHwIcO30my8NO1sVZZTyNw2buq1F5yrDPPMvhxLCGfi0UoB+FAXsU2f2Eydww7uhdMVOiJeJA==
X-Received: by 2002:a05:600c:358b:b0:435:192:63eb with SMTP id 5b1f17b1804b1-43668644155mr137490065e9.3.1735651073685;
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [GIT PULL 2/4 drivers][PATCH] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Tue, 31 Dec 2024 14:17:39 +0100
Message-ID: <20241231131742.134329-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051755_537956_BC6AB9F3 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Add a dt-binding compatible for the Exynos990 PMU. It's compatible
with the Exynos7 PMU design. It handles system reboot, as well as
other system control registers (i.e registers for the USB PHY).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Link: https://lore.kernel.org/r/20241204145559.524932-2-igor.belwon@mentallysanemainliners.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.43.0


