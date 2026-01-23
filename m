Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10636D72348
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXTnpoWAZPVe0ihKI1ZuHZxVrFIb92r+vrZhmx/IrDY=; b=4itmSwbMdHpnZ8weSQ98lxuIAp
	cW3C0HvZ1WAvqEITiAa0wB/T+6a30ta6NS27mKad29YCvTAXarVgg4UdXXBkaCggSG/4+6UKhTA/N
	aKmRzc6r1nqdfXxKhWMdzrGhCLMs4ypjXdsf57m1/q4HRogmGJEqaNxmwONdA5s44DSvBDzDVo1YW
	KSvezwZihXfAh5ic48DvuN1EgNxSsDuW4QG/VIP+Y9DlcK2mLJgEM1lYNsbkqotI4rC/1vqot8Fad
	DFyXJMROeNpU350BEPTBoqf8FQQtdjHuTIUO15e7OiQPWVDlPfKBDij81wZ66u64q/tWKKf2mrVIt
	CMjNlJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8J-00000008PU8-2LC0;
	Fri, 23 Jan 2026 08:03:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8I-00000008PSp-15Ck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6589960130;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 170A8C116D0;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769155385;
	bh=9iKYy3t+e8eBDnpd9Bt1UVB5BMTj+yjnzaBUk5NiFYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LpbBEddZxMLYatntA3RsUqVEW18c/weqjYN3QW83kZaQWlbmS3HswUCkMovg1Alj8
	 6FTwif54aRQ2/0Bz9Csh/EW7p8XrGmVtgEJ0zfM0hxFQKzerWO8INEoviz8itUv+CK
	 LZc+wOJBQJGa/yb/rOYtWt+DwBIi4fv+C2I1Qsm49wfdxcPT1aKCOimNHvVtpH+A7a
	 JxBSAp2SJIPYUqTyfjIwHV/DRIu+z3IEv6uxG5QdjcVuDRk9rOM2j/64K9jB8fW021
	 mZ9xhc2+y51n1bhOj4dYA3RRmjqzTUojoXvNQ78bJZUYoPBRM93qK/sXe8Z+ueLm3e
	 mj/62yaeTIGsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E04D72345;
	Fri, 23 Jan 2026 08:03:04 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 08:02:44 +0000
Subject: [PATCH v3 1/5] i2c: xiic: make the clock optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769155384; l=1168;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=udjYxPfABO3RAAMRuXRQ2MPbxoAmpLEpeJlZ6QUIK88=;
 b=1ISL2wGnufwGq5e3UKjSjQXpuX+iQsvKQUdspObxRQveDFo7qaQYA+RLlyXWybCKZgjgQUj74
 4AY+GmGZihNCZXTKtr0O8vaOdLn7axz4C86VJlDfTphckQo+rnZLhyM
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

The xiic driver is designed to operate without explicit clock configuration
when clocks are not specified in the firmware. This functionality is
already implemented in xiic_setclk(), which performs an early return when
either i2c_clk or input_clk are zero:

This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
returns zero, allowing the driver to rely on hardware-configured timing.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..603a246a1445 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1464,7 +1464,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");

-- 
2.52.0



