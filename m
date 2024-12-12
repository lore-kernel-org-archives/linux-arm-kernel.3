Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9Np+DbeleWAe/hMrNZ3/7vkOSfagGFzChoh8T5Q7/g=; b=nBd1sP6fYD5VWl+F6i5hE7On3F
	igMrU220dr+36W0v4Ot5+1BK578gKO4gRdnqaYUa+W7U2ZRhOedGsHQlTO7ZYHcuZ/KWmzuukFC9T
	TbSjl3OlaMlo12Knw7er/uSjTP4fQeNyvvGPQSl5th3xaMh/5i6GaBePX15Wtrh2TjNcRchj3+yS0
	uBjqQxbg3ruEq2zw6nfXb78K5yP5eXJtZ/JnmauJCYWBFlBmka87CanqVEwhGbNd17z+0qdnh0aYn
	iAl8EDz6P4DXm4ZCHLgkqfUgOIx8ipouYP5YqWMcS7sKmB3wY2VS3FyEZOWoG3PUD1O6i3evyf+GT
	UbWeot7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLheq-00000000GQo-24wN;
	Thu, 12 Dec 2024 11:47:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhdW-00000000GKH-0t6Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:45:43 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21644aca3a0so5224535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 03:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734003941; x=1734608741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9Np+DbeleWAe/hMrNZ3/7vkOSfagGFzChoh8T5Q7/g=;
        b=nqjrGERsIusjkRYz+oDomJIWZYoIItDz4d0mAoxLGwtYz/QPVMdiNNwnLethuOo9p2
         wZMfqLeIEZEito9PL8n5aijmf3QCKeIca2EhxcXC+LqAKNLy3DR9xImbv2I3madSIXjp
         1GEt5dnuaMUoT6NJLyq0a3lC6Fm4NEG/Y9HxS78ks4M4OdSPfuz9WAQ14BSZuBL5WBR2
         JWjjCt1XVQ3MK/R0/pSvpZwumBJGw2swDjhHCzAFDAIbDFyAz9n5CpjLw2ZUk3+A6xb7
         zkc04FTOLhXgnbSHp4eu52tLMXaunWBUpBjhFR7fKq6y4NBdjES+uPRgpFuDj2bZvsP3
         9p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003941; x=1734608741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9Np+DbeleWAe/hMrNZ3/7vkOSfagGFzChoh8T5Q7/g=;
        b=BFGZmrd/q2VJInXQ2G4QkHJ7vIAEpBOkMqupBakJgedqMN2yYmWb+EXwbFG5mYFrOe
         GEprcHlx/StR39TZaU2aJuVk0x8wt6UkPCrZyQ/5nVbGM9J5YDy2/7FIg61iJiBVmuZw
         P/W68IGD7fcmF/7MnuEgIAAqmBLqvYVm7V8MDaOdCLsKDyG4PEWRwYazskCNSCz697dJ
         KEpZyC9mP5qfkaxGhNeLe1LTYKkFRSiOeEyzxmz+JkjCC9ED+oZvMWxN3IMTjszdC/Np
         f8Al4OQuae+yIK62scqplZTlF0pvh40qwH+Go3hdRfeN+r29x77P7AI4LE4qG7YzqhPU
         uEBw==
X-Forwarded-Encrypted: i=1; AJvYcCW4g87Mz/Dr15fjEQnXFLScGPBYPSZ3Fkz9/V6SwZiMbOXC4BYNJJ78/FluFSdeFah/npAQK3NzZXe2b0fEKR20@lists.infradead.org
X-Gm-Message-State: AOJu0Yx73SvumaUTbeGGqdxAoIyRF/oHmIJfBkj5H+m0Q7WvAyM9t692
	4U9G2pm4zAXNBmQMzAkwZgHu1BPiVMCO+jkk1mcFGT8aDCtfurq5
X-Gm-Gg: ASbGncuRHcxvJF1yH+02XfqaBdxYruaoed/nl+kyEemWiHljKaCDmKVz77eg94wgpvq
	Uaqgl/yqhQM7GZIrXhcScF4RiN0xWR1CnUmliIanRb4upAvHZ8qhUpIAb89Gi3Sx2BgZcuOyU1Q
	vYaGtOX7uriVwGZ6130AzHio9PDoa98mG0+d3foGRRtEtVAjed8kkLWfT8gIXE0QVngP2uTmVdO
	ESAJQYsr7CGFBDjSs1rookHuvXsiG/+6KG1FxLcV4p9wjGXiaKxQ52bliApxoGWVWThimk=
X-Google-Smtp-Source: AGHT+IH2605jPrvrYOYHpm64kz+0y778cUpfFeCNXEuXyluuUZ7IlObxLt2pQqsdvim2N2t7Wbrs+Q==
X-Received: by 2002:a17:902:db0b:b0:215:72aa:693f with SMTP id d9443c01a7336-2177851f4cemr93926455ad.9.1734003941334;
        Thu, 12 Dec 2024 03:45:41 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1176:b16b:e3e7:580d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2166f648cc4sm47650325ad.187.2024.12.12.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 03:45:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx27-eukrea-mbimxsd27: Fix ADS7846 interrupt
Date: Thu, 12 Dec 2024 08:45:35 -0300
Message-Id: <20241212114535.558496-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_034542_250972_895C4ECA 
X-CRM114-Status: GOOD (  10.23  )
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

From: Fabio Estevam <festevam@denx.de>

According to ti,ads7843.yaml the ADS7846 interrupt should be described
via interrupt-parent and interrupts properties.

Do it accordingly to fix the following dt-schema warning:

ads7846@0: interrupts: [[9], [25], [8]] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index d78793601306..7ee1e8c3bb08 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -76,7 +76,8 @@ ads7846@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch>;
 		reg = <0>;
-		interrupts = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 		spi-cpol;
 		spi-max-frequency = <1500000>;
 		ti,keep-vref-on;
-- 
2.34.1


