Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A69C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yv0q0yAiYrK7cZmfj6mkT6aQadrznpZkBjcoHK2bCU=; b=hJVqv4+fxBtDOsu5RJDmvxMOoB
	CdzGpe7JciC++BRk8Bx+FPJS9TxGaVg9i9IbQbQ819kRV3vROfVXx5Gzs/erhd9LpD6ihMcolNdA4
	4zpch75klaTwtyRLWrvW0gb3JPRHbBr/xJR8ATXDwH/w15PZECPjCwHdQ41xqLOUVzxQ2oZiByDv2
	1aJCtqhpDZWhWeeJhi0JyJy+1HDrzvMR+zzG+jzg13pSvK8mPH0/TcQp88JI973Pdfwgfzr3Aw7+E
	C8gJh+0pVnOciZqP1AVVdnM9iF3+K29p+ismX9oE9QFoJRkjMUO2nhyOf03fq9LmOkQrcF70TZD6g
	2XPs6kFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kNu-0000000G1MO-2T5b;
	Fri, 18 Apr 2025 11:59:54 +0000
Received: from smtp-78.smtpout.orange.fr ([80.12.242.78] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kM0-0000000G1AL-41ti;
	Fri, 18 Apr 2025 11:57:58 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5kLrukPOCwRVI5kLvuhwOq; Fri, 18 Apr 2025 13:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744977474;
	bh=/yv0q0yAiYrK7cZmfj6mkT6aQadrznpZkBjcoHK2bCU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IINTY5fD5eE9X34gkUqcTpIp5tMMKToJugigViLAGf4AtTGY3QZOXd2wI9uhTvGD+
	 TpoeTrogvIVoGn5k00oxWtPAyYL5o0CitNncozgvTPip+N2K6g9RNsKQuHPioUGUC2
	 88SB/FjhYtEUg5qD9OaUJ95QSiWaToBOfFqC9gw50drFEBB3BV79yQbdxxqsl2JhD4
	 iLDPcWoshlYskqjEH/J+z9WkDunNg09uIL+ypQXL1DlRTr4OSaTjsrwar7Q/4aH+KP
	 L7xpMIjhJbJK7D6ZKUdN1qZ9w1HZ9cCP1ps6nEm2mJ0S0CBXec4uMfbafBza5I22EK
	 YVu+8pjf7hzag==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 13:57:54 +0200
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
Subject: [PATCH] net: airoha: Fix an error handling path in airoha_probe()
Date: Fri, 18 Apr 2025 13:57:34 +0200
Message-ID: <f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_045757_132520_0E57A661 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
Compile tested-only
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 69e523dd4186..252b32ceb064 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2631,6 +2631,8 @@ static int airoha_probe(struct platform_device *pdev)
 		}
 	}
 	free_netdev(eth->napi_dev);
+
+	airoha_ppe_deinit(eth);
 	platform_set_drvdata(pdev, NULL);
 
 	return err;
-- 
2.49.0


