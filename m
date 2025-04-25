Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH5Q/9/Gya6g7S3LOJ0iW2pbkqKWlFOIE72t/4lmn3Y=; b=0myfBRKKjJfVznvUGoKbo325x2
	1r0bAO1KQnSfR+NHqYIAranG6sQKyIYsBnohAJlsYHFq6po0mxUGCaSB8tjrs+3cNXhuDZ4MH4SeI
	Owx6I1D6+Ykd91x0WtGgD/QDgFspdM2NebqByapHys2DrZiyj+7cQODZjNFuG7HSNzhdaeSkWNG2p
	xUprsgu3r3gMCdW9H1CocjE03MLgwuEblJdxo+8l009XxydOXF8edWgxvzOvjUsWkUMtI/kzrbbEs
	Orb/+tpoYluuyjMFpe0/wbGZ2bU89mq5kE0Il9O9vo2K1nhqPJC4e/mPFpjqRIYmLzMhp8FDFpEcD
	yZ4HM5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G7R-0000000GhS7-1T91;
	Fri, 25 Apr 2025 10:17:17 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FKX-0000000GXHL-31Tw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:26:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gH5Q/9/Gya6g7S3LOJ0iW2pbkqKWlFOIE72t/4lmn3Y=;
	b=lTZkGhlOubLAFQnv5HDHfiOwIA2OpqXLEg6CO4Vya9kGFeFRlwExSb2RWSwYm5Eg8XhwMl
	40ebWHvf0C5xx1UO+mf9m3Rz2ts1yZ7xrtn7QJRxWPW/QA0QFQzbkEVctK+/hqI3NJL0Xb
	vfNJMdAbIhcLxg3hfoGB0NV4eQ8VC32TmsNs6lCXpqk+2LpSkraU+0HxeK3+0zJ35u7ZmS
	I9ImvqE94u8EmgSe35zoemOT7i5A4qztXMimy74DrlUCnyXfsnwGcFbHniIeIFLSMtvJqx
	SdboLYb34L/MNtJdNWHS8V3A81f31kgsjxhoUfkqLDRXPK5RIkYliB+kNtZNDA==
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
Subject: [PATCH 4/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
Date: Fri, 25 Apr 2025 10:44:44 +0200
Message-ID: <20250425092601.56549-5-didi.debian@cknow.org>
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_022645_900445_B9A0B26F 
X-CRM114-Status: UNSURE (   9.08  )
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

The Radxa Rock 5B component placement document identifies the SPI Nor
Flash chip as 'U4300' which is described on page 25 of the Schematic
v1.45. There we can see that the VCC connector is connected to the
VCC_3V3_S3 power source.

This fixes the following warning:

  spi-nor spi5.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5d..17f4fd054cd3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -562,6 +562,7 @@ flash@0 {
 		spi-max-frequency = <104000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_3v3_s3>;
 	};
 };
 
-- 
2.49.0


