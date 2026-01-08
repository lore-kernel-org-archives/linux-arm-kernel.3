Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B047DD148BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EguoN5UoBIxCjveRFklA6CdlXXdagmARsUp7EB8KNWQ=; b=f29DG6bLkoCr8srqubkW+kxci5
	HvynxpQb3F/2VIqwPezDA6Q2VQ27qhvrIqI45qhv6jGKREbI72cxJNZPHRRMrF9OiHndyjD2pOcMe
	Y0hyDwCAr+OLHI6rMMei2zph2Za43M4HUlfna8Z4Ho+IhdbxKRTl/ULS2TM+hLvO8BYwmTg5ccvSR
	yfVv4I8rA5qxLJYlt4eElT6b7JqNcC390h57t434chk1i/mu8fwygZdfs+6e+DGs0i5nNvlIycjJD
	DgfUu0O06TZB9Sfg+Mjo/VYhd1mLCpHtqkcEaahNCdw0QatOgK4p/3DuUQPN2QwE/42X9FKFIWMDj
	wmmbC/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkxN-0000000GBAQ-0EeF;
	Thu, 08 Jan 2026 08:01:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkxH-0000000GB4Z-0pJ9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:01:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75FC5C1ECAF;
	Thu,  8 Jan 2026 08:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1526606B6;
	Thu,  8 Jan 2026 08:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB7A6103C871A;
	Thu,  8 Jan 2026 09:01:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EguoN5UoBIxCjveRFklA6CdlXXdagmARsUp7EB8KNWQ=;
	b=LGPP1rIZeWxgTSot/j+xUX/DsrK2yB9uod8XnSgb+GSVYEZr67WSBq+hPJ1ZG5OFxjFexG
	4NBgg1oc2PVOE+YsnpTVSuAhfBwJWcm6De4b7ygJ3bzhXTWBlEpFE/4sj1jzQ62DNkH7HW
	ECnkBXSvvqFfhNY2QLajYADoiXbuAPSiK9Ui0y+XVUjsCN3zXNc6y1MysAdz3TXSJgYDyc
	kYwRclVlMOIgkWm24fvTMPXulL/p05l2CxdNB7mUDK6pFsaiE+XmL/qiP1o6Udy15WiWYK
	bi3gwU4npmHqgwlTO9FmgdpGbpM7hPQbmtri6QtwFpKAZdBKmclGSXorgKAxyA==
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net-next v22 05/14] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
Date: Thu,  8 Jan 2026 09:00:30 +0100
Message-ID: <20260108080041.553250-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000115_429542_4128CC78 
X-CRM114-Status: UNSURE (   9.42  )
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
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
index 28a0bddb9af9..23c70d863c39 100644
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
@@ -141,7 +144,11 @@ examples:
         tx-internal-delay-ps = <1>;
         ti,gpio2-clk-out = "xi";
         mac-termination-ohms = <43>;
+        mdi {
+          connector-0 {
+            media = "BaseF";
+          };
+        };
       };
     };
-
 ...
-- 
2.49.0


