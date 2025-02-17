Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046CAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=adQglLiP58FghjDQOg1IvVi5W66vJAiOg69EfrjKb2o=; b=AfurZ8U64QbXPLL+WZjJqGOPMK
	4m04ICkdOtLsY16GtUoS9sEwMRnqYZUcTNWh9nutOYUIAqt+dx+Lp1iWPGt7jDpfWlVoYbICjCJoz
	iPCbQGZFKurx4OHA8SQRht6FQ9SmPWlqPdA3nxpnU4Mtfyv7xPqU0l26z8dKgmKBgZvtTl5aZVfR+
	LIPSGCfOk6UqVAvtrp9U/7QB7IdmPhm8zaa1XLa3+oAqWYH2Ks/avPLRmQEWuohGuGUd6SvttGg/H
	RBZixgFOc4LwdkuMS9XfMenZqlsy99kqGZ6ryaPw9s/sX/EMIJmqj9hNc9nLcEILTIKTlo7qCLrJ7
	KUnjlsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzdV-00000004N8v-1x3Z;
	Mon, 17 Feb 2025 11:50:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzTN-00000004Kzl-3mR5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB5065C483E;
	Mon, 17 Feb 2025 11:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81CDC4CEE4;
	Mon, 17 Feb 2025 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792376;
	bh=eRJtlx+TXRz4sj1yjZeqRnBx9fEKd9tRMuECk2LsGb0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DRdmqC7kFX+YX7FOorXzZDbEwEujI1ib5++hgeOGoBD7fMIKi1U6wsdKdNMTTxRrn
	 M/6pT5GNlnaLpPJPuZhY4PsshcA3kWyKOO9cwGU1Rw6gSf3cvTO8tACJ5vbz9VkTgI
	 UlnYyhFrPaZaUDdMqihQ2DOxPQ1OqC/o6DgarK22kJYX5cr+rGltBGPqy0cTiK4wNi
	 MQ3yE+3C1bnG7FnWFhI0MaTWPkxdCXis8StJua+xVw+BAdxWtrx40/5dRbsQlqzbEZ
	 hVjGr5xHiGfzjYo7mvveRmN0StSfl5Na0rPOCQnYqQNzO6qjkWSCdGI7+OVvhqxzaO
	 nXH1Tsi6h4w3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1A8C021A9;
	Mon, 17 Feb 2025 11:39:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Date: Mon, 17 Feb 2025 12:39:30 +0100
Message-Id: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIfs2cC/2XPy2rDMBAF0F8JWldFj5Hkyar/UbrQY5QI6jjIx
 bQE/3vlQG3jLu8w5zLzYCPVQiM7nx6s0lTGMtxacC8nFq/+diFeUstMCQVSKuA+3VPtuTI5kk6
 p806ytnyvlMv3s+j9o+VrGb+G+vPsneQy/VcxSS64lihTR5YA/dul9+XzNQ49WyomtWd2Zaqxi
 AI6o7WNAo9M/zEjmluZXph1kKLE7F0+Mtiz7UhojDAYZYXXmOWRmY0pYVZmGgMCiugwhKyOzO7
 Z9ptdjux8QA1daA/u2TzPvyoNbD+vAQAA
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
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792375; l=2867;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=eRJtlx+TXRz4sj1yjZeqRnBx9fEKd9tRMuECk2LsGb0=;
 b=RMk5Ud/lR7LohTZmy9UXcBvRVStjq2rym8WI1uCB7NGENaBDElVWONJTm0BSFwHXh7TPamH+2
 9jlTs2MhNBVBO5XIig2VNo5M79PSAX6EfUmfQHIje6w4udnL07lurUj
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_033938_083522_062EB1F8 
X-CRM114-Status: GOOD (  12.37  )
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
Changes in v7:
- No changes aside from adding r-b trailers, effectively a resend.
- Link to v6: https://lore.kernel.org/r/20250206-adpdrm-v6-0-c8ab9348b853@gmail.com

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



