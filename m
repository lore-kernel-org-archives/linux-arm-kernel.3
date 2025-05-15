Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B947C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VMO2LRAf5h7BkfuRnV9EKcKqpImVHbFdSRbz9p/Fnk=; b=JtrwdJQLmaLMAf6yfpzAY4XC09
	KmBzCwWzc/YRRxT3YRcWM4TeoDFh0bnB9ttrv3eWfuPwY1khvUtmt+298QIRqFZY/TAxczFsfzWVm
	/eg0bc4bOQxuh5Ce7aabn4Z58mEHT8zVJEfIoU8+I3HnJk+FrHBCiQexM05r+0eS/gs3yJfY3FJJo
	E0Wu836WGyAQ0q4cwoUX3Am1JPx0UgBF5jWMkztVf34W1kR7gy6L1HQlDflSsZZPG7M04EdnWyYPT
	hvWouVUOUPmTNJiJUc7IJT25lHj6rXwpVHKqt9096ctM3lqNObOPEsNU7T/Xl/ZxFldp3RL/E5KVt
	9oNWkbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFf60-00000001mxu-41j8;
	Thu, 15 May 2025 20:22:24 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFekP-00000001kBV-34uJ;
	Thu, 15 May 2025 20:00:07 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FekBuCN6oIqMPFekPugntG; Thu, 15 May 2025 22:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747339205;
	bh=9VMO2LRAf5h7BkfuRnV9EKcKqpImVHbFdSRbz9p/Fnk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XiJhictn2UmnfDfwrcC7D58HZGUBO8mKzeldPQxn8LDJsMx1wkOQU0MsiB2KZ4kVq
	 10Hpw2xwF782/Y60WN+CecmMDvWrLnwZAedpEgS8YXF9mOQaiWpSL9Fk5tQv/if4Jh
	 JhMWHyv7/L6yq0f7u5++mrly6T1MKrR/AzXVkGVIG1CPfdi04kP3nMANLrD1mTs7GX
	 9IOmsrTgI2+4DpSvDPFb9Gpeohr2UOl1Fxm6YoUHwSjbD6NEMIWIzsjmFd9gcz1IcH
	 OodvnwXtf2upn8ytmXrc/FcEhP19RVn0MYJl3CLNu5Jj4GG1U3gz9wwNQX2pFHd3hY
	 MEt5YKsE0SL1A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 May 2025 22:00:05 +0200
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
Subject: [PATCH v3 3/4] net: airoha: Use for_each_child_of_node_scoped()
Date: Thu, 15 May 2025 21:59:37 +0200
Message-ID: <38143a6af2fb32046c92b5ba81d8e08c55426ebe.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_130005_912028_8639159D 
X-CRM114-Status: GOOD (  11.66  )
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

Use for_each_child_of_node_scoped() to slightly simplify the code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v3:
  - None

Changes in v2:
  - New patch
v2: https://lore.kernel.org/all/88143d6af26b32066c92b5ba81d8e08c55426ebe.1746715755.git.christophe.jaillet@wanadoo.fr/

Compile tested only.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d435179875df..2335aa59b06f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2886,7 +2886,6 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 static int airoha_probe(struct platform_device *pdev)
 {
-	struct device_node *np;
 	struct airoha_eth *eth;
 	int i, err;
 
@@ -2948,7 +2947,7 @@ static int airoha_probe(struct platform_device *pdev)
 		airoha_qdma_start_napi(&eth->qdma[i]);
 
 	i = 0;
-	for_each_child_of_node(pdev->dev.of_node, np) {
+	for_each_child_of_node_scoped(pdev->dev.of_node, np) {
 		if (!of_device_is_compatible(np, "airoha,eth-mac"))
 			continue;
 
@@ -2956,10 +2955,8 @@ static int airoha_probe(struct platform_device *pdev)
 			continue;
 
 		err = airoha_alloc_gdm_port(eth, np, i++);
-		if (err) {
-			of_node_put(np);
+		if (err)
 			goto error_napi_stop;
-		}
 	}
 
 	return 0;
-- 
2.49.0


