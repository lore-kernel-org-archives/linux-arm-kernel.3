Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80AAC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rp56DHgQi9XN3i0LEDzYAoCZSiBnN1Rn4E3S+pjit7M=; b=huWQul+6xNBLyaCWob5EgjhbVi
	K3SA8TvmwckwzTc1lx5EhxgEtHs9eyaRyX4lucNcpXckz5SPpcsz8yIdGtK0aGZVcHMKGuUQSdM6s
	D3ggD0w6f89OBMiy9uWQHyfuWGQTJ+IdYLZJjgy85vKFm+NZaHRxaTp1//7hiMap+GeFL8BiBO+H7
	jOdmjBcwPWM47DanvWeGYaScfIxPJJtSvdiSKBb32oaUvzJyZbTLDt4B/BMc0dam/LBLahS0DIgLy
	UG9U2ZE4H/1X5PqLWj5iF5eIXwN0L8Pc+XSEfuGUEEQJd2n1cA5mpNkbEQ5Yne5rBkODj+r6JowCt
	t3rN3sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7Sb-00000005INT-3oTP;
	Tue, 08 Jul 2025 12:30:09 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7PU-00000005Hwr-46tr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:26:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 975D2C74C1;
	Tue,  8 Jul 2025 14:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751977608; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Rp56DHgQi9XN3i0LEDzYAoCZSiBnN1Rn4E3S+pjit7M=;
	b=TNRJk09U9t0QZ+9wGXAay+FMGk2pHDadpBKz+mFUBbZ96kue5imLy3YG9iEstvxPpOgAgR
	mnJLm2VlWrhPPpQm2qbk7Ny+j+guPm5op7yoqsSkauRMg+UYxd5VyNtwTZpIqILcFtGsOd
	82NHEfCOi9c9QSxd/07vNsreHn4ylPJtQljwyAOot0rTTtVkA5Z+/lGBz4KZQjuS5MWoe2
	q9QkYUVJSjgnDyYejT7blpVEabjWONQuMfvhAanN0FuU7TAaOlpm/jq+HaRX7GJvbWZAkw
	UY0Pnzl0NRv9xQsrhbxEFD+OcxnKRMUeA0K8QHotUkDeExATzpZll8jfnb6lPw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface
Date: Tue,  8 Jul 2025 14:24:41 +0200
Message-ID: <20250708122442.53829-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_052657_442651_882CEE20 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Annette Kobou <annette.kobou@kontron.de>

The polarity of the DE signal of the transceiver is active-high for
sending. Therefore rs485-rts-active-low is wrong and needs to be
removed to make RS485 transmissions work.

Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Fixes: 1ea4b76cdfde ("ARM: dts: imx6ul-kontron-n6310: Add Kontron i.MX6UL N6310 SoM and boards")
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 29d2f86d5e34a..f4c45e964daf8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -168,7 +168,6 @@ &uart2 {
 	pinctrl-0 = <&pinctrl_uart2>;
 	linux,rs485-enabled-at-boot-time;
 	rs485-rx-during-tx;
-	rs485-rts-active-low;
 	uart-has-rtscts;
 	status = "okay";
 };
-- 
2.50.0


