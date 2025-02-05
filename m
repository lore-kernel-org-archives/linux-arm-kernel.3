Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B8AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPg/jnNTjg1fjn+jKOLuUmA1oHkl+1CSXgP1lP09kqg=; b=NeDrVymxq3RPLBAE+AsqqhXcGO
	vJjNl10J8xAVYoQpyGEaKnidQmDAZebB5qNOGz8ihLPR5xqb2TvyYBlCg+vuvNPP/q4B7ln1z7ZoT
	vikP0ZzHCGN8TG2Hg/mv/++tMH1HtpOZy0TZni3Tt4K67cxLjcNXHHyWzkYnVo+LcD+i/SUSybKyf
	nLUfXBt7+TZrLFVLNHsP1120WiF2hvl9NQ75+CQt8O5/sboG4CPNaK3xeTK/bjlOtZT3aq0gV2Jje
	VW6yh8KtM/6qzB9i9lUunigeHIVkH98Tkiic05xa2Sx6TpJbhlghxwdyfhMl3Ha6GxUxxSYf3Vcke
	Er0yOlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnd8-00000004hJY-2D5j;
	Wed, 05 Feb 2025 22:12:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnbl-00000004gwm-1L88
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E556A43991;
	Wed,  5 Feb 2025 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9785C4CEDD;
	Wed,  5 Feb 2025 22:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793455;
	bh=qammxtTCdNkajaOoaTby8FignidfrfHCpLjOqS0LcOg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O43byfws78Dz/JD8jvij0jUtM1OVNYit25pgFI5DsA6HUbYGMqlfM4AT/OWl2m9he
	 Mm48CrijlgN6DQGtAEY0kWeHes6iT6ZbM5cOCF1FT6SBlmx8nb6BSYDOyyRv3OSoQU
	 q7YyQ3usB+quCaKmu5KaLrpFfSmPqe5QIzRLu2dk759jzxjMeP65Kac62k24IMbcHl
	 dYwPKQ5oTFhAuiFtQbluIhvu56DzJ9eSyeK0WwvB3AKwYA27xRRvWcwyLrO6YWFcFy
	 1ARFjgst/rJQQ+y7dtGuzjLQvbEH28KLB8NbjN9pw6YKSdIqf8v3ouy+hpJDgRDc/Q
	 tiAja83XO58tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D29DC02192;
	Wed,  5 Feb 2025 22:10:55 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v5 0/5] Driver for pre-DCP apple display controller.
Date: Wed, 05 Feb 2025 23:10:49 +0100
Message-Id: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOrho2cC/2XO3wrCIBTH8VcJrzM8/tvsqveILkyPJbQ2NEYx9
 u65QWvU5e/g54sDyZgiZrLfDCRhH3Ns72Wo7Ya4q71fkEZfNuGMSwAuqfWdTw3lKjgU3te2AlI
 edwlDfM6h46nsa8yPNr3mbg/T9S/RA2VUgAFfo0Zp7OHS2HjbubYhU6Lna6YXxgtzhslaCaEdM
 79MfJhixS1MTExX0jswwVbhl8k1+35SFobmrLhmVpgAazaO4xu0nLKgQQEAAA==
X-Change-ID: 20241124-adpdrm-25fce3dd8a71
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738793453; l=2490;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=qammxtTCdNkajaOoaTby8FignidfrfHCpLjOqS0LcOg=;
 b=QlzP/gahoMXJ+srUfiICxcFqw9YyEMXDvWytbHSBvludlItq7sYvQp5jF/nGBCsOW9XcelQnX
 OPtkiwMdv9qCe0pr0FlTLJffBj7aN6L54N+KOa3VsQok0SK3QO93p/j
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_141057_496951_EF249BA7 
X-CRM114-Status: GOOD (  11.68  )
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
 MAINTAINERS                                        |   5 +
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
 17 files changed, 1478 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-adpdrm-25fce3dd8a71



