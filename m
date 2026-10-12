Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3B6CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=; b=zST6rUWQKe8EKfq7Sw69LGMBaz
	5CjF48HS1YlG0HyH6IcIjM39oihYCRcpD3Yv7ZmBzIGF1Tu6EMkG8djoLSJ4//3Gows5VR3sOXY7b
	gfhM3iL0CcF/r5x+xqW0XND6q2rXOhkp0rBxOM4P5ZJwIIxXpI9mDxZ3+C5y/eB3wytJ62+gzytRj
	YHHi7+WxhpvKsIwnIuLRD9UmueDURb4z1TbPNFPVKbQgbTDQGrZqhgf8AUZ+jUegQWl4vVbesEuet
	Yo/JUDNJ1Dj2ADe/lBMUKJSQwY6zqYkE28HKIGNKgoE8Fi9z+xD9mf3DenMsA9ugBEnO1IXYZSBUa
	SPNnR0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA7c-00000009oGE-1DqB;
	Mon, 12 Oct 2026 07:06:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA7C-00000009nux-1LpG;
	Mon, 12 Oct 2026 07:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98C9860DAE;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66175C2BD00;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788789;
	bh=N7Lv5ZvVnfmc8YhjtdO0ynxxHEUuhEVfylq50/tI/yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NQ0GDRb3dMzsKgMb3Ac5n9ySDqL2rVGgchPPPZM/lu4Zp5yQZbGRhZThEaPIa2Gy1
	 MjSJBFykn+unJ401J3IH9+10/pp5ji5T3PZaaPgTxIkq7RM24jkzP0miiX7MEBj1aj
	 /adzKTHM6QX9xlNABC0Zn9G05ItcUoIw1KdwDMk1DdpvvCzZEgB5o0JqRBaK/BS3DS
	 EOjsP/4QM78pvP5bz0/+BTCpRx4+XVJBe+HnCcSiljtbeS0Msaw7m8+k8T60jmgHOS
	 3oj88UK+kVrCbtapzVfnpdGjk+9RCjzqz+FbCyMISa5yL4mMIjjDdbYpjPyWaLbzOV
	 7HLbZwPik3iXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A81CA9ED5;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 15:06:14 +0800
Subject: [PATCH v11 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-s4-vdec-upstream-v11-5-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788786; l=1805;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=6mvln4gF/Xr6GIzNj9H9+pGxV5CsOeJcJGZ1vZicQxY=;
 b=RPe1qXUCp2D+o8pyer+ApSK9MQqEC1FqOW22rHnY2xMZ+EQYb1fif2xOMVZcGVDuKb6bfxgYT
 5sN0IEjZat0CT9yd9rXAOGb7UqvA1oMZJAGBb+GJwbijIp46L78L5XJ
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..7a1dcb3951c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hvdec";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



