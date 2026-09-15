Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E404C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=; b=XywcI8xLayOOFt6zvcOKGklEot
	SW7IEn9FVj+95crp/OhJ8xaxxsCs2/6r59kiycfQU4bTcDuujwPGXt8fsAr1RToBfGb1vpXwhdMEN
	xvoYgOZ4TiIScl/qLTz8oi/VL4WyuKbWqO1y773OGjIo5DyNFUDEDJsxYSggDZz3pgH4UcpQvTJ2J
	iYNsjs/mrfyRthd7S2MEzTqOeaikOETE6F4YuD1QQfC2JQ5fz4u6YLoxyf/iljiWMU/QmSoDPM+pH
	EvC3vsRpTBhvyjiyzTacNUpYASUZnw+KLwB3pcSI46+S3Z7OdDlaRi2hye0oG5mb5UdC3hs3sEeu+
	nd2RRDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRE-00000006XE8-3SP0;
	Tue, 15 Sep 2026 12:39:04 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQp-00000006WjU-3Qis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:42 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1668795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475918; x=1790080718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=Y9P2U4LnWXrEgGzqSZwvnkHtAj+p5KkiIyGrdzkE2c0LisXvVHeuhNl8oMG4lG4fTf
         56BM20Jgm/YGL1ik98XFOdnF4vXW/cblJfBakmroLX7kATNVuERqvMyXkARLbYi9vivM
         b5LfcHxUk8Y7qrbIgitlKqEy6aHVL2VrGszNdSSNe7o1RMYYkd113rrLkgIq5apTYfIM
         d7hv70wiVpE3Yt6hX3khhww3K81/YHBna63NHaUs9Do/WPSTUwypjEV0nUqGcpxdMWgk
         VzRFU7pWOs75HLJS+5v5gGMIbgJM2EgOK3w5ZG1hFXXUVWc1aHX+Or41xg6RvX/nexpQ
         Hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475918; x=1790080718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=uoTBza71ZLTLE82zBJSJnfCmJvM4RKsBS3PtlfJy0UWvIR0gbLBFDxSc/HotuDAFBV
         PD4UTjKO2Kpo+6SpNFT63r5utS5HBLRv+BEBmmeBO+rCSO96kA0fbviH0MOIgqZ+lLdA
         IpK8+Ye7QwR4PlIPhZHVS/ozr69bApU2cJDO4gwTkAuSgD9H2wQQnp+BNoxFWCZ25nIm
         TWeBYK4ZdBCr6/9wGiC31xiDHAw2ynrjEsENVXmZKsbQJpbWak+wcb8+cppBHNlJb+f/
         x6ht+FN5H2jDZSjuyggL1O5yA51xi2AQ1UWp8yRVt6nPIhiB0bAl/TyXLrZulwfALgPm
         e1Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwRfxoSK+423mw6b8tgFBc4JRi9I5S9xdFcJ6LOsygAUsH90rKsuEyZOwBj8USmsspF78QrB17sDQLzb0qhPiQ2@lists.infradead.org
X-Gm-Message-State: AFuF++n0OsZ1o7SmWuYqKZELcKnBtkxFoiFEDhigsE3pE75LgvaQV0P7
	v6vKRSr97vgBBCj3uIU3ljgVw58qKBjM5fjB/bLC2qzR1iXX+X+VmMAi
X-Gm-Gg: AYBFou2OtcU608wmJsU9KgZHcT7iPe5/FCMMSpEHEFN7iT/RzCXibZtZA7ybtqmMrbp
	DmYh2VM3J4j0I9XVd2tsq0GlrBrMSUql2NLz61RUWk/7ViSkT+G0cZd3SI7AW2ENi900HjwdTcp
	fsmfEf6cs3BZbU3HqAuKcXRo3LB5TKOngJSeGVhVdN8DuDq7o8gA3nCFPJg3B49SM+Hy7fUIX2d
	1t9FY3KLay+11TdO+g5xxZKJ+cReQRC6t+ienNRHeNHQBUpR8vgHdg2YxpoGilyotTPoSe4ztzz
	FIbbR1oiYzmzepvukkwDuMXzqWlHodztp7gOiIlwWUUX1EIbrxyaViuP8c+7SN/Zxlc3f9ZKBNr
	nGrm9XWOxw2QZWvCQm4PdQoIpLjWSsHZVIXyCctBsDV5qwGiLMUmhZ4Q/cHkOBY+L5EJsxytzW4
	HMOVH4PKu3H7aKjkwoGF1TkuvDroYXmUwXgkWetV6cR7RsxVYMCsmQArmxmDm478yPL8RcHqbzW
	Xp9S1lEsJXHkN2NUl018OtTNYbRjDSL5FuNruTnl/21ro/JfnaK+lDpO9jK3spwdn38GrTWN78=
X-Received: by 2002:a05:600c:1d01:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e8222c825mr13854845e9.6.1789475917733;
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 15 Sep 2026 14:38:04 +0200
Message-ID: <20260915123812.14747-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053841_602826_642CA737 
X-CRM114-Status: GOOD (  11.89  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e04d92d1b09..afe9d363ddf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0


