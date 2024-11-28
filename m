Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AA1D70DFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVu7HZVAMBeMPswWWXqaeWb7q4KpBMSR1gFHqo5yPf4=; b=mMZA+Uy20q0KBUPNtUTxm7kp3T
	iaIGn2gGjoHhjNnOF84pcv1g2MBxI/hB//gioMs+Z7WsI/gD+fC2kagcWvVHZ2lytVL77S3267bob
	0S72j62bM3HHBi8oyP848wAv91MfIRa+QpuyH5rKKDNjwjUOTxuHKdDqPvbA2KlFA2LBFgtFRHa/o
	IKp8gN7tQvHI1W6nzyE83DZwAyyKROeWdvYrmlkFgTvpja+n6Z+UscQhkrmH664pAaJUVLZ+9B8F4
	F7vtMA99YTXS108qpk/vkLHeDZQuJbtKzT89t0yubZcVyW+1p2w3HVLrVP9YotGrf2Ili+Mq7WZkk
	ZCX+zssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGn5f-0000000GW9U-16D4;
	Thu, 28 Nov 2024 22:34:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGn0m-0000000GV02-1DLU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 22:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D7D0A43A4B;
	Thu, 28 Nov 2024 22:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A95D7C4CECE;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732832962;
	bh=oe01/Ykp7CrABnRRYCE+rh9+IS7KDiWdmcELIniUmsg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fha7O3jBHKZQ/TMc6KKsXOiKETN9p37LTjJMCeRXGffD/S9wEpATUao9W3xfog/vx
	 wFJ3cV1vLzdLUQVYyn7mr0u4a3lk2AFvM+y7yfw2tE5sPIvNMlJhJ7hIVG8jau2bUA
	 yPR3mrd7xhGNrtna7NLPNOGYGLvm+03TLluK5W7Uq5MdsswsXyogOmpL2A65fITcDC
	 HG2rxKXHifF00R4VCb7P/noxiS3STNs7lYBCsXXKMMiNWazM99IbYC47vr+H9iGipB
	 aCYqPradO8Lexnx4Ae/mpoWEt6TePeMXND+8G6UYQ23iy8YZ4OzDttJoLdr6vCdoo9
	 upft09XNp/OAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A1FD70DEA;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] Driver for Apple Z2 touchscreens.
Date: Thu, 28 Nov 2024 23:29:15 +0100
Message-Id: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvuSGcC/zWMQQrCMBBFr1JmbWQyxiKuvId0ESdjO2BbSSSoJ
 Xc3Lbh8n//eAkmiSoJzs0CUrEnnqQLtGuDBT70YDZWBkJy15MyXDKOl25FO4jFAPT6j3PW9Ra5
 d5UHTa46frZntuv71dtWzNWjYHdgxt4QYLv3o9bHneYSulPIDnpMJipQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732832961; l=1917;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=oe01/Ykp7CrABnRRYCE+rh9+IS7KDiWdmcELIniUmsg=;
 b=QWGUNje+O0YI4L6uacMv3gCdhycX36kw+7OQPwVuFaDv7ROAUD8JL4y3TN+sqO/WSelEPv/HJ
 QF3jDo6TppbDr01ZAUfKJynJi79vHIby22PKFeS+8EQSFGwkYBUuwaU
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_142924_477880_EA3745B0 
X-CRM114-Status: GOOD (  11.38  )
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

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- In a separate patch, fixed an issue that prevented the SPI controller
  from using GPIO CS, and as such, moved the hardware quirk to there
- Went back to uploading the firmware in probe() instad of open()
- Other changes addressing the review feedback
- Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gmail.com

---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  69 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  26 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  20 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  24 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 458 +++++++++++++++++++++
 9 files changed, 627 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-z2-c012b528ea0d



