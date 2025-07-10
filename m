Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=; b=SH9geay3o8zM5l49o1BCn6Hbr2
	N9+e89EVaL6+NN7aJYNNUWziKYZUj3wfQZ9xiX6RHX1QNvinFNuE1UzDM98U/cLcDCMPoPKd/LZO6
	52UZyjeVFz+q5z186Id8YjyvAso3cbk1LYOUOtMu3HXdPELeN4uLsPO+odjFn49gji7Su2bok0b2Q
	IrpfTPlpVd63n2tEYNNf3Gm123SqrLMLLo58iKug43jbh1q7v1JQUTXYCJjKACF0PvqvGhALwcHJU
	UaPGWTXusQ5vZPWmri3528wVYd0t0ZYLmafPgrd6/YcLMC96oAt1O48ZWgCaVvZRqeZ2Dv+6MOVLB
	LhTvOc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwUF-0000000ClFb-1fF5;
	Thu, 10 Jul 2025 18:59:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqQ-0000000CMhD-2WV6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
	b=WVfWDZsVYJinTfVjB5wOiPSoUoifM0ej1UblIAevhaPJITtXPb+IXu5P/KyH82tXK1Svzw
	q62NlNAywG8TiXbQxY5Y2iI4xY40Lura9B8mXR9KmBnGUtynpPcGD1nHqVDbHwefWjhKkj
	1EZjKWLi7IcmyhclSzn9B/QMa0xF5JE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-cUbsx88ZO8GnwUW72RhYCg-1; Thu, 10 Jul 2025 12:08:32 -0400
X-MC-Unique: cUbsx88ZO8GnwUW72RhYCg-1
X-Mimecast-MFC-AGG-ID: cUbsx88ZO8GnwUW72RhYCg_1752163711
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad9167e4cso20793296d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163711; x=1752768511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
        b=DohIJWyOQ32SE0DIuq7PT7k3+j28pY70N09oOmE9Gw0yCvTWk0q9BWOoXHgwOrz2PE
         hkfnfNuCyyHsUvwvzuqgTiGcYXA/hXJ3eq+J7Fa8OzhvtuHif186S3zhwO4qOn1QoDvr
         pDw9Q23cIXhh8MqacA0R0/Kc0F2Mg4UkLqwW9gXt2wRa+eJCNcT0nnE5JDaqoQLwQ7In
         rAM08HBFwgVEYE8fqV0SxC2DbP+QvzNawzD2JXfQyjzn4iHP7Wl+gOFf7dPq0L3VDYZc
         LOAau+bfLqSWLWkcDj9hOXQR47RuIHiU6aoUdAiUVvsUZNqV73f8c5YB3mWbscVbPmvZ
         exKg==
X-Forwarded-Encrypted: i=1; AJvYcCV24LRebNk19uEeLUWmpur6khE3IpnDidtR75Ml4qUsS8hi4f/a0unTbQV+L14y57Pl5fOFb/rArUVdHkonJCDh@lists.infradead.org
X-Gm-Message-State: AOJu0YxWwhcj14Gy6u1Iy9iClFo7miL59gnNqqZCkW5Zuegymm2tij7K
	RryEuqZ9wtCuerSAkCZE1XNzrMmJXS7vARAGPWQ3+9AdMI68fSuCgQKrX0ggiPuT1RSMq9gfKPd
	nAu12B2WSKkBVL2JvhbGXTv3MH5pYeXoXfwsLo8G8SdAKbcpqAj8m1pC9VuJMlF9+DndKuCkddO
	tF
X-Gm-Gg: ASbGncuJjgApyTOk3B5Q3jlBNzv2U2ZpWxD22mxnxE0tbqyPeZoYqf4FQkgh4Q4kqd+
	TJhnYTJrDPOgaTd4A3SuB49kZphNf7ok+nP5i9+MVR8qSXSKNan0E74TSCLmyDYsJrggA0L/qBd
	LQWlHYw4ehgRvmq96RQ5opb3GPNuc9i9VEgt1fgcSa41qaGxp/bspzXq81J8jrdLQsDCL7O4Eqc
	guJp7ls5MgZQ5hseNPCBO86yHbvOD/3iJE3FroNBrdRJqlzPZKLkfAMVxiFhOMgXRdKl/f1wM5r
	dd2QvbQyS0EE3bA7ccd75+j3nZtV7OPcHtc2YVj0lSP4ngwOVht68GbwJROL
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38252326d6.33.1752163711105;
        Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlqOGrQN8krksQLxHGl7XCXnHCMvXuYKuTeyW1zhM5hweEhYitnN6UMrP83jETXzN/T64C2g==
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38251666d6.33.1752163710538;
        Thu, 10 Jul 2025 09:08:30 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:19 -0400
Subject: [PATCH 9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-9-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pMJI6s5tTYu1BzJU7vvw5Y0iwaNTd3NH6yMHjsN8/cM=;
 b=0nPrE2c6cl5ohekNJUp1MPpsItdutqAcWnGrmBosgKM0YvNyBYPz4zo1bZfpAq6S3ivaSbkgi
 TWd7oICIP84Cvj784x11Hev/+JYsi8/Mx0kVOHPtXnwdacpkl9MVEHt
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AcaoqETX442eRyr8WW4dmnZ_gqysk5n2M9M_GCb2Pjs_1752163711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090958_721071_9889831A 
X-CRM114-Status: GOOD (  12.91  )
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
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
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
2.50.0


