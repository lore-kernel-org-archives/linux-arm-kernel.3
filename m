Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD7EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfJ0cCHapeNbyNAgsQ8Z4q12xaRaql+ZZwG0MaR9T48=; b=Ev4qZP87dpxVuTaVdKZ33ytc8A
	kDDJvUxQIxaRqW/y3ciGExUt/SB5PJsf+jZllYMm3DQQmlBXQLP6ULc8eZivtLvgub/P6emgJNYGa
	Bu3QOgt4JQJArJoXY9gGYQnh30vnEcHNusNZpoQoxA/w/WRX578vrXrmm240yBPIw4+NzdavPM/C0
	FTNn1vcjrqOVmezSFs94wy3/yTUEUkUWmjvNr/cPgwnYGMSNuljhfRDfN62ijXZJl3aJ66tKMSYtS
	kTxOokrj1av9K19Kme7w/1yym+VBQeWBJs03qlsOLqvNb9dr0xz9/CHuwG0nznMGwIWfsbvoqYf2g
	pf12Efcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3GS-000000019Re-0xex;
	Thu, 08 May 2025 15:34:24 +0000
Received: from smtp-75.smtpout.orange.fr ([80.12.242.75] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2cj-000000010Fx-3WN6;
	Thu, 08 May 2025 14:53:23 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D2cYuomdl816KD2cjuwCox; Thu, 08 May 2025 16:53:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746716001;
	bh=zfJ0cCHapeNbyNAgsQ8Z4q12xaRaql+ZZwG0MaR9T48=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ku7444auv/NyhVOhgZW5hxKgFMj295PSUl9uFoLDmzbekZTo1iBYoddoOQ5F1alUm
	 8TVBJiRkpI8kinjpS7CqesW8BkNWl1tUcWhQQwQv8EMjbSwXJP/IifAa8to6Eoid5C
	 1x9hDbDhXlKnvu+ei0omsFqHeXlsdG0PmU0POOdIqyQu9Jp/3mF4FVbBf4L5sJHtVF
	 CQPxYyeewZMIIg22zlZS4zPbO8qGnTQZ2gVhEtwTXcQ+d9W7QFu0Mur6Sj6uTdHR1O
	 4l494WCLcLPAze8TmRGdADIG6DI4CJWKutsQqCxqTFGUos9j0IkF4igF8KWnAFPrMr
	 bJO/bq5le0bew==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 May 2025 16:53:21 +0200
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
Subject: [PATCH v2 3/4] net: airoha: Use for_each_child_of_node_scoped()
Date: Thu,  8 May 2025 16:52:27 +0200
Message-ID: <88143d6af26b32066c92b5ba81d8e08c55426ebe.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075322_007758_84AEFFF0 
X-CRM114-Status: GOOD (  11.87  )
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
Changes in v2:
  - New patch

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


