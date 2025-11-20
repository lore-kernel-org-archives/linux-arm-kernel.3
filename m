Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCDCCFA442
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MfnM0jSdEloe4HZ32VUBdjPce4zV0B1vrXjJgQPSBY0=; b=XtoxjH/tvlPBsga2DQvkniqPc/
	MonpTBwtI84bQOiXnP5uIQPeqiT/SwJwM6aeHpGwGPoU9nhmlIH/5OrEtFhUvfPcri042bdCC1LRx
	deoLU9kEf5VSluW9Bso6wjo+deCCrms6crhqG8zN/z92RWNn0gOZQ/DBvc2lQ/n5QbC+bkPokkbPZ
	zFkF2oziPk0lMLh6zI+lOOn0av/QocvBkBSUN4odYo+HnF0QQX4PWq06iWrWTSkhBp+sDDUye2Olr
	Pod/Iu2OdfcfRewcEvXvb5cI9a0rnM+9fOsM8Pve1ruHPOqcvX0EKRT4zrBGr4i5N8ByC9OZXcou6
	xTFF9UtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMB9R-00000007L6C-2pYN;
	Thu, 20 Nov 2025 20:21:09 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMB9L-00000007L5l-2EK7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 20:21:08 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dC8qt0fJhz9tkd;
	Thu, 20 Nov 2025 21:20:58 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH 0/3] Add support for exynos5250-samsung-nexus10-manta (Google Nexus 10)
Date: Thu, 20 Nov 2025 21:19:58 +0100
Message-ID: <20251120201958.1970828-1-linux@timmermann.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dC8qt0fJhz9tkd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_122103_731610_4C493138 
X-CRM114-Status: GOOD (  14.71  )
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

This patch series adds initial support for the samsung-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The notification led driver (as3668) is already 
in the kernel mailing list and can be found here:
https://lore.kernel.org/linux-leds/20251117020008.316648-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Alexandre Marquet (3):
  dt-bindings: ARM: samsung: Add Samsung Manta (Google Nexus 10)
  ARM: dts: exynos: Add Samsung Manta (Google Nexus 10)
  ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../exynos5250-samsung-nexus10-manta.dts      | 516 ++++++++++++++++++
 arch/arm/mach-exynos/firmware.c               |   4 +-
 4 files changed, 520 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos5250-samsung-nexus10-manta.dts

-- 
2.52.0


