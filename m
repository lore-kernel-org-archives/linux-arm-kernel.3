Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BF6CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hzaer1RZQoriyuUgW8AMXxGnkkWZrxnciM8HyXU7+w=; b=YNkI5zDxdz4VXI6eNS0V6SMI+e
	Wzyg4kBg5Vg383r8utJ2cpJxHxgh8JQMka0QgAb3zS5b8LMuHLTEtz4tqTxbfftTvvEBd605OHmg1
	/PhRzM5E4UlM7ZkabjaeWxnxv2MrSByDxwFMsWoqyWBQdwQznya2jtcYEwJ9g+i25yXs9vRDh1Sy1
	Tyr8G666mYEwyQhmF5r+l8F3cDbMRWJH+GIGL801f/ndjdxu7kbzlnTq0ImtwlTbd+Yok9UhOcte7
	JcgY7n+7XdP2IJLMmbRYbhRkwU2lmGjZ67JC4Y4cnm8C3B/M22EMATk/RVDoaY2hcsnS2pMKWe6zs
	6yN4HDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSZ-0000000EbXa-36Zg;
	Wed, 14 Oct 2026 06:27:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSQ-0000000EbU0-3htP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:27:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so30477045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959241; x=1792564041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hzaer1RZQoriyuUgW8AMXxGnkkWZrxnciM8HyXU7+w=;
        b=XAN4KMsZUuCPQynZLhEsSgVaAAcjyrzVyPSZBhhPQZdw13ImgeRhLy8HogxQYoipjk
         PEJLP2yQa6NThbIBHmLHnvy7t6/w+gMMfnJKVsCmXOlHQAJt08zQweXZzUWNZjcPwhAd
         lN8h2rBe7ZuM4P/NWaiP/gWds2J7JbFr5xfzvzdI/uojGvtdaEnsb7o5mcIhUg1C5KrZ
         im2/0Tzgt9XSotYtqt5WVDi1Kpx+Qpb7+6p3I55ikm6fiORI7LEiVs7cbNgCYL/7Saey
         hBnYj/SGf8Tgj9VuoiaBr8ReyVeqh7msuXzMPQMDnDl4L1hTjbQLMatnZu6K+1ZD1whO
         d/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959241; x=1792564041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hzaer1RZQoriyuUgW8AMXxGnkkWZrxnciM8HyXU7+w=;
        b=e9v617VJyLCfmwJ8qRsF585v2eHS+VmgdM1v8aNmXHw8MbOXY5KjUXK66OBsOdlYul
         31NilmVZGZTxTVPikuyVgrnCzVMnPhqF1IYMYHH6KvirVfx89zgj8QMnPC27uQNGT18w
         gJY0f0SINbBwAz83fKP/k6WRTHhGew+afGxqwisbwRo0BNhcOgRM/joc/gMOb1Z/HHig
         L303SU0zUFvt8NGFsr9rWVr4Ou6+D4HF9LP1/KNQyUKwuzq6TZOeFguz6uqqGfjcpD//
         IfX4YBfdbHpwcvBdldAX4sSHz3lVEMYHWRcTdk5SJ3eZCQ+nQqQQoVTD6cUYg7cEoA9F
         bXcA==
X-Forwarded-Encrypted: i=1; AKwUvBzjpzWcaF6IW5DlLMWqHtWirklT+mZNytptm0+UkrQ8jS2q+Jao6+jIISONOrqDQzo4diwuYCqtcWaewQrezn5q@lists.infradead.org
X-Gm-Message-State: AFq9FYIzSa0Usngz3gdH6TNIWw3QJt0ktvpY083rvaeW4tUXYtRSykwk
	acTlBR23VHtaqjuImB85uX1m0RYDVhjHesirF7lN//dOFYTQvJDqi0Eg
X-Gm-Gg: AYBFou1LyDAJumFjEwBYiGKr7LGESRNkqddVVOexjvc5CBWlSePvX0NU95JVzP4ab2S
	fgL2jFmNlHrvOBECVHKv6dUj5YPIIAip3MZ8enSzdJZP7RItlcLQE3QFtQM1ZcW7AU00fiuQMlY
	PT/uKl28224mklSO0xjcPgmGjfCIYhvOs6QnbgNFigClAZTTM6lIE4ftpKrVWAqONv/l38xjizT
	eEapYA3F5KsQl3jsW5buxaqVtNqSYjcemQjM6uyc7Jk2aTYvEYqQIsEXNH/k53n8lr6cov81UqK
	usHgKXuweTN83SmYBPz3D1A5EXNIsRsf7VR1WuiBTU3DeOCJuWhBRYX4Zd2v/r4O95CwWsL9J0m
	GNGlZQ2Jcp5OMh3kEsbsGiHkwoHkJsZ9UvVpt4mydP4m3/iEPBsIHRBsh0NTYXWZtrXUw/nhqQd
	2mv2QFGg+n26W/L7iV9HH6uujSD+KsMiX/b2SfxdrwYiiD3LxEP6Ahy1IJo6qAZpxPgCGte8IRR
	KD5GAqjCjTexhg9Qri3p2+Akr6OuXdaV8rrPlp5DIHwGzBKhdNb1a1AKROoQ/79ful7oCC8Umzj
	P17Z2IOJtvYQPOCo8ph29F7+BVmoRs33ZS6jAp8d3oM3hSLVwUZTDQ35cu0lGiJbN3yYuZ56qJ0
	ci+n/IRdxOnQE
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr294041485e9.27.1791959240912;
        Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: stmmac: stop DMA when IRQ registration fails
Date: Wed, 14 Oct 2026 08:27:01 +0200
Message-Id: <2b70886410b5e9207ef170a48aca1d2d7ce24a68.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_232723_044724_056550C0 
X-CRM114-Status: GOOD (  11.42  )
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

Both __stmmac_open() and stmmac_xdp_open() start DMA before requesting
IRQs. If IRQ registration fails, their error paths release descriptors
and packet buffers while the DMA channels remain active.

Stop all DMA channels before releasing those resources, matching the
normal close paths.

Found by inspection. On a BeagleV Ahead (TH1520), fault injection in
both normal-open and native-XDP-open paths reached IRQ unwind with DMA
active on the baseline kernel. With this change, the DMA process states
were idle before unwind and resource cleanup in both paths.

Fixes: 523f11b5d4fd ("net: stmmac: move hardware setup for stmmac_open to new function")
Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8fd7d2173..5c4df26a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4206,6 +4206,7 @@ irq_error:
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+	stmmac_stop_all_dma(priv);
 	stmmac_release_ptp(priv);
 init_error:
 	return ret;
@@ -7259,6 +7260,7 @@ int stmmac_xdp_open(struct net_device *dev)
 irq_error:
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
+	stmmac_stop_all_dma(priv);
 
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
-- 
2.39.5 (Apple Git-154)


