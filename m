Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=; b=KGzZ+IV2DxEcMOEMpBYGRUvs0i
	MNoblEfQKX6Vza1uopyymhFscTdkrMuKl0OFqzjNc9910d4xugBOYw7D0ACroEn1wzsryRxNex7tD
	PPu2GmgbymN7jwwWPHa/Zf3tBx/cP0sioHNyawWrjSrHFsMV8MNZpXhaL1Nq7Q8KQVQ9R1uuobsVF
	U84rYu2KDpiQ+WjzHDc8McQNMpbj2vz2FOInIpO5+5xOzzNqBf/5A0dzXFrIzj09wedDftuzh4C9p
	c0Pe+HvKUU33q+rpN1Krm5KdzEVmxXhwCeS0UTp1vvQRY3x9r9kLDBQHt5ObKei0YcupV17YXwRTT
	W4HBC9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTn-00000001Jgq-3PH5;
	Fri, 17 Jul 2026 06:55:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTb-00000001JSJ-2NiG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c19bad03so60060235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271314; x=1784876114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=RTjc7t39/mdEu0BoShGY8m7l/ALc9iP5d/uUQa7WEPD2VYA+njIjdrDfmcNbqTIyet
         Pv35S4JtIe6N/cPZHZbSjd+omOKC2Q6C/8I9y6ZcGOz5LQrJpnNya0Kn2nXeSOCBWMpc
         SvgkJLPBzjhj0UjY/67njKAYFXxjc8PUSWx7DSB7/0K1/1QxkQePUsYfoSlmfHR9i5Wo
         1y+wQnncZH0GDmOXL39CIuzOOvjW4VZVUpBCGAxTueRNSvgSPEUapaMsSs9efVA9tV//
         2pmX+tJVAA7QOyIshjw+0McCpM/HhNrRWwgP09imqfSs3FXifvJKO4qp/iWNWkCshOhA
         Jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271314; x=1784876114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=kdFHw+dlsQpR+BBY6B3usXE1QUl7N5nIgOGbURZJ+f1WNEJClbM0X0hjOhq02oObvD
         OWVNZSyxAzhGsSESPGhGKWbTb7vcM+AOW1DY+/fLF5SooyohgELB73kjcqE6CixjLtS9
         ZUrcy1Kmkc8Z1x1efbBFb/0b9S+DUlzEaHnBOHKPsMHgihtPaFiIgNEsljcx++uHOtTy
         O1G2O5p7iilONukSdoTMvG7jDbks21usyEi1wXm7m7ayWiBl24le+WIodLYZG9+NWxa8
         gg1CjOPqZfZm89bTgLCsllKqaerQIkYqZnP6PE/yzi16aF9SsOe73mbwtF4aLMxQJnzE
         O5NQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSZRkYsp/WG/8sGCIrCzWI8p3x583L4GUsJoet94ZyWTyya/7Z0x+5nogICu9rL0TkW7NTdQmnAg/mfXw5Vpje@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp5JErSXikZ7EVUm7oPaQ2BI1N9ma/aBWbImNYea2gWSmdad8d
	/jZCKIEncAi9TmNZbMKjHXIUR+fWGTeMNJ1kOVbf/ZyupD3aiHrglb9P6XXOQjo0
X-Gm-Gg: AfdE7cnD4/JLk+Mr8pZw1QGn8yOCjYodyZ1h6d6wGHukJlbTI+NeO7rBRx2R7+Jw44J
	vD6DitEEC3hmrKvS+TWAhfwlzHcT2i5MneCTKuUMAZytIQuRk00kYPAuWsamMxlKswkQlCmfzEW
	6pu0t5Rr/O+eOHgVVkscwHgf8/+N8fkXluUJsA8w9GPANYtjhkeuDP78HzPWolCvkLEeIlYlDYy
	W5pYCn6pkxDbWZ1i1q/LiyZbvjDqI/F9+rQtzB9rFHfoxlidFjKyO5We1Qc1ZxSSEBiYRTH07rc
	srkjYJzORZaNfv0w6jY/wFsNEY3paFFNhrAcpiPSGllxVYvZRPip4v4TcVL8YJH42lJNyV+8C0i
	5a6o/XOgNhMBolrvAfmVGSCBZgmJxVIfDkfa5WwGFsAe7B0LqNURdnVafeXre31+3zR4c39SpHB
	Rx/LZyg4Rds5IDrXKOz8H8tnHm10Nwf0HvsEX8xgzamDXyH+Tfu95vEZt7Ny5OdDV3KRqOjxAQJ
	L+RUaV/
X-Received: by 2002:a05:600c:5253:b0:495:473b:f439 with SMTP id 5b1f17b1804b1-4954a3ec6b6mr11503595e9.3.1784271313573;
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Fri, 17 Jul 2026 08:54:03 +0200
Message-ID: <20260717065448.1498335-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235515_631059_A180B52F 
X-CRM114-Status: GOOD (  22.45  )
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d96941d4c523..986e0c1e3d67 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +919,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


