Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B8CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whAejHEzxjcYOcZ1D1ZZzNRHZW4qI8QgkbdfkGYPH3w=; b=A+0K7X1XVsh+rk5XKMpBGS2sqX
	XDhNREZe3tfX6awTy2PlV5ykZo/1lFAm2NfH0efyJ/LlFqGPyeOphiRb7lz4Isnqt7NexAi4JJcGV
	Zpe3W9KpuKtNPrSXtCWd7FhxPbFyeHwLQLDRJHSlz22qO7WruiW4s1Eri3kxVSfI6cAhkvG4nJntZ
	xI36hGFhwYnxc0ydzCqwLLVxa3mg2yMWAvQYRN6Xuzb9U9QXWGRFux7KwrjW8ASsaeQ+ejaa+UGWi
	lHL3ybJGcmvmGQN8CzYXfev+5CsppFuCJ8m+HgvBDNOecaEHvSaKLuS/b7AGKO0yRqbQN3kKrPTYN
	yyp6CQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmZ-00000006fb2-10Ey;
	Thu, 23 Oct 2025 14:59:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmS-00000006fVz-0neZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:59:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so9481135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231546; x=1761836346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whAejHEzxjcYOcZ1D1ZZzNRHZW4qI8QgkbdfkGYPH3w=;
        b=Yq2CUWMhnf80UM1MjH4uYORZyNyG1BGh1kO/l+RwW0pImdAE9Rt1jN42g75X8qJlA0
         Qlu93hIuaNuDuAfe3FLOtWPhckCLIAqb1EpghDwzBtS5ezwBBKnbh5zM81Rjq3TCUTOn
         Tipx9rMUxN4MtBuI+R2QaZA2HIT1f5LdDs+sYR2umdNJ4otctqaapMH9svslSEe4Wo5E
         vzV2UdR53FxrTUy/WDFD1sQjz+it/4E6MB+4VvxQ8UthNXRrx0U6bQIiPK+gqtHbewc2
         +7MIP3ZaCIfztF0tWS3VuinHkSjH0NeyYBkDrvu9apc252tiFOqGdDKjffOiLXC/fLJR
         f5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231546; x=1761836346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whAejHEzxjcYOcZ1D1ZZzNRHZW4qI8QgkbdfkGYPH3w=;
        b=lAWlrf3Ze84tPRPb+PHJZMYCRK5DYrDIb2vatOcd661dLK8Q9QKWX/1ol4871A7c6/
         gHpTFRc87XTBYtfGFHuGCygoFKCStU3g66b5ncUOIzFtFc7V0Qrt4B2IrIRdEfzfwoep
         qhj6G2E1Jw7v/kkS61rmXjyK9K3Q0gDaWki2/ke43b3aFAk696D00iDrLnesbDghAgG+
         TI8iTNacj8+nhT3puZDjgfEqqllmXVTHgOY9CH3wUiK/uHRD+Fb/hDZv6XYHJT8kKUrl
         xD8GRu4KaleE6xGd1v8r3Ls21UI0Fa9/ovTSlkKVgUhsYXtsxkpr2z45Z1m32EXEmpbN
         SMOw==
X-Forwarded-Encrypted: i=1; AJvYcCU6mEuPvMKpaTPQRcP5tYeF6QUF6zaKVx02/np0ykgQfPZ1Kn0PF+IS9F+Uhr4m2zuVhS1J3QIMgx07Zg5kJG0+@lists.infradead.org
X-Gm-Message-State: AOJu0YyOi+6idomdi3KIaZvVRQcn5T2Fep9o1vIkwuOOrhFpgVYAjMmh
	pAfrnqYsQvjCfCdDv3nLPh5R2xlnN4Os87t3GbW2hYLuYqn3TIREagSH
X-Gm-Gg: ASbGnctmTzhZW8jbwzZc2yg7DCvTORATVWf4e5jlWG5dWQaNXX3ezCeEI1fSsgKnq68
	1sIzLvcqiWKgc7OjK8EC+7Vm/pQHGd9jzFKTdoiRQuDMg0bEADUAhYi2P+5gtMCJPLpVq6Z+Am1
	ZGfyxg60RkHBGh0U+zqyciKlmMELUPTqJzXTucK8qAsywmPfnzSwhkxSmdHNWiVpR8w2CvIECGt
	mI3/P5DGcy8bPAZdphmX/oMFHIjOXp8wNlOtRcHzWDv4KmVzUZ2FFiuOjp7Hh0e13oPcKcL8BTD
	+sPk2azkPylnIlCtUGXggpLYJ903Fu8NrY/sC0ziBzeq+v+iPTk9R/P67K1hZa6s+jdBKndvLfW
	KB9T3wn83ZoKL3LBK5XV0XDMu1Pffx+8PlvUhg7cACXI9cFr1Frpd4EaFeg7PKkj1xpzj3OUYE6
	3zjxJS+V/NRB4YcBUGdbuhWhHA5u5jzcr27JGm5Lxk
X-Google-Smtp-Source: AGHT+IFok8sHCYOpJa+r8lDaMXz2YO2SGlpSOMs1N7JK0iL61rgsPdp1b9Qo/9ADG3bA8aBrW1Chgg==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr171938455e9.26.1761231546476;
        Thu, 23 Oct 2025 07:59:06 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475cae9f292sm39822325e9.5.2025.10.23.07.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:05 -0700 (PDT)
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
Subject: [net-next PATCH v2 2/2] net: airoha: add phylink support for GDM1
Date: Thu, 23 Oct 2025 16:58:49 +0200
Message-ID: <20251023145850.28459-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023145850.28459-1-ansuelsmth@gmail.com>
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_075908_254368_C819C372 
X-CRM114-Status: GOOD (  20.91  )
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

Add all the phylink start/stop and fill in the MAC capabilities and the
internal interface as the supported interface.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig      |  1 +
 drivers/net/ethernet/airoha/airoha_eth.c | 77 +++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h |  3 +
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce501e7a5..3c74438bc8a0 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -2,6 +2,7 @@
 config NET_VENDOR_AIROHA
 	bool "Airoha devices"
 	depends on ARCH_AIROHA || COMPILE_TEST
+	select PHYLIB
 	help
 	  If you have a Airoha SoC with ethernet, say Y.
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index ce6d13b10e27..deba909104bb 100644
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
 
@@ -2813,6 +2817,18 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_link		= ethtool_op_get_link,
 };
 
+static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
+							 phy_interface_t interface)
+{
+	return NULL;
+}
+
+static void airoha_mac_config(struct phylink_config *config,
+			      unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
 static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
 {
 	int i;
@@ -2857,6 +2873,57 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config,
+			       struct phy_device *phy, unsigned int mode,
+			       phy_interface_t interface, int speed,
+			       int duplex, bool tx_pause, bool rx_pause)
+{
+}
+
+static void airoha_mac_link_down(struct phylink_config *config,
+				 unsigned int mode, phy_interface_t interface)
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
+	struct phylink *phylink;
+	int phy_mode;
+
+	phy_mode = device_get_phy_mode(dev);
+	if (phy_mode < 0) {
+		dev_err(dev, "incorrect phy-mode\n");
+		return phy_mode;
+	}
+
+	port->phylink_config.dev = dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
+						MAC_SYM_PAUSE |
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
@@ -2935,12 +3002,18 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
-	err = register_netdev(dev);
+	err = airoha_setup_phylink(port->dev);
 	if (err)
 		goto free_metadata_dst;
 
+	err = register_netdev(dev);
+	if (err)
+		goto free_phylink;
+
 	return 0;
 
+free_phylink:
+	phylink_destroy(port->phylink);
 free_metadata_dst:
 	airoha_metadata_dst_free(port);
 	return err;
@@ -3049,6 +3122,7 @@ static int airoha_probe(struct platform_device *pdev)
 
 		if (port && port->dev->reg_state == NETREG_REGISTERED) {
 			unregister_netdev(port->dev);
+			phylink_destroy(port->phylink);
 			airoha_metadata_dst_free(port);
 		}
 	}
@@ -3076,6 +3150,7 @@ static void airoha_remove(struct platform_device *pdev)
 
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


