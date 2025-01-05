Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C02E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=; b=pageVTi66pqIXI/mnomV9g9Ly1
	SnGleiZnkgK9vHj6OMSDI9UAY0L3CUSkzWgcuKU4/uaOpdAhFeyYihrbSGSuK0bWKvVczn84o/jjp
	iEWhxfWu96Cp5cJGdbh3T3Vp198wHBGSaQrEizzQ6Aq3eTIs9erj2nXP4ONCP6S/pqEPuB7pxc13d
	V8/caQ1imMmIKeUqSh7g083+hDVAC31zWsdF1lu/T4/uuoxjwDweAOC3wdw9zd4VjiRZ2WATXtom0
	oZE4vPRkfK1OogIv1A12tkAq4Y8O6TF9YX9L5bx2s1Zw/nJvvuxer3uWNBLNOJwNW+NrFyjmw/qfa
	ecbv4l7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVB8-0000000HFAQ-3UKs;
	Sun, 05 Jan 2025 18:16:46 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUV9w-0000000HEvH-3kKw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:34 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aab925654d9so2408463466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100931; x=1736705731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
        b=P6nwzupR+OWmKz9PGbK9dFrG+Pr0k53bt6s7oLDydplcTK2i9EfV0JmqU3KHLanSx2
         Max3nfja49r3bt+bU1FAMJHeQkROvxFDgg6CdBa6fptLWj8BfwdJ4TLD5HCR0zwbVznD
         b03e1iCa8Kci5fgyGMvPxSIH2pocHcSWsmSeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100931; x=1736705731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
        b=NJDvtCPG9wGsOHjgCfyL4CGbZYDsIqdvH9HfBuu3og0Jn7vQvUUUdRgd+b5/bUslUP
         c4RrKTin1E9+o7zAoGXtG+IkmL642w/iLE4rlIK76Yc1oXAh8Mm4o6uKPxCxjuFPWoKl
         Y2Lb5W9ZRwMwZtWFINHAq/HTVURGINxqTvtrIjR6abaxvT/zoB/mKd5ydwJH+tTZDgoD
         64Q+dVS+dqH+DKYMyypZ51GN/XVTj/6NnLwVNT/AShSwg1JLjgbKQjgLm5gWH9721Y8X
         RmWuRmcVv0cjGtcD51fHAo458rEyVPjkTppGqGDdbhyBq0WMwjpTtyAKnAsHyWYAoIFW
         HKTw==
X-Forwarded-Encrypted: i=1; AJvYcCX/72a+1pst9is0An9KbMtNAKpkwrCyUBqIhwFEt8vjKCfBh6LbVR0millejjAtDCRQwCf5BJgnYMB3qcz2+t9t@lists.infradead.org
X-Gm-Message-State: AOJu0YxLexOu7qBb5Ji6DS2NRAgT3rYKuFEfGaQvKZT7BKOTcxeKu15/
	yRIFM4TJcTmbQUnfWCX/gQAh/3xFrxD6ZNGRKLyCexPC/XlFbHXgNI0fxE2X0jA=
X-Gm-Gg: ASbGnctebe/ka+4AjsggHiSN1A9rXpTEITBI0hVF7uuFCQOQl4+K17HxP//wegCHFRo
	QaRAEgJOTVYJw5wmJtZNaCpNNiLu3dAjY+8uiC0BkxVCNiU1soFHeUim/E6putBNOD8R5wlLuKO
	oIUyZnMHgd2/lkGdZ0P6q1dEXVapnl7Z2QWbEaPcf0Ek6Jw1Ud/GrbVZYttAjS2VyqBi4DQCa4I
	cf7Ophbme9Wjt+VGFYC1VYmcT6jagHXHhOdxoQrt2JV8m+S/PrBQrdw9WzfMBxR/4DRptEn3pMQ
	uS0jyB7v2qdqXlYlw7EzKnTbI9ze2nNB8jY1uxExCuVAxFHpy0LRP6sIagkIYiuy3J+7lhaBbgI
	wUhWfE4X6Xsm0vW/r0Q==
X-Google-Smtp-Source: AGHT+IGx5I432/7zv90tAswquFGM3JlzRsAxUeSnbD4QR3LNzbPaGo4Vdu+XKbNBzzfORLPTWC5EKQ==
X-Received: by 2002:a17:907:7dab:b0:aa6:98c9:aadc with SMTP id a640c23a62f3a-aac2d45fb01mr5099786866b.31.1736100930471;
        Sun, 05 Jan 2025 10:15:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/6] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Sun,  5 Jan 2025 19:14:12 +0100
Message-ID: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101533_001513_DEC70C76 
X-CRM114-Status: GOOD (  11.52  )
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

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of st,stm32-rcc.txt according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.


Dario Binacchi (6):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: reset: st,stm32-rcc: update reference due to rename
  dt-bindings: clock: stm32fx: update reference due to rename
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 --------------
 .../bindings/clock/st,stm32-rcc.yaml          | 170 ++++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 321 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0


