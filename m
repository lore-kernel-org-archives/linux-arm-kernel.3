Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41958CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=; b=boDlCpohy0V9jYoGG7Pp+Y/xCu
	NB/AdMtqdmVZCJLsDPXu0W3dgOzvBYSlPGMfwPpM7vYN95PzIQDaCH41YG48gOZB92/E07JcydzaW
	f9EsK82G3ES5tAZiO8uQym16cvlc1Zn8CocHxLZ/k+e/GwGgV2OaSLl6xJOfLMs+E/KaNv5UryX+B
	P2RzA/5gNG569wgPky25CUxcnkWfIA5oSSi8o8Up/tHOSEGtA2hZ2iKx7aAphV0aCERqOa3Pik4q3
	krQmNlEO/WG/nxtqvqpwBZUADLH6x2noH2u4c+XM2q1QNaHb3PPu37cN4C7Gho4aa85QAyZ8iwZSV
	0i73yggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKq-00000001uYR-12El;
	Sun, 14 Sep 2025 17:16:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKn-00000001uXj-3P3X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 17:16:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7a16441so515645766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870176; x=1758474976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=m78gkhOTzIaObOqI1Hi7ncat/4hQa43o7kV74guZRZ9s+46itkiu4Tj9P+giJXLy0l
         7rZp+GQ0HGKPvR4AIsWjzYCOgTVdQPirI9nyCdCEYhcpHectRIFVVs5zvliLT7MuKRFT
         wrpAJribI1KRx+JrXuHhQAJclMJx0ESW+r1OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870176; x=1758474976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=ZsgDNA8/zFTUqKw/+NKFOzrbJfnN1Bwpo6pUdol6s7B+Ftiv+n1vT9D6tuA4MQyI4y
         54jqYIo/3tDDj5gS9Wz8972SJQo6c1FRGqKl+WlL5HqTMRX3BLNAkX8BoZNcxcZii26S
         x9t+n4TqTVLjwmGe4iZWHTmS67WO5V2Py5d9SVRKVWxXher97mfnxKxEqM4Hk6IlxPqy
         J7Oqtot2VdezucfDrubAqdpKv06I6H0xEyUhNN28g4KcRUE/tPYEDibcVxkXRncGUbdw
         /qX2JCuPeDrMo7oO2yiOQdJ/bPMij/WIWy6hskoVr5lEXPXS2MRwyK9pphxZJNRcipGn
         J1aw==
X-Forwarded-Encrypted: i=1; AJvYcCWAFigVAo8+pNCCMcY6LpAc9drx9oqM28a8BRtoXJvlw5JUgktM5NdrfYVHwYC3DWbfXZ5/A2HISp9VpiiGDeq1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5X5ja2skntKzzwjEcSLXJYtv6bzo0OdwkhRpEZ1YHc2uMsmSW
	eTbTU/LStP+LvWinzj9QXN0pCXuh+hx7rcrnF53BahV34222+It0oBqqHgIKuDR2DKg=
X-Gm-Gg: ASbGnctWFQtxZ9Yu76lVIGWvXgDA50DJExCSzqApdn718iMorLySjtfHoj56127gfW9
	mphctIeBnxAUtBm/VflOathpYf4mcWqCEd7p1XZLmoXUnENq+yWQDd6lTNzr1sHkp9UwQKNnb0W
	RoiwmpA2x7FPuQbMHFlTWrKNPV+94LtPRaUJl+neIriYuBizW0vh8kmty67m0l2xRkrq7WS2OQu
	r790U7fjKdchP2tMwR4aJfYm1BTm4qXQb880qXSZW+n9oS8trTTAK9sBWcYB/x+KQWhJKU3NAxT
	YKSz7EfN0iOhpd09xh3rAMvKyW+fo2zXBqW1iAdfRpKoxA5n1E6Y4N/BXslFeRJPylidzRc2vCq
	FvoxBLUq+c8d4MD2ob2dL6vrLH5DaJfvStSUxYAjrGYSS0+qQb+dk1R/Wa2/yHsY/a09lSrdBMc
	VrAIT9k9ghdLmUq+4soJWjdENCXdm0sl/KeloHJUJeFwTC7/2G1wpi1vz0VBxyfoMq4KyTOYbRn
	Pg=
X-Google-Smtp-Source: AGHT+IFNtfhow60LKf3kFnxnyjXUZ4Oc4lyoGvrn1vqt8LXeEwCDevETYH1mO/LwuhCnJBRIxMl4VA==
X-Received: by 2002:a17:907:1b08:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b07c35fb999mr990822466b.40.1757870175496;
        Sun, 14 Sep 2025 10:16:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Sun, 14 Sep 2025 19:15:57 +0200
Message-ID: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_101617_894202_9C903CC1 
X-CRM114-Status: GOOD (  10.91  )
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

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  15 +++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 98 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: tsc_de_glitch

