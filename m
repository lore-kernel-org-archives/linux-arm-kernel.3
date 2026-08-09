Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C46C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRvacLN+57DJnBMudtYrTXU7KiHkZYvlMNwzIQQLHng=; b=QazmTox0AY1Q/5TFjDUU8FDare
	QMVuh8cHKnAL9GZ6OwEYAfLBW2Lkzkb4K0vOxmOJXbtOyjLh2VQhcee384tXZ30ucAef2bxZvufuF
	CWSsGee379qgYGIJWAX3MrWvBN47nllrRt2WyxssdPXiPVNJs/EmlUr0VDt0gmRsb0qZ88HL0IZHW
	P4xb/szPMRi6yg2LWzJU/u387PjX6P7jfMCmRhmS5KFUID9iQ6TqNdw0qXOPk8UxdcxEWdvc32GA4
	7y3dgVQtdwHwVVwWUNek7Ks/gZuyNRFlzgi2+m/tJ2GL+9ExYIumQ1YcXi3Y/j3JtnrkU6IOTlJ2A
	BZOq4NeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABL-0000000Ag2Y-05v8;
	Sun, 09 Aug 2026 20:31:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABI-0000000AfyX-3V3c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493b966dd74so7249065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307499; x=1786912299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRvacLN+57DJnBMudtYrTXU7KiHkZYvlMNwzIQQLHng=;
        b=cCQmee+CmIU6HCpcOb5hkLp8SKW0Lt6o9FTcnn4MQ0KKdaoG/uqw03MfrbEDrt7jt9
         zlpcjao1E/W7rbobY83d1bvPHwEUvoYXPH14AArOHl2H4QylTw9jSVz20pOcuOVXt7by
         M4aJIyr8zNV4tq8AcCWdH8HIU9YeBPBF+eLmzjtLmzWerBZTenEQAOlHnJViFU5nUyWC
         4V19CN4irt+RrGgBIN3HtGqObkaAbrTfHQg1s9Gv8vEBE29lsXpw45fBI+sI7lbhpZGM
         lC8k2twiNR0JLHf3T1z7pTmqIrCoXNawsFKJmDaAAwnlHymherZ3pkD6/7PhEO/LIuBQ
         qhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307499; x=1786912299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xRvacLN+57DJnBMudtYrTXU7KiHkZYvlMNwzIQQLHng=;
        b=Dys7qrGLpr6ftgQ/WdSUe1RdnDhfsDHPwbtxdHD2OURRpu7DBLPcrTW2xpXsKQVnRS
         2TiF/K/NSiJpbIyc5CYK54fqRb2ifOuOFI4KjxGJlrJVJP942iS39u8ZwCrQ1eaj/rlG
         gaMBrGhstxCCcCW90ooJxasu8ubj5rYaEielidYlVbxnDZT/mGn0paeXYUZLDejKzLgj
         a5R42xxFvelCOTZVhRdhfthXddOKHubmeYnqabEjR3uMQqZQooF+Jjsm36AvlK8W4cW+
         MDYEJa+CCMfHSXHyaP+AjFSWKGY1kyoeialuhosDNextTmkD7t0kwjiqM6hGw2ySNpFh
         CSMg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/b7gH6FyWRsNKCNi52rbS84lz1cbJfK7JaJTi5/VRQXy87TCDK6KwmyB0qtyZXbxUWegwDwwsSwHDF74XEcKb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTURyucDR72j3x/vKz4P4LP/C5e4CqjxYrbtOjwselNMmS7P3D
	DbxKeG9p3wvQ8pVv0UqreUH4y4KChVgURrg3oATo5vERama/sOaOf/3q
X-Gm-Gg: AR+sD10PckImPydUuHsUohr9Ryffn2gqRFPyWFZ0FCuQT5TR6bGwaeK44yKk5Ihq4c2
	4fxqr9eFtWP75IOdQk6DIxo1B8mc62sQL3KlgcxyM3nA+LRBIO3zQRG4gV9jK3r072epkRFtlpy
	Ol2LLQm4FgBUNDw/aEBYGF+6Qocp5mfrm7Gmr7Arj2occEbPEByCBBS+xciKK5eqL1ZYDdFc/F9
	zT4SoknHd/lMtdxSELUdMNlMQoRRmTO77wd0Li+YxZEAIqFjAgni2wCIXEOg6hKOEcmmCJhY/9F
	pZqxy4bbM1OF7CplEEYUAu63F68IPEqCYvQX4QUuDWF1Zwi8LfSiho+OvODWTOP4XzNYAyF7QAv
	ZJSPApb49jB75tecYH27EwrZYxEu4WWSEgBvnUw0zNxkMi//P5SsEnjoEanaeyXyOEjgAWZABKq
	iiNwYvafS4v4Rx5F3pPAGXDL++dh8uk3cOyujIpUxfCxjLVrpu5ZWpl5IhW0MmFSHU+/cUNnqeY
	aAx1x2DEJ3BytxltylxIJqA7igM0VcVRINXLb2zUxjKVyww/uEgKFDQB3U=
X-Received: by 2002:a05:600c:1d23:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499516b83d9mr386176995e9.11.1786307499071;
        Sun, 09 Aug 2026 13:31:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:38 -0700 (PDT)
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
Subject: [PATCH net-next v12 05/12] net: phylink: support PCS provider release
Date: Sun,  9 Aug 2026 22:31:02 +0200
Message-ID: <20260809203116.640271-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133141_030590_B58CB875 
X-CRM114-Status: GOOD (  34.87  )
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
fwnode_pcs_matches_provider() on each PCS of the phylink instance and
will check if the PCS is provided by the PCS provider that is getting
released.

If a related PCS is found, then such PCS is removed from the phylink
instance PCS list and the supported_interfaces value is updated.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Finally a phylink resolve is triggered to handle the PCS removal.

Protect every access of phylink pcs_list with state_mutex to handle async
PCS provider release.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  47 +++++++++++++++
 drivers/net/phy/phylink.c | 118 +++++++++++++++++++++++++++++++++++++-
 include/linux/pcs/pcs.h   |  69 ++++++++++++++++++++++
 3 files changed, 231 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index c1bb93bc0892..52097466ce91 100644
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
 
 struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
 					    void *data)
@@ -74,6 +87,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	/* Signal phylink to release any PCS from this provider */
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_DEL,
+				     pp);
+
 	fwnode_handle_put(pp->fwnode);
 	kfree(pp);
 }
@@ -183,6 +201,35 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		struct phylink_pcs *pcs;
+
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return false;
+
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+		if (!IS_ERR(pcs) && pcs == pl_pcs) {
+			fwnode_handle_put(pcsspec.fwnode);
+			return true;
+		}
+
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_matches_provider);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b9a5cd123775..1d7223e95474 100644
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
@@ -560,12 +562,14 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	 * the requested interface.
 	 */
 	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		mutex_lock(&pl->state_mutex);
 		list_for_each_entry(pcs, &pl->pcs_list, list) {
 			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
 				pcs_found = true;
 				break;
 			}
 		}
+		mutex_unlock(&pl->state_mutex);
 	}
 
 	if (pcs_found) {
@@ -1004,12 +1008,14 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 						  interface);
 		pcs_found = !!pcs;
 	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
+		mutex_lock(&pl->state_mutex);
 		list_for_each_entry(pcs, &pl->pcs_list, list) {
 			if (!phylink_validate_pcs_interface(pcs, interface)) {
 				pcs_found = true;
 				break;
 			}
 		}
+		mutex_unlock(&pl->state_mutex);
 	}
 
 	if (!pcs_found)
@@ -1553,11 +1559,13 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 	link_state.link = false;
 
 	phylink_apply_manual_flow(pl, &link_state);
+	mutex_lock(&pl->state_mutex);
 	if (phy)
 		mutex_lock(&phy->lock);
 	phylink_major_config(pl, force_restart, &link_state);
 	if (phy)
 		mutex_unlock(&phy->lock);
+	mutex_unlock(&pl->state_mutex);
 }
 
 static const char *phylink_pause_to_str(int pause)
@@ -1927,6 +1935,8 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	if (ret < 0)
 		goto out;
 
+	mutex_lock(&pl->state_mutex);
+
 	for (i = 0; i < config->num_possible_pcs; i++) {
 		struct phylink_pcs *pcs = pcss[i];
 
@@ -1936,12 +1946,90 @@ static int phylink_fill_available_pcs(struct phylink *pl,
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
+	lockdep_assert_held(&pl->state_mutex);
+
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
+	struct fwnode_pcs_provider *pp = data;
+	struct phylink_pcs *pcs, *tmp;
+	bool resolve = false;
+
+	rtnl_lock();
+
+	mutex_lock(&pl->state_mutex);
+
+	/*
+	 * Loop all the PCS for phylink instance and check if
+	 * this notification is relevant for some of them.
+	 */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+			continue;
+
+		phylink_del_pcs(pl, pcs);
+		resolve = true;
+	}
+
+	/* Exit early if nothing has changed */
+	if (!resolve) {
+		mutex_unlock(&pl->state_mutex);
+		rtnl_unlock();
+		return NOTIFY_DONE;
+	}
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
@@ -2005,10 +2093,18 @@ struct phylink *phylink_create(struct phylink_config *config,
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
@@ -2023,6 +2119,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	mutex_unlock(&pl->state_mutex);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2054,7 +2152,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto unlink_pcs_list;
+		goto unregister_pcs_notify;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2073,11 +2171,17 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
-unlink_pcs_list:
+unregister_pcs_notify:
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	/* PCS notifier might queue a resolve, cancel it */
+	cancel_work_sync(&pl->resolve);
+	mutex_lock(&pl->state_mutex);
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
 		list_del(&pcs->list);
 		pcs->phylink = NULL;
 	}
+	mutex_unlock(&pl->state_mutex);
 free_pl:
 	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
@@ -2102,14 +2206,22 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	cancel_work_sync(&pl->resolve);
 
+	mutex_lock(&pl->state_mutex);
+
 	/* Remove every PCS from phylink PCS list */
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
 		pcs->phylink = NULL;
 		list_del(&pcs->list);
 	}
 
+	mutex_unlock(&pl->state_mutex);
+
 	fwnode_handle_put(pl->fwnode);
 
 	kfree(pl);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index ef2134c578c7..83e0a2ad4b09 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,38 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_DEL,
+};
+
+struct fwnode_pcs_provider;
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
@@ -19,6 +50,27 @@
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
+ * @provider: PCS provider to check
+ * @fwnode: firmware node containing the PCS references
+ * @pl_pcs: PCS to check
+ *
+ * Parse the PCS references from the "pcs-handle" property of a firmware node
+ * and use provider to determine whether pl_pcs is one of the PCS provided by
+ * provider.
+ *
+ * This function is intended to be used when handling provider removal
+ * notifications, where the provider is already known and its PCS need to be
+ * identified among the PCS associated with a phylink instance.
+ *
+ * Returns: true if pl_pcs is provided by provider and referenced by fwnode,
+ * false otherwise.
+ */
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs);
+
 /**
  * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -52,12 +104,29 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
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
 
+static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+					       const struct fwnode_handle *fwnode,
+					       struct phylink_pcs *pl_pcs)
+{
+	return false;
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.53.0


