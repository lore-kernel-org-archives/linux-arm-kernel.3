Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7175C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB+/Rj5cXlSH43djwFDHb7A4PQ8LyZMZpbOglbsO2Cg=; b=FIWrMtVV8cWVO9ea918p67XTtk
	USnulUecMI+5CUCh15Z6zqYFHF0gN0MBD0Ce8wf+57mqNb5UXPLSIT6zDbAhz5zKsuXhhPuHs2rBc
	jLtGTFc9D/BwmPYs40U7ZceBuvxOnWXTOyb/HMvhIj2Lfsl1yvJj9cxWePwSAH0Qll03St1ZkdS4E
	MZntitISF8HKD1mJG+4ajcMyYuUN1yhF4rpLvDw5IFK2XFp4fm6FYEH82drVepvNcalXOWLtgI+GL
	c1UaTT9LgwGhZ3h85tTOT0W5XtDhDzbyrGEtvjgOq9JPvA+3jJ1gg/Av4XGmcWVGWlh4AlMfPN19l
	OY5A5dHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mi-0000000EDqX-2hEb;
	Sat, 01 Aug 2026 11:21:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mR-0000000EDCD-3oWm;
	Sat, 01 Aug 2026 11:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583280;
	bh=6JjNXnp9P8vjSKosRd1pFLpBMxNq9yqudZ2+UxmGb7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XHN2z/OgsW5t6b6d0W+0OvzIVJasbiJQcnEiZhw4PVvTyR5tijpfb87M4ibs8k6mg
	 CQnKI9kqdkA/qiiEAXlqRwQvphRfq/KBfz8ktLwNghVFbIypqP3z1shdmTC1uHa9Wx
	 PBV1qxVSXMxzYm6rQdZvgGwD5vrGi4JxCO7u4iCFbQmJL2lQiT/GOFYudDRsS7MHpC
	 4o6n8sOjPT8Fv1RdMynTI47+hpzvsewoMEG4Z2zc3e+QmDGVlhalxvkWpUDWlS2FJE
	 7Gj9N7RNp79qie8pBtPvrIw6b1L05Oq3UfEDwO1dUZbGkiSKrvX5t0Yfyz6+HkWPl3
	 ULWnya80aLj3Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C095717E0945;
	Sat, 01 Aug 2026 13:21:19 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:21:01 +0200
Subject: [PATCH v5 15/25] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583260; l=1661;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=6JjNXnp9P8vjSKosRd1pFLpBMxNq9yqudZ2+UxmGb7o=;
 b=/BvKw1ZopRtn2m7mIlYzv0VssfOP2pg5dU4bvfs3MPYezztKeA24P67mrdRnGYW6gB+M/v/Oz
 CYrNzQP11x0CDW7VhOWoFGGTEu5y10v7GSWbjQeFJ2afCm3cSTPT6cu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042128_592142_68AB7358 
X-CRM114-Status: GOOD (  11.04  )
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


