Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF03C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NheK5r8NI2wjWbCB6pBIM1rY7N6lb54Ew5FqwDMD4TY=; b=qNQI+exu7nnT1NYek1VUAyb/Hn
	4Q1e7X/DwI+edpxPDKXF6MpS+1bPQcqAoyAH3K+5L+pwA+BJc55Vi+gTDylgCXxJFeCAMSKEPFQHI
	/Pv6yPT46lV4uKRYxunxUQe3Lbc8cc7BEqdIpXGhNRmXetBXrOLnrqKE25awkUIB0DDGnPUyedURt
	enD0n0kfVzy2iF6s1Y/t0azv6q8PIHohgsW1nGM4hVHH1j/CQ5oH7tIfyc00UT6/fxUO3iqPxzKUO
	HIZZLiSSLvcjD33AVqw2sjCZbkdFKavvPfN4Mdr+LJ0nn4Ta4rEdtdK7S4+QNSHziXHpVk7annXeG
	B37Q3IrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YUy-0000000Fvhj-2JUY;
	Sun, 06 Apr 2025 22:29:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGk-0000000Fswk-0q5f;
	Sun, 06 Apr 2025 22:15:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf257158fso25177475e9.2;
        Sun, 06 Apr 2025 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977708; x=1744582508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NheK5r8NI2wjWbCB6pBIM1rY7N6lb54Ew5FqwDMD4TY=;
        b=l0Wehog/4FWmntUdUXfOkSaWXGepLvRqX2uQJG255WIs8WU+ikjNVwVeSN5Trh+AkR
         dB4gAIGHsmPmKWi6oT725J00Poe+3A61ur5MZTI2eLEJCrrNIXmzQcKwCItedq/bRf33
         bUCN+h1yvOluqoy2xpPJVhv1RQXnRVpIv9e8GhUNpNcVG2SvPCHTSO3siIwuMXuFfhTE
         WaLq/J6Rp7dIHPem9EO525pK3/Itis7fIs/clIDmanSj/E3Ajn17PaRSub5C9F+QnNnr
         5D8q2LgHzMEH3lqnH8j1cEKGrf9r+aTZQuaLMjB/rzCSLPyJv9Kn4VrULEWyBKjJJJMb
         Qb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977708; x=1744582508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NheK5r8NI2wjWbCB6pBIM1rY7N6lb54Ew5FqwDMD4TY=;
        b=f3A6fTkmmQQfi3eYh0HXXPdBCtF1zitoXJN03jGDN80yH7feZmGdnG9OF616TmnNA9
         xX9cArkvro6FzpilChnyJyD+TWtaKW5Q1nvtnR+LYwedGbsMW9jJBpV7+6W7qYK2HFzT
         VEB1LHIZKkohQL5M1AxsAJXQGfa0kPhBgAZBL4hFpDN60UNDr3KmOcLR8SnN0dd4UHHT
         4B+ZRSW1F1FRRzLBV5/Vyw7z9pmj6YoJRQ9I2vLH3f0kIngH0qq8n4lozybHBK8CGzkL
         fgqN7yWuqBEuJq/zCaGRAYx195qV7LvB/5yCDNdg++zerEdJ+HKu+e1hXjdxTaEqsPYb
         yFpA==
X-Forwarded-Encrypted: i=1; AJvYcCUUnfrgZwqOlZmf7u8cCBPbT5mvYOgL2HKwuGfoMzEbKVBXK9vVENEpe6WR9UdIYHH58XuH8CAioJ6+C06LKJc=@lists.infradead.org, AJvYcCWXF9YORm1qdAX69zI24RTV9uHvAg32qhrKZTtJqWpAP3f/H+hP0XHOQDSndEZi6jHoLF4EZjWOAEEYMZF856/p@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7RVARCQzszy3fg0w08TObFs4ayw1BUcZ5CLePSrFC+8BunVpW
	B4eZqtZhy+49QT0kZ9oncqQBg+rgj+uK/WknW4VVij0gR2+/UYbt
X-Gm-Gg: ASbGncsymzyPmQ+F1Gk/3gQyx11V5vgWIEgxcI6EB/JG48QnjEVfus2Q8UPWrkxmW7c
	epvHDm4Uh6j3ltG4/UmlyX5Bigk3OL8pGHQFEa3i06hsSptcBeAhgrlpf8C4TIng+PaPRPGTHBa
	g6U7chey1aQl3X6739UtUZ0wnHJWbRKAgVY8vMvylMsv7tRtB/NKNT412Ffq0WhjxcHivWPWQdr
	XAWwWy6szIgBlaOtpjJsHv0UWi6haolT3vFelOQCJ8SJ7lUfmADFLA5hSSBnpsWMpPnVTQNqYwp
	59gLJkA7YURpGh3GuF+/7dsUhJazLVVxPOAzo6eWrthp98qPj6VodXnNzI0gbX0P8w9pZ1byJG9
	O6c4ugjo1Yim/LA==
X-Google-Smtp-Source: AGHT+IHaz2i92ocrx4+wErQZTjeioBLSqGXinrgyqWLyRujet6CpsWu8yc7v9VQuGpHgAyRsELf1uA==
X-Received: by 2002:a05:600c:4705:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43ecfa02754mr67372745e9.26.1743977708364;
        Sun, 06 Apr 2025 15:15:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 07/11] net: phylink: support late PCS provider attach
Date: Mon,  7 Apr 2025 00:14:00 +0200
Message-ID: <20250406221423.9723-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151510_241270_BEDEE0F3 
X-CRM114-Status: GOOD (  26.66  )
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

Add support in phylink for late PCS provider attach to a phylink
instance. This works by creating a global notifier for the PCS provider
and making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

phylink will then react to this event and will call the new function
fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
provided by the event is present in the phy-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance if it's not disable and we
refresh the supported interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

If link was previously torn down due to removal of PCS, the link will be
established again as the PCS came back and is not available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 34 +++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 52 +++++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs.h   | 48 ++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 14a5cd3eeda1..a7352effa92f 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,13 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
 					  void *data)
@@ -55,6 +62,10 @@ int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
@@ -147,6 +158,29 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, int index)
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	struct fwnode_reference_args pcsspec;
+	int i = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_parse_pcsspec(fwnode, i, NULL, &pcsspec);
+		if (ret)
+			break;
+
+		if (pcsspec.fwnode == pcs_fwnode)
+			break;
+
+		i++;
+	}
+
+	return fwnode_pcs_get(fwnode, i);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 static int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode,
 				    unsigned int *num_pcs)
 {
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e6bb6e5cb63e..b189d42b6a9b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -12,6 +12,7 @@
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phylink.h>
@@ -68,6 +69,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -1915,6 +1917,51 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	/* Check if the just added PCS provider is
+	 * in the phylink instance phy-handle property
+	 */
+	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
+						 pcs_fwnode);
+	if (IS_ERR(pcs))
+		return NOTIFY_DONE;
+
+	/* Add the PCS */
+	rtnl_lock();
+
+	list_add(&pcs->list, &pl->pcs_list);
+
+	/* Link phylink if we are started */
+	if (!pl->phylink_disable_state)
+		pcs->phylink = pl;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	mutex_lock(&pl->state_mutex);
+	/* Force an interface reconfig if major config fail */
+	if (pl->major_config_failed)
+		pl->reconfig_interface = true;
+	mutex_unlock(&pl->state_mutex);
+
+	rtnl_unlock();
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -1969,6 +2016,11 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index c7a4d63bcd6d..480c155a3f03 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,24 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
+};
+
 #if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * register_fwnode_pcs_notifier - Register a notifier block for fwnode
+ *				  PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Registers a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain. This allows phylink instance to subscribe for
+ * PCS provider events.
+ *
+ * Returns 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -20,6 +37,25 @@
 struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 				   int index);
 
+/**
+ * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
+ *					by the firmware node from a
+ *					firmware node
+ * @fwnode: firmware node
+ * @pcs_fwnode: PCS firmware node
+ *
+ * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
+ * 'pcs_fwnode' firmware node.
+ *
+ * Returns a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -EPROBE_DEFER if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed)
+ */
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode);
+
 /**
  * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
  * @fwnode: firmware node
@@ -39,12 +75,24 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int *num_pcs);
 #else
+static int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 						 int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 					   struct phylink_pcs **available_pcs,
 					   unsigned int *num_pcs)
-- 
2.48.1


