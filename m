Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C438C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdXiA9YW1oQ9qfGLI3cXZ90EaDzZP6hVqbuOJs1BOD8=; b=yuK5/k5TVLBn8JFX7Pvom6g1ul
	U6ebmI/6CULyQf3IEe2fS+RYdbGmI5ZZegfzORSrdEVojzxnzVd4OXu8ijYR2fBEObJH8o5GNurzj
	a21r3/mP+jXWx5dfAkYKV7Kb9XjJqtNifgH/v9ual6CQ8gVrv4VBLyhYbKnOyL6KbHNIj7+C9vwRg
	g/gS7j30kyqIhMrHuYCDk3KwY5p2RwTmy+Eyvdtj/GLP2qUrwKCizFNMlc2Zk8zDmMI/xYBVscTiy
	4qpDUjQ1iiTBxi/74O0UPQKg640y9nNaMxUuKbD/I26lKxpJFbvtDTZzgsHp2/Isvd1i+uoe1eAxw
	N6+8udDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tV1-0000000AxKz-39xR;
	Thu, 10 Apr 2025 15:07:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4w-0000000AsUo-2RiW;
	Thu, 10 Apr 2025 14:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296029;
	bh=wjB41mY8Agm1B+wcC7r0Il4fMM8tvGoJYe6ytb01tmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VLTWx86QgKdoUzErZBD3QDCORWSWgAjJSRhVs96MHlsSIuGebgDNrnIuVxy0CcSna
	 0mK816okYVbgnhI02cEockT4dUjuSe13021NaAgp2mU89esN2S57iA4/m8A5xtwWeX
	 s7c4wVpdilA4yNEgk6ElYFeUjyc1jG2MsnvyLdj9blOE4dMYobK3OPbYMqj3VEvbmo
	 e80CbrFpbIcOxRx0sDNQtm3A4VxzEInA/0t/mYelMAw7mMirzZeMFJu/PFyf+MVEel
	 BovQcr8Z9fT+dFyQcTiNyrPdbi2UxCwLtqsI92fytl+LpqdfTePpUw13V9ij3zqRJ7
	 /ZteNHx27kR1g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27F0C17E0CA7;
	Thu, 10 Apr 2025 16:40:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/5] soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
Date: Thu, 10 Apr 2025 16:40:18 +0200
Message-ID: <20250410144019.475930-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074030_777960_8A0AB957 
X-CRM114-Status: GOOD (  12.00  )
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

Rename the MT8183 and MT8195 bandwidth constraints data structure
to, respectively, dvfsrc_bw_constr_v1 and dvfsrc_bw_constr_v2, as
the actual constraints are depending on the DVFSRC version rather
than on the SoC.

While at it, to prepare for adding a new SoC, also move the two
structures at the start of the platform data code section.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 83bf46fdcf2d..65c7d7bf743e 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -446,6 +446,13 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v1 = { 0, 0, 0 };
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v2 = {
+	.max_dram_nom_bw = 255,
+	.max_dram_peak_bw = 255,
+	.max_dram_hrt_bw = 1023,
+};
+
 static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp4[] = {
 	{ 0, 0 }, { 0, 1 }, { 0, 2 }, { 1, 2 },
 };
@@ -469,8 +476,6 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
 	}
 };
 
-static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt8183 = { 0, 0, 0 };
-
 static const struct dvfsrc_soc_data mt8183_data = {
 	.opps_desc = dvfsrc_opp_mt8183_desc,
 	.regs = dvfsrc_mt8183_regs,
@@ -482,7 +487,7 @@ static const struct dvfsrc_soc_data mt8183_data = {
 	.set_vcore_level = dvfsrc_set_vcore_level_v1,
 	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v1,
 	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
-	.bw_constraints = &dvfsrc_bw_constr_mt8183,
+	.bw_constraints = &dvfsrc_bw_constr_v1,
 };
 
 static const struct dvfsrc_opp dvfsrc_opp_mt8195_lp4[] = {
@@ -521,7 +526,7 @@ static const struct dvfsrc_soc_data mt8195_data = {
 	.set_vscp_level = dvfsrc_set_vscp_level_v2,
 	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v2,
 	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
-	.bw_constraints = &dvfsrc_bw_constr_mt8195,
+	.bw_constraints = &dvfsrc_bw_constr_v2,
 };
 
 static const struct of_device_id mtk_dvfsrc_of_match[] = {
-- 
2.49.0


