Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBCBD73E9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8TnhpvNVBBGTyZrMKl6LqYHEGSCuovGFN4foukyBpk=; b=34kxCRuykmsqT+uiB9403Gkfdl
	mGTU0m4Q/SfI634QwJ4Zid6Xic1c1U3cz87zVTeekPsZFJAEMs5GvfWhEX30roIpOmIrfECGAOnca
	/mMCE16et+nsubwJiBKS56rUy5w1Zf1X92gM+kmLoEJseBVv6XM/t7anT3W/B054cxpbMMjWc+i4p
	w9kIQu0zs5E7oJee7yY7zaqn0qkIWZFPKd+pw/9Tq/np5VtHTHXma0s142njfyWxGKucMh7toOUix
	lpkKLvIK3iZnT3NmD4GNovNk1p5tW6771IfeKQsSl3l/Lp9G4HsJAMMX5Awjz4qA73QypGjrosQCR
	r8LlwIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZne-00000000gud-2yYf;
	Thu, 29 Jan 2026 21:43:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnT-00000000gqF-2NeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01029444B5;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4D91C2BC87;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723005;
	bh=brjSiH7R5FA4tu3Sa6BJ43nSvJfgsNAMf6VD6KddoQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ab3SsJPiF94TK48jLjonQtWQ0xe5f318tbBO7EtoSGl9XLAG31Ru/Ds9V6jlW5KN3
	 dlLm44LU0cky9PmBnKFCjJUoFuA8fffzRg1IG6XctrzZ11ttaGY21Tcj1phfK7hw0/
	 x20vee/M8Rg0uoATF42tjdabJKQAsRbN0dpNRGJX8IK7Ee/6a2uxsgVHDiseuH4pjL
	 Q+2Rn0VDZjATO7qEMP9VEd2ht5FdFLtUIbwV2TANYHc37aPkadNg256fVY1dq7jRUZ
	 K21FkiMAIxSeYFX2t/EfQLkSBg8YYRLXp8lXe4A+/Y2sdbHL5LqLYDdOs5xiuBRGxe
	 b92KdlYzqGZJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC0DD73EA0;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 29 Jan 2026 21:43:15 +0000
Subject: [PATCH v7 3/6] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-i2c-xiic-v7-3-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769723005; l=958;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=zo3dFn0HlGyzLosogoUEV42eLeWA4pxDMvHnGq762BA=;
 b=6rfEoX/3ErdGjF2NOVeNicWIblBIaO5nt4cWgVlXdXicLxUCeEC1gtUnpqz9TsVf/7S5dnJsJ
 WmgTfw9UEbmA/ccDBPK/wzk7B8+aUvG3vYVJDf/30Wsa6jiMl2UBu28
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_134327_628455_5F5934C5 
X-CRM114-Status: UNSURE (   9.70  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The devm_request_threaded_irq() already prints an error message. Remove
the duplicate.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index a480cbb86d93..ca5685660e45 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1493,11 +1493,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
-
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	i2c->singlemaster =
 		of_property_read_bool(pdev->dev.of_node, "single-master");

-- 
2.52.0



