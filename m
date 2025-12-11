Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E619AD41C05
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj6Ys4VgfF3wMgOB5TKYV5h47MurR6kyE683c2NwUxE=; b=Jdr0kjGOm2c6CiMzBScAE8X/zd
	sOQYu/iLraiAuR7hYK47POtDUCxFefldcd9QsQ+SGpf7DpGkLePXpH+oSyWeV7lAiRC2KdaMZJInG
	Qg/PnJYf39XHNaA4F91KivNRZoiVWeQSO141pIV+nc60FzoNWR/qpBz0a3/Fdy3Dg2tzOAPJjO0/P
	WJ7bTMQZ/18DS5jPIbWxuYi2WKwnvUp3aGUWiD8m3Bu3Wa+AberSH3A/f4s6MAoI1fRH7OHYu8e9G
	r3SNWOPRwrqpb4y371XGVfdxDS9BR31piX8nPAmI+GSNBogYT7TWNPQYcNeu4JtAosiHxGq8YIHbB
	ineMbFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKV-0000000GOxq-49nx;
	Thu, 11 Dec 2025 08:47:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKT-0000000GOuv-1thU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442835;
	bh=rj6Ys4VgfF3wMgOB5TKYV5h47MurR6kyE683c2NwUxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R43nVcAKmIKmxxY1afGyp9269WBa1/8ZZKA+sg0CL2QCovXOLQQNNbE9YrcjlFRI8
	 B9pl3odOOTH1Uj0p5s9Xl8amMl4qDAiIdyw29hJ3y7b+G9guO5eBvwcgnhL1Xnufku
	 AYVFDK/A1c/U/b183kKSt7OiPuAs40vEX31hd+s2J5U6kIpKBnJEd0pvNL1FwGwxt0
	 Z52kjXnDZ/iYjw9OXeIDtR2It23x0ZpOxg5eXo6rUbkhybScMIxffFvF27TsmkUTEz
	 xNceCv2Q66+QhHI4Wt30EEKTQ2ly8bvqJeCtdeWZ2QXophArnQLbSX2+v0li5m/+PW
	 ujK2cRoGriX/A==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 839517D6B0;
	Thu, 11 Dec 2025 16:47:10 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:51 +0900
Subject: [PATCH RFC 09/16] dt-bindings: bus: aspeed: Require syscon for
 AST2600 AHB controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004717_689954_083AC7E3 
X-CRM114-Status: UNSURE (   8.17  )
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

The AST2600's ACRY (eliptic curve and RSA crypto engine) requires access
to configuration exposed by the AHB controller. The devicetree already
describes the AHB controller node as a syscon, so require this in the
binding to satisfy the ACRY relationship.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
index 2894256c976d..77e60b32d52e 100644
--- a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
+++ b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
@@ -17,8 +17,10 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2600-ahbc
+    items:
+      - enum:
+          - aspeed,ast2600-ahbc
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -32,6 +34,6 @@ additionalProperties: false
 examples:
   - |
     ahbc@1e600000 {
-        compatible = "aspeed,ast2600-ahbc";
+        compatible = "aspeed,ast2600-ahbc", "syscon";
         reg = <0x1e600000 0x100>;
     };

-- 
2.47.3


