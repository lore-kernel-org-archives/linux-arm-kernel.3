Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2095CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3lo2Y0hgRgiPSnYGSDe7Yf1GMCBIGPwRSlX2+EmhVtc=; b=dPRWdSMaRBo2kL7aHxdp5hXJd9
	3KwBpG4KMqO+ycWvNpasR6iIeYHNbzY0JEkPwLQ6V6mMSiX1PkwVPj0sLT76MQrWkoQ7vbyAPPiU0
	FUp5U/HVbOQznwXgiCrkjYyFn16kGndUMszReRSbBxjQ/zg30QCZ+nxM0K28LSbAI/pSaFYfAOz7P
	5kQqx10O83g135DRtwHzVESAbLN5dX5cOCBG2is5+pk8E7rAZhFPSDsXNQwbvB3krnZpTOnAz/LE1
	fnr/QcV3Ab92RvKWpcSzKXwdA3RSlxnhtgaOK5aC+g2+9fXsVBvKPPnzz+qfQQpLk+w7pUICh9foD
	+JkhUrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8Zt-00000007jr7-3Qld;
	Thu, 01 Oct 2026 04:39:29 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8Zq-00000007jqX-0Nqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:39:27 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-7f4f0c89e34so4316221a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829565; x=1791434365; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3lo2Y0hgRgiPSnYGSDe7Yf1GMCBIGPwRSlX2+EmhVtc=;
        b=AwJhLTPcuqnqzuNkSMShgDdfgfvinjWW1Oo6WCXEc3DFvzGLqe/t0AwIjjLLy8imfv
         Ky7xKTDqtfEdMiUAlGjGxvmfAA6+xQsDxrVWUXlbbQ+54qXbFPGuZBaNhHMHzaNAHlA6
         BxSoWCTzUf0zig/L2nRV//l6qrN/K9Gbx2CHIkJx5wAz6qZo79/EjxOAQdvXXKfTKYRs
         kGIxAIzeVR0FTE22/s3HKROIncSmtCfhg9446RyLr38m/RIxJlUdeeXeVCjIZD5VtS7C
         mXkwSvVSPvF0surkkdt4+0tdZVMHZAIUy5lJaYK3PcZbtrM+NrYryM0tNjVUJDsZQPMz
         u8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829565; x=1791434365;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3lo2Y0hgRgiPSnYGSDe7Yf1GMCBIGPwRSlX2+EmhVtc=;
        b=PdR1twPJT4b33UrZ+4t6H7oxnAzVPQ4LY1k9+Xsv+AjpUwLrKmZwSM3dFYiFHPhSy1
         0Ug00eTSr9tt8Ecf5J1Ea/bXmc4JnbYfVb0xLD1oLdGbkDQOs3X/uGxkUm/MXBH787QL
         0c3B4MYQmP2Fts6uUaAh7ueC6jmVlmC5hqz3o/oPg5Lu2VD8ywpxB/R1l8PZMc/9T26/
         OvcmMqmh7FM8DxskBo6ctbhdy7QDm2LdO8a6Et/TVTeD5MfIKCH4zKxbjv6Z1NeJh3DP
         kMe6+3zVSuwJa2QfySuNL8qPsXXwnT94wk+lsgIdqlJGG02okbQho4unGR9+k9md95ZC
         mMvw==
X-Forwarded-Encrypted: i=1; AKwUvBxZSu7YBbYX8+DBH8JAgfImt5nYAMXNbOIpLjEmYdKdcAp7RpI90Env3WgKoQGnxdDuvVTCNfYQ7AvGo5tB8KOa@lists.infradead.org
X-Gm-Message-State: AFuF++kq1jpQboFag3vkrK2aah928RV5s5wJbJMKNWEdghlILapmH+yD
	ksT0oW+SadhRB8HPkc8CZkHiEWke5dTQNqvpf9gS6LumXF3GIsc6+oI1
X-Gm-Gg: AYBFou1+qlAMqDExYAJ+ybYk08ONQRPE7As1K6BcxufXnEvXOteEU+tfkH5YUPA9yxi
	Bf2+zJnf1uxXK/lpLuLPvlV5R4f2wtheDYVBK5P1lM3WsI1cmvD1sghWxuYOx5lHnlgeiLY+zJJ
	zZcJt6gF0oPupTZqAv4HyvuICdqpPW9KnoWXt3e8u1BUibopjhmRuqlhdTAHvlBnIucqFGZ8lLf
	x3c6zN/5nbdd1px8f8KegYR85V7ypA3lZRemoL5Oxo3rwAPBKdqlhpYPPy4QZ5fMZcEkOudzUYm
	69k9ONWpZ1sYWd3XEmzsrs7MVcZoo6YeP0P5y7fDN69D8v379k+Sb1vTiobxhbAuZl/QbDgywiQ
	cUJkZLedU+zSiHGR9CBhmylJzHMyzGFI7IaKJy7DUYknOI8khfpXBu76dF3V9mn0zQR4jqwtBXa
	dUubmN17/F4bCsx4hQpOfrkq9sy5h5A0oppgTSU2Ko6D8s1aVaGI8I9JfUAOnbPtZ451fJt75DP
	A/+7Uf577cCArdYzHkr4KKbKdeljWhZqovv+dmmvAxf/D+Lgb9Iu/yXiJmBr9RAxbGC1mxFwq/E
	aAtle1lYIqIj5MYM+igcJkHF00LkTK4GkcfS6+DNreJ+XLB/Hc625fs+aGItjQ8C0rNu4lf0zsX
	TPpUYIv2mpGXsm+0L0tO009+csQCsufw0
X-Received: by 2002:a05:6830:6d4e:b0:7f4:eb76:881d with SMTP id 46e09a7af769-82049119577mr4659618a34.5.1790829565141;
        Wed, 30 Sep 2026 21:39:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212aa1a2b8sm1792815a34.13.2026.09.30.21.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:39:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:39:22 -0600
Subject: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ6DIBBEf8XsuSQIFrS/0njYxaVyQC1g08T47
 yVtj28mb+aAzClwhltzQOJXyGFdKrSXBtyMy4NFmCqDksrIQUuRS4zoRCy78JjLhmUWpu9bzTh
 pGiRUc0vsw/u7eoeFC4y/MPFzrw/l3xBmFm6NMZRbg5Y8Ena90qxda65ESsrO2Y69t04OxlhFz
 sJ4nh/Y9ncutgAAAA==
X-Change-ID: 20260930-stmmac-mtu-fastpath-68813ead3b90
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_213926_704026_90A9DC17 
X-CRM114-Status: GOOD (  14.43  )
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

When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
receive limit do not change. Update the MTU without restarting the
datapath.

This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
rejects jumbo MTUs, so all supported XDP MTU changes take this path.
Jumbo transitions remain on the reopen path until the rollback change.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..03cd14d10356 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6161,7 +6161,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20260930-stmmac-mtu-fastpath-68813ead3b90

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


