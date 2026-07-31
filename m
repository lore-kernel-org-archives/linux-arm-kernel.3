Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF3C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=; b=pbSnI8ubQ1nJ1r8JjknPqeEgWi
	cjsyiZNBjyDKnrweE1bgQQiZY2SbdcgJYNELu/unT9aT/hnJKon8ga+SQq7V2P2eOS+KOrX5fLAQu
	PB4fcoMx4ZaD7cEBElAXxFIOF7heK1v2SCMH5DRSKq3HUO58b3co1Thggz3xYh+9+0h0MKZoGTCa2
	SQVqZwtosKG4inBnZnCeYk36tj+Q62DFA1N1LIpQ9LwTiti6EWEmMpWcVuOnwcarO2IToDisfo0xc
	lj6H2yL5XkrAiNNVPdFlVx97IafEWFoWiFXf68Dl8nrPKutGN+HR1z30E3Z4MaZVwH0oucyhALaDX
	tP0YGvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpraZ-0000000DJm2-3gJn;
	Fri, 31 Jul 2026 18:04:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpraV-0000000DJke-30Bn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:04:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f7854678cso438592f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521042; x=1786125842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=T8AED88daEaZbx1sKxTOKBeNbOlZ3xDgjnUihTA4B9vfvKMwhZ68y3p+aw5dTIVqVo
         DhTXhVoAj3UIrOJTFLGtQAJptBa6Taxd0EF6aIaiN5qPcINPLJNJfwyTuT5EFu4JxIqC
         eh+gnH7Ag24k/JOMKeys5/tOnq7BzDndcwl8W7L/qfJPl697A/lkBkYr2Y/DZKz2CUiZ
         hSpvnqhsFjnP0KsHGmh7Ri+7v8JNLBh/+FqJ6SELXWwWrw/9NuMVPsRLMWtt37FSPTLY
         04PV3mF5ZsaPmz84Bw+ayq3GJ+ZHzTVLRxMOhZCsb3E7/c/ETx092zGG2Eg8tPQ8ahPR
         H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521042; x=1786125842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=ROLnDVgT9TU45UIJ8DURf+8O9AS2lWUJAb0glNJVq1h6EpF3T1nVAv3n94KY+YfYfx
         iocLMhgMBEsbDCecgK0eDMzmdbyT1d1u1FcoS0rAxfneVd35zH2mpj7lOSkWgIwoahqA
         EL/thEWJuIO5mT5ezZkEb4/S9V4acm6le9pfiTxF5dfNE0wwh+t5T+0GBaY+m57X+Tfw
         HWjLG7nag5b5pvNiRqOnniXWT1TBUZWgViA5zSpKPYqStEHt5IZ6bMfuF/gteZNvtO+q
         hcuQxhWRxaq6sdlEpVv0qzT8NALFYy57iI+LHLmie//ctXrOf6WEkrrzx44bmW1n+fZ8
         8uSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqqi0FT6ufAEXnpBThnJuIcSmeQbDU55Mw2BDeEwhhRQeINbF9+GD7tLIf+fPVs/vIXFYqaci2LV5MYyUTzpcjf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qTZzvZsiZP3IOia6UXtKpfF6ilY/UPlUAptqVzL4wDCPaHiI
	nEFDIx9tX8NWF0Fed/pHrR/DdNP8g8UuuijKUlZ7YgN/TeI3pjSoh8r+
X-Gm-Gg: AR+sD11pc760XasApEytt1QIZphjmGut/PGMYMmJwnpVeiETfxRgmnXpppKDZx/1NhV
	+6rhYM6eauCsb0b06TXJKvdf8iEshKSV/X1GPyDdm0zS7QiH8TRefWQC8Qm5C9F4dBdjogfDvSH
	QeNoYoxssvJSFNkpWCxuB2flqZyu2Pns4Q1jiqq/9ZYO5xM+KXfUcrbEqMaKzrqe6/vnk/6BkDu
	jQYZuZlrcPUK841129MC7tZWwVuQDS+b3UYteHVa4R/EeOJ1Xkd6GgQM3Zs7pBRboy3/9JB+FN9
	n1VEMr4icpO04uZ48/59EUOcA+Y7P3+V0WEsCva1c6rjYRzoQ8uM7kNiJqlFO0T+tc4RQyDWA8P
	mECr3PuQREsPnZs2WTnSUxG4IMJwzjgFWpD42PgFIxndGHkR3ohwBcXFuFc+qMsVw53pmUStjRV
	vm1db+5QbTgIgSpWCsj6nXGGxLo2ssxsFn5gaYsgUlX6iGWoFcq7/OVqj5BYqvAYGDWZJBM9fb1
	re7gHtHwuubd6EFCFi8U4cO0TRWFm01U2c3IZFdnDF1nlPJu26sbqshe17WNwzvoAryjjUcwno1
	7jHiIGjqOQlKz16tEFAHvRqYtdGH6OveLD4NQklkF7MpsmryeswtWXvGoxXJCQSxOTxs
X-Received: by 2002:a05:6000:1366:b0:47f:77a4:fd0 with SMTP id ffacd0b85a97d-47fd72a8e32mr1022136f8f.22.1785521041538;
        Fri, 31 Jul 2026 11:04:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1240sm7164084f8f.36.2026.07.31.11.04.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:04:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/5] serial: core: do fallible allocations before the console can be registered
Date: Fri, 31 Jul 2026 20:03:57 +0200
Message-Id: <20260731180357.10843-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_110403_781283_3E3F0AAC 
X-CRM114-Status: GOOD (  15.02  )
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

serial_core_add_one_port() allocates uport->tty_groups after
uart_configure_port(), which may register the console. If the allocation
fails, the driver unwinds the port while its console remains registered.
The earlier uport->name allocation has a related failure path that leaves
state->uart_port linked to a port being freed.

Failslab reproduced a NULL dereference in PL011 console output and a KASAN
use-after-free in i.MX console output after failed binds.

Allocate the name and tty_groups before linking the port and configuring
it. Reserve space for the optional driver attribute group because
config_port() may populate uport->attr_group during configuration.

Fixes: 266dcff03eed ("Serial: allow port drivers to have a default attribute group")
Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struct")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260719070454.D6FA21F000E9@smtp.kernel.org/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/serial_core.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..03ee3d038f4e 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3056,7 +3056,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
-	int num_groups;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3068,6 +3067,22 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	if (state->uart_port)
 		return -EINVAL;
 
+	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
+				drv->tty_driver->name_base + uport->line);
+	if (!uport->name)
+		return -ENOMEM;
+
+	/*
+	 * uart_configure_port() may set uport->attr_group and register the
+	 * console. Allocate room for both groups and a NULL terminator first.
+	 */
+	uport->tty_groups = kzalloc_objs(*uport->tty_groups, 3);
+	if (!uport->tty_groups) {
+		kfree(uport->name);
+		return -ENOMEM;
+	}
+	uport->tty_groups[0] = &tty_dev_attr_group;
+
 	/* Link the port to the driver state table and vice versa */
 	atomic_set(&state->refcount, 1);
 	init_waitqueue_head(&state->remove_wait);
@@ -3084,10 +3099,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	state->pm_state = UART_PM_STATE_UNDEFINED;
 	uart_port_set_cons(uport, drv->cons);
 	uport->minor = drv->tty_driver->minor_start + uport->line;
-	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
-				drv->tty_driver->name_base + uport->line);
-	if (!uport->name)
-		return -ENOMEM;
 
 	if (uport->cons && uport->dev)
 		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
@@ -3102,15 +3113,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 
 	port->console = uart_console(uport);
 
-	num_groups = 2;
-	if (uport->attr_group)
-		num_groups++;
-
-	uport->tty_groups = kzalloc_objs(*uport->tty_groups, num_groups);
-	if (!uport->tty_groups)
-		return -ENOMEM;
-
-	uport->tty_groups[0] = &tty_dev_attr_group;
 	if (uport->attr_group)
 		uport->tty_groups[1] = uport->attr_group;
 
-- 
2.53.0

