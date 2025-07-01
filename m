Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25BBC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 23:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+CqYSv07nLvKVJrV98pV2Rk3kiq9P7tnYB4LIvr2kM=; b=Bm2G+JpA498r914pBSPj49sF06
	ayF4a+1Ox7Hz+lF6c0wvOAB4+zCKyfKJ7CPbbepqx5Qh7o9IalAehUuXjjtTI1VGiQfQpyHjgXFSo
	ct+LtGAI8v8Ui4KttsXe4JHLM0J40K4ywtcX+KqB2k1l2BNUQcQe4QaSg26L7cXRK2DaP6O7qXw4l
	D8EWeQSiCbh0JWO9CIircu9eVBJEguirMyeKMyKtH/PtvuJnsWidM4P96ozqsa2A37GcwA76E9KUt
	XFXaj/ZaqGIcMID/soctGtKERtBSJeoSWN9fBt/yQ5k74r1xjka5bam3ZWSoSPGCTvOZc1OQ8eOmk
	mUEITs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWk3b-00000006pPL-3dm4;
	Tue, 01 Jul 2025 23:06:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOe-00000006mG1-3vXf;
	Tue, 01 Jul 2025 22:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 781445C6337;
	Tue,  1 Jul 2025 22:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8568C4CEEB;
	Tue,  1 Jul 2025 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408652;
	bh=SDqem+yN+CppwyZoFjrEVI6UCF4zuRL953lIiDNtguU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F+TuSIH26s6a47ZWYVLaAyIhAOnJonFbO8NEHvVPk2wgwTVURyjh5R8iZgpHK1qco
	 8gHwKzzKVdJ4fyIameH4heIU+mqHopxbzz5RQYlfxYERF6zF87FnxZunuU8JiQ/98M
	 QiidngTbdGfA7Kuig/f9KXMG35h5tQ7apnUlSZrBUAEr1fBkz2WUpI5KuL8zFGrFsp
	 5Xf0ipiW++uQGCqCB+fnCXgErpv0OIbrgc+0OXtTXuo5K0LgcRFhwoJQT9z2GSeZHG
	 EQvOma+9zyn1nSsjx/Y+v2e0RaiWfu9gpMI1cz98/CB7hjkT5GFGfSWzV5WYxryJZ3
	 OB7FqBj/2E4TA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 02 Jul 2025 00:23:34 +0200
Subject: [PATCH net-next 5/6] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-5-803009700b38@kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_152413_019585_956A057C 
X-CRM114-Status: GOOD (  10.39  )
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 1cf431469ca034bbaeb922fed3ebdab41aafef05..3e30cd424085d882aad98a0e751743de73f135fe 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -877,8 +877,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.0


