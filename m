Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A04ECA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=; b=Lor6/i+RfhBdpKGKAChaz5vVxN
	j2MUHNUlGJxdza8lIAoKXc3QM1um/qHRLYMmhW5rIwdHrRosMCkgce4kJNhwcpynhmgAjsWmhCsy0
	pqMTUMYRb+GMml3MaI5d7ln6swWMV7WP2iuJgB0WSCN8tJsn02nPZQDZ6nSujY38McsHk3RThn4+w
	kYMwat8pqnPZCERDmbk01IL1wL7bprLPfqW+aBhe3zPTCSS9HMB/9vSjuZJLAhAKLcH/vaPKUxpD7
	Oyl2cQMtC0t+DPrFY7UNK9BitEbkbyPeytqbA7lIpradSMDRNqjeAXe6CetHHn0xMsAupqt4IRh+N
	/+rgg6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFL8-00000006xSI-2y3H;
	Fri, 09 Oct 2026 18:29:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFL7-00000006xOY-0VSZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b060ec084so72634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570543; x=1792175343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=l7siCyCHJxxuBVbcC4q3daPlvhP9fgH169Z/jZDv2IHnsA7U6aUB/zdrNHodyB8J0/
         SJox0QWaniIYIdcHUYPhlubpu2RsIghu31DXAbsra3Nehu9LfY3SY6weBMFpLLx1zJAy
         dZj1dTYURlEW9doXc/AT4cQHAcQfCHLmZOFsOCUyBhGWhbt/qFkxUgFMPZ7ZyEf3JPVD
         H4RkkkjAYV+Tvd3IT9EZFxtLaz4Z2FoOyYZxtaH+qNodR/gOhl8MKCY7vJBToRKBfQ/p
         405D6LJky0JPcHdMQe9ELjgEoSsvMspzYbnzkhDUY0yVw/xX3szc04CD3+ayE7xu4hKD
         Vy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570543; x=1792175343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=N+3WARF9UgP9AztVrn4KaFOznJvD2HkfubMRvu4hePX9xzg3mz4p+oocdkkaJJxZkg
         ZOetJWgUsBRo4vLVj1SNAxTZt3Lk5pkYVEt8Qhu7I6RNtyDKLOPJJO5JuVerBQGeIKxh
         s+yQrNkjK5XdlxOldGSWlTF9cTWfrg2+Awktw0h36QIHJ/t0Dpqg1Lqy7WBGWZUh7Eoj
         1C9Md9NfBUAyyeP4C3AdzlEmrn4t/mMPkQHJIRPpw0AF9K9dFGQ6R8uHueC5VkjFAqZ/
         oYq4VUFSf4GfLL3ocnM5y98ZCRus+KpKBkjJrkc4suPamYMsgL1mtl69uW6dUHnBoW54
         Cpyw==
X-Forwarded-Encrypted: i=1; AKwUvBwUpCS8Hd+xVbtBqoCLvtQScwGpNxrQ4RrG9S9U76+CfR+ZASP04GSrQr6P0CnFAjfVHY+3nGh2R0jJ4Iu0R2lX@lists.infradead.org
X-Gm-Message-State: AFq9FYIEMs9cEilGdyMrvXZYcpgt6taxie3FmcssvW4X/bzwhrkkq93m
	vnulw7jjZ3n/6rfOmvjCxv+eVIcY+s7DXIA5hYxvE6sJfIfgQ85RTWpz
X-Gm-Gg: AYBFou2vhRMa/flTiqUgl1BpthFiUmlezSAiqdiMDbEZmDRbAlexhphTWb8avvekibu
	lhVHRs/sf+52RDjRZ/07NQyyyQHZvVeaNC9GfxKJsIY+8fnXRAvApcLJWbsAjloM++0uMgP8yVx
	Ic+4oujO9r559xLugkpBpUrdpbg77MoDNlEp3xH0i2H/SpXNEsf0cdDu96c2xqt8Y8VDszuIJL5
	z4N1ouElY1pRM9R+n7pfj8xaEUjQj5CIudh3XRkM3YTnKxFyw5kSAQTWH+I5HDxqdER3MwwsPdZ
	4BCAqZT3ADzJyRMn/dLY7IC4antyZ6h2OlFntvAm3O7BhcJSb24kM4m0TfAzcR3zeBzEy3xePDv
	//gb1f5yFtnH+BJ5mo/oG0afoB01yCmKo1Hs2qvLbeN6UGAniFU+n0Qrm6empIJRXBDwKw+lR45
	aXBPmFs3K4MGLZsjhMN9jyk+YHY2YZpTmnLs2EDfVit5CIAp2at1AWpVvG8z2rscn+AwWKVsoCa
	S7IOxZns9Lj2MXqWrWd1P/PxeYBdBgDBok9Sy+UUyrLGNEuc+N3R53yJJVbhRJr6PPsu8STEycj
	sWfEIImbPbOQSzs7BA==
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr5330100f8f.34.1791570543097;
        Fri, 09 Oct 2026 11:29:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  9 Oct 2026 20:28:00 +0200
Message-ID: <20261009182836.50631-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112905_208125_2ADBA49C 
X-CRM114-Status: GOOD (  15.12  )
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
index 1156e6c61a08..9441afe372c3 100644
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


