Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20768C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5em2uBUa23B1JgluWV7f/8yy2OgH7ooCOoe9Kd3BWI=; b=mA7IM0Uwo4YVZ9UEsJfspeA/3z
	EZa0fQqqtZc+oJyM+A3Z8Z+edmvCXIxCvzUYisoXc93i0FcgJs87LOnL1tAP4ObtuE9Cq1x4fjg3u
	ciDmeLV93C/pdhUt0v33bKItb4xBkgxQHf5grwtokvsQtIXpsbrlMBcfATuher6F8wmnc5fnEMnSl
	Rqh3hPXJ5FehagLvh2QwWm40AjpeMDyv3nCefiUCqMzOCXkkK3RTISIz0I/H3sas2Vq2R7OxJMtFP
	PfI2vuibKJ08BqZ9R5I4AEGLWOyQXil6z41Fdg7eS40soAp9D3bYUFkqK2S1lv6DZ60rxZpr9M4lZ
	YYpIhuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhbv-00000005pBd-2kUZ;
	Sat, 10 May 2025 10:39:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNi-00000005nho-3sOo;
	Sat, 10 May 2025 10:24:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso28491895e9.0;
        Sat, 10 May 2025 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872673; x=1747477473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5em2uBUa23B1JgluWV7f/8yy2OgH7ooCOoe9Kd3BWI=;
        b=I8orxesbNu14Ul1uYVIITaGW8rhGTSZi9kggIK4uKIHianjILjiDzu68Aanispd3Uy
         gG7+lYiX0DkkMW6ZnjYpDompHzUGZHwM/YTftfnVVC+3LWS1abLQrz0wQaHZb7voO5CI
         ZEKmk3Wc5Vw0rXGb5oL1qILaUej9IQBnYMo0klENj8Vrw1q4zo6n1jKJmGkL+DhUhpVY
         YT1RhVDszw5K6g6c6I4G19B5beOkJDn+0V7LR9Y1gCz8YTDTYnw4QuNNQUS5PgAQxNKM
         SAwNZaE35JZ9zRI5/M8GryLKBvtOQJpg3vyUlKFX97sCg8T0SjPTDS/dRL8Ug73+XUbg
         AM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872673; x=1747477473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5em2uBUa23B1JgluWV7f/8yy2OgH7ooCOoe9Kd3BWI=;
        b=jGzxnoEpxTWxHiULxNXJKVOuO2tr0lvm+X4DgnK5S1+ARNP3FrSBDjzU+9sXk+we6Y
         ziSCMS02Zx6k7pHvcd+igE6xlBTZ80KcAo4eeQb+KY3LziF7/0Ky98JjUHA+K8lMw6ef
         wb4Tu6kKcqnfrEZCOkb6oVRD1c2mwcU41fEj5qVj9hIoYUY6gFdFwCtYN1k62cAd8RSc
         J+RBwNAqW9g8MX2qCXY1RqrCmEDj5JfXjJM4lWSDM0nlL90v0olKpRuN0WM/iUJVpXUt
         yvh4x688BZ1XC6ObwFJt5VLbRmFrIf0pKAnrL3DCFAr6HF6eZ3EQDSTgVcR3y280y3pI
         xYHA==
X-Forwarded-Encrypted: i=1; AJvYcCW+uc1K7hrquYhSoSxSeaZOpf6OUwQW9Eio3lS96rPMT13H6G/gfZVi0VPuICYqI8vgKB7w07qFc9SKoZA1EoEY@lists.infradead.org, AJvYcCXKbz62E70/PNZ+j207f9zlknE+a+JQL3gklkXM4fdTGbmCaXfOaRfM3EGcNuF5jdRHqaJperOaMOUwmY4WmgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYbmxMUNglKM9OJuRnY4/qXxcTv9cRbuv74TFu7S7VygkzWPXn
	2oZrTkTfkSIe2l1QOheh1DCdAMwB/tnvb+0/9OrHEPT7ITx0V0yx
X-Gm-Gg: ASbGncvDdgba9ehUF6iQBPYuBzXcigw2rtU5W3BWwUfAHPaCLFPdSzL8uZajm2Z6KTc
	DCC5zRaNypmTJDzd7GvtP2Ukbkp0BmPR5YkItnzcAkGw3wM5HoapYdthD9H6MDDiHBFmhxKoYgy
	zgj0opLbnqBYxWBZjNv/iXnetRN/GTTuZC6bu9Kib4A9Vi5dn9dXjMnifN0MD6CnD5vPmArL1GA
	1y1lWpHMIwpcR2e47Jka6K+NPMslmk0lHkFQmaTUrsuWlSdHp5tWqrrQwlsbx2f+sW/tuQG39SY
	Z4iusF6Kc6HKS0GGHfhs1I6OZQNr9MzHUBwB444+eeZLrZgtBOpYa1WtNHGlPfyvUoDoj6AtqUi
	bq6kXBQFv+CSRa+5OQnaB
X-Google-Smtp-Source: AGHT+IEYzY7rjKPMqSp7cSBvpPD5AA8AUZB71qKqvFnrDALom7cjONO23WDLViizluzU502zcmg9Vg==
X-Received: by 2002:a05:600c:c059:10b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-442d9f2d08cmr24021945e9.23.1746872673237;
        Sat, 10 May 2025 03:24:33 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:32 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 06/11] net: phylink: support late PCS provider attach
Date: Sat, 10 May 2025 12:23:26 +0200
Message-ID: <20250510102348.14134-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032434_967312_4300FA4C 
X-CRM114-Status: GOOD (  27.78  )
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
provided by the event is present in the phy-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance if it's not disable and we
refresh the supported interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/core.c    | 40 ++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 52 +++++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs.h   | 48 ++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/drivers/net/pcs/core.c b/drivers/net/pcs/core.c
index 26d07a2edfce..409d06658167 100644
--- a/drivers/net/pcs/core.c
+++ b/drivers/net/pcs/core.c
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
@@ -147,6 +158,35 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, int index)
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
+		if (pcsspec.fwnode == pcs_fwnode)
+			break;
+
+		/* Check the next PCS reference */
+		index++;
+	}
+
+	return fwnode_pcs_get(fwnode, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 static int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode,
 				    unsigned int *num_pcs)
 {
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2f28c4c83062..1a4df0d24aa2 100644
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
@@ -61,6 +62,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -1909,6 +1911,51 @@ int phylink_set_fixed_link(struct phylink *pl,
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
@@ -1963,6 +2010,11 @@ struct phylink *phylink_create(struct phylink_config *config,
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


