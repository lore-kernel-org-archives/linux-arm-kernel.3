Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C65CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWs5na6Cu2X9woRa7xyM3F4TzvlhNiNJPEUsaW9Eszc=; b=V6rYBiDyLLg1avClD1LBihy2ic
	IpYpC2U7sL8uGeXbZTrx4tAxl2z9lbgZdJCZdbKq+6pdgvZvSd1ub2RR6fQtEHTuUPb+a3bC/+XNF
	DgTHEz9bfJ7Oyu/ImmyTHETLsmAanec2vrSN93Z82WTN4A6YO+6X2vUTygNScxAtrg3nxU0jkaG1K
	au+NuQpEH+/SabO2GMrMMfMDiXDzV5gYsNGqwkn83GXH0UzQ8HNdyezvQGH5/PvvjMmKc1AbAnczK
	XCkpw/DQoCOA71O7Nge/VC1+8mIEZKNuYyWspgnRq0HUhfix8Vop/Mt7RUI72ooGbmb6rlc+yK6X6
	5dAuJHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUa-0000000HANF-3bVY;
	Tue, 05 May 2026 18:27:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUW-0000000HAGN-3L6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so45118425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005651; x=1778610451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWs5na6Cu2X9woRa7xyM3F4TzvlhNiNJPEUsaW9Eszc=;
        b=QJQ/XjLgfUDQK2sa1oN6r9sQsf5axWzVCSzWcFz4g0c7M2d0UimXC9MzKZ9SBW+Yof
         VigE8IbjWowg7Tpc1IhtNdujsMAtm/77y6lruedV6+MQLhOmeQEsRQIU9e9/qskaiMII
         jaSda9K5T587SWciGubbyf/7qwBAOS2rAv7KFDctoFQJ4II7Caghb9SUJGiUiCKTuFVS
         41Z8WOVcJacbDqi/IcczF6wbB78KqGAC/h/NR1sxDJkTUtiHMP5W5f0SjOZagO36lMzE
         1t5qAp7gqWjmwAcN2oMRqBsrQbRahSQ0JyXWhUOyVOJPIohbrcn9K3bmrwaPYIJLqPi0
         Hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005651; x=1778610451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qWs5na6Cu2X9woRa7xyM3F4TzvlhNiNJPEUsaW9Eszc=;
        b=GFwRCwLaYxUWe58kFK5DN+ie0uM5XGCzIdHzstC2FMGVmEeNiPwzn4axSIhyfyLFWO
         lfDJ6oiOZH52CWgXgL3yuFVc1tbdxHcIu2s6Y9ULml639Optedm8yGhfpTUxIimOr7/s
         Q9n8G5CxGrfpQURjPe1hs08ZzB8PE9NNxvj+E/SYKuKF0o5TSQplcXDLrYLwHZJHpKHY
         glkB62KSWzklQv1YUEfd/pTDfpHmwlLC5OlB9GmxQuEgHplMYk7MIAPQFRS1Ocophw5H
         f0th8LJJMKrVDMZNBgcOaKxsjcStCymKj+AqCPqb/Bk3OeKT3F0xnXiDCeBIeD0FxE9L
         3HMg==
X-Forwarded-Encrypted: i=1; AFNElJ9YIS9kFNGpWtQjK86Xzsyj8X+NdVzNcwneIutCAhiJH+wsgOJtmzLAAgJxB6tnY/4hVzHUSDVwxz/Pc9rl+Jj5@lists.infradead.org
X-Gm-Message-State: AOJu0YyiOaJPICLNpKDXKgk8WxntMN59ThT9ZhPfJ77ec08DSpMWKqSB
	CMSLifF+JyTwSzgKYfZw3eoPqEtNMhejFFUOzNYmPhvua/DdH5ODklid
X-Gm-Gg: AeBDievazBB7k8QrHgwJdOye97Y5xrgBZTAsTthQRkIuyZ8oFGTJnQx/Ia2kcOKLcU0
	4QwR5PQEgiehnc38ZT/pyMNL9FDkG2yEqQQU7KpF3XA2biNQjVUMvl6Xb23q17WnA1ZIfc6Mlgh
	ONxQOh4vTznIn6XvhqyCNLHx5sGFrO5Zw06YUglRUahRPO52Sx1DKExyUd5jla+smjH+sXYqiaR
	Qc9fKZvTFzbAl2HJdjDjhGind/m5mCScpwGW3QkKC6S7gKAuo/1ouTqtMskuvosQSicIkW02b2y
	CMS87EUl8BbmtouVcMCtO2n7TAORh4Sd6eF3T7lzXr1OyguxXvf8DtBSEqTsKnMRZAQomathOOr
	8HstQCDgMPZ4DvchI9VQrMDY3tSCOqIgTFkTWsaDgEkEelLl3NKPRXQ1X7EAc9IUKBRpaxE3omF
	tceD8dyaaezvheLZKgACAj7zmwuEYn5qh1X9nfImZXa6Sm5nlXy1NxHpj47y2Wr/lvN6p74iSLU
	G1AYVc=
X-Received: by 2002:a05:600c:a110:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48e51e17746mr5220405e9.10.1778005650787;
        Tue, 05 May 2026 11:27:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:30 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 03/10] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Tue,  5 May 2026 20:27:04 +0200
Message-ID: <20260505182713.27644-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112732_850698_D59BE7CD 
X-CRM114-Status: GOOD (  22.10  )
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
the interface (even if it didn't change) is also added.
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 49 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1a261060d78e..ca4f4f655a31 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -923,6 +923,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+		pl->force_major_config = true;
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
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 9c5a43febde1..aef4a4fcf6e5 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -746,6 +746,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


