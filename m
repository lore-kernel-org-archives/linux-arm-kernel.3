Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bFTUh9SwYeasiDREoxvaQj17XkkmaFIe8D9gtwB8r/M=; b=mlZ43vz43LPV+ITL4oXNTQ+iIj
	+3sWTyXM99GPNAHjV9Jfyk4pr36xYUrnUoCQQsfNYYMtePpeAfblXmI2QxZ0gFEtyh0UGGG3sv0X6
	ANIv3H8lJxTVG6HkQbg1hhBHUZ92x2EVXvYKqh6Lh06eTkp6+as3wx5B4Js2y+QMnmaBjW1KlFgOe
	oZ5iH73SNeKNFHZSfqXiX1BQ9WtkDznizSHetgIltJtxirfMQdPWVKqi61vSlnevg5kuv82ZIOJtL
	41XpEklIKXl7lbfBCAwwjiP9qs6wFW+axFoHwn53lzgP+j7NRU2Q6EvpOF0QPIjeEvS1bvCF0HXs1
	WQdxwwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul8ZI-00000005m61-0UnQ;
	Sun, 10 Aug 2025 16:06:44 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul8Wm-00000005lzj-1cic
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 16:04:09 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c0MyL4698z9smZ;
	Sun, 10 Aug 2025 18:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFTUh9SwYeasiDREoxvaQj17XkkmaFIe8D9gtwB8r/M=;
	b=WeXbLkLyIGJODrRBejRDsAyjLMr+GBrwkDlcYgwDBhBxBXAHaur34Gn3OIQPldSUW6tW5S
	kHcLBqf2B9TBdXIc26A61qA7zm0nHCSJg+0CDAj/pmSv5Bmgo60Y+flm7k1mcvNfh/my6H
	z/xtRhqNGoNJvlp0I3hBVyBO28WBJJ0Gxk4k55GjIqc5Rpf9Ffu9KRq20Itv2DM3Xaed8x
	liqZdGLm5AupxOUoBEP0aabpDalBd+zzWsMStpgZPSreOF4BbEWXmkGY16fLwqNkjt+CnD
	gmYRdrCMkJ9vUJCPPax/K0k2See8/OBlayZldr4FalglxANtBl9zypBOk/Q0Bw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KXalXkxz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFTUh9SwYeasiDREoxvaQj17XkkmaFIe8D9gtwB8r/M=;
	b=KXalXkxzZzQNZC863YsGVJFKRrgqTSMPP7CxMSZ4BG2T7Dsiws9tSG/tPXoAtodC0oJ2nc
	gF9Ce3mO5BiZr5UC+Pt3PjmUVlQQaMt9uDdKxWpll7YMV1N8TfjNAukksQ6yvuqcHT3Bqd
	gcB7EJdcIDNkWmzSYTRNmMw92/nXpDI4STR1mqsYEsPIu3FTtMJMkS/BOxu0iOPav5jgVy
	ezN0wd9WXzoA9HYkuqKpq7v2l25VRFIzkTO0a9NvEAASZF7HluR+pWHDf/suPTztajSDuD
	ZoOcV9MTcY0XVp78MkjIbym8Y+bwOMrTkWYSaWbs4war/0/qUkeiTvcYqvKBAA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
Date: Sun, 10 Aug 2025 18:03:07 +0200
Message-ID: <20250810160340.10042-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 113fc956646a692c002
X-MBO-RS-META: bmbrtg1j8bosgd16iqjre398getbzgqs
X-Rspamd-Queue-Id: 4c0MyL4698z9smZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_090408_609795_5DC0F54D 
X-CRM114-Status: UNSURE (   8.84  )
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

Add missing microSD slot vqmmc-supply property, otherwise the kernel
might shut down LDO5 regulator and that would power off the microSD
card slot, possibly while it is in use. Add the property to make sure
the kernel is aware of the LDO5 regulator which supplies the microSD
slot and keeps the LDO5 enabled.

Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 7f754e0a5d693..68c2e0156a5c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -609,6 +609,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.2


