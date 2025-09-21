Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA14FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXSVl18LYAxv8kuJFIbcL5dzUgOV2k3k+9+IZ9rZiVU=; b=kuq5zkOP1bnCe76n6UQOn3PZo7
	zAkaBmaU1ZaFXDzK4USce//GszobB5BlggwDN1Ky0kIyGn1qLYvy8PIhv1iAGqwVXjGbzEI1nqetF
	qcgVSOBud0Xuq0hrus+LC4DUPNGaSaJ1mpK7uQ5FdXgntxWSYws19vhk7kDDLYNNKhl9gf3AVqfNL
	mz/fpRnvkmfMVuSu93P0vODdOEDN7FCcinIWEDGblsywaLl3A9U1I4xkD1j4TUKrc1cR45XoKfNAJ
	j/ZkH9+OAPNWqvpskxurNJ2h3dXcJY2x0XtnKAmxWthAuxNAJ3bHQdgu1sQvAjwCDaaG7Y43iR4ba
	0uwTQWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ma5-00000007hj9-376e;
	Sun, 21 Sep 2025 16:06:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ma2-00000007hgX-3a8g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 16:06:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C8F31A053F;
	Sun, 21 Sep 2025 16:06:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E592160634;
	Sun, 21 Sep 2025 16:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3B12102F17C0;
	Sun, 21 Sep 2025 18:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758470783; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zXSVl18LYAxv8kuJFIbcL5dzUgOV2k3k+9+IZ9rZiVU=;
	b=Va35oROP6H0C1gWl4CZws89OTz/6inuha0qxy9bICOS67EGbbRoWIZeErKfY4oLW5pzOUj
	BdeZGlXlbQ1WdAWi7drffTzdbM/ocvcE7BV0zQ2kcGSLgQxEdPACy+mwrrv+40vjZ0zV+J
	pgGVZv6xEOqmtFvTI3MdqHf2dUnG7FmftgiZUegOH/N1W3/hBoyqIc759PuLG31FmGSffZ
	sj0Ouj3lmmktfDHMXNhUJIWn6x2mlIHGZ6yDk1Nz7EJx77VVm6bIZ6ikh47UdbW9pEsXBJ
	LULbKtQp52LTknz0/h359Ql/t9oqTzoUlz66hFmmCje37VfmSAAm0AOpe6CXqw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v13 06/18] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
Date: Sun, 21 Sep 2025 21:34:04 +0530
Message-ID: <20250921160419.333427-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_090627_069599_F5949FF7 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

The newly added ethernet-connector binding allows describing an Ethernet
connector with greater precision, and in a more generic manner, than
ti,fiber-mode. Deprecate this property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/devicetree/bindings/net/ti,dp83822.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
index 28a0bddb9af9..dc6c50413a67 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
@@ -47,6 +47,9 @@ properties:
        is disabled.
        In fiber mode, auto-negotiation is disabled and the PHY can only work in
        100base-fx (full and half duplex) modes.
+       This property is deprecated, for details please refer to
+       Documentation/devicetree/bindings/net/ethernet-connector.yaml
+    deprecated: true
 
   rx-internal-delay-ps:
     description: |
@@ -141,7 +144,12 @@ examples:
         tx-internal-delay-ps = <1>;
         ti,gpio2-clk-out = "xi";
         mac-termination-ohms = <43>;
+        mdi {
+          connector-0 {
+            lanes = <1>;
+            media = "BaseF";
+          };
+        };
       };
     };
-
 ...
-- 
2.49.0


