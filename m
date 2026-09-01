Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E66C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWs+YupxZ44ht1HfvkGhk8oEQeiiBAO5zBbFEZpHIfw=; b=roKOT/ji+T1pcvKBcZZm7Gxm0S
	4zbyibxL6mE5qNbFwkb/1BXzX01hsqjgP3mwoi6EIPWzUiI97uMarLPjeGJQmsnNr0I5XaPig3uo1
	BEnlFAHc++EyheRkr4CcYIdS6/lvcYsojBz5HuHlVKzihYziTP5PFBr2YFfs4AL6BtiAucrEPd73T
	Ec6GFVejfhzv0Mg6ZTENiBl+NTBwppz3cSi1kYLflgMSKDl3iCH6QhE6DNM9cHoufXOFDpDBL9sXP
	VQLowwMcNqS5dt6CeJPxz2eZqeUYiCZqdhSkSO5A2vH/oJTH8vVdHGRdCosVU/0asQWE5LXdF6b1/
	LISEhm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG3-0000000BANx-2Guh;
	Tue, 01 Sep 2026 07:50:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG0-0000000BAJI-3yr3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caced6038eso8502415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249012; x=1788853812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWs+YupxZ44ht1HfvkGhk8oEQeiiBAO5zBbFEZpHIfw=;
        b=Mc+FMb7w9pD+FZli9jtrKbO9yDQ+LpIePl+nv4ZdfZd5jNLPtqLOyhLrG+o7Ccwmxu
         piN1a9YvO1WEb2WmI1ewu06m/xdC7sW9aLpTPxmZAaqZC29RI6yU90W8FFNmOao3jNZu
         GGe2i06wfoPmercn8vD75VTwHifg7vemKxFTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249012; x=1788853812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWs+YupxZ44ht1HfvkGhk8oEQeiiBAO5zBbFEZpHIfw=;
        b=fITECWsUsw6KFN/D9didDK2BYedys7/wpvfovyiDiqc5WprZJspjepW4wDanqp4HaM
         hPt8uH6UeYsLMLSZJ1vir155ZWZ9Hy3VWY0LBtOCKnKjFzflKg8cyKWEg/sWxtqoAwMS
         4imrBKbU4/FWH3owhxa/N7VmKp/2ylTVJU8oO04/eZrj20BSL0lSxOvjS2ln9tIsp3Eo
         k00eoKm5bA/+x9FdeFMJb/kvxQVtD498OzIkTAZpiuTZp3qUwOKTj8tZedMi9gt7ksuM
         XkvKK8lTY7t/EmXJ6DrnPpNkw2Hgm3Cqasa6CHVR+kgOKjSJ1aSKz4g1p2sjQVA9ZMSH
         9ayQ==
X-Forwarded-Encrypted: i=1; AKwUvByoQRTazZV+gj2PUKYM3fhpuMVmkDsf71sdR+1RH8AWtJMVoxaP6sRJgf/WCojvK5h4JdFBNFDHN90w/uGWhtT2@lists.infradead.org
X-Gm-Message-State: AFuF++lsUYxr2rtS9bTIrKR92q7MkvwuxdPXE1uvIXa1HqMaEhKl3rA7
	2TS9LW/NaowDAzpoMJJIfdT6QdYcx7nx8YoN7PbE5QymfACnvkV8B1ws4XMH4zM9iw==
X-Gm-Gg: AYBFou3zIfnmW3LUjbCjs08DDomKct5/bSgldv+BktqpkexjVaAbgSicEMJzTo60ihp
	vUXpL/Gm9UpDfP3pF+C6zOr1WMqJVCXXeTjgFN6PVH8QA8LbjnmcatKfm9+uVV6c2WFkTXdRDgL
	aTFCkFx/xeWRpMDGtoxFozhN/kYCy3A6fUextdYQwlVDzib5Y//T7t1x05L43+l9KYSKkiYi4PH
	F5czO7qbl5azmigzzRkxIC1jMpvc8DmJkE+4zCMqVO1rYdt93UdP7ybNqTBXj2Sd5qkTG8onQ+t
	5DByTGrEcrAPD+5GtPKmJnQhokb/V3Bq8hJ+kofjpFWBdlwEItlShJmIs7kG6tmHd0h2Nhn/k5Z
	J6rH4+SOp/dgOPDA/UWROPSZDFVEOtCx0s77pJB8Qjnp5NznCddtC2f2g1TAYcxoTmM3p4SRAZE
	jDYZznb/jfB9pAtN4JLxLvoCqda0wxdJtNIC++jhHOKoFBcSGM4DsWpg1HhHQ3PQ/TttOiUqnYp
	J5KW1tjCmtTfgdWfYFsLmSHbRANhuHLNaOUw4t/eQPuyw==
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr35651975ad.2.1788249012058;
        Tue, 01 Sep 2026 00:50:12 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue,  1 Sep 2026 15:49:24 +0800
Message-ID: <20260901074930.764550-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005012_998049_728A3F6F 
X-CRM114-Status: GOOD (  23.89  )
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

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Only defer regulator disable if a device was found
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 97ef58bb4c04..f52ab3f54933 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -238,11 +238,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -359,7 +371,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -405,7 +417,8 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_ena
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	/* defer regulator disable if another device driver could enable it in time */
+	i2c_of_probe_simple_disable_regulator(dev, ctx, device_enabled);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.897.gb25b4bd76c-goog


