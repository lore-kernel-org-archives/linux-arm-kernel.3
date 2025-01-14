Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A70C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jj1Oq27rwI9p40TW7OnWxk/RTRgAvKkMZT+lqIFoWlQ=; b=VpiIJH7gT7NcWg/sZ4lhnGQgBn
	2UIi+As0yZynq9Jd/hjDo949hqqxjl4uJL0ueWrth9543cipzuR1//B8hSW4wE+MeXzkhElfAGj31
	mbQXSWskpPk9i9VjA90vURGO+Xq/uSYFiE5YHb0vzi2tJ1H07KX00iICm1m7VMb+H+dW6RfwRw9He
	VcbGYueLZnooIxDyecSDcY5zTD5F8qztW++gwtTViQC/3g8DKrrQvo52DBp9pOhBFwnApVe5popBo
	YuNvQ2UW8pVWwo+chWRy5rABkqL4NW5jp2dhXeOqTkfx7670rAGfiWwGeaUoHsLW1f+Am8lyJkh1G
	sCUT9+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoe2-00000009pme-0Eoh;
	Tue, 14 Jan 2025 21:40:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXocm-00000009pVo-1ekv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61DC35C59D4;
	Tue, 14 Jan 2025 21:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA912C4CEDD;
	Tue, 14 Jan 2025 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736890738;
	bh=ZqXJD3Ty0hy3p1Rn2AjYRjEtykGB6SyBFMldnyqM0Bw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h7aLNlb0OBZ4nIr3QJdrx2kb4o/zdZFaMOL+PiE2q/F3gSmKi2ygL7QMz6nhrzuQM
	 GtzDzLwtNrXTWG+M+E+1XOAmwcTXHBw5YCddhdCR/P6mzikYCR+HNwf5fhaLtROHPu
	 10RLqPFbtHT8RZXpZRtChZYWZ898HobbbtT1rcZ7tDENZbzk3EA62bHJnNvOwJ7MaG
	 aWTttj+rV/UkDPgTANUjVqQ1h6tzp8jkDMPjkm1AGtLknGowy4cGjsXIzpuozjwDZi
	 upPVIdbXEedM461VTTgYnFBjmnU5CHr/GM8yLX4qYp81ajAi+bjeLZCwyMPWj+W5W2
	 rlisatVzWWaVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F63CC02183;
	Tue, 14 Jan 2025 21:38:58 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v4 0/5] Driver for pre-DCP apple display controller.
Date: Tue, 14 Jan 2025 22:38:51 +0100
Message-Id: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvZhmcC/2XMywrDIBCF4VcJrmtx1Fzsqu9RuhAdE6G5oEVaQ
 t69JtAQ2uUZ5vtnEjF4jORSzCRg8tGPQx7yVBDT6aFF6m3ehDMuAbik2k429JSXzqCwttE1kPw
 8BXT+tYVu97w7H59jeG/dBOv1L5GAMipAgW2wQqn0te21f5zN2JM1kfiRVTvjmRnFZFMKURmmf
 pn4spJltzOxsqqW1oByunZHtizLBwoVYPgKAQAA
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
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736890736; l=2322;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=ZqXJD3Ty0hy3p1Rn2AjYRjEtykGB6SyBFMldnyqM0Bw=;
 b=ePZzGayCIflzxCQOZEHfmM1ZpjGRm9Jv16/Y3XbsjvMGeFINB091HBgC1w099s9OC9FGCFAft
 x8UzvWrCUAMDV/wkZihuT2i8JeN1u00hdCxZrYLVleU311MFq5t2lAY
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_133900_524053_0AAC0511 
X-CRM114-Status: GOOD (  11.96  )
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
 arch/arm64/boot/dts/apple/t8103.dtsi               |  60 +++
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  61 +++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  16 +
 drivers/gpu/drm/adp/Makefile                       |   5 +
 drivers/gpu/drm/adp/adp-mipi.c                     | 251 +++++++++
 drivers/gpu/drm/adp/adp_drv.c                      | 594 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
 17 files changed, 1428 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-adpdrm-25fce3dd8a71



