Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B3CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 00:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=; b=AQ4HX1G+3/5AALgBOvvpYZSj5B
	zuOkUompOpSub3DkDEn6pOMtXLWU/74GvQdfbr1L46dcNpbOXYYfhrB27zLLgvM8TGhscqRYKj+V3
	WpDGi+NA6LnFOnvvEvxaEqtTOIYjkgqrTLQJEwSvFsumTrhLx9zCf/P79UAqczc8nqBsW6eFRXOPV
	4EeNxAUxbzLM8bSSDCtBDPpYsx5OnjohO1uwTT6pTocBH7M/Xu/Xm5eKu7pmgoevAcjXw/oTWO57L
	XiHhCHb4uMo/ZYWulPelpvN9Lz0N6ge5xpsxY1Yhz1M/NiuFO73HmWO3U1RS9tGOlk5xi+BcM3wlt
	lWr03qHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTh-00000000LRa-04FO;
	Wed, 06 May 2026 00:51:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTd-00000000LN7-0X6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 00:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=;
	b=Q0cyg3XDJfrVTIKb++Y2zjJYtHyznPNWM58zLY70OOIi9Vydrj1BWPVI1wDWsq7wmRQpER
	Eqyb/GgnXHB6jS5IkIHtKrnd6PZuext4GYsFJios1gxEYVjHgTe4IkJYI5ocXEKgPAdR0p
	5Zz/Lo7av3FPmEuDtGNybtdYYxnwAoI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-uMUozAMRMJCEsYZS6yoyqg-1; Tue, 05 May 2026 20:50:57 -0400
X-MC-Unique: uMUozAMRMJCEsYZS6yoyqg-1
X-Mimecast-MFC-AGG-ID: uMUozAMRMJCEsYZS6yoyqg_1778028656
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eabf08affaso1646762785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 17:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028656; x=1778633456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=;
        b=p4kJwkyQfVONG0LZER40FvYXvBlSqog66zAGiXe4hO+R2T83lYL+YS6DUhSe9Mu0N4
         3myS/tMBX2p/Uy8ed+xz1mDb2D8SiiQsnkp1Z72nYxMz2e31yGo38KptG+HdDvQkklJo
         yjfIuKJnxN3xmsJ+CN0teMPnHKgCeCRaIHeNHJR9/Lymeg2QqWaJHH8XMqhBPiUGg1TI
         +BugmBbo+QZ2BapTy/+HbPJ8xZ9KReswckXH/WSiZIQ77qQjMfjrLDQndJFNRdELG5ti
         715I2xMhG31U++Xkf6MtXxBImNxlRRm25NLRpwj3c7aHJipXNxpkB4pCVWW7oPaNRAjH
         1mkA==
X-Forwarded-Encrypted: i=1; AFNElJ8oe2Y9fZV66PaPxhG1p1cGueoZscoJeW15AMbgA/jRxlhxTkioZRGI7qtu9H91fdNZkQ7j/IOWfKdcl/NoC6XF@lists.infradead.org
X-Gm-Message-State: AOJu0YwGLNc/hr71dsjLbVG32bMia6iqGj+chhQBgPIxIFyBS/3syHZn
	rqN7aeA4QQ+B6J+o5Djba7x06fCLkkcn9/hj8xKWPzXRTOOREhlysitaLRAU2+3/vdxHUVPS0SV
	pl50NcZN0Dh3aN+ErpM0cPNJLOjhorXV32cmlGM9lHrRQZo79AK35RhH1xNW8nDeRKHxgtANQWC
	JW
X-Gm-Gg: AeBDieu0Rlr66pwiMKI8dciosdnUggUm1P7oP0k+nlsS4b/baNoz14dnAmRAZLiuhY/
	i+T/LD2wqmzp7RpMFUev9x/v95padRP/Mk1YaekiuI4reWr7a3MzdeFtF4RKqnFcL3kDzZPGF2z
	SdcxXGLteXqr3BZ7kFuyYu3UdE4mvuLPLr0sQxZelwflfvygSTRGqPwvC3z/lV2x7EWTroCwkQB
	6RMwgSB767xprZaZROczj3X+geJ2TEDh6Nt6etb0HwFHZi8SOo+ekV3mn8I1tXR238o0FoGnwo2
	9sdugihNoUhplMeUs2CDUuZkSUlXDq0sKcO5qB4CtYrZ0+TKCRhN3LUwDBYuYhjzLMEUbh574Qg
	X6MF6ADdFMt4MDuUxmHD31ipR560dtpPwzmd5cVoCNealQRLUBeVA8jQb6Lt2tnLKcfuj45W+
X-Received: by 2002:a05:620a:25c6:b0:8fb:1acb:ccdc with SMTP id af79cd13be357-904d63e78b9mr222382785a.34.1778028656507;
        Tue, 05 May 2026 17:50:56 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:8fb:1acb:ccdc with SMTP id af79cd13be357-904d63e78b9mr222380485a.34.1778028656127;
        Tue, 05 May 2026 17:50:56 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:09 -0400
Subject: [PATCH v3 13/15] phy: mediatek: phy-mtk-hdmi-mt2701: use
 clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5KLGvHQlEx3HE68FkoUz+5ZZ08i2Z1EHZbkA0AZsL14=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfB1aTIvCTNPe8TLm3/hGP9D9n6D3amfYvtPcJjkr
 riR/PZdRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP59p6R4aV4g7mhfH3Mhwzb
 Hf2bsn+/DQ761rkr/csdu8XbuHvjpzP8z9H3ZLl1srR7ccoTl3XGsUUZl/W3CIisyCwKOXhSlJe
 VHQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mqSfaIYAa7uuskFFDKqBt3K1hlnIgCo9Lak5WaQ-UWA_1778028656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175101_237615_85DBC688 
X-CRM114-Status: GOOD (  12.29  )
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

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index b0b6497e7eed..c9a1f20e939b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,12 +90,6 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
-				       struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
@@ -170,7 +164,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.determine_rate = mtk_hdmi_pll_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.54.0


