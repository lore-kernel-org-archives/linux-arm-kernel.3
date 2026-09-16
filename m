Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA8C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6vHaZFFw3iOWw8/jtHHFZibW/y6sOiPqWI9OvgWuHw=; b=M9XXy1kDiK5MUpSD//SO0jF1dZ
	Ftn8w9NZEOG/fyyKN/QATiJMiOqIIsNSK2j71auXUFe6lEevwBWHUQZicuujNLsDuuNopVtN4cNwE
	BS6Jq3O3AwN/KV3rDlAIUG4fmGgIpXdWOFPPAHb/plC6JIF1kwIu9pmlrghc/TLESEnt7JQ2KD5od
	yXvQUxEkoPt1kTZxW3PTOmuMr4idAIS4JYvwNN5s0yjOTPVk5xNqASZxrEA+jj9qj8MVbnJSgoVJc
	uWsE4eVZotxXGvHxM46mbX7hwkrsL+CSMfJ3XVKsY+/gIPvUdL/yZ8tr/y7wtYYlaVTgB9/72GnQM
	Zl6BjvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQW-0000000AGUk-2Xjx;
	Wed, 16 Sep 2026 23:52:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQT-0000000AGQd-46NX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:31 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so169864f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602748; x=1790207548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I6vHaZFFw3iOWw8/jtHHFZibW/y6sOiPqWI9OvgWuHw=;
        b=Z0PhuO+qkBVDgN5zzHm/CR+6E4FUf0ps0rtMz2+4k67w6Dpx7h+wRqSn7RRUdCanoq
         vnjNGaXu69FR7v+jtbEiNE6bmZWnZnu14HQFdRvJMqzewYTj1eEYp5vpkaRPZS1hA1dS
         /hKDlDLouCnG6kG8j2UPoR23e0aXITPVVY/L/2Xkl6Z2wVKb2cge96flP0NrCHujZ2bv
         XMUZUz6SUHzUwe4PDhiqjKjDTBF1qnd+L62wXgvUZWyXu70lcXdqSw0dxyVAsEADGz4V
         nuDfWdbkm18JX+Y8uz7xstkzMYXEZQEtRfOniNUA21RdITaSziM5FP85aP/owu3FKb0I
         nlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602748; x=1790207548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I6vHaZFFw3iOWw8/jtHHFZibW/y6sOiPqWI9OvgWuHw=;
        b=m5NTAfJ851SqWQhs29y24QO9d2NXeyadA3B+ryk+2L0fvFYN4Y+W4xhSyTEjw/txC6
         bttnrrdQS28f/QMBqs5Az/UnREeBFZzrmW1iF8FOP7Uzybj/qp80jbbo4i6WWh5hFt+9
         PO2NoV3sw7deHtVZxm3pJyxFdIcFF6h6zJxRxltHwPoMymxEEkvEgTUvWIup/igqaBzV
         cwHRTOU68sCwGIpF3tzVNWWG0VQmiiLZKImK0KAYi7UguMe4+BUNF3valYPGWbkvQ15/
         37ng5sQ6IMYnRR43nXG+HsS0Tnf9Sfo5BLgubbp+l88NsUE6xxVpT3Crm04coxth/QQ1
         hAqA==
X-Forwarded-Encrypted: i=1; AKwUvBxUvayd0/Zx/RbE7o767SBDOBgFYG5ZrnTV3FHhEIxlmThFUAJGt/j8RnevmR08ZjaBzGL3PEzDB4Bw2aRVo823@lists.infradead.org
X-Gm-Message-State: AFuF++lj1iyU3MoQ/2Oo7OoEOTIn/h1KrxaIwSVFhhOjyuRa8i1QHI93
	10NZhMrzUdC4DRphrcqssz0j9eMSDTayJbwfhSlUaz/7WCw3+j0jyRyy
X-Gm-Gg: AYBFou1OYxVxb7NcB2AfOIMWpdQY7zrN/As1a6sLv0IcFI0cyexFAzA7YGkbfK7jgCl
	p/FoKgzbGIMohJg9rd2orI5/ekh0hDI/NnhhKGnI9h7lCb/yoLfd7jfKTqzhHhF8CxcOLAL+Hgt
	rycYWKI0at6xt5+4RkM/0z+tUjHPS+qWM9IfWpCiCab2qzTkSiotsG0b4IEMk7la5zmCMo/DGF+
	zgoQX/TQeK3SfY0rZKP4rkzvR+UmLVdVJ4H+GE15GT0AnpH6NXjzAYuMjfCiEpkWXZvPEm92CPa
	nkKnbkYQ3mXqBl8Z0WLs3smV1OvYAE18sUn9ErVB5osL5IvXNGNRni+oD/K4F4cYKjThOaX6ex2
	pEpfoHQqIEiPZRXN3SejvhfKrZl+4CbJi7IMyjEoMqqFQffmf2MtfuPTH+aO5J7VM++vKC8dDDV
	+mHLtjhbyA17h4RMb0iQp0gijjPCB5rn87WIIplmVw4osjiutlSsDrN6K/Olp6NOHDW09tq+0kH
	x+n3jBCu30A+qNF45/FSzyEwKmcCWs3j8mkrHdV8FEEQ0yySCaRSnR2ZGLy7ig=
X-Received: by 2002:a05:6000:654:b0:487:72f:fb42 with SMTP id ffacd0b85a97d-4870cf29d90mr10063576f8f.14.1789602748293;
        Wed, 16 Sep 2026 16:52:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:27 -0700 (PDT)
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
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next v16 06/12] net: phylink: support late PCS provider attach
Date: Thu, 17 Sep 2026 01:51:32 +0200
Message-ID: <20260916235200.20712-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165230_080485_2ED10450 
X-CRM114-Status: GOOD (  27.61  )
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
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 22 +++++++++++
 drivers/net/phy/phylink.c | 82 +++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++
 3 files changed, 118 insertions(+), 17 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 25b3248e8b93..fef560eddf2a 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 88570a59ba9e..fb3fb522769b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1928,6 +1928,27 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static void phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	pcs->phylink = pl;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -1960,7 +1981,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2006,27 +2027,57 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct fwnode_pcs_provider *pp = data;
 	struct phylink_pcs *pcs, *tmp;
 	bool resolve = false;
+	int count, i;
 
-	rtnl_lock();
+	/*
+	 * On PCS provider deletion hold rtnl lock as one of
+	 * PCS can be currently in use by the phylink instance
+	 * and ethtool OPs can reference it.
+	 */
+	if (val == FWNODE_PCS_PROVIDER_DEL)
+		rtnl_lock();
 
 	mutex_lock(&pl->state_mutex);
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR(pcs))
+				continue;
+
+			phylink_add_pcs(pl, pcs);
+			resolve = true;
+		}
+
+		/* Force an interface reconfig if major config fail */
+		if (resolve && pl->major_config_failed)
+			pl->force_major_config = true;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
+
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
 	if (!resolve) {
 		mutex_unlock(&pl->state_mutex);
-		rtnl_unlock();
+
+		if (val == FWNODE_PCS_PROVIDER_DEL)
+			rtnl_unlock();
+
 		return NOTIFY_DONE;
 	}
 
@@ -2040,7 +2091,8 @@ static int pcs_provider_notify(struct notifier_block *self,
 
 	mutex_unlock(&pl->state_mutex);
 
-	rtnl_unlock();
+	if (val == FWNODE_PCS_PROVIDER_DEL)
+		rtnl_unlock();
 
 	phylink_run_resolve(pl);
 
@@ -2268,10 +2320,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..00a636c82c65 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed) or
+ * can return -EINVAL if the PCS provider doesn't expose any PCS for the fwnode.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.55.0


