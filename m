Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17206C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=; b=nfa9Zl2+KwtMQ+hAHjN1iM+wNO
	NzSlkHI6VCJn1hZZRRMzXfiPISjkSRB/WkVYdFLeKYFR3INSYctc5+f7+NFr/dCOFmbNy4wJ9KXYR
	M3oSDXSJoGgKseTZANsUOFHIqm1NTM9V919q+5V6NJ+oFGW3WOockeSe+tZ+mgMtOqwq61mbEeNeR
	n4hMXYkJmfvnMFC49AsxJClQzyaDHg4MYGDGinUzC5Zx5k4jV7JDejFjZCLCgG6U5l6lZRlEbcESi
	Fap3QXDoMGBwSg+xeM3DyEY+GnF+syM3jRwXgeDyGFNJmuS3BEsxFgkrePk/U8h3MLY8fWUxZH01/
	XIB+Ixsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw3V-0000000CiKO-0mN8;
	Thu, 10 Jul 2025 18:31:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqM-0000000CMfV-2SKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
	b=LduUY070A6EFqn8FhF4TGYpCUukvHqnM+piSIPcHXdrpPRSWU/iUaEkmBN5sJZHAu3uNKd
	u95GAPjQEkQ7ATJpDX/01LFC0l1i23K8Ao5QADbTNHK+3t1W3nbDRMeEkYF+EuHc1kmFG6
	xfOHRmmBCVuTVhvOD86IU/yUDcNOPsw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-e9H1RESEN5i_a7xHy2amRA-1; Thu, 10 Jul 2025 12:08:24 -0400
X-MC-Unique: e9H1RESEN5i_a7xHy2amRA-1
X-Mimecast-MFC-AGG-ID: e9H1RESEN5i_a7xHy2amRA_1752163703
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so201675885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163703; x=1752768503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
        b=MVZnCg63q3Xi5FqPwNvs5bfwW7OfVCD8ET9edAVwf2W8HqmWPkRb579Pa4E+Cncrjq
         7b8zBTEd+tTkvrwNIaiy3Ynb2fGmd4rAdt8HGKImKsUorWgfJjfP/lXl91puhzcd1n32
         jiKnvbQnLq17gMjn9gaQnmCRuyxlPicFmoupZ5AV0peITeVXUzKseWs8X188ChEYX+yk
         R85z4CPi2LsFVVu4CNNZD95p5v1ym46b1lWNohx3+I+tg0CMrqW/gaqLk7bOo0Z8GykI
         AD1erxA+U87ECOBShFQFUSFXXRSE88HXreoX3SKrknJo/t9/0GTCYKfcaAAluBYKpEv7
         zSAA==
X-Forwarded-Encrypted: i=1; AJvYcCVJoCqwYGGYsoUEqc7PYy8x+RWC1SArvOqTI1N9vlyAa+NUzWfwIgfCnlSEztdNlR0iB3xACVhL3gn+Kjc5JKXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzXmYmsP1O7uhnKnWk+y4zcFtQ+X77Gjx36mbjEzpcd+jAllDFI
	QyetwdH1EaiYy9C9aR2nn8bzPlounanddkv7GD4UtzAKzbZE/aXAY63PeMzKURquF7eGEXb0UAW
	wg3HN8qeXoRYTJdskTZC9O/nXoNH7OPKLSjVXRIj5RYaXjVTeWkOT8PG5fDmQPDkLZqymefV9T1
	uB
X-Gm-Gg: ASbGncs4wTc9iORZ25yoptV8kbH813MBFrtF8U4/BvNCkCQxJGZemWmKA+h4bZFEsyA
	6EzecJRwJzHkTD75cmItI4wJyG/1BfIOkZgtjirS0dL8XCr0tyX9dvXXx+TyxAzRbu8n6KrtcAz
	uGKutlRSFoLMTq5GOrVg1uSKWLhf1gl2a0UaELOa2jVz0qbqIEwE39g3xddlttI0Oz74mJ4tb6G
	D4mIFWVLJEFtJBzoRNovWlduq9Yv39LbqIX5kn2n0FuXuC5IdGAI3g3qScx40OJ3gNdDVpM28V2
	LbAdKADlnZNigJBaiAwPAZQpUG7pzp49OWnOSdMYKm+OTqlaAPginTI9ql5A
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39030326d6.12.1752163703085;
        Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCZQ7W3y8kThWl4w+CnUCECNX6Cyj79KFh3PeC/HpUcHl6P8QBnf3iscE4pNrdpapav2INA==
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39029866d6.12.1752163702588;
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:16 -0400
Subject: [PATCH 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-6-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZKlsIvlM5HHyda796a+VTO47/qeucu/BCMXwHXG/S40=;
 b=+r3EuMe/pzh9qF2oPdX67HS2VmnZ350abewNM1edJtWvBPtHINXt26quhidSdRFg7SeVLEzsu
 YVJmnDogbgKAaAbXcN1nbXJrSBi27Fk+BJ7qXWfiPpZHj+x2CtpRepu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2FkuKUl4oVplr0MDc_Gah4ewSl1g9z-sW7ioXZylp2w_1752163703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090954_690663_E2A4EDEB 
X-CRM114-Status: GOOD (  13.16  )
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
2.50.0


