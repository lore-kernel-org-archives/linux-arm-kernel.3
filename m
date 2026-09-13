Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F65DC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WaGMwqU8KwunPbjnR/t9uDfGmBUUzSYWU+v6BxzEpQ=; b=1b/wvCN2jPMDk+
	ngaOaQF8RVYSQquhygqKnI9TNTOCfJ/+nGWfUFUnB8xO+FDLH8DHzWml4lC3tUtwGCBu06g0q2Z4x
	+TClxvvnc/eDWJsMz7Ei0mrbYwuuRIZe5NRSHp+nDlbdb/HIa70H+CkvKV6bnhphjseBBBAzowNZH
	IdsBLJdNdEagxG5aoKLkNEpn6UflycZQMEFCmRV+2Hp8Ebdgct07c4XiPEkythltp9GXpHxhsYTI+
	Thh9/fQWwtwsjfDY9N7ZirmYkRJ8MRLoSUKEK3ef9JgrLZpK2NJ2tPU2rv1Dx0mU7wRITxVTyNbm5
	SX6FS1urJXg/q9y5Nhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lXT-00000001j1T-2Msk;
	Sun, 13 Sep 2026 14:50:39 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lXQ-00000001j0Y-2su0;
	Sun, 13 Sep 2026 14:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1789311024; bh=8WaGMwqU8KwunPbjnR/t9uD
	fGmBUUzSYWU+v6BxzEpQ=; b=CiqL3eJpMDjisS3nqypMSWUlztUGRQ7LMFW5KTtTUHyA0DH5C1
	pd2tOspLIWEENc8VjbvlZ/mFvNS2QbszRLzgk/0YWUZVPl/iBt7vT5KdrZBgS7F8v97miUOLzXL
	h7OqliPTPcNKA+cEI3viiBlMA5c1FBCnzGac/vWmFJPgFKsnpzQblvjrwf7T3C+JrhLjdb8bgxk
	bOckZHahPgGs/9plSSq5dsheI+bLlmy2O8nePHOq76VXNiy4S81CsOjU/6tIa/76m4acRDuqmIt
	+My7O3qfmnlPRB/3knuO+kW55KwRNvPKFSj4EZYQmU2eoqkgs4a8dS/pH3LxF0NKkqA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1789311024; bh=8WaGMwqU8KwunPbjnR/t9uD
	fGmBUUzSYWU+v6BxzEpQ=; b=ooKm5p0XUB4ZDOena31p9atloEVeyXKuLinm2RwmCoPoOjQ8hr
	1oJkQwfLxLIP1y16b8Ha4lghVhXX3Q8u7FAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
Date: Sun, 13 Sep 2026 17:50:15 +0300
Message-Id: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NSw6CMBSF4a2Yjq3pLQGsI/dhHJRygeujxRYbD
 WHvFhw4MDEO/+TkOyML6AkD261G5jFSIGdTZOsVM522LXKqUzMpZCG2UvGbcVduXdQDnrkdchA
 SeK8tXgJH2ai62uZaFSVLQu+xoceiH47vDvfqhGaYyXnRURicfy73Eebdf08RuODGgNEFVLUsY
 H/VZC9kybYb51s230X5ARXAb1AmELIcM1BCl031BU7T9AJm5tBRLgEAAA==
X-Change-ID: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789311023; l=2626;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=+jGiurf1kEqr+HZOxFel+f+dvBj32YpLxsXDyEXYVRQ=;
 b=1GGuI/z4mvuU6ilS+RZyz7ZNreG747cGYcwIhBxknZ3kX+AGBbfiCaw/+f78iXaQ6FzLfemDG
 rbAB3qF/6ovDuYY5LPLNfBWpUGw162b8KtHaD0Supf8h9/m/d/NNaKg
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075036_878493_F286AF69 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

This series adds support for Novatek NT51021-based panels 
for upcoming xiaomi-clover submission.

Although according to datasheet, the IС has three power rails 
in the use case of xiaomi-clover, all of them are wired to one 
fixed regulator.

Maybe I should create a dt option for enabling CABC for panel.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v3:
- Fixed bindings (Krzysztof)
- Fixed probe function (Sashiko)
- Added BOE-TV101WUM-NM0 support (Ryan)
- Link to v2: https://patch.msgid.link/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org

Changes in v2:
- Use devm_functions and renamed structs and functions (Neil)
- Added delay before deasserting reset for stable initialization (Sashiko and Ryan)
- Fixed dt-bindings (Sashiko and Neil)
- Added a comment about set_display_on command
- Link to v1: https://patch.msgid.link/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org

To: Nickolay Goppen <setotau@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Nickolay Goppen (3):
      dt-bindings: display: panel: Add Novatek NT51021
      drivers: gpu: drm: panel: Add BOE NT51021 driver
      MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver

 .../bindings/display/panel/novatek,nt51021.yaml    |  87 +++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 855 +++++++++++++++++++++
 5 files changed, 959 insertions(+)
---
base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>

