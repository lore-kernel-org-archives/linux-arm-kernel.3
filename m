Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E35CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl2wOoaMcc9Z20zwgaramGfCsCZ42ehp4U+ZgZWVnXM=; b=Sk0eU+iLXcPlIS3oF9zleULizT
	MasGJrLjSiYY555rNrlLKfo9Z89Z5HjVal5WynRBb80NRR2/XFbwKLs4yAAAtbwpkemoMwTxuUdMK
	RQ3idqTwVyPoOC8bDL/bvzkQa1MsboEpS+KiLJOHC2vKt0P7XxKhl2a8oy/jQDuLobRE8+Nf2sttH
	uIr3m+JzaKiPUW1AKz4xUf5pP81aRT8bHRgs6NNqgFfs3OFsyl4EMIRJVS+KbdK9KMAVwR9WQtk9g
	AR+fF/TdCBAfV412IM33mL6+Z+oXgo6qQsRFK5JwTiKMbc2nxAsCqNvrbFnGNWoAu0jxInc8fq+7D
	m9x6zEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKB-00000001IQF-3RNd;
	Thu, 18 Jun 2026 12:58:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCK7-00000001IJT-1QuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49222b6e871so7991545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787501; x=1782392301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl2wOoaMcc9Z20zwgaramGfCsCZ42ehp4U+ZgZWVnXM=;
        b=gt0iyxsdem2hxqtrNF0s+XDSFQ5ewP8jSFPz5/p1adHB3b8uipwXF5CFsPBYp2jdMw
         lLeNvlgvaRkEuWolGncRcx+z5UM6NvavVwNaxTasjpxks9s7TogHLoMjUHoJrV043AoE
         LEwrDGiM2UFsFP0rnVB8vY/r3wnglHDxOfS06PEVPK1XQfoZ+0a6Keuj7ddbxy+LDass
         ievO7osZO9B2k2rMhR/O6jB2cV/+eKPlyF870PGsSTivfPplWV5vKOKQQ/Indb7TZycJ
         yiqIbK2YossvTeAxrXBXOP+nJEwkwDsv1iiSXGSiURA5sYsI8SsL5pUPStXdjp1B0nmT
         ueiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787501; x=1782392301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nl2wOoaMcc9Z20zwgaramGfCsCZ42ehp4U+ZgZWVnXM=;
        b=cFO9SdmGZdldI3LssKxTSMKbtLMzBS/Lv2GpoSKwsRa+bcAHON997/xH4pcaWTujN+
         f6/zPqQYFoRL3yQv+Qj12qFF7+m80oRkdlCzYqqtW+gad7ZjdmkNZYoYBZsDk/akGTEo
         4ABxHEwBD7PWG6vDhR7j/uJZrV4ahXhbJigF4lZzHEIK//ywk1ZuO3TpIWWiZtmnCLjp
         31R9o/TdZNl2wD7do9n87lC6N6WCZDildoKsivGEjnIDYWsyIYWCIHt2LTRD/6+vuso5
         E/XP9wYjpFEwhHkBcIsWA+QltGXSFHs358wKFJfvaNiLfSihyGDcPoU3E4J7OLzoxV11
         JZ1A==
X-Forwarded-Encrypted: i=1; AFNElJ/lq1fx+4c1LzqxlYl5/JDIkO0rJ4DMNhXJQxUxkx5uWevXXQHrYowA/TgiN1i46/F8BVYtf/fq/uTRIBcZTSsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wjDKPPU3lleYZEEWFM8CraU8AtdaTeTsadpHFThw8dmOxVc8
	m9QqnN0Wf5ELlvbyPR4MWc/GwcMKeKc8sV2WlpqN6kHAekfnFu8KqhXg
X-Gm-Gg: AfdE7ckgxvfqZH543AmLvnbP6LhHGlgngKWYlJGf0JW4czekuUpL0ggvXpI0eugLrvr
	jBgZJxP1//GPSuvKYpxNkAbOgpfHYyp5BJRikZw/O4v0bZN/6O6DmEtNmjSLgRQgI1YerrG0GvH
	brM0H4Ltb0skdXJooOfOiHNJ+IFVmpK8PLu7MY5y61F+Uwg8EAp0lGZw2Lu34SMjnHytbvmx7RX
	bgA34lvuPAv8GMqWZyioNlI15fnxoiYTCXYVDomQDbX+BJOlZPnxVYVdRhMSm9Vt8HhHAQy06ps
	E/l9pn9eZFu+ET9htnJ3FnnE/hxObXx5p8AFcC0c9sRjccY+HgBl7T9ssJwd5uKGxM2rYCC2WLX
	sGPUEHpOJLRc/9iJhXWck4nFVwxCopSNVhHS0hO1n/dm9K1dANFzrmeaZaSbiATjXffexBM8Mfj
	NkxJXY9T+RD2KspYRc9Fjh2zNtjM8n0auTK43z0fG/xJzoyFWcUIv/9cgPYzrcyw==
X-Received: by 2002:a05:600c:6a89:b0:492:1e36:8c4b with SMTP id 5b1f17b1804b1-49234141df5mr86339915e9.36.1781787501359;
        Thu, 18 Jun 2026 05:58:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:19 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 05/12] net: phylink: support late PCS provider attach
Date: Thu, 18 Jun 2026 14:57:13 +0200
Message-ID: <20260618125752.1223-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055823_441130_A377B6AB 
X-CRM114-Status: GOOD (  30.16  )
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

Add support for late PCS provider attachment to a phylink instance.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

phylink will then react to this event and will call the new function
fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
provided by the event is present in the pcs-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 49 +++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++-
 include/linux/pcs/pcs.h   | 65 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 0cc4daf7beea..7a9d91b2a34d 100644
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
@@ -55,6 +68,10 @@ int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
@@ -150,6 +167,38 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, unsigned int in
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
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
index 064d6f5a06da..b9a212bd1206 100644
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
@@ -62,6 +63,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -2000,6 +2002,53 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	return ret;
 }
 
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	rtnl_lock();
+
+	/* Check if the just added PCS provider is
+	 * in the phylink instance pcs-handle property.
+	 */
+	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
+						 pcs_fwnode);
+	if (IS_ERR(pcs)) {
+		rtnl_unlock();
+		return NOTIFY_DONE;
+	}
+
+	/* Add the PCS */
+	mutex_lock(&pl->state_mutex);
+
+	/* Link PCS with phylink */
+	list_add(&pcs->list, &pl->pcs_list);
+	pcs->phylink = pl;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Force an interface reconfig if major config fail */
+	if (pl->major_config_failed)
+		pl->force_major_config = true;
+
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
@@ -2124,6 +2173,12 @@ struct phylink *phylink_create(struct phylink_config *config,
 	if (ret < 0)
 		goto unlink_pcs_list;
 
+	/* Register notifier for late PCS attach */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	return pl;
 
 unlink_pcs_list:
@@ -2152,10 +2207,13 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	cancel_work_sync(&pl->resolve);
 
 	/* Drop link between PCS and phylink */
-	/* Remove every PCS from phylink PCS list */
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
 		pcs->phylink = NULL;
 		list_del(&pcs->list);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index b7cfdd680b2a..45e8f96662db 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,36 @@
 
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
 struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
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
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
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
 static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 						 unsigned int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
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


