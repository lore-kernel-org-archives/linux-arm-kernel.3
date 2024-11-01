Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6D4E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7hrBTfnQcDUQmXrYY5tDlp6Hn+TA/hKcr4ciShqvpE=; b=esO+7NdF6iVKbOQlsELcAoRO8K
	iQZtxQSvnb5cOqbV98vsRBQczcX+t1fZzLIVWTWBB2cq96U5iQBBasLjL5Jc366saPs+Bs+8En7XS
	bZWJigxIGrFeMpSv9/5jZBNKSWOV0u+IcITrMOlFrN0MXvKxRGrDd2xbUezldN0nWV3VKWiIIzuqH
	38d0DB6t41ozc/BV57+77mGkrOS44bbgqXoXqHSVZAp528GkMn1pfs2A+osjSMZnyWVyRnzpHQhOw
	lztwmfIjqVQY2aQ3KdF6wmy1hiAWwIXSKLkKAU99Ycf7VB+M2SGmxZJsLYIaXbK39GSFXusd/u78R
	YiWcNggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdn-00000007Vup-1ZLL;
	Fri, 01 Nov 2024 15:32:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tSJ-00000007UIN-0deQ;
	Fri, 01 Nov 2024 15:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730474453;
	bh=imjx57/ZNDvazS8dVSDsfcbujxW4jgOS5y+0Xj27b1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DiBWY3Br+WMtuY8iHqw8X2uxfL+66oWWU8GtKeAy2gbK9E7WgzgFDyCdlVPqXRahh
	 wsLR1PzWqIEJCnRNsOLYWBKjy+/Nzvl6rIfEsqnhQO0wJ0lq1lgE6Z0HCouukObrzx
	 RsqEADhTxwBQSiCVgtm7XOT3ylgGKepVoPj3r+kfbRoUJEGzAFtUIU/JtveSJly0NE
	 BVL6+a3pClOQ5YD1593UGMxHnNlBj4cGaG56cOFf09Fi97SRJo8MQpJ7g1e3RpDGbB
	 z1DMWorJ3JFuv0X0oPbsoAGMne1/kKUoijmm6nHL8s5XG7S1H7QrbqXZ5kncWFz6eU
	 JkjolR5twN8mA==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06B0D17E0F83;
	Fri,  1 Nov 2024 16:20:50 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:25 -0400
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet MAC WOL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-3-75b81808717a@collabora.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082055_358872_DAE26D88 
X-CRM114-Status: UNSURE (   9.57  )
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

Add the mediatek,mac-wol-noninverted property to the ethernet node to
make the driver parse the mediatek,mac-wol property as originally
intended: enabling the MAC WOL. This gets WOL working on the Genio 700
EVK board.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 13f2e0e3fa8ab6679f843693230b9661d323a705..83c10517458d1df2f14e41baeff628f46ded1618 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -898,6 +898,7 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol-noninverted;
 	mediatek,mac-wol;
 	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;
 	snps,reset-delays-us = <0 10000 10000>;

-- 
2.47.0


