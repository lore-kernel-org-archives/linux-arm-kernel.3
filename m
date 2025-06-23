Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=; b=2toideTlW5jfDN79RrxOtuZqTe
	q2pWY2CfEJSdzHuR32M1srYm5RKVr/qIgnFKCELc5/FIjyGCneKh6BgI/Jn7TsvHgbA2EfQJ+m+BL
	hXDB0buZWpA+7+nuwl9+fsIShMVw6GpajjsNXYac5ZwyBqrQQMwxO2JG7m6fLhSP1reJdmaNCfZ/t
	fb7E1WLSaivDZeLd2InrY88jFqQHYS1jFpBV2RyOGcQx08zuscvZfZK3X+uIYNRXlDrOrhYvyM6o+
	KJoA80IftfeptJTvXGzKm1qj0BN+4L3hnTUNk61ctOerI/36gwnC/VSHT3+yTuWRAVb1E3ihmDytE
	L4F4YpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZR-00000004FKz-1AJ2;
	Tue, 24 Jun 2025 00:31:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlPk-00000003chJ-08ld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:57:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so10742394a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701422; x=1751306222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=MDKWY/MmmdQV7W90qlNCOOLCNHUfUAHilwd5LNymaeaNYnA9U3pA8jlbBh2LXbfGiK
         muMFFVpbB+P8Ww/wiEb6rlgkUJou9mvfsSEM3dcxnfh6BB9tCAN0zGCROibvIu+j0omV
         RketNcJM79LAxbp6y7bKWEpONBly/IM97TQU9M5VVkTfFn7tKtbP6VQzgMgDoDzIHFy1
         FW7qhpZwbh/hYRCGXL3TCDPIt1zfJhNFgxeGcrv826jAqYGikr1Jf9DC4jiCrcUcg28Z
         h9KMF7BDzMEZq64rP9w7auitxseAC7ko0lksDWAKg1IA3jan33bRyOfgUrC+j9xgAh1t
         Xp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701422; x=1751306222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=CCw5MVBJdjTObFmf5hugDMQTsOCSNMnUz4Bc6jDXDo4Iu8xRmjGdntRZvh02INDFiF
         tiLiGW963oYyPtGLZauOs3SY4hwsBZSNhh9vnGvN1P0uNCSjH+umEr767qMuSbmn5zw8
         GT+KJ1mzmuXQNLQwvc99QOn/ZF7CYT0OLRvAFEON6AsrUU3FiDZ5AyaWZKoMoY2xw0PA
         mxzRPPbS+t5mOPWgIYW44i7Z4ClU/+EvH4ZjYOLUbce5FWQzd6/LJtKgK4Wy4l2IdPsA
         Pv96rvLK+G0Ki3EkePaHuFL+GGCaRl7jznXDnT/efv748H4caQ6ftjF6lDR56+0Qz+XH
         HdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVgqtN2tA2uAHudObi1XvWWY4hel9ANqa+Q34jiN4LNwY0v2qyjGu7GLz+yrm7ueZOukzcadtSqKVZfv6MrUOFB@lists.infradead.org
X-Gm-Message-State: AOJu0YzlV/7qNZFU9acEH+ygUdWnWHxgjCJZTULEqZHye5zFVcLK1Ugi
	8TcUZNBCdecV6hBZMnq1LA7yTcqZavnvJx2zwS+EP5Oh3lp18Dp8R/M5UZpKbQ==
X-Gm-Gg: ASbGncsygfQDq+zp41k9J5uIfc6MGRjz0k7P3il62UvCc3QoL175tySPoEJz+gM6wgs
	RxWyehSPlGNwyEPly6O94Q7QqO91ejuRZ5EVxBORlfkXDC+76Bfx8DEG6b/WiwbiiCZHg9gis/R
	AS9xCx8YpA//tDKXalgIRnDh6pfgF6T4Lt1Vq6eLYu03izRzwLXuAA6icq03b1+BRfjWghlL+IV
	5aV5P3kDnW/wVDM/a37lMkjrHCYZWZ8MudRefZ08UY59Mje1AHzH+DUX2l6Em+5aOR0CZ70/nTC
	hk6RUpGWYzv1lqWp2tvS9KfRvaw4+jZ6/WfjqIFeQEx4RRWhrzDVe99cW68JjYwgeg==
X-Google-Smtp-Source: AGHT+IGuAcG+GXrfdigNkDxStpd+S8OA8ZKWEze3cbtEMBDblwvHmNJAD3Ekbk37wTL6q0w5F0fZFg==
X-Received: by 2002:a17:907:9558:b0:ad5:9ff3:c6ce with SMTP id a640c23a62f3a-ae0a715dcd7mr43147766b.4.1750701422257;
        Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:01 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:51 +0200
Message-ID: <20250623175654.844281-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_105704_069726_7FCD1B30 
X-CRM114-Status: UNSURE (   9.47  )
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

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0


