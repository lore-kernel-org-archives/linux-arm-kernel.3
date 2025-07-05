Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532F3C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZ2e0OGLx3B1xnxgJsmUQMNOM9BBR0+6G+mi7LokNx8=; b=OadBRljdpVbB2rgp+SsrKgxuJP
	anwBOXq5ufN3SzLfAIw3hbI6qtdg+24FpRebLyTTHUutG+fmJXvLTI1sVUKxSNzgf/qjWoOK+GgE0
	XwvdvJcx0p/1aSWSPNRMIo+fk4bCX3XR6+1K4YTT/e1Mq2jDBxjBtz/hp9ezlmdgvt3tKOiNZygMU
	lsi1FIJb0xhcwVrARx/lpKEOcorQoe2+0OQfZ1zCpGGxba2RIRRbZDOmy7LYLF4ZAhdybHU5aPHWI
	zs5nNhAys4Ke2tJ01SyzB5WVGatXsbgirQpJauTJIzrVHr7sEbjc1skSkDWrCBgPmZZugfmIKNNhv
	bu7cOK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyOh-0000000GIbJ-31hC;
	Sat, 05 Jul 2025 08:37:23 +0000
Received: from smtp-74.smtpout.orange.fr ([80.12.242.74] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyMK-0000000GIMW-10ov;
	Sat, 05 Jul 2025 08:34:59 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XyMCunIdc3HAMXyMCux85J; Sat, 05 Jul 2025 10:34:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751704491;
	bh=bZ2e0OGLx3B1xnxgJsmUQMNOM9BBR0+6G+mi7LokNx8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cF0ow0Mk+vKo0i7MXgUtpEOsNiSg/EqNpyVO5xtB2DGhRDbSJb+yPRjQoa3h+IbIo
	 Q5f7G2PnB/Uqq8/s1VsxYbEcVImyFXJmcSEivXu/6IvwWRfh8613zFQOtWm87ZDplo
	 sUzYPZMf5TXsaatv+ywMe26H0XR+DSrXCdGaEFvfmmJedqFosv3F5CeQQxAKAgVa6q
	 7HN3dvmIIjrFEHqqMWjgVYBOHGYY/e28mf3Hs31hPhZtKM6FXIegxEQNkoEf7eWm5C
	 yLGQ3RQyLknnkAxvmNLP/s7pJosT1WsjYaHlSz8GxbpNrqbpHGFj8pt980/R6/V5PE
	 j0d4uq3fe1J2w==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 10:34:51 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 net] net: airoha: Fix an error handling path in airoha_probe()
Date: Sat,  5 Jul 2025 10:34:32 +0200
Message-ID: <1c940851b4fa3c3ed2a142910c821493a136f121.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_013456_415082_EC9239D6 
X-CRM114-Status: GOOD (  10.90  )
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

If an error occurs after a successful airoha_hw_init() call,
airoha_ppe_deinit() needs to be called as already done in the remove
function.

Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Simon Horman <horms@kernel.org>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v4:
  - Add A-b and R-b tags
  - Rebase against latest -next (because v3 now gets "Hunk #1 succeeded
    at 2979 (offset -12 lines)")

Changes in v3:
  - call airoha_ppe_deinit() and not airoha_ppe_init()   [Lorenzo Bianconi]
v3: https://lore.kernel.org/all/1b94b91345017429ed653e2f05d25620dc2823f9.1746715755.git.christophe.jaillet@wanadoo.fr/

Changes in v2:
  - Call airoha_ppe_init() at the right place in the error handling path
    of the probe   [Lorenzo Bianconi]
v2: https://lore.kernel.org/all/3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr/

v1: https://lore.kernel.org/all/f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr/

Compile tested only.

In the previous iteration, this patch was part of a serie (was 2/4).
But it should be related to 'net', while the rest of the serie was for
'net-next'. So it is resent as a stand-alone patch, as a v4.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index af8c4015938c..d435179875df 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2979,6 +2979,7 @@ static int airoha_probe(struct platform_device *pdev)
 error_napi_stop:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
+	airoha_ppe_deinit(eth);
 error_hw_cleanup:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_hw_cleanup(&eth->qdma[i]);
-- 
2.49.0


