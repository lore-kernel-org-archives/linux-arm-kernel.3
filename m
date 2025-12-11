Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F72D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OktlR9bq9mtEJ084n35uOYN2zYX8CCRfSb1l9l6A6kk=; b=m1SnAG8U7Y2osHYg4XN4dVjkkf
	uw5pSly9dKbGqlcfH3E7lw+Ts1FKXdH61g5I1qef0fPdcF3udyZjQl2PfXGgyVopHhJBykGGXFHIU
	6JZeT62RWHfnghrtGxyi0tZDSNQKyKTpjp17LTirvDw4tP8+fE6Vo9vmLMKBcuuThH8bPp5aCbykP
	pjuunKB/5nIG80nZ3iBbXq3AemOvD6oqxONRkF01+B+FoGtYDdyDxTf6C1u5yKhdx5itxNXcnUBSw
	VNBQ8SWzG9L12ILpeOdOP4Ph4EHDed6xQR+xA/l03kJupptIVWx+jf+VIlR0mE/bGGxighA3EK9f2
	+9nMbMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJt-0000000GOWd-2K0x;
	Thu, 11 Dec 2025 08:46:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJq-0000000GOUT-3ULu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442796;
	bh=OktlR9bq9mtEJ084n35uOYN2zYX8CCRfSb1l9l6A6kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mm0oV6927NtwXJE3mZ5NmG0zvn3PLYLkzuH2SuFBs0ZLXJGI6nAlarUCDa4g3xQnK
	 kt3dxwj0rntoJLRQiItErW2OtnnEgXTXgbd8I9EwVeckhHKjStFY2OKQ72oa0603xf
	 ysq6gJFwro2BzOitoUv/fcH77fmag4NGvMSMI4/2a3RdTPyWAmSp/MOgleNxfrstqN
	 mNxmn93DegF3TrrLKt6hYW8isRz367469Xx5DYNwqZacGzZsgGwCDzcJSfy38wgFXH
	 AF8EwEXPZJ4/XWy/VSfTbcp/Y6TdJg2ExjtCJCuMd5Eo17JeoMIwk6XG9zn79e0urP
	 sltPCG4O5FxbQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C64A97D6B0;
	Thu, 11 Dec 2025 16:46:31 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:44 +0900
Subject: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004639_093647_2B7955D3 
X-CRM114-Status: UNSURE (   9.12  )
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

Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
error for the purpose of the AST2500 pinctrl driver.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..d4c364d19d64 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2654,9 +2654,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
 		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2400-lpc-v2") &&
-			    !of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2") &&
-			    !of_device_is_compatible(np->parent, "aspeed,ast2600-lpc-v2"))
+			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
 				return ERR_PTR(-ENODEV);
 
 			map = syscon_node_to_regmap(np->parent);

-- 
2.47.3


