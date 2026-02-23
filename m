Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDF8EA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD9vC9efy6fVsWH0S9qJBTI9NRasscGx2oPuT8H5PF0=; b=RMIRXeTtzBzmwHfuH8ryqn9LAu
	3aCU9yzQxAAYQuiBWuuZS5PSZFaJiwGtdTk0iO7U0EwGMQlrF2QA8yoHxB77plcxc8YUhNIhKz6hw
	IdevSG51YNu7n+nV3UsONKmxDc9dH3YO5+Dh4Yyf6PL7ko+3R+Xlin/q1gurRx9Ec7Vlqh1Bd6EmH
	p2O6/lKpA4XRJVhAJYvfbxT01+6KyLG/7eZha8Zcir1em/PxRCQFwA1TniiPUcoUzZ17O0UVOals/
	O8b7FwOIJwdC3oEsYFzNsvgjFv4301+VaWURFWZC3dxz6y3nY/4wzgsePX54/5Tu+KHYVMZKzlYIJ
	GcPKbG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLD-00000000cHH-0049;
	Mon, 23 Feb 2026 15:59:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLB-00000000cGS-0TJf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B3766012A;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD8DAC19423;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862359;
	bh=jRtEYRL116cS46+BRRnEAwVlx/TCGH4biEvlH/E3jhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hY8W00Hzl/pp0egLIG1G4hWGihy0/D3JpTJM/Hsfo9+C1w0D/XltYitv37hwekP9d
	 +zRiZ9L5LLgVRW6nicOypqEge0cNyNKu1zZGzbkDNPRCw9uspCKq2BaCS2ERehZkyf
	 HBpimFEbeuWhidWOva62rFKM9SUoMqVLn2nBzH5v6udcr+EeFBx60DToBoCAu84raO
	 S0GbIrNEcB+unNERxYv8lLV3yOdJCcz8XIW8i/VhLiv8RNVfpx3SPKc+ZCn/rOZ5cN
	 5Bm9tXywKZL80YLwcyfIu3pua0KkoKEcE/eF+F20y8o+0l21SwV3CCfBDBw1DVXsE1
	 PKTFbyGmk6DjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF79FEA4FD8;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:17 +0000
Subject: [PATCH v12 2/7] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-2-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, Andrew Lunn <andrew@lunn.ch>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=1019;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=RRuL/bQeZiBpUR1djYETZjT+qDSOpjJwtLxb+GfrByQ=;
 b=VharzeRkKrxhyXE6WRZHB9DJvlK2n75eKd6wkWUB1AX6r3efg6/vudtjKSJthn0dcTNl9jog/
 Yq1xUm9m4ByDTMwx3ySHPlrWQgQsjZQcLzWOTGNHsP3bFwMCsrDgk7J
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 65aa280f6fd9..99286af2a0d7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1491,11 +1491,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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



