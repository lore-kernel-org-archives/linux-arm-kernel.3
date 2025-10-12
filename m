Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF99CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GE/OOyddqfB9+apRuZ9tIFWH5R6rLuvFiusbbMILXgU=; b=EfB77N5/Ex02Xypj+yhZwX3uGk
	ofeM7xDTJSUttfh/WNwWhrQFuEioXmNVXVNzwY8stXamZVzqwIfeuVSHfTc+XyGCUxEOOsE1ed9pW
	CGjo8/6sgCyGhbumhCFHxOrSO/bk/+kZLTWXMmM6BgA3YH7C6yJicTKYuGgpLjFKWoMly0IC0Qjng
	oVTrcgxL/oy01SjDbh8HM5eVkTBrkhSq5qtBvKHYfLM2himFSUv6J4SuGRDZImNMPHx4zt+EwPcD2
	BG/VDv5eODu3OrhFzJWIeB0qMbUiA69Ftpn8wry38Xph9TmLgEHKC70oo3LGs1+VLNM2xV9BVdiDq
	aJaa3Whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v80Jv-0000000BbEM-0Yvb;
	Sun, 12 Oct 2025 17:57:23 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v80Js-0000000BbD5-12KI;
	Sun, 12 Oct 2025 17:57:21 +0000
Received: from [192.168.2.104] (213.87.133.64) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sun, 12 Oct
 2025 20:56:59 +0300
Message-ID: <3eb40848-3bec-42ca-845b-c66d4b53cedc@omp.ru>
Date: Sun, 12 Oct 2025 20:56:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] serial: 8250_mtk: correct max baud rate in set_termios()
 method
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <lvc-project@linuxtesting.org>, Fedor
 Pchelkin <pchelkin@ispras.ru>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.133.64]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/12/2025 17:43:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 197008 [Oct 12 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 71 0.3.71
 ee78c3da48e828d2b9b16d6d0b31328b8b240a3c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.133.64 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.133.64
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/12/2025 17:46:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/12/2025 3:34:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_105720_297987_DB6E681E 
X-CRM114-Status: UNSURE (   8.80  )
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

Mediatek MT798x datasheets (that I was able to get my hands on) claim
the maximum supported baud rate to be 3 Mbps, while commit 81bb549fdf14
("serial: 8250_mtk: support big baud rate.") claimed it to be 4 Mbps --
however, it then passed undivided port->uartclk to uart_get_baud_rate()
for the maximum baud rate, while the datasheets do mention up to 52 MHz
as the baud clock's frequency.  This means that an integer overflow will
happen (when multiplying the baud variable by 256) if a baud rate higher
than 16777215 bps is passed via termios->c_ospeed. Pass the correct max
baud rate of 3 Mbps or port->uartclk, whichever happens to be less...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo
(I'm unable to use the other repos on git.kernel.org and I have to update
Linus' repo from GitHub).

Changes in version 2:
- changed the approach to the problem (and hence rewrote the description);
- removed "the" article from the subject for brevity.

 drivers/tty/serial/8250/8250_mtk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/tty/serial/8250/8250_mtk.c
===================================================================
--- linux.orig/drivers/tty/serial/8250/8250_mtk.c
+++ linux/drivers/tty/serial/8250/8250_mtk.c
@@ -358,7 +358,7 @@ mtk8250_set_termios(struct uart_port *po
 	 */
 	baud = uart_get_baud_rate(port, termios, old,
 				  port->uartclk / 16 / UART_DIV_MAX,
-				  port->uartclk);
+				  min(3000000U, port->uartclk));
 
 	if (baud < 115200) {
 		serial_port_out(port, MTK_UART_HIGHS, 0x0);

