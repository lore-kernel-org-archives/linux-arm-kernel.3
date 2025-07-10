Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AECBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=; b=USfsTWxO/Dw06L+GNJlysXjNn4
	58PHDJyG0+1vlCs6yIM/lF/aT/gc6bsat0hv5Lp4P9CnYaaQM+nI/Fu+3kOEv2JCFDC2hwMivLGfp
	7jzm3MKXrRqcF4g6AeSLoHRAmWZ5IxWMH7W/ZX2lp/0ChQJW8J5HG0eqLCBK6Qngi0S+6gcKmNQjO
	7lTu9BoWzKjQMiDWQNcqc/CLdDFuDADpNMSfEP33EUf2nalpwiL+Oe4EBlv4vno9uoxEDd7ZrKoeb
	T7lG0zWxEExyuiucm82rJWWYVS0aXQs5DY/QTri3ljH/jNDULEd3ZePrgzaqrz+6Pv/1wxT+hbD2q
	VTFUeytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwPd-0000000CkbQ-2Zh4;
	Thu, 10 Jul 2025 18:54:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqE-0000000CMch-0Dhd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
	b=hWev9gmJGLcCnAyGm90EfZeAG4PZEGNKFXr14sXcY3wU3LFNzxANNTql8geD7r9A82p/uD
	nNKveJY6LOsbmcbrh0o/G4LfeS+egMEAh3GKbvEAxEdDeCeB07DvmUstPAQM0B+wFkvgPT
	PoIwVJ65Pk7533zQEwBLqei6hRrZ2p4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-66vzcOQDObC7UWkqHiyrhg-1; Thu, 10 Jul 2025 12:08:40 -0400
X-MC-Unique: 66vzcOQDObC7UWkqHiyrhg-1
X-Mimecast-MFC-AGG-ID: 66vzcOQDObC7UWkqHiyrhg_1752163702
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-700c2d3f3d6so13262026d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163699; x=1752768499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
        b=sS6pkjLgDSknC5PBeNZQ0e5t2JLqA4g2+s/ERkik0ZkTMdi41rbeThENGkuHUmbUKT
         YkaHgSpCiGYJ6AOabVAeud7k08zQprns5kycEtfEt5Y2AKaIpUtyVCxjQsfxekwRfSQL
         HTaIfdsC09rQttwFIDQjHtkip4bNjf4FpQmCSbhcxLR2OXSJh2AbOGHlsXJECtqD0Hsn
         dD4yjHUGvffuJqoQ+odLc2NaWKrQobWAFWUqleCpnj5/+uXGFcgwlIUqX/z5+uPXBo13
         wt+aiSKsomZL2bqutBuXvTwDaf7nO39JhjHr3WS+csAlc6/9DruNkvsuKeDAS/JQW3yE
         wenA==
X-Forwarded-Encrypted: i=1; AJvYcCUL6ldaadhU9S/g7Mi5MhEHbSSANFokqoaEzOeteXhhozugDA94xkOYMQknVix48FIvU4yTuaDf0KlsIAGMMJM8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz79DJMnBJT4OTzXcq0CrhHOvkamEsFp5JJKgHX5oDh/Atzl2Qv
	VUm1m7XPPzXRvotNbQM/H0bgFh2aDICK2qkXAhE3QiwVvzXf5OOQPj+gv+j1yNA9M/w6T9hFWv2
	DwXEQQxB586te8zKz1afJ1I7WIIoYfWhUG214Y4nG7ZjK0uqzkIh34qIPHoma19SZvOxlq43RGl
	2z
X-Gm-Gg: ASbGncsnviUPN+UpB7S8LMPiW9Nyh9+cC66gMOZT954FqFO8At38nPELfb9O1Q7ZfMH
	VSADkwTZt/nA0azbolMy3yTbaPhWUYf8DUtwKXJih7Fj8bhPm14HFt1N3V79GqX4MyBI1go7vY2
	5haEug439aXR2HgDntAkYK58ZO1V8MU/jAJJt0WMz4kwnJGQwUPh4BRdNYG15JBRXSkPo+FzgIA
	+3DVpUe+UjlgktbtK7a8gUGRhms8Bvn37wvCM838VRQAYLeuctR1yJfBh1wooAuYqyoAcBXZxMJ
	p9CbFi35H2p33zSk/iKMAD1voDyDIgNdgdEb+Sa0XSSvOArTqMmUL/dI/3Lz
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54887066d6.7.1752163699076;
        Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPjEiUWwXCCHctPequGjvxsmcP2oTYR8PP+05MEZihcEYQLxAz0y6yXBwiYJgaIGBkfIQAEQ==
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54885916d6.7.1752163698330;
        Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:14 -0400
Subject: [PATCH 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-4-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DwS1eyPB/neaQufQvNJoTsoU5XhXKJIB7F14A2pZwIo=;
 b=4cPcXNvbK3LJUngty9/hS4Cci5iNskdrVCzBboRgMF/vVZq4JO3qCRcMs3ZcshnLpFzqFvn2A
 ZJ4lm2QjCh4CBdhbHz6OimHjO2IugpTJTJVBSFGBISv7EeMJ0RGydsb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OPeQSayp3w7nUT7eB6dBy_427xbmZGLYaNUvaUdJMIM_1752163702
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090946_159396_3055F0C3 
X-CRM114-Status: GOOD (  14.38  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0


