Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6DDE7E0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XauIuDFellsiYlY7XWlolM5IHJifLVytCti9detJRC8=; b=ncfAqssEO5332u+Vae7NHHdvOg
	NtGgjytO5p5cdKGhfhUAXawEYl7ELDjHvT+dxR6efSssg1If5FKl9ylNBoGKrroCUVaBiDvw0sSb8
	QXCECuDscj6rsBNSwORMC/Ns4AdnJ9QUFsGg5FTKnTp+SriHmnnnQDFfp590wd8jj5QblTsuMVUec
	5+eFDYsAy1Ejqb7bZq40TQlIt701e8R4Y7fDl3THI9rhn9a+qxsGvTyG/6T5ZMiOT8kM495mD3yUJ
	0g87YuPKOYDZ1H+ciefinOCQphGDXSoECz6zGRTQj0McQ2JwUioTjEQ94gZL0zw68SYZmd8kxcJFw
	9FI7ZNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUjq-0000000FkEw-1l1w;
	Mon, 09 Feb 2026 17:07:54 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUjn-0000000FkDt-1VeN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 17:07:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26B5B10DE1B;
	Mon,  9 Feb 2026 18:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1770656863; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XauIuDFellsiYlY7XWlolM5IHJifLVytCti9detJRC8=;
	b=Z+6wmsaX4cctLjCUWcBKqic934tnDNnma6VM6I7BCvMR/ajpSkh3mgsMBucpMP0nF9Gqqh
	0p4ldLhPXtkCVzinvoCsoG1b8F108QEJ/hWqRfGScd0qd1N2FF7dGLjREg3/OUbz2RXsLP
	NAbhj+wxT2bvTXGJkdEgleJryvt09dhGyNfaB6+6sjqeaBynNMdPimS5px5Xgzk5MAt5px
	jw1QF3EjavUyo7UzO8h+YRQNidYBgJjqjUVcwvFc6TQBWv5X0BmX3beHXJkH0yLNwXsid2
	H0ZcsW5ayThcsbj/ege58ZMv9bozsVkQWUWy8CW8gfFduxi+4Nzko8HZoEZzNg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL DHCOR
Date: Mon,  9 Feb 2026 18:07:04 +0100
Message-ID: <20260209170739.22379-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_090751_984736_96173B65 
X-CRM114-Status: GOOD (  13.45  )
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

The muRata 1DX WiFi/BT chip is mounted on the DHCOM i.MX6ULL. This chip
has been discontinued and replaced by the muRata 1YN chip. The new chip
is a drop-in replacement of the old chip. To support both chips for the
i.MX6ULL DHCOR, drop the more specific compatible string and let the
driver auto-detect the chip type. Currently, there are no known quirks
that would apply only to one or the other chip.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
index 75486e1b0c15f..a0adcd3fe1229 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
@@ -201,7 +201,7 @@ &uart2 {
 	 * the speed can be increased accordingly.
 	 */
 	bluetooth: bluetooth {
-		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
+		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
 		max-speed = <3000000>;
 		vbat-supply = <&vcc_3v3>;
 		vddio-supply = <&vcc_3v3>;
@@ -222,7 +222,7 @@ &usdhc1 {
 	status = "okay";
 
 	brcmf: wifi@1 {
-		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
+		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
 		reg = <1>;
 	};
 };
-- 
2.51.0


