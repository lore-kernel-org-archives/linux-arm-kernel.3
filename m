Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B46C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4POBYQSP3NtQUs6h8lOqxUK4xnDwwBeCf4pQ96aVpUs=; b=M4KH7D99lFGk4DDh+qUlPp8NJn
	EifRUPqEtD/5qQ+yeVPQb8Ng2qahLk7ntfPHYGL0Y5rngudykx/DKBXt0K/KutZcRB+/qvsQV8sUt
	e+g7oPQ5iW7htiduCtRuk+eaJ6HTdD5Rv7TfXox0fe1vnr7XN+6cjcTGSdybknNhrJngkGlOrhC2L
	dpO+OMUI40FgVAZdCm9VuOtM0lEx6qFeVN1UvEePiXoBfVdB4QiEvIsEXiLYWATNSef2+Ue4QxO7q
	TADN1kLPh3LLWdt7zZb7MYSewIWB40MQPY9dNAZI4zYcJq5G2pM8hdtLRJWdLydMjQ6ihmw2hCttj
	8ozU7gCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7q-0000000D42k-3JqK;
	Fri, 20 Feb 2026 02:20:14 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7n-0000000D40s-0RmG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:20:12 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-790b7b3e594so15985277b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771554010; x=1772158810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4POBYQSP3NtQUs6h8lOqxUK4xnDwwBeCf4pQ96aVpUs=;
        b=TjltM0fnIq6q00winvnqMFLLW6bjRzVGvHFFbBmx2FcrloMLLvFj/iQ6Aoo4+mu5qx
         pJ7xD8Kacn3N8pWEf5ZPt22k0QEDkPCyk0IIoNzlMBO5ONd3RO9XvY10tzD3hRs/s3TH
         lQxrrJVJMvjVSiDANh3W4XCI04E2P/BwUsKtVg/KNXdICxl59i5aootPwIdAUGrdSczP
         TDZj0+KsmFlGdeitzV6ta0JkD3qjdJf3lx5pQu45ll5jqkTcHTPhZTjLlQw7eSOdo5XL
         cpMEY9MMLE39p/gOOzquUy4rCu5C3WpChLnxinZHH3D8H7r6S7+nshvAD+NYY5B5MX7N
         jzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771554010; x=1772158810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4POBYQSP3NtQUs6h8lOqxUK4xnDwwBeCf4pQ96aVpUs=;
        b=cqCa3LGfbztl0PdnOCwJzfm1TZb0tijW7S0EnmkS/R0TDRK6hyWesiouqEniONWYOE
         eg0Gn1fnVmDrqBJmqoiKVbB2VR649izHGXowtus5EjvG/SIo/fdxJ8czRQtIcOdglO1z
         76dBn9/yoE2VFKvmmwsklFxnTjM3mE3EXpo+1IHxJbAO2Tv1iabXhNebZiuMTMjSHoMb
         cKoZo3DdiM+4KD+yigRFQoh7J1IHWYhrOHct0obkeJ2AxZNBD0mWzHwbOi/BdD2f+WXm
         7pNDhijlbdvMtgKp7ppl06VSJl103waf+AIZsRgzCVXpn2NNDaSqNwLmtwrw1KWaD1m3
         iM+w==
X-Forwarded-Encrypted: i=1; AJvYcCV9GtSFaRnkIrfDiII9QX+/GD9rFe8bsSmGLugl8dME1qnYjQTYj0XXYzCQo+xVTlH1+chje+HgBH71zsWrO/+f@lists.infradead.org
X-Gm-Message-State: AOJu0YyCS9i7ln0oTcdSguNlvi6MWxe+wXDUVe5CkYVHW5wXzQ6Tst1n
	ThzzdcXLYiTHIq/s2h9AZ0C3hyFeDMpmv7sdMuI+TNw8LFnUJua1ExwgrpxLf59BSrE=
X-Gm-Gg: AZuq6aI285s/t2nnjPRvv6aTOKkYDI3HjwiOfVcljGfvCayArbk2Oxv7vqLYAYd3Wyt
	TQnAnQRPb13QF/yijK+wK3ZvCnzZ5GnYilHAXloK9C9KBo0U9OkmefZK2pNXsuruTv/AfVuN/qN
	k2+tx0dFYZp/3uJftb6jlJZKZiBnePVRmq4GK7Xj0qcKovwPbUtX7YbIUKYH8Eqc+p6ZNLitC6a
	Maaf7bIdEmNaMMjjZ+0nXqKeI2JDbCt3i3MUriTlZ3ai2bLwKTCCvGJxazQPQvAPpXdD9zVo2FE
	FUaejHYTgB5ETzo0oWCbEXVYfBFrhacULBbAwVveTGvO8YajZN5NzRAt+kkw/B9MqvtM3l/sRkV
	UevpguyobqDXcwXmfdgK8SMKB8wBzxeESYen0XJ0ErW6QvDnP9Z+T5KIA716PFFoKMrhY
X-Received: by 2002:a05:690c:4a02:b0:796:6d46:8f8d with SMTP id 00721157ae682-7981cdeb482mr444877b3.41.1771554009873;
        Thu, 19 Feb 2026 18:20:09 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-797d142c2dbsm45550347b3.47.2026.02.19.18.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:20:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next 1/2] net: ethernet: cortina: use devm to enable clocks
Date: Thu, 19 Feb 2026 18:19:48 -0800
Message-ID: <20260220021949.40817-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021949.40817-1-rosenp@gmail.com>
References: <20260220021949.40817-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_182011_171191_5EF67F94 
X-CRM114-Status: GOOD (  12.30  )
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

Avoid manually disabling them. devm can handle this.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index a55f4b82d1ba..8726e5ffbce7 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2348,7 +2348,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		phy_disconnect(port->netdev->phydev);
 		unregister_netdev(port->netdev);
 	}
-	clk_disable_unprepare(port->pclk);
 	geth_cleanup_freeq(port->geth);
 }
 
@@ -2475,14 +2474,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->irq = irq;
 
 	/* Clock the port */
-	port->pclk = devm_clk_get(dev, "PCLK");
+	port->pclk = devm_clk_get_enabled(dev, "PCLK");
 	if (IS_ERR(port->pclk)) {
 		dev_err(dev, "no PCLK\n");
 		return PTR_ERR(port->pclk);
 	}
-	ret = clk_prepare_enable(port->pclk);
-	if (ret)
-		return ret;
 
 	/* Maybe there is a nice ethernet address we should use */
 	gemini_port_save_mac_addr(port);
@@ -2491,8 +2487,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(port->reset)) {
 		dev_err(dev, "no reset\n");
-		ret = PTR_ERR(port->reset);
-		goto unprepare;
+		return PTR_ERR(port->reset);
 	}
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
@@ -2554,24 +2549,16 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 					port_names[port->id],
 					port);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	ret = gmac_setup_phy(netdev);
 	if (ret) {
 		netdev_err(netdev,
 			   "PHY init failed\n");
-		goto unprepare;
+		return ret;
 	}
 
-	ret = register_netdev(netdev);
-	if (ret)
-		goto unprepare;
-
-	return 0;
-
-unprepare:
-	clk_disable_unprepare(port->pclk);
-	return ret;
+	return register_netdev(netdev);
 }
 
 static void gemini_ethernet_port_remove(struct platform_device *pdev)
-- 
2.53.0


