Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E2C61DF1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXo8l6az0+1wuC3QVxoUMjcyWrBAo8W/y4MeHV5fwM8=; b=C95S3YSAMzzBzB
	LN2fzc1zfq/P0hsFugQJjUk5iUqeLNseVFAh13ousU7wVIgn/JNavydIoKAqDg7HGzRePnUdtFovS
	nYF+5WoApN/xDj6PAIFQwsQ6diX6mK/9PowwdrrFbRAmmAVFczv57gm2trQC+kt8PjLLuQIqTMf9V
	eyk0w76BqQQr5QbodwquYy6RiLPqVggQLxxkVi6M4C57dq5wwxd/Tk/mhlCGlN9GwhsjsA3kIl+jS
	5iNzb4tqv0rqXV3DI6u5B42Ks1bx0L4qezl98tvXLlL70TMmmTINRg0KLhPjL2QvZPoiFHRF1zynC
	4iM2c+3+kZc6g6P9LgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0I-000000082rB-0Cn7;
	Sun, 30 Aug 2026 20:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0G-000000082p3-2zut
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E90C4406C0;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8544C2BCF4;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121183;
	bh=agb1V0MjhGm8j+oIm1EcaNuPn6C/Rl+xZ1GYecArZD0=;
	h=From:Subject:Date:To:Cc:From;
	b=jNfr9PfNbPgTh/VgpnrpuVJCOZdJ34nHbp4l6gyIWQGddB0Tk/JehLgUUSUE/vNJ/
	 +1JS6IAhr4KEXeY8nAPnz6S7OjME1CAz/UM7czUTffLf3lrIpeDtIyQwvKECZG+qoO
	 qwlGn3KERbUzldTPSEXt/qD/W7q/7E9Il50bTAATVNKU45lqze/bBoFl5exNPR6TZT
	 UTJIT+ZhiJGLnv2zGDJw8f4FcrVhRmVkCuJAKW/EcuplSWXtIWTh2bMLq1pvPrWqkU
	 +vT6EB5gtPpLcBKS6nyl7/leB9IurdIdk2wOV6hZje9F3TYptKCA2IgcP0o8ANQxdF
	 sCiPrDO2DEzxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925E0C61DD9;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 00/19] Initial USB4/Thunderbolt support for Apple M1/M2/M3
 SoCs
Date: Sun, 30 Aug 2026 22:19:18 +0200
Message-Id: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N0Q6CMBAEf4Xcs5fUior+ivGhLaueMVB6xZAQ/
 t2qPE4yOzuTIgmUztVMCW9R6bsC201F4eG6O1jawmSNPZjGntjX7GJ8gbUPnH1mZwya487tbeu
 pzGLCTaZf8nL9s47+iZC/ndVIGMbylVdtWT4YopnsiQAAAA==
X-Change-ID: 20260829-b4-apple-soc-tbt-a00e873a52db
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7208; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=agb1V0MjhGm8j+oIm1EcaNuPn6C/Rl+xZ1GYecArZD0=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCZ7ml8/Knn17VCNZJEdA3nDv+wOdryaaN10oZP7c+
 0XH6VlQRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiT1Yx/K/0YjqtaTZTe9We
 q5aqX2NK933YYtLLJf9TJrxk6z4F13CGfwq/JOpYoqcfFXA3fdq21+/T2v6wx+ejV8sYbeQQK12
 6hx8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

This series adds initial USB4/Thunderbolt support for Apple Silicon
M1, M2 and M3 SoCs. Each USB4 capable Type-C port comes with an ACIO
("Apple Converged I/O") block which contains a Cortex-M3 co-processor
and the hardware implementing the USB4 router.

The NHI and DART IOMMU are part of this ACIO block as well. Instead of
being exposed as independent always-accessible devices the main SoC bus
only gets a 16 MiB window into ACIO's MMIO space while its co-processor
is running. It is not entirely clear whether this is ACIO's own address
space or a window into the co-processor's address space.

This is why the device tree represents the NHI and DART as children of
ACIO with addresses relative to that window. The driver only populates
these children after booting the co-processor and removes them again
before powering ACIO down. This setup is slightly unusual but matches
both the MMIO layout and the lifetime of the devices.

ACIO also has rather strict ordering requirements: it can only be
started after the Type-C PHY has been configured for USB4/Thunderbolt
and has to be stopped again before the PHY is powered down. It also
needs cable details which are only known to the Type-C port controller.
The existing Type-C mode switch cannot express the required reverse
teardown order, so the first three patches add a separate Thunderbolt
switch and hook it up to the CD321x port controller.

The next two patches add the bindings for the NHI and ACIO. The
following patches then prepare the Thunderbolt core for the slightly
different NHI register layout and interrupt handling, read the USB4
router DROM from the device tree and add quirks for functionality not
implemented by the Apple hardware.

The main driver powers up ACIO, boots the co-processor, populates
the DART and NHI children once their MMIO regions are accessible and
registers the NHI with the software connection manager. The last three
patches add the device tree nodes for the M1 and M2. M3 nodes will follow
once the rest of the stack is upstream, but the current Thunderbolt/USB4
code has already been successfully tested on those.

Right now only XDomain connections and USB3-via-USB4 tunnels are
supported. Both PCIe and DisplayPort tunnels will come later since those
require additional work and reverse engineering that is not done yet.
Suspend is also not supported yet and we actually have to prevent
suspending whenever an active connection is present because we would
otherwise resume into an SError.

This series depends on the Apple CIO reset controller [1], the ATCPHY
USB3-via-4 pipehandler support [2] and support for specifying the DART DMA
aperture in the device tree [3], a fix for CD321x Thunderbolt
altmode VDOs [4], and fixes for making the DPTX capabilities read fail
gracefully [5]. I couldn't split it any further since the remaining
patches now directly depend upon each other.
Except for the dts changes the series applies cleanly without these
dependencies though.

For merging it probably makes most sense if all of this (except for the
DTS changes) is taken through the thunderbolt tree once everything's been
reviewed.

Best,

Sven

[1] https://patch.msgid.link/20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org
[2] https://patch.msgid.link/20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org
[3] https://patch.msgid.link/20260819-iommu-apple-dart-aperture-v1-0-252703f381aa@jannau.net
[4] https://patch.msgid.link/20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org
[5] https://patch.msgid.link/20260829-b4-tbt-fixes-v3-0-e1fab6ac54fe@kernel.org

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (19):
      dt-bindings: usb: Add thunderbolt-switch property
      usb: typec: Add thunderbolt switch
      usb: typec: tipd: Hook up Thunderbolt switch for CD321x
      dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt NHI
      dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt ACIO block
      thunderbolt: Try reading host DROM from device tree first
      thunderbolt: Don't read the UID if we already know it
      thunderbolt: Allocate ring HopID before requesting the ring interrupt
      thunderbolt: Add ring_interrupt_active to tb_nhi_ops
      thunderbolt: Make the ring register layout configurable
      thunderbolt: Add ring_interrupt_mask to tb_nhi_ops
      thunderbolt: Add ring_configure to tb_nhi_ops
      thunderbolt: Add QUIRK_NO_DMA_PORT
      thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
      thunderbolt: Export symbols required by the Apple Silicon driver
      thunderbolt: Add Apple Silicon support
      arm64: dts: apple: t8103: Add USB4 ACIO and NHI
      arm64: dts: apple: t8112: Add USB4 ACIO and NHI
      arm64: dts: apple: t60xx: Add USB4 ACIO and NHI

 .../thunderbolt/apple,t8103-usb4-acio.yaml         |  218 +++++
 .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml |  151 +++
 .../devicetree/bindings/usb/usb-switch.yaml        |    6 +
 MAINTAINERS                                        |    4 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |   67 ++
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |  384 ++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  107 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi          |  137 +++
 arch/arm64/boot/dts/apple/t6022-j180d.dts          |  202 ++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |   10 +
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi         |   57 ++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |  384 ++++++++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |   61 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  188 ++++
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi          |   61 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  190 ++++
 drivers/thunderbolt/Kconfig                        |   13 +
 drivers/thunderbolt/Makefile                       |    3 +
 drivers/thunderbolt/apple.c                        | 1028 ++++++++++++++++++++
 drivers/thunderbolt/cap.c                          |    2 +
 drivers/thunderbolt/ctl.c                          |    2 +
 drivers/thunderbolt/domain.c                       |    2 +
 drivers/thunderbolt/eeprom.c                       |   32 +-
 drivers/thunderbolt/nhi.c                          |  132 ++-
 drivers/thunderbolt/nhi.h                          |   32 +
 drivers/thunderbolt/switch.c                       |   19 +-
 drivers/thunderbolt/tb.c                           |   18 +
 drivers/thunderbolt/tb.h                           |    5 +
 drivers/thunderbolt/tunnel.c                       |   59 +-
 drivers/usb/typec/mux.c                            |  201 ++++
 drivers/usb/typec/mux.h                            |   12 +
 drivers/usb/typec/tipd/core.c                      |   37 +
 include/linux/thunderbolt.h                        |    3 +
 include/linux/usb/typec_mux.h                      |  114 +++
 34 files changed, 3872 insertions(+), 69 deletions(-)
---
base-commit: 78bb208b99e7d3314f670710fa9ee0a793682bca
change-id: 20260829-b4-apple-soc-tbt-a00e873a52db

Best regards,
--  
Sven Peter <sven@kernel.org>



