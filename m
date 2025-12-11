Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150C5D43361
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=; b=hb+Rvi64yzPfJvS6+JjwsmpXkV
	zF+dq5zIJRDCae8L6vb0O1Z7d/gjAMG5ceEl7Vz0s/9Z402yKgTHV343ean6zzXzQCcSHAzQLYOBK
	M9N4QAzQQoHAGcDUcDV+JWZsGQUH6r3NpFrWI/zxVcld22HiP5dOp8XbliTUU6cIsgieclPwKGaGh
	NIyHI757bGoJX2Edw2IOHWZrMVgrEpU7Uhru1cd9Q5i2YaGprgZ5eL9FBn5d/LVBmmow+kLhHquGi
	iICF0JvdjYy1Ii1g0k310mkqcrv2TlyN3n3gP317+Ro1/T0b681/gLDz9lwsFbgEydg3KwpXmWEZ4
	w30G2ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpue-0000000HP6g-2hG7;
	Thu, 11 Dec 2025 23:17:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpub-0000000HP1h-394W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
	b=Vas+cyR0S5mrE9XG6GX6NfDnCTQqwqeu+A1xGcTny5+2kjJFVpgxxkU6zAMMofdkrS6zvz
	4Fs2oVWYARz+DuKGjol5kFKI/RSlQ94Qafm++lJzuVRsnBgy4/OX5L/uLyKZOb7TaMZIvn
	3Ir9gwtXTvmBtDx76iGrXjbnJe4Xcio=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-bLLG3qcONzqlXVUHdoi4MQ-1; Thu, 11 Dec 2025 18:17:17 -0500
X-MC-Unique: bLLG3qcONzqlXVUHdoi4MQ-1
X-Mimecast-MFC-AGG-ID: bLLG3qcONzqlXVUHdoi4MQ_1765495037
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6a9c80038so66955085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495037; x=1766099837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
        b=naNHALrHvJ/DZASzUN4z6qt9W94M874pMQ5Bam7P+hZ+sMFIL1//ufwkPX2MNjObH7
         jhfcFYK6kgpg4QcJhvRtgBIKPMjpdH3ErbSSONy9B9OOHs1l148kDOsG/Ih6tVJxI/O1
         HbhrS+OnywZyBaMpxS0vmeZw5IbFJWTWpBxOyiJC2Gqt/crDSdtEBVe1z67m1frkBm5m
         Z8fgHIYNHEWsnT1kdzH/htZUkKQZlGv71O48p8CL+ZlDQKUBV7AiOvbTxgMxQiQEMJYJ
         cefwsEGwKE7CJB24vn+kdYps/mZfcnlCl58crLOwrcYAiRRCKVcM3wQRLl+55osjxl+J
         BSow==
X-Forwarded-Encrypted: i=1; AJvYcCVzRojA7/GA/z4+8asNWkXtQsY1qeUNtPFvUFquTj4fjaWDx8Nt0SOICmiB9uS20v0eVhjkndPHqK5MWZb8y9Ko@lists.infradead.org
X-Gm-Message-State: AOJu0Yz04vRvsE4QwojNUU8Dp4ZJrqApT2ImxKAZ/0ZEGLcUz22/YV8d
	HXPIC0JkWnFQ7QsVRc+MizVQdvKaomUiAaqewWuGXE8fMUT06KjkETdGozHVgI9XFTak7eRYgc7
	v5II7bWvWY9kUgpt2sbkagxj23KD4k4lncDeVn6QCaOdbqdn4j3nuGxuS6KKwvVU+DDfeDxDmQ0
	pe
X-Gm-Gg: AY/fxX6fn3n6Uvctv1fGgAomwuVITrmIoUU2i050+h5/cj+UanG2Ki9xjAjKzexGWZF
	wG7MYs11hy9FqLg2S1lKukJV+/8JKXMkfaoiqYeIWqirY/mAD4KuXfn+MauZyT2LXusf1q+7+qz
	KlUg0An+JeSX7nI0rD0mF8C/jWm9VvZc5jh4KOqZDdE71XR+WxJ8c5ScWRuttUifWvCxnfb2mJo
	PQTSb2vGzVHTWvl5TmteenN52CPLvnNrY5RC0HV5OXcs18O3t//Hv5nFGjXgRxHLLPEyaddqacO
	kxeTrkeHrMRBhk4MPJr5ukbNsDNTgXT4uu636d5WEnZQP4AagkmXahk9ksz6XbNjgw/H+moWC5m
	+1z6pSY0B7+bZb3DkNuuK739RPdSpSpfwgF2b1z4lWPCKh+j6SuBaJQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37437585a.52.1765495037262;
        Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb7AhIjE8zPjDhJfU8aDdJaYDnutBjCMxlmV9mYKDpi24B9muU+pgkYMBUg4HwaDmRYFGfZQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37431985a.52.1765495036753;
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:23 +0900
Subject: [PATCH v3 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-5-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vrNhEauHRQ5KoNoMMi9AesnXBPWl/Gp5yOh2A0W6gms=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4JBrssMboevWX54tAvj//eOnz+u+ekf63rRB59E
 46P+ym1raOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ7JRhZHhdsj5E7aTq9jcO
 T97sYPf+/rX4c86W8toYzZ7TW7mNTd4zMqwJ9ZdIXKvRpntlr1TQhxi7aRs/WWw1fXTt7j6W+l6
 mubwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: onnclyBXPix7aYzD0DcYV_KdTDfFyWWXMWo2ZxllHkU_1765495037
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151729_903848_A3055192 
X-CRM114-Status: GOOD (  13.13  )
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
2.52.0


