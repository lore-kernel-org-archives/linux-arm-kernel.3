Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBF6C982D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=; b=WZ8P3H5+1FlVDk2OSv2vrUiCTE
	o/erV6adYZbyLPbR/bv1eta0D6DVo2NJPFSj5mrxzMVaiFG9VMQdjsOElMFaeA7wqm3hsWPD/Eg3K
	7MQt2yCF2anTqyT2sUFumoOqSfPMDlAhMkmdacOT2oIHIpK+ojHGohGHH0NBWl8GH6GJ2PDYcYKSF
	L88pBh7AGdjf3jipp8O+jvATtgbp0BrO4JFwOSCGumyZ50+5jf00EE+0CzHFy7yQtcrwaD7k4ltKr
	5XZn+u+MtBHnSlFOuLO46Ru4SZ9wfmnte8Bf0qtrrrOYwW75GFlhRTdBNYY8G0VK9bwz0MTvj6w8N
	Ow/Z/FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQW-0000000AGTN-0mp7;
	Wed, 16 Sep 2026 23:52:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQO-0000000AGLU-1HNm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:25 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso146512f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602743; x=1790207543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=DJu359wknUdGOQTldlTxn74J8tBNRX2Qr4PwQOVsQ3C73a8tepDM0W4MGK+GQgpLUX
         bMDrPh2b4uNe8qMLzvfG/w/JOo05RCDSv2eZkDFFEJuCmMQ3sCLwuVhUrceHDBA8csr3
         GUgvauu5p1cvwXfcxaS6rUeWntTV3SYDohob/IMmqgn/WWoyDa/weH6nDUByFjyq5//r
         FdYm5myQrzY5L4NExbwunYjlZc40AaN+BirzAniSOpcFUU792d10ZMkCDhWLpisBjt0f
         ioX4lVHNRZwN5qptECIqZNN3mbrijnJBFYKR7PI4/oB434Ks9tqfwGdWnm2uQ9RTsv4K
         jKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602743; x=1790207543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=d7uyI/0nNhsIXqrZ3x9I0cFLQmxmoUYSS12h7j/K0mG8y9ECrzYpYcqJaiuZdjK2aS
         SsbSKiEvy9ZhlvM2WeY5Kkt9qDaeiktCq52YfgKEG4nf1afWyt9XonfBLuOPI0WntRVo
         c9ae31vevOocUaXJsYLXRjcGVmwu/02uazn8EP7XovoKIDsCV2Q7D1Ysz9tySBXDE5MN
         HkSfvPT6S+zdUpbEy4jVT+u8seSsFPYdLVc21DPJmQd+ESok5G9imW4F90lCKm5fJ9UV
         VtvZshrYNBzjNjFYEMSFAowMuUozXVagl1YfUc45Dt/V6SUSIkT7eKN7Y0DNcePC2OCg
         MUyg==
X-Forwarded-Encrypted: i=1; AKwUvBxDZBNgGuwor2XtNGTNuwV6wg9m56+oIEixXMyPKLCJTdZIof6v4i6iGpXdR6VuTvZh9kv3ILfJ4GJ33GHevlOx@lists.infradead.org
X-Gm-Message-State: AFuF++n/SDd57+HFabej1PGGqLLA61kHVqcjmgdFE7jBThwHP/9XSnWX
	9aRzXJdFoelKXz4MFpBD7p+lbWVbD7vkiCh5Zy3b5s5UfKcQ3DhEru/Y
X-Gm-Gg: AYBFou15NV/7z4xk2+dXB63DcARytAAJHy/CCv+FhnUshOfRDzgshQpzmC/96+2yfC/
	LMQ02cPTbx4CdCllecJ37H/I0b5ah+aggSrrFeRHWAqGZrECG+j1r5FQVhvAafXG2v3ZF2E9KjX
	QqkoTpI56sUlYRhK9rnYO4HNxvPQCprImtfVAtesqSiWT/ujgtwoMOvg5zGsljGberOpid8Fu6A
	dKRGyJEMeKkpBYkNru8sCLKq8/C/mVkO5EYz7D0PpmeUqfecRz/m0p5W//16L6mJJu9zWig8PuF
	YMOK01urL/kAhwUlBcGjmzcIDpBqB8UYIaXvWDA+mMSiSHEpyuFic0h0oM560euu9qJF9i34JNw
	v2ONKY6axz7yOrPWutwHO6HP+4fY5mR7uEtTsGHV2nQJ2OwqvE44EjiOC2IVJHJ9IFtXNWxUanb
	Fo/T34hlW3yKWMqHck64/umx1F4c7GupPn8pfsIY65XInl6PjeHaO9VCpLCK7V4ZWKWMwd8kYrR
	YjEfpcR3lLJgoYTJmSFVa6BFTU/AJN0+KELsDdnhktepqvT2/PcIZAthLyLb0g=
X-Received: by 2002:a05:6000:2304:b0:487:84:96d7 with SMTP id ffacd0b85a97d-4870d2718ecmr5744113f8f.53.1789602742429;
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
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
Subject: [PATCH net-next v16 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 17 Sep 2026 01:51:30 +0200
Message-ID: <20260916235200.20712-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165224_366281_5822E89B 
X-CRM114-Status: GOOD (  15.01  )
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 417d2f1e54b7..473d15789128 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


