Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C33C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=; b=Tx+68fvJAeMEN+6uzoazvItXoe
	kvjIcyE7Ysikx88iPNJg0uEiQlOJE0+q8UJoQPUPnZ51Bye0uwWcc8OsYEmMfW4PnzL4mq6znRNPV
	s2H7j20RFY+CHXibx7FDQoUaFYRrMZlSpfpKeyrJ3NTD1j0G2BcnnxJc7XFHhMQrofb4Y2gDwZFaR
	jI7B8YLzUCRpWTDPe3qcpAtbjT6s/SoIhiGm6DNiPJGrjfOulDQGumlNA0xREY4F9iBPtwrJLYCtl
	nOnAcdEo3I1EvDw8Aw8T+mwbkgdfqCCKJxboUy2xJgl7cZQXQ6l3Sh6psjGySqGRNFb+y25xjGEJ3
	Hc31ik5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinR-0000000DjLu-1TAf;
	Tue, 11 Aug 2026 09:29:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinF-0000000Dj97-3ogR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4902705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440548; x=1787045348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=dXXgRPdgbWoOP03BellrIJ8LJCpPGRtzuK/WRtOMOovfCHyfPkKRa7j5hFIy6iBLmX
         1cGGZ+46nYJgOcM5XEGwmEx/+8iYNo44VSYO4WT00j7/p1kk5SNPiwzzjabzVmGA48EF
         p0DWwjjM3eI8T7lC8aigQfctjozJooiz+5Yj+2GRppsjC4BVLsi9H55e+/Jd5auw8/tK
         uJ7/mvflC0yJKxtuAYxsUxywobc7FY0l6jF31HqU+2uOM7JwCzTRLuHDDKYW0xZFE5ic
         /ECWVUP5dGOa7mFTKqiZGgZpiB6DB1M5Ov8WMlrQqjSr7l0y/wU3p3WmonAjfohgch1p
         S+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440548; x=1787045348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=n/s5JkrN51pyZtrp4B9oeqnoe9jokd5DqEWYN4CIW1/adxrT3UHAtCepMgttNuytJR
         MKH6PaeNaBHRzV1aWUGF9hU8lEFZBxGuV+b7WwnmaJI1Nd2Eo9RmUp5Z2aOJDvm86j8U
         opWktRKc9ZnOY2wGJAtmScUguJwMN9hCtSbJ0GI24644AAhJ8g0yPVknJ+6mq++2R5+T
         QkUl2LAdD2XPVpgecy2nyRLDtpizcYgsT4py2/B6ennDzCXOCkW9g5bIyi2KBuVbow8S
         YntsAe+M3xoSSIj98SJYM8I/9YZjDRChnTBJKNu6BRtzIeRhjCuxZl8UHF4LhV2EFtJ6
         NjXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0wB28Pe1FMwYc+pbBoKyt01Y+afeBWZYQALIJEjaOkveb5Dfh7a7npRlqwqyR9X1QV1dO8P0ON5CvPrjTCPmN@lists.infradead.org
X-Gm-Message-State: AOJu0YwbBiuRDJ0aE9/qpthKIiWco9aUGQMMtWuCB5X/53Nx6b5WygGZ
	9LkrErKWW6vtDTMNG4YuRa1wEy7hPZpARzEkKy2tSrz8cwHEVpwbzdHC
X-Gm-Gg: AR+sD12gj91NyPzNZIbNGXQeLNMqs8wPYgKSInKBWNs2ml8JI8rbe8f2AS9Sa1EttL9
	t5m+zkQfZRhZ2wbfIPunz1t/M2nOnBMc4wHZtdP1lo6UnF8Aqv0YBDuv32qAMKyS8l3KiD385EH
	X4H3+CZYFaU0nWbBLcFSJGIKCXfEwIcCMeCWwTqwDIQdHfJAt+m76X9IDs5KMu1Ennl7qdGixZh
	YzsU2tgTpis04QDOB3Tl9L6DZ/IBy3NFYOGzElXz6wWXpB8LtIsmMFUbMIGbOcWPwxSLEQqZ71p
	i/ffkxH0NBas0iDbJ5BXHWmH8cJX3yTd2n4qeI0oa1XTnLyEmWGgeBHsHRkRt9/2GV7FwOHIFXl
	PP0yBQqnup7lAX25lOVKuujmyenH+7O1P7McnMvkoDHgVCNQXJFSErSSBW4uhsBQUNePzFA/KCT
	4q5sef0q0iA8wfsrenbRqZdognGumJnmbDH0ksPjOHeJfk/zCoLXReOprvnqzgVz17qNNO7wqLG
	hIb5qWoD6Cs8CEKZbG2pw0NR4gc22+IbfeHJqHVLss4Y5oYAQ==
X-Received: by 2002:a05:600c:4695:b0:499:726a:117c with SMTP id 5b1f17b1804b1-49978494f70mr24088285e9.19.1786440547839;
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
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
Subject: [PATCH net-next v13 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 11 Aug 2026 11:28:29 +0200
Message-ID: <20260811092843.673837-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_022910_069013_4151D83E 
X-CRM114-Status: GOOD (  15.31  )
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
index b69050f22717..b9a5cd123775 100644
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


