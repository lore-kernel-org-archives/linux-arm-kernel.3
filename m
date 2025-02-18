Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F345C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UTvr00FGoY5I2WpkhLF5LoKjM4XuK74RDOdPCnuhnM=; b=FQnKeFWOJRk/yRtJlr2Rko69ja
	1PXZV0GkAs9vZLetk5JI2fLef5V/8A9pyhY/EnTrLQzBRl6wXdypw4LU0wXTG2PVQJPcM3dJtW3iR
	we+OlrHynt5Fw2qxCG6NBGLMLRjgqeckcAJRFeuzbhmGRKrHbbMhzdvCxWeJUO1gbGWZM/f/kbPoJ
	KAUDkwwhdiw3fCMoPjagbKq9XMerB22Qxn2778WZlZ0QMrmXX9yUMrgyftcnC7johDNag3ObZfChw
	ObJVq3IbqnDdzqmEmdrTZFuO3dUeEOlcQuHYorkJsi7HJYRWc914OqIUcJ3UXYjpLF+nH+7u9W3TH
	B1JJN14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMXP-0000000874Y-0mrR;
	Tue, 18 Feb 2025 12:17:19 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6X-000000081Vz-2OFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:36 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVf36t1z37b;
	Tue, 18 Feb 2025 12:49:30 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVd6W9NzknF;
	Tue, 18 Feb 2025 12:49:29 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:13 +0100
Subject: [PATCH 2/9] arm64: dts: rockchip: move DDC bus from Haikou
 carrierboard to RK3399 Puma DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-2-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034933_764229_F86F0665 
X-CRM114-Status: GOOD (  11.51  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The DDC bus is necessarily on I2C3, that's how it's exposed by RK3399
Puma on the Q7 golden fingers, so let's move it to the SoM DTSI instead.

If the carrierboard doesn't route it for some reason, /delete-property/
can be used to remove it.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 1 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 947bbd62a6b09ce55320d0889ee8cf50ca59dfd4..4a1a71995bf5da65d59214711671d87c9ea2de62 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -150,7 +150,6 @@ vddd_codec: regulator-vddd-codec {
 };
 
 &hdmi {
-	ddc-i2c-bus = <&i2c3>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 995b30a7aae01a0326e9f80d6be930f227968539..f7548613ac46e190972d549271ec0bbc0c8a9b92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -389,6 +389,10 @@ vdd_gpu: regulator@60 {
 	};
 };
 
+&hdmi {
+	ddc-i2c-bus = <&i2c3>;
+};
+
 &i2c7 {
 	status = "okay";
 	clock-frequency = <400000>;

-- 
2.48.1


