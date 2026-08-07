Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E5C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=; b=Mvi+QHgVti3rQqoQNzXY3Lhor4
	VUmJLcL0rHlO2kkwBedI1t4hewzEBEVeqXuBQfUBdxheAH8jWyn3Vb4WpLDVEeUW8+XvnwBzqjbqE
	6DOlpzTIGWQz3DU3UfbeBM7cxa33YrunZ2FZVK5GsdrNEv8B1ISO2QMG02zO4ICETuK/4ETpRzPVQ
	iwoU3kKChZdTWa3qZl9CV5Fn8ihuLSv+PBQ7gFbx0dVu5wh1iQ1uMBON4jxOc12SmPLYpn1fAFxs3
	Hp7JWVqdwBqozV1f+0q9RjKSVUiNZFxW6F6azXyXFScUq6LcIG6fmkjruJfqu/Mn+X/ADWkFFE2KH
	XyDsIupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOO-000000085uy-3xBX;
	Fri, 07 Aug 2026 13:13:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKO6-000000085cU-2N8V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f633e6058so2840226f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108405; x=1786713205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=jf3xR7XiwIAxWly04F2iLDiFdeaMGcCxnoHhEjHTrJsrCqxN2ScQ2FELeKA0a42Alx
         wOqQvUTUiz8E8v6vyENiiFypTP8y0/PQONGVVBvXYyrex0s2wAOMlUhwxal6BYsJU2Ev
         +4Kr8F2ln5EBTPK+jYcITWcz7POYs068ZlRfukP8RxnNHvv/KqTiqgwfzJJoKeHgTorK
         6EJUJBXI1oMde7S0bZJZ4eCfJryUifcjq3PhxRLmVUa6+29+UTadPLzyQCIWiO7RMtAK
         4p7m0GEiEkRs9CXEnC882n4b0EJ8psH1nJXnKjc1QEC0r1vdMQ5hZQq5jK+zAWwCRzup
         HutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108405; x=1786713205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=sY896shs66kzDQvcMlamilOI8BtlNDaPWr/nGGlfFNq0F68SFTO4eCtKQ7eGaapmin
         AwtiZmtuZYAbIkO0Id+SAum1XJzhDg2QrRF1Z3+kaHgxfAgAwKlSPbq3hmIfx5thsaEP
         KSvIqlBV05C6nV14kiK62EQbpGWtSZlDubjE+zkXL9qEgvISPV4IOFEv8blRqQKE3boc
         JvbN9Wa+ovn4hDAu8SbalL+PyP/yO4beqwykQastGYEz5MlOp5Srpuy4Ev8SD4+S7Dyc
         sEoZe5JwcRqkAggAFjnegfGOkmvACB80o8jIewUPgsLjmJQm3xazX5bogKAarRcoFtJo
         lRww==
X-Forwarded-Encrypted: i=1; AHgh+RrKH+qHBB5UG1Z7VM6GVbPY+MEJeHecdttzHlvqgq1Kd6hNHoSa3kEye3XPWF05y+62R2qTydVqdd8k96rWHHpS@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ3eNWnxL87vQaJiCCF4Tw+6FWr8hElTDg67xqVW2peuMTRQyG
	Vy36XXIucknNfdNA74TUJvGs0RHGqBmFRILDQhwcMNsN878IqigDdweB
X-Gm-Gg: AR+sD130z6QxncmFCckuxe/da5f8Uf5xyTGrnMIcfC1dsOWJ+XBhkA4ZuVMr72bmsXD
	JRonTtRCkMTLKLWpGu4m4khphOd2l1RIGW8I/V+a/phr7QZe4qOYMvDYY+WIa6GvZvmwHXQT+vc
	n6b8tKD1XdldRI6z6O9pFa5pGDXpd8OSBi+H0sZ+4ckx/wGpssA+qo0+FQ8Dq82gRkLBdAbKXki
	A8Yk4jAtMIZ358IDzaFUQ/tVLo5ViHuEv3beRIiCnKUzm7UsWJ0hH8TUdqrV5h0hKs49Nr+l6WT
	cuA7fr19XigDqw7+sgXz5FoJtaq1zavZmtXrfPan4pcfH4Kg+z/B2sfZh2CvzXwt3Jt06UYSQvS
	VzD13mwar9ItMNT0SvGxe/pgOLz22D2WiiguNT4ccRAUyNddu3mvfaFMGNMaB5LMpEzJOwcKT/6
	p+8XEfwShi4+5rvqv5Dnaj44AICAizH7EaeOx//124vRXDm0BZcB+WWXdZ5RYPgxqerJb81PlPG
	l/8ltEcIxplwxuPA7+2/fg2MUT3CcTRrmXSxmUJr6WjTHpY3YRNSwysklRp3ZNj
X-Received: by 2002:a05:600c:4e94:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4994e6c5eafmr288598705e9.0.1786108404621;
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
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
Subject: [PATCH net-next v11 06/12] net: phylink: support late PCS provider attach
Date: Fri,  7 Aug 2026 15:12:48 +0200
Message-ID: <20260807131301.192060-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061328_583292_782EF9E9 
X-CRM114-Status: GOOD (  19.38  )
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

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  4 ++++
 drivers/net/phy/phylink.c | 41 +++++++++++++++++++++++++++++++++------
 include/linux/pcs/pcs.h   |  1 +
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f575fbed896d..79fa596c2900 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return pp;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 548e783ae2aa..69d4f6675db0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1908,6 +1908,27 @@ int phylink_set_fixed_link(struct phylink *pl,
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
@@ -1939,7 +1960,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 	mutex_unlock(&pl->state_mutex);
@@ -1991,7 +2012,19 @@ static int pcs_provider_notify(struct notifier_block *self,
 
 	mutex_lock(&pl->state_mutex);
 
-	phylink_del_pcs(pl, pcs);
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		phylink_add_pcs(pl, pcs);
+
+		/* Force an interface reconfig if major config fail */
+		if (pl->major_config_failed)
+			pl->force_major_config = true;
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		phylink_del_pcs(pl, pcs);
+		break;
+	}
 
 	/* Refresh supported interfaces */
 	phy_interface_copy(pl->supported_interfaces,
@@ -2077,10 +2110,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index f9dcbf58d053..5cdd121b12f7 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
-- 
2.53.0


