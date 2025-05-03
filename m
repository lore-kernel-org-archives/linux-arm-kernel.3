Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640C0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeQFPClstvwoZtBpTw1enwh36lgdeWvNmapxU6wc1lw=; b=fz/6x2O3gyxaiV/rploPNVU0v/
	LEIaIkK3CT9uAsOunzlsRGxVL62lIaMq2WEz0HFQmYeVIDNe9d4W202f3bKMN0y6+MX9iTxU9jV2M
	7bVgczMQTWZXszRItb8Pa3vgdrUhYPpuW3qPQlgn2hfjWSkp1YIPG0678pJsvZAaVB6teFHXiHfQ6
	bhaVl2GV8A+8Po6YpdHPuZwruMxe8P1bM/zXoMNr59PPDr+A4QjdkespdIqrt2nXO7odUqGi41RjK
	o5LP+WliSq6dC+u8ZXeMQHEW1e14F2wKrcfswZBbkXdbF8lll1uOB2m+ZM90qR2BTHxD7Mzs/Jirj
	w8PHZlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEub-000000042sO-06JT;
	Sat, 03 May 2025 15:36:21 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEoR-000000042Ry-1K5Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 15:30:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746286197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeQFPClstvwoZtBpTw1enwh36lgdeWvNmapxU6wc1lw=;
	b=YMBUxxQ95w+z72G58zuI1TiGCa9i+RhhlCB2BXyk36bSKa8KTeTajosafbGi9LUkIT5oRN
	e0+M0sSsznrIemJAje6+9L9tW70L8ByuNmv7hdSp2Jt48RofuhM+CSv83AyIw0jnUfBEOP
	pXO4/34WbdOePbpAQpzWIyWKeo6cCoBiIBh/fgYGNbCjQti73Xiy8Qi4LeJ8D5DvSf+mpO
	Zk7O5wuf+xVJHZkDscGRZsW/P6f5CGaxzlKvtN2Xrs1YW+zNtikKT4Y9qkwY06oO6iIieK
	pY05Y9TXWIb3TB32Cgrc6auw9JpcdCxNoPlBqp+p5IA8+26vdyrq2mUuhkBidw==
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
Subject: [PATCH 2/2] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
Date: Sat,  3 May 2025 17:22:19 +0200
Message-ID: <20250503152917.138648-3-didi.debian@cknow.org>
In-Reply-To: <20250503152917.138648-1-didi.debian@cknow.org>
References: <20250503152917.138648-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_082959_500730_E67EC41E 
X-CRM114-Status: GOOD (  10.01  )
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

The Quartz64 Model B has a Winbound 25Q64DWZPIG SPI flash chip,
identified as 'U13' on the component placement schematic.
In the Quartz 64 Model-B Schematic from 20220124 on page 17, we can see
that the VCC connector is connected to VCCIO_FLASH and page 4 shows that
that in turn is connected to the VCCIO2 domain.
That domain uses vcc_1v8 as its power source.

This fixes the following warning:

  spi-nor spi4.0: supply vcc not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
index 5707321a1144..f8cf03380636 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
@@ -648,6 +648,7 @@ flash@0 {
 		spi-max-frequency = <24000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8>;
 	};
 };
 
-- 
2.49.0


