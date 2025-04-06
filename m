Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D56C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHvlV+lAo07PEsn7Y5rgyOxBhBSPObcKBZUiEs7jo8c=; b=rZGBsX1IGCZCU4V1L+tN4Yka4z
	WPY3F9S7zii/vgH8jHPGjXuXhGGSENibLOedM/nwZOL9AgMKHigF5uEOl26/4XJdKdSTAaEjgWT4u
	S4I+0Rqg4Po4j3CmeeegdeiBKgRqmnBF+rP0Mp5aqZuS+ipGFySxrAv7HcV/+ROz/reyGaD8ju1UU
	q5B9dghz+kymocH0VuFf5384Mp1YVFU14IhhCaOXwb6qNP7+DCaskMnCjxrvRalN+Itngt/KWLOgU
	aPQLB7/ED5IC1aKOFX0MLFSSq8aUiRPR55A4wChFnEyZw1i7JKFdH08WmK2kzJ3D6wKydSlCDlWJt
	tC1q1Btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YRO-0000000Fv2P-1LQe;
	Sun, 06 Apr 2025 22:26:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGh-0000000Fsvy-2NzG;
	Sun, 06 Apr 2025 22:15:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf680d351so27472145e9.0;
        Sun, 06 Apr 2025 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977706; x=1744582506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHvlV+lAo07PEsn7Y5rgyOxBhBSPObcKBZUiEs7jo8c=;
        b=gEUyNChPf7ZzPGZkr+UEDVQQFozAHHNRVK97nkYCqUU0QQP9dpB905SGkFW/WC3Bam
         gdZRGSLi+AOfk3EL8AhChv9W2rbq5iTSWCHaNlrY82EyU9zCk1jdUUghlTc/3WdkrQQM
         iKTu8yjAHObcvPReTN948pV2ZW/GckTkk5jA5QSq+X/AxkWcW1E8PWJ+t6B7VCbvda+Z
         Rx+DZWdhDeYEQpYc1lrw2nkNs/i4d3dr3Rx23W93d156ItPf1at4AynGvGYFvs3S8DgL
         H63yF+ap9LjG9izy+Br3A4cZSjq7TQ/ct6iS+N1FtMkYlete2TrPWvoYdhgLQMKBjyg1
         Ihvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977706; x=1744582506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHvlV+lAo07PEsn7Y5rgyOxBhBSPObcKBZUiEs7jo8c=;
        b=ewWDNTtvgGmKGACrset1Av1TiZcmmbhUWtlqrw2YrG4TzN05zogTAF97V+vi8/mQC/
         jvCZPKIRBU9ZOmUEaJ0rDKocu/z0in60VFwGhuuve+Pz0UXKDtJq5s2WLg4Bx0kAQ1d1
         BqwMx1PMnJYdyrzJ9RAitgGVsFPJYYk77qzg17hMTgfaempctzSA5K5k5a/03GG32Uju
         4uBaGnqz3IS0Uz6M2ckMDDPB7bDGMq/aG2zzsGXwtR6EEPwZrgG1ImdQZLXdoRxJNzWf
         pZqmOUKx/VYIbajreDJ7waKcyu67F/UcZRa5iKXuRCdujOJ56ydFOY0DpG+mqfWJ4aM1
         NwNg==
X-Forwarded-Encrypted: i=1; AJvYcCV3mpbCscA2zl7PKhWTO7XQJojpkF12DHXd8or9F5gC70+pbvyPnFGoTqWcWFT4/zmsBKWHGCjPUcHmLJZrcyk=@lists.infradead.org, AJvYcCXslmdGuw3lvBJsjjLepGCeSR8DsY8vIr6S9wmpQTEpE+0RCFk8UB+AsVLC8Kzuc1S9jYiOqOULXc3JmgC+UoDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm8Vru3j3FkNh0jvClEl7ei2Wnm7yruIYbjCpU6unmuVzRLYtA
	f4BofCJii5SwloPqKlAnn7o4Er66uTrpCkK1mHco4wAfT6KhhpKE
X-Gm-Gg: ASbGncvzN3NS34Nw/0WD4Q1n3pWLl9SX1iB+qCGSHE5OdoyEAMwjcE6jn6dpqpEkWN6
	tklTuLP70g/hm6YTYBKNHpTv30e++NZgL3idYZ30eZViziVDL6TuGfeTvT70Q5p2Ymx106ux8Zd
	eb2i4FKIL+Llu+INLx0ntOB5cLxT7ldeAUNmDFLSrQDrD4bGADtrNa9lP0nYRiCijILdPXl6hog
	RgzbK083ntqWCpRBbZIp9XbzXUMtWTav8LTJdvN75ft8uXeMyL1q2awoqIMFI9Jifjj3NHfDU8X
	TSMP0rM0lbcYsPzgfBOx8hkzXUR4d4GdklJ+PFS0De8I5dNFbdvmATSUUAtWExxnGVp+VRSBsiY
	Mv+qE/VPCYAJvLoOYVufvQv/R
X-Google-Smtp-Source: AGHT+IFRTaVaadmWLO6m7IMNHXw2Yzhsjhiip2R7g0xWIMlaJ4D41OkBeAWnSLDQM4PNIiZljl1KyQ==
X-Received: by 2002:a05:600c:1e1b:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43eceee3375mr103173255e9.15.1743977705889;
        Sun, 06 Apr 2025 15:15:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:05 -0700 (PDT)
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
Subject: [RFC PATCH net-next v2 05/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Mon,  7 Apr 2025 00:13:58 +0200
Message-ID: <20250406221423.9723-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151507_611979_1C683752 
X-CRM114-Status: GOOD (  25.90  )
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

It's also added to phylink a flag to make phylink resolve reconfigure
the interface mode (even if it didn't change). This is needed to handle
the special case when the current PCS used by phylink is removed and a
major_config is needed to propagae the configuration change. With this
option enabled we also force mac_config even if the PHY link is not up
for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 58 ++++++++++++++++++++++++++++++++++++++-
 include/linux/phylink.h   |  2 ++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index f889fced379d..e6bb6e5cb63e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -90,6 +90,7 @@ struct phylink {
 
 	bool link_failed;
 	bool major_config_failed;
+	bool reconfig_interface;
 	bool mac_supports_eee_ops;
 	bool mac_supports_eee;
 	bool phy_enable_tx_lpi;
@@ -901,6 +902,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode and set the phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		mutex_lock(&pl->state_mutex);
+
+		pl->reconfig_interface = true;
+		pl->pcs = NULL;
+
+		mutex_unlock(&pl->state_mutex);
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
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
@@ -1694,6 +1744,10 @@ static void phylink_resolve(struct work_struct *w)
 		if (pl->phydev)
 			link_state.link &= pl->phy_state.link;
 
+		/* Force mac_config if we need to reconfig the interface */
+		if (pl->reconfig_interface)
+			mac_config = true;
+
 		/* Only update if the PHY link is up */
 		if (pl->phydev && pl->phy_state.link) {
 			/* If the interface has changed, force a link down
@@ -1728,7 +1782,8 @@ static void phylink_resolve(struct work_struct *w)
 		phylink_apply_manual_flow(pl, &link_state);
 
 	if (mac_config) {
-		if (link_state.interface != pl->link_config.interface) {
+		if (link_state.interface != pl->link_config.interface ||
+		    pl->reconfig_interface) {
 			/* The interface has changed, force the link down and
 			 * then reconfigure.
 			 */
@@ -1738,6 +1793,7 @@ static void phylink_resolve(struct work_struct *w)
 			}
 			phylink_major_config(pl, false, &link_state);
 			pl->link_config.interface = link_state.interface;
+			pl->reconfig_interface = false;
 		}
 	}
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 7d69e6a44f68..09e19859a71c 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -708,6 +708,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.48.1


