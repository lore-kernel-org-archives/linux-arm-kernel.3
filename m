Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF86D625E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfsIzHX80lDpdVa1MXdk9Jg1moAafn5Qt0l9gqzIkho=; b=bs8M4HCQt8W2Axo+BcrhWg59ju
	NKRtMbsXOtb4ERcYDYoCl8itbFTimlCtief0pr2QDxu7JJNnwKG36WPiLddntX6G5KdAWEqgTfp30
	WZ1qyc7K4gxZY65eQFJEHY1HmvEtXalclQsnZaej+e4PAgJazbiy9Sz0BzXxeC8iygVDc/MXLXAXt
	sYdkoI2wioMohHVfLgJXd4kbqhiVLCVjDcA+IhIIAxKHfDOll4fffFrdNuCsLfuDIAkNyL8MJD9I8
	6CyORNYmZELm+hBnmlCT53NeVRRCocSBAq7O4GXiMpck1+ANLKrKj9ZCpDes04hlwQi41Bxa1k/6B
	/VGvlCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viq7Q-00000006eVl-19jK;
	Thu, 22 Jan 2026 08:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viq7J-00000006eSY-2kdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42E7843BDD;
	Thu, 22 Jan 2026 08:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20F94C19425;
	Thu, 22 Jan 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769070756;
	bh=OhygDeif0qaAagip01OdretnzJcVMNjCREuPz9F/O50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VyzmRYkuOWEfxuT/Y5fH6dL5MFLwGYTXYTk+C8BSMZNyhN1NeX7tqLqG21ChSPSb8
	 2V1pOUnL3nz9kUWL4GO2IPnZXoBTWmH1bNYQN6ic4/s+GBpCnibveRASviIsYtXauX
	 QmaRP5fWfbIvQyq96c72UVTysgI06ShjT+6aePAafKakmZyBlZ/xH+xbf3x6OLbdbH
	 j+a4aCB8KrWCfmoaE5mevugVyeCy9JWS5JHpH7N6IcBZmYRvMEYawpFZohGk8u5Zyy
	 Ex/GYIJ3CnCN6aO1D33Gzy0fICnxJDE6LU/PjfUk/DeHPLvngf6eZn8IbcfsB3DxBt
	 /BIpf6YpoqOjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1313AD625E0;
	Thu, 22 Jan 2026 08:32:36 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 22 Jan 2026 08:32:32 +0000
Subject: [PATCH v2 2/2] i2c: xiic: make the clock optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-i2c-xiic-v2-2-134f5d743e8b@nexthop.ai>
References: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
In-Reply-To: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769070755; l=1147;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=30Y4elib2oXS0UgCTGXSQddfRG4H8frOGSLNdFvW0G8=;
 b=CuQl/jaFtohkiawpscgRaSfDh2zFoUAaQuD8v9qu3C6qO1n1SZkhluEHqHAaMg63WZ1k0TuCj
 hh0YTdPwwufAH7lEYU6hJCjs0ZmN4/0UP91yD28VLrFcVOAge1JCGsd
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_003237_747899_C124EA7D 
X-CRM114-Status: GOOD (  11.87  )
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
index 2ca736cbf688..3d86b2077d6b 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1459,7 +1459,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");

-- 
2.52.0



