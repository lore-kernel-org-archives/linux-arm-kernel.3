Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE0AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UO4ZpAmYWp4/F5rKGhPyqiik5BW8t5BEyIWB0ThHTVs=; b=EhylQrCMhgyaOT
	xw0b8ax2dU10bzeRzlPGtn43lDAz3nFFbFGNGMcCZThq6D1uTyqJ4/zTvzmmgdvkgTfciihXo8aGX
	35r6rVZ3Qemj6JxsB6ATpZMjN/7OzsdHYxUq6jGs6I9SShvX0LFKfYe/X2pAgPQdRHsCC4TsYxC4y
	mDRC8lmikm1wcu9uMPuBHNd2Sc9uiD4e3VLNyLOKM294zq/PzQWHw2U5FYMxQSz1xIkpBuhgaHMyL
	/7x9XIzmJ7udIuhc/nzDu31wsScWkyh6ZTv4XZ5zh1538QPgY7vhKToXSTEfI2AK2sLqmrsP7Lo4d
	vuU2GAf+tNkjFdDq1xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqS1-00000001uh5-2eod;
	Thu, 12 Dec 2024 21:10:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqQv-00000001uMC-3eFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:09:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3f249f3b2so1278846a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 13:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037755; x=1734642555; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO4ZpAmYWp4/F5rKGhPyqiik5BW8t5BEyIWB0ThHTVs=;
        b=d1zY7fUZ6vRh4qzHL2DL9NyyyCl4Z2TQMmtowT8YZQ3XYbkjHTZ6TSo0Zi8TEXIYN3
         djGoAF2SIO/+8Mz7msBq1kGAsgG9rtltb84A8qSZ13LRQ+e09Fiio+vTnMFhiSV/XV5Q
         O4wJv7VH1lDxSJle3kYACxT6oxCbH8ZMoAwfWbOfSpyLXJH3t01DIDzrRsTQy+H8P2a8
         34w1AcAr7jMzeUiGeiIQzRU/yRXqzhbL2AIsVnpU1gt+NimsDgdhPtdTFYWlSRFWf/da
         YDvMTZ9X35jqWF4aD/0XBO1nK6I3tEbOwY7p1qK5ltG+SvtxF4cBBnKktksJAunueuQO
         VUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037755; x=1734642555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO4ZpAmYWp4/F5rKGhPyqiik5BW8t5BEyIWB0ThHTVs=;
        b=p9BCrtQIFQvwQOJaav8iQz4kGCtd2zyETbUPPnPffxtwsSjCn7kTyAbrfTxcuubm/H
         /+rxjdPjADWzLwE/N+phHPuZAjrgslpUz8TBU3/3pclhQsZIhodmMQ9hyvKgX7tV+Xcl
         uUbcA0cIO25JuxFPG4kD/BM1kWrAneSouXn77JDhIGOjZD7w7H9kZzB4lMkBXIliDZbR
         P5v4kvurEPq82hXK4gsoivq/eMiWqsO8ALEB7M8RNFah1CONFfeJaFGMKSGhQNkGPwMR
         W1/fHOvSHjWwlOB6K1vm8baLZE0PoXHa7PvBPU+CvshNP/9oLYGsADyQoGn3PSwkGh4D
         UEMA==
X-Forwarded-Encrypted: i=1; AJvYcCWavfamN0lMOdUd3PPXxJLccV05iB7/mhpTB8J+npV1tRy/MGG2+frppQqIQNM1c/JsLpgsQppMV9eCzSnXeYE3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/3Amp4/7NNOYQses2Qnzk9pOnwgeSgn0xxC61pVPgH2XQ7wZ
	D1al4CuyB+Y907sOLAklGe4tKrBnncqdWEPt6G3LmY0782Wpqjs/
X-Gm-Gg: ASbGncupshC0hP7dRQw2kE1nLqr2/WTn/j12rJK9yeesjgoe+S8BAIZTLNI3T3X3Yki
	iSJO6y5D76ncSANY0YbPYD9+E1vDXyv+66czpgRkzgcBQkIXEPh7h5/53xcrxfP/lFak0ginf//
	PHo1bqUIaAElxf3HPBz0gxqx72sYblz5S0562dO05+JKkZdTWI/nImYQCFZPr56lGCFHy8VgT0O
	vtYFUr+WB6WLKPq8JYbgKQZal82fMUvSWwFpyapDPg6J64qgnACs/XOFMj1VOqEXYrg
X-Google-Smtp-Source: AGHT+IHnM8IzLGyED4qOi3bw6Se1FbUPjGyUA3xQHZbzHTeWslI/cln+zbu2cuEwfHecYK6pZPZXbg==
X-Received: by 2002:a05:6402:254d:b0:5d2:7270:6128 with SMTP id 4fb4d7f45d1cf-5d633bb7db6mr3454905a12.25.1734037755187;
        Thu, 12 Dec 2024 13:09:15 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:14 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 0/3] Add Samsung SPEEDY serial bus host controller driver
Date: Thu, 12 Dec 2024 23:09:00 +0200
Message-Id: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxQW2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0MD3eKC1NSUSt1UE+M005Q0oyTDFDMloOKCotS0zAqwQdGxtbUAAyh
 611gAAAA=
X-Change-ID: 20241210-speedy-e43f5df2b1d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=2587;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=bXEP5QAwTbHywlDHiYHTSr5iNZb/Wdfp8n3pBOFQJCQ=;
 b=Qqa5y+6+LpADpVtQzixuS2lfh4uSGGJiNsRJi2hz8K6t7nqieTFL3Z4fHoGqM5N3KIF61V2wE
 QZS9ce/cCGVAKXAMn2bMaLIMX/vZONzA6xrdE4aCE2oFzVluzcSbPlF
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_130917_912730_7EE9B23A 
X-CRM114-Status: GOOD (  16.40  )
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

Hey,

This series adds support for the Samsung SPEEDY serial bus host
controller. Samsung SPEEDY (actually an acronym) is a proprietary
Samsung 1 wire serial bus, which is used on various Samsung devices.

This driver adds support for the version of controller without the
IP_BATCHER block. It appears that block is a small MCU attached to
the SPEEDY controller to offload the SPEEDY I/O tasks from the AP.
IP_BATCHER is found on Exynos7885, but not found on Exynos9810 and
Exynos8895. This version of driver should still work on Exynos7885
though, but the IP_BATCHER is not supported at the moment.

On Exynos9810, SPEEDY controllers are also mapped into MMIO space
of other processors on the CPU. For example, APM also has a window
to the SPEEDY IP, and it uses it for power-management related things.
During testing however, it seems that if APM is not active the AP can
access the SPEEDY controller freely and without interference from APM
firmware.

Things to improve:

- SPEEDY host controller has an interrupt line to the AP, but current
implementation uses polling instead,
- add support for handling IP_BATCHER block,
- add support for bulk transfers,
- test on other SoCs (Exynos9820, 9830, 9840, ...).
- runtime PM

- Markuss

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Markuss Broks (3):
      dt-bindings: soc: samsung: exynos-speedy: Document SPEEDY host controller bindings
      soc: samsung: Add a driver for Samsung SPEEDY host controller
      MAINTAINERS: Add entry for the Samsung Exynos SPEEDY host controller

 .../bindings/soc/samsung/exynos-speedy.yaml        |  78 ++++
 MAINTAINERS                                        |   7 +
 drivers/soc/samsung/Kconfig                        |  13 +
 drivers/soc/samsung/Makefile                       |   2 +
 drivers/soc/samsung/exynos-speedy.c                | 457 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-speedy.h          |  56 +++
 6 files changed, 613 insertions(+)
---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241210-speedy-e43f5df2b1d6

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


