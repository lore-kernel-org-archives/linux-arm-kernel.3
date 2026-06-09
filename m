Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493A5CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=; b=4KHwaOEGnTcR+3632py/Vv7BfN
	BNLueUD/nD9mQxZNpwt/Ise46rjEqUCUjs/eIdGs8BJa7a5bwhpGL9uIwDdMEjj0wfNNX43asrrj5
	RWh1dUG3WuEhpJXexbTf8DIHeKQr3TYUl+WPwCZuewX8HEYFMpPc8VSIsj3P7S1/Z5MXRDGEVowJb
	BV+CZ+mAnMnnrLaWRdaX/AtzTnDO2j3ivQRF8P84oDN1rXZlG23sZyaqZfobu7Xu5IovuLEZOrcvQ
	KKrVfZYYvRZIIuY/W9Yj8lBJ2VFescIP4V73KiJ+sQ2qadJPxfFeRWJc432/2k5hkSspTUCDReEZd
	3dQ0NLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8j-00000005sH5-3v29;
	Tue, 09 Jun 2026 15:13:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8h-00000005sCa-1Tdu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 15:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=; b=UR1ic7/7xHwYEz8eJZ6jgulIS6
	4jE79uk2qSrfmQBaVPDYxbox8cEZ/Y9FbEMJQ6g0/69U071Ht4C7shnhFeNn+vEMRHETkluspL6Ru
	2cTpLTPX/FCJxp4yMESTBspvKpbq8ZEzwUQW1o6uMt7kNzlAdNBJDJMy8wGeXGcty09DTohu8hSTr
	SvcPabWAKPDkS5tZUcYYJnQ1Y140Wq6VFcav4XZC7i06P88YOPaz0w7xCf8J9GhIkhzZ+cneiLQNm
	vC9pxvUMoCxwfJP1I+AX8oBpGAWzyjToh0GwNbrjEApOXY8VUPBqOFlB5Maqsvs+N+tWmKq448Zme
	E+8OPMjQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWy8e-00000002i0k-2WuS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so8161257a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017990; x=1781622790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=OAg4kfz9TlBVFI7Is5peiVzjSkwq9b7w4T4q5Z4W/bmLEF7MVwjy230eKps7wuhp9M
         kayUIYUe66zNQyqpBXHcQvcMPPZT4+FWdJZ/CZlOnJKKpzeoFkgYxMXJxuoZK3pln26/
         c/BnE6HR44xWhb9/uxY0R8hOY4OYiqN0FAdpfmLQYAnB7B88s/AbmI1u9bteeWBfnxuM
         ix/Xmx7QO/krFrlGno6CnH4APvB0G+FIGllDM/GzjgpdlKMtW4TBOpRIDRxrzbXrkFXz
         rR3OS/xXiQ22bSSdOnmxwBLsGrlSI2QmbnW8n3G7/xng/iZz0/8sA+TbJDLOqZS26xAL
         LD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017990; x=1781622790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=diFdj8P39m8p7aT3kkC1TdghCW6oQ2fSgvaUKifHLHEN9gMF8UbY3RFlak+zrPw5Tk
         4gbkAygb3oN5w9J8naJb+A8HbGqYNKIrVeh38S+b3zaBm1BFbrUmFnDnDb6L3yv+bBvI
         8+f8QN/zJzK7Kc8duBJZPPMU4cubyVxkRFoterDFTGvNWEk+qTI7FUHg2+AcZ9VnZDTs
         JkG2pI5eg5GSUKxaSuHrWixs8/y35QxZRB+RCr3OgyS1fakpKVoJy+vCIFtLmHto292b
         wXxUR3CC3DAryPmf0ycmyw69YXaFC+SQRxTNM4Y+jPntPMyS5wY1DBvOME9daqwQgc34
         mEKg==
X-Forwarded-Encrypted: i=1; AFNElJ+yDkw3n73JNuFwYY12xR2a+GBVzHPVZpzJmoD//uf0mo0r+CzQ4Feb7SSJu/qKjy7SixjUFTCz1+ab51tQv5S+@lists.infradead.org
X-Gm-Message-State: AOJu0YySO1tY9CnCVIqUQ4KlRP9JT+1TfomAFx4Qh7zdg99+saI1eITm
	KKgQqdCfyRMFLDZjLyujREyvtIOKBoj90qm3FVZs0Cg4oij+xx0qIvgB
X-Gm-Gg: Acq92OHm59EQPma59TyEWN+Z4pqXirWap/Ube3FrJ8CbSaJob8OwrOhF7+UCNQso5MP
	w8QOsuCBnA1N7UrNPJx65ytmQoVVjMLWdzsT37zvKcl+Y0YzgJoX7RHcD25eHH1Fri6f40iGZsZ
	XngYitIRXBcbXewIBfrIPz/miXGsPv0W40iadZvCv/UBtpslrq0y+Tp2M6kbh3gp048ct9icfHm
	sej0+3EOIN1au5neA1o9/VVRiCn7F2xnLNiUMbZ29KolmI9UKzI65Mxr8ns2G9nOT4ewWi1bvLD
	bJdhMnH7F/9nFMjB+xPLoatWciZ8Ms/CxNo1QhEjUHTgna09oxiLDDCsgwZEbpAkibgU7oreNwE
	BoyCsMGWFhdPYJFqKv0k8mNPxAg1QZ5PjLc4NKMq9BPM7sGeMWxJEixVNRr4f9Tq9uMQ0Y6rWB6
	uj1CKiod/waB1wlrqQyxowjaRLkXgxhsia
X-Received: by 2002:a17:907:989:b0:bed:25a6:1c89 with SMTP id a640c23a62f3a-bf373407e0amr1077762866b.25.1781017990067;
        Tue, 09 Jun 2026 08:13:10 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:09 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Tue,  9 Jun 2026 17:11:59 +0200
Message-ID: <20260609151212.29469-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_161312_782410_CE2048B9 
X-CRM114-Status: GOOD (  21.64  )
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
index 4d6ffda0cdd6..b45bee927300 100644
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
index 3387d308c4ad..b65f91c78d8c 100644
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


