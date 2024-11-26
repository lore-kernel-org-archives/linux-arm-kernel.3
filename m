Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A791D65555
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QoLK1Hxj3r/9g6VpQTIFF+fmxtHrIYnFekYfVqFQP7U=; b=mjs/Lxmdo0eDUyu44l8hDt+7T0
	IPRAg+C0k9z9a5pH+cI7i9qXdRth3v6niXxLaif3ZCNB4PaC3UebxvcJqfMJ9bIO1DpC1mJLHSTbk
	GK9VvZdWpvrQTSF9lo8vBOarmCIMnjuM027pMrbH6RWG2q9hncvuQ74Ds1RP4u+Gp9tQxRDvExc5n
	sF+iDpk1yJvR61jReqiOxxhjcli0LavwOOj+ct5Hy6BtRx84QiRxww/FZxMmbUTSDZuBuRt0tJRIX
	ler1IoJcZWGku8qnUuopQY8DFxwNV+kbx8KBI8sqcFUcRB3PQqschwYgPhqhfNYX9IxnlVEA2DvM4
	7c6tJ2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Ul-0000000BgWp-3yKU;
	Tue, 26 Nov 2024 20:49:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Tm-0000000BgHU-3j4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26344A413DA;
	Tue, 26 Nov 2024 20:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5207C4CECF;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=ZBU8Fy8Sv/FwJD6yKpClEj3SItHuR1C5MYFPcenYJWs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R9mYAE09x8YrOnYi92GSKx1q4f2idlS5Lh2wBvoWVjn8CkHf4dYC4rkk3PmgRsnDP
	 S2MzaitHsbalovHD1L6GQBp+BNjXs5CcOnRGlS9DJ8F9DPgEUfkw8MIGWuxHm6Bpgs
	 eEfmDm5CrF/LkXUyoskHg9YI08sBv5uPM+4loheiDVR7fzdRoXhlWx064VzUq+x4gL
	 kqmDoTiXXDQABaEWlRp03e26NAQXO8iXvqSv4oEbWHFhaAdJvgCOCSrVf+KjStgZYw
	 /CAYvzfZ4pUpnruipS1ayaKaCBP/uOrCppMM1mPjBItHP5hs+FtVp91bJihfqe50q9
	 5rJyNXjs5cEig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5EFD65525;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Date: Tue, 26 Nov 2024 21:47:58 +0100
Message-Id: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4zRmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMT3Soj3WQDQ6MkUyOL1ESDFCWgwoKi1LTMCrAh0bG1tQDHCvI+VAA
 AAA==
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=1728;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=ZBU8Fy8Sv/FwJD6yKpClEj3SItHuR1C5MYFPcenYJWs=;
 b=EPyBrRhCz60QqrUaFxi1MkFuNhZO6e8bc/6+SNKD6Cylw/79q7NOFNe9CUIP+7jIQEFDrFVIc
 fsNWUEUOiIZCm7qEFDH18CdE4WrB+YB2/Z0k3HvMNvnkl3oL8QRhHrh
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_124815_066413_6565C580 
X-CRM114-Status: GOOD (  10.99  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

The extra gpio needed to be toggled turned out to be a quirk of the
j293, normal CS is unusable on it, and a gpio has to be used instead.
(j493 does not have this quirk)

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  83 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  24 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  20 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 495 +++++++++++++++++++++
 9 files changed, 671 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-z2-c012b528ea0d



