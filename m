Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D5C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=; b=P24T9uqLbYMbRALywxViZH1Ht0
	7eV+T8n72Tqt56TM6sRfVjLWtfDZmRe++XZVgjlgdqHoRCybPBEWFGU8TeiF6wAVW8IuYQW876OfQ
	DrELbV9kNsmLUq0Vw3MSPjlbJHKmmsxWhg70lZQOROf1F1vY5N4Tw6pMM0x9Lrzfe5aY6SPamC4tK
	Or2lpga9Yl3hWa7kxlDMSxSJecsO9BfP2NjPr/fWjmLDhrz7xDOyKJ/y3iSnI+geRMCF2qSfCxU1Q
	3XZqxF0klPtdpt/UWXXdInlC3M9yPqqMYSTIaSKqNBocFwxj8KaA+e14PQRNtKm/fQK6rMCg+4ZtQ
	q8eCnHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLS-0000000BZi8-0XG1;
	Thu, 17 Sep 2026 14:44:14 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLP-0000000BZgd-3Ncf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:44:13 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-86212a185dcso926903b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656251; x=1790261051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=eb3Ra2moKh5cnPQH+mYax8A9noTgMBI+AZ5fI8IaWdnaFbHqVh2VQA9E+wcN60/IXM
         6xlGiQcnL3UcA1qBCXgO25VeWuQxhINtDFszPuTDOORFNAAn9VXUNulwSVRZWyxMlTia
         vN6TMIobWmDlJVdRHjWxTTcbEtlnWzilM1e4m0EOzIrMxbhgrQe59ERotxObMbWsLWic
         MXf3i0QRZzMmNqmeZAusCvNKVJ55Cphnhyrh7YJvLydSfcAhXBgs+Bw7aIDiAalxWJaV
         3+dV1X8k+sY0fOb/PvTYn5C1Q1819nZzy5qsP50PPEKEFv5fGMh0bWkNyge/L8BgGXiI
         FJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656251; x=1790261051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=arVJWZ8QNBc/8Bd79VI5zYXszBK39EoV2xysSncGdkjOSkXAwtpsssCBNrWZnl9x0m
         wfHZzbHnVeDvWGyFDwlKNnLLuPp45L0AX4BIUTjokqEHoDi/t9La5bIxPkpU2R/H2XRx
         ao87XtI5nqIwdi6rtfiSBTnJ45TDuMNVeLskgFu6cgkVQi4R58Pmy/pDCo26mXFaEZ7q
         12/BSGfTtE7GBcu3XjXsZPinsejYFpdqQX/KGh+6GijRUlmpZ2JWptXMxFPpnsCE9Gg7
         kpaUT/w9gpfEDk41R5A1QPZFcDV26DVwGtPq8QR4XJpGgpeqFlaQnG5OCIrEpX9KLC4S
         fRfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu2YXHCfNgfKO6jbHoGgt3lApTBwKW+zsNQR8bvc9JK+pyEWkoGaGKdqGCiKElS2/NS2gu/YY6rERTS8PHbzNk@lists.infradead.org
X-Gm-Message-State: AFuF++mSz/2Ee7Io5Jg2hROYh3OeDWYFuWWIVS5JN+O2LgzwxFPHFPC2
	k/gbxi555ZZdSIY/n7D1FeO3BHZl4S/cT1A+dZL/tCXCnSFN3aBeWige
X-Gm-Gg: AYBFou00IVHLQNktpgphaIWK9p1LlJWTI+fvYD1rcxYNp4UOcJcn5qKjpiKG+6dz/nX
	blIYKpMJnGqEm74PUd80QqRESn2uxBitdMzKR0/UUG6ESmSPiDGF3ellKq/4oJqVuvYzRnNWyNo
	8apZNLbodc9Vb+sdZN46EmlBGiVIQgKXH9s7wlGgPXCiZjCVq7GYQVjotqIsElEEGRcEX8O52F/
	OCyfwEL/MghlWD2nqT+9lAr5VlpsuJaDSdTNXkojh1ncNWWc7XccUX2RlRXnylejcwpdpasY0kB
	zcU1oufgTKPYP2xMvD/fjhnq+V4LRYKH6bdEWUic6Qg9zfw5If24XyuNJu6f7ilaDFwhVCw7Rne
	aKFn+mPf0u+12WObKk8Rga/g6siamxvTo1YuCCsm0lRIi6vXVpYwFQlMdxnAujv1cflyiElyAGn
	VYOF4pfCxOrlmvP5HtjWFhNrSe20+iuxrbXZBjz2cXjb8tcMeQXvMv/aEb2NnDgmWjmM1EJiWG3
	40V93HY15YaISDdnxzCsqRZrfZUIV/lieFgRKGXXQ==
X-Received: by 2002:a05:6a00:398f:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-8723adafcb6mr14166549b3a.3.1789656250736;
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 2/3] net: ethernet: mtk_wed: fix reset condition for rx wdma
Date: Thu, 17 Sep 2026 22:43:34 +0800
Message-ID: <20260917144335.19466-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917144335.19466-1-hujy652@gmail.com>
References: <20260917144335.19466-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074411_847376_05919756 
X-CRM114-Status: GOOD (  13.40  )
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

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- Patch added for issue raised by Sashiko
- Link to Sashiko review: https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,
-- 
2.47.3


