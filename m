Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4279CCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW1XBvuiEB5I2x6KNwZzHVasct4ncQR8HK1Z7vt02CY=; b=pRQ/axGG1j7qFyMfWOFStCPQ9P
	QY566+cbnTOt0hgajj0WQvI3PdjNqKeXv3+Q7fH6FJ2RNpsh25EZzc3bAQNHpMOptXkius6ldZUYJ
	1eN9yeAoneyiso/DK55mjbi+4whUnAMHQ+eH1jJTVaGpLt1zG6tKLTGlwvDdERQkdRYzHfDdTMxGb
	2bmAWul1dtw/KVRlTPNIS/fq42YI1zTM7HG0sIKE0NUq4ic17xQPC7KiGnodoo1u4r2oPA5BasDTt
	hiXZ9aPTifwFyyqF6zrIjFx4NnCxHkhDotyB/3/5/LqgH+lN7GVmeV6Wh7KZ3HAq/e8CmV07cHzyj
	4U8SVufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJst-0000000A1yS-2yNX;
	Fri, 22 May 2026 07:01:27 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJsq-0000000A1xK-29XG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gW1XBvuiEB5I2x6KNwZzHVasct4ncQR8HK1Z7vt02CY=; b=AY/8ZkgKLG6z/fQkDxdrx2yKH3
	sdOi3yl+Pmzk8S5od/zajZs+Qe92Yqtae+eHavBGzBvAIYT7amYVnc2VEvViY9CPyXiWdz0J+/OQ1
	YwSgzaRi1j+zejMDGwOor/wXkFMBo971voRymQ+ax3js0Izv8HHQYGw2As3OA6vJKqWyYMfoQ0sP+
	tsF23QKdt/aQdEdisRaDTYXdbM8YtE8y2MvbfhzyE4fqhw0dKUWdfz/8tP1AxpoUeaZRFM+iol/ib
	qKtHHfGYl1T+pZon7J2ojZRxy6CD4hMQ5VrJMT9ObwwFEKMvwVKWtTQ7ybGLV9K8zJA4Z6ty9oFjE
	MP32oUiQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQJso-000JiU-0p;
	Fri, 22 May 2026 09:01:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQJsn-000AIT-00;
	Fri, 22 May 2026 09:01:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: mxc: use BIT() macro
Date: Fri, 22 May 2026 09:01:16 +0200
Message-ID: <20260522070118.800671-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
References: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28008/Fri May 22 08:24:46 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_000124_664742_665CAAF5 
X-CRM114-Status: UNSURE (   9.72  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Do not open-code the BIT() macro.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/gpio-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 12f11a6c96653..7e2690d92df6f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -330,13 +330,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= (1 << gpio_idx);
+		port->wakeup_pads |= BIT(gpio_idx);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~(1 << gpio_idx);
+		port->wakeup_pads &= ~BIT(gpio_idx);
 	}
 
 	return ret;
-- 
2.43.0


