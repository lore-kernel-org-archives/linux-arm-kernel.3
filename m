Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B731FD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XaRLbBJhSEUDHmd2FnN+oJUsUUjUDK/6biwWL7Eots=; b=jwU7oOdlbWVn8L6upmLwWD94T1
	C0d/pG3AiJLT9IBtroVrLljC3mkYy4alu+WL34ZcwNmwuR8o1PnH0cr67IKnzQYeGjgkL4tA4MaDg
	VdfyiGVwzaeXXHa+pmPh/90mgnepZB9rb+YEOvVEE0/F3qgiq1tsPC16DOeQO/3CJo0e2z4vwfKUZ
	Vy6eaN4z+yXDm3o8Xo73X87Z+Koz5eLjgyjtrIob0KsmFrWT36m5toCbMuH+Yit0wzoH/5YaECbH9
	bVY1jKoIxoVShbIW6E7ptTuCRsr2kErYNnxDphaEFThMqVuqbnajQ4CtXw9dVA5UwTRHVsm7tCkh8
	23ASG6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5yv-00000003TB9-3Ns8;
	Mon, 15 Dec 2025 10:39:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5ys-00000003TA8-2Qhs;
	Mon, 15 Dec 2025 10:39:07 +0000
X-UUID: 4548b44ad9a211f0a52f393f94899d25-20251215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7XaRLbBJhSEUDHmd2FnN+oJUsUUjUDK/6biwWL7Eots=;
	b=QNcdR6eL+kQirLta076bPuKRIaKsBrLuei843dKjry65dCwifq+6fNuevpCV3MafIsK9QWRDuRvZ6zgHgRFULE7fUF6MO19ZFyXSN8SMkTkA1lNT9FDYEeDjUCD3FuVMVGAOYJH6ZYK1y59/A2NeIV1ewWmveI181XFsR+hnmRY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8567d0bf-9474-49d8-83d6-3913243b7b6c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:595735aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4548b44ad9a211f0a52f393f94899d25-20251215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <payne.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2033378326; Mon, 15 Dec 2025 03:39:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 18:38:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 18:38:58 +0800
From: 20190311120055 created <payne.lin@mediatek.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <matthias.bgg@gmail.com>, "Matthias
 Brugger" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pwm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Payne Lin <payne.lin@mediatek.com>
Subject: [PATCH] pwm: mediatek: Add error handling for zero rate in PWM state
Date: Mon, 15 Dec 2025 18:38:47 +0800
Message-ID: <20251215103855.3099184-1-payne.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_023906_629539_5F9A5D48 
X-CRM114-Status: GOOD (  12.34  )
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

From: Payne Lin <payne.lin@mediatek.com>

Added a check to handle cases where the rate is zero in the
mtk_disp_pwm_get_state function. This prevents division by zero errors
when calculating the period.
- Added error message for zero rate scenario

Signed-off-by: Payne Lin <payne.lin@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index bafd6b6195f6..dd0ae041af70 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -176,19 +176,18 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	u64 rate, period, high_width;
 	u32 clk_div, pwm_en, con0, con1;
-	int err;
+	int ret;
 
-	err = clk_prepare_enable(mdp->clk_main);
-	if (err < 0) {
-		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
-		return err;
+	ret = clk_prepare_enable(mdp->clk_main);
+	if (ret < 0) {
+		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_main: %pe\n", ERR_PTR(ret));
+		goto err_handle;
 	}
 
-	err = clk_prepare_enable(mdp->clk_mm);
-	if (err < 0) {
-		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
-		clk_disable_unprepare(mdp->clk_main);
-		return err;
+	ret = clk_prepare_enable(mdp->clk_mm);
+	if (ret < 0) {
+		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(ret));
+		goto err_disable_clk_main;
 	}
 
 	/*
@@ -212,15 +211,23 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	 * period has 12 bits, clk_div 11 and NSEC_PER_SEC has 30,
 	 * so period * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
 	 */
+	if (rate == 0) {
+		dev_err(pwmchip_parent(chip), "rate is zero, cannot calculate period\n");
+		ret = -EINVAL;
+		goto err_disable_clk_mm;
+	}
 	state->period = DIV64_U64_ROUND_UP(period * (clk_div + 1) * NSEC_PER_SEC, rate);
 	high_width = FIELD_GET(PWM_HIGH_WIDTH_MASK, con1);
 	state->duty_cycle = DIV64_U64_ROUND_UP(high_width * (clk_div + 1) * NSEC_PER_SEC,
 					       rate);
 	state->polarity = PWM_POLARITY_NORMAL;
+
+err_disable_clk_mm:
 	clk_disable_unprepare(mdp->clk_mm);
+err_disable_clk_main:
 	clk_disable_unprepare(mdp->clk_main);
-
-	return 0;
+err_handle:
+	return ret;
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
-- 
2.45.2


