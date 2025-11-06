Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4DCCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9L/sBg5p+zCSkuU8Rgk43t0p2SpxKRb70QYldBV7fzA=; b=hA0WRFmOlfAvrdhIpLKEx8RWaV
	XwhoWfzD8vK4d93i3AXhFcDElLJ1PKu+X3dMvNJPdzB3LMSTnufu8C96NGW8uym1A6rgYVilvU7sy
	lBtsSwwWgXqLGt+LZGu7OodWfbz4g4qrPdKbv1gL/hfCjJr13Rgs7Om5LZsyigLZNEHCE9/yJgyY4
	1WBsledIdhmhSRcn0frihWSxyxPGQh8wn+FSpS9TxrrC0A+rKkeSFLFna6qYZL6LsHNYZvAn+Tj1H
	9rQ3RtOvx+TPe7mHWT5dJTrBLdTpL+SEy/D+4LZrhdZfByYBVYshKy/PV2suTQRcB77T39QT5B9Gd
	FrkpBbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9OA-0000000GO3i-3n06;
	Thu, 06 Nov 2025 23:27:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9O7-0000000GNzN-1bAH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9L/sBg5p+zCSkuU8Rgk43t0p2SpxKRb70QYldBV7fzA=;
	b=Zmj4iNkeSToBptCXUw55hKCu6hk0VUnyp9FFPeTPRRxNFW7ECROo2Yr+IzubQNCyrYbtWU
	erMvJsB3B86QPKWOOM6cQp/tqGg1PvkCvPEkPBP0zmZ9BT+j7pDUA6ts9kBuCkdpLMsJb5
	VO6XLFcUUV15C77gIkWPGDec66L1c10=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-22QpGpxcOYe67jAv4WR4mw-1; Thu, 06 Nov 2025 18:27:19 -0500
X-MC-Unique: 22QpGpxcOYe67jAv4WR4mw-1
X-Mimecast-MFC-AGG-ID: 22QpGpxcOYe67jAv4WR4mw_1762471637
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804dd4acafso9004036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471637; x=1763076437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9L/sBg5p+zCSkuU8Rgk43t0p2SpxKRb70QYldBV7fzA=;
        b=Z9of5SRenRIw5uukTzWJdSGeBLwaKOQz3h4nf1lYdA1+qP5CRtUUa+HrZe+4JYQeZl
         29Hv3D4mz3z+k5cI9RDTyP1Iv2ycmEb4kSVkIcEaJM12d66G6BsQBT1RwCDoQ0BdrKV1
         O0g/LpGq60ey0DddPh5p4RE0zFdpplnaA5MMa1p9jVvxBlL7wJDoOgEiGvLXyOTkxR3Q
         dzedXP4RmJbxMJh7x+eWJ5XMhrh5j2hKvsv43p9+G8i2ZjzliHdrH+Swiizey5ypYgKi
         3rwOXy3D6x7uSNEcf6xht0oS/nxwlNPIaF6rwm5xyVi6XK57QYV4mdjNwvtgqV9B5BNr
         2OAw==
X-Forwarded-Encrypted: i=1; AJvYcCW1yI7JrXdUVzimrLgbS5pHCDhob9oStCIrz0rPJ88BJDLhw5d25GCcyKGlyOftE4iDb2x7peZOrgU0OuKnP4Zx@lists.infradead.org
X-Gm-Message-State: AOJu0YxHWtRmUCQL9O5p7qO9J4diX7iGqYSkJ3u4rNWx5t66g55WK4R1
	eOevXX81TCYf7W12RAJw7pk7AcNlyqduw/r+e1M5ZFNYZtcCFEQT9GP70Rk/JhVb+zofB3m47ch
	HzFogvI4/hAUAR+j1vny9VuUDrN50PRjxYzWGw7+D4KVXL6nsiH17lyjSJ5E74SmNKAWOmqK98u
	Uo
X-Gm-Gg: ASbGncsR784VXjfz6UfaNtW4tiIfXiewUXDK+dIy4/W+/W2R3oufVq9SyMKLOUI58yf
	cHT08ejnvXrcizekPBDuL0meZh+4aNVw3uZ3qjYCTc3p7dsjclgE4Bt6QoGE/yhfuJbVan6ij9E
	6rwSVJClOnpF8YOKxuFMeRDf7g44ZHPNbLZdGAxS/rvcu278A9D35MovkxlKeadTuGhp9dWyCFW
	7RxCe6P7MoHbI0a6ZzoLZMuJ0UXDLzb5O7DPo10BXla7vSpRmnQEFuXgor1UsWie40KsWq73v7E
	gHVAzlL8ci1ii12Rp59VpFTC/5oFw8M2GESbXEKyEQs8IL8WdOQAGK435eI3BKURi9VDXxw6yaJ
	Lnaqpf7Di+lxW7xV8h10XGxflSLMD/KQzZTBNKDJh0g==
X-Received: by 2002:a05:6214:810f:b0:882:2b58:af05 with SMTP id 6a1803df08f44-8822b58af3fmr5877106d6.48.1762471637086;
        Thu, 06 Nov 2025 15:27:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1XCrROxUSSUDeHa7EYXOjY7BlUSEU+1KN5k26BLJ97420LzOY9XBUmBbdolqjriVUn6gaKw==
X-Received: by 2002:a05:6214:810f:b0:882:2b58:af05 with SMTP id 6a1803df08f44-8822b58af3fmr5876876d6.48.1762471636685;
        Thu, 06 Nov 2025 15:27:16 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:15 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:55 -0500
Subject: [PATCH v2 RESEND 9/9] phy: ti: phy-j721e-wiz: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-9-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9iXptdlJzmQYbdsB4jJh8DRjbxMfRMBdZBM5EQuFpPo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RbO/3Cz6ImvwxqVjjs9Zh9cXkt4xi/3tFVrrZvCq
 FzoYa7RUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETctzMyrN97Xj/FqOTyx8Oe
 BVe/fe0KOWr9ZnGj8AlvNc/C2uUJqxn+p125kiPwTLJszq/Ph01tT7ZsTxc15DEN4BHV5fj7Yrc
 TLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXJFWPCoyYzH4wyzC8fRkYMHs0skvXNfm3VMYCSsXU4_1762471637
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152731_496920_60E0D5FE 
X-CRM114-Status: GOOD (  13.63  )
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
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index a8b440c6c46bb0c754845655f9c2c0ba6b435b8d..cbc98d4dec74560e6403fb899ebe2bb916440f45 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.51.0


