Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86EE65D29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7IYLsrSpDQF/b0UKrnVH2buJ5CierwWALNKBD2lotkQ=; b=Noh+G6DuSJ7dc/2sN9Ebyetd9f
	pclBH6Bw72jvo91QO/DtGfjtof04ZFYK9I97rX4bUlCUxrad7koGzdqlxUL1WGrXnTCg7z6BluTsx
	tEl7OhiSxOOAeRS2rfLBK7R0uen9Ff9Qa4nYfSQy7kT1MdSd4OY2zWIYGAR2hVn5EUJRBD0ECF4Nt
	fIQ65KS806W0EjT0gcEr0q79pvmi0sRyOwfX/MANonnHodKfMHah6Cf0lIblvpXOPJSwAYfcZw10/
	tDQzHs7c/3UdW4FigjpCNQ8CcQshsy+heB/uv0I+MhrPC27bPASijXqkELSjFdorpZ2yaxFFBJBuw
	AKyPtc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMbu-00000001gvh-23d6;
	Fri, 22 Nov 2024 05:53:42 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137] helo=cmccmta2.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMaw-00000001gqx-2iLb;
	Fri, 22 Nov 2024 05:52:45 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee867401c20432-a047e;
	Fri, 22 Nov 2024 13:52:32 +0800 (CST)
X-RM-TRANSID: 2ee867401c20432-a047e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee567401c1f003-2914e;
	Fri, 22 Nov 2024 13:52:32 +0800 (CST)
X-RM-TRANSID: 2ee567401c1f003-2914e
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	matthias.bgg@gmail.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188: Add error handling in mtk_dai_etdm_enable_mclk
Date: Thu, 21 Nov 2024 21:52:31 -0800
Message-Id: <20241122055231.3463-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_215243_239761_93018752 
X-CRM114-Status: UNSURE (   6.87  )
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

Introduce error handling in mtk_dai_etdm_enable_mclk to ensure that
the function returns immediately if mt8188_afe_set_clk_rate fails.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 69a091dad..bd325dc71 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -430,6 +430,8 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	/* set rate */
 	ret = mt8188_afe_set_clk_rate(afe, afe_priv->clk[clkdiv_id],
 				      etdm_data->mclk_freq);
+	if (ret)
+		return ret;
 
 	mt8188_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 
-- 
2.17.1




