Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A537CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=; b=nLGxBhQI5APHwAtoMFwi2t+NW3
	s59O179iqH+D9Dfugl8IXJIu7PDYXYRLgIn4/ftXRm6Z4ImxsqyWXZXc/+OFjxCwcEiPFKs7lj5tM
	EsFhnmvbIr9xbekDa1078oaUuOegq+vwrcFtXQOJ6nVNYmiPD/pXhh9DiGFtyv/QBV7XzjNiiSr+4
	uVrHNSkzcdppZF/dT4ZS5g5jkcCQzWLnsFpZ4oeqaOh9a/wMHbOgSDCDY8cbWPeAAEt5XF3zqDpnA
	oAK7WFpGI/N5aUcMrswTftVX2UicePOObeQyoRoF6/HNSaEtOSrR2Qwg7wuVe/CTw0xW2KCJ2YhGD
	Si2G1HnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI70-00000000V2z-1W74;
	Tue, 21 Oct 2025 19:33:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6s-00000000Uyy-2V4T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42701aa714aso3631530f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075209; x=1761680009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=;
        b=bFF7JACdutmVVb3AqJuj86yGdZIcEf7frE04Cd3vepgJ0tOWAWWPuMYOX28nS79joh
         bnHWEb2vnuNU0x0WECSXvwl2S7HPxlanUsskmLQDhWXymAm5ssuYVQOy2l9iGnUSl+lG
         evOHZHd/ccA+JI0j5huzQa7+EdqlvVrkWfk5B+jba8hSGGRvvorBjHUmqB5J7ep6Yp7M
         iJqI7gIyE+9VRawGJYPTNAEqfu/tXEfzivFKS48/bdOR/s5QGaDP6Lw/DVJiziSgg4/d
         NVyo45fbc4548vZmcF25QwVGVzz+bIEvPoAyc05I7E7rqERGM90Qrk1XRzycqiUVMS0M
         1lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075209; x=1761680009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=;
        b=V6mTAzbIffwARuZet7JYonsq1tK4qJk9ipiKpJaJe9vt04zHGUzGMJvQH6lbl+pwRn
         HFEaygyUS+1ewZCCVomq4JVuh/0SJHKevgVYQQy5ux1TeRwtim3fnMB5HZ7L00j46w1p
         bNgQ33krlxxkUGoMtzMtwO6my+7BeIUQalSzQmTyTNnoWZA3KNTsczKRH/ZWk0FRjzeM
         qocgt9kD1kY7/caT93Jd9pVRR5E9OJbBDqZvgKvGnlXswRS/j+XzicecjG3TnLVYel8j
         AIehFbDvM3XUGNKH9PEqriiRsDqGx1NYTP8opHoBemLMmYy004R0dRKapTQv5k5y/wWV
         cPvg==
X-Forwarded-Encrypted: i=1; AJvYcCXc3DiJ5XpAL1PV2CezavuiyzLo+7DQTYfq/CB5PawWMa1Ek6T4UvuZ9SgAclLyGTAAMmqIJ12W4MLxtLsKnZpT@lists.infradead.org
X-Gm-Message-State: AOJu0YwmDQgRc1KVbB4f8/WcFKl6asPPnFXzqdrqTL6D0g25Pf5NonXc
	sjx6pJVClq+0X2K753cPwQ2oJSYm5Zh0HEgLymctz4t1Gi6st8VrS1eb
X-Gm-Gg: ASbGncsSNXMfytZVakAHvftTjLiqKWrykq+Bvh80EvQkohR93d24I2RYDs9mfe6Jyjh
	R/7DLKQGy1UJ9Z9d4R/MFTlfVMfOKfetuYWR1A5o6a0ZNy+u2IS7Xj9rSuQx/kVWkAR4NTcHUEI
	6JHGnGiv257pAK1vylymgeJD2gnbpQywW99cF6DQYSqqhOYKYuxwHTrMNuAtAFNjEiABufaQ9TW
	ioB+meNVVW8+KuQ+OscusEOeCbw3CK8Z2mpCT96Zb1P59Zf8q7t74se8iMMTXFGSGi5lt9O7Ls7
	nwUJe5YPRs1op/M4Vy5xwEIJ1EE73ZtioB9pm/KmqAzSMNhZBpgy//eIxm2EJwPfriQvlB4agzi
	nAjidnzgvWT3lWwEMTmB/ss18S5Y2R/oa0Qk1mYwOb9rxl+RgaOzmFwQn2EA6b2nixWGS1Ei0hB
	DQ1MWqAz0m96+ays+81iJMf+9FuxU+3bdU+ph/9PxAcNM=
X-Google-Smtp-Source: AGHT+IElUppWel9b0RVHM4zvWcmJ3xHtW8J1ioZFPpIwENi2ahFIOIMw6b/9n0+AeyKKg/4kFhaXWQ==
X-Received: by 2002:a05:6000:144a:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-427e1bf1a74mr9524872f8f.52.1761075208724;
        Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
Date: Tue, 21 Oct 2025 21:33:12 +0200
Message-ID: <20251021193315.2192359-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021193315.2192359-1-ansuelsmth@gmail.com>
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123330_761756_45EEDF90 
X-CRM114-Status: GOOD (  21.92  )
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

In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
that is an INTERNAL port for the Embedded Switch.

Rework the GDM init logic by first preparing the struct with all the
required info and creating the phylink interface and only after the
parsing register the related netdev.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 108 ++++++++++++++++++++---
 drivers/net/ethernet/airoha/airoha_eth.h |   3 +
 2 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index ce6d13b10e27..fc237775a998 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1613,6 +1613,8 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 
+	phylink_start(port->phylink);
+
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
@@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	phylink_stop(port->phylink);
+
 	return 0;
 }
 
@@ -2813,6 +2817,17 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_link		= ethtool_op_get_link,
 };
 
+static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
+							 phy_interface_t interface)
+{
+	return NULL;
+}
+
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
 static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
 {
 	int i;
@@ -2857,6 +2872,55 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+}
+
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_select_pcs = airoha_phylink_mac_select_pcs,
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_port *port = netdev_priv(netdev);
+	struct device *dev = &netdev->dev;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+
+	phy_mode = device_get_phy_mode(dev);
+	if (phy_mode < 0) {
+		dev_err(dev, "incorrect phy-mode\n");
+		return phy_mode;
+	}
+
+	port->phylink_config.dev = dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+						MAC_10000FD;
+
+	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+		  port->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	port->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
@@ -2931,19 +2995,30 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port->id = id;
 	eth->ports[p] = port;
 
-	err = airoha_metadata_dst_alloc(port);
-	if (err)
-		return err;
+	return airoha_metadata_dst_alloc(port);
+}
 
-	err = register_netdev(dev);
-	if (err)
-		goto free_metadata_dst;
+static int airoha_register_gdm_ports(struct airoha_eth *eth)
+{
+	int i;
 
-	return 0;
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+		int err;
 
-free_metadata_dst:
-	airoha_metadata_dst_free(port);
-	return err;
+		if (!port)
+			continue;
+
+		err = airoha_setup_phylink(port->dev);
+		if (err)
+			return err;
+
+		err = register_netdev(port->dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static int airoha_probe(struct platform_device *pdev)
@@ -3034,6 +3109,10 @@ static int airoha_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = airoha_register_gdm_ports(eth);
+	if (err)
+		goto error_napi_stop;
+
 	return 0;
 
 error_napi_stop:
@@ -3047,10 +3126,14 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 
-		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+		if (!port)
+			continue;
+
+		if (port->dev->reg_state == NETREG_REGISTERED) {
 			unregister_netdev(port->dev);
-			airoha_metadata_dst_free(port);
+			phylink_destroy(port->phylink);
 		}
+		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
@@ -3076,6 +3159,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 		airoha_dev_stop(port->dev);
 		unregister_netdev(port->dev);
+		phylink_destroy(port->phylink);
 		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index eb27a4ff5198..c144c1ece23b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -531,6 +531,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
-- 
2.51.0


