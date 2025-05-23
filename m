Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8396C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PhEer1W319B45zH5Z8xBa4yAycmAQoYmyBs9mjgK+A=; b=AvF3O0+n4/ppgbRlx+bS+ffHPY
	tALWP8wcQK301GP82Z5s8cf5g2k9t9bYOvdh6PK3Asy/N89NR+kny0VesSXdPIpYOLD/IHGtU1pTZ
	SK10+i2qEKN87p760fqdX7if4tym9z2Nkp0FIuxsXuSTDBpmm7RglI1V327TXTnYPssazVjZGYe5Y
	OwqLuBKeUPbYp1UjNCkFB/v/wtucFtGwjhWEv4M9m+aDqS5VMl68tGI8YSDDd/JkOHatn0y0uSlQ5
	YyevXht2tyLJf5JMuZI3sUb2Qr0sIy1ynztK9ILHEBqid2ZBacjaoZFVplOic//ncMaFWz7BzeuqY
	BFHlnGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWTH-00000004aqL-25Hw;
	Fri, 23 May 2025 17:46:15 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWKp-00000004Zbu-3dTp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:37:33 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uIWKn-0076rJ-UP;
	Fri, 23 May 2025 17:37:30 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stable@vger.kernel.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 3/4] arm64: dts: imx8mp-venice-gw73xx: fix TPM SPI frequency
Date: Fri, 23 May 2025 10:37:22 -0700
Message-Id: <20250523173723.4167474-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523173723.4167474-1-tharvey@gateworks.com>
References: <20250523173723.4167474-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_103731_906522_3DA584FE 
X-CRM114-Status: GOOD (  11.32  )
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

The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
depends on the pins the interface is muxed behind with ECSPI2
muxed behind ECSPI2 supporting up to 25MHz.

Adjust the spi-max-frequency based on these findings.

[1] https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC

Fixes: 2b3ab9d81ab4 ("arm64: dts: imx8mp-venice-gw73xx: add TPM device")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index e2b5e7ac3e46..5eb114d2360a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -122,7 +122,7 @@ &ecspi2 {
 	tpm@1 {
 		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
 		reg = <0x1>;
-		spi-max-frequency = <36000000>;
+		spi-max-frequency = <25000000>;
 	};
 };
 
-- 
2.25.1


