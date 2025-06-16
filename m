Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE83BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyK7Zsciqq7Gdc/WmqGLpznYW74mVN+9mTkl64s/CPk=; b=hNHY/qhRbesB5IUkqfCVr7DShP
	GLDLYVG6ezkaRcDodwV2Fm6BPqvIyMfj1Iki2ZSWzt6ihh1uYIb+s+OX1AyJQQAINx1pWSLPL+agu
	lhnfSHYLhPHkyL5/MwsboVYqa7bVdBPFixdjEgA/W2k3wCMg3A+0APu6Dc0YqsscQFUoedMQTS8ke
	o0B0F0NlIuQ3nfkQHNsPPOVee5LnBd3CobizPYr8uZIgKJDyDkLfXpgYcRHjhLaR/sBy9DqLd3Zao
	+wsOaffjjX7LnvrMJv7LktDCcNUGRHMCup4D/EnFzx4uM1aHaI4XJXNJlxyecF9KS7wUcIywGInVg
	MLaujI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjU-00000004qA4-0gjE;
	Mon, 16 Jun 2025 15:26:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fK-00000004VJV-1s3E
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DyK7Zsciqq7Gdc/WmqGLpznYW74mVN+9mTkl64s/CPk=; b=E+ytmfiT0rmzUlK16A+w3TSBo4
	0C6xQYmTz7ecey5z+zZkVjGOEkxsJNClX5ovHdiqr3hX5bYaoCxrbd40fCy6yPyC03NouXtx56qtl
	EihmVClm/maNScdzVypJEDqzUPiTpoDxQnwArUjLZ533BwNCMP7QyFxEZ6nJkFDDGqi1+90trP3e4
	U/Wkm2u7oi5gu9Wrz/6B8GPE+cmoFQFXLa9+Ta8KjGvljHzxSFhdNh/5PfBAFe6kMnigRSjqh6Elq
	pQKDb4mYmb0NnGItkaSpUvXCQguPiqB6wph7Xa05c+xAwTkyFWYLciVbr/LtpQiOONXvY2MqrfciO
	+dBh2Sgw==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000003aRy-322z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079643;
	bh=DyK7Zsciqq7Gdc/WmqGLpznYW74mVN+9mTkl64s/CPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aU0U4ivusVdtrxuWPPlu7XAx0brJ7c/IBctTBCJaQGerqk2Gf0jOWXL0Du8swgdMi
	 eJxyAWsihCFaZVdTzS59JSjvcvxNbsuuWhV7G4uJ1BbkTi0STlAe40YJIeN36sEz2r
	 RIdtkdFBPR351m+I5hkTr9sHg5qg4h/5v+1i3Zb5+VfzrDwcJB2rVcM1i2voLrQRlO
	 b21ScLnzRr+IYzlcPk3m49Bwuf5U5MwWwO0b6h0T53SwCTZ8Oyv0MSPH307JN/GI+l
	 M4xr10bWNXKwA2I6kC+WXoBg+wHTYZSwZb8XyPvUHeprcaQlUDEhn0TnBLaE+g8ToW
	 WYWDVe+n/yfLA==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E78B6884C;
	Mon, 16 Jun 2025 21:14:02 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:44 +0930
Subject: [PATCH v2 07/10] soc: aspeed: lpc-snoop: Switch to
 devm_clk_get_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-7-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141419_064233_70C7F42F 
X-CRM114-Status: GOOD (  10.43  )
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

Simplify clock handling as done in other drivers.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9992212c789d4224edcc0ee1a3bb9c73f9fc661b..bd4afa7f258eb3c1e64fe87d2b4be5f8422fbaf7 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -329,26 +329,21 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	lpc_snoop->clk = devm_clk_get(dev, NULL);
+	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(lpc_snoop->clk)) {
 		rc = PTR_ERR(lpc_snoop->clk);
 		if (rc != -EPROBE_DEFER)
 			dev_err(dev, "couldn't get clock\n");
 		return rc;
 	}
-	rc = clk_prepare_enable(lpc_snoop->clk);
-	if (rc) {
-		dev_err(dev, "couldn't enable clock\n");
-		return rc;
-	}
 
 	rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
 	if (rc)
-		goto err;
+		return rc;
 
 	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
 	if (rc)
-		goto err;
+		return rc;
 
 	/* Configuration of 2nd snoop channel port is optional */
 	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
@@ -356,16 +351,11 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
 		if (rc) {
 			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-			goto err;
+			return rc;
 		}
 	}
 
 	return 0;
-
-err:
-	clk_disable_unprepare(lpc_snoop->clk);
-
-	return rc;
 }
 
 static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
@@ -375,8 +365,6 @@ static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	/* Disable both snoop channels */
 	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
 	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
-
-	clk_disable_unprepare(lpc_snoop->clk);
 }
 
 static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {

-- 
2.39.5


