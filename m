Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6D6C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=; b=I7wTdvMpoSF8gHHMtVArfssQVw
	3n2vt3qn9PNzwL++UY3lJYxIHEN+g/XlvNUl88gtLcirev6n5fvzQoGeQIksnzWLSznJAsBPFFQlk
	A12ciL/Nb1M7ISnOPXSJO6b8fZbhfMdnj0oRRcyUpsHFC8CQvQ7VmGn+6lgFFNAkAUKSqtSzg9R5o
	no+MYGnS9gEYDpaxOY9blriv1mevhQ3divk1ujSdquV1s041+HeSaVZrEQ0pZVLQZT0nLknbyVAr2
	AR49yZfHs7D8qnAug1jfWV001n8erZmivXb3ZVbUb1wWsF0Kd0RbbpNDlvsUEOMfQ93nCQa8VZHNV
	CcRlNZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOF-000000085lw-3XOv;
	Fri, 07 Aug 2026 13:13:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKO2-000000085XM-0pB5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso17242455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108400; x=1786713200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=NPsBLWU9O34GztfFssawbq+T+zHv8j03LTN/vtanU5H3eOLy+V4GLPF8JDvAnDNOBE
         HE4nA8qo2aBv1tKLi1orQtRhiAFoDcIXjiR93XeYPfeGxQmkKopAx0tB/jwh2A66C/t9
         myRuC4PdJViHY6pTaow5f1Wx/3nvET9E53aQE10yqIys9gkgO0QBsZsQGCdQ8V/fFG/N
         YCk7Jjn+8ui0X3sV3/4cArSUgL1yP/CF2yR9+Dgl82sEg0YFXV1hOkqsp9YEleHXI7Uq
         g0mb9U8gKibTNDlIF1zO2Yjnw/yyV0s+5MJPf1CTycKsGxJKcDmYKg2xiEyEhxowEwTv
         QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108400; x=1786713200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=pVf+DsS038GxTLMoChQCp+DeIPsXDhoxAvTBUJCnOlDGtqplivL25cQlFAUnyQPdr6
         XR9UPmHwXnC+9BE1d4AC4BohbeJ1o4Arza2F+z6Wf/7fXTVYW+hUw26dECq43tfMg4ZR
         4ReZC8wM/GzlBxoEo0rDXmc6RGvFuQwYe7Vt+m6WjOYj3CMLoF5z0Q+vuEGy8WPnDI4y
         xOF7OSCgjSicQx4ibgabDkSsys9p0nfTSq7lK1XFwq6o+YFXT/W9Cce6NlWSL3mpwExE
         id1qQyLMUYKCl1C3ipKfBONAwAuMupWI6MY9Mojbnn8UvXXtlGWCoRjUyo6Byb0V/jnz
         xUHA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+q4Fes3qE4dcjLPv3jXfWZ12Wpsg+9yAe4n/VTjRGkbO+1oUipCFg8O4yS83yiix/P04FnearNmZq0Hh+j0yz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn0ihk0AXAW3OH1d4A9yRCpdQS3fF/6QzSdL3Fwlr329ZTEy8T
	uqCf6wVnCA4nQuceOIqXzZ4K3Lo4+EfM708tGvAFqxnWtyJOpfE4SFy4
X-Gm-Gg: AR+sD10TdttNjrMN/NdVV+D5ExCcqOT8wCWahGb602PxtDWX3uz2LYV42zwzVfp7U+v
	gyfhVwNGcDMPXYJ7lQzsR0ZeuFmVTVpRjwaTazX7I4uGnYDYtJwkCwr2rHXnZiPcG9aJbIWUOKm
	aEkeA7u8sDWYNuyzx3yph5uXEtFGJjFdAvGAYi1vgw1H42YQMHLrnLayk7vAtZTsoZGu+ksuCaW
	o5sgme6z+0m3TKcC8R25mnbapQmE2h7JIS4a0XLFyz4Qp50+txesPcvMqWZDDsqMhsU1cW4gIak
	9CRgO4wIy0ID/Emq3ix9a2YFMF2UuE2pPY/5tMXiDotBoNCONbdSoNFECqgKxxpw2ApHEXNkpJA
	L9503q7XbLQ6ioFA3NENris9Ld/qp+vdSm9ZPgKxzzu7RwIMr4yGTgp82xs7/leZz2qCyjG3OVu
	TTsJx3OeHwBCYB5smoytGNv2KGmqI1/D5stTNWSNqnC4r66lsWOqnaG6bN9p6DQQo0gwCT6HVMM
	1rPN5bqx0DsxmqCKLYXymJZ9RU1IGa5YEhxno38N3fNKDQR292tGw==
X-Received: by 2002:a05:600c:4691:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4994e72823emr265837225e9.1.1786108400466;
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
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
Subject: [PATCH net-next v11 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  7 Aug 2026 15:12:46 +0200
Message-ID: <20260807131301.192060-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061322_324794_B9EB08D4 
X-CRM114-Status: GOOD (  14.86  )
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
 drivers/net/phy/phylink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9decd7333c70..041405ce6bf0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	const struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1988,6 +1989,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
-- 
2.53.0


