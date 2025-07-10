Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=; b=WPI8yZIoObm1wiJnL9SbthpBAq
	f8SvV3BHZUbG84W+wfBCVQSUfnWi/PIEOIucV4xfEd7Hk5ZqY/Ktz1FY5L+YySa9HIKsM7eBFXzZZ
	9asVHGHsqlgwv0ck/7YE85ob1yqTU3j5Ift5OzvwQhWaqf+6jYL8GjYIJ2pg6rBn/ANsYjHdaFtEG
	GxdSGnv+qZwIEjUSL53sOMnUsjhJ/xwZD/Pj/il5OHSuAPSzGukBz+u6Skc4rA7Vvyj0nGWyXTewW
	dpoxDsBjNMrmSe+5oXM9G+iJqdq3cZyjuV9SMOPfTWS7alYdoYSykbjeCix1m+LbO7TLAwTt3deGE
	qXraeKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwRx-0000000Ckyu-1Nmp;
	Thu, 10 Jul 2025 18:56:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqN-0000000CMfq-32sM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
	b=EpFBe7zHE83nUuNjVw+fBwl8DoNhe+5T/ftWLm2hRpSxFirzz9V2Us+2eYEk2CtQPXEj9i
	u+aRX3p9r95JC8ll3p0G5y6g6epJnVhfWdKViImzgqw6q8/xl62x5Ff634zJ3ArlsiNseG
	ePolvfE2gZznYaUs+BwqlrtuF+mC8o4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-zPXfFDOaNpCyl5IAxSNIUg-1; Thu, 10 Jul 2025 12:08:21 -0400
X-MC-Unique: zPXfFDOaNpCyl5IAxSNIUg-1
X-Mimecast-MFC-AGG-ID: zPXfFDOaNpCyl5IAxSNIUg_1752163701
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d460764849so390301285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163701; x=1752768501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
        b=o5U1gz0TFdcnV33tYcGvwD061ZuubTyNwtkpwxcnmLRhi/fwa2uNcLuKRUOn5WKgCq
         NvWbz8VSvwfrFlcZawcBIV+lkw4fPneU6fKSNDdSXL9irij/vJA2ylamwu1Z+O31Pjh2
         Emam/7rs1+XKZ0bitDbD/id6k/AVB75O86SpC0fZ6bKrGRD1SPiG441Zuaq30THBS1z+
         S9maJusKGcdnK3IZBB7aWP/oClHSisE1lg4DoFLhM6ohAFTYV8pIH/Zthy0282FPVrPv
         Zt8+dorC9txSoZ34kh07sZyKkrdjEjYOV7htk8ohdRS9ZPE+dBQnfcYlllK1CJlb6UhV
         yDbg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFIBXEqhDeYY49/MCacgIHAf/zvnIHtdgiTHp9Pwx/L09qG/Gg7CQGtzAena6Yxast4WecPBwvTyKH5mAp2Uv@lists.infradead.org
X-Gm-Message-State: AOJu0YxCVu7ceWJ8MK/aVmDWEklEASbnk2wU4uPVqgHM0ad1R1lOU1nW
	prf+3Vy0mI/e22KCCvwnn8yaUGXvgJjyj2nPFuRrBO0uTgJlgafu2UMQ6T6To4sRtDlxTuGdUD3
	pN4KrdBwQOdolSLSyzrdlEQTNxFkCEjj6L2GOtklSy45JV3YnLoIf3zKloxW+rI+Dqb67PwzCPe
	m2
X-Gm-Gg: ASbGncuN+iKGAaLx3PGGgVulOCi8zNKGOv8K1GbW8mEmwwNflzTt+MT1Mq9bIsWsWTG
	V3i7pQSXilFh8Mr63ilZo3GByuTsifLvY01H10yBI4PFMtRuMIH6JTWPxCpEXKfM2KXeOxAs6Kk
	l3lOshQ8+PDnPihXbg+iQJuPhMuZgLrAXri+waqGjfzC+OpQBcPpnfPPxbA76XXy5zlzxqiFh+K
	c92BLPURn1mz0wpvVMRCZ0DB5zXF0XmyqOzSt6Q0CGii/ZvmGubAm7aVLkAu1fhc8AJzj/bGQLW
	TsPW+XvaxmovQ1ukjuWOZXTuFdc+E+GzKLVcW/S4sdDaEjfSwtcz3sbbjpgj
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70247576d6.7.1752163701086;
        Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDRrDKWwpckJ37fdbyhC+PMLfUgyhQZCTV67/zNoDsc5Ut1ZyXEkNXO6Agbo3M33HxjAj7/A==
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70246876d6.7.1752163700571;
        Thu, 10 Jul 2025 09:08:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:15 -0400
Subject: [PATCH 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-5-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Sp7TBqvADBjUTdYv865HJDuwxPugQD7l6ebJ7mJAKsk=;
 b=QdRXZy3WXcCDAKY+nITPfzBZtQ8RpvdKNlvOltT6ZNVcwHEAkVhWAcnk2UBWK7KubiIjAaW2b
 RaP8yKzs4UnCzedb/XCmTGOR6M6qboXHNuqR38QkPjLse9NBJ4Rx33V
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZqutmmxN2gweX4Wg-Zr50a5LFMVryRcMWF2w3QSYuJw_1752163701
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090955_826934_2EFEC939 
X-CRM114-Status: GOOD (  13.48  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.50.0


