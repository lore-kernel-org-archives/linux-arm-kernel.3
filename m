Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19903C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=; b=Gxi3JBgu9LKxFfVsQYZKO+62p4
	dQAzy9jjron+ncKl5xB1yfHa0u581bLkwFSoTbs2sqEq6cgWPEqPPHlVHjvb1Rrn6qnHfQpy8mOgh
	bZZU4tFtuuN3MmgY/dIMDRQxi0ws+ORsslTQzHgJuTlDTd7Q1GixJkAS7YPSRn5BW6LZoDevwY6ig
	1tyX1Av3a1/Q00FqHRJH+6XznVmgg+37/PCT+/BTLzPxINSS2nXrc7OqqQDEpvbjzTgN6LMAS7Kh2
	HDv3egy0YBntz+fgnE1AazF9gq2G3BLdVLFHwBOhIAORMM/qICGNVR414qaD5Sl+LPTIxS/+kekce
	DZMIIG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwWZ-0000000CljY-2SiA;
	Thu, 10 Jul 2025 19:01:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtsw-0000000CMx5-18mC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
	b=HDl8uW4rap4HIKhAnSTUSCvPieW0uEq99meTtIwyuXvy/RvCxIlLA38rXUzkuMyHcK+TYP
	mQDPIjoiP4s7gqhecRgpU/JKLLg/mFkSGjqtCjyGdgEyo98kWEnMJ7obwO6QIkDSjoWDUs
	guswwdU5TgzZQeU2+Sr2SRP6aYyayPQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ORAWXZq5N4mfSPKP9Z50Gw-1; Thu, 10 Jul 2025 12:08:19 -0400
X-MC-Unique: ORAWXZq5N4mfSPKP9Z50Gw-1
X-Mimecast-MFC-AGG-ID: ORAWXZq5N4mfSPKP9Z50Gw_1752163699
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5720eb48so37320256d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163699; x=1752768499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
        b=GPY6IFayKxtIiOscVcQlJ/hYmEJMwv2u8PC8GA+sa02BPbzEC4Z0AFQL2Q+9WqKDnS
         UWK1CXAQjIw6UAtMK+WlgqqKXuFNnneqmEpo1jRKvz3GW5963pfl8qVJjqbdgSJDtwtv
         ZiNM1cLbcSsTNUptNr8bJPGhQlbrCUwr0PxO2OQSRznmBIS5Z/qQpuFMK7BzmrMokoJU
         d/9K5LUszS5ukvZj6GYSBr06MytrLbuh5JVPO1ve6gU/VzQARPRCJoV9nci3qT/t3ssB
         IVyTMiFtRIUE7NxJ5UL7+N/cGrA3lzRRsIytjYaH9jObz4ZtM66epMmqJtEQHp0vAhRT
         /a8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZwZvbxUC317V0RnN8XPPTnzKXasKtDotCXs1PJoNFuR6H/FnyD36vIrId3G7XKaokCJiyK/qNlgnytgQ0x34@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUmkXmaHqMFOj/IEfTzG6QT9j+4vHMKWSvq8UIbeExNKwk0uR
	KBjM9xCcm/cXlSYCBzQclpFeTUXEPRp/2t2jFIKDkhFrMUvO5JnkBSYGlOPWEWCXBPjRk+gs1MV
	RYKGCSjiaSRv/HqTZcdiUv06+pcj0OfWI/VPsCe/Py9JjJ5FZJ/wOXZMQCmML3lhoYa93OjM0nu
	eV
X-Gm-Gg: ASbGncu1xjPBszXPzTaktDslJW+7rMXgabvvY3jvlBbp1qqy7FyFLGhQPvLfWvSWa5V
	fltG/RXdXYL1bYTNtElJyw4FfIkmielbb3Qv0OG1h1QHJDQQlG3Hu1M+mbrsEGVGW/52w2+CbV4
	QGlQrJFpEFOX9Fu2+48cN7w60R5U6J67kPkunXfgtOi1AgfByqj4JABf6YN5j1blvZemQtbnOBT
	gb90YL589zwxjm0ReEnV5iAITo3cDqgI8MZLXqsKDs8uEm0Zl+HLGIaAIEAteGKiuhT3e8PtVna
	q/2VdGH06P/9w6ZTTrJJb01dZClpWwno1ainVEmwNA1lCUH8V49XMtA5CmY7
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id 6a1803df08f44-70495b03340mr56703216d6.22.1752163699156;
        Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLcSXwBvzMgHcxvaGx+jxenoScUgyuQu1/XLMH/JsUnJsRg9oDtwMu2U2WZdTeBYZEBbFhcQ==
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id 6a1803df08f44-70495b03340mr56699946d6.22.1752163695850;
        Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:13 -0400
Subject: [PATCH 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-3-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4qM0ky7zv1CT6MbG0sETVffzH28Znb5sgT9aMpTi5PM=;
 b=OlOFj1qtOHlC4RTSWWBUoK0UK6p8kJw7bEiAXyh697CDgkPWtlCgHYWxO4MvlcT4VtmGy896s
 MhkQvLZz992BJ4ENElsvaaczY9Qr1s/zBYA7f5mWOE8/m/uo3t62K5q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ovhCOyaNc-EczlLrfNqDwYXNencgNUPnjydP3kbJpu8_1752163699
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_091234_375924_3660BBAE 
X-CRM114-Status: GOOD (  13.62  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0


