Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F67F47CA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; b=PuBv1oFq40cGfnXbOkU4XOGq6/
	/+WNUqlXeKHOJB/ksGiv5pMbHATsaPGLy+RQ1E9K11wh3s1VZbIC6G7NYKf//rBxR31mc5E4Rv8Xr
	z2EpfE7yuuwbZFRO3/6HhefwJaA5hXvf6J1u+Jbl39AbTJRs2njYMieoFgLOA2xRLy3sgUHucK5x+
	khwnCG3zqna76QdDDFP2aYM8EeXw/f/luclQdqpCR20kOLSUXlOEXHPMszxuIFpe4Bdbd6N8VLLFN
	vU5WfKo8sZOuuG/hvIfyPjBtWy1yyIaxFiI2Qpc7SRLoNbPFg3DitgbQyvcfErNfOwL/wYOHjUCyl
	7xQ+onvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDcP-00000002Oku-2ktm;
	Thu, 05 Mar 2026 18:40:17 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDcL-00000002Ok6-1awq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:40:16 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772728405;
 b=qRzouoqyUJ7bGrbA6YDQvfnGUJFs1KM2LynXELGGWxnGVrxh5+jPSlJQ1JnQqVaviPEwW3tP
 wkD5+SOcY5LsjEsMD8lpfi7uAavdThnqtBR4RGr1x7LN2fH05wnz2I6VKwUK70WgzsfllkNVcn3
 8MmWpmD6pqAVHNKLvljxwi+eaNJsPuVCywogro/kCa+OMB/kXT7R1J0G8/LmFRK6PDKrpIagkDI
 +OPXlU4MIT0DLARacmQTyCGHJinygjorPAPslAwU7D3SdTbwBT+MBVd8QiPZkaPakUbCYW65Gj9
 HQU5MXv0p4RMnp6r4/u1RTTehn8+sVOxdxCmDms3edcNQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772728405;
 b=QNOWDqycLSV464SgNxXSJ8cIMDNyqx2F+oPGjtUKEPKwu5iEyrIVS2QPa1o8UcJZJemi4omL
 ttLJggMJstnKIWY39KVDL80D7Wd5VRxPUz1s9UtR81MJboC9Kx/lSW3XH5T2XByQgOyNGoVz2d7
 RYAs/ZhnAK8GLGVoivUCUaaRTjHzkU/tMBc5Ux+Yy3nkBRFxIkb1BHDPPdKb6UlFKG4/IiLBUXK
 RgeKSwFRzDgaj1IkUbj55JubDZ6OTLNe4B415sH3VH+2h/fSYPDqC2hbjZWbVw2M6y8BtggurBN
 CS9X2vUquKJRPMnTFXUmcRHtttfBZ9HaVc7MIjNq77DtQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Thu, 05 Mar 2026 17:33:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 88EA3CC0D36;
	Thu,  5 Mar 2026 17:33:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz Support
Date: Thu,  5 Mar 2026 17:33:13 +0100
Message-ID: <20260305163314.2642523-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fRZpj1jQSzWj0k
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: e09355286075a816d83ad3ff6a06a7b0
X-cloud-security: scantime:1.332
DKIM-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772728404; v=1;
 b=dWAej7i6erYA/ZkLYxz+98CZE2xVGv4m5z4Mr1Nh5FcrYWPODroOF4n5t57cwyPOOVlR+jZK
 CgIsdOmY7SDHMcXUu0rk+nPWSBMyomrXLfMpPSxBeMKmeGVdnHz4TrfCtgo0EKTxSyX9JiKNnUJ
 sk/EAYJW8mcCjXUbdi9h9VUqRTuRxy87zWGzj2coErB/IZgNlQfFcWmrpaNslWaIk/AfkQdClKn
 +eD0CY4QCCssafctvQ3MEmybMTUEmJi8ME95Gqsg8m8UBtcHI6h1DmOH2dpjzRP6gho/npqf0Ec
 Nz3Bs7NP/s+sYAymwTtadDmqGe/P3sZjPPRjLlGhEox3Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_104013_682797_050545DD 
X-CRM114-Status: GOOD (  11.10  )
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

Some parallel panels have a pixelclk of 33.30 MHz. Add support for
333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 89ed7749bf47e..fe6ee77ba1485 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
 	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
-- 
2.43.0


