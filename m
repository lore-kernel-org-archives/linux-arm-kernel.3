Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6B8E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQLHcO/KvmCnC9ZWCNQXTIP8fKObC+f78tZMeRE389I=; b=M0xoW8eneB25zeNIMe8unIS/KF
	e9nODC/d0o9sHxtFauyWrS2wYeQet8zA1HZjxiDMmrJDr1Zf8aRh7c3Q1oDEvD1bqvGyvjilnbh33
	+Xpwa7WSgv+AgPYaZruWsS9JslFhUi5iHNzKjdzCXlqf8n4AxNJ1qGbL+5MpRsgmjOLE1yjgK2k29
	60cZqvUteHsjpRYsxyjMO6jcmWNBC/yqE5p/9cUdOLBKD7SEjIQ+93IG7/tINRNqQr8QM7sjtP/Z/
	aPi3/lWUiMSYOmFx0hdRocjmW9ycl2NvIq/RU5EJdE1SuR3PrXYwuZ+8PdMIzA2m8GpYKKtSHpAKA
	rJsfufOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZh-000000034wU-2oiu;
	Sun, 28 Dec 2025 22:49:21 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZY-000000034tU-2SWr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 22:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962151; bh=KaCBaMWeVC2ZFchPLeP88CdpHpnT+QxAouK/zyWlpMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0PxZWi5zMD/97c0q/3zpYwkvjxznCn74S0x6+Pdx3vGION33tMjSZDzI5PNGFEpc
	 5Fo/4Fb9o8REG068pCSg1lXqNM8n35iS+A0i5abpIUENWOqQiwPw8jh1Z/9QJk5uWv
	 U09mbtYbW0pfcQxwRimRzCLEUbgEqwb49fdgNb+TI7q7BdLkz+sz5udlWPVXIpXXv6
	 AHgRzoy26KyXJCM2IC/P+jiSXLJz2MRsZ/jQgDjT0mot7Fe3uU+z7TdquWeWSN9kPL
	 KuMnBPf7nSxXYqQWZfgZDoo9NYHA7XKrC06qjU0vqgR5KqaxUpEQ/rxJNOaj0nbB2p
	 yOMhnXcu873OA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 017EE3E915B;
	Sun, 28 Dec 2025 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962150; bh=KaCBaMWeVC2ZFchPLeP88CdpHpnT+QxAouK/zyWlpMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwQ2YRkGBS0egyQ1QHHeFEyKEzZD6BD6A2utaroB20eL+Hn+vnH7Gx1JDQyVXlLt1
	 yTB4DEli3zNn9Z4qhsaw+XNsY5DiXtJ9DpUlaHozMuoS+r0DPJ0POYtCZgsltwiV3n
	 jep5pNrUx0UjAM4C3hpMrAJva9b/UNbLHf/r6ehtLN0be4Bnaak05Ho4WJEoPAmGKb
	 NH1uvFkzkurcRkQnIiZJpyc/XfNk3dhJguSA/dbjRHp5T4e5MJTdV2UtV3sbpopKEc
	 5rPUVPZ43rJ0AvxMSGno+MRABNJq2e4ybhHzrun+h5tmkWh/lY3Aod/4pOwQO4K1va
	 U3pHaDMGS0Ekg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 52A2D3E915D;
	Sun, 28 Dec 2025 22:49:10 +0000 (UTC)
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
Subject: [PATCH 2/2] arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
Date: Mon, 29 Dec 2025 00:49:07 +0200
Message-ID: <20251228224907.1729627-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228224907.1729627-1-vz@mleia.com>
References: <20251228224907.1729627-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251228_224911_029039_DCC7A718 
X-CRM114-Status: GOOD (  10.19  )
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_224911_029039_DCC7A718 
X-CRM114-Status: UNSURE (   9.46  )
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

Motor Control PWM depends on its own supply clock, the clock gate control
is present in TIMCLK_CTRL1 register.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 39af48470ed5..abd401fda94e 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -304,6 +304,7 @@ i2c2: i2c@400a8000 {
 			mpwm: pwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
 				reg = <0x400e8000 0x78>;
+				clocks = <&clk LPC32XX_CLK_MCPWM>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
-- 
2.43.0


