Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4633CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAiw1WCrW9eFilDGxnRI0+TcsuxqhR+PLAhpGbnPnBI=; b=sbBvPpxjuAJcj8
	m+X1YggJVsp/jmesaLZh3gDv2IRtLmHvDza/zED260jYphBSpg+ubJnY/cmieJVY4JHmZMDO4JV8o
	x3TSuiQbZjbx73G4tGu1vPt4Pk2lZXMwtq7Dkr1L/A2oGBxjixSffY35UpttetgSgjR80z9yYsi8h
	xhkGnL9IZkikwoejQydiiP+7zXFFBfNJdyJ4d3pQklez6aMTjW/QnyxuDubD9mhExsosFCaEneplW
	fMBUGvrZ4rvO8w/IN9t17O7/9prM4xuYz7P+PAfWIhrLLVIfkBEBtbPYvBmVV/JaXcUVX5l1dnK5K
	O7UhKlIhh78+yt7RNM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7gF-0000000ABEW-3GaN;
	Sat, 16 May 2026 05:35:19 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7g6-0000000ABBl-1Ker
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 05:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IAiw1WCrW9eFilDGxnRI0+TcsuxqhR+PLAhpGbnPnBI=; b=B1KrSNTfg3tI+U7X15zpEzRQPk
	zd2maOxtwHG8791lXzGr2gk5e0gO3jbZoicb2nkKiMWQ19yMlbCKbth71maitPhFaH7oVYubm0vqq
	B1awmDli0kYzK0wPdJoBJK+0piBDI37LqdEgliDKGsK1DC1O7uziXxtBcVtwAjWBPfdL1iyKH+Aak
	9tYY6XsgSls7Qp9Yx08g6WbQpejvMko7dpQefP5m5F/Q2ohFouO23U1mlir1dVo0MaMD3QlYWx6JN
	AGUPr6bdvB/qoHaSJBCujDFxrIvPdnoVOW0WH1OKtclKK6k/DSPWmmBVNISC2TgMSm9ycd7Ii01Ir
	QYt9wcug==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wO7g2-0000000GasF-0t1M;
	Sat, 16 May 2026 07:35:06 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v3 0/3] Add GPADC support for A523
Date: Sat, 16 May 2026 07:34:13 +0200
Message-Id: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANUBCGoC/23NQQ6CMBQE0KuYrq35LRTUlfcwLgr9hRqBhg8EQ
 ri7BV0YdTnJzJuZEbYOiZ13M2txcOSaOoRov2N5qesCuTMhMwkyAQUpp74eHddKRrzw2uRcHNO
 T1srYVMUszHyL1o0beb29MvXZHfNuddZG6ahr2mn7HMTae/MCfvlBcOCxTTKwMQDY7FJVnibqs
 KKDf7D1YpCfSPQHkQExCq1BoYTR+TeyLMsTPrgiBQsBAAA=
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
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778909655; l=2320;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=8GoHeq9jR+/2KxfeL+lHcdywJFQkb502/IOBEjFLrJI=;
 b=gt2LAeGzMxoGrrckQQX49mfSrf88U060DBS/Zb3T9J7WJN8StEtOUlcjWP7+fGGa0e60Fx6wn
 B7RnkDO0a/rAVi9jBXvTL5wnL/gGCVscyKy4/0dV+wjCUohLVMuKoig
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_223510_830493_65249012 
X-CRM114-Status: GOOD (  10.01  )
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
binding with new compatible and wired up dts node for A523 as its own
fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v3:
- More granular handling of devm_clk_bulk_get_all_enabled() return value
- Added #size-cells and #address-cells to node description
- Fixed formatting
- Link to v2: https://patch.msgid.link/20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl

Changes in v2:
- Handle scenario when 0 clocks has been defined
- Fix copy&paste sentence in 3rd patch commit message
- Moved status as last property in dts node
- Make A523 its own fallback compatible
- Removed redundant maxItems/minItems properties from binding
- Link to v1: https://patch.msgid.link/20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Michal Piekos (3):
      dt-bindings: iio: adc: Add GPADC for Allwinner A523
      iio: adc: sun20i-gpadc: add A523 gpadc support
      arm64: dts: allwinner: a523: add gpadc node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 32 +++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 13 +++++++++
 drivers/iio/adc/sun20i-gpadc-iio.c                 | 13 +++++----
 3 files changed, 52 insertions(+), 6 deletions(-)
---
base-commit: 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
change-id: 20260507-sunxi-a523-gpadc-1879aa5df754

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


