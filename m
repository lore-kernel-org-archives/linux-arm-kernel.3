Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D942CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=; b=Msd0DWw72K3VqMDS35mL1i//eI
	ffHBAz1brb5qF4RVVs4Y5aNpTkY0FjMgkfKjsTZYW0ZlJT0MZBdTaadyYR4j/Sm4tNp7AhifiqacW
	+g7wtGZYWC96KCdjqLLrJOu2Eqtsphfzfx1T0Qnu9edoPrC9rtTJtN8wZz0HzwFUE62At4jAPKjb4
	3/MIqi4f6jdLQMbn/ixOLySsxi0JKSM1Zb+NrlizAZAfqCL9UkD7jg59NJTql28xMUZcBUJId+K6O
	OUB6zb4k4kKdIEhNkAOWTmikhi5ADJ0jAXBB6OZZRQRHrblvoJemsQmYAdCjGm8ZZW/hxQXoponNX
	WGQvBinw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTo-0000000GH0x-3s2a;
	Mon, 05 Oct 2026 11:03:36 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTm-0000000GGxm-287H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:35 +0000
Received: by mail-pz2-x29.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so807417a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198214; x=1791803014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=ehYqeCmEAeH4OjNqK0dxVCHfhWJ+9V6NeDzJQo0rH3amsDfwzgAm8RzRGO80iXgjCN
         3sZ03RMW2z4vUs2OW3qBnBazBK1/z/aohJb0DTZZqVnacICOE0kZilfGWdC+qHHyESR3
         ys3OVkmSeQy5HBDKZqKn0iw2NLKWru3uvXhuN6NMCbrwKaO6YULoQjhQWs+7bkX+tP0I
         fna7KJjDVE++5FdpdWCbKuQhxuye6xnWAWLKqc9VkWHdNcmdNIjF4YZXzW3O3W7D+FHf
         iDdbUIjugrxRTBZMjgtNkHuizqNUtV9/8rr5PBWoWAEG2hPWvbq2Bif8JMbEcev1nx59
         XqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198214; x=1791803014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=DQihFIctNs/eyp+STcyHaHzKFM2DE3axumaE/hgaoNIK+JByU15sSW0XUgPayE9Xic
         8gSDo/pXL2C30NOs4jNloCUR8xdYUgprcFVEMQdtVVya7PhgcPnAXxTPLcrlnN5QpSRb
         QyjvPPwnrRZi6WQXd4m0aPVj2WgHV76xz0gpY3LknQxCnDZhliZ9bcvczhqn4zf1kw8a
         sUBwv7GpPFyKFBqx76zgMBrjIipknhjnMACjl5wMnQDIjWTntLYAavERKjRkWtw9u2bi
         KckMkKLmtrLJ4kCYzTyzzYCaYJ2TiklSjkCdJpjZ34TrfHznPQKJJRbycMe6vIKi3coI
         UJWw==
X-Forwarded-Encrypted: i=1; AKwUvBzpPLjfz0UarG/D422t7gWnH4AWdeW7jUnsixvHO+v9l01ee+k7YLs/bdY3A2Lm8gtpt+EPJd8HaRvYcX3pv/ye@lists.infradead.org
X-Gm-Message-State: AFuF++kIcQE8wF6aeAPfgFk7ScUS4FzS4ocuVLVSvJGtHxFvVMgFduLe
	4JZ1AXSgkqIFjrQdq+tNDgplEOF9pQk/yc8jvpuaidZYIjERjjUdcMI1
X-Gm-Gg: AYBFou21/1Tqs4T7sBeLaM9AFhVwYKrLgbtxTmXR5n3W63FnotUGNJc2Fo7Vfq2ecTS
	6bgGjPpBIWNJ+XNPdM8s9MZVSwkgQBmE2SShJDbiYes1uwRUc2LcJHk9me4UzMbnX6jYHyRmQkO
	lwVz4CFkJ/1VoTy8OdBrbNZOTFiw++10LMPhhz/Iz4mEiHZq1WYa1/sQ6cC/o++V0ruyrhkvvcz
	lxwtHE/0+pnrFPlaaI64Uor0F8yMmjuAENbm6CWTEm/Ch/1go3v1pkV0gsEN1rccVc2OxegJtYV
	A6p5VsJQ6F1TZmmbojWMQbX357Z+VYRzDIl/RwTmTZOx5rwulp5xvB5qlXja8iB6FRCSEFZWLxT
	6hGa9fipqTc/r98La1p3ZU3DhTpH7bH83QKlKITS77yROPAgFUq4ioyR5lSq9r6PZlqe87qZWfv
	/7mhbtJ7QqcDFV+AfEj3NoN6ApsfaBXoRKnyZYsLLoeL0MBaadd6NpF9yj7s7SmXXfV2rzTtTXt
	x7oe9766mzu21sD+Dasz/CntTzYgAe2fVtUuM6mEbVPQ6kdNQsMZPJVo6UTY5HmbNbXF/uyG/m9
	et/zEfPjjgLSlg==
X-Received: by 2002:a05:6a21:71c1:b0:3e0:d508:59b3 with SMTP id adf61e73a8af0-3e0d5085ab9mr6255687637.71.1791198213773;
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Mon,  5 Oct 2026 18:02:47 +0700
Message-ID: <20261005110257.50145-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040334_556432_0D7D834D 
X-CRM114-Status: GOOD (  15.80  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0


