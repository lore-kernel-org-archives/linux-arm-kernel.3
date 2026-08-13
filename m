Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C03C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=; b=xnt59k9VycEnyPYFwb+XQ6F6Kr
	0VhnpYILp3KvHGdTbbxzEI4KMN4sSmp4lyp2BOV5hdh3LqcBb9fHYVIvA7ImMbzLV8cPNRhFsyNQK
	FQQ7FqC0t3cd00idOzg69wIJq3PocBkNr3rHj7dAj4bDM+DpDdKL5itziix1n9jzCfyvYgxoFk/VR
	okzY2jUdYWYqGdFkicLlowmWV6lzoaQZPR1nIazG67Btiaguse13s4ZtX5C2ckJeo+lRC7QDBEpnf
	lJ8dWgoHidpRe94vsCJ9EOGlMGaEpMZIf9r6UIth2A83FhwyDJUBbZe11WjtdgLnNvdQ549ZmUU7C
	hLWlD13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv2-000000009gL-2Yyn;
	Thu, 13 Aug 2026 08:36:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQut-000000009UT-15Yi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2934825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610158; x=1787214958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=TZR4LHxiVnPI7WZqPKyMdETEHRpcJxY4egeAj3OM7I1kaEfaV2ZJEWKCbMTVS3ajjt
         7rXJZTrP07hBkUauH7t6Z1YgL/y1qDjF3OiwYMejl9Daj0oMvpB+CNs+hkXquNKtX3Vw
         7fKyIIoA/tGQUbtFxiDkDYUO70gAFuvw6w+qUcNSVDvxED0IcRXcxrQVaENDIGqwEmU8
         MxrshtMx2Kl03YBd6ntrUZOStY6nZQv2pFfNIRLLEEk9ikuR1MOiUxQ1N7w6kTsvokyX
         4RIDnx6mzomdlzYoz1PIKVkgAUmJX8d2CL4XKnFg64EySl/laYZhPmqdvmEsVXbYgn3+
         JGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610158; x=1787214958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=Jw+s8oN41YAPEw34sKg6pIkBcbC/RmEWfeZbXxPHs0rNshJTqYJLYgGTyWmsnkLneE
         5gHGC3A+J5DCShjOMsVHSaE4Lwt7WxaSP0kFjkgfBXHAnieAXVCcbDFYIrkUxdaUUUkP
         /7ZsQ27ffIBkjr6X68i17I1yqjtYJd+hhQBWLDlaq7j4vhaVhKclYMvRJCwAeJTveqF6
         5dog08F+kzF+XU9DEiZsXmtx+0MNNVZJ6bkP2DpYK1heCxoDIX1jgbsgPjAHnQFlt5WB
         LzR7HTDiJbj0hkIA016sVS5TdqYRP6jolq39myOdIzVe3eDEsOP/2zUyavzp9Y8VNX2o
         7gbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLj23wNt0zNEF6Mx4zBktz1E0WEkD/201N1jRUpbseCh5/HqByJgQv9QYeJYEHkjeKXjamlBrmLC83Di1oFJmd@lists.infradead.org
X-Gm-Message-State: AOJu0YwGqiAXVdbyzfsPtHSlvmVkYck9MOLq5jhtBPHb4Qv0AD1g/5m7
	WDNdLGl8BhPygjUSprDt6RlR06wxC/PPV04su+Qntw1xJdJp7+oanpFu
X-Gm-Gg: AR+sD13Zsf3I+/Af6oYuwCDdstWyFKg5rYVpnT0C/xFV2R97U3lZkheFRp82k3yQz51
	YHxgvvbKKI+gXovF7R83hPIRUNF72P1QfsQwgn3gPihNYwWd8ZIa6BMZ0vOqa7KrduPVJSJDjw/
	lSLXSJCnckyrZZz8K3dKFYsV5YbcVdg4tWC+DGKcI75T/xq25SkdwmUZAT4Osd25bZuVhiWmfvn
	Wohve+DXTeuI17Mbyz3kPHDD85BOAi5zNT6gfMipl7VB5j1X5Ib7Rv2WVHxUG+1aZ+Fzs9DA9pg
	AHysHB/eAeBuH0pS5M3J/hvpKgddc/1tonxsGhRTjuDjQ570i55nfJCMC7AUkTOgJKqxidENIAo
	yGFhpZOQD0ZvluI8KU/6KdFURJYWlUqBkK4UV/kfVeurh3chTTNEaiFwG1yuOUZ36x9vhkVPE+g
	WmZAgTAvjmwI85i5ra1SefGMJ5Gy6jFpjepGvRQURXw2en5MK+lXEMyq1Ly8MOVdn2YvmOm4FrD
	aVhtG0+zlDOnEH4R7Fe7hBuagqIqwe8qRf6DeP3oSJTrELU
X-Received: by 2002:a05:600c:3553:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499821d1379mr41303605e9.8.1786610157531;
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
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
Subject: [PATCH v14 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 13 Aug 2026 10:35:09 +0200
Message-ID: <20260813083536.970196-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013559_337014_B58BA863 
X-CRM114-Status: GOOD (  15.15  )
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
index 6204e3bba16d..82eae20daed0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0


