Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511FDC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84QtETxVa4JLJ4lK5thZapHQytyMBbwNk9v1jnRW+Vo=; b=Ng2GpWhruemLdmGFNopAw1Houh
	ZIFz7HvdnKLuFnXb1b+wxWaE7zprz5WmpEyrgEw6OZPmkOZ8inUmL8rVMzTnM1YWdySCuCFMp9lro
	ghIPfDusozb1JPhB/FliLbgFDUjqo1mfVt7llqV4FCDSH8pyvD+Xk9C6o5LKOqxEhqWiWZlAUutPM
	4O3/iFkn5Rjza2L3UrRLLGsgnv0IkYzoZKXaU1mb7tI44QjLiXeV+1WhD6JezVap7pGmmkApqI2uo
	t+6f693aQm8Dnuk+TUdYMmtjBeuGtcky5Wom/psiIcnm1WBJuRHZLx8BrsUXazy01OYd105y58jg0
	GTrq1G3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgnX-0000000C07p-3pbd;
	Wed, 19 Feb 2025 09:55:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgME-0000000Bqjp-2G45
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EB29A42013;
	Wed, 19 Feb 2025 09:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DE38C4CEE7;
	Wed, 19 Feb 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739957225;
	bh=pwGGm2Hm5mZhaIRDSeBjgUFdbUBMVkomGoaRRRL0SIc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a6siI/BKx9vAxBIkU5GgXFJV77sDWBUYzltsGmJ9zsaop684mK+FDDmKzrozr7WJH
	 U72eLtCHQs9bO02ORDsK3ktqfRZp4chZNItYv1CB3Rjdr5pQAz+ayBOxRYPsKdPT7d
	 wO/Zp1N0OPuu+evGaw0D+ipFg9noWFSVwLUv3ZeFeEZIY69Or1ggyQBe9HA8rY1Dlp
	 f/p4MduO0nqwUIs7YMP3NWV8bwOd1bQ2HlcAktqmyjNhrChO/XvzxQGlIGomsm65ct
	 LZlecWiQbkTilmb3/rlJ9QWSmag8MvoNIQ5t2u7h6vqfB+9gxQJC1haNwxXcX3i5dW
	 bLnTnHXSOMgqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DA2C021B0;
	Wed, 19 Feb 2025 09:27:05 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/5] Driver for Apple ISP and cameras.
Date: Wed, 19 Feb 2025 10:26:56 +0100
Message-Id: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCjtWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ML3cziAl3TlETDlKRk8xQTcyMloMqCotS0zAqwKdGxtbUAwv7hj1U
 AAAA=
X-Change-ID: 20250218-isp-5da1dbc7d472
To: Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Asahi Lina <lina@asahilina.net>, 
 Eileen Yoon <eyn@gmx.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739957223; l=3672;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=pwGGm2Hm5mZhaIRDSeBjgUFdbUBMVkomGoaRRRL0SIc=;
 b=nvrbV1AEtw0ERqvWR3g+Y/OsdqGht+NJ9fo0RU0M70XuBvmPXcB3WJWvOmNNO0rWQafgXj7Ii
 Hpee0XOWX64Auuix7clIRjMzRrVaziNinC0Oe91ZTvLclhYM+ozLWho
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012706_725476_2A6876EC 
X-CRM114-Status: GOOD (  14.22  )
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

This series adds support for the camera and ISP system present
on Apple devices using M-series chips. This is a "simple" camera
and does not need any special userspace handling, everything
is handled by the firmware running on an ASC coprocessor.

Patches 1 and 2 add support for special handling neccesary for the
ISP power domains. The rest add the driver itself.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Asahi Lina (1):
      pmdomain: apple: Add force-disable/force-reset

Eileen Yoon (2):
      media: apple: Add Apple ISP driver
      arm64: dts: apple: Add ISP nodes

Sasha Finkelstein (2):
      dt-bindings: power: apple,pmgr-pwrstate: Add force-{disable,reset} properties
      media: dt-bindings: Add Apple ISP

 .../devicetree/bindings/media/apple,isp.yaml       | 151 ++++
 .../bindings/power/apple,pmgr-pwrstate.yaml        |  10 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/isp-common.dtsi          |  45 ++
 arch/arm64/boot/dts/apple/isp-imx248.dtsi          |  62 ++
 arch/arm64/boot/dts/apple/isp-imx364.dtsi          |  78 ++
 arch/arm64/boot/dts/apple/isp-imx558-cfg0.dtsi     | 101 +++
 arch/arm64/boot/dts/apple/isp-imx558.dtsi          | 102 +++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |  48 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |   6 +
 arch/arm64/boot/dts/apple/t600x-pmgr.dtsi          |  81 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts           |   6 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |   6 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |   6 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |   6 +
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi          | 118 +++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  50 ++
 arch/arm64/boot/dts/apple/t8112-j413.dts           |   7 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |   6 +
 arch/arm64/boot/dts/apple/t8112-pmgr.dtsi          | 118 +++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  50 ++
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/apple/Kconfig               |   5 +
 drivers/media/platform/apple/Makefile              |   3 +
 drivers/media/platform/apple/isp/Kconfig           |  16 +
 drivers/media/platform/apple/isp/Makefile          |   3 +
 drivers/media/platform/apple/isp/isp-cam.c         | 414 ++++++++++
 drivers/media/platform/apple/isp/isp-cam.h         |  21 +
 drivers/media/platform/apple/isp/isp-cmd.c         | 635 +++++++++++++++
 drivers/media/platform/apple/isp/isp-cmd.h         | 692 ++++++++++++++++
 drivers/media/platform/apple/isp/isp-drv.c         | 586 ++++++++++++++
 drivers/media/platform/apple/isp/isp-drv.h         | 284 +++++++
 drivers/media/platform/apple/isp/isp-fw.c          | 770 ++++++++++++++++++
 drivers/media/platform/apple/isp/isp-fw.h          |  24 +
 drivers/media/platform/apple/isp/isp-iommu.c       | 251 ++++++
 drivers/media/platform/apple/isp/isp-iommu.h       |  20 +
 drivers/media/platform/apple/isp/isp-ipc.c         | 258 ++++++
 drivers/media/platform/apple/isp/isp-ipc.h         |  25 +
 drivers/media/platform/apple/isp/isp-regs.h        |  56 ++
 drivers/media/platform/apple/isp/isp-v4l2.c        | 900 +++++++++++++++++++++
 drivers/media/platform/apple/isp/isp-v4l2.h        |  16 +
 drivers/pmdomain/apple/pmgr-pwrstate.c             |  43 +-
 43 files changed, 6077 insertions(+), 6 deletions(-)
---
base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
change-id: 20250218-isp-5da1dbc7d472



