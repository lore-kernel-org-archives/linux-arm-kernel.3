Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686C8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0KifzVeJbMk8KFlg9JFjjXAIUyd1A3OehcDCTQsKj0=; b=4My42dEqGCfoYAPcGJ/1dKkkVK
	Eqf4bRPfLUAO0maxif+56OBTYN5q669r6NQ5aBpKjNXYCswCa1GFYzUFRrHLQsdEFaCgj8kS3+l/m
	3jMDyLMx9CFi9ONSm78nclj9fejyxTw04ctGj2NBAbLRANzvdVGhCyvzRitvHHskmgou69vI5zdAZ
	lE5tzotThAdgmwTGMMXBGwtJBQufd+7PaU3qZmUyomQyLR+KA1y03YG+dg4DA+AHuCM25i9q8m9kl
	rNa7TAoJT8Ff3Av4eRC7N8Bzd69tIjHANWf1yosXHh0kmUz05pMrpJXkGcZ6H5zItro5B2gI9Awim
	urJ6SNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedPN-00000005d0K-1gUD;
	Wed, 23 Jul 2025 17:37:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued8f-00000005a8S-3DEo;
	Wed, 23 Jul 2025 17:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2081CA54574;
	Wed, 23 Jul 2025 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EA7C4CEE7;
	Wed, 23 Jul 2025 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291220;
	bh=C6h07MIeYF/IWpw/c9BwXgLL1ekelXtBh8YVwLIY2ZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Adh1z0JadfgTJARCg/R/TaC81TOHC8PPpXrGxo8ttftcO8Bwpsh0sB67jier4fWNS
	 7yc83VQMslsCVCkvsT1JSbBHlHaWIQJf3i0HQNtkxoLtfJCTAbCyVwkicNO6393swL
	 FdcQlM0jgO+pbJCkNq/wnX+ABkyoSB9wtWXucke1jb+T0ufoHkX+tWQ/WajfkgjFKJ
	 RAaAjSUpqCYvg3Qai7poei1dzofXBnhyFiBsAc9Y1Hf0BM4OM5MvefSvOQRG52+o3Y
	 gRxSxKu9OWW9J0q0vnsG/zE/hWOsgF0qy3/TJJhGqirDx4/PaJW/Wbh+EzMpsd2teG
	 wEnDVCXvIadAg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 23 Jul 2025 19:19:55 +0200
Subject: [PATCH net-next v5 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-airoha-en7581-wlan-offlaod-v5-6-da92e0f8c497@kernel.org>
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
In-Reply-To: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_102021_870645_B311EC69 
X-CRM114-Status: GOOD (  10.79  )
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

NPU core 3 is responsible for WiFi offloading so enable it during NPU
probe.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 90bb61d6c09d0dc874b7f5b874606d34a812aa87..af3604daf87e68e50a3b8c6e8b8fa2ffac64be80 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -725,8 +725,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.1


