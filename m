Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E950D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaCIgDIvXKFxlEh06PZUH9olbYn5peflfwgiHUXeKWQ=; b=oQS42gwStqgFm6i1HCk2VE3EdK
	8oDK1jQePKfjPHeYAPYYK24DXALoZa67+/n/Mu5mMCmXv8YbjyOJdAcKgY+JonSXb+TKT87eAR5kq
	5XXyciVYaxhxoG28yi1L/kc2XX/1cZzqiyP0OlYis++8mcupDHYAYVlqnKzyUAIDhkcWavuej1fZ/
	9yfqXtRDCfDhwQYiLwbBHIqlaIBFX04OHXEqN0hiOakvBSO3F12hk5imeFl0P4uHJKH0VNax+hYyE
	qNE1+Vioe3CqMsTRwGM7d3bd7rGkW+sD92UNKGLAp+zLyiXwKQbKCn2pnmp37RFKfRALrCeH7S0wW
	Kby8AORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJz-0000000GOZa-1YvS;
	Thu, 11 Dec 2025 08:46:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJw-0000000GOXD-1TJm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442802;
	bh=ZaCIgDIvXKFxlEh06PZUH9olbYn5peflfwgiHUXeKWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TWkruskjvN7xj+MwWy10jjXI8sxa0fzMzbL6LBnv2B523ZUUvxFbWBWM2wCe00jbH
	 o0KiKfbCRlC7MsTUEs8PDWIINz5BZLriBTcb/D/OkEsNERjaYzeRe+2WUBSk6xWYyh
	 15LKTC2e3qhOlvQRf2dW+enVMbnkcKG8uRHJ605jPyOFgZmOlQ2SCZEeuqpdtodBt0
	 LUg6OJUfKZtSsb6Gx8lfRjOJqPtN4vmTtGLuHK4zjxooP/iZZZF/lJmbWmBXBSfdr6
	 CuGz5H4GA3zJoZJGURJgXXG1iLW9ozmv7i6cgoMeKsnP5iYw2w0TOvnLCtBQupmAc3
	 1BnOvhaK7Q7nw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 85BCA7D6BB;
	Thu, 11 Dec 2025 16:46:37 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:45 +0900
Subject: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004644_594746_620CEE73 
X-CRM114-Status: GOOD (  11.28  )
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

There's currently a wart where the Aspeed LPC host controller has no
binding specified, but the pinctrl binding depends on referencing its
node.

Allow specification of a phandle to the parent LPC controller instead.
Fall back to testing for a compatible parent node if the provided
phandle doesn't directly resolve to the LPC controller node.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index d4c364d19d64..7d818b4da1e3 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2648,24 +2648,34 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	}
 
 	if (ip == ASPEED_IP_LPC) {
-		struct device_node *np;
+		struct device_node *np, *rnp;
 		struct regmap *map;
 
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
-		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
-				return ERR_PTR(-ENODEV);
-
-			map = syscon_node_to_regmap(np->parent);
-			of_node_put(np);
-			if (IS_ERR(map))
-				return map;
-		} else
+		if (!np)
 			return ERR_PTR(-ENODEV);
 
+		if (of_device_is_compatible(np, "aspeed,ast2500-lpc-v2")) {
+			rnp = np;
+		} else if (of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2")) {
+			/* Maintain compatibility with old aspeed,ast2500-lhc node */
+			rnp = np->parent;
+		} else {
+			map = ERR_PTR(-ENODEV);
+			goto put_external_node;
+		}
+
+		map = syscon_node_to_regmap(rnp);
+		if (IS_ERR(map))
+			goto put_external_node;
+
 		ctx->maps[ASPEED_IP_LPC] = map;
 		dev_dbg(ctx->dev, "Acquired LPC regmap");
+
+put_external_node:
+		of_node_put(np);
+
 		return map;
 	}
 

-- 
2.47.3


