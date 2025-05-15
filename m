Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D040BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syHX3ePlCOfAt9od3HD1QU5fZnKKQgenE6TOoaHBCO4=; b=bd4J+jvvsarnJYvEbSUIwwpD6g
	9062DI0Ke+zIT1LwXiN+6C5x7XuDuAdfam0nSdJjCQV9oKKm9eLjjOsLFBLI8OBJRfwvcTzM/cPwA
	B1ioxgxZnvWWmQwYon9dqKNkow4SIZzh2wr+Nx2wsVC7scLpJFv1qd4JpPoyKPeVmg3FB0CggyBCA
	/keCxPAScgK96JWgKHob6ZsHNAqJKcV3EmI2bhQiU7jzxgKyCmE99Vmh6HhqEXMt3LPCA+xPGHyIY
	0hbGZ6o/rDC2Mqr1DMF2kDvlxCX/dkwMNEsJJk3ZyWT3e8zRVAjptGQ8XC8XGjOI8EuTXTQ0bEW8P
	GsJIaahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFf41-00000001miQ-3Ty4;
	Thu, 15 May 2025 20:20:21 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFekO-00000001kDF-2lw5;
	Thu, 15 May 2025 20:00:06 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FekBuCN6oIqMPFekNugnlY; Thu, 15 May 2025 22:00:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747339203;
	bh=syHX3ePlCOfAt9od3HD1QU5fZnKKQgenE6TOoaHBCO4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ffImzayxzCuQqUxZrUmLMtOQvWTsL5s8UxxZdZ55u6P628315zXwChazaAuvs5Qrp
	 LeAgU58fGl67+u6f34HzTj0NDa/Cwc79lSbvH9gMNenK6ng0Uq0Ag71rHG+3X3REX3
	 a9YInNI6m9KBwCHfNFKCVY4bJyBNmlZDziqv4JedkhDlQTIvpmNVUPG7UieArsMfaV
	 BJMzlxW6e21GtYPtM0lsTM456+aZHlWDHMdWdReK0rIaqq7d/nsvhL+0+nyaIAYcPe
	 P+ZJJPSDk+Pn32di25T4oJeer8jgwxQp48UkETzlzIOo8YBU0OEqUCwmmAjLKCBrqX
	 7NjKXKlU2pAjw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 May 2025 22:00:03 +0200
X-ME-IP: 90.11.132.44
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 2/4] net: airoha: Fix an error handling path in airoha_probe()
Date: Thu, 15 May 2025 21:59:36 +0200
Message-ID: <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_130004_830839_DCA1FE62 
X-CRM114-Status: GOOD (  10.13  )
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
---
Changes in v3:
  - call airoha_ppe_deinit() and not airoha_ppe_init()   [Lorenzo Bianconi]

Changes in v2:
  - Call airoha_ppe_init() at the right place in the error handling path
    of the probe   [Lorenzo Bianconi]
v2: https://lore.kernel.org/all/3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr/

v1: https://lore.kernel.org/all/f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr/

Compile tested only.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index af8c4015938c..d435179875df 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2967,6 +2967,7 @@ static int airoha_probe(struct platform_device *pdev)
 error_napi_stop:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
+	airoha_ppe_deinit(eth);
 error_hw_cleanup:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_hw_cleanup(&eth->qdma[i]);
-- 
2.49.0


