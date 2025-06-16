Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208F5C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2REkO5gC9yhhzzDAZNsIufUfzsU30pxXTvOzVJMONo=; b=2h7DRMZEQhCUqUdpfRD0E/I1sX
	4nlfoimwsraAUbpQaapAojk1QWXRClHHqTK+R6EZ8/U8g5yHVDvNt+m5gt4IhV4WEHQotR1OJPjiH
	4cmJBiA7d0Pa1Mu2CcDQyAvFxXEUMp6gPw3lKlOdhp7E4i0vsKDuRpy7CRhO0Ry8LX1BkeMnF+4fn
	wvg7PuqsJHUgLsC91Iri9Za7HYdem7YDIhfE2ecwD0WV22M9XHaDYXKpvC+Ww6h6PyrzYrglKYjT9
	wfGxQuUOeaPJ7COL3Al/j2Du1/DCMPoM8sln9QxpHM12DUNendkSFcXGvmYYUG6d8KjI+fQBhcuU8
	b33H7adg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjS-00000004q89-3sU7;
	Mon, 16 Jun 2025 15:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fK-00000004VJU-1pZc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=i2REkO5gC9yhhzzDAZNsIufUfzsU30pxXTvOzVJMONo=; b=mMS6eWpLVwO/t87BQyS4Icb924
	UbJV4C4kLWB4/smjOl/Ioe0YoR1N1PELmIHw9cCgLipx9P8CjXCkEvDMYHxK0aFnNz7cxOc+CUkyX
	5VcFJeTxuvCYL9/uRfgzoHF5AEBYC5Pc5ArLSLVDp/N0nXZdS/B90yfpUM4cEKRCelLbgb214aAJ6
	Ea80N+Ji40hsBgwTtGYD5BX8fVqTec+cgQ7pwVN6Xs+VeZcEdRAVR18bCzaiInIjnql8/azBVzKew
	ylQPRtAKaZTx1BnBWd5KHNagqGcHUkw9CJNKjsYri3deqdemM5QgBtNSHWq935nFYYFn6RXYJ85kr
	YY7ZF2ZA==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000003aRx-327R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079644;
	bh=i2REkO5gC9yhhzzDAZNsIufUfzsU30pxXTvOzVJMONo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GIzxj/i++dzVYAoGl+ADpT2pTEv0hdoXLGIxEUVZz1a/E+B98oW7o5wNsBrLAfXoH
	 wq9mkz2SyLLhoCfSHmB9930qF/GxE+rLlTgfQqMr12CEQVqvcwhVNtqzxd1ghLWTh+
	 LG/awzjWC14PBNqnHQhBE7BRWnRsMrIILflBvw+646t+NatPDi2mQhrpFCcy9iJnhq
	 BhqH6GNGLkUI0WA+XkMNbWIxAMAtsVfiUDzq9QAwrAcuthlwK7HhM4dfYuR0ieDV+5
	 JD/TONikpwaOXW+EoVm3kSeavD3PbVpHuJbAHwd9c8BedB3Lh3FoIFv0FrKX5G1s8W
	 dfkFDicFHXfdg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6552E68856;
	Mon, 16 Jun 2025 21:14:03 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:45 +0930
Subject: [PATCH v2 08/10] soc: aspeed: lpc-snoop: Use dev_err_probe() where
 possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-8-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141419_073480_3CF19C78 
X-CRM114-Status: UNSURE (   9.79  )
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

Exploit that it returns the provided error to eliminate some lines, and
return the actual error involved rather than -ENODEV.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index bd4afa7f258eb3c1e64fe87d2b4be5f8422fbaf7..8dbc9d4158b89f23bda340f060d205a29bbb43c3 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -12,6 +12,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/dev_printk.h>
 #include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/kfifo.h>
@@ -316,10 +317,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->regmap = syscon_node_to_regmap(np);
-	if (IS_ERR(lpc_snoop->regmap)) {
-		dev_err(dev, "Couldn't get regmap\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(lpc_snoop->regmap))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->regmap), "Couldn't get regmap\n");
 
 	dev_set_drvdata(&pdev->dev, lpc_snoop);
 
@@ -330,12 +329,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(lpc_snoop->clk)) {
-		rc = PTR_ERR(lpc_snoop->clk);
-		if (rc != -EPROBE_DEFER)
-			dev_err(dev, "couldn't get clock\n");
-		return rc;
-	}
+	if (IS_ERR(lpc_snoop->clk))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk), "couldn't get clock");
 
 	rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
 	if (rc)

-- 
2.39.5


