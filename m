Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB20C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVvSNfdQcv5FfgQ5Jdo3qh8kxv8MQx4JOLDsGPs4WF4=; b=HQaivupggobiS7bNmyOc45BcWv
	F2vBnxhh70Y+u6v6raUbbe4ZjW40AFXJsBYr/EmynH7yPTvJ4JZpThTsocH/Vt9yD+k1O+5ipszJo
	VVP0n85o7pgM9jIdt8bma9wsDLAw3rnA26Ir5VK6BrFPMNElB9sw6+7u2Npcf9cZfAMFId9aPNC6u
	O0iDZvk1ysQGUXiEyRvszuguxcl+L0EHvJwUsNqVBWxiUHA2pjmb+K9tPVbI6ZxLKgLKf6eqqUu6X
	yydajWjehQzzSnzZInJD7mE7nO5rKmnMHK5VH25wKk052E5LF+RojHX1/ZSllB8ZH0ZVexPO7Zxpk
	37RFJS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YeP-0000000EW0o-2F2q;
	Fri, 18 Sep 2026 13:29:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ydu-0000000EVf1-3UtN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FD18601EF;
	Fri, 18 Sep 2026 13:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1BC9C2BCB8;
	Fri, 18 Sep 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789738120;
	bh=YleLy9dsJjhq7c2nL6zzJF1A+Z7obcoDrQWMYbeXFIk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gQoxSXaqWlBzKDqO7K+xVBccCfsTMxTahGsLBidURdOou3wdO5lS9gz2mFdNij31v
	 qKMGUluuV+NblnXNJZv/CQN9EsFRIhurr/d3ke88cxKWicb5MHMOf9zQaudW/bE73o
	 /WtIeTcyS7NTGb5LDjrQFnbXfraIl3aiVT2SfSm+9kZd/TcMz/9+cejrGBYRkFBlJc
	 YDmMJwQQGnIJPJ+33ZtkTyGenVxYceW1SOElZlPtyZWRBjjvNJ+YiLfbNEg8x6RCOR
	 RvHrLDlm85U18QBjw9/ydq/cJpNrKWROK6EnKU5hznPMSs7kmYP+4XCBS8GlMKgSmq
	 HxMwPUmNkJhBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C564BC982D7;
	Fri, 18 Sep 2026 13:28:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v3 00/10] Add support for Apple Silicon DockChannel
 internal keyboards
Date: Fri, 18 Sep 2026 23:28:30 +1000
Message-Id: <20260918-apple-mtp-keyboard-final-v3-0-e356464e454b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XPwW7DIAwG4FepOM8TkEGbnfYeUw+GmAYthMhE0
 aoq717oZb1slx1/yf5++yYKcaQi3g83wbTFEvNcQ/dyEH7E+UIQh5qFltpKq3vAZZkI0rrAF11
 dRh4gxBkn6JV3Bm0Ib8GLur4whfj9oD/PNTssBI5x9mMDE5aVuA0GzgnWkQmfmjr5e9OmQIKRd
 ug7i+oojx+XhHF69Tk1b4xlzXx9vLSpVv9Ps12/6R+oV6c/IF0hNN6eDBnprHyG9n2/AzzaYlx
 yAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738118; l=5610;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=YleLy9dsJjhq7c2nL6zzJF1A+Z7obcoDrQWMYbeXFIk=;
 b=ms7eApJ7nsr0wjgHHtKYCWL3B3/z3GjP5w1ujKulzGNlcSmNoTDNfB1PTg64iK5ob9YyQe/zl
 5yYk+rKZGW6B4QPaMW6qZrwgYwWYTUHCZAQ/2llIhbwieBH6uY1QKqW
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
 .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   77 ++
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   46 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   29 +
 arch/arm64/boot/dts/apple/t6030.dtsi               |   46 +
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   46 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   24 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |   24 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |   24 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |   26 +-
 arch/arm64/boot/dts/apple/t8112.dtsi               |   46 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   26 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   27 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   27 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |   47 +
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/dockchannel/Kconfig                    |   14 +
 drivers/hid/dockchannel/Makefile                   |    3 +
 drivers/hid/dockchannel/apple-hid.c                | 1177 ++++++++++++++++++++
 drivers/hid/hid-apple.c                            |  118 +-
 drivers/mailbox/Kconfig                            |   12 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/apple-dockchannel.c                |  372 +++++++
 drivers/soc/apple/rtkit.c                          |    2 +
 include/linux/hid.h                                |    1 +
 include/linux/mailbox/apple-dockchannel.h          |   29 +
 30 files changed, 2319 insertions(+), 48 deletions(-)
---
base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
change-id: 20260629-apple-mtp-keyboard-final-91cb5a6ff4fc

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



