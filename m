Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA2D609AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OTkMzslZuFHuKZCP/n42zZM3gYCt1QyOVGH3TZnQcqk=; b=Nok2C2GEVeH9541UQUIsaZ39H9
	XCtYAXvhBH7tknArbVsRV+JCwraA2U6QAdbDhVIHzljwm2/Qe5CeHoKjtWSzgR/cDYEEHg8crxT7V
	0C8eSFCp9gtuuT7mo9TN3HTOHDc/l+p9vp0qXjBHB3QTJhE2s3bR785Tt0dcOb5NfVo0p1Aoca9RB
	txWCllGXANSlaW5ljYU9D1o25yIQMIU7RIOsoVU96PAWLYQlxZbtxWT1LX+MK/1nMFMFKVUNkMPaj
	r937V8bamINMw+hjaYhCtveJLk2rnFi7WQC0g1T6tS3D4fXsGB+N/nFIHv2CDzvSlByIpmpCocPIO
	neiRhaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWxw-00000005RQ7-0xdl;
	Tue, 16 Dec 2025 15:27:57 +0000
Received: from mail.elsta.tech ([194.150.96.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWxs-00000005RPb-1VXC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:27:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id 8E9B88C00C4;
	Tue, 16 Dec 2025 16:27:39 +0100 (CET)
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10032) with ESMTP
 id 7ZJ2rgH8-Rks; Tue, 16 Dec 2025 16:27:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id 4DECE8C00E1;
	Tue, 16 Dec 2025 16:27:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.elsta.tech 4DECE8C00E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elsta.tech;
	s=0883730E-C77C-11E9-9DA4-0BE9876769AA; t=1765898859;
	bh=OTkMzslZuFHuKZCP/n42zZM3gYCt1QyOVGH3TZnQcqk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=D5qvq80evHvKNB6XacBcIQrwESQjeC3JNVNwksjpeA28GJx1iqBWlyLuLYIw44YFp
	 SD8VnDCk2CxJ09528689D+QJoLvxNAzPEbs93tWf5v2mUJbigpbB9JZI4D2x2DRdmW
	 wA3ygPzFVMtFNQiAQCxSg1WyjXH2SqWW7zR5MQQ8BPLI0kVjAkhBsYExxOIipQL9iI
	 QS8M8Hk5R86s/zghwZk7c8jHoVBi+be52DyPTQHRXOlMTZpGfsZ4n6nzmqiHmqTXGH
	 c1POyMCh7t0NY55pgAw2m6ZWg+n5kcQEdZzcYRKk72WSoqmtE/tQ1W6ILf7CKjbLuE
	 +1GF9cRQRlA9w==
X-Virus-Scanned: amavis at elsta.tech
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10026) with ESMTP
 id HkQ4IHc0qYHm; Tue, 16 Dec 2025 16:27:39 +0100 (CET)
Received: from dev-VirtualBox.elsta-tech.lan (unknown [172.31.0.125])
	by mail.elsta.tech (Postfix) with ESMTPSA id 2017B8C00C4;
	Tue, 16 Dec 2025 16:27:39 +0100 (CET)
From: "j.turek" <jakub.turek@elsta.tech>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: michal.simek@amd.com,
	namcao@linutronix.de,
	tglx@linutronix.de,
	zack.rusin@broadcom.com,
	sean.anderson@linux.dev,
	hshah@axiado.com,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"j.turek" <jakub.turek@elsta.tech>
Subject: [PATCH] serial: xilinx_uartps: fix rs485 initialization at boot
Date: Tue, 16 Dec 2025 16:26:41 +0100
Message-Id: <20251216152641.196221-1-jakub.turek@elsta.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_072752_885386_4E10203B 
X-CRM114-Status: GOOD (  11.12  )
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

When 'linux,rs485-enabled-at-boot-time;' property is enabled in device-tr=
ee
and there is no rts-gpio defined there is NULL pointer dereference in
function 'cdns_rts_gpio_enable' because 'cdns_uart->port->membase' pointe=
r
is not set at this point

Signed-off-by: Jakub Turek <jakub.turek@elsta.tech>

Fixes: fccc9d9233f9 ("tty: serial: uartps: Add rs485 support to uartps dr=
iver")
---
 drivers/tty/serial/xilinx_uartps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xili=
nx_uartps.c
index c793fc74c26b..1e4d54fd5762 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1816,8 +1816,6 @@ static int cdns_uart_probe(struct platform_device *=
pdev)
 		console_port =3D port;
 	}
 #endif
-	if (cdns_uart_data->port->rs485.flags & SER_RS485_ENABLED)
-		cdns_rs485_rx_setup(cdns_uart_data);
=20
 	rc =3D uart_add_one_port(&cdns_uart_uart_driver, port);
 	if (rc) {
@@ -1826,6 +1824,9 @@ static int cdns_uart_probe(struct platform_device *=
pdev)
 		goto err_out_pm_disable;
 	}
=20
+	if (cdns_uart_data->port->rs485.flags & SER_RS485_ENABLED)
+		cdns_rs485_rx_setup(cdns_uart_data);
+
 #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE
 	/* This is not port which is used for console that's why clean it up */
 	if (console_port =3D=3D port &&
--=20
2.34.1


