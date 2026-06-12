Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F0DCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KlkjIw4bcij3LG7og0awnfmQnaK8D+NfJs+ZdxoZ9/E=; b=tyd5A6CqdDHusR4k3RRawHpCag
	pBeXIRSxPQtP8H95NM1/k3WJ74iKGZJkOOkpRQYYMSqCYexv6ZVdvvQrwlYr1XVYT3ECxx+4LCn+0
	4C/hc0F/9kVTOzAZkQIk3h4VvFPPjBcj2j+jxwIxOqAPhEsEllwrnYvdAQ0h358K4kqayYH8HFPAv
	jqnkEkUMiuFG5zqEaP4p9ZElnKDNu8RLzuj10jjQEvvhLpLLbaUSMYmLDNgY5lLqlH+z1jQfXVibo
	J+uXD4x1HUiwpXBCgGYsQOl0WaoBc1isLciDvwmBrkysXaeiO53faaK11RgB97dMwJo5GIyaYvwNj
	7DLHX1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY52u-0000000BIrq-1t1a;
	Fri, 12 Jun 2026 16:47:52 +0000
Received: from smtp-8faf.mail.infomaniak.ch ([83.166.143.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY52q-0000000BIqy-3gXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:47:51 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gcQRh0QGvzRHq;
	Fri, 12 Jun 2026 18:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1781282863;
	bh=KlkjIw4bcij3LG7og0awnfmQnaK8D+NfJs+ZdxoZ9/E=;
	h=From:Date:Subject:To:Cc:From;
	b=XYXTpnAdoYDQ4BIdWgGbSu88PkILVJiWZD2BaXXkBHB9i0y5jLAPt3r8FpvawhVAR
	 habuO6wlTnX4v1o/o6mHsYajQTF9Qlh+MyJZZEeNAx0shUtMdxXtf0KK9AOCoz4yOi
	 au0aUm+R5dgv/mEOsu/6GzHKfskPOHHMcOnyJiAYGPzy6neKK+Nv/B5wntxWuLVHgl
	 gRrn9yE8fWMogFwYUNeos6JwG+resk74nav2SIXlSpJG/oYL0o0MUNaXcuRTaG89Cf
	 BWqN7FMPrmDGJ101s8YvY1QvXuQsFYA91MOKfpCmYgFfXe0o4h5P05Wza6GlTXnlmg
	 elmr1beE+6X6A==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gcQRf5dcSzrnk;
	Fri, 12 Jun 2026 18:47:42 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 12 Jun 2026 18:47:34 +0200
Subject: [PATCH] arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1wQhPRq4iLJI7tFH9CYkuLe
 PdGu/wW7+2QOAonaIsdIr8lybpkUFmAf9jlzihDNqhKmcqQwhBIk0GeZ49hnWyU7Yva1qPTt8E
 1VENOQ+RRPte26/9OL/dkv50vOI4fc4OQ4XgAAAA=
X-Change-ID: 20260612-pp1516-emmc-polarity-5a7fb54db917
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_094749_372712_A21B8F10 
X-CRM114-Status: GOOD (  11.17  )
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

According to the Jedec 5.1 specification, the device is held in reset
when RST_n is low, therefore the polarity of the line must be that, as
specified in the Device Tree binding (mmc/mmc-pwrseq-emmc.yaml).

Due to the wrong polarity, eMMC devices with RST_n_FUNCTION[162]
bitfield [1:0] set to 0x1 (the default is 0x0) will be held in reset
forever.

Cc: stable@vger.kernel.org
Fixes: 56198acdbf0d ("arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
PP-1516 is affected by the same issue that Cobra has and for which a
patch[1] has already been sent.

[1] https://lore.kernel.org/linux-rockchip/20260609081728.30616-2-jakobunt@gmail.com/
---
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 192791993f059..02200de695d31 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -33,7 +33,7 @@ emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		pinctrl-0 = <&emmc_reset>;
 		pinctrl-names = "default";
-		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
 	};
 
 	gpio-leds {

---
base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
change-id: 20260612-pp1516-emmc-polarity-5a7fb54db917

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


