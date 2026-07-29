Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC59C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB+/Rj5cXlSH43djwFDHb7A4PQ8LyZMZpbOglbsO2Cg=; b=kH7mG/iVWmgE/Br59I86Az6MZR
	NcOzOe1eD9joWfY2hZORyhGvG2uv5pbKgPR1/mPY0TJRBeHsH8+UVsCKC5imgPpihYSpdRA7IGmMw
	7hx7V7re0YlXhcd9IMt2PR2qscM9svbKvuce/HVWJBl7tkHidHf/TfFnm64Ub4eypxGvjGe5LMMgL
	o46Ji1uynxTfW4HbdGDtliPkIslhXpifoUSXm5+1ak2VaDtsNH8SBubYhvcmen6znT8lFN73e5zjI
	bV0taGP9n5ROVXmydtbuKi6W1JuobDLx4SFGOcFsTbO1EPK3kOcJ9j9IwFprXmlOsCbuBEmZ1cgBi
	oc8WQDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18f-00000007SeR-0nI2;
	Wed, 29 Jul 2026 10:03:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18K-00000007S8S-0PJb;
	Wed, 29 Jul 2026 10:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319406;
	bh=6JjNXnp9P8vjSKosRd1pFLpBMxNq9yqudZ2+UxmGb7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CHMOtOA/iii+LAW/dEIX0gG5swDqIyNGGZ9AFdc3+LWX/O4zpm9zUQnwORRBpzuFQ
	 wMG+nMaZ+qH4bnx9Y/rZNmwo5hJb31qo7SchinDMcoXmxXsPjTIt9ulSwQCfcVxFuH
	 2/YBzczmHLg5R0Nw2DvgL5LFj8QrU6cLi87QyRjg6hUj36/MfR57G6GAL+G8DktkxU
	 4Nx+nt94BALhPUHHHDlA0GOOOqXqznHks9C/LhqKFImXy0BzSQIsSRx509QZflRhjF
	 o3YtyrGvP5vF+N3l1JQYP/FjfTHtOFMEhoiFt+/ANBM/ZSi7YpyYQ1uzORbg0kPbWq
	 QINvraovYq/RQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57C4D17E08A1;
	Wed, 29 Jul 2026 12:03:25 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:58 +0200
Subject: [PATCH v4 14/24] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-14-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319388; l=1661;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=6JjNXnp9P8vjSKosRd1pFLpBMxNq9yqudZ2+UxmGb7o=;
 b=4DqLxtAo6pXflnLcoQ981MRSP2HNo+P5bRxvr/ZbyGejZ85clvWSFRGn9jQNqgJwnMY8ztdlg
 cLNI+5iTez2CLAFgv6HloFTUFvdiR/DKFIYyuXZG3/tH4d/0wk8XGI2
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030328_430402_CC1EFB37 
X-CRM114-Status: GOOD (  11.37  )
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

Add new set of PLL FHCTL clock operations, that uses the new prepare
and unprepare methods, added in PLL for MT8189 SoC to support this
logic.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 10 ++++++++++
 drivers/clk/mediatek/clk-pllfh.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 4878ac6da7da..8dc50461c485 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -47,6 +47,16 @@ static const struct clk_ops mtk_pllfh_ops = {
 	.set_rate	= mtk_fhctl_set_rate,
 };
 
+const struct clk_ops mtk_pllfh_setclr_ops = {
+	.is_prepared	= mtk_pll_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.determine_rate = mtk_pll_determine_rate,
+	.set_rate	= mtk_fhctl_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pllfh_setclr_ops);
+
 static struct mtk_pllfh_data *get_pllfh_by_id(struct mtk_pllfh_data *pllfhs,
 					      int num_fhs, int pll_id)
 {
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index d32bfe194ec4..a9eb7558de1c 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -69,6 +69,8 @@ struct fh_operation {
 	int (*ssc_enable)(struct mtk_fh *fh, u32 rate);
 };
 
+extern const struct clk_ops mtk_pllfh_setclr_ops;
+
 int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_pllfhs,

-- 
2.55.0


