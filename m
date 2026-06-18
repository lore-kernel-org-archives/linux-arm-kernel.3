Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76CACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=; b=lIkmRE5nxuaa4EyiCgsI3fJrlW
	XjKNUCkhyWLqXLcj1/k03EUfS6LQvzBwaKWH7EAoD0u2xT80kAgAXVkWSH2rArRXbNjMsKsJkkUOV
	T0CV9806CD7K51dngzd39SXGXPM4CWdu8sNzVB5ZJLd8B3fvuRGevCQnE34euh23ZGD008o2Adc8u
	ODUg8cGnRlN5W+SgClbZFc4ehG0H+fWTonDDmrWs6QwhSDDbCUG1h5UJWNCEg9j3U5oEOFw4S58T4
	9Jj383TKk32+HHpdeRKeY48G6W/IsdsfBkbPFNWEhRepapzoOg8Ap8dZg6Yc/i932eX1sUNgKZ4L1
	bRuZH9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKA-00000001IO6-2VT0;
	Thu, 18 Jun 2026 12:58:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCK1-00000001IE9-3JxW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b12270b3so4771465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787496; x=1782392296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=UDiAkYWqILdRaFD/DZFAqrORi2rEfW6pPWSAFK6p8ocFNGBoPn162302HXVTHGxOWS
         87byp4pw3Sn2jKgSTWDSmCwp69Ow7JRZd4seLpyzGwV4bHdTd4Joe3LQVff0cT8aw4Uh
         dUQin7Lnj2knreN85GE7Z4DpLaCxlQqj12wd23RaBEfGWfMSAFvPU7i5RdnlUSnBc9R8
         Wk4klG64te+oDwS5Z1BqqX1uld1X/f40egJ0fD+ynrltiGByR35UPQr+tpJOU+PEZefr
         kCJsE54hupV7yNk5+mm7AJC8r6SL821+rfsVRmumW4hnlkwJL68ZTgDfqhpa3Hh2I7bi
         iT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787496; x=1782392296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=BE85s2n4i9iWrBK5T374szlBbcFH2tkl0k+M0fE7bnxiZ3K4j9ugeoCGryVbeA9K5A
         S/P4aLlRVVNTbM0vEbJXXhzrgzrzTLl6tBgbejIZ4iTU9AntKqHarVtyaOCENrSRUw0E
         YpGs53XDAsrVsBiRD1klSNfOoXSZ8jQIIBY2vD9xRBspdQDRVRELyySXGmwkXz9f3MyB
         b0szHZw5LMG/ON14nxCG8pgvBJBWTqi0ykZ8R+5zp5sfeh6tyiLO2JlQU6KnyLUAxECY
         XqmgLRgmk5/HZeFWG0b8xp0xEnAN5X/Z9kSDJMT/PyNScAvK7O1t8QG9I0S8q2K3t/mC
         P0yw==
X-Forwarded-Encrypted: i=1; AFNElJ8CbtbDqVbxOG2Wnk4qAXHZAd1NBf3jxwA91YG7H4F7ugtaiMagPbca6/E7Gaxg9RFRyJ5IYYLaKW9UCGD5CvqG@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ8cbdAUKhQTXZgfR9JLz8Wb3XuSDcmzKGEH7wxTrPBQEEGm3O
	jGxNbUVBMSJXTp07UoFg/D+A2PwFiaJe4O1bauYhhHWDRn87rworr3Dh
X-Gm-Gg: AfdE7clCMfmFty+REBuDosROAIvBob6isKPkPdEGEQA2EmoKPgXnqktgF3sR/FjK7KJ
	vOEwCVC3N+mZZ6P5+cLu1YsNHw+6taPF6k5uPR0NhF9AvQDJ7Uw2NfSt4btZm7bQLd2r5Tq8hOX
	Bp3qRmzTWrgiPzGtIgftjDKop54YHlyM5GFmycKZEcwfLzo6zogARDT7M9+kICgmuy0OZTGVb3E
	G5EfjZ5/y5R3L2a1fOM35l4pVE06/c5FiJcayKe2CqP3F2gl34pdhQGmSV0+HqrrAZgzTNRctmA
	faGY1Ff8ooHWLFNkD6mLGNh1rTRbVSn5hp7M6rq3H3tCsDpE/5d4OV2IuGJ9wMGY4oMI1v4EiZo
	ZP2VanpnaoTv78lctUaRv297h0i1aGtk+lIfJ3R9YMDP9Ca34C64A02vPkrRVzOda3Fx3tcH/XH
	4CmHRt3l6v3tLoPdGWkQiyW9sYQLTsaVIKXCqjtYRUs3hTgi4Z8u64s+1H8yZlMg==
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-49234141d98mr89030975e9.33.1781787495577;
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
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
Subject: [RFC PATCH net-next v8 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 18 Jun 2026 14:57:11 +0200
Message-ID: <20260618125752.1223-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055817_924055_047A7AD7 
X-CRM114-Status: GOOD (  23.16  )
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
index c38bcd43b8c8..064d6f5a06da 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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


