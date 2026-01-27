Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF50D2FEF4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/OzkWotmfpTMpfJYwLwOKi9ecYlVvHX8rEeQArnAVLM=; b=o2JII/10U/kJOOKGqIklL/AJrm
	S+Bi7bdelOCRrX3CRcsNuvg39RcEY0v1+nH04iL0yCeMZjqY5VIvqujkLtci65JhgGarsbwPleSk2
	uC5cGrx0tnRbTEHuusHkWlwFz/0Ejpa53IxSmYBIkAt1RQ2+NIV0kvrWIfXjHPfxv7mEhAe4ouU9j
	J6kyePVC3hvihyxmNvq1AiWfRGv68SFkMnUs44BOomgiX5xvV8tH3lkP5YAhOsHrVY3J1vp1iP1Lw
	c5HJkv6t4k9uotEd1A1wCr6026S+qbhoYZF9S1gjCkElQmyMtYRJWR54THpVQvOjGJhtgGmjd2/Ng
	G37k/0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksme-0000000FBMF-0Uye;
	Tue, 27 Jan 2026 23:47:44 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksmb-0000000FBLl-1kXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 23:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769557657; bh=q/u/XvKL68HmLo5r1RpDGCfqD4LAY62ICsaF9xos+gw=;
	h=From:Date:Subject:To:Cc;
	b=fXXKijDgKK18ydT0YumguA+J5t7LNz5e4baaNkn0fJgBJjhU44jUapTvlxtP4Vs/a
	 2/lUf8UgBpEY/2J7NFkl/Th/Op7JPy56CychATWLl91oWX/T2z6gmCEpvsiUCQMZPy
	 WD9SIAqvfTgBqlv9wlPBZXBz4R720vEqgW8hzFupUdZ+H9+5Wet7+pIlMnPWrOX2Xx
	 VgUuvedmX8cjhFCzqj0vVO/v5RSM1/9oArHq4yvSRR83hLBJp+mDF9hUbAV2BZN532
	 pnOZvMjqon+rKBkqcFRgT7UnZ4H1nKwkbRiWUdptC4pFbEuz6NSrTfQgbsdNKd6lG7
	 8ITM/hBjE3aCQ==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 69A4F1FA50;
	Tue, 27 Jan 2026 15:47:35 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 28 Jan 2026 00:47:21 +0100
Subject: [PATCH] clk: imx8mq: Correct the CSI PHY sels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQ6CMAyA4VchPdu4LQSJr2I8lK1II5vaqiEhv
 LuT43f4/xWMVdjg3Kyg/BWTR6nwhwbiROXGKKkaggud86FHyUufXxhNMM53DIlcbE+t59RBjZ7
 Koyz78HKtHsgYB6USp/9mlvKxYyZ7s8K2/QDoX+YSfwAAAA==
X-Change-ID: 20260128-imx8mq-csi-clk-2da0c4741ed6
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Anson Huang <anson.huang@nxp.com>
Cc: Bai Ping <ping.bai@nxp.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=q/u/XvKL68HmLo5r1RpDGCfqD4LAY62ICsaF9xos+gw=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpeU6WtyTpjZs6uJHcey9jsZGEaddvA6jQcQpof
 ncHAeKVEImJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXlOlgAKCRDo8jXPO9vD
 /0p5EACJkHOwOGYB1sSTxHb2HgBICPP52RNTWB/yqyURlIj1TXcMDJm8RWld679wa7i3zt7N3LE
 G5pp2nZ3S4K51i79jluWMjGPbwjv22TTsXryMAdumb/+dn72QtlEBoJwu6bzIdA9tbLmDr/3eCh
 4+4sZdYK59LiPvykinFGU0hqeQkp1S7QMtHY7b108/kVRWrwC7JUkAsQPWcU5Il69Merh4uI/Qm
 6ER6/ktB0XyNA9f9bv0NLCIbv5bVQ1bm98h7IqV/7kNdcHnCM0R/DC5dldPCoBwMEkP1h9XsMNn
 MaxQ3eteKuGQAav83/tNKPJy0avIJJwqqDT1dYl/IIDnkWvu+MLTNzzxuAmAwcDDKxrVHppAPg4
 /GrMvGBljLuYdM+/+D1+Xfd9yUbgwSPrKAIJEZevoeFXYBn6t8u9rr7kQaA0W7zKnnIX3i4+l0u
 Q4fu7GRdi0xKSpFhVLLl28dIb02nYrmy1ZyLKVLMTV/hMp5NXlRNhyr9NNoHnumgCgsYgpVqrpD
 6hiczHO2NAyEVXKbI71RTyr/9c2KbZK1vHnSy5WG9ziSrJIJn4mwlPunzZszhTLx9sYY3gZL0rS
 b4Exnmu5aU4MFBeLJXi1ooCezBG/tEYxGHlYaziJVhNoaYzj5BtRaCmae4uOEaUd6tDUfs/nZIC
 CQix4jkVejlP5eQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_154741_617908_85064133 
X-CRM114-Status: UNSURE (   8.58  )
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

According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
SYSTEM_PLL2_DIV3 available as their second source, which corresponds
to sys2_pll_333m rather than sys2_pll_125m.

Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/clk/imx/clk-imx8mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..cedc8a02aa1f 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -237,7 +237,7 @@ static const char * const imx8mq_dsi_esc_sels[] = {"osc_25m", "sys2_pll_100m", "
 static const char * const imx8mq_csi1_core_sels[] = {"osc_25m", "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
 					      "sys2_pll_1000m", "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
 
-static const char * const imx8mq_csi1_phy_sels[] = {"osc_25m", "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
+static const char * const imx8mq_csi1_phy_sels[] = {"osc_25m", "sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
 					     "sys2_pll_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
 
 static const char * const imx8mq_csi1_esc_sels[] = {"osc_25m", "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",
@@ -246,7 +246,7 @@ static const char * const imx8mq_csi1_esc_sels[] = {"osc_25m", "sys2_pll_100m",
 static const char * const imx8mq_csi2_core_sels[] = {"osc_25m", "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
 					      "sys2_pll_1000m", "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
 
-static const char * const imx8mq_csi2_phy_sels[] = {"osc_25m", "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
+static const char * const imx8mq_csi2_phy_sels[] = {"osc_25m", "sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
 					     "sys2_pll_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
 
 static const char * const imx8mq_csi2_esc_sels[] = {"osc_25m", "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-imx8mq-csi-clk-2da0c4741ed6

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


