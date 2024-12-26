Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E57DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCtQxe3UgNrzJxC3+A7Z9vKRxu+sFJgDjgkXCte8ayo=; b=o+Mqpjokje262sjBuLGgNWZgya
	gMvPVSOmNwuU9YIUMg5N3NLcVc23EAoFzWHtf2S+mlUYdzOPUIJZh4Nt+yKR0g6U7i0XTk1Z2WUjU
	MDlVCwu6mqcseiC8w/lG2ENzMJ19Hwd9qvBP/OG9hHFuOUzJZ2M7HbRrm3bXV/mC0soyLnby4bx6J
	FS/l1nZT4ZivZ/Fvm9HutqjPkepkutcotFnzHZns0JQs4ApIHrG9zrwtkvjJYeMq/vxMh8mOidjPY
	0Iu+chNth9CQiVIVJ3g37RRotgL5A6IJsDM8j5iHAFoY/eFotlFs3EzcxmzsqPaj+q03jZV9sgC5Z
	SBrMZQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgD6-0000000F9Tl-0OUv;
	Thu, 26 Dec 2024 05:15:00 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQg98-0000000F8Kt-0Q4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 05:10:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735189852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCtQxe3UgNrzJxC3+A7Z9vKRxu+sFJgDjgkXCte8ayo=;
	b=AIpwEMYNmwUWc7IACElrVCsrDkBXvGOVUA6Y/XlseKJ10jyMnKQVnOeDZ7PP8HHUKk3O7E
	GsQEo+oAJa2q+MAAlwM9AVAcO0VyIfGjGzw+2Q2F7PcEQkqavnrLeuLioE1KNLGuB1ZrLw
	c4BhT7EgRURwH9N6HoBJGbACifMOjoR05HntRCdJ5dDDWQ74qQUFsMatVra5/JInJfPy3b
	6ElOZS+Xn1W3EDlt/OytZUFlOZBONyyp3dAc7a3z8xZP+QsFY6hqPEcGhnCIjm/WYhWY6O
	yRZaVozrIQgIRhaTnC5cGQ4ZjHy3pb9TkHvjB1apOVSPqRYo+UVsIokr2NGtkA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5/9] soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
Date: Thu, 26 Dec 2024 01:58:05 -0300
Message-ID: <20241226050205.30241-6-val@packett.cool>
In-Reply-To: <20241226050205.30241-1-val@packett.cool>
References: <20241226050205.30241-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_211054_285216_BD7FA4EC 
X-CRM114-Status: UNSURE (   9.31  )
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

The MT6392 PMIC is equivalent to the MT6323 in terms of pwrap.
Add the compatible to use the same configuration.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9fdc0ef792026..59611ef0b144f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2249,6 +2249,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6392", .data = &pmic_mt6323 },
 	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
-- 
2.47.1


