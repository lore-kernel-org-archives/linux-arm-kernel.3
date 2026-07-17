Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C114DC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USxuj5cdXcSxjhj0RWDyCY2SPnAhuicY80xMgRrTLdI=; b=br23KO0Pnv6E8kZjgt6BDNataB
	MBo9pvU/UpNU9jxZD155wlEqiaJVx9me5xgNfQrTgm9gwGJH4zajnre+Wd5tIQTuJFuiZoaLm6yq5
	/Hkk6pOEFo1vYFlxeNHKckbN8x/FxWOTwIciHAT6hkgDVkH1o00+PZKG19AQypY2c7jS2oVQLq+lc
	rm6ptc0coa+FvHXbP0mFhZ6LMnts0y+4pXvwvSm2NIeFdN1awk8JB6zvY771jVEIkoyUj90+PCzC7
	pqsFLhlkWfL+p77GeYqJRvibHHnDT2U9TWZWCmAejGtEmaY1nMWxmaGiNUJRMbBNoaLflk7EHztEU
	qX0R4aZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTy-00000001K3o-47bx;
	Fri, 17 Jul 2026 06:55:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTn-00000001Jeq-0ARX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49548e01d02so1926955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271325; x=1784876125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=USxuj5cdXcSxjhj0RWDyCY2SPnAhuicY80xMgRrTLdI=;
        b=H6TebN0BXy1jy8eHKSEP3Pghjic06fofBOBrlHCk9ITG6JmH4iVLz6NIwNk2X0EZD+
         bn13aF+nNccVtFkorhG/dzB1ay9PImb44W+eELaA2KKiSydkPFzIwW8+YuogGzNbnm8J
         QmoEDX3etlJ9eC3qIYAPSo2KnTHA3ocNXXtKDcrFxGz2xamtBz6KGaJkWV6ROm2xL7Ex
         4Ez4buPey+qWdUYi4PmkILxhmUDbtxD3ypd0IayNcPUh7LlDYk0vqWSiLt+tS1qng/Zd
         QVSNTswwMN8qaCqvEHlLBVDEQw0RDp5gZJavf3mccGMShPsuWtKgIUXm4sYcU9d94/f+
         ndLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271325; x=1784876125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=USxuj5cdXcSxjhj0RWDyCY2SPnAhuicY80xMgRrTLdI=;
        b=EoL6/KTPcykuO7Xk0QQnH7opAgHtmgyDQxP4VDhUbr4PFudM0hQKIQWM7MA46dtSYg
         hYSsS3punW0LOm/Mp6y0b5NZEq10/tS6DNlItQWEad4xeY/MEBqNeD6rjZvnXXKI4rKh
         +7hizlrCFVWBzLjMhQzk/b7Jy2K0L9+ebU3uQGGpEsx6W6lgTtjMRNAGLI8xp1KHgkif
         VONqK0DELZNARgNOSNgy4rSz5u3O9oZ4zxl5e/Xvin3LQWo923kObu9uHcLUCELen17r
         RmcuOryAS1WXrM9gzo5G3hCwbG4tGU1OckQe/E7GJX+WrvgKuINBYsdDIXrANCBGw2g7
         077Q==
X-Forwarded-Encrypted: i=1; AHgh+RpQ+2YWu7zYa7wQj7wv/DL7B1PmVqLQbWkWc2x9T1u6BjTHzA7aYLFBBewPjowgqRe9c8Y3ei85beoaGPqVSmfe@lists.infradead.org
X-Gm-Message-State: AOJu0YxsEFXssZw9PUa4kFyztHpmdnwuylIYkRDLINc7H2kNRq/uMq7F
	HWuEomJnRFsRFY1vyuKMjKkaa8+JXsmJf1xm/IKvrH4+OnmsBm1Nnh08
X-Gm-Gg: AfdE7cll1hLqo/znkFWyB1I44fIS6cDPveGzJF/+SiA3wK37XOUZX86avRRIERQZ9YR
	MG2IC4lxmd9nmrRYFdRiZx3X+jzyZlaRVH1gGUo+ohogghgxS76SL6FnGykppmwDGfNH282OScd
	LqApY76EZvtzsis4h+fKVRzxVN+PaBTYylZcARSKWrl1pfx7/3pDd7aD9Lr+5QIfeIZAQj9ADpn
	nyVQhz59AAu8zsjudw92KM4rwUxu7hJ9l+gfAjd5HKKBtGY25MZobfySEVBE2bJ9mfmlC5mjCGb
	4mMhi5uM5pRm7uYjx0RMMJf6VMIXE3LiYLwNXCE7RPvqnubR26tYNh7mUJ/uAOrkEePoE2iVZWU
	gEx+vCZGNXPovPMbqejKPbj1ZzHR7fNi41AfOoThI/7XKzBl5PsprZYkWQJOIYWIWWGDErE31g4
	mWWywD4a/dc66M/aVv8igAmO3b34Tpmu4g5WqQueubblVfEWQPOFP8cLpuM8gESHn3RLdoBkMS0
	tqdz9k6
X-Received: by 2002:a05:600c:3b05:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-4954a508804mr12738645e9.34.1784271325219;
        Thu, 16 Jul 2026 23:55:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
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
Subject: [PATCH net-next v9 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 17 Jul 2026 08:54:09 +0200
Message-ID: <20260717065448.1498335-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235527_105484_F53F4BA1 
X-CRM114-Status: GOOD (  14.92  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1d83b31874fb..e36a6647d7e8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1037,6 +1037,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1738,6 +1744,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..ecf4c384fd31 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_up() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.53.0


