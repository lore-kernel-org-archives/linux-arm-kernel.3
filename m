Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18778CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mgtZsM4/gv/n/MCIHJaPiEDs0QtkD5yuqCAVz5GbCoM=; b=e+Gtzx9Jy+f1jRz9WAirNAlN6A
	sZa4O84cHoFpBIMNY2HpO9padpG/XBiTAUnxEbEDiRXKwfjKp4vUI120C6x+lDNN2a14CpkudeI0p
	8GEbn4Ye1Zeucjf09OkP8Tmydh1GtWrcC1sJhTYL8mmMa0QEDeAmfHxvUL/Ckld6BLX+mQDGJ8HzD
	Ln18fx9Ym7suAVNLGjCJ79vMbRkZL9E0tWGkwc48H5zerjQU62lNst3VOX55XhGdV/FH/3X9qYcot
	5azXAxa3DmaWK5m2ypWXGh1DDgb4GV4yNLMyWEVGA14SPx9ca+bfPLRQyFXM3PClDnl/csaRAYc2x
	c5J4WIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhh0-00000005s1p-1D5O;
	Sat, 06 Sep 2025 01:26:14 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuciS-00000004MHe-3zIQ;
	Fri, 05 Sep 2025 20:07:27 +0000
Received: from [192.168.2.102] (213.87.137.226) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 5 Sep
 2025 23:07:13 +0300
Message-ID: <bd8764c5-c43c-4bca-996d-65367805ad5a@omp.ru>
Date: Fri, 5 Sep 2025 23:07:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] serial: 8250_mtk: correct max baud rate in the set_termios()
 method
Organization: Open Mobile Platform
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.137.226]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/05/2025 19:27:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196074 [Sep 05 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.137.226
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/05/2025 19:35:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/5/2025 6:47:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_130724_998576_3C859919 
X-CRM114-Status: UNSURE (   8.27  )
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

As is obvious from the code calculating the divisor in the set_termios()
method, the Mediatek UART driver uses 256-time oversampling for the high
baud rates, so passing port->uartclk to uart_get_baud_rate() for the max
acceptable baud rate makes no sense, we should divide by 256 first (this
should also prevent overflow when some arbitrary baud rate is passed via
termios->c_ospeed)...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo.

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
+				  port->uartclk / 256);
 
 	if (baud < 115200) {
 		serial_port_out(port, MTK_UART_HIGHS, 0x0);

