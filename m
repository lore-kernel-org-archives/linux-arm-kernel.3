Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B8C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=; b=tRRodKrsBwqcry0Ee5J7tLG1MF
	f59tthCIKiD0cjn9DEcTjJ2SKuGPljXiEb+qDsWpHPwG/Y9TmCaANddOBBmu0bkPTKndk3L17FXl9
	Mljg/gc/cJ5IeQsIghKzKb0ERbePdOQieZ6CkuSJSO9usIzmB92eEtPFgm6/pNzwL3hLw4eGcA/rR
	Tg/MGOBcP2T/Vch2rSP72nVXuxozVXVMa2QfYpdghFLbhyOphiccKapIANcgb833FxBt4L7sZ7VnM
	byv2+ToUKLHX2/t0qlDluhChEWluqiTFFWJxRVR+mWkrVmN8AlnKW0RAnudQI7+BssER91eBmFvnt
	17ZFCCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNx8-0000000ABn5-0R3y;
	Thu, 30 Jul 2026 10:25:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwk-0000000ABT1-3hhb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954afac04bso21311515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407101; x=1786011901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=p8d7PmaCU9piiIZqs0g9hgnm2ODLA4LGlFJtxzpglPrRoFtEcW6jFRyO3w+RYXASss
         05UIvRmZgiudaeIxrrmaw70vsZEfr8LnHncOUaTjyR4BXZUAWYhzUiAu08N+2I7SfWq9
         MC14O/I+bFmil2B46U2tAw8FhwZvDsO9OTLJb+P4oDVkA0Qgg4j/hXLJj2qanJW9HRKz
         juLqM3LBrw/zy1XY1WJDOT250x+CBwWnaQq5eBJ9nxqEgQDsmm8Gbxf6tmw7xEH8lq0Q
         pu5D4iwjY3Nm2q9tHRtPp1uw8207pY3gpkWaVsqViHsA1xbcxiJYxR3wm2OBz269BH9F
         4eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407101; x=1786011901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=F1nI+bGrGZEWQNThRaRbdaFvlAh3Zzdi+jZIsujsRocJYaqrSpxYmXqnZuXUk/Z57L
         ZyNippXLe5JJV5BozTkGEk+/WtbosslXxFxWFh0VLRzxNHZasJdFp2J6Q4XSGiuuBVmR
         Ynzx98tP9bKUiw3lRoK9aDpsmtkLDwVhYKqvBCpSxqqUTHiDpsCQcXQMRQPkVNxwwYLV
         GoWwva9g+yKz6TRVtvuyRioyxptU2OYbJ+CiUd9pUq+VnFDHE8O+4OjbLKEiUr6pRSK7
         qfh3mWnP1OWun5WtIzwqi6CLtzFMT5XZukx8J7I7gXbXBTnNGvDFhpW/YgCIj+Ef+6Ux
         V+xw==
X-Forwarded-Encrypted: i=1; AHgh+RrDNnCfz6Oqa+Gpd1RM8xkkBrPUq9yKN1Z7xLYE78AycydVNMnwyP1AGfZnPZOTOYQ8We7zfAb98ICxvGCMG1FL@lists.infradead.org
X-Gm-Message-State: AOJu0YxBUI/Wg2q2MZxcBkH2/vkq5AcMexUln+nI0z2dLahHj5xE7WIs
	4vhlR7tfuJzEB/JwdND1r8a2SOMYb+DDNU4QU4abkGjnhuQ5ZtH0UzED
X-Gm-Gg: AR+sD12qGAjiBSxCmbAJHHKivg3ERHXfJG9vebxEUhfappZnlhTV2nZsOaHI4PqKKhg
	jh7qTRK5ExXniNNzAjtMI1gCHad9ZRZM+FY456c4kkuAHXmoXcRlcZILA5s+7cmvs4SBJxR1JcH
	9DtCt/CK2jwq2TUP8D7c36GLRUdIIJ3rloc7hTlKGfvM9pFUp5FLdkfLCMtvaE66kEexvbNo5Nk
	0h8sjLfXbo0lULSWoyhtSZ7aQLntHwfR73g0hM/9va5NQadM0WLIFrZRaIGXSl72Z6dgFtK7Oeh
	wGBAFg3MQwmOZM348CX9XaTzwSnH/9PfwR5O1AwrGavF/K9PAkQzrTqjZfBMAlWlLBX/EmdVmKh
	XKJNxM2iLdOafJwoVe4TlnjP83ENo3KQ7pZn9pTPbE7C8G8U4EAw9aZVA17qHcHGYI7ipA9aPsG
	bJLH8GepZJRQRm6OP0slltLcvLwpyX84nPm6hCim+mEMyHWOSaQBVmlDKOZl6BPdqT+pgBHvrOj
	6+RxPHfhdy1BgWRGq3cDFqz6HXa6BwUgkji5g6JpWuD59/RPlkWkg==
X-Received: by 2002:a05:600c:41c3:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49800e7b178mr13191645e9.15.1785407101144;
        Thu, 30 Jul 2026 03:25:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:00 -0700 (PDT)
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
Subject: [PATCH net-next v10 03/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 30 Jul 2026 12:24:14 +0200
Message-ID: <20260730102444.1967900-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032502_970580_73D2E756 
X-CRM114-Status: GOOD (  23.02  )
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
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a5e2d342a92e..562e09d1838b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,9 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_poll_stop(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	struct phylink_pcs *pl_pcs;
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
+		pl->old_link_state = false;
+		phylink_pcs_poll_stop(pl);
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
+	list_for_each_entry(pl_pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pl_pcs->supported_interfaces);
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


