Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776EB606D81D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICzZeWsN;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WEP8wv3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=; b=ICzZeWsNnKGLNG
	0N02yA5fbe+yVu45O4atfoNjTDC7hYj2vIqF3qD72nf9MLPmX38EJaF0YdKK1OEVgkDfA7xF20QQT
	pjQueenoFUF+0GIEWs0pAV2BjiTBv0ulYhVvnHz+8bvzuONaWfJlGJSmXsTasYUAEQYMTazVuX7Ez
	1SPZ3E2szYzqAsz3aqhCGjJ8rzLWYYPKnXEtmeIHZCapuca08wneO8FkCap86dVI1BL7nu5HTHLyd
	+5s2kbppsie1n22yRqwImJYahLIDsTgfInp/dvWTlPTQPav65ti9DYrLJWt5sJqYXF8TzJhQshD7J
	tSvsZzWaGDAfLjvgYeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC98-000000025z3-3Bl3;
	Tue, 03 Nov 2026 10:53:42 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC90-000000025vO-3HpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:53:36 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 8EEEE1FAF9;
	Tue,  3 Nov 2026 11:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703213;
	bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=; h=From:To:Subject;
	b=WEP8wv3lFTmygkOzEkmDHEBLmlgoIuB8rpg9pTv7+LCG4jMd3E0ULkGhcE1YntdjL
	 chSHcvrlHCaTXqDCH8+9sLMwDaHOpX7pyMcniFinvcOEAXMnhkCbD8C443t2EiqWNh
	 dNRijXurmNvW0K2sTKivo6UENcEXQw6Xl17LXCg5gm8o/7yiKA+a1EbuKcllsAePph
	 RiMDPxiIQLLDCYt0zl6UjzsQQtDxkiIJAY/4qF2ienx+PziAhDHOlbxkBqfEF9r7ap
	 5OTiLDPiFkgDPVOHrdOFjb4OE4lnSqAnZk9ZhrOBgbeksBrMQvv2+dJYo3hgK2NjPa
	 wLP29x2mGG+0A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:16 +0100
Message-ID: <20261103105323.2394012-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
References: <20261103105323.2394012-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025334_981434_3D9E8D09 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 07bf53240958..37fa107c6fec 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -41,6 +41,8 @@ reg_dp_3p3v: regulator-dp-3p3v {
 		/* Aquila GPIO_21_DP */
 		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3


