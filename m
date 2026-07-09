Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mY+40GHIsfUvxGoEyM3B4UK7YBXR4Zoh8ak0Z/sMJt0=; b=rBzAc8ICS9w6VKwhgKRT0+yKvu
	S+l03hcQjcD1Xy+GHZGN44pPrAm6aQ7hQwHxHw6G0DXpSf3FUG5LOPRTrg0eAt+IgVoNlBw88Xq4c
	Nd0mzWTqIx25e30zNgjHLk3oKSyXzHzstzIXrUqpZ7gPT7m3CJpuGtR0xXB8pYQ43ilr0/P0UZaLY
	2yB9dI97uRgtlYN0xKbA+WKFjXGqlq6T+40N6heVCAmjhVXfFpsARJSuoqcuPxB2kKSdA4nOxVB7d
	QmbfHBltRVFDYa0e+1Vm72UeMtp9pTtZe+EfKM6QTVCqOMXshKwNAZ0IdOD9oDdeyjM0CNdfl7s3J
	KOiTdf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnl-000000028Tp-1yLy;
	Thu, 09 Jul 2026 11:20:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmni-000000028Sm-35PV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so18370085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596016; x=1784200816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mY+40GHIsfUvxGoEyM3B4UK7YBXR4Zoh8ak0Z/sMJt0=;
        b=DYrXWnBVC/vA6cYMhMYkXDs0ZHzCdE/lYiH5HiDxcFmmof0Y/l3LUSi/7S7irWMki/
         yNQcHaGEbYWjVoZReuuAAW+ZdtSppiEaR3pWvMljURu3DJD91eH7B/0gMqVkkxh+Ov06
         1kekEnVw1fbxBced8mTmUOqf9x3m4dMXDUJ9tViJzCyO7GR+V8SG7/SuBGSB3ga9/OQ9
         OAltWN/3KW1zNHGTlAQwohTijv2KF8FN1XboQieBFilOYx83F0nqmduGXhEGKhzn9zFC
         GGrXuVDFMi7g5OCH6kbBZuqf0LaINJpCAq0fRzSWg2OfeaWW/aI9aoS+kwdTK4fe9pCL
         pyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596016; x=1784200816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY+40GHIsfUvxGoEyM3B4UK7YBXR4Zoh8ak0Z/sMJt0=;
        b=itSEn/7gMOwd7Wc3EwFGDfIFSxzjz19UvrkEQNmahDG8ItLfbgboGa3n1NdBjyKas6
         88wN/Sp2jNd7B/QSPj6Vt0PHbKOg7FQvCEx1wj471zZYhd4bNrlCELgQcWKDNVdJD2zJ
         WxP+bzi9aSoAMadCEEv+M32aTjU9jyb4tJZjNuHg1uXQGjfjXxPq5Ck6OCHuMi6X06aI
         o9bSXKWPF/RCb8fyQe3GgTeJCFHhSNCtn9seDgbGPMgzb1i/XTjZ2EsuK5m+ZL/6mfrR
         A22krKLHBi3mFEfSoMCPKSdorTjdKfdqh1DFvdLEQK+0ldOqHr6aDXrmkh3vlnWeZvhQ
         bleA==
X-Forwarded-Encrypted: i=1; AHgh+RolQBBD9yzCg+NfboNmNklGmEihhfi2sXiDvmojoSKNW9tGyTJw2YO1Iqijh4nvPFNBTD/JcFTnNTH9q6JmfcQo@lists.infradead.org
X-Gm-Message-State: AOJu0YwfTA1JXAIIkjwK4o5OikxKUv5OjhDa7kQQ/SMBStuLlHKlsCGs
	+4DDxQmi0VyNQBhW6uxLHn08FRAM2TE6MqJFYfSCeD6hcOq5s46mj/9WzfZrS02Xycg=
X-Gm-Gg: AfdE7clXbZv0dz+OyfAVsXQIW1HtruPNsW4H2c9k6Ec8/kUBAbWZKDGymiPaZrzf2ur
	IH7ji9VuvQrg3Kz85P+ffrgRxFAd7AIZH16OeEn8gO9IsUk/CWkkCcGOehl0SGGRyDQDF71pShK
	xi6MzeQVWlT4pofLeNeARLIBT9iAI0hPW1T+yXAPs80n8pWcOAwHt+Bf/8eKYcUTOSPUMCbfk8n
	tcOmhwYKKbCRPH8e4tdQhRpZYErK1WsF4y4MOxfmJqN04e+tPiLbkR8Hg80Wa8G5/qBAhU8gtKH
	sAw3sh3N+JKsm4Lz8dJTy6ynbbPRuv994ZJTnDhjmNzPnRe4cD3ssaOj6ThPydZbVDJUWIdncoE
	OFnuY3M5k+vn0ArN7Cbg0AjzypUh0JZ1e0BtoBQLk3T4W9Mtrv5loYBlNa3kP80tGi9Kl3mUoh7
	7tFrlYTbsafDhPJlKnwG+BcpioF1ca2Ut2s7tLxEEFDFFiFSQ1PrZ2iNvinvSLwZ9/2HfzR/mt3
	XCOIMBGdXNaPopQ2jDcJOHO33GhsJNsmWbgB/Ib4n0=
X-Received: by 2002:a05:600c:3491:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e7e82e10mr58748345e9.2.1783596016565;
        Thu, 09 Jul 2026 04:20:16 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:16 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/5] spi: atmel-quadspi: add support for LAN969x
Date: Thu,  9 Jul 2026 13:19:06 +0200
Message-ID: <20260709112006.390742-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042018_816136_044CC0C2 
X-CRM114-Status: GOOD (  10.47  )
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

This series adds QSPI support for the Microchip LAN969x which has two QSPI
controllers based on SAMA7G5.

It requires pad calibration, supports DMA, and supports 100 MHz operation.

It requires a different init sequence to SAMA7G5 so support for custom
.init per controller caps is added, and existing controllers relying on
checking gclk are converted to it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v2:
* Make the DTS nodes apply on top of next-20260708, as SDMMC is not yet upstream

Robert Marko (5):
  dt-bindings: spi: Document LAN969x QSPI
  spi: atmel-quadspi: add controller init callback
  spi: atmel-quadspi: use init callback for gclk variants
  spi: atmel-quadspi: add LAN969x QSPI support
  arm64: dts: microchip: lan969x: add QSPI nodes

 .../bindings/spi/atmel,quadspi.yaml           |  1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 33 ++++++++
 drivers/spi/Kconfig                           |  2 +-
 drivers/spi/atmel-quadspi.c                   | 78 ++++++++++++++++++-
 4 files changed, 110 insertions(+), 4 deletions(-)

-- 
2.55.0


