Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CE6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciWbwyTmOlnq2cLpie/tgwrHFKelOt2C5BCRX15iCf4=; b=tJ7m1+2JAiUiYa1CM021bT8PWi
	EdvM+Pw8HZYIPqa8SrCXPv1IlL3+XIsHwMoW3sSLMks8GAdkHJi8ThE1f7JGvbyT7UgWEKH8Az1TQ
	GvkxSJLxURY3Lmpq0J8de+J4A0KChvb7vNzwtpXA6ZKjp0Z4cC5oJEKhBcEW4ydkVs26M9JNVULBL
	BHJlJWKUb/dX9QN09Qs65bREh2gWkEHCo00+ONNQuR8KoHyVNC0PHQZZ5cyAZH7K6NCr61li7mtc+
	9ltIqynNgr+TCibMmSWAw6MLhPLd8WiMq77odKs9A6N1PI55/MBLxYvpR1o4nZzy7XYwK86WegTbS
	su3pg14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDK0C-000000036eK-411v;
	Fri, 09 May 2025 09:26:44 +0000
Received: from out28-100.mail.aliyun.com ([115.124.28.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJXe-000000030Qk-1KCX;
	Fri, 09 May 2025 08:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746781029; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ciWbwyTmOlnq2cLpie/tgwrHFKelOt2C5BCRX15iCf4=;
	b=fG0f5jYP/FCs2HjoJVpDVrgNI8H25a+dI9v6mCRwgBmnqQhlOSzW82FTKDiBI/3h617wCySqnOpJEvULBuDek3C5rlsBqbOjV7xXmx0qpcnLSwm6pLYGvAR2pMH0F+PRau3cUgi8B+/OOgPJahBsLKlVmlWdLAPQk1QFprugAfQ=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjnlki._1746781023 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 16:57:05 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 1/2] ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
Date: Fri,  9 May 2025 16:56:56 +0800
Message-Id: <20250509085657.309934-2-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509085657.309934-1-hao.zhang@coolkit.cn>
References: <20250509085657.309934-1-hao.zhang@coolkit.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015714_772105_EF265F29 
X-CRM114-Status: UNSURE (   8.30  )
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

From: "hao.zhang" <hao.zhang@coolkit.cn>

Reduce max-frequency from 50MHz to 25MHz to improve WiFi module stability
on some Sonoff iHost units. Remove unsupported or redundant properties,
and keep only minimal, validated configuration.

Signed-off-by: hao.zhang <hao.zhang@coolkit.cn>
---
 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
index 9a87dc0d5f66..088a069bb1a8 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
@@ -342,16 +342,14 @@ &saradc {
 
 &sdio {
 	bus-width = <4>;
-	cap-sd-highspeed;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-	max-frequency = <50000000>;
+	max-frequency = <25000000>;
 	mmc-pwrseq = <&sdio_pwrseq>;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
 	rockchip,default-sample-phase = <90>;
-	sd-uhs-sdr50;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vcc_1v8>;
 	status = "okay";
-- 
2.34.1


