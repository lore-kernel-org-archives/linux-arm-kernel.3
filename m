Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF4C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=; b=Y9DJCEKCEZVq1+Vvvifr+YUPOm
	t7AIjn4vZlVFCax1SN0zxgnIKwb0PzIu5xEQSk7jaULXs5ex8t64zkYbcQ86Rx0b4V0sWl0+Zdoha
	iQq91EHrefIdQxPQrdCBb3RW4vRL+4PF/v/l/dxoeyrVyrLd+VtHUryZpuyamHK2wFBXPaAOr8Gvq
	oqUrg2ABo9ayzfP/OEDK75utUtolWmsYrNsZlFODzvjhNaUTaPI4tifVmjullL+17JMEHeW0MSUIq
	COocy0sJLCGEvfQNi8NLPZSld+wDglCdtqs/8y2EOZwOClUGvqIB9XmujiO/d5h0hUHxZoy6XmiVY
	UU7jhxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvkG-00000005qe2-24ao;
	Wed, 02 Apr 2025 10:54:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvgp-00000005qIP-0tci
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:51:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5774085f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591081; x=1744195881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=EiPahM50kfixUNrgWK/8Dawq9kcoZ2cL9MvtbvUMeC/A6m973pi0PMaOCJgXna/xMG
         0Hg93AFjFUPZP+umIi8Mh8BTNO1WjOub+MSHOvU4ETDeGOicBWDl18/QrQ7s+zrTFk3f
         Ywl4RKY8VcGPBXPdKb/EmVLP0w90DQjY30lit2S0oU/CHiaZ0iGsojRyJtwoVDcMCTZ8
         v7yNGRPq1lK4FqCRI/sQwVmG4d7LuetqLhiymPu+Qa8YZCzLj6upDdUq/b4MzWEmaTeK
         Tj3U26cbEO9h/gvTptzznQcmB3hrVhesZ8eGrYKcf98o/vpBw754ayKpWGZPocJSIlmS
         bD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591081; x=1744195881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=ps0ZHRIK4DibDQMRo8iB6zWJe/TaY1R4b9kpAOOT8LJN8bhKQFIYnGXKJTI3nUavFi
         LEJ6V/jkyiN3tH8fpGSzD6Q62elqnyjHqHRo1uVGfbklT+4SNgJY3/JRS3btPK2dswS7
         Hd6kRf7r53EKYMFjsxmp/FGFiBhL7T+MnKKS+JuW58i48ff/yKgEHweRXmslawighKnX
         QH+nGEbg4ZiHAFD5Gevp7HOHfTJgIeyHAVENL2e9dZwLXEfg7Yf64Ha0apJ9yKBS64jv
         seghoi94OKPLiFJLVApKTit1/XjMY8D0LNUvBKVQP/UEPdRalaa6rNd/STcZDreFgs3a
         wuEw==
X-Gm-Message-State: AOJu0YyES5DzwkUQRQrG0iP0rpBdU6I/gSB6mGtMRbNC4BpNXPm0bKG+
	G9DvNS1duZPAd+uXY89PsU8VqCB97QI8E97ebm2GyzyrhxjnhpJHg+PVTibhipw=
X-Gm-Gg: ASbGncsdi0GZzsQ887xRNQbZMV2RjvXd1SxOwNNnvuRNqrjHsRmX8omrVfdKm27XB8r
	VejudzMoHOEVfbyX/6EdtfeQPdEt9yt/UyLOegcsOlvUkLchR8NgMmXN77LYKHSIszAXfK5Xy1E
	Wz8DYAL6RlCsQbp/y1d52ywkrCHokpYaEYm78nQlOaUCEQqd82z01cABX3eCVGxPFe4EqF0R8TN
	FiO/QjZdOCupNYptocvt8T2efxKcA6tkVpEwQc2O7pyE/ertlgQJQTeOTu6Ci++rq1HVcVnwCnU
	dSQZEqiNOFMwHUNiVbWOFRoDMBuSzwpqHEqDfPMNu2LuPorJ
X-Google-Smtp-Source: AGHT+IHFX4ZEIcE1aZQVlgxdshZZ58qTruQoF7kCcWbrh4WBDQPX8/67a4gnRmDu7c4Qlr6lUUYk6g==
X-Received: by 2002:a5d:59a5:0:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39c120dc1b6mr11880056f8f.19.1743591081602;
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:50:59 +0200
Subject: [PATCH v2 1/2] rtc: mt6359: add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-1-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak5IWC3xb2IP9/KDZQCL9AVG2vNEYj0BN1MrkE
 IftGCGeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHUReV7D/
 0cLHSn10CwEySMB8HDoWMVHV7DniaF+s6ri1VtDU5Z90ujzhyoNjYpW6ocn5hkkDAQkovJc3mB9HV9
 MxyDr23liQEY4Ga7N1h3WHDkvSrd6qW6ZzRq33lUvEyOWk1jECxAQ4fax5e9/hNec/3DDWs/nYPI37
 YR2lz60otwSz+oiIL/lYOLNWW6Gb4uQgYQDSUDQt+o6w3OTlXf0oOsFd5Gjm5l3O9kuKeQqp5hAHlR
 XmyFEY2LQFiJWDT8M+zHZ2f8v/zpLYeCGv/yqMRmu5NKFOGem3EMNAqa9+TJfTtOvDS0rYKT9easi2
 JFi0A3hhjRLjNxit5UFBAp8N6RzWqDvxcEJ/Kw21mj01/TG4UfXeR6i4xLyF5+o33SLg17jLdXUb4w
 kVxYfL/t91biAZPmuALxMOayH7g3Sr7wc/x9s+mItMOPThVPIzzped18FRm+RWNpWs42LqkMTHJtd/
 +dc5cRwLiif403QHP+3umO/GXDA78qlt+vRVM7RnYz8EFQ8xFazthZLFEwLMJgNwST/BXzLStxlMGE
 VufnIuLKEyEtIcUvh88iVNxHtSso6EPQ/nKOkaDEW75LgQ7yeTKmozCg2pt7yUp7RPWvOoVk4b4YJi
 Cut172ovjm6QfkBBhF+bl6GvF1ELcd+fxbhLvP7W4RouCdJMvQJKX20jkuNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035123_243907_09D0D7E9 
X-CRM114-Status: GOOD (  12.57  )
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

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e4..692c00ff544b2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


