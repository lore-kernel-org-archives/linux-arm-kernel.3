Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B01C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9QODSxvF+R46IKNiNj9Fe2/45UFhQcx4/GxKexQL75g=; b=NnkP45K3DpL8QsWSqCmxAEyLHF
	QKbdycU0cdr1wUW/U2T0+YxPIPbEsMn3FbF6Yss2O/ZiLWtVlwvlH4ytZYR4hBdAkLBem9MIQTwKb
	V9dw8jEf/KRXc1oIGRW1+zjfVvw8at+xtezB1eQJXJkN3X1yWJf/NCRLMzTUjflqmj1hpCvqriHKF
	jehj+J8l0VW0EDZMJ5h4dAP3iuX1QuA/oUf4BaRFpHBo4poIAK4Fa26lD08THiLqX2ocHulDa+HVG
	iGxNBIJKo4AdQ8yEvPp7y2pYF7Cqak4C7iWNSfUwASFYqzeQLYlfl+jbibKgMGx8xj32RJh9vHfDu
	oo0BpyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJ2V-0000000GyZC-1Sq4;
	Thu, 16 Jul 2026 10:09:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJ2R-0000000GyX8-3pQZ;
	Thu, 16 Jul 2026 10:09:57 +0000
X-UUID: 77ac20b280fe11f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d3711d46-4afc-4338-ac37-b0cb538df76f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:cd41769162fe44a8f4903991eaa13158,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 77ac20b280fe11f1aa26b74ffac11d73-20260716
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 220007818; Thu, 16 Jul 2026 18:09:44 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
Date: Thu, 16 Jul 2026 18:09:39 +0800
Message-Id: <20260716100939.1381759-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_030956_252347_D22567BA 
X-CRM114-Status: GOOD (  10.44  )
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

meson_card_reallocate_links() grows the DAI link and private data
arrays with two consecutive krealloc() calls and updates the owner
pointers only after both calls have succeeded.

A successful krealloc() may move the data: it frees the old block and
returns a new one. When that happens for the link array and the second
krealloc() then fails, card->dai_link still points to the block that
krealloc() already freed, and the error path frees the new block too.
The probe error path then calls meson_card_clean_references(), which
dereferences card->dai_link and kfree()s it again, resulting in a
use-after-free and a double free.

Set card->dai_link right after the first krealloc() succeeds and keep
the resized array when the second call fails, so the pointer always
refers to a valid allocation that the normal cleanup path can free.
card->num_links is still updated only on full success, which keeps the
cleanup limited to initialized links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 sound/soc/meson/meson-card-utils.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index cdb759b466ad..38c1b2ae227f 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 	if (!links)
 		goto err_links;
 
+	priv->card.dai_link = links;
+
 	ldata = krealloc(priv->link_data,
 			 num_links * sizeof(*priv->link_data),
 			 GFP_KERNEL | __GFP_ZERO);
 	if (!ldata)
-		goto err_ldata;
+		goto err_links;
 
-	priv->card.dai_link = links;
 	priv->link_data = ldata;
 	priv->card.num_links = num_links;
 	return 0;
 
-err_ldata:
-	kfree(links);
 err_links:
 	dev_err(priv->card.dev, "failed to allocate links\n");
 	return -ENOMEM;

