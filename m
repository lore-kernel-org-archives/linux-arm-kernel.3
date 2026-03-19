Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5922109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p40Qcv2G6Nwq3NC4ZmBz0invegjnt7tZxrcbDvxluio=; b=FcApctGADdAxj0dUtqAUlyVvzG
	KFGch4MJ0YwMbh7rlW1O8U+aqQLoLBityYfEP5F8Xpvt4rPmqOjGQ0XPeXfmEHjeqhMHCXEEFAdam
	Yd8oRSrWfUQV0u69IF9NINdpeg2yKixyGCweCG3iQ98XAfcLzQj7en49V4xqgS0FeeSVqTK7MvOPP
	rxe/Flj/uH7r/ha9SlDS9idCK8EfO26g5lpeIrv/KrB7wJmSXWMV2hfOR2tonQYwryXq1jzqgV/pV
	xrQANO9znQwWCFf57m6CnlehAuew2Xejhy1R74BcLTFWmpnHApAF4pC9Iu0ZQXG//H45CAQu64zM2
	6RM5kQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJe-0000000BNHz-1uC8;
	Thu, 19 Mar 2026 18:41:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJc-0000000BNGb-0Ncw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1656572f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945710; x=1774550510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p40Qcv2G6Nwq3NC4ZmBz0invegjnt7tZxrcbDvxluio=;
        b=IcOZA6HyK3abiYD2boeOXOcJ54VenL43i46cbcq65t2oVU5ITcwrKeWlfFTFfO2kMm
         FOZxwCoGKQH25bz8xADMJnA2+OvPA9Oz6tJ8y/A8kBQjHTmS6cvRn6VbfJwhj4QbywAu
         yxCC+NZ+VtPIxYkYsHgJiSDKwQMChPzlhx0JbYqFpnWhGJkY3/IjQWHgXeuaBP6bpoC2
         iX2K+syUllkOf/MEwcodUsNPM7jtd9blEisYxFJdXE6I21rP6yuSHmPCjR7uRtTc7cL2
         ZaGQ8cUnVPHuqHuBoczqN18+SP8Ud2amujEw5kCqIEH12r6otLq9epEanRgpiIQYs3iI
         jiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945710; x=1774550510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p40Qcv2G6Nwq3NC4ZmBz0invegjnt7tZxrcbDvxluio=;
        b=MlmxuLpneAireAhrAOeOSXOtOdDuL1tAIWSQLEFgX9e0wQdhhTEZIQ8C7xav4iWGxH
         QPNcbo9NLcEEd7UGSUMvYoebr/QXoWW23xVGtx8QMom2Tp7gTfb/VEuY6dIWwQnQSs/1
         kZ/j0HWkooYzeFcyiUtN8/YFZ/UXpTaWN4jVHl+/8biqfczHIXFxsO1C2lBRiia5X/sJ
         wnpE18CZd0KNF7BNrz+ZOqD3AvsjFdKN88mTJiv/5DJ0VB5dOcMqvbDoBYFzP6hOafiV
         54z8eJ2lAgumCKjCzORu3w7h44Dv2P2pu2UbILTHhvU8zXMori2fJqbDrEP80EarHmdg
         jYJA==
X-Forwarded-Encrypted: i=1; AJvYcCWs6ouukBWlOJurYPs577FGkbrCSuwikPPtptsUIPmmJHN8itMsOKVRMTIoIqiH48U8lvW3XUhUI8l9bb3XQ671@lists.infradead.org
X-Gm-Message-State: AOJu0YyfocwfMr6a020YGelMiZwMswIrW33d+lPig7oz12ovjx5Rl+wm
	iWaYwlQbzlu2pGvU84mVBvTzkzHv18NfzKncmzvefVYVJ5MoJXrrAU5S
X-Gm-Gg: ATEYQzwI/01LqmWVRC0Czt5zDZuI+E37WvNRhd7FzaUe+3UMau+Y0WcimUWgBU5LZPg
	YjuO/EEV4VJcJVlUEsgui+HjDACF1gCuZ10MpQPlNB+ls3THAwa/H0Kkk7Gg68lIsbZCVMVLF1i
	aGiMLlkc8nbXi/ueJ0nMQcpTDRzBbeTa1PkZeKASw6eT0vLQLOgRSac88XMfeu0vLzI+g7+KaYI
	fvlVZbK3X0ax4b0lJwR7j526f11q4omxPOyCUW6vDfI87lQhs9/oWWWoBtmWXJNUTPWVjUt8xws
	Lkt0Unx8yLjqLeqDBEfCZG/2bd0RbG2zAgA6m8A64JFX857Ugeq1lLqsqK+BtU7pI271X2Mmf2g
	Ucze6ibQ4ShA1IZUHZmt/CC1NcmREPsidhWibWUuVL8J10lbgRDcWUWhgDKzP+/6PpRhTKBQce0
	bDjzkoZU0WYhX9EYeSGTI1rzQn6jh/fEJKFDlfI+0CJdTsS5+xUzpUQBIXS3n9YbifQD70e0FCu
	GBWgFCoAi7hFh+2w7JCe1zSQKCTfuWZ5ZpdkJQ=
X-Received: by 2002:a05:600c:a312:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-486fe8b7afdmr5739095e9.6.1773945709911;
        Thu, 19 Mar 2026 11:41:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Thu, 19 Mar 2026 19:40:20 +0100
Message-ID: <cover.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114152_144887_6DAA0817 
X-CRM114-Status: GOOD (  13.00  )
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

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v3->v4:
 - Remove "This patch" from commit messages
 - Remove wrong enet reset gpio hog
 - Add symphony legacy dtb to use old brcm wifi module

v2->v3:
 - Add clock-names porperty along with clocks

v1->v2:
 - Moved phy LED configurations to symphony dts
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

Stefano Radaelli (11):
  arm64: dts: freescale: imx8mm-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mm-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mm-var-som-symphony.dts | 214 +++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 6 files changed, 514 insertions(+), 143 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: aa31e3bb9b98a86e5dde5c0c637a11cc57470281
-- 
2.47.3


