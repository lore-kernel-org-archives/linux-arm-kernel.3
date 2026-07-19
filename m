Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA05C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTekW+ENVi0Z1ogLAr2oe8Uj7dHDNrRZFKBwQW5P7mc=; b=E6GXYYfD1qJ5Pc1ZkJuY0XUh7R
	yVaH1df6Mot6Fn/RKHqQyqt2dShGr19dB8M2feSawvTqFqFi85MxVgyqWvyX89a8JulNQgbbfFW/3
	4UC9woCIiFD64dg42XNtlS/EiEVSlmomf+KCF9F2k/DQpuMj2WVqJiSRLHMzamkxLTkPOLfHv8XR4
	Mj1M0xocXSIlqqDYd5E6/uIpQfLWVTmXjcOwizw4zGoJRUgRLUUB85i+RbMzg89h71E7bfwmSsvnO
	98ULDUnjMxM/NajUqL0efRG+qqjPr45eYsmpXC432fDCTNnju4gM0lErmuWNK+RBQbgfRiSZfjhHH
	kcFAm2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU4B-0000000596w-1AsE;
	Sun, 19 Jul 2026 16:08:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU45-0000000595J-0niL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:08:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so45662725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784477307; x=1785082107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTekW+ENVi0Z1ogLAr2oe8Uj7dHDNrRZFKBwQW5P7mc=;
        b=SIH0xSlPL5XNhzzqWU/wkFzZlHS79x/Yy0+WqvWev4LAsiM6B0o1UvU6zg83+dNT3W
         SYMF2+3b2JPYKisBJvRIskqq/m1+3Py1DgeSZ/Kwgea6gReNj9iL9byxsCxrfrltPtmr
         iVSs0cDspBVAvY5dIe63M1p9GP+DwE53OJ7fbtVUR95rokp1IIcB5eQrsJhXYfPEU4hR
         tDLqIZ1BF69i3nbkD3c/SHwiG+sKPDMVajEcgiyvSzZLXKlpsmqHI4WoktCbpeZFoKFc
         VBN76yTmTmM/cz1WwLtJvo9hx94JiY+TmnZEFJDg8rPH7xCS+6dguYWztvDUzsmljiM3
         V41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477307; x=1785082107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTekW+ENVi0Z1ogLAr2oe8Uj7dHDNrRZFKBwQW5P7mc=;
        b=AYt4qcEvPB7mRGnb3/dOD7Z8WawX8xNNyJgTdU3vKRw7Bn0wfj1dXyLih36deBO4D+
         I3lclEaNTcKnr+X7GFgSJd/gRHTp/fFm8msJ4KB8nUF80Puy6Y0+4M712Mb+SZSHeIfA
         Q/lU/96Jl3y0ukTCi110rW+hH57F8U8mDhs4p35X4VCcb+tjjfrZuAbcdDhJNFe8LraN
         jrKrpSs1deKoqixhriDRIOE8G/jWn6LC8yJZB4SIrLHI1y34xcQdx30s9UYAG08lNdpN
         K0DH9dc0y+U30RKIkAQTCgjnpiwJmLJoGLoHJSdKTVg5pBJkcX984IgwzApIGkk3l46M
         GqjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyPWtgZVrJq0a5qX1YihXN4ZWUitcy52dkMvJMneYruA3aFmRgaYECncBKNYEj/2sKnRbhHDDJ4wzFLaOpXK3u@lists.infradead.org
X-Gm-Message-State: AOJu0YzR4t+oIfyFZeyYa/PKFkp/NuuQlT7WvGeTFqwpTUXWxY4Jpblm
	Dogyz2Cb8L5h/z0ThqA/r7ZRqdlSybdbSOIh3YDHMxxPgapiLOiF/He/
X-Gm-Gg: AfdE7cksHYV24l4ZEuCQibcKSn/owKqsLoKWEfAngvtycHBWPmThfuhzIaBNj6ML16q
	myT/YsCxWee612A9Ugv5VJXqfTDehP+nALktKgE5os9rD2K8OPIAw9+D0CCwbHZnM3ba9aLdAmt
	9dELqEO862huvo8RTHkVvIsSTArspw5RLi8xLMB40ZWGXZ04t3Xz7jmdLZEDn0+UI/J1TfzzZm/
	cEbE0J94jN1xWUbDkIM5osa88jw9GpxEOC4koFqiWIi2NW01JzpZKpgZn5IYE5b6COPWP9KvaBi
	zu77pbSD74vPSrrquaPk5FsGe/t2o/2YpIijMz6nZu1Zwxy7KB46u4EpXIhdFkH8Ue7dXIuImab
	f+HY1AvpgQKAYkCbrW6PCZW9AVyBNGMYdvNtlZQQNaG6mbm8d3Rhiqs30zqMrqHIrgXfM4Xf3AM
	Pw0p2XLl2leaHugDlfCa2Kv12qK4mjlp8K//EzMQdW5jQ7Sj6OE/yD3adtewgmkMroi+DmhY0Fo
	VC/wl8aGhKDTpaPOGMD4bMw0TKLGhq7Co3mqXkl/FAVNXkp7EMrs2FFDn2LPLBUKwOna3zfB9ga
	GWPVw0orVg==
X-Received: by 2002:a05:600d:6413:10b0:495:573e:1c5a with SMTP id 5b1f17b1804b1-495573e1e23mr29049745e9.13.1784477306815;
        Sun, 19 Jul 2026 09:08:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm223826745e9.12.2026.07.19.09.08.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 09:08:26 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH 1/4] serial: core: do fallible allocations before the console can be registered
Date: Sun, 19 Jul 2026 18:08:09 +0200
Message-Id: <20260719160812.35407-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260719160812.35407-1-kmehltretter@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_090829_257863_9FD8249C 
X-CRM114-Status: GOOD (  19.89  )
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
uart_configure_port() has already registered the port's console. If
that allocation fails, the function returns -ENOMEM with the console
still registered, and the driver's probe error path then tears down
the port state the console callbacks depend on.

Reproduced with fault injection on qemu's raspi1ap board. Failing the
tty_groups allocation during a PL011 sysfs bind makes
uart_add_one_port() return -ENOMEM. pl011_register_port() then clears
amba_ports[0], but ttyAMA0 remains registered as a console. The nbcon
printer thread dereferences the NULL entry and oopses:

  Unhandled fault: page domain fault (0x01b) at 0x00000178
  CPU: 0 UID: 0 PID: 43 Comm: pr/ttyAMA0 Not tainted 7.2.0-rc3+ #1
  PC is at pl011_console_write_thread+0x2c/0x168

This is not PL011-specific: the failing allocation is in serial core,
after uart_configure_port() has registered the console, so any console
UART driver is exposed. On i.MX the retained console references a
devm-allocated port that the failed probe frees, causing a
use-after-free. Reproduced on qemu's mcimx6ul-evk using the same
fail-nth harness under KASAN:

  BUG: KASAN: slab-use-after-free in imx_uart_console_write_thread+0x50/0x278
  Read of size 4 at addr c5246048 by task pr/ttymxc0/63
   imx_uart_console_write_thread from nbcon_emit_next_record+0x360/0x50c
   nbcon_emit_next_record from nbcon_emit_one+0x140/0x184
  Allocated by task 1:
   devm_kmalloc from imx_uart_probe+0x90/0xa5c
  Freed by task 1:
   devres_release_all from device_unbind_cleanup+0x38/0xdc
   device_unbind_cleanup from really_probe+0x2b4/0x388

The pre-existing kasprintf() failure path has a related problem: it
returns with state->uart_port already pointing at a port whose probe
is about to unwind and free it.

Reorder the function so the uport->name and uport->tty_groups
allocations both happen before the port is linked into the driver
state table and before uart_configure_port() registers the console:

 1. Allocate uport->name.
 2. Allocate the tty_groups array with room for three entries
    unconditionally (serial core group, optional driver group, NULL
    terminator). The optional group cannot be examined at this point:
    config_port() may only supply uport->attr_group during
    uart_configure_port(), e.g. 8250 sets it after autodetection.
 3. Only then link the port into the driver state table and run
    uart_configure_port().
 4. Fill in the optional attr_group slot afterwards.

A fail-nth sweep over the whole bind path on both boards left the
console unregistered after every failed bind and did not reproduce the
i.MX use-after-free.

Fixes: 266dcff03eed ("Serial: allow port drivers to have a default attribute group")
Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struct")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/serial_core.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..887b1dd80ad2 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3056,7 +3056,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
-	int num_groups;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3068,6 +3067,23 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
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
+		uport->name = NULL;
+		return -ENOMEM;
+	}
+	uport->tty_groups[0] = &tty_dev_attr_group;
+
 	/* Link the port to the driver state table and vice versa */
 	atomic_set(&state->refcount, 1);
 	init_waitqueue_head(&state->remove_wait);
@@ -3084,10 +3100,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	state->pm_state = UART_PM_STATE_UNDEFINED;
 	uart_port_set_cons(uport, drv->cons);
 	uport->minor = drv->tty_driver->minor_start + uport->line;
-	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
-				drv->tty_driver->name_base + uport->line);
-	if (!uport->name)
-		return -ENOMEM;
 
 	if (uport->cons && uport->dev)
 		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
@@ -3102,15 +3114,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 
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

