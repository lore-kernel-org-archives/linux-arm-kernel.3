Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E82C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWAktAj8+a2EZgQ4kCGxOWW2beeBTXDV3b5mgoUzlt8=; b=pPAhlGVT7fvGq97Csn6ex3BKEx
	Jwr+O467cbeJro0cyXPc+ELUcU+nRj763BHUM8jes1DfyEHSK6yPxcWdkcQm3UvJFR0Ii60WqD0+k
	fyN7b7oS2WPZsdUAbdqgAhmIg1/Ss9A7ACz/1lpf4EvJZIv0+LmnJ/dGU0T3EPfufx1hpXNYfml+J
	I+ZzvgShoSw9LQyvdp91gp89d+PWdjsFTfEH/C+EmqGv4cZvuSlbAGZPvsw8XO9yFz1w5oFnJNoZX
	ltR0NlGYgClBzw8I5iiLazllqYJ4ZkwMrAqsWMEquhb+8gazCJoJdHXCOJp4eOxTzCT5AWTU7xVvC
	aboIUQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHO-00000002thg-3Tb8;
	Mon, 21 Sep 2026 16:54:10 +0000
Received: from mail-oo2-x2b.google.com ([2607:f8b0:4864:31::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHM-00000002tgu-05uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:54:09 +0000
Received: by mail-oo2-x2b.google.com with SMTP id 006d021491bc7-6b1ae6c9b81so327361eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009647; x=1790614447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWAktAj8+a2EZgQ4kCGxOWW2beeBTXDV3b5mgoUzlt8=;
        b=ZEHbVq2H8S9FydIOAHVupeSzqYOk/7aJM6WizgXtf8M/4POskmwrtBDZxBWI8uKQd/
         kdxm1/yaS68YG6McsbeO6iQ0wnJ2OCI4Jkr8/sbEweOcvQma8o+O+tVGwKZOWgQ+5Jmt
         t9TS0D3+k5quaRE2GvnhS4iK9byvUjQb12dtwjlPQKGVF5BHHgmbj1vVO/kkcwZU1FyF
         JwzZUWSSgoAP/b4zSz7J0TUQOLYhgH99Z9bFywE31fu2Ik8TRGZfTTTNy3pXQC3vmBay
         zuyKnNrLBxLiR+u2Z3HKBzQqyTTyFMauzgY/4td8f1Tfx/bYi8jbQVX2yrwg+hTiIh05
         jXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009647; x=1790614447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWAktAj8+a2EZgQ4kCGxOWW2beeBTXDV3b5mgoUzlt8=;
        b=J/um+OL2KhV+jTZ2zumftH7CC+WSwiRifDBhpvpBEPbrpO0oianYYe/QtleFl8EsZz
         V58txAmfnhqwxGCjhCLnDvcbUSkKrD7CTCrN8rR2GnhmECkgvEiGkGAc+BkMvTaTGc67
         12gy2HTWO9NRw26sFCLTfRQ0AC918WsdRIiQQyt/yND2rsP7/oXpJ4+xtKfzgKmUHfu+
         +aR8sFJ78ntlUE2I1SgwSuJC3YR4rJDf5trjcmEwp7o6JNDelxl/+b6CJ5ecIGVks1kf
         1JDTbOVRrhbE2twr2M53vzSrMoiQQlvYuAVHy/jiMdxrbmWQDryZtkW31itGr0274h43
         un3g==
X-Forwarded-Encrypted: i=1; AKwUvBy9IU4rGMPh24MTToQUZhlKlsaKH/PIGuX3J+wqnsq6jGQwO1J/Kw5suA9ojkqWJUp9Y1lPrYW8oP4WajbSb7rO@lists.infradead.org
X-Gm-Message-State: AFuF++lqXwik1t27nafo/FtHej8m3A/gcqMpuZwjpf04Fqa9D/z+g9Ie
	Uf9kSxxPII4ej9o3cFi0+n3j+j9Ds6wDFKBCNi1VZiVSMu2P+Co7Fvcl
X-Gm-Gg: AYBFou1bZTgpLJKjor9pk/ucVc7qIwvXdDRWacK2SfiMUMovExIcoyCW/nl35WKpO7B
	WeqnZ/oGSDOOXA5UZrTLP3X3W0TMIImV0hfh0WEJ1Vg3BnPxdevLluTeYV8HPCmApD/Gq2iEXq7
	bgr5B73owOnPt/Vd0LpPQ2GCzY+jkUuvmPNEKfuCs041XFspTPD3MK5dXpw4+Jbna1m6l70hOl1
	fQYLeBmgSipksAzm1L1fpNgFq+jL8EF3GOmC28eI7hY/HV32e9ooGzqneCxS2BxY5J8ljCHzDGz
	sl4A38mIqmArjILoNnhQvlR1Djvh4/78GVRuCVmy6wSerK/1G2UVXrPbAwak/DyT2mgcNNdlezE
	i2kdlME5/YFwFDCnXkiaq1ujPHtR80zi4cXTQx7PHFgA9scKQGrwFxR6QVAhxoU1V8QJ4YI8AJG
	xzd/p63/RvBTPgFzSZyCB/ZgQen076ey9qU/BvSj/T9isUGYIq70U5KpV17CEGyb+2V4HUS11AE
	jUdpLVb2KmLMqUFZD7uCaWnatKbtI0zVCx06fGum0sx7SlREMqIRFclUV14y0ZEsUThZXvmM8vK
	0IZnE51v3W8ICoTMpvcTsnrCdybB26qJRwcF22k6BkdzXN0CAtxWdx9DNl5YW8vNpxkjEqFTvdF
	VwXzp0snHlBnMWEtHgvpPOw==
X-Received: by 2002:a05:6820:812:b0:6b5:ec3f:497d with SMTP id 006d021491bc7-6d15a65b6c9mr206525eaf.24.1790009646999;
        Mon, 21 Sep 2026 09:54:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 10:54:03 -0600
Subject: [PATCH net 2/3] net: stmmac: close the interface after a failed
 MTU reopen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-2-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_095408_076123_44056832 
X-CRM114-Status: GOOD (  18.42  )
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

An MTU change stops the data path and then reopens it using a newly
allocated DMA configuration. If reopening fails, the new allocation is
freed while the netdev remains up and priv->dma_conf retains copies of
the freed pointers. A subsequent close repeats NAPI disable and IRQ and
DMA-resource teardown. It can hang in napi_disable() or access resources
which have already been freed.

Track successful opens of the data path separately from the netdev's
administrative state. Clear that state when releasing the data path and
skip a second release after a failed reopen. Close the netdev through the
network core on the MTU error path, so the PHY attachment and runtime-PM
reference are released and the interface is marked down. A subsequent
open can then allocate fresh resources and retry normally.

Keep successful MTU changes on the existing path, retaining the PHY
attachment and runtime-PM reference. Allocation failures before stopping
the original data path still leave the running interface unchanged.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..873331dbaf77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -281,6 +281,8 @@ struct stmmac_priv {
 	struct mutex lock;
 
 	struct stmmac_dma_conf dma_conf;
+	/* Paired __stmmac_open()/__stmmac_release(), serialized by RTNL. */
+	bool opened;
 
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..44b59d0f56b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4179,6 +4179,7 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->opened = true;
 
 	return 0;
 
@@ -4249,6 +4250,11 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
+	/* A failed MTU reopen has already released the data path. */
+	if (!priv->opened)
+		return;
+	priv->opened = false;
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -6174,6 +6180,10 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			/* Finish closing the PHY and PM state, but do not repeat
+			 * the data-path teardown after the failed reopen.
+			 */
+			netif_close(dev);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

-- 
2.53.0


