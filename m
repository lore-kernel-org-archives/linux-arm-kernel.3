Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E87CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=; b=zeetolp44YBrnDjn9PYprpsVwG
	tr0O6q6jvgfnCQV6U4VLMwqctFqenT8P4mTgl4mICvKVKGs/x6ljZp/6L+DwhKywtnSRu9Z24RtiF
	I2sj0H34DrOn01oGlCf0jmhQBQkpsq6gL5lhNyDQOX9q0qSg3PHSd7JTk9/EOjT+gPiA04Rk7dNDY
	EVWssQbJ0R16+lkki8YhC2dhCJLRj93gDFoaLQoZActgABfQjOzVYafBrXX1UlVfSJSWxwapOFkYf
	C50/TuvTl8oNr1YTDChNdER48z/bQDtIP6nJTM44eJTYJ70vktUrBYyOS/tS0YF48vWsd5ekdz63d
	+x6zz8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nn-0000000GNWX-2FcX;
	Thu, 06 Nov 2025 23:27:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nh-0000000GNNO-3uSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
	b=aHuex5ogyAVCnxbG0OjtGnFRuT7+Xvk4WbrIlN8BAurkRymqz0jrmT2FjFoDKxNL7k2JgJ
	H43qwrT/8hwKbSACRA955Y6oX6lpV4fDgzjYzbgy+t48Nwud0nKyFYgkh/C3pEM2jBj9l4
	jxhzECZnGGC4yiJGM59k/Le6JStTEJI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-1Er9PbRjNTSZMPo-Pl-N4w-1; Thu, 06 Nov 2025 18:27:01 -0500
X-MC-Unique: 1Er9PbRjNTSZMPo-Pl-N4w-1
X-Mimecast-MFC-AGG-ID: 1Er9PbRjNTSZMPo-Pl-N4w_1762471621
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-880441e0f93so5340076d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471620; x=1763076420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
        b=njJK25l5SRLK9kmQb23KRyVGUbdFspf1SUmmkQQSUHlD95IRfcGgS6RDMnIRhDDgmj
         J3L0Djn42HisE2/DnEuVcPt7yFmyRFIngEB0U+mgzHujbG3WYWee/E77FfBsl1terQWi
         zih3HBPon7GEllt1/2U/AMM65wyop3CLJVfqnCER1E2p5LWLhNJg3GOMcePtIVEH8vaP
         z546MnRR4eJy0qjGh5GnFJ//TOyjn3gI8W3F3Lu5c2Bz1R4B19E5ejkO49j4Oig+EUZK
         1cI+vA7FOuCN6IQAlGV5DsHQdEEGdjRTfMBiMpXsOZ6vz5gSaKVaimFj9uO6YguwDAaJ
         pZZg==
X-Forwarded-Encrypted: i=1; AJvYcCWVBDekvn6c1Zjldxeilp5ypLgi3I9WGuQ/VdMcW7TFtMQcQhpNTJfrSyw7btPZftgnKTK1yRJnHfeeP87n+3jc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa7CteCzi64SaWiShQt05noq5IwUV+B8tkGYihQ0szzGNYrVL2
	yLsngANsnYOpvttFI15lwZjB7YK0nO0ZDwhMPMKDwMRMSlAZHxaIjJdBa4xMmSc7EXIiZ7CfHDu
	5gcWdQ/9EdlXULdG4aaNJy3F2dena/TY8hLLsjg47cBULc3uz51j4DHOqfRnewzRqeQatfF27Q1
	ch
X-Gm-Gg: ASbGnctAZMvVFTGh7aw4o9/UDMPWEgc91bkoN3qbRrcbam+PrnbQgzLmw3YJKRE/Cl3
	l6HOroevbBRlvfsXQkM4pd3igqefFxdKC4PtCQWfAUJve5tiD0RfXORwB/pvSXU0t/FB2/rb5dN
	RssWxgCBo7L7rQ46dnT0TGL4opCn1ld12YPpbCHwS6fTSaDCow6yeb9jem0YzpDpEDImGVoNrfl
	2WVb3UMBhYagO3OzY9/jv+n8Taq7cU3nZy0e77UsHwQ6s2f+A7dqigjtJagixt3snqNGs25OcG4
	nzQAjzjsDW7vGQU5Lp6016lh8gLL/ESeUM7JaaGe7sn7goCaTnLF4jbjBwNboKMPZFZXtHTk6HN
	oWkHHHfrCA1qNq6nEXfvjP2+lb9h8USsBY7Ng08aEkA==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id 6a1803df08f44-88151e4bc49mr17960406d6.2.1762471620708;
        Thu, 06 Nov 2025 15:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtHpA4COaBy2TQDBCCELqXAf0sfk+lQ3jKjHR4cm3lLWRVAj13ngGgT8ax+bpg/JoDlCOeww==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id 6a1803df08f44-88151e4bc49mr17960216d6.2.1762471620343;
        Thu, 06 Nov 2025 15:27:00 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:52 -0500
Subject: [PATCH v2 RESEND 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-6-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pGum4msvOB3xDDFVObf0RbWafZEF5jMmYiXTVfgLr2I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RaqnVC7xubvIvpuN3fZv7sHddmfyK78rtPpal0bY
 a34zmpPRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM55MfwTzdcOk1ownJ5dj3F
 lEqP2+cWf1utHLvJU8rLrrGyvaomjeGfmciaJ0/c/+l5/550WeiIRfKndL0k6eYkX0bZkg35Iam
 MAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fvwaoX6VaqgAgISH9OFx5C_gPGcAbg02lCxzbVpdY2c_1762471621
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152706_085425_9E8BC7B9 
X-CRM114-Status: GOOD (  13.80  )
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
2.51.0


