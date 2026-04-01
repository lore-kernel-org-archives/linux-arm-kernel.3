Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E8D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=047O0Bnm7X7eFxP7dbf2lFni3tJL8l/+lwR4gP4mP0c=; b=KVigYZcN10PkZXhw4/kutjh538
	4hyMt4zqOyw8wwfUwPIiWpSLwJo1dVIaPRolX1RXfSvKufVInu8PVs2pGhfqsL7ov6sQLU4g/BYV7
	325t9ulW3SJemV1XadvFG/ecM1vXTTBrirTmCudNn4B560LOlhPW3hZFDrZ4Ik+HX8fpMBdNqHjxF
	i3tC7o3lqFdOVGbWIlvZwPszt5M9a99b4trVWqk5kwXonHyu+rgxrD7N4A6Fk6tNC82dBRCDW1BXy
	EUCQ+TqRCoUZ9PKfGXRSQeyS8Dv2tbPNaaRY53qGvaauJEbCWRqSYDKV4WEueOKH5OhcCF9IIH8t9
	VdMYaLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7unR-0000000FAok-3xcO;
	Wed, 01 Apr 2026 12:35:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uLV-0000000Epn3-2fYQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=047O0Bnm7X7eFxP7dbf2lFni3tJL8l/+lwR4gP4mP0c=; b=iRXnHYMss+jhCCG0aZNDSFEmY0
	FO4oldENKJFBbHV+4sfW28xG133Svmu6M/K5ii+1PyNMqRdqYUOUyL++nwRx6g05vOLjJ25iW5J4I
	mejuUoXLlysU/fmgSDQl+y/g4O1/I2Cy/BCGow/JjRqSDDmUCIvFQ+8pIc9YZ+1rRn1wU6AiG7dKo
	La4vl7rmINLvUoP5qhg4X/7586HMbgFiTeR0QDB6d//6ril4ls/WA2Tww/o+F/E7U4XxwW1MJAQr0
	wlGF4W6sfA1inSkCjE/KX8UiTzj/NOnq2ZgGWwIMNlO0YVqMqzoCLkxH9ddfJFl7K/WHZ8Qi43c/o
	UTeRsoCw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uLQ-00000000IDZ-34ot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=047O0Bnm7X7eFxP7dbf2lFni3tJL8l/+lwR4gP4mP0c=; b=fnuKjJIash0Ly3Blm7dlknBg/R
	tJyMWI2S9H7Ak8KNXtF4BV4SVuzswduPWcxnXRpDKmQzb+Vbx6toOQKI5DDCQR5CwWB7+gs++rg40
	p/5BB+JcZFqvcdmF5K0CqwJrQ4NKWgUw91YsqNPxDHB+xt7W1bw1VoKtDoLy6DW9W939yhIUpy/BF
	/HZ/BjpcrcLbHVfapirJ9S/YChNH9T2C2WIDZLafFLGPkBXuiBlRF2ESIimaWLtqZTAzoJ9qED0/o
	9uTycrK52cXBM/3gdEOXAerUgGJ1PzfwwyK59ADYfD4cUTuSygNjsYOnxW5KyeMNTdQLuf8OKpEeb
	TvbA5+JQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7uLH-000FCz-2X;
	Wed, 01 Apr 2026 14:06:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7uLH-000JGT-1D;
	Wed, 01 Apr 2026 14:06:39 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH net-next v3 1/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
Date: Wed,  1 Apr 2026 14:05:42 +0200
Message-ID: <e7ec1b928357d1240a962a88dc6ac67fd2c92357.1774958552.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_130648_936496_BDDCAE47 
X-CRM114-Status: UNSURE (   8.56  )
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

The J722S CPSW3G is mostly identical to the AM64's, but additionally
supports SGMII. The AM64 compatible ti,am642-cpsw-nuss is used as a
fallback.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: keep ti,am642-cpsw-nuss as a fallback
v3: resubmission for net-next, no changes

 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index a959c1d7e643a..70d25f5ff1cfe 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -53,13 +53,19 @@ properties:
   "#size-cells": true
 
   compatible:
-    enum:
-      - ti,am642-cpsw-nuss
-      - ti,am654-cpsw-nuss
-      - ti,j7200-cpswxg-nuss
-      - ti,j721e-cpsw-nuss
-      - ti,j721e-cpswxg-nuss
-      - ti,j784s4-cpswxg-nuss
+    oneOf:
+      - items:
+          - enum:
+              - ti,am642-cpsw-nuss
+              - ti,am654-cpsw-nuss
+              - ti,j7200-cpswxg-nuss
+              - ti,j721e-cpsw-nuss
+              - ti,j721e-cpswxg-nuss
+              - ti,j784s4-cpswxg-nuss
+      - items:
+          - enum:
+              - ti,j722s-cpsw-nuss
+          - const: ti,am642-cpsw-nuss
 
   reg:
     maxItems: 1
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

