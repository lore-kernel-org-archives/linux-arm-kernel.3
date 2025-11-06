Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ED2CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzzoA0sgvtO6Huy28YTNePP1cZ5wFE7gDr3kf/Jxy+g=; b=ObyjLg5bmGsrg12LbqmQ0X0WnJ
	5VqV+7iTaYnXz7fnGsAWJyE/90E+gGeW24ZcqDTNo5Me7uMo4DZTUEzh2joLz3hfbcuWbm0q00mrn
	ZiZSzO+i+8i6HjRMSokKb+WqC7A5ccVYxf7NtHzGvdGQs9WJs7889ypri0ikdslFvcDd84YLEj3+X
	wSbwp9lE4uLSRzVmmQcCaYjOp/+qFPn6Dg1wZJLFtEBoZs9J4VeO4ScfozFv+ikGen3BcyGRAovFz
	gMxPeWQMwJ5kaUtPpnz8f5Jmx8gnOQeNpOKsSecvlts+2W8BnjLGcJ1fx0oVKl+4LZH6clm3eGSxf
	yYuBT7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NN-0000000GMw7-3dN8;
	Thu, 06 Nov 2025 23:26:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NL-0000000GMsk-2H5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzzoA0sgvtO6Huy28YTNePP1cZ5wFE7gDr3kf/Jxy+g=;
	b=h0fIbBAydu/MM+mjjmd+hjsTLZPoNedNMMoRC1ReymnrZY+ZQTeeEj6LbUPePaqLaJrmdj
	qvQH1xIUtV9mTxmaziCn6UFBp8fRRV11P6YTr28ow/lMk7MgRrwIaFItTOFHk+AGSKKWBv
	GMibajoVHLqeHqMm5Dj6FpOWRknlbgU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-TlgPpT9dNiiBu6ov3n8Gyg-1; Thu, 06 Nov 2025 18:26:41 -0500
X-MC-Unique: TlgPpT9dNiiBu6ov3n8Gyg-1
X-Mimecast-MFC-AGG-ID: TlgPpT9dNiiBu6ov3n8Gyg_1762471601
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a4c63182so5704891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471601; x=1763076401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzzoA0sgvtO6Huy28YTNePP1cZ5wFE7gDr3kf/Jxy+g=;
        b=Ln5thxzWrAmlfAxzg/bnnxaF66Nliz0Ib+oxCeWx4gvf5pyKYm6GVbUo94IcCqL8g7
         vyEu/sOWCvJIa+x+gj4BWCGC7k/ZZvPZsAI0cJGSLIxaRUOup8Cq2dUsCAFKxGQGFE55
         wB6I//AXmPpR3jfQjLUDRm/eMCHXMmvhAkaUx0Ort9Hw1qSIlHlnByojDFJJE/GOR7wM
         wIq84PY3Pxk/F1xq99m8wTV4WfeQlBjjeQoxUegnxeapGvqy5uEOLWonLnVcUwVqxpUS
         Yexz78tDbmVBlKGt7KJxaN5HKVAJdK53cpPL8GAltQX7MrL7JsNVJT30Xk4dfEretbMd
         A15A==
X-Forwarded-Encrypted: i=1; AJvYcCWSDawrk9ZdgpD3CodvboamJpYnFwDc69KgcfEHPciGi1e6gKQ5936CDOpBScNlOfaupg4UWBorBm9fP43y1+xy@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSFmOOt84r/yxVLeiK0Q5OJH1hAukmt6DEPf4YyRiIyjCS3Pg
	Z4BuuzgBjSGDTlbfBsRFH2Itho9iAoWzPRJCbusPaQkAnFsyWxUBWk696XUpgGqV2ItM9DTJbFf
	DsPNW2k/EA5hvxFm1F2hR0feS4Z0mKXN33jQ8bDH/VlotjHftGBFQQ/Och4dpTA0nnRGo0opRGz
	SP
X-Gm-Gg: ASbGncs1CgUWhBj0NzWZ9tPj/yJtwoZPSFyh4ddOOqWdISHEmoe9iULLiChbQphcTGK
	bvws7bLqYhRuz/XFw6+H9D91rLz9gwxVXiJizbd/4hiiNKo2ocaUXwvGWEQ+WVd7bopih8k9i5g
	iYINsyKZCOkTRiQyMpfXWz0xF5bVv0uyyEWL2WegjAorHkRP2mTLuweb+TsfJO5qlFpRznIsEOz
	Nhe+fDTTxOFsxIDruMz+KHpA/23K/4Ho1iQoT0rHR0Rxoq+oAe1d9F7xWvhCnWnDU6nvFrWMezT
	pkDTXI0tkaaxBKQuWX80UIZbsQIPNvmwhaAtrwXvE7Z/ipAaWrFhwdNTto1wFYNG2e1WBPzPQmT
	P66/Wq34e7u5IYvZf5jPaurfG9kfq1WMvMxx/iHE0BQ==
X-Received: by 2002:ac8:5e0b:0:b0:4ec:f8c7:228e with SMTP id d75a77b69052e-4ed94965d2cmr14670451cf.20.1762471600800;
        Thu, 06 Nov 2025 15:26:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBSY6ZC3uinTD+3Ty3ImTkmn67RZYU0qwyag+7rpP+kdNpFJpdcKxM23Wr/jw9wVVKFtdCLA==
X-Received: by 2002:ac8:5e0b:0:b0:4ec:f8c7:228e with SMTP id d75a77b69052e-4ed94965d2cmr14670131cf.20.1762471600494;
        Thu, 06 Nov 2025 15:26:40 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:39 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:48 -0500
Subject: [PATCH v2 RESEND 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-2-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kakNurIzgUJYDq3FSiWnwOldSD2Dsz8eAB7sKp0pFFg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RakLvNXLXp4dKGpoLGdvd/lA+kBXBxPQrUnzGDJn
 31ZbNPtjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYysYrhr9DBktS9ynMn++tf
 k5w20/RkIMMWe4YlR42kDylzcPtNSWX4n7cyZM6jjhVMr1oMFc86Lt7ee3N2m+epE1GRUfUfZDP
 2swIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LcuJqu-y2Yu-RiotWx4RX6TxYVu0vY2rnAN5veVbhds_1762471601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152643_658606_7FFC6F25 
X-CRM114-Status: GOOD (  14.32  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0


