Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D93D3EE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eHlZeP2l22y+3oS6OgQo/4EpWW7DL9eFw1xliUsKTHQ=; b=BawwO7qAGSeR2n4pDGL7j3ylT9
	b/KXzW/R4cZwCCzpqD10/ZdSOgOoVkF0vh2naxJfBYmlYL+6wjY9G803W+fqYVCmOtRQHyKhPMhxv
	xC+yNk9muxjZ6ayUKDv8zWi0YM6oJWlHViEjfzBLUuEm8ATY0ygIIkwJmlKDjmk5j9+PVy2mHu/Yn
	pMawQQgHZYuQXXFvMs/CjDElADY+VoAiLoQtu4vSZa5D/36DRVytmPRxO+kV1PJ4hNnv2xINz4Q6J
	ThWo2j9Wlp4HZUjGDCMZB+odOuowLV02Uv5GjcSf6jypTQh76f71FrBiNAMaFpcwvCczMR5Co3duy
	/G8nKToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuP8-000000076hJ-0dgF;
	Thu, 22 Jan 2026 13:07:18 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuP5-000000076fk-3SkJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:07:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F7A6100151;
	Thu, 22 Jan 2026 14:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769087226; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eHlZeP2l22y+3oS6OgQo/4EpWW7DL9eFw1xliUsKTHQ=;
	b=T660OUd8MYBP9SbKpg0SF1r6d2nxtwv3Lqb6/LpTHE6x2LB61qTAPyKIEUQWDjqnfdsjQz
	3eDNdK224SvcheR4taJiPgNsdYiu29XTIzKwmwU7Cl4LvfdvU1/FIo6GGfCg3tV/+dLX6i
	S0SEdjk1J9VzKrDAKMHKEppvtflDbaiDBchiqs2RSiwM67tSBKIUEM8AjLGE9I/kYqGFXe
	Yhd1KOVU4LdwkCy7DTD3MXnUzLfDMXASelxPDpmUtFyudwbjLcwj196lGZasK1xypdz+Jr
	kSoyBbVlFYZbppRMS3bGf8+iui6dLCeZfYcuDKolsicRj2676kcKYlYbFncVXA==
From: Lukasz Majewski <lukma@nabladev.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Date: Thu, 22 Jan 2026 14:06:49 +0100
Message-Id: <20260122130649.4150338-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050716_088386_B47D1EC2 
X-CRM114-Status: UNSURE (   8.73  )
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

The vf610 device has built in the MoreThanIP L2 switch. For proper
operation it is required to enable ESW and MAC table lookup
clocks.

The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
to provide clocks for each AIPS1-"slot", which size is 0x1000
(hence four separate entries).

Those can be enabled via clock gating CCM_CCGR10 register
(0x4006_B068).

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
 drivers/clk/imx/clk-vf610.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..88c9b656f244 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -309,6 +309,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts", "enet_ts_sel", CCM_CSCDR1, 23);
 	clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(0));
 	clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(1));
+	clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(8));
+	clk[VF610_CLK_ESW_MAC_TAB0] = imx_clk_gate2("esw_tab0", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
+	clk[VF610_CLK_ESW_MAC_TAB1] = imx_clk_gate2("esw_tab1", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
+	clk[VF610_CLK_ESW_MAC_TAB2] = imx_clk_gate2("esw_tab2", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
+	clk[VF610_CLK_ESW_MAC_TAB3] = imx_clk_gate2("esw_tab3", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));
 
 	clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1, CCM_CCGRx_CGn(7));
 
-- 
2.39.5


