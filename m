Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B67BC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=; b=Rc2HPrpJrDO0pac9S/CvEobk/s
	MqmhCO18W1eI7nSOcWxhO5qIZ4l1WSRpyiQpFYePQtptjLsg6R2JfruECoOdT9Hm+YcBznuZAWPh0
	AiP1X7HcMR7+XjlYdFpyZi8u1w/fv7MLKTOjiQtsy5JdCEXzhmLeuvmB+XsU5to3E7vxys2y6ToKP
	YHUGvmOI8+ePhAo8gkSBB67Gy4UPWkbVS1Fia+KuWtucfybSfbJ8pWorSW/6ZicnwxjVPWm/mMCGw
	VWZJNBfDmEEU+LHlRqHnz7c0Adz7KOhhcIMLZnY1xHFzw5Q6yx+IbeaItigG2D6z/8EYMK5ZAAhQK
	rFEv8IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF5V-00000006A8D-3pmY;
	Sun, 10 Aug 2025 23:04:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEoP-000000068Cd-0Nuo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=;
	b=GCNb9DtDQZEZiZxY11qWu8YIJIJVxhzI8urWBMzeoHU3oxDp0c7PR/qIPodhu/KFSPg3hy
	Xo8Rgq5NyKjnfMTfP2yLe8FRK7tN8ySZElun6Zq1jIr9fu5HT9y+2bRSN1eczOZLm/8ZZC
	80uK1UwIyEMJuFX19J8eYiYW+yBjFqY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-FRsZxclrNSyOldDe734ZEA-1; Sun, 10 Aug 2025 18:46:43 -0400
X-MC-Unique: FRsZxclrNSyOldDe734ZEA-1
X-Mimecast-MFC-AGG-ID: FRsZxclrNSyOldDe734ZEA_1754866002
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af2237e4beso90489531cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866002; x=1755470802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=;
        b=RJW0hRxx5oHSp2gRoqLK6/Ok6NnHxuZHl3Ho39ezcmyB6sEib3D4bMfvOdcPohuiTm
         JWgwYizI3PXRvfFfIVAKip3RMjQOj+8G5k/dZAfnRup4M4zYe5o67VE0GX6g1wJlLbMz
         4rKTVc7lhdVsJmqPI7t834k3bYpt7xMOqWpStJEWLwMNog7Qsdks9j2zz+LmxN63I1Nv
         1aHN3WLo8A6SC0H4f7HW/O098KsqOuwyECCG/qO0sloQdXxzRNx1y+lcpXuxSRXH3aIS
         tayIqE9j03PHuSGxR9z70d7Eet0QJXz0bmQW30oT81qOwJfiMWdOYJq4zuSRgBTL8Vhb
         hw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmnmWNbOecOU0jUnt6pZDhk5qydZhl+FAJza5DVgrLBnfrgaTbZjDY+3Av4KiXKoQTqF5te1YmBFXgCT1AU12U@lists.infradead.org
X-Gm-Message-State: AOJu0YxUHwdgUJr3ys9OpMeJwSBu9pog/Q0wojGO1dGN6SuozBBOOYFx
	MbrROTSzjLc8Ek3gOAeK6Gw+IjdAxIdgbajTa2vsk/pWCxGoGmGNXhw02YJcDAYSOLUQhihGTQ7
	0Md2QnSTrN4Ou1SFgIlqxyAOeuTzyZvOAfKI6d+86VXsdMdWiNMcsXHEjMZDTHZz/kGuN35ichP
	iF
X-Gm-Gg: ASbGnct9xUf/kDafRhGoOLyr3C9nxMG9drFRd0k7L1StMyR5U+4KU+GKjXIawxhfDG5
	nB79l6RyQQA+TKwzj4CYyNJKKhFNpOR4cKQA80LaJh3S4QWxwSHzq6X8fh59hRNohN9g+zaq5Mc
	2CJHIlqKjrYXX68JX0TSFYULqO+gIKXH2TPxflh5jxcOXDXHqaZlt8SRpx0VyO0Z4Sc9ZONxCcu
	isCnI6F40M+yfeJIKnvqsmSLKJ/maa8oR2deCluwRZz2AI9bdMOI9pemBz1l9fUmla18+LA4a6C
	H+/HgGS1ZQ0BGWs3zaV6CRqJrKXJB54u9TFKT3wdNAzX4NwtgGAh3aZmqmQly4oqsoCKR2ZJzPl
	00v2dXQ==
X-Received: by 2002:a05:622a:1487:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4b0a06eec4emr195091091cf.5.1754866002599;
        Sun, 10 Aug 2025 15:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh5lS/n97PBNJSxOrFycNhagzbIhlgW9qQ3w8XV40W5m4XhN8ds0cjQ0NNa80CSmcd6Go3LA==
X-Received: by 2002:a05:622a:1487:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4b0a06eec4emr195090871cf.5.1754866002209;
        Sun, 10 Aug 2025 15:46:42 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:34 -0400
Subject: [PATCH v2 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-6-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=tcM4xXKkkn7MFiutyaRVfeJ/7drFohogN+jyo8wqt4g=;
 b=q0MF517SEn6EZmLxnbXxB6XM3YYpy8tWmSgApsuH3irA3Q16tHw+AsuYoggeySatst9jw32Il
 A73zaG5FOWFDy/zGALRujdwgvPQdV6YkqHRZBcR/ePkMLWkrWepZFcj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PpThs-itAsUASDhtWh50HYqTDwy4-Rymw93JSbbdv_k_1754866002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154645_212891_DFB01D44 
X-CRM114-Status: GOOD (  12.75  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.50.1


