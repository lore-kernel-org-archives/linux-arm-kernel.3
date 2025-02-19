Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D54CC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DmE/AqNS2uy0QlORQ3XZZ++nuTd4ykAVXTbN7NVTIZw=; b=Q3xMYlfy9waUIO+AWksEYhZXmL
	9K3MescWwPGG/UVfZeiu2sQ+KLX4UHlxXzJTOtpMiYZlDyvk8x3pXdo5/7tKZ9ETEEKLGxAwUkxEK
	mXeucRm80wkeRljwdp171IwEry8u+y6Wd3+0tGQ9X00GXKKbRUk/KE6TXp6RwWubB94QlFHTFRRnS
	XKBp6BpUF4pLEH6vOrBrRLCW1wKKYsoat3OkSWCft4tvlq8FGjd+ZEyqoL0szPm2S0sjnNmHrKzIW
	WyettaWm4WggSgb7VcmG8mzfgxiXHrOd/JLNbOsFMx04NRsZlNxyCkXzDazKxVKhhQovAOo/kUF3s
	PEvgMmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkic3-0000000CWMh-0pg6;
	Wed, 19 Feb 2025 11:51:35 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiaZ-0000000CW0Z-0dAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:50:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62E6F10382F0F;
	Wed, 19 Feb 2025 12:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1739965798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DmE/AqNS2uy0QlORQ3XZZ++nuTd4ykAVXTbN7NVTIZw=;
	b=fzeE/D709YCLzOyof5x37NCe3HjjsvRoAPnhyqoAq6puzHn6jaKnAI/7HCLN2Adv+KWYIb
	qhykKL6tAFpc1IMieFJdTjtC0JW2IilHAuMXh9xLswuoiy6upsgIEKi//pwtr4LiM+jPdH
	iPjOuUmvVCIspveJlusVDxzmPRpz6Pqp0MltAil+j8Xfsp2kcNHa/cgIocHKK0Geo8lZoq
	o77vXhzqOARwQ4cLIKUiKOyPMJYYdF9C0i9At/CpKxwUj83S+gjiOORwvdSN1v8d9lv57b
	axXiLkxQ20q0vu5pV/MFlZw61ns9tLefp/zAqzuxxm6M69h6hd0/GpmcJnZmPA==
From: Lukasz Majewski <lukma@denx.de>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
Date: Wed, 19 Feb 2025 12:49:36 +0100
Message-Id: <20250219114936.3546530-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_035003_340115_AF15C7B9 
X-CRM114-Status: GOOD (  11.36  )
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

The NXP's vf610 soc is equipped with L2 switch IP block from More
Than IP (MTIP) vendor.

It requires special clock (VF610_CLK_ESW) to be operational.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 drivers/clk/imx/clk-vf610.c             | 1 +
 include/dt-bindings/clock/vf610-clock.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..405bf48a1d28 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -309,6 +309,7 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts", "enet_ts_sel", CCM_CSCDR1, 23);
 	clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(0));
 	clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(1));
+	clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(8));
 
 	clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1, CCM_CCGRx_CGn(7));
 
diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 373644e46747..95446f1bee16 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,6 +197,7 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
+#define VF610_CLK_ESW			191
+#define VF610_CLK_END			192
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.40.1


