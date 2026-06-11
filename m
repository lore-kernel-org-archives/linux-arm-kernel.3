Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C8CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89WdVHtEcEjrTXfXmO5KLfdPm+uKXRpF6kTT1kAcq9w=; b=MISIK29HF3eI2rvRmQraKrvNIz
	C2CmTbQUNSh+qTmudKRMHTAQei6t0z8Yl3O9UInqdnwQE1a4u4S5/uBnsZcEGWoAJSX9mHQ9XUeSG
	PrSdcjvRES8q6/4ptjZ6Yg2/1MYkpg1iGcBqtMhozPKjMqlLdKqoVs2/4/jdhlBCSDtpSjJ1K8Day
	6OTB05k2thy0G1xZeDHbr1N5uF38zv6M5ASeOuqK2en0cfG5P19JYMAR1tThWRklf2uYFwovsxXk3
	NQLaeaArdqJPpe1SvzrJyBp2fI4DbyJjluJV07qKogOiRlveUCWdGURTXDcH/PSNIEcJRsmCTbb9X
	yJ0p3SzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcOK-00000009CQc-2VEW;
	Thu, 11 Jun 2026 10:12:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcOH-00000009CQ5-1ugN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:12:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso65494095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 03:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1781172719; x=1781777519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89WdVHtEcEjrTXfXmO5KLfdPm+uKXRpF6kTT1kAcq9w=;
        b=A3YmHpUHc2+8LyfTiYXm6otAR8i3EHaVzyXluHlA+khrt6VoTV6Ii7Sil23gFsYEJB
         fzn9nws2CKGMRBcRA9LQnqFOs0q6rum4X8Qza6YDy4IEnFIzmvKxQ3Ug63F3Ig0Goned
         3nbJVOGFkAVn3cfx4VB3/CDypcn0CrITtzL8s8GUEo0ZqqV60C3UMjskEdeTvPIjwSP0
         xDgSKx7OgF3gLzP3zqOiA2f6Zkq32DGEHUgBK0C8Ldg8d00Ay3La5n4LgEw6K+Gekhra
         DSWPGV9Ho2wk5zPNVMW3EBy9OuuNb5NjNRsRPwVi5aRupi9Frhlhw+M35lne0gQLwW0Z
         +hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172719; x=1781777519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89WdVHtEcEjrTXfXmO5KLfdPm+uKXRpF6kTT1kAcq9w=;
        b=U2SaXLKoMXN+pb/D/neQM2Mf7KlL8PRprsz1wh+INkC9ldOSES1+kZa2tF/t8kIpzF
         65S1uph5qYLqOdSpmAZENSox6tlzMC5RHEB13mD8+XvtX0upgpLGMew86vrgkOzwJmj/
         XaDjaCa2RrmQ5Qod862MEYfTeQmx7eT1veC33md/qwFKte5ywSm7LUVZ5JB3QlJhtvYY
         G6nmg1B92r9uM3g8QmW1SBTB8TMhzVVWX5IujjqvwDavMi/q1O1hqH7WUYxrWnPEVslU
         LjnzoFRL9E3RtWkKh5fBlB1EupJefvBy693EkKmBKuCiUDXYxli9A0jEq9zB4zg0l8w6
         Q8Og==
X-Forwarded-Encrypted: i=1; AFNElJ/9++feGJc8UvIhTW5ukEq6Fbh+TINSGSn1HGpfXs6Oc7BeDLDJUX2jihst6/Twe1QF0fbWp6FwvGzaqQ3SWOCF@lists.infradead.org
X-Gm-Message-State: AOJu0YxOry/EmqgrjQIwSxS0TAoL38IhA69Ho7JYs/CjvQoTbLBBrYXT
	skcuf8/RIIhQMBoAryVXO/+ASXi1pbQnvTL8yPtRwfztSQsPlXheslRoeJ/UUiPCtcA=
X-Gm-Gg: Acq92OF72RD/VhLhCgRxqV5XQDCgFiYO/W7MBVje6LssHupnGQzDLfp/9jluej+aBdA
	mmVj/RumX/WVg4qFHdcX8OR2XGspSir227kCpv5pSdtEAdcGHC55YhYraisyXY06QtjpWuFNMyC
	ZzFmOPztrOu3h/tAOxdcYcs0gFKYLvlJ/JtoXkrXFm9e6kFn9uaeKsz2TCc1zDa4CZ03xNCEMsG
	jS2NFIUFkzNh7X30Bct7rV82vlnLXKDcayDvsQ+VUFdpkZ5lEzs3CAJqnJA740SV/aUQk3bdAsY
	JsTKrG69I2+MD46JxG8vB8+c/1a9hvmz/eFUuMMeKWt6BE3QBr0sftSSnHio1A0lEt/pWTURLPB
	OC+jNXAM0JcUplQ7xS/F7bXxx8Bh8AghaSoSWu5IxC1rNhaPJ48v7RefWD0rJ5ALeeZ7VmCARUh
	trUlV1jYrCKfBu9ToShsvqW1bTfADyojsceUVuRLo1hd9mp1ODT5PouBHT0lARqYRsb6VbNR/rg
	f+5dAx2hrudZ6PuqAh5krlTFWGth9GDpRN1lZcY5U8u9x8GARnYT2WAB+U09rU2UTXzJfsLuYuV
	S9+vAtja9Ns6
X-Received: by 2002:a05:6000:4706:b0:45e:e44b:313e with SMTP id ffacd0b85a97d-460675b7081mr3135334f8f.19.1781172719195;
        Thu, 11 Jun 2026 03:11:59 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-203.zg.cable.xnet.hr. [94.253.164.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm78592966f8f.0.2026.06.11.03.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:11:58 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	sdf.kernel@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next] net: sparx5: change ndo_set_rx_mode_async return type to int
Date: Thu, 11 Jun 2026 12:11:13 +0200
Message-ID: <20260611101151.426050-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_031201_540109_AFA7E43E 
X-CRM114-Status: GOOD (  11.30  )
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

Commit ("net: add retry mechanism to ndo_set_rx_mode_async") changed the
ndo_set_rx_mode_async return type to int, however it did not update the
SparX-5 driver.

So, simply update the sparx5_set_rx_mode return type to int, propagate
return from __hw_addr_sync_dev or simply return 0.

Fixes: d90b85c23b3d ("net: add retry mechanism to ndo_set_rx_mode_async")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index 2eef643f355a..d08f5a0a33ef 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -162,15 +162,17 @@ static int sparx5_port_stop(struct net_device *ndev)
 	return 0;
 }
 
-static void sparx5_set_rx_mode(struct net_device *dev,
-			       struct netdev_hw_addr_list *uc,
-			       struct netdev_hw_addr_list *mc)
+static int sparx5_set_rx_mode(struct net_device *dev,
+			      struct netdev_hw_addr_list *uc,
+			      struct netdev_hw_addr_list *mc)
 {
 	struct sparx5_port *port = netdev_priv(dev);
 	struct sparx5 *sparx5 = port->sparx5;
 
 	if (!test_bit(port->portno, sparx5->bridge_mask))
-		__hw_addr_sync_dev(mc, dev, sparx5_mc_sync, sparx5_mc_unsync);
+		return __hw_addr_sync_dev(mc, dev, sparx5_mc_sync, sparx5_mc_unsync);
+
+	return 0;
 }
 
 static int sparx5_port_get_phys_port_name(struct net_device *dev,
-- 
2.54.0


