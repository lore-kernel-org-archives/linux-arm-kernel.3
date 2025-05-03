Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B362FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mhu99ySLYaiKPPq+v39y472i2/ykn+7Aa2t0YVWjSFU=; b=fln+ptBdpwVsET3hWjquZWRbtO
	Lr+HT9hJYi9B4DwriRz5MqLQtt2mCRKnUm3roVoCKUHwgwB7EaPBqvHhENNqKOf3p4xnJXNye9Wlx
	NsLdG02DosTj9eEwwaL34P6wuR0gh9htufopo+wxQIBpZr6lw00E1MB3nWsKtSUyn4mIfdSEnC8ul
	OiGQiub2Tvd8u4kFdWtlEPLJb7bHQT2liVs0BOT2taV4h2064Vx98ql13/MnOxA6zbBpAh3zbNnx+
	nG17BE/8WqjZNcauULBPy4X7kiMVTF+5s1Uc6/Uc6Yt/Ngqjn60LdujTAQIu+hjyNrrljx0b403U2
	EX05N/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEqm-000000042gh-3QKu;
	Sat, 03 May 2025 15:32:24 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEoI-000000042Q4-3nhM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 15:29:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746286188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mhu99ySLYaiKPPq+v39y472i2/ykn+7Aa2t0YVWjSFU=;
	b=ExritJkc/ZH/pgOIYSIXHlXiTjfAwntkACKCM23oZb8qrIVmoMuLu56qHDAycV4MfE//Uk
	N5Qk+hcK3ED9GfwZlqKuUHmIpOx5IyoQreumdTYO3ecJuPL7FTGzAFCLvX1HDwawUH/8G5
	+QWTo2NxN/fd9CEhq08FYKZ19oI5G1sB0VZ8cuGf6GhKhsTTV1dPqQ+XlwTMH/oc5KozKs
	NXrSdvwfjUILGruRYDzZYZN4+EpiOCtIxP8t30Y0Ps2n6kXONWJ5Tog0TEDR/HGnHLE2Wf
	Q7agf8WIjKfG5UeBIhZJLEqExD9AzyOpqy7PelziQRTLl0whjjMsaHLkxEeiFQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
Date: Sat,  3 May 2025 17:22:18 +0200
Message-ID: <20250503152917.138648-2-didi.debian@cknow.org>
In-Reply-To: <20250503152917.138648-1-didi.debian@cknow.org>
References: <20250503152917.138648-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_082951_085193_8C1A09BD 
X-CRM114-Status: UNSURE (   9.50  )
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

According to paragraph "7.16. Power" of the RTL8211F-CG datasheet, gmac0
needs to have a 3.3V power supply.
On page 22 of the NanoPi R5S version 2204, that is identified as
VCC_GEPHY_3V3 which is connected to the VCC_3V3 power source.

This fixes the following warning:

  rk_gmac-dwmac fe2a0000.ethernet: supply phy not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index e50f1585244a..805cb23493e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -61,6 +61,7 @@ &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
 	phy-mode = "rgmii";
+	phy-supply = <&vcc_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
 		     &gmac0_tx_bus2
-- 
2.49.0


