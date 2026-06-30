Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbxl0m8dqRUdntFCeSkz7F0AJMXtxFhisKlarvi54bA=; b=B2VCpTMYlL5lvCaCOFJ/QM0ua6
	yKYlcA0LhvqJgv7bFzzND4a6MAH+CH2NgraH2U0MDrjrcQzFzK82M0+ZHzxvc4Ka5pZppEbuxKzBD
	4D20SyXOxCbsJ4PtqVzwhc8kGybeZejtxD9txS2FJR7tlvZc4sMhIRgSE/NUSNUpQQjWUIoDKU79V
	5wUr5tEwpDmcJSFZGZMKzRAyrhsiVNoDAIXoFk4x1H5NrYBTPjy5MBsn3J4xMU4NYpML109aQ4w9L
	JMZ2kQUjeFZuGhcOPoISQRBr1JlXzdGiWfFTAS6vzBMOQAU1bdZb0UG0FhL0rkX4Jaqv/1TCTsaD1
	pOJBrn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzL-0000000H4dZ-3h6r;
	Tue, 30 Jun 2026 12:54:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzD-0000000H4Vy-0yCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A699B601C1;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 518C6C2BCB9;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782824086;
	bh=eaYasJGTo79RPD26c3SmYtaVMbARHDwN7ZlMRtFRy80=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KIshjdurzygOiSAA/GvHTJXfy3H/APETCZFWf18Pu9Ch5pg7KMpOesCBdK/klTt5K
	 kq2iW3DtPFP0fx2nTBdHEExEoq63oAwrywRuipa3SD1v8TsvJ7N6jL2MLbabHWyVBF
	 BwB6IXm9bdDBnOFPJC7gKz9BQsvPfKweUikzXZJpSMeeZLXm0bKQf1ImXq+ZZhvnOs
	 HUXrIOiRy7yHtA06qvpxKB1DAPS/aCivxnC+tfw7sr6ci0IY/2wA0zKlhoaoB6LN4/
	 RDXBigpTDqaCWSWts9dXxArbUSq2yUEPivJDps7KgQE8glsGvYVemmorQdLnTcVdUk
	 NknIxDbO25tTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BD8C43458;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH 00/10] Add support for Apple Silicon DockChannel internal
 keyboards
Date: Tue, 30 Jun 2026 22:54:28 +1000
Message-Id: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIS8Q2oC/x3MQQqEMAxA0atI1ga0OAW9iriINZkJai2tiCLe3
 TLLt/j/hsRROUFX3BD50KSbz6jLAtyP/JdRp2wwlbGVNS1SCAvjugec+Ro3ihOKelqwrd34ISv
 SiIOch8ii53/dD8/zAmGZkaZqAAAA
X-Change-ID: 20260629-apple-mtp-keyboard-final-91cb5a6ff4fc
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782824083; l=4257;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=eaYasJGTo79RPD26c3SmYtaVMbARHDwN7ZlMRtFRy80=;
 b=ebb+Ox7p7yerFmB6WM6BevtFuS599DpSgn+0BYEpLRvDsyJzPxX79VG1SimhfsFSzFufv39RH
 1MfaeC0Z5VqBHIkyXTsZMKjyTFM2B/TdyGIBue7F8/vJ4hhkvFAE/xe
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series introduces support for the internal keyboards on Apple
Silicon M2 and M3 MacBook models.

On these platforms, built-in input devices are managed by a dedicated
coprocessor running an RTKit-based operating system. Communication
between this coprocessor and the main processor is carried out over a
low-latency hardware byte FIFO interface called DockChannel.

To support this input path, the series introduces a few new components:
- An apple-dockchannel mailbox driver to handle the low-level
  byte-stream FIFO.
- A DockChannel HID transport driver (apple-hid) that boots the
  coprocessor using the RTKit framework and encapsulates the HID
  protocol over the mailbox.
- Minor additions to the apple-rtkit and hid-apple drivers to support
  the TraceKit endpoint and integrate the keyboards into the existing
  input-quirks framework.
- Devicetree bindings and DTS updates to describe the nodes on M2 and
  M3 laptops.

The transport driver is based on an original out-of-tree implementation
by Hector Martin, but it has been significantly rewritten for upstream
inclusion to use the standard Linux mailbox framework and align better
with upstream HID design patterns and reduce reliance on hacks.

While the coprocessor manages both the keyboard and the trackpad, this
series only enables keyboard support. The keyboard can be initialised
without loading external firmware, whereas the trackpad requires
firmware. Trackpad support will be submitted in a subsequent series
once these base transport layers are established.

Tested on: MacBook Air M3 (J613).

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Michael Reeves (9):
      dt-bindings: mailbox: Add Apple t8122 ASC mailbox
      dt-bindings: mailbox: apple: Add DockChannel mailbox
      dt-bindings: iommu: apple,dart: Add t8122 compatible
      dt-bindings: input: apple: Add DockChannel HID transport
      mailbox: apple: Add DockChannel FIFO controller
      HID: apple: Add support for DockChannel HID keyboards
      HID: apple: Add DockChannel HID transport driver
      arm64: dts: apple: Add MTP DockChannel HID nodes
      arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops

Sasha Finkelstein (1):
      soc: apple: rtkit: Add tracekit endpoint

 .../bindings/input/apple,dockchannel-hid.yaml      |   91 ++
 .../devicetree/bindings/iommu/apple,dart.yaml      |    4 +-
 .../bindings/mailbox/apple,dockchannel.yaml        |   75 ++
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |    1 +
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   46 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   25 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |   20 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |   20 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |   22 +-
 arch/arm64/boot/dts/apple/t8112.dtsi               |   46 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   22 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   23 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   23 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |   47 +
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/dockchannel/Kconfig                    |   15 +
 drivers/hid/dockchannel/Makefile                   |    3 +
 drivers/hid/dockchannel/apple-hid.c                | 1130 ++++++++++++++++++++
 drivers/hid/hid-apple.c                            |  139 ++-
 drivers/mailbox/Kconfig                            |   12 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/apple-dockchannel.c                |  380 +++++++
 drivers/soc/apple/rtkit.c                          |    2 +
 include/linux/hid.h                                |    1 +
 include/linux/mailbox/apple-dockchannel.h          |   29 +
 27 files changed, 2139 insertions(+), 48 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-apple-mtp-keyboard-final-91cb5a6ff4fc

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>



