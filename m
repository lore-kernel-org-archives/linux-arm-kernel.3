Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4DD10BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mxGL0aSl2NqkbgZ9Kshh0Puh8j8C+ZvBlwJAex/m8Jc=; b=KHCn4tSLbN0u7NN7tkDpTfzCX4
	Rx4zBxDN7laIwtFZ9Ibz8IP6dc/qsQ6vEwwgwma+b+tmkoovcG96nUOCLhk53Yvo17QbNt2Nszf62
	dT3Ar5V2gv6+HvdDRJybpu2KuawmBm7AoyvFHSYatTAgpP1klDMlLI8GnwefJHp3EALqR7dxIucRP
	X1I29yfOIElOCjqweIAvC+iJyklU/Cg/Fz3TwQje4ctqF5p6eYJof0fBGEFYKDGsYQRCFYyx9sgCp
	GW7BjxqMMTTAmC0WjTDtJXJDUmZhIO8TM8WeiR+xtIcyQ00Bi5dkugMq8gt22kaJGBOqHDXvzz82w
	ijWnfrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bQC-000000069Jp-3mFf;
	Sat, 26 Oct 2024 07:41:16 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bMR-000000068ln-3e2k;
	Sat, 26 Oct 2024 07:37:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XbBLl18RYz1ynNn;
	Sat, 26 Oct 2024 15:37:19 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 49B241400D3;
	Sat, 26 Oct 2024 15:37:11 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 26 Oct
 2024 15:37:10 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
	<judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH] clk: meson clk-phase: fix division by zero in meson_clk_degrees_to_val()
Date: Sat, 26 Oct 2024 07:26:24 +0000
Message-ID: <20241026072624.976199-1-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.84]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_003724_084366_3B3E9EB2 
X-CRM114-Status: UNSURE (   7.26  )
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

In the meson_clk_phase_set_phase() function, the variable phase->ph.width
is of type u8, with a range of 0 to 255. When calling
meson_clk_degrees_to_val with width as an argument, if width > 8,
phase_step(width) will return 0. Lead to a division by zero error in
DIV_ROUND_CLOSEST(). The same issue exists in the
meson_clk_triphase_set_phase() and meson_sclk_ws_inv_set_phase().

Fixes: 7b70689b07c1 ("clk: meson: add sclk-ws driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
---
 drivers/clk/meson/clk-phase.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index c1526fbfb6c4..b88d59b7a90d 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -51,6 +51,9 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
 	struct meson_clk_phase_data *phase = meson_clk_phase_data(clk);
 	unsigned int val;
 
+	if (phase->ph.width > 8)
+		return -EINVAL;
+
 	val = meson_clk_degrees_to_val(degrees, phase->ph.width);
 	meson_parm_write(clk->map, &phase->ph, val);
 
@@ -110,6 +113,9 @@ static int meson_clk_triphase_set_phase(struct clk_hw *hw, int degrees)
 	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
 	unsigned int val;
 
+	if (tph->ph0.width > 8)
+		return -EINVAL;
+
 	val = meson_clk_degrees_to_val(degrees, tph->ph0.width);
 	meson_parm_write(clk->map, &tph->ph0, val);
 	meson_parm_write(clk->map, &tph->ph1, val);
@@ -167,6 +173,9 @@ static int meson_sclk_ws_inv_set_phase(struct clk_hw *hw, int degrees)
 	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
 	unsigned int val;
 
+	if (tph->ph.width > 8)
+		return -EINVAL;
+
 	val = meson_clk_degrees_to_val(degrees, tph->ph.width);
 	meson_parm_write(clk->map, &tph->ph, val);
 	meson_parm_write(clk->map, &tph->ws, val ? 0 : 1);
-- 
2.34.1


