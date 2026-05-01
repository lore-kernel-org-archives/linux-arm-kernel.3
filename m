Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71036CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVBnu6Q/tQcYvEy05j8zTeFYSonQvouDAQt7Xng1rGU=; b=4jdSOi5fWKF8Mip123rehlfCBN
	ZkDvKmd6YzDy/zVx4PNX1zMo1nmgR+nPfSdqjB6oV/mRpNZ3x848Xq7zaaXZKE7QPEjKR/a3wUxXG
	CBmhZPPwwcIaWOeTfaGKKkk0WsNOmdti2G8zilu9jyLcEbzOKDWtF8wK7yistzeVdWPET4vl6EgLE
	5TMBbTY1upsHG8llTfbgTw0zcnmPJfA8z0yuB9W4BqzndjlkHfP/oaFHArSTLX4cqbGFvWJQBQVw/
	O57b8rpY7u0FTs+fPS3HC56MbNYLYmDGaY2lwknq49mENknMI8aZ3yMK9rOb7jCp1XMYDGKk/T6P5
	ZfUB0z7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuVa-00000007euM-0Lmt;
	Fri, 01 May 2026 20:30:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuVX-00000007ett-3hxl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 20:30:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824c9da9928so1077905b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777667442; x=1778272242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVBnu6Q/tQcYvEy05j8zTeFYSonQvouDAQt7Xng1rGU=;
        b=gfTv6Fk+sD6TkmQ90BpjNQFcTJdLKpizgGjcxdOdDIIZNkY9p73gch8UlKqiX+W2aQ
         FxffLezZaZnZVW4jVIoXT3alTgEwV+Z1LxWwnDp9HckMMcW66/pnu7Lr1/FEpMh9SWNq
         xy6reNctQo6UlUX8rndeoF3BysV6u2blKq8ipymkk5TQd8+tCfpwqGkXwRWyyTw3oymM
         nk5Yf3AD95R3cw3JGlKzHSeXFpkf0qUTv9Z9go4wfOqrxGTRro0NCTKFVVS27fw90FB3
         HRanMzG8XixayaUv1hFFJLouit+xFV5nCjOkYNjIyBFt6rHYTA+ZvkwCtxWaIGoD0CBI
         n+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777667442; x=1778272242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVBnu6Q/tQcYvEy05j8zTeFYSonQvouDAQt7Xng1rGU=;
        b=E+EzQGaF5znQIGutz20DbFT31G6HsSY/Vchu8N7dd49jXclbb8fGNg7gY6t8VzJqpH
         NBaAi1Sr2HeOQrIDM3MMRSWgovjgfoFmZrZB/euktE7XktF/72GKdyn18ndJEw7dUzeC
         qVuA8RZ5QY0guSBCnAnjHAl02t5n7B0rU3xWAhQjNAmrA3RQPH+ih7pLnNDtWeewbwtj
         aa9IGMKiwCEBZsL7B/EoEBi0LE1yajx0anU//zCU9OguPgfzMMBzrhZW3KPLu77VKptV
         QZr6rRqvyagpYPRYKY9dbVqba2tdQcUYvLju8ROaFrfIhkkSmDEzlBXOZ+eHDuu4qS6C
         h11Q==
X-Forwarded-Encrypted: i=1; AFNElJ+anzh9ZQ60H9CThtQXwOdGCOUW+wAIw5Ri6sH73SWZShUbbutFL1fvTc1ssn55AkDlSb7Vaje/BtQciMS6QzU3@lists.infradead.org
X-Gm-Message-State: AOJu0YzQF8TbikumNqciaH9RBxF/1eSjSgdJueT/gzci4CorK1cvn1Vi
	E+psQQiiIBj1ZOorrWk+IzqMqfzxXa2AzsAkobpUDYV4nDMtp8CdkTKh
X-Gm-Gg: AeBDiesh74IX3AHjTpoFGaZHZEiSz2ESdrK6m2WOTtIH4Oop5weAHgy6C1zpwjGwKrl
	ygkQJiqY7guhjDf0DBvsumy+ILQHtecQ9iPzgJgR4wIL8/QOqAfhkf+g6NKlCa43COPPgRSmft1
	N9Jd/XdyuYq4imbCW7le1f1sIz8k9Boc+h398RRXTuZboQpWuoPeyJ0ihM/2aiIB2GCuk+0cHii
	zMbI/DE1LQ0NRF08QE8aE8bmcleiYkypYKL0WI3HpSitMcBH+HeUN+KJpmuWVDbX45ZWPxipkmG
	PJz9l9VLAsVsegF6eJ7sZSy+QlFQH4CYzdJW9x+BAxua/+Kd5MqE2/NhHjefdmVdxiJId7z0q9F
	LBg0N1j7OCMvG98I8qM0tUCmaZgpqMEKLbfEdD2OZ4ALZaG9QsXc6DuF2q2wUq2GjZozIrIWHSK
	13Rnqel8HzdsYG+cNiswac7KFctyCbDmyMaHKvskU3aYcoRXYvTw/z4wDHNGhFcRpJEIY7HDyg
X-Received: by 2002:a05:6a00:330b:b0:827:4343:4c1 with SMTP id d2e1a72fcca58-8352d20b2a9mr661002b3a.29.1777667442262;
        Fri, 01 May 2026 13:30:42 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b84aedsm3230595b3a.57.2026.05.01.13.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:30:41 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH v2] i2c: sun6i-p2wi: fix of_node reference leak in probe
Date: Sat,  2 May 2026 02:00:02 +0530
Message-Id: <20260501203002.3382428-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
References: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_133043_983448_155B9A11 
X-CRM114-Status: GOOD (  17.01  )
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

of_get_next_available_child() returns a device_node pointer with an
incremented reference count.  The reference taken in p2wi_probe() for
the optional child node was dropped on neither the early return when
the "reg" property is missing/invalid nor on the success path, so a
reference is leaked once on every successful probe and twice on every
failed one.

Use the scoped __free(device_node) cleanup helper at the point of
acquisition so the reference is dropped automatically on every exit
path.

Suggested-by: Felix Gu <ustc.gu@gmail.com>
Link: https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/
Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
Changes since v1 (Felix Gu, https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/):
  - Reword the commit message to make explicit that the leak is of an
    of_node *reference*, not of an allocation.
  - checkpatch --strict --codespell: clean.
  - Build-tested: x86_64 allmodconfig (CONFIG_I2C_SUN6I_P2WI=m via
    COMPILE_TEST) and arm sunxi_defconfig.  No new warnings.
  - Runtime test: not performed; no Allwinner A31 hardware available.

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
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
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {
-- 
2.25.1


