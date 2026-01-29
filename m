Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFAD73E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRDgz8MqJZUWcXmnZB7ObRFU3IWULWCFKTfl4579WmM=; b=roT5UILDatc9Iy+mst3CWPCKWC
	ZdbZZkPWberyBP+z8eMOVi8GyqfrKt67omaQlrIyymGqxXGsVLUCKY6gp3ZBLdzU7sGerRatWCkQb
	pUynRs+Sesxvryl2MlBKE/9gZ1Jcd1DcJqNFFpvBx9zxCWF1aXgLefFrnZkkZH+WLcpo/BJe3X+FK
	NrvfB2Rl5lIJv+owFIbKgRymgufglsl5jjttwSAXqYnRUDh0EIe4jJQxGZ/eGr505MAlAGZbLvwk4
	+Y/4Kig6krT66xWQM6E1CR7K/DClrCik9QMA3qPYmt7SSzNC0vrMXEYfzy7WJ5ik/r+YMI2vE/Prm
	gr2yGBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnV-00000000gsN-3TXk;
	Thu, 29 Jan 2026 21:43:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnT-00000000gqD-0Zua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E63E744477;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFCD9C16AAE;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723005;
	bh=IpG7K26YMbIYlMeNw0cmbfVLcX2DzmYeW2ZXxwHgglM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sYL33MXb3f9GkOtqfM77vPMoYK6szbN6GSOObPKiYrrkp1YfDoX88/BPiMfYU9T6R
	 HrA3Nu7Jc8pfz7Ks6MB4lpFdRiWxsO6xuSNuUfiLrENpLGD06vhOhNMZVa7fe4BJMU
	 I/0QZcDyzOHYyNZ2tatvLD3tU91G55JUKyuDgBdJ0KaVV5mzAOrPkB9B54IArOuODi
	 LO10ob4jWju0JUgQP9EQVnhCel77MVe9lxyqYrFiI0WadxRq1Ll0lBKBfK+COd0lYs
	 nx9Hu/HmlSQoK5/KtarUmK5mFOxobWU3oA7YHKZQK/sqUVrUwg9BfzD0JsQQlrzs9P
	 1wqVugwkgbvzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6FDD73E9B;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 29 Jan 2026 21:43:13 +0000
Subject: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769723005; l=1542;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=6voIA/a0l46cOc5ueYDVp8U+gfCNRwVU2ZoxgHh2Stc=;
 b=uBwWwmjKsmN67KJ/S9Ua6hanWw+GJQYf5zu/W4/drXYAPDqOkwughktr2P0AaBqADRvqAnCOm
 V4MRkqI0US1BbcTMGp7vo1PHJU6tME9zl1ePwNyn+YoiJHIm62Y0GzG
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_134327_223703_3C46BDBB 
X-CRM114-Status: GOOD (  12.15  )
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

The xiic driver supports operation without explicit clock configuration
when clocks cannot be specified via firmware, such as on ACPI-based
systems. This behavior is implemented in xiic_setclk(), which returns
early when either i2c_clk or input_clk are zero.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..912a94d4d080 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
 	const struct of_device_id *match;
@@ -1464,10 +1465,12 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
-				     "failed to enable input clock.\n");
+	if (is_of_node(dev->fwnode)) {
+		i2c->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(i2c->clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+					"failed to enable input clock.\n");
+	}
 
 	i2c->dev = &pdev->dev;
 	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);

-- 
2.52.0



