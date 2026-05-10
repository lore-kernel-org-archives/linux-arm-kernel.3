Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C525CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dvPq9iN8WATQt+rdmec5wkojG/hdk2qbLAicxWxCraE=; b=bL9GFzL0ap5Qrh
	PDU/6VsT09ZXWrCRTipMkF0G882phEAdPsHhMrtcD+hOcDCkrpmf3plB1OTfE0cDK8dA11veDtgB+
	lFJcPPyYaKLzZklLwj8R2M0P5zGRGUFHGsAI7w5G/WwYVUI9T1wzTay4r2IobEKzn9CQrAcXl4Oez
	aBi6OUtWqtRbzWf877/eNA7RFYeblSvU69Y4YlXu19CI8me1RxYjHpIgQljVd0rTpwro1V4RvIXKZ
	RDDxIvBH7h/vIyrZN/3sXb+3LUyzYopek/nTAZbj1Vb8oVS5+anUJg7HrNd5m6ilTLWitmjrT04iJ
	5Ce6N62weGnbRCX0yiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3mT-0000000AoLS-2MFO;
	Sun, 10 May 2026 13:01:13 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3mP-0000000AoKt-2ld6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 13:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dvPq9iN8WATQt+rdmec5wkojG/hdk2qbLAicxWxCraE=; b=KSJHJyIhqtwZK183YrflR2asdT
	k2LXD7nUtrNDhaNUyE0Fvruuxs32UT6+NlPSWReI4RD9uQXQzsUfy0TBOJ2FADcwmJtgiG+gCj1fR
	ro8hXdhmUbvlok6Asy+tHN8sy6NdV3x0mH9XPEBZdHbM6w3VicFjoVqbXroEEGHvkaQsBjzuwQbU0
	QINXHjMXwPwixEnkn+yTjNE9KeD1L8N2z+zE22N3jRZsTI34Gothiub9zAkUdXtq6bbHw8bqKWVMk
	tlilg251WkUI8MMttCirxhmLGDySw1mc7FoNp/Kl1B7VHcKiTTQG2uw3qsQi60i7LNHtMJ88mG2K6
	WjEt2XTQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wM3mL-0000000DItk-1dvg;
	Sun, 10 May 2026 15:01:05 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH 0/3] Add GPADC support for A523
Date: Sun, 10 May 2026 14:57:21 +0200
Message-Id: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGAAGoC/yXMQQ6CMBBA0auQWTtJKZaqVyEsxnaAcVFJBwgJ4
 e5WXb7F/wcoZ2GFR3VA5k1U3qmgvlQQJkojo8RisMa2xhmPuqZdkJxtcJwpBqxv/k7k4uDdFUo
 2Zx5k/y27/m9dny8Oy/cD5/kB3EBfXXQAAAA=
X-Change-ID: 20260507-sunxi-a523-gpadc-1879aa5df754
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778417853; l=1053;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=P8xM934ybSF+ohjTs7dFZU1OSOviwUGH/0T5IT1lDBI=;
 b=OETFZqziFi/khRjPAfcStRkuugnTEDXQMcPrtnQGDrWSAub17ffGZ1Uj/F6EkA9sY8ZRDlXfk
 SbJoPEbAApJCoQYjifz/aMbH9l79sSYwYiA4i5GpL7wAPWmf+dIxxFD
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_060110_185846_18954811 
X-CRM114-Status: UNSURE (   7.42  )
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

Add support for Allwinner A523 GPADC in sun20i gpadc driver and describe
corresponding node in dts for A523 SoC.

A523 uses same model as existing driver except it has two clocks.

Added support to enable more than one clock in the driver, extended the
binding with new compatible and wired up dts node for A523 which uses D1
as fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Michal Piekos (3):
      dt-bindings: iio: adc: Add GPADC for Allwinner A523
      iio: adc: sun20i-gpadc: add A523 gpadc support
      arm64: dts: allwinner: a523: add gpadc node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 +++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 12 +++++++
 drivers/iio/adc/sun20i-gpadc-iio.c                 |  8 ++---
 3 files changed, 52 insertions(+), 5 deletions(-)
---
base-commit: 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
change-id: 20260507-sunxi-a523-gpadc-1879aa5df754

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


