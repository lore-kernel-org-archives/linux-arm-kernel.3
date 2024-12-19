Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:Subject:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2rIL6j0G4T+ZbO6H+C8W2L6bXEl0BBK7rHDbOWWg2E=; b=jQu5+ycbmL/iyiUmcdQLhVr4dE
	Gr6cOqMSmSr5P9tEiZ9PDj74dcuFeYYhdhkAyom0d4lXAIsHTyySCQypqLw/MKANAQYUSE0RhEOqe
	xnx/05uMx7HP0+kK2Rorm8R4NUj7cIAzaU36RUHhmLk0joLAxP4xcr9QWvyGXQlEZhCsrrcIrDU1p
	IsDf4Sc0CtAgdpHg9F+SN0BPeTYSP/JrWqoGDESW15PkQGP83f5zdmnk3NAdxEvsjLQvUQPfPxuyx
	2ggM8Pa6CMo3qop/XDb0iTz2a8i5NT4klj8nPYVWqje9cb4WuYzf2OTj/YXrn5z9IEFrz2mzeJWdl
	zAYhCDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEDp-00000001b3H-0c5E;
	Thu, 19 Dec 2024 10:57:37 +0000
Received: from mail.steuer-voss.de ([85.183.69.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEBd-00000001ael-3bl1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:55:23 +0000
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
	id 889CB11FE; Thu, 19 Dec 2024 11:54:47 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
Date: Thur, 19 Dec 2024 11:54:11 +0100
Subject: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <20241219105447.889CB11FE@mail.steuer-voss.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025522_051885_135337E6 
X-CRM114-Status: UNSURE (   9.55  )
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

clk_imx8mp_audiomix_reset_controller_register() in the
"if !CONFIG_RESET_CONTROLLER" branch had the first
argument missing. It is an empty function for this branch
so it wasn't immediately apparent.

Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
Cc: <stable@vger.kernel.org> # 6.12.x
Signed-off-by: Nikolaus Voss <nv@vosn.de>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b2cb157703c57..c409fc7e06186 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -278,7 +278,8 @@ static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
+							 struct clk_imx8mp_audiomix_priv *priv)
 {
 	return 0;
 }
-- 
2.43.0


