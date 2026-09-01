Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FECBC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=; b=I+eUw5yN9MndCnqcMBY3jPfc89
	usg5la/Rq3n8esoyWcep3mwrkCvLwqU7IHRxa0y2p1gAKKZZa+xIqxOf/gvvEDm5rCZGgIf0C98Fi
	UvNtP245Pb1gbGfORHymbAGSV/2uvauU4yDDhaMmgGZYgizWtG7MDCkQcgwxfIBtLbDNDG3MaejX/
	ZG9eew5hRGkR4Qc4VVFN7EQDss27vmiOzC7tkE8Msc6LfTron8NIy919jXTK6KjPJwrRbnjwUoExF
	F7gyBRsU8P67hObiNbbip1X3lK8+OXabJSU9NaPbewiJwLlF+k9Lb0Qd1ldwrypFNVQuxl5jHiBmU
	StoC2CRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jsz-0000000BGhv-2O4P;
	Tue, 01 Sep 2026 08:30:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jsv-0000000BGcT-2abT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4956869750eso29962755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251424; x=1788856224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=YuEUtHc7fOHe9uLBYWzmQrv4n4j2us7ib+znY1nWbbszfOPqftATNkk0JBmCwPY4uT
         IS9lEOjJ7zBibSN+DITVHYG0N9Ay1q4O54Bxc82QP0VAwV/+VtHdnupeYZL1YNAhMnTp
         oEJ3ODh302SMTxXtrFyuIGu2mY21q2Eks8mwaPV6YH31qL6Az6qW199lQ713kK38u6On
         vExzdhaxkNaY5BFYG221zdHNKWBtKZufL8gz4A9qQQRpp3KHAxWXN3gpwDiJHEX+1m7v
         dqiYEQl3TwuoRKLwyL+SzvX1Pb9CqJ+TsOkI/kDXWEge+ibBW8iXlMROPCj/1Yh5Wiyl
         3OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251424; x=1788856224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=EvPyY3JuRUrL+7Bfa+0QEnXfOW07MM/4n41cuKSaeLDG74rhrFbuNlRetPscrVWQw8
         aELtzWdKOTvuYxxkI78a7CzAUKLWwcrj/0GKg3wNKsPgbrOjl2VFz+kkcxjsVqFff/0W
         zQ9/0YfvWa8t6RJ/gow7f96N4Z7zGgOy/3H1NS9RDrmzlJMuCgGGNfTwTcOXegAIOfQi
         jdNjiIHnHekxofTXMWug+gx8WisuyWtI4GTnjsfSXDSgHvpuH6SIg58J0He8O9cm+U9A
         xhlsTcPS8tfEqFyNLu4/rNIA2KjBltSewmobn7D+6qOj40O7NzcwmVb2b04N0UUYAIfY
         MVgw==
X-Forwarded-Encrypted: i=1; AHgh+RpDC9CX0KRGdH+nLTdd1q2QcBsUsLlXvtBbddypPtisrvB/r4lDhFFvNrWd7fSiOC3UO4GqtbYX20yLdYr8Jd7P@lists.infradead.org
X-Gm-Message-State: AFuF++l+EUxp7DTzG/JRhKb2PgE43CwVtdkjFUC1juIPdMRsmhoXF2pi
	EVfbw3PQF5qe6H6QNi7OY4TT8gyoKY5TzC7olRgEFyjvjH0U0svnsR1d
X-Gm-Gg: AR+sD115aqrIHRKasoHyRokG7S8FCkp1VdyYiRDykXWxwhF6hQFx46RBHGZAuVJnRjU
	F+SzT8kMVzjeFxtGYz59tGnoKLoV4/DjUcOM8iOWd38AkB+WCmBdXlhV5TYQQmDqC+p7p6dp52s
	xUlao7cFCENqLiTcxFgoP0aZE9AaUnFJNu2rdA8mckmhEsgVk+8iPOM1kDipaBfyKkZPgxg6bCU
	phQo5uApUlP0bUG4RrsKKAHsX6ONp/1AI4GHb+m7R+6AuitAC5QET35jonKx2fiY+BACvZvNzAg
	kSNmu777/Kmh/9gf+HgE5DETY+2jb5B21MX+Uo5hnli21rd210wy+Nfp+VpM96mZ7/aaRnMvlV3
	sou8wGN4mpeAO/Q99EqJZbkkdb+/njIqx6yhKmXaXjEZOfsYxJml16BK6hnjvWO3pOHc7UWPxqM
	AhCX1fwe1bgb+8ehbNvul38/7yc2+TqmEPSG+/gtzq/rqnpse0OMv2tjfdAcUQ95Q+B+w71U37Q
	T8zIABuQTtTi6OG+fs3eOzyuPbv9NeOKbhNvb1s++vGiI/0hlCq
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr438008405e9.12.1788251423887;
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
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
Subject: [PATCH net-next v15 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue,  1 Sep 2026 10:29:19 +0200
Message-ID: <20260901083001.8044-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013025_667789_BAD616D2 
X-CRM114-Status: GOOD (  16.26  )
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
index d7391a60f01f..96f72eb5a6fa 100644
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


