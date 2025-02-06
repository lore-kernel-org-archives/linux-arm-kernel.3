Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DB2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 01:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xO8GKg14rdVcQiYhVd953yc4D8d7fV5o/+Fei2DJjHc=; b=yPGktn7LltYbWyxhQGCdt+JpPk
	LxlcnZ1x2gqj0ndsmsOQdxZ0s6m44Syxe5/GxQAKoc0G+tVR3NGyT+tmHVLOc73LF/Gmq8E5cO37/
	to8gc/oYaTJnNS8/kqpnU8Msa/L7a4C8PzbEGyze25kNEUd5nkbcK2k95jJG1ySCrzyzsVomW+VUk
	fCviZy2G9qXhk8eSf+EbYJsQBxbrE7l/x+IdUMHqb2ABjnlr523h8q6ugDGlN/vRDSvdxE/3jy3tU
	jGuqOvxg/PMmznnvJEKB0dEsPlWQivSQvSDH25NJlEcKZqnxa4b73O2OnHnZISdNcOXZgQlMi4To/
	MIPIZ0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqu3-000000050VN-44yp;
	Thu, 06 Feb 2025 01:42:03 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqsg-000000050Ni-3WvA;
	Thu, 06 Feb 2025 01:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=xO8GKg14rdVcQiYhVd953yc4D8d7fV5o/+Fei2DJjHc=; b=rtcAF/UOamg2nGMB
	jIQHvZpO4Fv9WjkEvlVa0HskXdSIfspoBKcRyi8ebF4xshRIhh+gFk96K4zIqXwq4ZjcceCLkq3G+
	QvoiMs68+Cb4pMZ1wcHkOKv6qb+txb03G8ypyhyqS80qelnwrwUTxwnnswT6vZkFPqsqPMyG9t/vr
	CCiYgyWCAIiMqE99hi5Q4CRA8/OAmaHvSt/5F55f4bswdy/k3XEXoYFNLiL5eSY3VovdInNnX0cPl
	71cJ2gotJokf75bafOhAUlVf2svUEYaUUEjyz2cUgskzFQc1TN+NXN2WOiVU1Lx+lfks3kxjiPguZ
	/XZM3kB9ugtmNTnNiw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tfqsX-00DsqW-1N;
	Thu, 06 Feb 2025 01:40:29 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: mediatek: mt8186: Remove unused mt8186_afe_(suspend|resume)_clock
Date: Thu,  6 Feb 2025 01:40:28 +0000
Message-ID: <20250206014028.237423-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_174039_051844_EF2EBC8E 
X-CRM114-Status: UNSURE (   8.38  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mt8186_afe_resume_clock() and mt8186_afe_suspend_clock() were
added in 2022 by
commit 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control
in platform driver")

but have remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 55 ----------------------
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h |  2 -
 2 files changed, 57 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 70ec101890d3..daaca36a2d08 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -329,61 +329,6 @@ void mt8186_afe_disable_clock(struct mtk_base_afe *afe)
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
 }
 
-int mt8186_afe_suspend_clock(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int ret;
-
-	/* set audio int bus to 26M */
-	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	if (ret) {
-		dev_info(afe->dev, "%s clk_prepare_enable %s fail %d\n",
-			 __func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto clk_mux_audio_intbus_err;
-	}
-	ret = mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
-	if (ret)
-		goto clk_mux_audio_intbus_parent_err;
-
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-
-	return 0;
-
-clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_TOP_MAINPLL_D2_D4);
-clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	return ret;
-}
-
-int mt8186_afe_resume_clock(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int ret;
-
-	/* set audio int bus to normal working clock */
-	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	if (ret) {
-		dev_info(afe->dev, "%s clk_prepare_enable %s fail %d\n",
-			 __func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto clk_mux_audio_intbus_err;
-	}
-	ret = mt8186_set_audio_int_bus_parent(afe,
-					      CLK_TOP_MAINPLL_D2_D4);
-	if (ret)
-		goto clk_mux_audio_intbus_parent_err;
-
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-
-	return 0;
-
-clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
-clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	return ret;
-}
-
 int mt8186_apll1_enable(struct mtk_base_afe *afe)
 {
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
index a9d59e506d9a..e524833ce780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
@@ -85,8 +85,6 @@ int mt8186_afe_enable_cgs(struct mtk_base_afe *afe);
 void mt8186_afe_disable_cgs(struct mtk_base_afe *afe);
 int mt8186_afe_enable_clock(struct mtk_base_afe *afe);
 void mt8186_afe_disable_clock(struct mtk_base_afe *afe);
-int mt8186_afe_suspend_clock(struct mtk_base_afe *afe);
-int mt8186_afe_resume_clock(struct mtk_base_afe *afe);
 
 int mt8186_apll1_enable(struct mtk_base_afe *afe);
 void mt8186_apll1_disable(struct mtk_base_afe *afe);
-- 
2.48.1


