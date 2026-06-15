Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F204CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=; b=cUYHvttK21e4NQZByrtLqY3pNv
	D/Se26B4J+SpThm6PFZQqknXcXxFwRGIGE5CiBO91671FmYrVh8u8m4Hpg0lgnmxWij0KP4T/1haj
	xfz0Lkou++cdbO+/KykOcpX5RnTVTnDBGk/bhU9jefTUK675xjc+Zo9eshJtBQOe3/olbHMUL5crs
	gqR8dW1jlnjSZve/SvgHs6vUqAin9eUmhvq7PsSHqVjVCMIdKvGNJ/Rv36m4AqrsoT0Pwj5Q3ZEnG
	BZkUdJp0VGneVbPJDks/X+2Xqngpq0r0CrxsMeZGm+r41ktF/X0ZWUgcoDMLJ99EEFzIUnJO2wNMX
	g22UnqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T6-0000000EBpX-32XH;
	Mon, 15 Jun 2026 12:31:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6So-0000000EBVF-3P8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49222b6e871so18960965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526649; x=1782131449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=r7xHCa9bQufmFBR5UFODKSdmwZzNw8WirLxrw2hPNkmHcCeSo39Ct6uFef1FExb3Dl
         U7S6zQZIwVX8n8kKoo6joHM8CLKa2Ou3tIpgfyMubnGZGJOhDTIf4Vm4Oa4U53qYNvrZ
         Q7VOWYeWeXkfQBc5EoV9LlO4u02ru2jjc5WHzkZxJGZUuhUHHbHZ9rN7BfWOIzsMpojt
         +ItPTucZyInhs7PGvI4SORwhBP0Ii4Rz3IDRBPEPUsGJZ14Nlx/14DVenvABsJaqSKro
         cEupeogHqorWyA7NkNHhDR95YTL7hrzcaTBD9zXTUCKGWM1zkS4BTMB47aas+L/tYEL1
         h2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526649; x=1782131449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=TUqaj+vJWULjBQm4klAgqM9ugwXwdSiOck/I3oVWRDsK9uK4jH5/4x6ZclwPmgPgLz
         HdrCTdvLS9kF6DVbnpCTXvcz+VcyaksSlDl6HIjcXfxmEDs2iPwvn8uukc+WF6+8MYnu
         jWZIH7OuH3k8ggjxZ5yfS71a309NV8Al3GimG2XNx9mquRsfUIGnSk9V4ME5ZBfMWo9/
         Pvl8CH/R9OpMnd6K9fQzX0xhWV74HleeIZL87gR4hYYgqRF7ALpXnQn0DefTcsEmY0uf
         QKq8CFyupsDhe6Et7nJJsw0YrGhFtC2CM+lJI/6fSKe/Jmq5sQfCi8EPSQ0O/asQbppx
         dLXw==
X-Forwarded-Encrypted: i=1; AFNElJ+U+3MEsJsVSAGggazDgQb1KGaPOiu9Li6JfCLZqnrIASWVTB0WyAt7gaQ1Rb2jq7Sfz8aQzcE0+5UxsHaMg781@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo9It3rDxqLm6YJjPl3pQffPYEZOGBWixGc805HTD850DJUdCl
	+1SsJrcFojbtfRr2hLbFjLhp1tgclUsMdVU+90GjgSqH1uott/vxA8GK
X-Gm-Gg: Acq92OEPXygqAhB77oSnxzQVHtIxunQ+gbjAJ2TY4OklijJYFK/h+R7EAV4XhzN18C/
	I+SWvosMftg2YJ6uw6/U1hEHYOQ+JEMRb7GaPpJFsg69tFboCzahD4P9DlMlJftRG4pjx5RHBzG
	clLHqISYnfXBMvcd0NOpC3zjL43QWYAS0yXdID3HBpMfPhAnv7X/1X1v0GVgbYouXC/UxMfyo4D
	7i9wsfP2aDVpQ8PwlbTek/MA/HO/NBDyw2SGOaKgGq1QY7fpxXwfcf9SrJOi2MoRbiLj/YzSVF8
	X183xI6oZ5qkg37bchyL7YYv6ex/7WubvtZK+OALdyDjuxR9JJddzirWny/CLvvPBWKB+g0tc8U
	HXceJmX+cHWaqRPHGxYZawVPw0tY45H6VBAqBNpn56i15spDX7ewUIXLmJl9iLouzWCA4+DJEAz
	g/x35azvebxocNM0J3V8Mldtl2Y+RuDozlUJ7HUxc6P2poEuWh3aiLoKYwWJWl+uYk2w==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr195103365e9.8.1781526648835;
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
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
Subject: [PATCH net-next v7 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Mon, 15 Jun 2026 14:29:44 +0200
Message-ID: <20260615122950.22281-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053050_887881_4F744E80 
X-CRM114-Status: GOOD (  12.39  )
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0


