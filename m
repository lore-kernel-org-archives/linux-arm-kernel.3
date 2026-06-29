Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 02:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tbxicf9cOISRpJE96mgO+H/y2TlKZ0WdbLHi50c/C7k=; b=RWNVKwCJD25IRLbTNOk+yFdR6k
	8YtEPVcD/t8Ct0zR+0ZCKxzMLIAWT8+b92i1IoRcAFGLvcs06uGpu9DJO0/nJHYnFwRWSO2LqA62g
	T0l7jNGFgj22D05lgBtd9k4a6bbcepyi5IzPreIDfoX313xiFgb/amwfOoYc1Eyo3kdIRj73QxXFj
	c/3syS4AR8fg8KYt3j8p8VgQIFThbUgnwIF6sOST7xgGxR6AHcg/I3pNjkMJfaqQLgUvFJr1JOVDp
	v15+Wmm0Qiqxwuzm3tDsNQJH6RC6QlhC3DZVH2/1Xgb9ld0T/VmEWWy7zEKXmyiK8Il+LZfuMf11P
	CQdw7oJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1td-0000000DaVv-21E2;
	Mon, 29 Jun 2026 02:38:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1tb-0000000DaVN-1sBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 02:38:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-845537740ddso1506087b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 19:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700730; x=1783305530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbxicf9cOISRpJE96mgO+H/y2TlKZ0WdbLHi50c/C7k=;
        b=SgvMBJIRxgL9ZSJfCZhQfKjhp2aBqfgDwrqykWQUSJFd0uU3g3IgKpixZTSwrZrDJZ
         A6Hre67dFJ49wJPqUvKhrwg5nH71uWnwewbTpn1ZtQKLjK98Uq9k8JZJ7CKqQ2XBgyzP
         AI1BHMz1XC8ZhwoM0SIXWJ8d9EXBuGQhKP/yn8Kqg7O3xWMsBJELSl5l9GtHCBehpsz6
         tSoKlscwdZiuZT36q6q+gKFfKiAidhjK90bxCA9rV+bDhNQIpZZJ3jR+SmsgWYc4kDBo
         K+fCwoqNOjMYsj/u2m+dcvJXSg9lG+t1TLS2brWXCRgHni7jU1TG7DQl0nWl8GOWKSN+
         rIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700730; x=1783305530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbxicf9cOISRpJE96mgO+H/y2TlKZ0WdbLHi50c/C7k=;
        b=XHvgxWq0MVrPo4l0Nrd7kIB0K+hwVYuZ2wLKQS/1ZsfcZZpQXxgZtuM/6U3j+drgBW
         vR9ysO7sxJwcdQl4Zr7rdWMI8JULvwU4dkrVfWVtc/P/dvkzCML1iZU1EMCNGaztgZSR
         QLCX9OFf47ouS9pxz+WqQ2/eq3T2aCB/QdKUUT8gT1MinRmkB4m10RQoJMvVf/sfoDsd
         TTvHq2CHSxKHquCf7O1AK9w5046XcAAEHyL2BtgiaszjaoMpF90VC3FIfRW8fr+A4ctA
         r9O0E9Mqk94aJU/5vnXZzEH4BnEHd0DnnWzQTv8KHUTH9zYivYZP/wPcyLBrX5a/riRP
         yGhw==
X-Forwarded-Encrypted: i=1; AFNElJ+KNmCqwJxWuekDsih8dEDZSG/mhJpmb1ycDypjfwSWiNq07Smazkn1nFcMLUAC4z8tg//hnbeDYuef8Bs6vTXT@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKb7Dh9BsjASVnsFSH4wZnaliwvIYDVQQ2dAawzhArFrCnLaB
	nCfiKj+0bwp9aX2RjQaI37kgKT7E3EqNnThz9VJw08WYwHDwo0au3dQK
X-Gm-Gg: AfdE7clkE9m3H+y6uIVSoHmuDcZd05115tlq2HaVucvZFuShCMSd5/KD++fv9Nc+qU0
	5MRltoB3TQgLf9vQInEpB3cfEeabKOHoguRDEXJ0MxWu0AW/WYM1OyBI5zB+jgwAcWpWxmE/xfR
	wN5QgrL/f2cO7GjvA63R60Ma9rEeHqnnDS5+zcQ1sWxqq7aroqq5NfOIMRIk4k7RBiwZxCYpALE
	ncUMZ6bpiQ1BDA9p4PJYGGnzwsl7uXd9Ju64hbPR+H/WdHbZaMIAcUMDjVp2uO7h3h8YjrUKPZA
	1VQPCxck5zh+VThmmNQ7nohQ5cOD/8DVw2icicO/nh2kU2q4NVUzb+kGHqRigVZsDVXrAbvdQ2o
	wUPfoocNe7vlM6OMiOSuayY33gNz3ZAdQIw4/gjhyPy8mj4wchKAiH8AGKdxWMIEpwgbjeHquS8
	04dprGVOTCKjKvVw4LWWdU/w==
X-Received: by 2002:a05:6a00:9493:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-845e4d6bfaamr3829675b3a.48.1782700730418;
        Sun, 28 Jun 2026 19:38:50 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:38:49 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	frank.li@nxp.com,
	frank.li@oss.nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v4 1/2] i2c: imx: Fix slave registration race and error handling
Date: Mon, 29 Jun 2026 10:38:28 +0800
Message-Id: <20260629023829.152651-2-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629023829.152651-1-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_193851_491641_02C6DE85 
X-CRM114-Status: GOOD (  15.03  )
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

In i2c_imx_reg_slave(), the slave pointer was assigned before
pm_runtime_resume_and_get().  If pm_runtime_resume_and_get() failed,
the error path returned without clearing i2c_imx->slave, leaving it
non-NULL and causing all subsequent registration attempts to fail
with -EBUSY.

Additionally, because this driver uses a shared IRQ, the interrupt
handler i2c_imx_isr() can execute concurrently and, after acquiring
slave_lock, dereference i2c_imx->slave.  The previous fix attempt
added a lockless i2c_imx->slave = NULL on the error path, but that
could race with the ISR under the lock and still cause a NULL pointer
dereference.

Fix both issues by deferring the assignment of i2c_imx->slave and
i2c_imx->last_slave_event to after a successful resume, and by
performing the assignment inside the slave_lock critical section.
This guarantees that the slave pointer is never left stale on the
error path and is always valid when observed by the interrupt handler.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
v3 -> v4:
  - Instead of clearing the slave pointer on error, defer the
    assignment until after pm_runtime_resume_and_get() succeeds,
    and take slave_lock to avoid racing with the shared IRQ handler.
    Suggested by Sashiko and Carlos Song
---
 drivers/i2c/busses/i2c-imx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..2398c406e913 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -930,9 +930,6 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	if (i2c_imx->slave)
 		return -EBUSY;
 
-	i2c_imx->slave = client;
-	i2c_imx->last_slave_event = I2C_SLAVE_STOP;
-
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
@@ -940,6 +937,11 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 		return ret;
 	}
 
+	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
+		i2c_imx->slave = client;
+		i2c_imx->last_slave_event = I2C_SLAVE_STOP;
+	}
+
 	i2c_imx_slave_init(i2c_imx);
 
 	return 0;
-- 
2.34.1


