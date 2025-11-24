Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043E0CFD342
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dY6IwZrrMi9/rFd55St54WO9OtP/N5IdaCbwS/CjeZY=; b=CKAZYlJakHrra9LLF/KZfhnI+b
	f2N7HPSvwelYd4cg7vLSewdYjRS8hsF+3V4IApjVOKkXcsbqJ+kwLzxkxBu7cz0TCF0oWQP+vBjSO
	qjwHyw7+L1n3Hk9qMUjgjH0yRX7XHV/woHDWqfhV8ihhylNIea+mK6LG1sodQ10iqveXFq7pvTl+y
	hQJrneXTt5YfQHIdfuerMcdvdLIjBJFQs2wa2KE79uHtfkAb4Va9xm917en72b79Y1q6vge3POapX
	t/+8LYjeMPNJqTGR452LEvKG8i7zTmTHBCQFGih009FAtNL2whYy9umwLzUdk2m9ZMfMM37/aSREe
	WxhZmhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbLD-0000000CBZG-40Xx;
	Mon, 24 Nov 2025 18:31:11 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbL7-0000000CBYk-3ajA;
	Mon, 24 Nov 2025 18:31:10 +0000
Received: by verein.lst.de (Postfix, from userid 2005)
	id B853068C4E; Mon, 24 Nov 2025 19:30:56 +0100 (CET)
From: Torsten Duwe <duwe@lst.de>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
    Rob Herring <robh@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>,
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: enable SPDIF audio on Rock 5 ITX
Message-Id: <20251124183056.B853068C4E@verein.lst.de>
Date: Mon, 24 Nov 2025 19:30:56 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_103106_039075_0DDE14B8 
X-CRM114-Status: UNSURE (   9.52  )
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

The Rock5 ITX has an S/PDIF (TOSLINK) socket in its I/O-shield, whose
TX signal is wired to GPIO4 C1. Activate SPDIF TX unit 1 and select
the proper pinmux (M2).

Signed-off-by: Torsten Duwe <duwe@lst.de>
---

For Linux, activating spdif_tx1 only creates a "component", see
/sys/kernel/debug/asoc/components. ALSA needs a "simple-audio-card"
pseudo device wrapper along with a "dummy transmitter" (?!) in order
to turn it into a functioning audio output. This is not really
intuitive and IMHO does not belong in a hardware description.
But well, so be it.

	Torsten

---
 rk3588-rock-5-itx.dts |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index bc8140883de4..6780fbb26efb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -147,6 +147,24 @@ sdio_pwrseq: sdio-pwrseq {
 		reset-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_LOW>;
 	};
 
+	spdif_dit: spdif-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	spdif_sound: spdif-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SPDIF";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif_tx1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_dit>;
+		};
+	};
+
 	typec_vin: regulator-typec-vin {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -839,6 +857,11 @@ spi_flash: flash@0 {
 	};
 };
 
+&spdif_tx1 {
+	pinctrl-0 = <&spdif1m2_tx>;
+	status = "okay";
+};
+
 &spi2 {
 	status = "okay";
 	assigned-clocks = <&cru CLK_SPI2>;

