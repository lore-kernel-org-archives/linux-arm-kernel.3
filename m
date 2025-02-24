Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D20AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RqLf0Aa033/LkCOpvgYtWZSQd6yjysGGsJHGT9q8OZ8=; b=HPYFij8R5lewauitEFXTPgYqEl
	cuQ6UyvAS3kCSMTDait4Zr0tMTiEwEkVPVDkHtnaNH9JlyNws1N0+t/pB1aMyx2Sr6rhvz5Bm3jke
	crGvT2zJn7LcjwZ7hKpALA09kGGTWjMkMsDrZe/bwlB2U6O9p9+pIUZGcSfQbU81lHxTWf86rRoC6
	iEszLmkD9UDYFwpv8iTL/9LRQ7PPWvFf8cfO0GPFhU2fR0CtPoIbPuu8PxisBGfCT5AYTudw88aeW
	VsuczPrcDyu/TNWWLgfsN5e3cgKNV0oh8g0wY6T9G7ShRffmDmJu6ihsgUirETiR4RvoTLNXEhPgf
	UHVjfbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWQC-0000000DITm-47CK;
	Mon, 24 Feb 2025 11:14:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWE7-0000000DGUD-15HI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A80045C3698;
	Mon, 24 Feb 2025 11:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E277C4CEE9;
	Mon, 24 Feb 2025 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740394938;
	bh=8/hEhJaZgI5e+pZI8c7c4hVWCzOme2qSalVM52Cxp5s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NodWtQq5w50QjanpsoNUbmq2Y/vHa9n4mMiylQkYuZmTmtw1ZrYqwkVqJgGvG3qzY
	 6R2hajLu2iby0tCI5IPaH4kNz19/ZGU2CydDRyu395ccQcPR5ibock8KH6go44560/
	 THJEWp8X8iN+tiQRtP4htxT6FGBK9Kh7KVlcpQn/mWwrRYHcttcUWm3hUYkb4bTsVA
	 umK8yE5x3UvuxirYUTrAm21Gkd+15ImlMcc5lT6JWDYf37wD3Hln2weQlxiJFiu/bg
	 sjYz9p01cR/4bvoqObPdOvpbsLdmpYn0wBPiFNdHzRVY+6j7vLTLjgGyauxpOl2itA
	 NHVC419TQRdow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32971C021B5;
	Mon, 24 Feb 2025 11:02:18 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Date: Mon, 24 Feb 2025 12:02:15 +0100
Message-Id: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdRvGcC/2XPy2rDMBAF0F8JWtdFj9Erq/5H6UKPUSKo4yAX0
 xL875UDtYW6vMOcy8yDzFgyzuR8epCCS57zdKvBvJxIuLrbBYccayaccmCMw+DiPZZx4DIFFDE
 apxmpy/eCKX8/i94/ar7m+WsqP8/ehW3TfxULG+ggmGXRoEKw7u0yuvz5GqaRbBULb5naGa8sW
 ApGCqECtT0Tf0zS6nYmNqY0xMBscjr1DFp2HAmVofWSK+qETaxn8mCcyp3JygABg9XW+8R7plp
 2/Ka2I43zVoDx9cGe6YYxvTO9MccRwIugo2nZuq6/6novrOYBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740394936; l=3003;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=8/hEhJaZgI5e+pZI8c7c4hVWCzOme2qSalVM52Cxp5s=;
 b=K/tTXT5sO8YIgAdYKQeBn9XpA5JTVbm86hgJ0mm1PtoAjIE6FjBzaPsMp+smYVMb2tvSSvQx2
 Od9Gj2M27UrAGu7AamUAVjsw0OYjTs9k7UmRiLoaXpJGySw552P7jtV
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_030219_412173_3B4B06AD 
X-CRM114-Status: GOOD (  12.64  )
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
Changes in v8:
- Improved comment readability.
- Link to v7: https://lore.kernel.org/r/20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com

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



