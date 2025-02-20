Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfNfJFHkQvwcnTOv1peV4CTfsjgyzjH0f5EOADofyBY=; b=dgbX+KEFjDYb65E6bh5sw7nfeX
	5anRdhoAdjmdIkaNKVLo6Hzkwr6h3gvZOYiGS+TkEZu/0hRsMX5UNhMXj4EBVopORmxsuppDypL2R
	4Cp2L2Jnqacf397ZiIJQdWGv8+pe2tPlvAO1TVENrST3EbPIhw/2bJbUj7ONzmfwFgt2a2l6jzX0M
	gxVTEkKpAifqIeO1GHZU7XF681gOraBRv3rV2YFj3hOlp4eDuyQuoKHKyj6V833zLRVo+iPTBjGep
	4RE6iIbP2E9EjoB7VCVE75IG+Q/FX4SU3lMpwqdayoKxyPa44RYPjQh/fT6nk396hSFd7m6WN2vyA
	RLyCrXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Ym-00000000Uyd-2POm;
	Thu, 20 Feb 2025 11:17:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4RP-00000000Sxv-1UN1;
	Thu, 20 Feb 2025 11:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049802;
	bh=XRowMk/5gMfwXHxFEFKhwBi4Aeuclsw7ltcciXwDOXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VozmHJFMdz01HBmeVnpACKYNJVqljzZw8gpJtSa+NuWSaEUTwUw445E/cfNhzU7Ew
	 hz58qKam8L5SBy6sqw1LOGUEVs9DWtGSs/wLpjbHtNszuNsPViYQwsqoavzG9SGCH5
	 1bCJrv/0BJCuK7QkhHn+DO3p0bg4DZQQlTrU3kkNdqN8vfVsJBvfP02OJUx3AS2NU7
	 9YvJsUD2m3oAFb66OVK2aLYGNA5AS1OAUy/5iCypFqaVMywQwwTfcVcNFkYkBsfl/B
	 C/cG+YnDi4/0LmB0cyfvuXp3MwmzMKTA3rl7MYJVGDhSm7S7HnFCBjTKHO09rJS7uh
	 VqHKMLJffikfA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AC2F17E156F;
	Thu, 20 Feb 2025 12:10:01 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 4/4] arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins
Date: Thu, 20 Feb 2025 12:09:48 +0100
Message-ID: <20250220110948.45596-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031003_535471_72E9DC5B 
X-CRM114-Status: UNSURE (   8.61  )
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

Add a pinctrl configuration for the Touchscreen IC's power line
to make sure that the pin is configured as GPIO and to stop
relying on correct pin configuration from bootloader.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 0191776e037c..55564d91423f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -187,6 +187,8 @@ touch0_fixed_3v3: regulator-5 {
 		gpio = <&pio 119 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_vsys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_vreg_pins>;
 	};
 
 	usb_hub_fixed_3v3: regulator-6 {
@@ -1021,6 +1023,13 @@ pins-spi {
 		};
 	};
 
+	touch_vreg_pins: touch-avdd-pins {
+		pins-power {
+			pinmux = <PINMUX_GPIO120__FUNC_B_GPIO120>;
+			output-high;
+		};
+	};
+
 	touch_pins: touch-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO6__FUNC_B_GPIO6>;
-- 
2.48.1


