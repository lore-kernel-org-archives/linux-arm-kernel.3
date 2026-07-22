Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77AEC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLAkjC7ZOsFkeH4UKT66qvPXrNClMizkw0LQHgeVsaI=; b=MmtLMBn5KwTmt+6scy6IGUu8OX
	TfDsgJE4jnlQj7ZjWnCp+Qx0x2skjQljaGu0+pwSdeIEb4ZrMbr05G3KX26rvk7qJv0pUPR9PrfS5
	FEIMqgPuiAewaRgwT4eSRTEm1yPvB6ReB77bn9r7O9pJxjpKU+Il/AsiAyhNZi/nJI6pKyNRducW0
	U5uvihTqdC/GE96UHg2nMk6UDaK8xjym3RawhlMg0Zg/fK/mmA4uiizLqVxstjb0lwPrubOIIjzYy
	G21V6WnCwOEWUj+IDGA3TdfCsJgYAvbaDsuybFGHKGwc8m8u6xvfUbyAx2mjcZOBJAxK+j/3lSOxv
	o0RZYEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgg-0000000BT2S-04gd;
	Wed, 22 Jul 2026 09:56:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgS-0000000BSwi-2g9t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:56:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11550335f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714171; x=1785318971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLAkjC7ZOsFkeH4UKT66qvPXrNClMizkw0LQHgeVsaI=;
        b=dmFSq7gg4zBST9ZjU7SOJt/8d5Od/zmCbJfcsllBLydiH+ufKVx/dxGp4bdciVNC6o
         7mIIpUL76TTyqmhpWiRomuGn1RFMkoX4hgPZ2z6N9oQ+SIxW8GKLb4nc9hKGV7LN3Qsm
         li4VY7sWivu9yft6hGheaXYTmsHNzF0cRe5wUoqgz9dgZlIpSoQtuEwsIbvgZqqbrP83
         DeLV9dGdPQskMVh2BV90lXCMX5ax/RqyL6bDKdMsPimtknBVxmizuCwpNiUlW8z0+4/9
         7F7UZa7BWz2Ep2TaX+W67OkXfQECtPWgPd/QJWwiKhccR9C9jHuq5m20P1drP0DNeGdI
         PReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714171; x=1785318971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLAkjC7ZOsFkeH4UKT66qvPXrNClMizkw0LQHgeVsaI=;
        b=JhS9bcxpZR4FVNtqMlMThrP2qEpwSGCKYPSTJ4IFcVqRQ5gzM+YMtcDnQ+3GzUVxm7
         4uYaa4sLNvzdyXXs29d2Ab9PaG7nX6MGtjRgA1hq6YXipyGgv5amoHF2PPa0z4BCEnAx
         IYwqMhm7qUaG0nTKevm803vckb+CpPlfoFvQhrQM050tErGyuq1cjTzw/1Do8gM74yKW
         D2teficrrY4Vd+9lizABCOFqXmK72QsIVoK0qshgJMZRKyETKBYAae/BPiL95QUV2LAp
         eJuSRR7Ru7XFI2CQ30ChAP1qCdU4Ig15IgksvgHrZIc8TWJYEYl194ErnaoOT2cpmYqO
         vrcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5jGu4NzHzcRX2QrBpmoA9FIqPw9d+v8jrgh0wDpo3Wz3t0ISv8Uamz7+ZW5q6he0moUM9dbOZObo3WDOxNUDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Odov/D+x5fbRU+tr224bXF51RN+lgGpyU4d0/nMbEvk9Yrj2
	XrxM433FgTvhPBGBuUh6HfDiQenw1IVrP+4On++M1TsJrOUVmGGd6Cnx33lgsQo77Uc=
X-Gm-Gg: AR+sD11IxjHdoHiVwP2ZES0AEYYkKI/6ev9EiUpFYUT/DFu3wh2QYtMvIszh3cNUIsl
	SBNKygTvpTWRJf2vJyR+mHd9113D0Pg7AUmVQPaM93e1zjqhJL3fF/HsDxoPFpUzT6fGA9ePc0I
	Mgn8v1aELLnrYFUV+qOrnuVWJRxW6tX2YqumCZy9NGoC73+iKmH0eLAss21urMIwK7A0Ew8AUy4
	bZ+ktxgFpNQcGDXb1EBZdOrGi6DioeN66ITAi+4fUJVjcbx1v6fFBgalJhconVB8SnAShgWZ/0Q
	3k8QWSOEDsPXcQJPxwq1fBcRDjI8MIWu0C2bhbN+kHzC9pDB6f6FyozR/I6JGZgWSUsdW+4Aopz
	V4Ht0XfmTaExycbQUxMHqNXE6zCj4yC3l7XBepV3LBGSAxFprlhDatehqSVXQMkXs3ZV9u2AIzh
	h0q5jCgO/0lgjaJtxCm++rePCCvuO/V4FdEw==
X-Received: by 2002:a05:6000:4b07:b0:47d:ef38:260 with SMTP id ffacd0b85a97d-47f6230aca5mr25975619f8f.27.1784714171048;
        Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:10 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:53 +0100
Subject: [PATCH v2 2/5] dt-bindings: serial: snps-dw-apb-uart: Add
 "google,lga-uart"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-2-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=UIAuCpn9sBr07oQ2RwIwe4pVzRGN2evRfhuSeBFU/iE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO2S5G3RXrgDdc0iZBu1hTMoCLLrgE6SJbjY
 TVJinLwtlOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtgAKCRDO6LjWAjRy
 uqBaEACecjhHzGhUtBGP2AxwpzQCb4I9hjLzjVA8jel/swb5ul1VNx1d33WlrwkkFTN37u+iL6f
 RToG6IHnRdaPjHsxUYQLr5fWNm2eb0Z84Lf7e6k2slRSz0W8CvExX797OFAIcT7OEiUNlZLsRMH
 ksu5N7kYRnG6YnvIf9qo+NHRWWsAG3U1RrrTAbtc0fQZrax1ruAc9ku5b5fge2NLdft9CSNKWlo
 rg4Gd/sQ5eoT7f5Da4zLKz3xnkt18jGUuqPZ8CZihaQ5eKs2Gf9zwCMU+ZAZsBgbpwXnHUhvZHF
 o+dcAJHqoId0jbRYc2rK5I8gBj5uLvTEr/Aug8sxICYE15Q8wVjI9UB4vQ3ds88Kehjw5OC3sN+
 /AfaQRq4yBX8KTFf2HDtl/IFm8Zg1pBDmkB4mROcen7Lly6fvdCBPp6Cj5SZFcn0jiDCD7gRMSu
 XTMVmblIjGBcMllV4+aYIjXsWabeJFGKxV0fppeVhQPiSUN/apDQbejChCTeB6wUQzpXyRvIWVS
 nFxJ7I8LlLBn/zGwuFKB2qiXM2Ak1x+T5suXnWeAvWFM/9nqdQ5kEqLRvsO2r2CRD7kLBvr5aeg
 QWSfClbNCzjPa6WsUkXVRyDc+NKTs+iBTjJLW/riV6YG4AooRnm8elO2hpnxbNr6yloQjXtp12X
 4gZTgROw5MX8Z3w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025612_697814_9CB2638E 
X-CRM114-Status: GOOD (  12.35  )
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

From: Douglas Anderson <dianders@chromium.org>

The Google Tensor G5 SoC (known as "laguna" and canonically written in
code as "lga") has a UART based on Designware IP. The UART appears to
work reasonably well, at least for serial console, with the existing
driver in Linux. Add a compatible for this UART based on the canonical
"lga" name for this SoC with a fallback to the existing
"snps,dw-apb-uart".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 685c1eceb782..24589466a4be 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -54,6 +54,7 @@ properties:
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
+              - google,lga-uart
               - rockchip,px30-uart
               - rockchip,rk1808-uart
               - rockchip,rk3036-uart

-- 
2.55.0.229.g6434b31f56-goog


