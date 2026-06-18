Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E99CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eWNFSAoF1QlxpTcEDqHs6xokC99S7BGwHt6RGWcEFBE=; b=MwFadANI0XEDHcztZdA5nE5ilG
	uLrmkYE3ij1FKyOA0kgdwhH8/pzjKNsZFvK2B4X3rIwxH8Vs1FdVP7ju+ojPc/hywQO66X99TDnSp
	77L5gswpZfVIegiatWQmA4ZUcZbC04xXjAACyFj1zqC9WBm0BZO0v+WYSYajcF0XKs/OcyRx23zs7
	PFUIsWKNHI2VknBTY4hxA2flHH9rpq3PAP7vj42a8nggTRS4JnngDElSvgNbgYrnEtbUQCi6R41IW
	YK1Hh+NH3AXNyRMY/F5pMxa4z/ItqOjse2CfuyaMstPe5DBxD5C21CQirJKsaLBc7Ul78rT0CboL/
	JL+97ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDsD-00000001R2Q-11fP;
	Thu, 18 Jun 2026 14:37:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDsA-00000001R24-1zcr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:37:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c6be9cd7afso4706055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781793457; x=1782398257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWNFSAoF1QlxpTcEDqHs6xokC99S7BGwHt6RGWcEFBE=;
        b=ZrSDgrgu+BHo0Pq8OylCq1PP9hoHr4WsA3Idzr1Jmh3JyN+rPdSwVRNHktt4l1kxx5
         S23wkQPHplQXsCJN4Et6yUPKAKtdvhmewPw7yivsmALz8K6Ve5oJrby3wHvttK1+QJ0/
         o5182UpDukf/eoDgvYENZWDdYt5R3nBRV0nCyFrBRWG5uiOnbPoOp2typVEDqYrN1oO/
         DIYYBB2QPYML5zx4ti4R7uIJws2ZWlf+f7BZil6dTwKcIJXJm9tP0N9SIpyZjDncq3aU
         rCQP8k1QW0ARWMU5gW5+Qz7B7GxL5geclnRWMXTd6tk6fPZ+T2W3CIizv9mjNLOE1t0/
         Nwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781793457; x=1782398257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWNFSAoF1QlxpTcEDqHs6xokC99S7BGwHt6RGWcEFBE=;
        b=tHpdqCsL2qoDRxqnayqCqV59W63EH0E5Fw/YRQYVVZzmVyfiaHoZMWcpzq32ULFjEB
         +VBPrc+obXwRWJTM6VBhHr6vgr/vNyC3VYqcn7dNjTGAcW2+PWNEl1IBf2w6iK+GiFB6
         tQ7fJN14W/dO2Gow763vrjg6hWnjAWOVX03mGBLhu/j0S0/f8YvheGu3x56y5orlrHY0
         PYJtxtbMV6BcJLNuYC5V60UtDR1Qynn7P4laatfovs/wkoWPa7WvJWPyCW17So2eLdCc
         etZPlI7xeVXQemygpr17TnNc936nOrArbZJvK1+OMwuUhwG9Qc+FnxBlngz3nn9nq0Nx
         LdJw==
X-Forwarded-Encrypted: i=1; AFNElJ+I7DGTDoNEKFE+chTxMfycPWnD8DSSoypl9VXJspTf2beafNlerXrE/jd+IuCC1JPJVosCzSrtmPA3vIy5zKdY@lists.infradead.org
X-Gm-Message-State: AOJu0YzaF7hWro7PaNidyVTzU1TeZmVXAIaw99J1IxqiJSKbGDARBw5u
	yiQ0qVP8ltQCOtNtFglJT/rArzIwqonI0OErn3r9kTuN9arxff36FECFsdx0+Cpv
X-Gm-Gg: AfdE7ckF2QJDCAHo/CdYZOmmK6FAppAFjCO8OaHzO17fM4HLT0/ObACrqC9JNzgIZ5p
	nOFcJeMR85wj3CPCRYl7uSzRMLlfmFzHXual2A01uVJbLbYRHGhh7CYwc21NDzGWE8gkqbSg3pq
	2rEE/40lmdozfhgmQWeNRKfS7PSd+VZJbqR9VHg6qg6pOxAdHvMSEqJhff5OIrvkZ+X1xfiwxMq
	w4qewFuLgQiU97nQ2kdKwIXC8wOW0a/NtW3a0vJluzM/Z+TlyTKPPaHSAKjH4ww8Yzkdt8iF7gL
	SRVB3GJmBtLCfVCiVjeoqBFKseZvlF2aENKEdR/YevC68QJNwALqxnlS5LcDp4iQwjfvMy5bhBf
	zZmBi0Ke2fLpooQNzCYGaNVzk7FpUw1LhtlSC7JwEyQrRACG0pdrseg5ik/rwlQL0X3rGKXn0/S
	6PJ5OHmnYjw0EK1RAJ/ejPkSmbDxeT9GWPtmEf5NLQhw==
X-Received: by 2002:a17:902:f64d:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c6e47253b2mr49138885ad.8.1781793457447;
        Thu, 18 Jun 2026 07:37:37 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2409:40c4:35e:20d7:2ccf:7534:4b88:ba43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6f9aec764sm22554115ad.2.2026.06.18.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:37:36 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v3] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 20:07:27 +0530
Message-ID: <20260618143727.18534-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_073738_534397_7885B39D 
X-CRM114-Status: GOOD (  16.78  )
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

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released, causing a device node reference leak.

Fix this by calling of_node_put(childnp) on both the error and success
paths.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v3:
- Revert back to manual of_node_put() because the function uses goto-based
  error handling, and mixing the two styles is discouraged (reported by
  Sashiko-bot).
v2:
- Use __free(device_node) and include <linux/cleanup.h> to automate the device
  node reference cleanup instead of manually calling of_node_put() on error and
  success paths (suggested by Chen-Yu Tsai).

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..7c0239f8937e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -217,14 +216,19 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
+	struct device_node *childnp;
+
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret)
+		if (ret) {
+			of_node_put(childnp);
 			return dev_err_probe(dev, -EINVAL,
 					     "invalid target address on node %pOF\n", childnp);
+		}
 
 		p2wi->target_addr = target_addr;
+		of_node_put(childnp);
 	}
 
 	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.54.0


