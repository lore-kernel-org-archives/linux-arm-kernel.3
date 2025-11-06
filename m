Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A95CCCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=; b=w4q92TU47E07k11aAjd/HNeYJI
	HoYDlbpL9E3YcIr89+cLhreO9nC7p0H6vocf3W+X/8foUa7evU1Y+5v3RKSOuavIEXLQq0vRS0OsN
	1Dd8vVPF9I/WIRvfXVS0oDa2tqcEzs2V6GwA1lTWYFRk3ixTrd3/e6MFV0JNOq6tr1SuJn8IC3FnE
	BmZj0e2IjKDrTXdsPQLueUvLB2UCG5CnT8zye2apUZ/trT/k5eOtkxjkPGFykCbm7nzK+FiBXuiLS
	91c1QxFDhDAVDSTxSCvAhk7fIwQ4MKPGhe7xo6cd0+IRl6cUzxmGSAdMo+PF8wiK+8cfSsmU+m5SI
	BR8dqdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nq-0000000GNbw-2t6o;
	Thu, 06 Nov 2025 23:27:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nm-0000000GNUi-2JUi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
	b=IUYd+aX1CLKMU1Ney3JFnb79L/FgQgHhYNjCTxM0Wwgt6zicJ+Wzi40smoZpOmEp6XP7ob
	z0oO+xBrJrVfUKsFBYtXTKVJb29CE1HIUOuBF/Ks4c1fOm5m3oHtHHaf4nmnsXA5vGPV4N
	BcDgxr8X1azhHYO+qMHU0hEY9ZRukFw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-GkQJVp7rMluoPnJer4mG7g-1; Thu, 06 Nov 2025 18:27:07 -0500
X-MC-Unique: GkQJVp7rMluoPnJer4mG7g-1
X-Mimecast-MFC-AGG-ID: GkQJVp7rMluoPnJer4mG7g_1762471627
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so4938061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471627; x=1763076427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
        b=WNUMyHy3VURVsYwhP6O4RBOUhbFp99eKhEareVaUSbt2Kwomh+2JTNAtSOrqfIwaIJ
         8tOp2P8F0KICmDwcq9h+ezXV4yUN8XPxsOzvksKAx7L+Jync6n8MfYmtxG/CLwebpuxW
         UsXTBiQjEb00Ni9SsN/+TaF6CiY98VGMt/I4NwK2bN7DR+o5VgcJDUe31o1Qux7yMsfV
         l8DcQw0t3TOuoGnISejsrl7aYNkts1qbtNkXAPZ/nqCWr2pYCYDXEBir3fGiJ/LYImcw
         r4Vq009XVKJJbxAD/C/7YmhYJ5IvR9+PaVKuLCHMn8afKYMefcoRN++4sg2fZ0g0Khoe
         6AjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL2uGM2LUY1r27DmYe49fm+V1vT2P9Us6viIStbask8yKFdqUfWtYBVSiEDgdsvNzEP2UjR3e0rADDZVDkgcHy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/YFaiQzKOWtPz5k82d/sQWkaQPiFnSOZRE1qYVuEp6QDGJo5
	X5hwWGa9TZeIQUSa0h1q0YBZys7BVoCfMwsTuks/91+2dtc2NzLOxRojFPRmE6P7gyUQAe5tGIc
	7NP0Rvz1690CY+mcpFHSWZzi3B7VIg7cQLqiCgDIknewFtWGNfbMM0od9ZRFHDVMRm2Yhrf+BSW
	/q
X-Gm-Gg: ASbGncvAf63peBN5IwXcfX2ECNxHX8QovlQfVweCrGqGo/NrAkOwutEoRzjEmvw/eat
	TyMiaPIcBnmTbNjYwSSxQiuQmASSCCY+ABwysBPwsK3zxz/SIt/iWFAtjXpIj6f392RlxSi+5jB
	Iz0CcqiREoPSdWj6X/fcwbMCvdCT26E+5NCKgRPFnKnfJMYsgujNSRLsz97g0zEVUOqotFEf1mp
	g5kgX2TjHYYpxBn7bDRsHURj3B5pLyl/MU+LuPpZxpJ7vrVHd5006osDR2SM96bs7kbgMimV8n6
	nHLKHhWoO5SUmkvy71UnoFavP5MdhyKkPmhnFUUVk9m3ucWblFBh2IHuruUwIlGR/BCFU6OH2xR
	F3RzsL8PHy4/eCtketL2/7MKowhAkak6GuZBWy0kbMA==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476846d6.10.1762471626538;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAKV5Z7B7KevWNhDrMQhaFFBe79yFfIMSER6+SS9G7GG9yGBlDbjxgm5e37vbwHrzd8zri1w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476536d6.10.1762471626163;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:53 -0500
Subject: [PATCH v2 RESEND 7/9] phy: rockchip: phy-rockchip-inno-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-7-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=B3cRh6p3LgoB2SM5XPxaNOqjVUw8A6Swuk8MPDVITuM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Raa525zMnJS/r9qwT+FG4FH7p/2ecBceX+1fMSF5
 feuhew/3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEAv8xMjSUXVyxZ7uixJnX
 YgUTf0if+PYmbwaXxuFNHqoeua3y8fkM/2M+/Ld89F1Hxzyt1aThga0O43ShJKVrPI/Xnd1dkHL
 +EAMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yYSNsa9a3EBUNa6msXG_zm-woxi21HHhx9KbuIBbcUc_1762471627
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152710_685870_1F873BA5 
X-CRM114-Status: GOOD (  14.73  )
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.51.0


