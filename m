Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B7FCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RndfiI2tvXOM+1ZP6efdxoHZT1tlHUVs/LDHnVUxmno=; b=j6wCRAQx1Q9a+lC2MCCjEi8vPu
	7ioKEhBzytvHLQeRB5sSkrODOoeo28kLb0BtGxJGEGxJxugbtaYSi2KPW/Q6h6cPFAAeXtZktwKjX
	wWEjbMZ2EGG7bn8V0aXomZS7nkVh09VOTYXtIPK3p1hwYCUlasOkm3SF8aN8BPGDZvzpG6kkw1eNF
	r8ws1cbQQndf7V7IVoV5UTs4oX0xb5G/CJHyIy6GL0wmH4AEm0/JTKU66HG8bZy6tzlspNi34KlDd
	Uz2vXMnbW7GYsG9H98THm/67YdCn4r5b/2BeJA+5bvqpm/Tt70E49j9fePA9fEJwZzcMlQl2Lohzf
	YNwuinfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNJf-0000000HSk2-2ywx;
	Fri, 07 Nov 2025 14:19:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNJc-0000000HSjC-2ggp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:19:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso1442392a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1762525186; x=1763129986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RndfiI2tvXOM+1ZP6efdxoHZT1tlHUVs/LDHnVUxmno=;
        b=jJkqxwODQepHiwgJTXZDFWK9vxkPdPz8rHpM37dvw2wLHWM1ROKCz4aYG+aV8J24QM
         c6azD0awTPyZ3YesWsexSa1hC6FU0klY5+kep2ojakyA/UY3UGrSK66+uyRACG65OMLA
         34y78qMo14P+rJkgCbgp+ONtQer5+6ny5234ZSZWggN2eB0AaascbDOUmWqkNLEf6wAB
         +npCBo/DRWmIbjx0k85oQ/PjyHf6owSwNqCWzoxaKC1pELgxq1eBcsusgflNiCVBfnjx
         zZToobBgAC0Yi7g3XJ1kN5dbB6u/xcOG9CeRGKrXyrJtxKugRsJfs/YMqaSvg6Mx4jHa
         slKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525186; x=1763129986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RndfiI2tvXOM+1ZP6efdxoHZT1tlHUVs/LDHnVUxmno=;
        b=ZYu3Sy5jhf19XlaszvkZ1BQu2C3YrhJrP7stT6O2XNZla0C8QY3u2GsD/HNPldYIxP
         2zkfYPgbHUt/DSzuyL5eXAby4FEOzAPQeliNaRJ4VAPD+i6HSzn+HKwLXQNwLbbKpC1M
         VQ/3gTV+RMVYWs0Cg4gTzM3Uh6Z6C14bIQlBcPUdcxZf/hX+Zmy54rgWcRcTLGMrTlys
         TUwTl/NXYhEiXYSaDFiPM6qUNiehbPxCCu7YrgPKJtgkyKCYhDrVoLJdjFKS106uBYFH
         5KH+m0zvwY/IhJ6eRdjaHrdkCVXIOTIR8/pQ+adALmTDzB/8G1ymjn/sCxKqBJWGBzC1
         CLTg==
X-Forwarded-Encrypted: i=1; AJvYcCX2TMOFbsACPOj+pByBLqcXNk99zizY6VIITzkpBAspO4pLFoSHXTaGQyCpW+SQNjHVy37uN5L/1LvowMZVQ9Up@lists.infradead.org
X-Gm-Message-State: AOJu0YyMemc2dwP/zdl4g19LCQjwwwgh0P6fJYkKEWqPdFB+UfaVqBb/
	AKHBjHNbuDzF7ytjyWoXAvyk3pkvxe6W0q8SubwqKjaTDWP2X7eC5ampcjJWqe/5+aJcPHtvJR9
	zSxPdfGQT1Q==
X-Gm-Gg: ASbGncsLXGAFMiu/ALQFqHDwKJUuZJXXrI0opgXQBZDGDBU1UUL2XTbe+6+/sz1ym+Z
	yh6tpC4olWA7GsjqLJNKBVo+B0jQprblhvHbWFPRZJPpwj/QHePhl68Wq7WaC79BBU2P+naZJCC
	VQ3RkxeLaQgwXmXOtJ61yfNaV1rrOo8l5d5wKZz8oIAQ9ZhE+Q0mJLMkO6Y6JTmJKPtJcsE+52V
	D6fU3s6VAFaE++nY+ZlNY1EbcTvJI7afjHr/Rt6fFPSjKq+tMtp0h7lKk3M/RK5dpbEWdf2J4j7
	8/BSZlOWWxtJk5AyOJMMW2ijJVx6Lk7VgdrLHBvGI+K2/WZoRJAoJfz/1O73Ul2q1pnfpi6f+eO
	MoEjzUsMsOG1n16gysfyP+EpxegCcBfKD/zyL1iRS0hkxkQpy9r3dWfOSpRL5RMF88s+rvO8eN2
	LVOjZ2VQgw72Ou8MnEJAWwIzgHlAi9I6vXtok82A==
X-Google-Smtp-Source: AGHT+IHvcVjtU3i+l/XfslQjy66bL0j3tv+P0XVI6VzvvCI0MjbHHb2f1vtJQa8ltGMFapgBfUjvYw==
X-Received: by 2002:a05:6402:21cb:b0:640:7f9c:e90c with SMTP id 4fb4d7f45d1cf-6413f06de7emr3189084a12.27.1762525186212;
        Fri, 07 Nov 2025 06:19:46 -0800 (PST)
Received: from fedora (cpe-94-253-164-190.zg.cable.xnet.hr. [94.253.164.190])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f7139bdsm4245121a12.4.2025.11.07.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:19:45 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next] net: sparx5/lan969x: populate netdev of_node
Date: Fri,  7 Nov 2025 15:18:59 +0100
Message-ID: <20251107141936.1085679-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_061948_718863_9E9A3E22 
X-CRM114-Status: GOOD (  10.07  )
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

Populate of_node for the port netdevs, to make the individual ports
of_nodes available in sysfs.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index 1d34af78166a..284596f1da04 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -300,7 +300,11 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
 
 	for (portno = 0; portno < sparx5->data->consts->n_ports; portno++)
 		if (sparx5->ports[portno]) {
-			err = register_netdev(sparx5->ports[portno]->ndev);
+			struct net_device *port_ndev = sparx5->ports[portno]->ndev;
+
+			port_ndev->dev.of_node = sparx5->ports[portno]->of_node;
+
+			err = register_netdev(port_ndev);
 			if (err) {
 				dev_err(sparx5->dev,
 					"port: %02u: netdev registration failed\n",
-- 
2.51.1


