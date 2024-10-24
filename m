Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED0CE8E74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaWYCbKne0jIgmMCGe5IUHjDjae7PV5dOPwFEy5t4e8=; b=QEkQ3g2xxRdX+nlVEZ+s29eZus
	9hqRV75RJNn1z/w6IHn1d+rQhp7CXXxtxLPuCNmsxPOe2lusKtGs8k2IK8dhZliQHctsztglpRVKU
	wwtqh6fkqCBaJzmUIcRrvob5TYb8XS95aUF8C/QktaygCvicmfA8XUa6/RQb4fHrGa9e2utSdAwFR
	BKdRoYB4XImtjF3iw10XjZv6992U9RcbvlPxWk9kH9hADy66N0Z9Uu4IXZzKUEgHGyHvGHQ5Op0Y/
	dmttXJyPS9mnYpQMNV8Ul9WvJ0n1Uk3CRRJa/c8lCrNBmhl75D2AnFPQMGsUeWsrW/WR1PE3tx2zb
	mq9317MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xez-00000000SPJ-1uaI;
	Thu, 24 Oct 2024 13:13:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xYL-00000000RBB-20mX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:07:02 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9F08C1F9BA;
	Thu, 24 Oct 2024 15:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729775220;
	bh=OaWYCbKne0jIgmMCGe5IUHjDjae7PV5dOPwFEy5t4e8=; h=From:To:Subject;
	b=geEXMPWHAE7ALD9fcu+awGzVuukhe+61VmA8Fn/O/hZZEfrNyK6HRkVwg9sP7bHxz
	 woLrzvxLyL1R9nVlcF1EjLb5VU71l5OcW4pZfZg9irJJaTCBR9ut3XRaUPOo8AYG5+
	 NY1NrfZwkTu7MGRg+R9ZUxXKSwSKT5FvIiKudUfOpxyLHO4VfztblIT5pNOTIkF8kr
	 nIkscfqJLUcZVDLoiVy+WTkmF1o/ru7WN/TXWxNXiF6dV9pWYE5YrGy6bVMFZkjGBF
	 Dx2CvbTkwi3ZaFT1iMSz53LGmOf3R9QgATPomoBfr+wgburCOgLBuka+lSst8vkHt4
	 w+ymp5oZKEsxg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay
Date: Thu, 24 Oct 2024 15:06:51 +0200
Message-Id: <20241024130651.49718-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024130651.49718-1-francesco@dolcini.it>
References: <20241024130651.49718-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_060701_710411_B4349190 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The power switch used to power the SD card interface might have
more than 2ms turn-on time, increase the startup delay to 20ms to
prevent failures.

Fixes: a39ed23bdf6e ("arm64: dts: freescale: add initial support for verdin imx8m plus")
Cc: <stable@vger.kernel.org>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index e9518b7c7aa8..b8c24fe228fa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -175,7 +175,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "+V3.3_SD";
-		startup-delay-us = <2000>;
+		startup-delay-us = <20000>;
 	};
 
 	reserved-memory {
-- 
2.39.5


