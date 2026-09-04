Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A00C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3dL0egSy8DTtUr4CXWNJ8GM6xKBAt9Bp1+ugQV01Cuo=; b=TqMTLKD3oDu1Lp+BqFbHoDbCyd
	sFmYiIwgr2LZOi/nu0k956dcFdTiPXhLnd3yTVi4IMe94jZNYp3XCp1PJb2kXGFoOgjBV5eVDVTbx
	D2UMTFilvRmmtVcVr0mI5+Y1oSspM+2sSdxCXiJQwLRBQy6ZxKlJ9RBKr6rvtxyx62jJawuySYYnc
	0OKf7qTBvBM6DaRmBkDtFzYsLmK71vHmBYYmPzjv2NeKDuTKFMWHbXUG0+Cl6C2nHX2TtnPveNFZn
	irVOc/xuRnInXUQ70yrCkGqe1O9ncIjVdeY8ORzzPf7d9OgX1dbQ97sXKoQa502aowQY5F07zOl4c
	SiPiucrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NlR-00000001CC9-1Hjy;
	Fri, 04 Sep 2026 06:51:05 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NlN-00000001CAh-3DE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788504599;
	bh=3dL0egSy8DTtUr4CXWNJ8GM6xKBAt9Bp1+ugQV01Cuo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=aceK7aK15NCzmtkJmM0cU2ziABwp0YVgom/rHBnccTObd8Sde2+cTqN6sGYyKPklc
	 gC1msKxH8dnj0YXFmd3DvU/vhtr5Xlkdo8oAJVZeZY0UkYVlq2Nf50mXAjOhLc1JBf
	 ZexDl027qNh6Sjomc2cO0tQNNGe3iVZHk8/mHzJk=
X-QQ-mid: zesmtpsz5t1788504593t513aa32f
X-QQ-Originating-IP: UNpvxRAsxKVk7llXKdCGwbk8TiOVZQ9U6jSAqsxXAe0=
Received: from [10.10.7.69] ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Sep 2026 14:49:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 400259316749825110
EX-QQ-RecipientCnt: 16
From: ZhaoJinming <zhaojinming@uniontech.com>
Date: Fri, 04 Sep 2026 14:49:35 +0800
Subject: [PATCH v2] net: stmmac: clear dma_conf in __stmmac_open error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>
X-B4-Tracking: v=1; b=H4sIAP5pmmoC/5WPQQ6CMBBFr0K6dkwLpoIr72FYDO1gu2gxbSEaw
 t0diBdw+ZL3/59ZRabkKYtbtYpEi89+igz1qRLGYXwSeMssallr2ckGRv+GXEJAA6HM8JPmTIB
 joQRjIgLdNRY1DRdspOCqVyLOHTOPnnlA9oeE0bi9PGDm6C46n8uUPsc5i9r1P5cXBQpMq6y5W
 m1Vi/c58kuFjDubKYh+27YvhyEdT/UAAAA=
X-Change-ID: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>
X-Mailer: b4 0.14.2
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MRPQukou9wBmBZPRtGRnVeDeK1Fx3kFgQ5ii3Gggb2FQrbOzVNwUknth
	S4lyawE8GG8/RJKPSDmTgr+1eMiTRB2Zk1U7bZqu+nwUMoqm2wh+fb72Ll0dtx8FdPYGOfd
	b8nAQKPXrHsiyrGm4wZBu18ACLXWMYoMtr7BE0gC46/QQWUptUPzy1UhtK8SxXMWhcej6Nd
	8Mf5eCfu9n86PV+dRkvi4ld76YWMvgevIjCEWAIEfh3vsXrmXAMqJMPRJtMBGVRtFpEXA7y
	fqtT9k6yKBuY7g69v5zMkWTXID3851NuLYWcJYLWiVGxWqjEa/z7sxyAMiwP9/+F1L0qRW6
	cUuKJZnNCgzb7pqWwyXrriKW8mUPxZlnyH/1eZhQ4/JOUflbX4DJwFnyRrjhFaMxUdXXf3w
	GcgLezbh/9UNNMEWt+2ZfS7aY7rGoCXc4/yYfmGabQZa27LCIKOQ09dXqMYj3OHGfxmpH/g
	v/k5ourW90FyMeB0HuwwxXVU23uDS9O1VIIjoEKqKPFvn8XCxCp+nXqnUId66Ia60dQJsO8
	GuZ7y96tDj6avbSLse2u8/Zymb6VeSRAnhNHlwoEzSH6D0r4ptAeNRMWRsBEXFHm1owlURX
	/8JbxLtm7Tn5Oq3SkZALO8QWGaYPL9zokR5dAGls/2mwN0WpSBECebxy3f/vBtjsLCD1y7U
	pGgGqH7b1s1V/d0KkSoV5Ddbgglf/tT4/uN52/Rxb0mT1ADYPI/Hw/0qOS+45yWV2nFBJaV
	qyi5Dq0ZmjVNS6GEBR16wym7E5LRW5d7s1thgpBObyN+8LZuUKWIH5K3nYxOVZMxD34i3/G
	vhMKbFwXYXZRkyfdDgkSjXAMAqE6QRKVbaTOIpJ5o875dUibWNPGcGAw5ck0yBLGXuBaMag
	SzO+LMemzUg5TAbJpnLksJjnItuPZFx4LgHdp5R2q7HMUDZC8emoQG4ujUHv6AlDmA5DvdM
	vG7fJP/VsthjA914IHA8E8QBrj3lAY73m38P+GV8f+Vrs2sTYGS8vLUINgC4Hi2FueDQTzu
	sgaBZbkacKBZ+7lR0/j3t3Y4PAt6x+ebhp9E2WyyXuKnznLq69M6O32Wgrh+Q=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_235102_693822_24CC7927 
X-CRM114-Status: GOOD (  10.99  )
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

__stmmac_open() copies the freshly allocated dma_conf into priv->dma_conf
via memcpy() before it can fail, e.g. in stmmac_request_irq().  When it
does fail, the callers free the dma_conf descriptor resources and the
struct itself, but priv->dma_conf still holds pointers to those freed
resources, a use-after-free that triggers when a subsequent
stmmac_release() or another MTU change releases the resources again.

Undo the memcpy in the error path by zeroing priv->dma_conf, leaving the
state consistent regardless of the caller.

Fixes: 30134b7c47bd2 ("net: ethernet: stmicro: stmmac: fix possible memory leak in __stmmac_open")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
Changes in v2:
- Move the clearing of priv->dma_conf from stmmac_change_mtu() into
  __stmmac_open() error path, undoing the memcpy() at the point where it
  was made and covering both callers.
- Link to v1: https://lore.kernel.org/r/20260903-fix-stmmac-mtu-change-use-after-free-v1-1-c81dc7d6d18a@uniontech.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b14454fb10deced6516eb89e2c0c9..4369e64faf9f878aa20ac5075705044f55c5f8bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4190,6 +4190,7 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_release_ptp(priv);
 init_error:
+	memset(&priv->dma_conf, 0, sizeof(priv->dma_conf));
 	return ret;
 }
 

---
base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
change-id: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30

Best regards,
-- 
ZhaoJinming <zhaojinming@uniontech.com>


