Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65298D277C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vJYBJHFSE71hlH9XHyn+be3FkLxWJ7Q+QVgvtn51sk=; b=W2TsDZOCBMhUbPjhBvbJztPzwJ
	E9puCXywfsszcjIAezRiSO175jdHIJuOXWxmOlN5MxGLl4YcH96sf0ImmBTbnj/ciuSjaduG9kiUP
	R3Nh525lPwxMvzCv+q4IhlZMO0Ox3Mj4+I+vP6aVKSQsKCU9AEPypaZ5y3Q4NVHLf5rJLnzZ0R9j0
	C2uHckqZZwTBDHS35SDtbB0AndTUt+wKgjUNVT4wb4gZpNW2V238CqrjUY1FW/KXsOfR2WYDjfcSq
	joE19bPgjj9wYLK+nNicvR87ZRzOHbfxNFBN48N034qadtr16Oe75Dajaj2DK7TZiFjJE2WOVl47U
	w16BXleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO31-00000003AR7-2kjn;
	Sat, 10 Jan 2026 01:45:47 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO2z-00000003AQU-24RR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009544; bh=9JX/rXLHGcrTabMUzfusMQsBUjz6LX2b1LPrfc/bGPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CIrNkb3EHQdgUqjfOTaQQznA9mIA5U/V9U7ab98icQJRLuVRZs5KhlSJ+bGnWmpXP
	 QiKgSMMS4BYzhx/ipuhyRPiIyB8pkgnXS42JMg6WInsN9u+YktbUg0iutMVQ4XeBmn
	 0vaZf03zPz84BoP9rzmLUmd8bxS9C1HmBGYnk2sAJCqXQna0nHYpU+RCK7ka+v5OE2
	 b48Uag5ESCAhwIzbHxZUx2HyGof0dUHQtGl3kSuv3BbzHnpH9t1TWhStW0y2Bmok93
	 ZVZBfTd8t9+MHx4yKWa/5HgRsGkRluAuoQmnPWMCvrcjmRBA3J29L1P8rHB04p60J0
	 xnBttruyHPPGw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0D40C3EB80E;
	Sat, 10 Jan 2026 01:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009543; bh=9JX/rXLHGcrTabMUzfusMQsBUjz6LX2b1LPrfc/bGPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEhXN1QIZgsmjPONfJwPPcPwCctX5FxXGpz2NRr+hYCccjhYlegywl6dxSmMeP1ew
	 khhGImm2huMxuQ89q8YbbW8MOygV2WRjMup+NPh+gXxt74R5zpZ7VJBTA4WSGBzQvD
	 Lby2RBAUJNtIMieqrgVdEWG8AwcfOOC6b0DG1VQpXPeLWzMUEsKIHk87XDkz34bnee
	 Bg59pLusbLj7MB1GqZDTrKGeJ3VIM/k4dwls302nkGw+bn3Vg5WIzr/ST5nNinTkFV
	 b7JaChrdgbtMUkOU2E7OHtgoofRU0G1R3aZvCjI2lYBwFLDHORxKwsqYt7RdIM5OVQ
	 ZDyrNm92BzANA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 5F3473EB810;
	Sat, 10 Jan 2026 01:45:43 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm: dts: lpc32xx: add interrupts property to Motor Control PWM
Date: Sat, 10 Jan 2026 03:45:24 +0200
Message-ID: <20260110014524.3379187-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110014524.3379187-1-vz@mleia.com>
References: <20260110014524.3379187-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260110_014544_070900_8715560B 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_014544_070900_8715560B 
X-CRM114-Status: UNSURE (   9.94  )
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

Motor Control PWM shares an interrupt line with TIMER4 on MIC interrupt
controller, the interrupt serves as period (timer limit), pulse-width (match)
and capture event interrupt.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 7fa91d1ac9ea..e94df78def18 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -322,6 +322,7 @@ i2c2: i2c@400a8000 {
 			mpwm: pwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
 				reg = <0x400e8000 0x78>;
+				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 				clocks = <&clk LPC32XX_CLK_MCPWM>;
 				#pwm-cells = <3>;
 				status = "disabled";
-- 
2.43.0


