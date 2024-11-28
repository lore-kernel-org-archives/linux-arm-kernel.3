Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAB7D69117
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aomBrOkJJqCFmjpN0sU1576SH9xMwR2JgmGtI6ewTOM=; b=ZGhK1MWsm/O20FV02zy9v/49Zu
	jx9BsayBYpZalrMiLy79eDrFzRRaKQwPxVcS4d0xVd45zc9Slo8vpCq6DqL7Fv8JZ4KjeYqllFVwX
	5lmD1wJzyEnrMUdN35hQEJveKkgxlspXvs8IBUNzKGcwKA8LdReY4nRGMIX4z9Z27HgibWH7w0F6Z
	lsfjCGOpsUukQ2vsyCtfEdJgJ9h1dWwG+Kp7S59/xCW35Tfr7q1vd+tACaBAedBuJxabMjhtsRqqX
	yE0mx5doWQfNEHrhTl2ESv7XCxysv9KTQlR6sGW4o3I8OGm0VTrlwekT1b/nhtlVcxL+X+Bk/mkkL
	kB5wqF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgP5-0000000Fspt-3GYu;
	Thu, 28 Nov 2024 15:26:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgG9-0000000Fr3z-0j4B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3824446d2bcso819429f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807007; x=1733411807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aomBrOkJJqCFmjpN0sU1576SH9xMwR2JgmGtI6ewTOM=;
        b=Yad1CDvNO3z7Gs5rHoT5yO+K57UdRnvNLEGsv0tnAnj5mNJv5NmFRVrjx9QVxjK62o
         qIySQnJA9yo1e7vRDugWeG3geO6bpqmvzW3ktViEoZU7XB4ezfEVdzh3jWI11MmavQPJ
         w6VQuLbn0mou4/qTqBJ1CYqUgtoIBVYf3at94uOXA+unfS/4PKBUQgvXOUYm4NmDW50B
         Em+L9m5BYMaOg4OZn2rDQ6F7fjercaeREKZXnE2wXmZ7S5zXxqS7kWwpmgONBBYQUFMY
         30LXw1bnuZke5kGdjEAqanKvgbZ27Ah7BGB+3V+r+x8nAFjIQx5lfYogytu9uWn4+lP9
         A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807007; x=1733411807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aomBrOkJJqCFmjpN0sU1576SH9xMwR2JgmGtI6ewTOM=;
        b=fcExxR/8vikr/NZhbOPafjO5uvpk+uIMstNaZIVxyNGIVjsEpun5Gr1ibLDvMHUH1c
         Mae6Qd7cjoXGRf1/jUgrG3bkYHymLwuq3nP/iqCwwz+x8G10z9PKMMycZgIaFAlaLGtJ
         CD2Jl4lMcYqW/Tkr7msduXwdCnkG19xX8KP+kv2TGrRE/fPrj/oE4jYgw5J64FQhqs0v
         76VfHyZ3tOe+kw/D3QOdMAhT6IC6IbBk1ZAS2ZP2Y8miJLmYFL3nh1iUHDeeMwGlUMqh
         DfBCVpss0pS0+vGOWZzJ3lZiOdwXAtm42YXNHhDU4EwYBjuApFGugyxojw36SN/FkaFQ
         5V0w==
X-Forwarded-Encrypted: i=1; AJvYcCWk6F7WHbO3ayGsXKKGWEPfVp30yvTuEos2Fnb4eRZlV300XoLG1Zo6332yKuiW9o5lVH/UqtW93VkZiTkV7baN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LfXswkp95VHG5sh92vkRAnhWSSDShTUNEmtPWd7UPPn6tRCD
	r5hd4x8wcaEcmB+CGm1ElXoGGXLrcbeQwRMuthOIUMhQrC5s6CZJgDuO5/FI/Ys=
X-Gm-Gg: ASbGncvtzqOoqv1LeT3N33+E670O4ZzBMfwmZK/1NcKfdUBp5PcUxGxODBPJeugpfx4
	yPeWcWWnXLGYx1k707rchvg11P44crIqsJGH2d8pBS9+wPBM8X0BqkdOQa9eA8tj0KOuM03iyTR
	Gvhf2xwNS8qRA1bgqrilySdPHLs+JByK2L3AqxSyLLrGa4DKQ/AL3PkZM0Uz0PbHJDTonW8zuXs
	+ab/c3qhfQQ57GE15WciubNYz2QmX2EOe03Q69MR6ca1R3QnJlt18WBU99r9UoKSE0SCWM=
X-Google-Smtp-Source: AGHT+IF7qgUNEDq9uAPoX7zFnn8oEdvAgf35U5UKLpooE3ExKagukoVva5liFqR9fUXeHbx01NFzAw==
X-Received: by 2002:a05:6000:156f:b0:382:495c:dee5 with SMTP id ffacd0b85a97d-385c6ed9398mr6786903f8f.37.1732807007345;
        Thu, 28 Nov 2024 07:16:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:41 +0100
Subject: [PATCH v4 1/5] dt-bindings: mmc: controller: clarify the
 address-cells description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bPKXnWow3ydwEe/IecPN0lHWVn4gH4zGjIg/TjrNdgU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlbr6WRJYLRcaNMGR1ncbaIe+itmYl/XMH5M90Z
 joIxdeKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJWwAKCRB33NvayMhJ0feZEA
 C9LEvNiEfDbR3jqabZ4gFHy7ZUW5EbzWJ0W26BSURiQQ48SZHz7YI+BAzYI4t8Ye1WSEZzdb3YpouL
 JhELBxJ1zoatxGPGqUxZWHIIRKyCJXgqFpjXC0tnDNesryqz8UyNaPODROlGOzKDKpywGED2Hpg0Kz
 rGpSyPcPyIoq9sylyeBDBzScquM8WbvPq7bM5/YrfwTAw9fUOra17+VP0zlpzdqdbUVvvsVKd/Syhi
 d4oH3lS049viIYLcKsLuZDF7UeuSFuCl8gnvWbsIU67zuqv3QvAILVR2MbP/7e4TokZkRSjZ8IXj5Z
 KHPNpa5BTis3Z0x+AoGjxaypO5mrtfPtyuMV4wyqTQn93xcFuNfV0b7Ub+qwKumJHFsxvLsRc4WxRA
 6aLtOVnqY/TUdk4eYQfEkDaU91Nk7YaoBXlDESUIwxjVL0i9DgL3/7m1ILk6kxCz2Zg3XS7BbzGa5y
 8hR3nPrgySefND8BTe18tcLV0NBHqO0fZWwwB19uxyhc+666aMWlWDGG6BrmefXzRLrg+bXoHKJOk6
 TrZa1t6qa6SUGuosce+rl/yEKumvdIAT33DV0miPxOKxK/e/aNYBSP5VroHnw/jdWJbMrTfVrqy7aQ
 8b6YTQxECEAJdUi49Psc/p95vh08kV7R+decpmDNi+7nq3N5UzFCLo/x8rEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071649_218504_1A977899 
X-CRM114-Status: GOOD (  13.06  )
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

The term "slot ID" has nothing to do with the SDIO function number
which is specified in the reg property of the subnodes, rephrase
the description to be more accurate.

Fixes: f9b7989859dd ("dt-bindings: mmc: Add YAML schemas for the generic MMC options")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 58ae298cd2fcf4e03b5b10a4be718c7b77552a7f..23884b8184a9df2da3bda5f86916f2e0a5d502bf 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -25,7 +25,7 @@ properties:
   "#address-cells":
     const: 1
     description: |
-      The cell is the slot ID if a function subnode is used.
+      The cell is the SDIO function number if a function subnode is used.
 
   "#size-cells":
     const: 0

-- 
2.34.1


