Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ECEC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WRyLPeZXBWD/jTrSo5Pg4LSFfjpquqJIa2F3+ZVsEc=; b=gZKiJ6o5BMpddt+wkvgD7uA6kp
	/CR4mkvHG0x1u+tBVnMw76CnLPMeQsFCiN2SHki+BkboUrKt8uaQmjA93bqm+M5ZnoEWpE75spXbm
	+JiPAI+feyQH26VeNemupQUvv/1iYBfpqlT1w0d0fy+CPoDSYMCM2awCvGC+jGvPiu6FAmX38yGVq
	h2BtOobJFCBRdeWG51Sx9bqUOP1BTpeeR/Zz627n82iGK/Yuwlj+6XIdLYVcxL8zELDWNMdH590Ml
	1HOQL0Zm9jgM7VG+2t+NF0i9hGxYTEBnxizNaMczze7DU+4S2qu+xFgw/jWaE40CuKR3OcP/leUX9
	rj34A3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIRA-0000000CyNy-2Fpd;
	Tue, 05 Aug 2025 14:14:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI8p-0000000Cu8o-23Hk;
	Tue, 05 Aug 2025 13:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754402145;
	bh=Gb7IZwUlriHpo5vbmDTNk57nLTln98iuALB5y5tpq5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lI7sQ+uI1KhXQQDstvxe+T1KS6cYTyfeT4Ya3n+py/Cnpr5AoNwczX3OYNWWTbfnD
	 yAgxeU+8nYleiRES6GtewYVq8D0Rf9KnKP15uvorlMuPdpq4PGOpi/6erz7rertWZy
	 I7hgng1AMf1dzA63vGpxNI/n96jIInpR3A6CCBZwp1Hl3AAToVXYvAGkHreTcAuI3o
	 ZNBTM0AEus/DazBdF0fX6JXYeLTobebU0FifGvLPdhF4BsQWGIC0SykX5Zn2PKUzKc
	 vZg1enIDKxFkQMFcO2l+OjNJgxT1fPU/ogof5co1dGHW4m6OgyTTqVI2jAayN28MaV
	 c+Lz81SFa6xUA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1976:d3fe:e682:e398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F11A117E04DA;
	Tue,  5 Aug 2025 15:55:44 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
Date: Tue,  5 Aug 2025 15:54:26 +0200
Message-Id: <20250805135447.149231-7-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805135447.149231-1-laura.nao@collabora.com>
References: <20250805135447.149231-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065547_704231_80BAA9AD 
X-CRM114-Status: GOOD (  11.62  )
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

MT8196 uses a HW voter for gate enable/disable control, with
set/clr/sta registers located in a separate regmap. Refactor
mtk_clk_register_gate() to take a struct mtk_gate instead of individual
parameters, avoiding the need to add three extra arguments to support
HW voter register offsets.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 67d9e741c5e7..0375ccad4be3 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
-static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name,
-					 const char *parent_name,
-					 struct regmap *regmap, int set_ofs,
-					 int clr_ofs, int sta_ofs, u8 bit,
-					 const struct clk_ops *ops,
-					 unsigned long flags)
+static struct clk_hw *mtk_clk_register_gate(struct device *dev,
+						const struct mtk_gate *gate,
+						struct regmap *regmap)
 {
 	struct mtk_clk_gate *cg;
 	int ret;
@@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name
 	if (!cg)
 		return ERR_PTR(-ENOMEM);
 
-	init.name = name;
-	init.flags = flags | CLK_SET_RATE_PARENT;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
-	init.ops = ops;
+	init.name = gate->name;
+	init.flags = gate->flags | CLK_SET_RATE_PARENT;
+	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
+	init.num_parents = gate->parent_name ? 1 : 0;
+	init.ops = gate->ops;
 
 	cg->regmap = regmap;
-	cg->set_ofs = set_ofs;
-	cg->clr_ofs = clr_ofs;
-	cg->sta_ofs = sta_ofs;
-	cg->bit = bit;
+	cg->set_ofs = gate->regs->set_ofs;
+	cg->clr_ofs = gate->regs->clr_ofs;
+	cg->sta_ofs = gate->regs->sta_ofs;
+	cg->bit = gate->shift;
 
 	cg->hw.init = &init;
 
@@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_gate(dev, gate->name, gate->parent_name,
-					    regmap,
-					    gate->regs->set_ofs,
-					    gate->regs->clr_ofs,
-					    gate->regs->sta_ofs,
-					    gate->shift, gate->ops,
-					    gate->flags);
+		hw = mtk_clk_register_gate(dev, gate, regmap);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name,
-- 
2.39.5


