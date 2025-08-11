Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7469FCA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0ww1yav51W+SvAM+IkeQUSrvOwdkXre9aY+EL61q/s=; b=bbgnYV3kmFaKWWTxkuKWFeimqT
	7N/aOW9ASVt2KRFAC16A92+UHLLD+ghvvxk50J3kDXWWwAL6btHme8yyF1o3l2KDHHgU/8t5LMrd5
	ktMTYPpg5btDIpqK1hFAgQyVokxdAvWFL5Z8XmbdlrzNduUap6oagZtnsy2UaZiv9yxKN+BKD0wSB
	0yyA89pb83chJd4kIJFIM2qXe/TS8wjfPeHV3aK70Bj0DZeprHH6gg86sMWVbu/cPUfoleyW8WrSA
	ZNtvdJ5nCShKXr7IjkSJXRgeUH+1DdbdrxxHd2NIfmVn9/JQXy4BsK+yVC70ILp1XS9RLSe3ONU5r
	M4pXK03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaaa-0000000996t-28EE;
	Mon, 11 Aug 2025 22:01:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUW0-00000008D3z-3Xi3;
	Mon, 11 Aug 2025 15:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 460D861431;
	Mon, 11 Aug 2025 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595E0C4CEED;
	Mon, 11 Aug 2025 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754926367;
	bh=8/4RpIJUjXp3BOewwikXOw1DM59JzyvkMt9RjsWbDKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eTjJcpEMFQJ9Pgk9znUfgwTQTpuTyLJdjz3H5g3hBMmXqhJkrLYR3efIQ5xhEp4Cm
	 JcUhX/eA47ivicJMbd3+hy8ISwYK8uIdllOcH70Yf5IJ9hVIQY6RxJ095qldD4Tks0
	 2G37/pP17fsbRBR9yZAelIujR4YjlslDkr7WptBIvoqocCzHb7QE299t60pWBuPNVn
	 uTAlCAz7mXSLbp9nKd5B47x4j1gGq2Jn8/qsN1QggA2la2EpUuoAEqgufg9HgpIUbH
	 B9DkZXMgNiIifz6JRkJvGOyuAbiv1U7S0Z/VAMbQhM7BjJe/FBH79K4lmyLChgcslr
	 +wEPywnC7AlZw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 Aug 2025 17:31:41 +0200
Subject: [PATCH net-next v7 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-airoha-en7581-wlan-offlaod-v7-6-58823603bb4e@kernel.org>
References: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
In-Reply-To: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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
index e0448e1225b8eb6b66a3a279b676592876f277ae..66a8a992dbf2abc9626610b1d445eb9d3d0a5e8c 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -720,8 +720,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.1


