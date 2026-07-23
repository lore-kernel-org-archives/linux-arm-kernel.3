Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736FEC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VK2dEEAtsn5jm4PiuInkYdtk4CdTZkxc+t8/mCBMM+0=; b=AhAT6Kyn6RFr92
	Xs/6wA9UGPwK4nl6wIvHfhGxzw3FYQSEfsWxRY4k7BXB8sV+I7bU6jztpqcRhKlGlBx8dAORXhxfs
	aUo4igsGgCfvjdupHcZQ/ik6v494F7EuH973XTIXjtoDmvzlZL8Rz/qV4oedpGw3pgtHGznQB/ov4
	dk5iG68wwRGo92PgESExC7YHwo/U1iXpv5lDJzM3Qw4mwCFBaPwRVr7m0YcIEFrijCgXqgBRE9g7i
	WinoGnWvcH88jbOWwQY8V0tnHmTgtlzOWWK2lq7LOgb01eOLd5ipCTEYuuSK7advPGmT1hQqCLrpa
	VOoHY0Q/V/E7gzhdQeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnro-0000000DdyF-4AYd;
	Thu, 23 Jul 2026 07:29:16 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrZ-0000000Ddqt-0W2V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:04 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VK2dEEAtsn5jm4PiuInkYdtk4CdTZkxc+t8/mCBMM+0=;
	b=rvwPgg0D9mNjuvxhayGzpNxIiH4wvZe6XbXGHfkQhnF2085HaSnVzMbYyc75aXVlt7ra0C
	fE7mnF1EKm+PBFowDEw+aVUw+271or3cMtSGr+O/O25wL4V7m2ImmV/oC506Of1/owVtQO
	orwI3OJ1i6P6st5HQ3dWjKcM4i+W9yJIPuyjmHQxXUr3qwjxNC8U3x4RRZn/CjkcOe9Yzm
	f8+RQC05Phwjwl8ajy/XTsucoD1TFv9j6gh4ZxNNjncXp1PsHhcIoh6OEQ3bs930pk3VkT
	AmGAb6O9ApDrGwvUuU6tRTF4i9RgLgATc0udADoKhBivLxQmhGLKN5DykQJv6Q==
Subject: [PATCH v3 00/11] Support ELE API in i.MX OCOTP NVMEM driver
Date: Thu, 23 Jul 2026 09:27:22 +0200
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQzW6DMBCEXwX53I38AyZwyntUPWB7SdwWm9rGo
 ory7jVwiHprj7O7+mZn7iRisBhJX91JwGyj9a4I8VIRfRvcFcGaogmnXFLJJCxzTAGHyborOFw
 THBvagZ1W8NqnGfATYWgYN2bspKKCFNoccLTr7vT6dui4qHfUacNvFzcbkw/f+yuZbXf/d80MK
 GjVjkJ2Zy1QXj68S8G7k0Gy2Wb+BLdM/B3MC1iduZSmEw2r1S/w4wgU8GspDaYj5bPAvirUmja
 03amxzEYYakqbhnbCaNln3m0VqKHstJ8mm/oqtycOQdcF//gBzjV1D6gBAAA=
X-Change-ID: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5478;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=7hdQj4bMhlRP6A7yET8sBVVYL0Q09ir16zBxsAVoKXw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0FZTz9DJCyZx/Tl1afGGWtc1ExQu+3zrbz7sI/a9i
 UViqrNaRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERm32dkaI05H+97r7rBwGVx
 taKG+dnFf993fNttOzHRpes4j+xcR0aG3cH7rjDeCDjXxtbVtCOTf44x54IlkZsr5l/c3+i71vM
 YIwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002901_751879_F46C9880 
X-CRM114-Status: GOOD (  17.44  )
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

This patchset depends on "firmware: imx: driver for NXP
secure-enclave" [1].

The imx-ocotp-ele.c driver currently uses the limited FSB (fuseblock)
to access the fuse registers. In order to gain full read/write access
to all fuses, we need to use the Edgelock Secure Enclave firmware.

This patchset does:

* Add bindings to reference ELE device in OCOTP driver (patch 1)
* Export ELE API functions (patch 3)
* Let the OCOTP driver use the ELE API (patch 7)
* Extend the devicetree of i.MX91/i.MX93 boards for using the ELE API
  (patch 10/11)

The rest of the patches contain cleanups that were implemented along
the way.

This was tested using the 'crucible' tool and by directly reading
from the nvmem device on i.MX93.

This still lacks support for the i.MX94 and i.MX95 as I don't have
the hardware for testing on these platforms. As the documentations is
incomplete it is hard to get the keepout table right without testing
on the actual hardware. If someone else can provide the data and
testing, I can add it in a future version. If not this can be done
later.

---
Changes in v3:
- Fix bindings to correctly ignore the secure-enclave property for SoCs other than i.MX93 (thanks Krzysztof)
- Rebase on latest ELE driver patchset (v29) [1]
- Enable ELE in all board devicetrees (suggested by Francesco)
- Put the reserved memory somewhere in the first 256MB of DDR
- Link to v2: https://patch.msgid.link/20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de

Changes in v2:
- Adjust bindings to allow secure-enclave only for i.MX93 and improve commit message (suggested by Krzysztof)
- Export generic ELE API functions to be used by drivers (suggested by Frank and Peng)
- Move the fuse read/write functions to the NVMEM driver (suggested by Frank and Peng)
- Add patch to use __free(kfree) in imx_ocotp_reg_read() to fix memory leak (reported by Sashiko)
- Use device link to prevent SE device from being unbound while referenced (reported by Sashiko)
- Link to v1: https://patch.msgid.link/20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com/

---
Frieder Schrempf (11):
      dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
      firmware: imx: ele: Fix indentation in ele_base_msg.h
      firmware: imx: ele: Export API functions
      nvmem: imx-ocotp-ele: Add keepout table for i.MX93
      nvmem: imx-ocotp-ele: Remove device-specific reg_read()
      nvmem: imx-ocotp-ele: Use __free(kfree) in imx_ocotp_reg_read()
      nvmem: imx-ocotp-ele: Support the ELE API
      nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
      nvmem: imx-ocotp-ele: Rename FSB access map
      arm64: dts: Add common include for i.MX93 ELE firmware
      arm64: dts: Enable EdgeLock Secure Enclave on all i.MX91/i.MX93 boards

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  14 ++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |   1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |   1 +
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |   1 +
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  |  15 +-
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi   |   1 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |   9 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |   1 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   1 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   1 +
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi  |  28 +++
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |   1 +
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   1 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |   1 +
 drivers/firmware/imx/ele_base_msg.c                |  42 ++--
 drivers/firmware/imx/ele_base_msg.h                |  16 +-
 drivers/firmware/imx/ele_common.c                  |  35 ++-
 drivers/firmware/imx/ele_common.h                  |  14 --
 drivers/firmware/imx/se_ctrl.c                     |   6 +-
 drivers/firmware/imx/se_ctrl.h                     |  14 +-
 drivers/nvmem/imx-ocotp-ele.c                      | 244 ++++++++++++++++++---
 include/linux/firmware/imx/se_api.h                |  78 +++++++
 28 files changed, 432 insertions(+), 99 deletions(-)
---
base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
change-id: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
prerequisite-change-id: 20240507-imx-se-if-a40055093dc6:v29
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: a01f5127b7f2de9db2e90d6995ad1638454388e9
prerequisite-patch-id: 587c80a477788420072172cde87eab19216f7139
prerequisite-patch-id: 1537cc12f7000c7474f8e95d67c8ff3715c51c32
prerequisite-patch-id: d6a8cd2161ea713eebeff46d12f6ae1255c24561
prerequisite-patch-id: 1d8b2e78db2815eaace41a13d571171fb58e4221

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


