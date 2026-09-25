Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C40FC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NcZCd6l0Cl5I3K1zoSO4DIEqqwvho/n4KwdQgra3wnk=; b=P+WPxhEaKFSKTh/tWOWD1JeHdt
	due36NsXLt9Rdyodpr7LCQ6cH6jWt32Tcca1j2AvEcIAq/gjO0/7oCjlDG2aB/8zB2UKJ+A6homwp
	G0XlLnY/9876kQt3bjrCx0fQ6d3CSifH1/HAFNiA4xhzbZwfw5OVQ72Att1XY/vAGEYwrU5axykky
	6OCtdzm73nImBMxkpCArB0Z7J0+zbTnZEqzK4tt5Aor2Y/2gX/eMGes0GzUqOnf3UGTyUVzzwsFoc
	vpZ0TSXAB+s26bE1hgcGgxFTJWXfEu0jwNewRwiG/k8ivH4M6xmjQ7/yrVzS1dlNIoqwfPv1GUhNJ
	e68boyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4kF-0000000DHRV-0iFD;
	Fri, 25 Sep 2026 12:09:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4kE-0000000DHQX-099m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B10442AA5;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37EF8C2BCB8;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790338177;
	bh=hxwPLIWGB9VFacGMzl96vn0a9gK+osjE6UJ2ESecD7k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hNtnf5WJVSGf0w8PKSY2YVUYL8BGrk8P8OlNeD7ysm38/P3IuiSf3JKxRV8V/9bGt
	 9SlhbLpkcjNL9vD/ZhjugqUfiy+Q0mfgdZrme13tGjeQPjB81rLcw5VFcTiPnzOzwT
	 oP4trYsFCfOm8bzfPhyG+Kc1mWE0S2ZQoCorsQH6SRAELJVAdFOHyjZ8L/VYVY1dxP
	 IC9Fgp+/RSx/Wse6rUJcNKrjBQr6eOGroDNM70cHpvtAFRMGsuLDojWWr4cxlAx+8b
	 ULFe77ftDYxGRrKd29Xexzs91teKK6todRQxH+BW6FZ6EMf8PNJ1ewOiu/TBFMryBA
	 3HV9ZGaNKHZ5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11545C9830E;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v4 00/10] Add support for Apple Silicon DockChannel
 internal keyboards
Date: Fri, 25 Sep 2026 22:09:27 +1000
Message-Id: <20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XPTWrDMBAF4KsErTtF/4mz6j1KFyN5FIvalpGMa
 Qi+e6VsGgothS4fzHxv5sYK5UiFnQ83lmmLJaa5Bv10YH7A+UIQ+5qZ5NJyKzvAZRkJpnWBd7q
 6hLmHEGccoRPeGbQh6OBZXV8yhfhxp1/fanZYCFzG2Q8NnLCslNtgyGmCdciED02K/9y0CeBgu
 O07ZVEc+fHlMmEcn32amjfEsqZ8vb+0iVb/T7Ndv8kvqBOnXyBZITTengwZ7iz/Dqm/QqpCpIz
 VVpM22j1C+75/AgCMxZW7AQAA
X-Change-ID: 20260629-apple-mtp-keyboard-final-91cb5a6ff4fc
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>, Julian Braha <julianbraha@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790338174; l=6237;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=hxwPLIWGB9VFacGMzl96vn0a9gK+osjE6UJ2ESecD7k=;
 b=uwKlpt0ybpOmsl3B2L9VRnoEgdwRk9jnY9xtfDU/A0D8x94+c/0nzCxHWQAaeZSOaQWfP3lT1
 DbqhI7t8bwCBCjWU1MRHA66ylkuiWW04MDqGbh2aeQzxeBeU2iCzBbe
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
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

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-final-v3-0-e356464e454b@gmail.com/
- Describe the DockChannel interrupt pair in DT (suggested by Yureka Lilian).
- Serialize command transactions and finish STM setup before signalling ready.
- Keep IRQ flag reads and acknowledgements under the controller lock.
- Clarify teardown synchronization and use the explicit-bounds HID API.
- Preserve interface-start errors and allow waiting again for delayed readiness.
- Simplify FIFO writes, IRQ startup and compatible matching.
- The command and IRQ changes address Sashiko feedback.

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com/
- Fix failed-probe cleanup and interface publication ordering.
- Fix report lengths/types and reject replacement descriptors.
- Terminate serial replies and encode checksums as little endian.
- Honor HID_QUIRK_IGNORE_SPECIAL_DRIVER.
- Clarify the DockChannel TX byte register layout.
- All changes above address Sashiko feedback.

Changes in v2:
- Link to v1: https://lore.kernel.org/asahi/20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com/
- Rebase onto latest upstream and add M3 Pro/Max device-tree support.
- Use an optional STM node to decide whether to wait for device IDs
  (suggested by Yureka Lilian).
- Rename bindings to match the t8112 fallback (suggested by Conor Dooley).
- Fix FIFO MMIO write width (suggested by Yureka Lilian) and run mailbox
  interrupt handling in the IRQ thread.
- Remove the duplicate report fixup (suggested by Sasha Finkelstein)
  and redundant HID dependency (suggested by Julian Braha).
- Fix teardown and the missing HID stop callback; simplify interface lookup.

---
Michael Reeves (9):
      dt-bindings: mailbox: apple: Add M3 ASC mailbox compatibles
      dt-bindings: mailbox: apple: Add DockChannel mailbox
      dt-bindings: iommu: apple,dart: Add M3 compatibles
      dt-bindings: input: apple: Add DockChannel HID transport
      mailbox: apple: Add DockChannel FIFO controller
      HID: apple: Add support for DockChannel HID keyboards
      HID: apple: Add DockChannel HID transport driver
      arm64: dts: apple: Add MTP DockChannel HID nodes
      arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops

Sasha Finkelstein (1):
      soc: apple: rtkit: Add tracekit endpoint

 .../input/apple,t8112-dockchannel-hid.yaml         |  104 ++
 .../devicetree/bindings/iommu/apple,dart.yaml      |    6 +-
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |    3 +
 .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   88 ++
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   47 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   29 +
 arch/arm64/boot/dts/apple/t6030.dtsi               |   47 +
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   47 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   24 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |   24 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |   24 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |   26 +-
 arch/arm64/boot/dts/apple/t8112.dtsi               |   47 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   26 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   27 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   27 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |   48 +
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/dockchannel/Kconfig                    |   14 +
 drivers/hid/dockchannel/Makefile                   |    3 +
 drivers/hid/dockchannel/apple-hid.c                | 1191 ++++++++++++++++++++
 drivers/hid/hid-apple.c                            |  118 +-
 drivers/mailbox/Kconfig                            |   12 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/apple-dockchannel.c                |  357 ++++++
 drivers/soc/apple/rtkit.c                          |    2 +
 include/linux/hid.h                                |    1 +
 include/linux/mailbox/apple-dockchannel.h          |   29 +
 30 files changed, 2334 insertions(+), 48 deletions(-)
---
base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
change-id: 20260629-apple-mtp-keyboard-final-91cb5a6ff4fc

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



