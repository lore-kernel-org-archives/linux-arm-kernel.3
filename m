Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B9C369BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UxeCCZVYevtkCT7thlYmN0LpZT3ruwqqeJ/LiyIL2bw=; b=T6MrlkCeoKJLYiWUmsT+6U/Gts
	YvZ+GenZKRCaigi+j84SNMFa4hbD4jKPAyh5hEJpQlvyKVAosehW+jfu5gO4hEDGY6LrDqQEm5dCU
	o0c6VQfF1zLitS9Q2zwgMbkluWtFJdszUgxHb4DKl0GQhbM6QL8hjbwfYEyPawByg6oEzdr5kRi4l
	396amJECM5HKBk7m7Pllvmq9j/I5MYCjvWVMF6Di9uZlRA6xWBWYGf5URTSe+QpdKS9o3s2lwgIux
	3I5Namk5rMujIPjDf4AxWgvKbAOrfuM5ctdNIPLMoGPYorv5h83+FRSvwJS54tLVtmoH2Ra+ukxOX
	62GAh2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PMz-00000003JUz-2wp4;
	Mon, 14 Apr 2025 19:21:25 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Oh3-000000038WK-2Tig;
	Mon, 14 Apr 2025 18:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744655871; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PMNc3gniZ/Pfki5mPuG8RzRFAmY7eATJN3KXe1HuhW6GpMclCzn8ARfnmWoMu80vwAN7GgaGOhiTVW0hz3sdxQRa5exakFFV3N9Ml3YMddjfjCauV1htP64kJfxD3TCSenMXNba1j0MSpgWLq5r+AQsn+mnOVLKdIEnoKyqhqd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744655871; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UxeCCZVYevtkCT7thlYmN0LpZT3ruwqqeJ/LiyIL2bw=; 
	b=BE6RPZxgkZZcnJhTcbdktx8LcMXP9uk4zGq+0E2a9mrs6yJsu0RvPlF2VARNhuNL16o7VIqPT0Oa4ZZkFKv4sqyn4f1vPesZU4yaa+IAd7mBIVSaghX6RnCR55Whk+GONBE3jFynIzEROf+PicYNxdq9aYBPOkRV/VJrlUL8/zE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744655871;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=UxeCCZVYevtkCT7thlYmN0LpZT3ruwqqeJ/LiyIL2bw=;
	b=jdaE5j00+cdNEVv65UQnUCk5r3jjPfEfaUNlCYvpyNBETlXxFvWRgvVKdNxlEO0r
	ByOK1aqtlNCeYW8I820ntemBCpT/p7e1Khs59ZBW19C1D/Ogfuilb3mTRp3x7Ibm2vM
	iT+ZHUDXZPDdpJX+kmeXtWu1pbL4nHQ2TulLXzoU=
Received: by mx.zohomail.com with SMTPS id 1744655869457172.63001317682392;
	Mon, 14 Apr 2025 11:37:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 14 Apr 2025 20:37:38 +0200
Subject: [PATCH] arm64: dts: rockchip: enable pcie on Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-rk3576-sige5-pcie-v1-1-0e950a96f392@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPFV/WcC/zWOwQqDMBBEf0Vy7gY3TRSklP5H8aDJqotYbWKlR
 fz3pkqPb2DezCoCeaYgimQVnhYOPD4i4CkRtqseLQG7yEKlyqQaNfj+bPIMArdkYLJMYEytnU3
 RucaJ2Js8NfzenffyYE/PV1TPRyjqKhDYcRh4LpIlk2jAW/XrDhRCtY8WyeW/idogphJR5QYQe
 lrIy088d/Oj7cF2PAUZdVdRbtsXyK4zK9IAAAA=
X-Change-ID: 20250414-rk3576-sige5-pcie-55b4dc01ddfd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113805_714018_D7ACDD13 
X-CRM114-Status: UNSURE (   9.68  )
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

The ArmSoM Sige5 board exposes PCIe controller 0 on its M.2 slot on the
bottom of the board. Enable the necessary nodes for it, and also add the
correct pins for both the power enable GPIO and the PCIe reset GPIO.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
This depends on Kever's PCIe series[1], which is included as part of the
b4 dependencies.

[1]: https://lore.kernel.org/linux-rockchip/20250414145110.11275-1-kever.yang@rock-chips.com/
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 828bde7fab68dc6bcbd13d75c8a72540b3666071..964ee351d3b63fcb4ede70f4b6c06541715cfe19 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -117,6 +117,8 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
 
 	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_pwr_en>;
 		regulator-name = "vcc_3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -177,6 +179,10 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 	};
 };
 
+&combphy0_ps {
+	status = "okay";
+};
+
 &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
@@ -634,6 +640,14 @@ rgmii_phy1: phy@1 {
 	};
 };
 
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset>;
+	reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3_pcie>;
+	status = "okay";
+};
+
 &pinctrl {
 	headphone {
 		hp_det: hp-det {
@@ -655,6 +669,15 @@ led_rgb_g: led-green-en {
 			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	pcie {
+		pcie_pwr_en: pcie-pwr-en {
+			rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		pcie_reset: pcie-reset {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
 };
 
 &sdhci {

---
base-commit: 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
change-id: 20250414-rk3576-sige5-pcie-55b4dc01ddfd
prerequisite-message-id: <20250414145110.11275-1-kever.yang@rock-chips.com>
prerequisite-patch-id: deb68e2b51dbf1fb35a16464d2be570ed4418f8b
prerequisite-patch-id: 0a48a30fa57c8c11524167f4b753f58f918bb26d

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


