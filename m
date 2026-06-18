Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A73CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=; b=5CR5xh5/D44JCziR5mczUbFVXl
	H2xYuO6MpCKtM10Rew4i85rKIHWCLvxYBf01IAVdpn9AAnoVMC8bzlWzGXjjrD5RFtM7OHdSx8EiI
	jcGTAh9xMZj4n2mq+ml3WwDGhgYFr0C8Uo8QY1yQfEU4JDWxfkDaFvUnOoSq7zIU2x7azmpUel6BA
	+euv2I6tD6PLc+LTY+PTctLJqBnRF0sSQMosLEvT+mrlZ0wUwA0yuLrWYzljyqKTXo21e/nhhbIr6
	Y/N6Zvh6Seso3+SayNiXvIrksTTkuKnKQmEDDs3mnCIbd3fCidylvnE22VOiFGinnW3hqPZ5zsOYH
	nPOVZejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKR-00000001Ilp-2wnu;
	Thu, 18 Jun 2026 12:58:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKD-00000001IPB-0LhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490c1915793so7202865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787507; x=1782392307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=KlMYPea57XKPFq8xkAbBjWxl1VOnPcVL8/Z6kAvWVuAxfUSXnk7MLjKIhlg8XsGHNS
         Id6RYjReYhQauDqFMimYUUo0cWQFxU7avC+NlP2dNHy3pk5YOf2K+uK7oo46OCTiEP6E
         I3T9s5dOq4F5DrmYuY2FxAGTjbLG/TllD0pMFFQNVV0+X13FufTxyTvUviaCau8u+oj2
         C2KRHtxtIZwUKH4dGDS38foX9BE67+L/EJ8X+Kg97HWk923akW10FQQAu+Ah2bOUyv4z
         kn9rw1ZLu6BJ0iFZw9voM5r2cNPeUQUXV3i50Iy/TLB59vJXnC5w/rjILAtjGWlAvgaD
         6qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787507; x=1782392307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=XWAxFyhfbUAXKfmw0HMalFr/0Hnnz1whm7d35dYZvwzmGL0T7wGvTJnID8sD3+SvxF
         OFGOwTolIoTgnQguSqqKcuHA2RoK3ueMWbL4qoGkWE071VyVbVvsBZvsprRJTrCrw0bN
         qAisxYbqNQWb8IIoVS55y+s+oUjT9HSg03EHYPKdo0DglBFvwdcIQYN8MkNfMTMM3iD0
         x2TA+0A/wAIN+OdJNQdWs4hDd/asSShFgAKU7y+4a6L7+dLbHi/6Z1woeif+8Q7fmoUP
         Ar7l+thVW9NwAmewX56vDrrXl9NwvTUGH5guOndmG8AlduGWg3dBXH5hCCrkW9QInhcJ
         hLNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EPMeoDfA1H3qHOoc+OGAkH40ahnJXYs6wP5mmUgzfOCQaFp4jTE3lCQzEd7hwyahova7/mHvoK803Ylynap9I@lists.infradead.org
X-Gm-Message-State: AOJu0YwYzIp0KVvQfhcWMQLAipUU8bHMJ/defrYoXhE1mIzsoBcnhqNJ
	5o0a2DwXfZSJsPC+M/OU0TO+hFK7MQCZP1PwTTtS7tPNI3tOI7s+vqWa
X-Gm-Gg: AfdE7ckhz4GjdKS2on3EkoQWLLw/F+ePC5zUi2TH6l9EXwP9Aluxd/MZza8vXPWNiUW
	PoGWP5weCr/G/uWXKRN7Qp/ktUZTk3YkC2c6y16y3+D1bJEgaCp9kU7fXMW/4qOCdBZ4HN3kjP5
	IsfmlePpvGqrp8Xcoxz4YSH0OQx4UlIz9kUAtjxVE602HA2sHYMTIFDss64WtP59aef8f0VW4Dn
	KRSRxuTauQegOlTBMGZCoNyr3lD58xwZ02MZ5XdimtmeJ+CWZGkEAO8jMzei+ne5d+AkCt5YHBH
	wjtcszUyUoDDBpt9DyQa3cO7M/Xxtp+JqPcN8NOqKbdeD31NNtgGwq41GOLkJBvJYZLhHQ8UrQ7
	cP8YL0XoOoiu3eXWJ+V3Y4v3Vwzf3/MJnJhvtBre+UeLSRqc1oFrLw7kKlegMeSoxuoz7Z8bUTt
	sMm1x/DpXjhghTum9Wfbvf2jeweP3iSwWz3FcXgIlLaZ7/LoaHZ0Q+sBCl8Boqt3i/+Xv+yBRj
X-Received: by 2002:a05:600c:8889:10b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49234139bdfmr97586515e9.28.1781787506895;
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Thu, 18 Jun 2026 14:57:16 +0200
Message-ID: <20260618125752.1223-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055829_142217_3D4868E1 
X-CRM114-Status: GOOD (  12.34  )
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


