Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F19C83F23
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=; b=QaLAdS8NN9OfuMFxW5OuU/fAyI
	squxRTJ7wcw18jDbdtYjxuYuchpv0jCIqJBmYjtyzoXYHXfpijZBRQIoJ7KoMRN0oFT6kZkqv0dvw
	8zxjoc7o69wT6nHNqdLeQx1wZuLqlP0aD54262RLQRKN6vujW+ZYLdBzM8evHc8AhN5xP0rJDO34S
	ocJflqsbl8/zOR8P61ViU+IRx5SyvbJk5LoeCmT8yT2HigITsGx7PUGGVpIOItmAkcHqRRlpLaDOC
	uGqrja6IDgf12olmHq3zFhtC9cKH5AF//DFOS0BtFiqF2GR5R29zC6xw/oo6lH4tj0QFpKAOkv+Ok
	uFM9KjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0J-0000000ChdV-3uRU;
	Thu, 10 Jul 2025 18:28:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtom-0000000CMFZ-37lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
	b=eHrRaT2M77r8xj16EhtxLls/jm31KizQv/R6TZ+uUSAosi65kgwLFDgpmGj53nwkEycMfB
	w4zxOhqSjOxXft2prjg/axSdclEB6Do9XYadq9JolUNaSTlO810plxU3JJOTSBTHy4O/Vn
	ubzcN7qkCbvMrfOAdUYDFqRXiLHVMQ8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-TelA2YeSMgGrNuWKE8-MPQ-1; Thu, 10 Jul 2025 12:08:14 -0400
X-MC-Unique: TelA2YeSMgGrNuWKE8-MPQ-1
X-Mimecast-MFC-AGG-ID: TelA2YeSMgGrNuWKE8-MPQ_1752163694
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso15760696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163694; x=1752768494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
        b=tExJXvcCH6LhNyP317QMUcxZGm1h1UPlslGOEHiAVKZ91o34Dx77C8Tv2+Iw17JmhW
         dV0VNEJWE1RROGPC1bmjEN17xhCcVKRYteGG+NsUc3tjcpcTansSkn+56ahw3zZjmye7
         /JalRry+0ErETbIVwCH1nb0+cSLo0w0FA4sWimkEfeNzw3PQm2ZeYdtMtu+13AS6lEEG
         5kCBAgaRgSvyfvPIlOeR14L3QzxV+NUuE13V+qSut/oUpM6ZKH4lqF4khW13bXDh29lS
         IAlUrcUjoEW0agYsfSyxwd4YRtlXA9YgJnTm6ZslE9SqTC80tuAiDxsXGrBqVSPPRIkA
         PS+A==
X-Forwarded-Encrypted: i=1; AJvYcCXSJGVDgvz6vHOcACFP22+7vtNuP6fF2YZRwrSI5BV1NaZmTO+qzNPYbP7xyB2VzemHxPAN8R3xwUBelN7oAuK6@lists.infradead.org
X-Gm-Message-State: AOJu0YyrIfL9FkzvAmnwtaSfCvgXb/g06eT7SVgnd1QPkHyka7cHaThP
	91Wyj5x2JDoQBDRoG88IRW5BmyQ7/lB2CodEDXeYQ1RULMbg0k8Ixpf3r96mZR9iiw4+dxpDbSX
	voPhE1trUfQJ3yWNs1lFzQRLykAiIipLf661wFGwrp/qeIGm57B9dWBM44iPp3GKpjmfwna0Lmz
	1M
X-Gm-Gg: ASbGncvohEiRtDvG2pbbhltJPl3Zz9KbovkOYnWjVsX1LGq+JWezNIo3XhRPIx8LetL
	aUW823lxhDEtMZVTE0nLyEcP28+o/OcWWLiiFUs1rC0+2cEt+ovqVyhv70ooI1phzQ3d+y3Jl+y
	/qgvg3cX2Y7pG6yGvKDFwfRbFwlsnm05mJqf9WyANCizUMKYBdZLpeBXifBWqt5w9HYtORx6cJP
	CDEVbMn0Ge6HfAqen17jU2VOYUSkreNVcLXOjamzMBD2ay8EmwoZZz8u+Y/4ODUM/6r70un+eAe
	r/30slq3E0D66oYVgpTRG4APcx87F2IRXI0JNfEY5lyNO74Fdn65UTEBkYg+
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93046446d6.0.1752163694055;
        Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEInLStwo1lDSg7F85FMOE58AhksEafUcDFpNGGZphskAtBc03MrN1OcVT08c+bAzB2AxSVXQ==
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93045996d6.0.1752163693579;
        Thu, 10 Jul 2025 09:08:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:12 -0400
Subject: [PATCH 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-2-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iJAJsOBdjX5yU2h75u6+b08f3YAfQGGv0k5DSS+fdqc=;
 b=gM9Vog/PjfK+PD7kK6yqe+FHMUUn8OmRYlp0k9f9lt5ka6hie/ovQ2orPiYAUbVKPreNvVHLO
 BW8lUYOkRwPB/LUPMWdxoK3stAq+kbRSdWnBg6NGEyKUO9GNQDXxSDY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jGBX9o_pJijWOLAEcHIm2dli9srzDlaVE_UdsPvJf9c_1752163694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090816_848131_9BEAF8C9 
X-CRM114-Status: GOOD (  13.60  )
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
2.50.0


