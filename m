Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056B3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98zlOFlTcCf8tZkUcKA/XRtZlQr5A9hWnT2rSd3LkgM=; b=i8QnsQTN3jOCW3KVYpz51Ofcr/
	FNAYtWRlmWhVifsKeKmWq/mXopOvU1UwGEg6CoiKeYNZuRL69scBzQ2sUGtY9HS+Ppm4+gA1OULcM
	Cz6c90n8mejA8b93PREwwGBofLXUR7gbIVYRXl1RAUigmsTKkz7DEZ5wi7BsAtIxCt356jlvyBImO
	zwFs0f4YrsnLnq00iPXE9GPxXEKn20EwicDjwAQrGbMUYZGC2B0eOhk4Mkn20gNcofjafxj06bs7U
	1CPZStL0O6VbIYy5PRD8x6DyK5dWf9ro7tvHESXdWqGezazSjkcUmUCjy536NTyMI85EqDjo4ZAHF
	dILSjH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUEq-000000047N0-48F5;
	Tue, 01 Jul 2025 06:13:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8y-000000046Kv-15EU;
	Tue, 01 Jul 2025 06:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C0706143F;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9DB2C4CEFE;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350019;
	bh=yl69ujOKudAoxb7BsY6W6/j+nW0EaIsBsX9NLiSjkC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l6Lm+TbJXFCiOILQRwUqwcYAkDVVqX9rLNJfjuN4dNYpfvuDL2c+yZZqu+3hInd6O
	 jdJsap77kzAiDtOnlXC9/rzjnMBEhcty/3PV9ncwJaTR52pmB4QoUfi5vV5cs27eT0
	 3gL4wCFS6GQgapZLHZoL9WA4O7f4ZtSKzK84eLImxYmEFEZ/F5k2CSXkiSv5TPgH4H
	 CEUY5DgJKU9pzAUFfbV2EQQEhKRQ4MDd7Z901HUdzm9MoEr+b6IG9ZWcHRBeXueN8t
	 bf4rdo95E7rz/ngXqMuBzyQlbi76Cq95bhGFzOBQggW848l2Ei7ZFMpKzjgKvZHe6s
	 n55sGlXoGJ1+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BFDC8303B;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:02 +0300
Subject: [PATCH v3 08/11] ARM: mediatek: add MT6572 smp bring up code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-8-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=1940;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=PSE9MkQgZmOqgXgkbRv8mf/3whMKOtrk3zwWFrj3c7Q=;
 b=KWkSJeZfxusTPI4uIF19+84KsqxhE+OptOVcoVaBekTd7CikI1o6vPYPps+1GacT+silks3LQ
 BSELHxQkamLDGKlPj47Gk1eMmDJifYWAVEE0Mesd6OyTvUm/ufnjYfT
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add support for booting the secondary CPU on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/mach-mediatek/Kconfig   | 4 ++++
 arch/arm/mach-mediatek/platsmp.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 35a3430c7942d897106bb32916df78347113798a..638eabad2dd37ee56244fc036cb76af135aee416 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -15,6 +15,10 @@ config MACH_MT2701
 	bool "MediaTek MT2701 SoCs support"
 	default ARCH_MEDIATEK
 
+config MACH_MT6572
+	bool "MediaTek MT6572 SoCs support"
+	default ARCH_MEDIATEK
+
 config MACH_MT6589
 	bool "MediaTek MT6589 SoCs support"
 	default ARCH_MEDIATEK
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 16a4ee6c959050474c5535ac6a65d92b29482d53..bbd26d423bdef23629ec5ca9d9c61903748988b7 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -29,6 +29,12 @@ static const struct mtk_smp_boot_info mtk_mt8135_tz_boot = {
 	{ 0x3f8, 0x3f8, 0x3f8 },
 };
 
+static const struct mtk_smp_boot_info mtk_mt6572_boot = {
+	0x10001400, 0x08,
+	{ 0x534c4131 },
+	{ 0x0c },
+};
+
 static const struct mtk_smp_boot_info mtk_mt6589_boot = {
 	0x10002000, 0x34,
 	{ 0x534c4131, 0x4c415332, 0x41534c33 },
@@ -49,6 +55,7 @@ static const struct of_device_id mtk_tz_smp_boot_infos[] __initconst = {
 };
 
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
+	{ .compatible   = "mediatek,mt6572", .data = &mtk_mt6572_boot },
 	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
 	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt7629", .data = &mtk_mt7623_boot },

-- 
2.50.0



