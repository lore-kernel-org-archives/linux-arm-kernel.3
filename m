Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA62C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 22:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qxm+NCuomLh4TtIVgaTi29L9RHe37Uqhg7YmepFi9rI=; b=bZLH50GisXy9YWJ9s+THqwnFeT
	CEQ81AlWuJiLClZkxnlHmg+fS3tZcZJI4Vsjb65obQkpc99IZMaxI396F5EXVvt9NKs8BSTpZgyVk
	wckuNDf+JnL+525eM1Gj2sHAI7UWBp6dR73uXTKEHhiZckJ/8R13vKcVBmbFuoE+NaOCZHMnZ/rdf
	QlLQggcLCBvg4e5sZveOAUmhZhlVEj9aOCk7GAVrbKHFJ8X9c4RQz6qY6JIYedZ55aLpk7kk6tyEF
	fKkx2PUFTbWHkRUgLIXIo477basHVLlbvNhThjSlawOMzdUQi9lmb7hRQD1I5Q6syPYN8aCfqIRkf
	Ro9t8wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMx4H-0000000ELnU-3u00;
	Wed, 04 Jun 2025 22:58:45 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMx2B-0000000ELXe-20WD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 22:56:36 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uMx28-007Xnu-DG;
	Wed, 04 Jun 2025 22:56:32 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
Date: Wed,  4 Jun 2025 15:56:27 -0700
Message-Id: <20250604225630.1430502-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_155635_516176_39EC1B90 
X-CRM114-Status: GOOD (  11.63  )
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

Fixes: 1a8f6ff6a291 ("arm64: dts: imx8mp-venice-gw71xx: add TPM device")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2: add cc to stable
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 2f740d74707b..4bf818873fe3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -70,7 +70,7 @@ &ecspi2 {
 	tpm@1 {
 		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
 		reg = <0x1>;
-		spi-max-frequency = <36000000>;
+		spi-max-frequency = <25000000>;
 	};
 };
 
-- 
2.25.1


