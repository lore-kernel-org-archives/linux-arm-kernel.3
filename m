Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3682FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bSXucn13BuTbBFI2rxgwmfC5tI9ba6wouD2E8Unato=; b=sRMzMn/oACfQczkwbdg5LQmJG2
	pJXwboHfo8hXHjW7yeK0uxh6TVwyj/i2iao6qLc399goMOovf0azLE6IWu0D73ZwHEDqJu1DOnWCH
	rKK6gJrp+hTUqZOHPJ//+pWlyPPd4ILRPCsFyc8gR6brSLSQOlNRbJJF+61LRimwftoWZz6rZIAwP
	Z6HDzqIv0obGkYtbEQf/wecLUrdl/QWfWoWDQf9ptiDEdqVD0ZN1afkDnumoYP1iEB8xNsAYSvWh6
	Z/Krpx2Y7PonQbvgztI6Wp5nizFJRbYtq5uoBEbKU/MAxcmUM45MYAwWzz36wv5JfIBLSNJ06pjhw
	LoioYmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HbE-0000000H1Sz-12Hn;
	Fri, 25 Apr 2025 11:52:08 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FKO-0000000GXEQ-0YXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:26:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bSXucn13BuTbBFI2rxgwmfC5tI9ba6wouD2E8Unato=;
	b=0NcJ0k0MuwVSuC80hcQxfFpuLYW+0jrN04RSTRyFnETMXVDyBMHLBGM2rqkt+OmKUhoy6N
	ucIj6hbyVQhBQ6H4mrEbYyNI4H5HmEhpH5sImlQSLm7NQKsx1yIafmIi7Y6JQIL8T1bFvA
	DQsmfue+gHlGgraoUWpkQPY5riPSvTmjcIE2NyWKfWo0oqZC908qpm+Qkr5QtcaQlgGR3t
	on91vONMg6Lls8pNbmCHZy4yrj/7tFPZsrJCNPnfM/R4HD0npO7CWU3qRt/ptFpT9FHYlB
	CBg/B+bf04egCEntz++wxanaVegNzjOoLl2p8iiy9KkCoJkjaRs5OjL/ulH78Q==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 2/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
Date: Fri, 25 Apr 2025 10:44:42 +0200
Message-ID: <20250425092601.56549-3-didi.debian@cknow.org>
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_022636_308763_CAF4F160 
X-CRM114-Status: UNSURE (   8.91  )
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

As described on page 16 of the RockPro64 schematics for both v2.0 and
v2.1, the SPI Flash's VCC connector is connected to the VCC_3V0 power
source.

This fixes the following warning:

  spi-nor spi1.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 51c6aa26d828..a7e4adf87e7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -850,6 +850,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
+		vcc-supply = <&vcc_3v0>;
 	};
 };
 
-- 
2.49.0


