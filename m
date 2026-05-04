Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=; b=C8YEBno1CELY73W59xzfhr+52d
	RoVLEoFVJo/bGIzOexKKxViQAS3FRKeTBbJl2Lu6SppzsLKI9KTMRbs1ZsZjLBcQkrX9bYhyzlVhR
	qrqAyTWnubyxhIAMqKDsn4tHslogq0rCnWUtg87H/DfqWXIaO1Z6NxC0eCS0q2B5Y8d5nxLuHTCEK
	OGy3ABcJrbVGVWAJngaIUF+AplqtEYdn9vE7NwhN7yhDiuMzvVDekoddt/8S27vP1+imgYlRhgNud
	rX1VITssvRw3tzqPyAManhD46/X5D8geFsWzlls7SvXd3buKSGgX4BvfC7FOQ+vdmSy731I6uK6l+
	xQsv6Wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjhk-0000000CEAo-3qre;
	Mon, 04 May 2026 03:10:44 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjhh-0000000CE9Y-3qB8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 03:10:43 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso62275806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 20:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777864240; x=1778469040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=;
        b=J+ozIrd7zqdH8f5M58HEbnEdwzfnqNdfzTBdPP4yWdJefdI0n7nykr0MJ60pbSIqnE
         bANHf9hx0P2yuQhgzkaZ+T64ON8D8l1a1ANnxE/iSkLRiROO9wTORcE/3fi1guE+yG9K
         v6COXLIm/4SYnOYjQ4dFKKgmKVm0B4BOJinr50IHS8n/NDsbmC45bpmA6/VsGTkbBJLU
         JU/tUYbYlkGL6vDiTbKXtEFYDeKq+zerdyB4yF6DOaA7IwFbf1d6bT5aF1iPQS/IDTRK
         FXv+eRTv4KDlZOZfaxJAKpFcUTsmq4EzUJ4vQ+9+MajLQfiEwVvXs3hGuo16t9uwdnfR
         LsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777864240; x=1778469040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=;
        b=DJpiO4AHPkG47OjiF4Y7hObB4uoPwY8IobiUqtS4Hlr+90jtW90p6ib/L2FUikhLN7
         OIJLZW75oV3SbcG7xfx5LouJTsMykYiLuaCTqQSdKxpznWVoCQbslzAo5HCJGlB58ALp
         nuITLVUc9IZ+NM5UQ7bv8kdt8XfI6V4e4qJ6zIQL+DuYeaQZL5P2xuGUtZoIun7Sytln
         NDLtU2WNUWnR0Gk3Yk4vB9iemil5z4N0ZYBNjCdMygZnBNRqnbg8Wjy2CpCcj0aUjQmE
         C/aCuf81b1lDHozmm2HG1yb0i4yLRiFzpBAN1OR7ENbYM2euBQ6amhX4DbJGkEJKI0/U
         Zz4w==
X-Forwarded-Encrypted: i=1; AFNElJ99usc0sheiXXxM90qPjOEr2AL6q2edewbcw9qAWbrg4iP8z/QduKj2t24grhKgi6vfQ4kKcWH72X2EfCUR4Is3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxae6YbjYJYYWhbBakoOkqVbtauQPhHZTYl6L91C1kzqrM8GdoA
	HAQpa/QZXnqWvTRWV63WAqkoI9oN5V+VVCdS6jW9CjcMbPV7Dy9iJbSJ
X-Gm-Gg: AeBDiett12N6bpytEOZ/CI+gWjfIYtkDXLaGoEiXy2gliXrwc5TNDdBmoR0VzKubgwU
	L6+T1SDKvmNpTZV8BVZIurtXsY7wN8g/yymLJIEoHgCUYwpljpkPD0UhTEoEZererOEKgG3xLfc
	Wj6AhccRf8pq3UdQqAY1ggUmZvAptSUSKhJ6yjau0EOibi7+ZqEdHDUN+XBzqmBqZwNBxGrfm7t
	Pkdm4QKN3yOL6OKL+Avev7JtRSEw0o4J1r0weV/od3OAxHiEzBUe7vWvKEu2EWeDyRJg3h1Y1hS
	hsBddMp7WRF9CnBuOvqqCLWgJ2okJteCXGXZcZ6gm4oCWOeONVs8cqL8ho5k3Qy4saIc2rgcyk5
	O5dejp6UedlKD3R4WKdMgP9BlOosA3hzHHk+Hd08QHzZDRgufL4j+CMGI9e4Nfh2KBCRJ6Bsej4
	WkDrdTd4VUPkPD0X8RZXyBxa/fDOjC/weQcZj009mwaNUtHTq1eY+Yuz0ySBBlX8V8/RBv0tQAv
	71RvuuUvk6NiWS495KOgZc6pmKK4Hj/wsmmBrcUy/I5sFtSOdDcDi2G
X-Received: by 2002:a0c:f10c:0:b0:89c:de0e:263b with SMTP id 6a1803df08f44-8b6694eb760mr112988026d6.42.1777864239741;
        Sun, 03 May 2026 20:10:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538b1d833sm119089176d6.10.2026.05.03.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 20:10:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next] net: mtk_star_emac: use of_get_ethdev_address
Date: Sun,  3 May 2026 20:10:19 -0700
Message-ID: <20260504031019.607682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_201041_955008_4A81FB56 
X-CRM114-Status: GOOD (  12.98  )
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

The platform_ variant calls arch_get_platform_mac_address which is only
implemented under SPARC.

Switch to the of variant as of functions are used in the surrounding
code and to get EPROBE_DEFER support in order to handle NVMEM MAC
address specifications.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index b83886a41121..774ecc98ebe1 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1640,7 +1640,9 @@ static int mtk_star_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = platform_get_ethdev_address(dev, ndev);
+	ret = of_get_ethdev_address(of_node, ndev);
+	if (ret == -EPROBE_DEFER)
+		return ret;
 	if (ret || !is_valid_ether_addr(ndev->dev_addr))
 		eth_hw_addr_random(ndev);
 
-- 
2.54.0


