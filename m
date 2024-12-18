Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D609FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7As/4lbcOR5wNUHmg3kLd+28u+n3jN+0C0aXurlFDw=; b=Y2Kl5KQv7nTuPNnfajeNej64/E
	MTzPy6IxaxNj0Tu4sDE4cuD0JYw/E/R/fxmka39VaDSxirV5whKegmTIhyMsegk4r3VD6WYQdAT7I
	CaVpiXzYYRvwpULqx5HUCULuIFYM1eIW6feyixU2HYCrnx6HbriC+1+fSOeHqag9VXYgcEVsQKGvQ
	7r9o2KlRXNcMTP/u78GeLfiyYMB2+gROfv5gvJd105znK0RRlQfu74E1jq0YPaUjNeKL8Y16UlN8x
	1CHQ5QnemeRymen3q+xucqVeTAPeqRY4edGtruyDg/6vxh7UtSVyqZnwrvoZO2dB9NM7TuMvGfHpB
	Zg2Y4HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrr6-0000000GNz4-0z5g;
	Wed, 18 Dec 2024 11:04:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrh9-0000000GLH2-3VvF;
	Wed, 18 Dec 2024 10:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519262;
	bh=yk77vsE3x+ErK6MEuD/5lMiwXMA2ViIKn58pIYLQzzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nA/PFay/e+qHE2doEAtO/o++UwgxL6X6OAkHLQENJKWgwwfG0PuhXK3M9lQq0Flb3
	 ORjEnDWksk0BWoSXFEoyN7e0YkoP09NK6Q9kmsinYKccRL5lImCc86dNRdPR3+yapk
	 TJQdRWZjEtyOEPr84Smav6f+dKEBF2KU0Li0Wxyglv+hbAQ8BmDKO4GwN16IpK4W7a
	 HN8zngZuEMiIPtfc/ECnNtSna9AivqYQaD2ZULOpFWCFqhUF5wyrCx9uAipA377CwL
	 TL7wcp9VoG+3s+j3T1biZlPjaSeqHOD9Hw3k5AAp/i625cqLEBVdQRfCRqpUUANdGy
	 PbV5QnO4jflHA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A19D817E361E;
	Wed, 18 Dec 2024 11:54:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 2/2] clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx
Date: Wed, 18 Dec 2024 11:54:15 +0100
Message-ID: <20241218105415.39206-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025424_015454_D1D23DAD 
X-CRM114-Status: UNSURE (   9.19  )
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

Add a missing clock found in the VDO1 controller for the HDMI TX
controller over DPI1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8188-vdo1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
index 4fa355f8f0c2..f715d45e545e 100644
--- a/drivers/clk/mediatek/clk-mt8188-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
@@ -43,6 +43,12 @@ static const struct mtk_gate_regs vdo1_4_cg_regs = {
 	.sta_ofs = 0x140,
 };
 
+static const struct mtk_gate_regs vdo1_5_cg_regs = {
+	.set_ofs = 0x400,
+	.clr_ofs = 0x400,
+	.sta_ofs = 0x400,
+};
+
 #define GATE_VDO1_0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -62,6 +68,9 @@ static const struct mtk_gate_regs vdo1_4_cg_regs = {
 #define GATE_VDO1_4(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_5(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
 static const struct mtk_gate vdo1_clks[] = {
 	/* VDO1_0 */
 	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
@@ -129,6 +138,8 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf_ck", "top_vpp", 17),
 	/* VDO1_4 */
 	GATE_VDO1_4(CLK_VDO1_26M_SLOW, "vdo1_26m_slow_ck", "clk26m", 8),
+	/* VDO1_5 */
+	GATE_VDO1_5(CLK_VDO1_DPI1_HDMI, "vdo1_dpi1_hdmi", "hdmi_txpll", 0),
 };
 
 static const struct mtk_clk_desc vdo1_desc = {
-- 
2.46.1


