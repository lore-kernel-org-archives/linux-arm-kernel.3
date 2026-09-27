Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0908FC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=; b=DuVAMxqDukbTJyAVXAzS0gbkZw
	eJmo/KGmlg+uOyowBqGFWxnpdZoIvK7Zgy/PfueUgH21cBmzIbo63nnNsh7RjC1RjwJOluvOUdQGq
	5cUBgajAOfeq2Dgy0L4s4cQhrwJqtK4JOILGctruzMFZGSCFE+kOGO1Lv+baghkhG+Ax7JdnSL2rI
	fd5vdP9l8sm0C+pM+AqoC+19kDfAViZhO+HEVv+C3ddgozNRtyWgv6fkPBWuCpeesgepCueLKXYBg
	wKX+3KenUlH/1IBAFI3+Xv7vZAVMAw6eRqsRFl/qTDGV+b++Yx16dIIzWHWWHN6MLgjcUKiRgIoHF
	HOu6ZCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYM-0000000GUvO-3aur;
	Sun, 27 Sep 2026 15:12:34 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYI-0000000GUso-3aLJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:31 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffe817151so4372225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521949; x=1791126749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=DenMZXxflBMf2DPCMbDytSx1gCuxGlDXm7jiw+1LnUa9yGF13JpsdFGbJk2GSPoJJ0
         TJWNyCu3NRlUx//yPydoZvxnhX2lQrU3OnZlfVND4Jz4CraJ1BgoE0tRIdSs+/vUNQ9X
         9SC1VSvdqzAAErkjYWr8rYqIeTL/r9bNVCJ7tZ2uRh4Cft0mPiaRDu/HxsxqEBBjdpJp
         V6NeNzAFtx8DRWl0Th9a73FhCafZX26wo1u0OvBxWtme4NojRL0Vua8vsj+yipv1FuwW
         1FKC1vS6rAjeAlXYSACpkq/oV+bAz9xRx1T+OaRtFOfu2S77gwTsk91jKtOlBXKZn7/D
         E0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521949; x=1791126749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=hV1+abuXywxLGw37PJtNL7f+EhsFNaaMcDDw2upCT6LXW/4+t8hM9WvlhenkaZsTTj
         NLtZf4ATfEbCvpPpmI+ZB+t3gKZ4doWQj8MvivNUOCANktRRDSnViaaO0Qu4HyKz04aQ
         xGeDiw8wXqAzsCBiJRmlQx9gefIgpVKtY06FCObeaQMnDMySkCylZMOgEuDmEqf9OfM2
         AkSX4hMLMkqBa2oBwOkeeqAXl6RJG3Exa0gLftsqpqUNNogyZ7pkjy3yny1/lczfM7d9
         pQRhV1jBKm2dlBxBGyAYRuEDhzF+Y+RGN3QCFS6uy4pKqjztUvcY/5micDpq06vORLjZ
         Yo7A==
X-Forwarded-Encrypted: i=1; AKwUvBzxk9AzJz8FKfjuEAH+BGOlld0w3FZCfzY3oJzVaJuUqVL7fwVTeMaYH1JqY+OUhi6C7eY/MDY34FDXOguIlIQi@lists.infradead.org
X-Gm-Message-State: AFuF++lXYT3UGJIgxC6Xweh0NjC1R9v6evsXWzVGmToTX2Dl3LPu8pW5
	jh8SXpSQXp66RFs2j9ymlCzRh4SCuwaPMteq/taK+v5NU61Qfjv05NaF
X-Gm-Gg: AYBFou2DA7PvIhmX8X9DINmwxGNahKQny1ISTb0eVLJeSw4luFMoTYMxH/3liKXLSSn
	xDajl2jRAbfCg+k2dtmTcuLllvM0TJb7ELiTKU+Q1bHXMmewKTFR/7KLCLzXW3B55Mw1862mU/c
	oNAKTToPuQ4a60rKZiwzKIB84lw6ipCTWnV9J0TyHIW3SuvkDLp6K5DkUEgf3hs/hRjytZLmwmL
	3s1qq1s0JH/7HdkOVLjOgfUTDO4LKLjy5y9Au+g2C51CPb7a48N7XQOO6G0WA44aAnyRos5mXoW
	ztQreNfVZny+gBT7vCGTS6vbMDusrRWFJsWoaPrCNC4JRirUc99p9ZnCXtLiEPEpSyFUWjXDMBg
	Jj8med07qJqD0vXDw2lkTzi0AKCIskv+0R+16/hu63Tnmc0IxBq0IEmSQW6JRp1o9WsHRlxeWkK
	0kWtJsx8XAyIP+vE/DZe8LoZurs8TEm2sjLSy47Ji+GX5N0XSGffLIiBMqaD70jTIvKHZy8HlB/
	YqcVejRSTW2y4yAAtvi4QC4noSWgMJPjR7kcTEpcdU=
X-Received: by 2002:a05:600c:4694:b0:4a0:54a:bd36 with SMTP id 5b1f17b1804b1-4a0054abee2mr1501255e9.35.1790521948886;
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Sun, 27 Sep 2026 16:10:11 +0100
Message-ID: <20260927151016.186493-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081230_900354_4E4A17B6 
X-CRM114-Status: GOOD (  12.53  )
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

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0


