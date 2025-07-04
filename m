Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EC2C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9TxeK8Dq6tyJAeMzkgqCJW3x4U8QmHxW4w/kBtFS1o=; b=b4B0fvu/BkSo+ODoW/DNuC3fQX
	g38ppc8KQEbrAXM5xV9cHwqq/rgnDeRxhQokRpPhsROgr6WQYa3/YemJvPXE/lK2+NJYZ0Vo12UsZ
	7Prnu3Cp82cw9DtFyFBGx1coJ+MyAEi+E+uKX0px6Veu8paMexe5aTytxADtRAHf00v0wAMAyC0nV
	FdwytsCL+q0AwNBorIfrvbRUoh5qWgVNWBgigZ7OVO6MocSP7glBvzURt1XBVmsK1Dv+cv+3koQHg
	38RUUlV7Lw2RLqan0RskD/VSUV9C/kbAv1DXmHDt23P9wNDVCLhRH8Ne/l/ESpBBm1QPS3qKQ1yoF
	eDxWO+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbxG-0000000DlXa-1Lmr;
	Fri, 04 Jul 2025 08:39:34 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbGI-0000000DdGu-3W5l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615711; x=1783151711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lzOBZYTBavsi2Z34vHlXoBrBjY0eNs9he5kt9Nk32kM=;
  b=CBBFk0HqrYVb5uE6y3xV33uInHE1/E5p8VLG4XacZIZUurNt05aq7Cih
   Nx4qcq03OF14aw7yEBE+Wr7S6yeFdcy77OhFQzKraYHeIEEjQk0IpvcT5
   MbhSUXRG+NlKqn/PuzkxxjjO2dQWagssFL90M9/RUyb+oA4a4jJRxmRUG
   /N49U95XPqKl/mS4tuRjkA3mpoqGD5forvX7/Y5TCApiSFPqbWswwZ8fQ
   MUD5jpvlsw7AIHj2uyHzOXArmxOQV0vRzULp9M/jTxMSekNlkEcJEoAXh
   s4sf4enhAoH8YNzSSeKfZJsEtROSIKMQfmOtUQVRaVzwwE83pXs6LwBNZ
   g==;
X-CSE-ConnectionGUID: RuSol4TaTzO+O9ypKC5EYg==
X-CSE-MsgGUID: 6GPlriZfQYexN+f1bqVoDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194299"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
X-CSE-ConnectionGUID: DyR3FIjPRPqQIAzc1rL3Jw==
X-CSE-MsgGUID: qJCH8EhASNmI9Sen5dGyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616672"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:55 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id CFDC8447EB;
	Fri,  4 Jul 2025 10:54:52 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Petr Mladek <pmladek@suse.com>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sean Anderson <sean.anderson@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 66/80] serial: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:52 +0300
Message-Id: <20250704075452.3222201-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005510_940922_B42C560E 
X-CRM114-Status: GOOD (  13.93  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/tty/serial/8250/8250_omap.c | 9 ---------
 drivers/tty/serial/8250/8250_port.c | 2 --
 drivers/tty/serial/fsl_lpuart.c     | 1 -
 drivers/tty/serial/serial_core.c    | 1 -
 drivers/tty/serial/uartlite.c       | 2 --
 drivers/tty/serial/xilinx_uartps.c  | 1 -
 6 files changed, 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 6707f55bdbe7..091afea71b95 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -207,7 +207,6 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	__omap8250_set_mctrl(port, mctrl);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 }
 
@@ -516,7 +515,6 @@ static void omap_8250_set_termios(struct uart_port *port,
 	omap8250_restore_regs(up);
 
 	uart_port_unlock_irq(&up->port);
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 
 	/* calculate wakeup latency constraint */
@@ -554,7 +552,6 @@ static void omap_8250_pm(struct uart_port *port, unsigned int state,
 
 	uart_port_unlock_irq(port);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 }
 
@@ -773,7 +770,6 @@ static int omap_8250_startup(struct uart_port *port)
 
 	enable_irq(port->irq);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 	return 0;
 }
@@ -811,7 +807,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 		serial_out(up, UART_LCR, up->lcr & ~UART_LCR_SBC);
 	serial_out(up, UART_FCR, UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 }
 
@@ -827,7 +822,6 @@ static void omap_8250_throttle(struct uart_port *port)
 	priv->throttled = true;
 	uart_port_unlock_irqrestore(port, flags);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 }
 
@@ -848,7 +842,6 @@ static void omap_8250_unthrottle(struct uart_port *port)
 	serial_out(up, UART_IER, up->ier);
 	uart_port_unlock_irqrestore(port, flags);
 
-	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 }
 
@@ -1594,7 +1587,6 @@ static int omap8250_probe(struct platform_device *pdev)
 		goto err;
 	}
 	priv->line = ret;
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	return 0;
 err:
@@ -1682,7 +1674,6 @@ static int omap8250_resume(struct device *dev)
 
 	serial8250_resume_port(priv->line);
 	/* Paired with pm_runtime_resume_and_get() in omap8250_suspend() */
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 7eddcab318b4..22ad70117c44 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -519,7 +519,6 @@ static void serial8250_rpm_put(struct uart_8250_port *p)
 {
 	if (!(p->capabilities & UART_CAP_RPM))
 		return;
-	pm_runtime_mark_last_busy(p->port.dev);
 	pm_runtime_put_autosuspend(p->port.dev);
 }
 
@@ -659,7 +658,6 @@ static void serial8250_rpm_put_tx(struct uart_8250_port *p)
 	rpm_active = xchg(&p->rpm_tx_active, 0);
 	if (!rpm_active)
 		return;
-	pm_runtime_mark_last_busy(p->port.dev);
 	pm_runtime_put_autosuspend(p->port.dev);
 }
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c9519e649e82..79050a42cd1b 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -825,7 +825,6 @@ lpuart_uart_pm(struct uart_port *port, unsigned int state, unsigned int oldstate
 {
 	switch (state) {
 	case UART_PM_STATE_OFF:
-		pm_runtime_mark_last_busy(port->dev);
 		pm_runtime_put_autosuspend(port->dev);
 		break;
 	default:
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 86d404d649a3..f9fc9afcd845 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -159,7 +159,6 @@ static void __uart_start(struct uart_state *state)
 	 */
 	if (!pm_runtime_enabled(port->dev) || pm_runtime_active(&port_dev->dev))
 		port->ops->start_tx(port);
-	pm_runtime_mark_last_busy(&port_dev->dev);
 	pm_runtime_put_autosuspend(&port_dev->dev);
 }
 
diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 39c1fd1ff9ce..c21cd5f5be27 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -422,7 +422,6 @@ static void ulite_pm(struct uart_port *port, unsigned int state,
 		if (ret < 0)
 			dev_err(port->dev, "Failed to enable clocks\n");
 	} else {
-		pm_runtime_mark_last_busy(port->dev);
 		pm_runtime_put_autosuspend(port->dev);
 	}
 }
@@ -882,7 +881,6 @@ static int ulite_probe(struct platform_device *pdev)
 
 	ret = ulite_assign(&pdev->dev, id, res->start, irq, pdata);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index fe457bf1e15b..36afa2a8f158 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1240,7 +1240,6 @@ static void cdns_uart_pm(struct uart_port *port, unsigned int state,
 {
 	switch (state) {
 	case UART_PM_STATE_OFF:
-		pm_runtime_mark_last_busy(port->dev);
 		pm_runtime_put_autosuspend(port->dev);
 		break;
 	default:
-- 
2.39.5


