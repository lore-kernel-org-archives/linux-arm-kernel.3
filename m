Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84745C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EsKGx1uh8mO0GGBukIAnOCkxWFus7yq1BkPWE6AbRCc=; b=ADR/X9gy8UPjSkQlqn3hqbRJs8
	9Oy+siOI5pJm0glg/ga1S0/Tul2jHkuI/4AEXXZyysfCAFmhMZhmhlU7Gw2VP6nSrHbwKpNnn8uqL
	JBuAo8bOexcVOTMIkLQjnCJDtyIwewU5yEqSwofO1Vj5fHFIn8DMiHmaO3J6VsPQO+W4VgEDZNfri
	xfEHCV0GmtsW4V3jERO4dgRCYKq2sPKYvITKHj7civZ8CQCuDvUCuzg+6eU75gkdrhsxRPhN9BtpI
	vKtsBizbNKnO6NIx67WuaY81thTVjSD8pYzgIhYURbyLAZfvILqmqh4sXbjPyDkAi6pPMumOFeruM
	xrbyejkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Ue-00000006W7t-0F9j;
	Thu, 06 Feb 2025 14:04:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2S8-00000006Vnb-3daE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55D6D5C5669;
	Thu,  6 Feb 2025 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD1C5C4CEDD;
	Thu,  6 Feb 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850519;
	bh=4irXlDLhVC3QMn3aym/cMiuL941aNfnp/WLK9ZuODjA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CcZ03hjBjak7bZxyVTic+/H/Nisa6/fOiXoCYGVahK7YBrANJAcNCnhddjQGvjVAj
	 A1HAizaI8kOCUuXFEzkAbopqzxSwCa2hMCmu8P/uqIeO8MnozYzB3VnQ7ESKTh3VOv
	 i2TnxvwFsnseHfc4QIMMmeyLEIorD5CD9GBgRGFSjBBwwVf0tuubWV4L6m/VdohT+6
	 bbHRReTr0ugMQcqjGTEaeBuIIef6IrfCTLpKiVsK4qIew1Ed3i+cQr56BtHqX9B9EN
	 JSwwBFobh6II8stN7KwO1u++46GSFfl2HiHjS0gR4X4swdC+oyiVB64nshc0dPCNMm
	 OQokEvhmWoaYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1202C02194;
	Thu,  6 Feb 2025 14:01:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
Date: Thu, 06 Feb 2025 15:01:53 +0100
Message-Id: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHApGcC/2XOTWrDMBCG4asErauiGf3Yk1XvEbqQpVEiqOMgF
 5MSfPfKgTrGXX6Dnhc9xMgl8yiOh4coPOUxD9c63NtBhIu/nlnmWLdAhQYAjfTxFksv0abAOsb
 WNyDq41vhlO/P0Omz7ksev4fy8+xOsFz/JSaQSmogiC07NuQ/zr3PX+9h6MWSmHDL3MqwskDKt
 FZrFxTtmf5jVlW3Mr0w15gYgJJv0p6ZLXt90lTG1Fl0ymtKsGf2xVDZldnKDBsO1FDXJdyyeZ5
 /AVnP2It4AQAA
X-Change-ID: 20241124-adpdrm-25fce3dd8a71
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738850518; l=2696;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=4irXlDLhVC3QMn3aym/cMiuL941aNfnp/WLK9ZuODjA=;
 b=6fqfcf9ZP7jYCkNGzpNzK2J5tDuJ1uL7S6GfMocw05IQJYmp1vpGqlyKaHUjAcg/6Hgvfqgal
 vgupf/TWWTrBfYCQmvKRZ0qsBBhIzRzpVkWTju7MReSFyvdLHKLerQs
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_060200_999564_263E885A 
X-CRM114-Status: GOOD (  12.26  )
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

This patch series adds support for a secondary display controller
present on Apple M1/M2 chips and used to drive the display of the
"touchbar" touch panel present on those. 

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v6:
- Use the drm_connector_helper_get_modes_fixed helper.
- Split out into a separate MAINTAINERS entry
- Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com

Changes in v5:
- Moved to using the component framework.
- Other lifetime fixes
- Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com

Changes in v4:
- Fixed dt bindings.
- Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com

Changes in v3:
- Fixed building as module after splitting out mipi block
- Addressing the review feedback.
- Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09@gmail.com

Changes in v2:
- Addressing the review feedback.
- Split out the mipi part of the display controller into a separate device
- Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com

---
Sasha Finkelstein (5):
      dt-bindings: display: Add Apple pre-DCP display controller
      drm: adp: Add Apple Display Pipe driver
      drm: panel: Add a panel driver for the Summit display
      arm64: dts: apple: Add touchbar screen nodes
      MAINTAINERS: Add entries for touchbar display driver

 .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
 .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
 .../bindings/display/panel/apple,summit.yaml       |  58 ++
 MAINTAINERS                                        |  16 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  17 +
 drivers/gpu/drm/adp/Makefile                       |   5 +
 drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
 drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
 17 files changed, 1489 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-adpdrm-25fce3dd8a71



