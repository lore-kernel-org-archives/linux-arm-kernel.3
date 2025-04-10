Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E60C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qZ/uxtZRGjyTTaKDw3qSzzY/ch26J4NClQEzhZf87k=; b=fHjWSLSzsZR0p5bQkQ8On5EShR
	xreg6HvOoNKvjIcqLsMJae4kQNjHgiOsIIZZLw4EoVrOASI+pmuLuQQ0IC3vujnMEccYvv0N0MeQq
	1AEss0zD9QKX77hVvhmRr/Jzzo65kQfgIQkEGwIAqwtjacHdMR2azI6gVPFO6f/Y2+73flvjc27Lw
	JSipni9VzOdgX+CsV3piuDNKKZMAxoRJv3NhaiePWti9f9cW8WzHM3q8fMXuaEmy+CeonuUFdu7Pi
	cNn84CRf2wD18f3jrqn6SgRFjSxS2m1gM2LlZiyyWMbCF7TroZ7slCxlEo2C47iWWEwp5vciOBphR
	WA3kFi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tYp-0000000Ay2K-0qRI;
	Thu, 10 Apr 2025 15:11:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t5I-0000000AsYS-1LL5;
	Thu, 10 Apr 2025 14:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296050;
	bh=HoMXmmD7f7z0l1Z9ckE1vbnSpSX6fo2zewO9Evv2Zq0=;
	h=From:To:Cc:Subject:Date:From;
	b=Et4OP1zSxFwzxP+VSQTfoQrie8gEtMOY1HEhjJzT87Gdbo/H/F7CBuNNhoR+tF6ub
	 ZCZNk3R8OA0NqMp7BK7ZONMbee3hXul+Gx8GlyCdfPDzt2lxviOjg2r2lSSnmxSM+u
	 ju6oDAzxQ7rXLlqoxweneQu2SU2prX5KVBFAnrt7YkVuL1S2PpCgHLM/L2jNe7/luF
	 13e9gtFbF6CQidFFIW8Uam2ApW0pfW0SorhgK8mEZWNWQNu7oriiE6f2VDZO7MlL4u
	 QYVFxLx8moBhI1cIPz07bFMSBCzRSIqJgyWcuzkt+DwldBIGZgiafoMWOdA0gHxAXK
	 A+76dZLc86uag==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3443A17E0CA7;
	Thu, 10 Apr 2025 16:40:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
Date: Thu, 10 Apr 2025 16:40:41 +0200
Message-ID: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074052_530699_B71DF024 
X-CRM114-Status: UNSURE (   9.53  )
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

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the pin controller
of the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (3):
  dt-bindings: pinctrl: mediatek: Add support for MT6893
  pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
  arm64: dts: mediatek: Add MT6893 pinmux macro header file

 .../pinctrl/mediatek,mt6893-pinctrl.yaml      |  193 ++
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 1356 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   10 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  879 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h | 2283 +++++++++++++++++
 6 files changed, 4722 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6893.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h

-- 
2.49.0


