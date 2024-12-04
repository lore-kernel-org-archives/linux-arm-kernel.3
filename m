Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F863E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDmIr6PmRL+bCwkiX2vEyKjA2Fo/xdYMbc8zYjvpekw=; b=vStymDCbKE/E6Sls2HO677ygXY
	LnoqtEaqWPhpT+1rDMqfre3LStw5WehhV0uzstGvidNmUGE/fEpK2GefEAxVOEMV8DiC4U3arB1ca
	wTr0sPfQkBMt3ZRrslHnFlDeAI0yeXdHPJ+yIUlVP+45LXbfJgPwtINzZ63qbZGpkof6WvVtMt7KZ
	MyS4w+OqNt9/oAQFhIUYymiczy8gxB90kFC/vyaGznIhSiLc5ZH6BghtA7XZHQhEZlBykNj3Ph2Y+
	WCr95+oMvBzSbye17zQlYn8Y4lm7qJbYBvpqwYKbK588zBslvgA56XSuTpSeIpalnaxLkryDZ2A0Q
	jiKKZhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs40-0000000D9dh-3VDo;
	Wed, 04 Dec 2024 16:17:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6pA-2J54
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4A7B5C6F4A;
	Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2D48C4CEDD;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328393;
	bh=V7BO1ptbAkL1Yo+zXuNam1yKuSO5DtHXBeNULjuF9dE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=o6IRgIGVr6ozS05PdwResdAviClnTiCOtcdgroImVb2lsDLaRLLrrKzj0wH656kG8
	 Efia1gNb3Hntsgo9cTEd/6rxwQgN4POCYO6sMi39s48RmKWFw3d397xbqzzYKZCUYs
	 Xh+e+jek7jqsxOgT/hfDegRKXQ4ExogY0RGpIVkcyj1IywZDEy0WsPeuJoxFvA+YSk
	 Pf7+AqyeOk0yE7t7bCefo2mKCdYt3ihHBNxlX1yg0e6bKHWJpSyO/1z5SoiihQWZ+t
	 rldPzqBWC2jz5zDaBGQspA8QiaJdFrNnIFQElyUPz0Fb0UqNYvUNHKTLqlkXWwoZnj
	 KZ6wE2DGkInnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECF0E7716D;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Subject: [PATCH v5 0/6] Add support for Blaize BLZP1600 SoC
Date: Wed, 04 Dec 2024 16:05:23 +0000
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMN9UGcC/53NQQrCMBAF0KuUWRtJahONK+8hUtI02gFNQlKDt
 vTuphWXgjib4Q/M+yNEE9BE2BcjBJMworM58FUBulP2Ygi2OUNJy4rlIc1V4WDyGjwTlNZosa8
 bp0Jbx7v3LvSEsXLHZKWV3ArIkA/mjI+l5HjKucPYu/BcOhOfrx+e/8InTijRVFJZGbFpNT+8n
 9ba3WD2k/jH5N/NaZpe1cUITykBAAA=
X-Change-ID: 20241111-blaize-blzp1600_init_board_support-1128194ca976
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=2384;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=V7BO1ptbAkL1Yo+zXuNam1yKuSO5DtHXBeNULjuF9dE=;
 b=fPh1ioEVlho7W+IqTeSP6WFdrEGCIDEG3gNT/kPqAEBd4ucS4JflSG7ZWSOK3770VwULgRTcB
 IPuH09RdjKmBgRAqSezIXNYP20hhWbv1NAhuIdWAVwuRf8UbbWYo6pL
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_721951_0C94146C 
X-CRM114-Status: GOOD (  12.85  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Blaize, Inc. (www.blaize.com) is a SoC designer and manufacturer
with integrated programmable Graph-Streaming-Processors for AI
and ML. This series adds support for the Blaize BLZP1600 SoC.

The SoC can run as either a PCIe based accelerator in a host
system, or as a stand alone SoC running Linux on its integrated
dual core ARM Cortex A53 cluster.

The SoC includes a suite of peripherals, support for which will
be added later.

This first series is just the basics to get the upstream
kernel to boot with a UART console and ARM SCMI based
clocks and resets.

Resending V5 with tags applied and 'From' fixed.

V5 changes:
 * Add more information on patches and on files
 * Rename arch to ARCH_BLAIZE

V4 changes:
 * Add maintainer for blaize in arm64 dts
 * Fix Blaize schema & dts code style
 * Add range and reserved-memory as suggested

V3 changes:
 * Removed unnecessary dt-bindings
 * Update SoBs

V2 changes:
 * Update SoBs
 * `make dtbs_check` has no warnings
 * Fix dts names and removed dead code
 * DTS is separated from anything else

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
---
Nikolaos Pasaloukos (6):
      dt-bindings: Add Blaize vendor prefix
      dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
      arm64: Add Blaize BLZP1600 SoC family
      arm64: dts: Add initial support for Blaize BLZP1600 CB2
      arm64: defconfig: Enable Blaize BLZP1600 platform
      MAINTAINER: Add entry for Blaize SoC

 Documentation/devicetree/bindings/arm/blaize.yaml  |  40 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   9 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/blaize/Makefile                |   2 +
 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts |  83 +++++++++
 .../arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi |  23 +++
 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    | 205 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 10 files changed, 371 insertions(+)
---
base-commit: 83d67c257f4d045ff477309b5617d931f9a7be66
change-id: 20241111-blaize-blzp1600_init_board_support-1128194ca976

Best regards,
-- 
Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>



