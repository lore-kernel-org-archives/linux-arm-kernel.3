Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1183DC5ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blS9NW+z3RT1qmTbb7noUDEOOGBTlMXIPyRXJKnltKc=; b=FEn+bPUgRTIHRRShoHnz6gGYOG
	OJ5X5eE88WQ/f4xGLkMHsyZ2srvGTctNFYc0gm0ngFpL9GI6zfUQx3l7TtV0mOoS9vZFCgtJLiHx3
	wtC6ePmQMEZM3fpz32dbEyIKaLZ/OjLfTEucYeU/xYpM/h2fJ+8TG3oQxYYOURZZEQpzq/bxzOhpO
	akWyrAauscraPVDFsJzhnCIoJpGlbVqpOQ7luzPDbbP9DRdCqe5eSYPhJlVrPU8pkAGlIxCtGVrAD
	rAq2X8ZjNjNTH0VX+LepSTM6/uDgrNRzAC9Hfp6yrHmqy8ratdovSlUB22NkS6EvvKA8E+L0Vgbq2
	2ni6RMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOK-000000085rM-2YJX;
	Fri, 07 Aug 2026 13:13:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKO5-000000085af-02DI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954dff6536so24534205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108403; x=1786713203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=blS9NW+z3RT1qmTbb7noUDEOOGBTlMXIPyRXJKnltKc=;
        b=rOP0AM8FIwklgQGq8RpixPKl3T0uPZ3d/ZUZWUOQFsc25cvMttt7KzOxn5cvEbBfRN
         vdRvFRtW7T876ho1mTFoT9egUtpjAs4Z3OJD79AeV5ilXfUWL7i8TvRZqllwDSUEueeo
         UC83a6t4Dd4u1N9g2bl8cxNrZkqpzzcYtKF3RxiIVy/Ttx+WyCRqFmcwNsLOCV/z6JaY
         hdk4w/4SeR4Dtb2jQZFqw4NSBo4U3rYHi3eq35GHmhdfyLhMaTt4fHtqpxsrXrp4Ms2L
         85skrqcxw9q24CY3XW+d5lBAf8SxRGBsHOMsYLCIfIcsnKWC/rZDU1kbDtBKY41hNmyi
         +lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108403; x=1786713203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=blS9NW+z3RT1qmTbb7noUDEOOGBTlMXIPyRXJKnltKc=;
        b=XaX9bFq5aI3JqRUtDanqFrv0uQuHw4DivYsA27ZkPKXALsTK4evaWSam7KpIlFOTA+
         1DETzbfXEzT7oK2DDd/z+Nd79gUaXEJKb2TW4yRujTqTSmZlfi5GtotKsjeFRdeouaYD
         twPETZL+Pz5wALFp46gdHY/In8mILrHS2PueOaZ+fjijJbFDZgypknuXckKeP1S+35vM
         +WtEzMY999GVx33y6luFIP/4htEQobc71U4AT509fZ44PptRADX6NplWuWCpTZWG1kVg
         nKSG/V+9N7EySbtnYXu4MaLr2wU6bH0S7WYXri0UX235OybC311Ux5eRtoNXwyvfr1Na
         zQNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqk8ZWO6J38kWlBxx0OpE8CgVzNMtRFo9CCDMBCTHGDL4fwVY8kMmYVc6cEXvet+FhjUmzm4lbkMBDMQRmY9Qej@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3KUkvCz8ZUHjWvzQsqqNpz5c1aCjdnyw6tVY4nNaGXM/MsLL
	ICDdftdN0bkutxEpXRoUDY0wIsA6UNTBrMI2hgxQqs0Kr4GoTZC4kxgY
X-Gm-Gg: AR+sD118u8WCUTvKTPvgyvkGmSF+STXqlsGWumUD/+jaxunUN8QISz61CBONw1WW0Lj
	TQZ5WDE2F9dPf/rLJ3lNybHgWXCAzyGc9a14Xgpunfa+7txdSiM9gziJknyEAi+rDzFRkJNIXwX
	LTvSs2/PZgsSpB/+NTOvkM9WO9O9QnduT2rvWNTU8Une7x5YzpsqJCM+zG7ad4S2aWE6h/UzRwt
	oiU8w5HohQ9c70AG9QIX9YbiL91La8zuI315Ynz5YXRIo7/4RZAymoxC0+C1QFqKQqMftDzC5b4
	dAoeDi7jJqCMX6CMwZkUFryJai7bSLHVBjrRYYCxr6PlTGgB74709yg6bDTrm8/Dr3De4kV3JJ1
	pO/Xs42/Hw3kQB4LuTm6nEuH9VxvbACyAbG5ptrxhbI/Wv42Db93L+jQyn6vKVQ/bckhuE9g1ES
	HKprdAzn9jBN/UqDCUJgc9OXQAyEO8jjC5kmAPlOUN0b1OO2NDTXn7HVPXXGl90LJg5m4NOLK7+
	h5KmDhkhqv3PMUsdHVamgpZg8ZfsJsN9I1caO1aLqo4ZKC+kOnmpQ==
X-Received: by 2002:a05:600c:35c8:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-49959e08745mr106956245e9.5.1786108402637;
        Fri, 07 Aug 2026 06:13:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v11 05/12] net: phylink: support PCS provider release
Date: Fri,  7 Aug 2026 15:12:47 +0200
Message-ID: <20260807131301.192060-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061325_138768_6F7FDF5E 
X-CRM114-Status: GOOD (  36.07  )
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

Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_DEL every time
a new PCS provider is released.

phylink will then react to this event and will call the new function
fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
provided by the event is present in the pcs-handle property of the
phylink instance.

If a related PCS is found, then such PCS is removed from the phylink
instance PCS list and the supported_interfaces value is updated.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Finally a phylink resolve is triggered to handle the PCS removal.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 50 ++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 82 ++++++++++++++++++++++++++++++++++++++-
 include/linux/pcs/pcs.h   | 65 +++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 7f6d9941c1e3..f575fbed896d 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,19 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
+
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
 					  void *data)
@@ -67,6 +80,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
 
 	mutex_lock(&fwnode_pcs_mutex);
 
+	/* Signal phylink to release any PCS from this provider */
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_DEL,
+				     pp->fwnode);
+
 	list_del(&pp->link);
 	fwnode_dev_initialized(pp->fwnode, false);
 	fwnode_handle_put(pp->fwnode);
@@ -178,6 +196,38 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(const struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	/* Loop until we find a matching PCS node or
+	 * fwnode_parse_pcsspec() returns error
+	 * if we don't have any other PCS reference to check.
+	 */
+	while (true) {
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return ERR_PTR(ret);
+
+		/* Exit loop if we found the matching PCS node */
+		if (pcsspec.fwnode == pcs_fwnode) {
+			fwnode_handle_put(pcsspec.fwnode);
+			break;
+		}
+
+		/* Check the next PCS reference */
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return fwnode_pcs_get(fwnode, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 041405ce6bf0..548e783ae2aa 100644
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
@@ -63,6 +64,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -1929,6 +1931,8 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	if (ret < 0)
 		goto out;
 
+	mutex_lock(&pl->state_mutex);
+
 	for (i = 0; i < config->num_possible_pcs; i++) {
 		struct phylink_pcs *pcs = pcss[i];
 
@@ -1938,12 +1942,72 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		list_add_tail(&pcs->list, &pl->pcs_list);
 	}
 
+	mutex_unlock(&pl->state_mutex);
+
 out:
 	kfree(pcss);
 
 	return ret;
 }
 
+static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by this phylink instance. If this is the case,
+	 * tear down the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		if (pl->old_link_state) {
+			phylink_link_down(pl);
+			pl->old_link_state = false;
+		}
+		if (pl->cfg_link_an_mode == MLO_AN_INBAND)
+			timer_delete_sync(&pl->link_poll);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		WRITE_ONCE(pl->pcs, NULL);
+	}
+}
+
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	const struct fwnode_handle *pl_fwnode = pl->fwnode;
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	/* Check if the PCS provider is relevant for this phylink instance */
+	pcs = fwnode_phylink_pcs_get_from_fwnode(pl_fwnode, pcs_fwnode);
+	if (IS_ERR(pcs))
+		return NOTIFY_DONE;
+
+	mutex_lock(&pl->state_mutex);
+
+	phylink_del_pcs(pl, pcs);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	mutex_unlock(&pl->state_mutex);
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -2000,10 +2064,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	/* First register notifier for hotplug PCS events */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	/* Fill the PCS list with available PCS from phylink config */
 	ret = phylink_fill_available_pcs(pl, config);
 	if (ret < 0)
-		goto free_pl;
+		goto unregister_pcs_notify;
+
+	mutex_lock(&pl->state_mutex);
 
 	/* Link available PCS to phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
@@ -2018,6 +2090,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	mutex_unlock(&pl->state_mutex);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2073,6 +2147,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 		list_del(&pcs->list);
 		pcs->phylink = NULL;
 	}
+unregister_pcs_notify:
+	unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
 free_pl:
 	kfree(pl);
 	return ERR_PTR(ret);
@@ -2096,6 +2172,10 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	cancel_work_sync(&pl->resolve);
 
 	mutex_lock(&pl->state_mutex);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 08132f3f70f4..f9dcbf58d053 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,36 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_DEL,
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
+ * Returns: 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
+/**
+ * unregister_fwnode_pcs_notifier - Unregister a notifier block for fwnode
+ *				    PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Unregisters a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain.
+ *
+ * Returns: 0 or a negative error.
+ */
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -20,6 +49,25 @@
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
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
+ * Returns: a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -EPROBE_DEFER if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed)
+ */
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(const struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode);
+
 /**
  * fwnode_phylink_pcs_count - count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -53,12 +101,29 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 						 unsigned int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(const struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.53.0


