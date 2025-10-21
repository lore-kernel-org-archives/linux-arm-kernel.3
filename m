Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRts01yY6wbXoZJiKV8EilNEez97RUtFkZlyQpaiO4k=; b=0f8NKkj4Dyzio8+pmRj1RhVAja
	0zUV3tvEddhQV6X91UrDI4+JXi0wtmbO6pNE2pjrf/D47ZZ41fq14fxkKsdZCCFVLx/Nwfq8Epd2c
	yVxjLS+XkIfX2AmkgYiWch+N27BmfkkEKj2FzldANvCjPa4sUIww3aMlj2R/wKPwzOrxWWTR8gA9x
	OIwKcFIaQaVDBcdf1Kej9H9hcXJK09mU3DCmxIe1sA9MewbRwWZfm+ieKLEU/UsYJsZq/v5Ev60BT
	9wUYkDjWKDP/wMyWVG23WEEl6cYUEuZsy7ArZzOKzffoWVB7l3Ere0FQGVEnRKM5Gfbzr9PdiX78z
	QRVWbKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71r-0000000G73Y-3Q5V;
	Tue, 21 Oct 2025 07:43:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71i-0000000G6nn-1toc;
	Tue, 21 Oct 2025 07:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=eRts01yY6wbXoZJiKV8EilNEez97RUtFkZlyQpaiO4k=; b=o3JiK/qO0Q1QURZtQaMB92OVLg
	KcQi0S6p76uT0t7rrAqusF7W6eDq3ykTRx0KvDUS4QKZFHliSmQtCizSAq0hyER6kPZ//8tuQCjBr
	C6SEHhEdr3NW30ccK+RexkPd2SteNu86isiZi7OC4iCKN7LHCf0T+6RsKswlpLLkAVs8crd99U/we
	26UUU0ScevKW0l84TnFae557F8GV5W8FzLY9fhza2GRgODxucHkUVpbFSqtJ2GuN08mNmpO5YVi2Z
	KRzCizW1diu9kFScYxZttCUAu/FjfVQceAnizjykbuALdMyaIaiPEvSSHkFPGWwa9BIyK9v334Wp2
	hIkidzNw==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB71O-0000uy-Uj; Tue, 21 Oct 2025 09:43:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 6/9] arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion haikou
Date: Tue, 21 Oct 2025 09:42:51 +0200
Message-ID: <20251021074254.87065-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004326_489929_8CD68723 
X-CRM114-Status: GOOD (  13.29  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

i2c@0 on i2cmux2 does already have a phandle i2c_lvds_blc defined.

Use this one instead of replicating the hierarchy again, as this might
result in strange errors if the lion dtsi is changed at some point
in the future.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3368-lion-haikou.dts   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
index ab70ee5f561a..abd1af97456a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
@@ -18,16 +18,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	i2cmux2 {
-		i2c@0 {
-			eeprom: eeprom@50 {
-				compatible = "atmel,24c01";
-				pagesize = <8>;
-				reg = <0x50>;
-			};
-		};
-	};
-
 	leds {
 		pinctrl-0 = <&module_led_pins>, <&sd_card_led_pin>;
 
@@ -68,6 +58,14 @@ vcc5v0_otg: regulator-vcc5v0-otg {
 	};
 };
 
+&i2c_lvds_blc {
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		pagesize = <8>;
+		reg = <0x50>;
+	};
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.47.2


