Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F00BE92FD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGz6E3CsAxGfK1c5nO3wGu40/ZtakdbQb1FmTqKeIMI=; b=UyuU5gTa179da4EQUuu9tyHUEP
	KmYfuHgIdXliGuvgiZuBxVEY0SJc8ppG5Pv3e/zPcgV1+LFDaiuLA1SD/CVW3nthJdX9myq56ypB0
	ZFOfyFRTaNi26/tWe2E40r96SsA4KOp+i7Zr9BAWEK786MuzvM/I8YdJC+SKAf24PwA05wfNpcCev
	+bAMofQGK73P0Ai0LFJyWuM8L+vXMYcb1MYG9O2MZ1Lt/FO+ZIdYiXMXqIOufx7T3gpW7zvzPt/rL
	wPXApeHqXIBSCTFyxjWOEIBW4Qz6QUEZ8cvD2OEqrRfov0/yPy8fXjdwPcGOr7XbM+nkil/glmKAl
	2v1Mobpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKvq-000000045SG-1U12;
	Mon, 29 Dec 2025 21:37:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKvn-000000045Ra-0cy4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 21:37:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477632b0621so58804395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767044253; x=1767649053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGz6E3CsAxGfK1c5nO3wGu40/ZtakdbQb1FmTqKeIMI=;
        b=N+/kshmswQ+LxhrMIXXL+u3HKUYSavG3kUiRtvNhJR3fIM0zRgTmFEAsa4UAkNysN5
         VjToLf8YGj2i3lZZOz8KAC0jn+XhVefylbUKzrirTPq3sP08N9ZZMegLbIgQ8Vj2DeX0
         SC8Ma+85+E5hAIPP1xLF3VHvp3qAHm6QKNHWmSKQo2ZHzuPkOTUFUmFvmfwh12sbOemy
         WYYXrjHLUqvytmJKjmdeAj6Y2IGbRSSrlUvIIudBlrMY6W+6IxSWiWMBOublk6FDi26E
         FnwpPudbI2/IGeZhpyQwMHr3kyhUd0EHb3QzoWMQYJKNaIf+L6CknIPANObcFTcJ/Ffk
         +gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767044253; x=1767649053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGz6E3CsAxGfK1c5nO3wGu40/ZtakdbQb1FmTqKeIMI=;
        b=GhvZuRLu0HMbRxln8s6URjxADUh6nkI82ft0PLtEaHijeF8iPMRSlyfxBKWNmQife6
         QMpSkexdbVnj7FfqlvhBgtEh4LT2WMBW6VYvZLnXo80Be8E3CtaqZey7RYhzEPBDDpV9
         Jy8+AJ8VxE3b7AjwdUXN3dEZIrEPtHZmK86jepFAl6mBZyswefrOPoRBUg9Bq7xIaPQi
         0XfatDfVHtV1ojKU+ySCUMWduCiK0vC9G9mFBYtJZBAtBmutV1BqNbQjLKcYc4dUxd0E
         lIkFKuNeoQmeRikGDdEEpTxmnq0YLOpZoCHh49tJSCKCW8+FegFnrbYPgSzf0KHr2z4A
         7a4g==
X-Forwarded-Encrypted: i=1; AJvYcCUVp0bvciVvZAdvxQ4zK5MrbWUQm4Jg3YMhz5hhfH1A15lseMcqResPJTaEgC8wxc0Vlr3etJl7hn4ZabEpLHyM@lists.infradead.org
X-Gm-Message-State: AOJu0YzNkyl5Vb3mIj5RPNGCDvUFknvRPv2onblmg7FIYDn5k+7DqoQf
	ghTTvTJgVAKCf1tKsz2Z4ryWcbZQYvaz7CB+sbGYRvquf0nc0L0XGwYf
X-Gm-Gg: AY/fxX5f/Md36mYXS8bUrhr+gQLNuCYiRckA7yJCg19R1vlJvPd4rzR5pTX5Jn29oIw
	oEZgBHb0lSetCasTUS2rlscvVQQdcUKv/ybHsufimDudqU2pqlOBrsKIQL/qXjHS7JlMWMVI/8r
	5tcbJyjjRDcEMPD3/iMFzS4aWQL9VdllpIMBzstkzhAlIv7bNzN7qAtbkXUyq2/FIyw9YOJkd+v
	hksapEyTFDual8aFAQTunYsQipMV+ZcQRRJ25RPdjSHzWDOxKjgsFN4VizoETcRqfgL0TX91vUM
	vSQgvbROtf40vHPaRSXZi7dNxvcn1AfVRd7i+3oGECHzFzIPcMq8PeRDMUDCSH52jaIQDeeWxUU
	uIdMJ73VJ+b0gqPuUjneb/oG7ECF0mqSN0GjMht63hLgH57yx/cN+I24ZccQ9R2pFu6sIUv1xP/
	C4/3GvQqFsK0I3Tk+jdNeIs5otjCY3rM3OdnZZFpE+yg1GO2M+t0nWxEw2o1LeKpGBZGkFY/Z5n
	umNNQ007ifnpRltA3sR
X-Google-Smtp-Source: AGHT+IEJqCt8LPEO1gH1XPCkgXU5Nau72TepR4FWtrEw6Lak1kKcRdl1oqPEMIXKOijGtZuQP2wEew==
X-Received: by 2002:a05:6000:178e:b0:430:b100:f594 with SMTP id ffacd0b85a97d-4324e50d9bcmr38628906f8f.50.1767044253036;
        Mon, 29 Dec 2025 13:37:33 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm64046230f8f.5.2025.12.29.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:37:32 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 29 Dec 2025 22:37:14 +0100
Message-ID: <20251229213726.79374-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_133735_208724_DBC825D9 
X-CRM114-Status: GOOD (  13.72  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 595 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 462 ++++++++++++++
 4 files changed, 1064 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


