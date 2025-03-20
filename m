Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95124C36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9t+AghIDu3YhdnKtuwb/m1eiGg+UJ8M9f9LIHIvdYg=; b=CC8fSVi+wcuQXtrE8nMOMkUOri
	p0ajaDNM1tnLNkty3EnJSgOI9zJgx8bgqxsS3hRvocKSEhoFmG11FN4HfdVgzV8HItc8suNhvPnoJ
	V3XEfU5lCR9zqkoBp/0BtwEn4fuHMhLBC26qN3LT08yJqFl++ng2Zq7dXLjA3mma3z5ePO89meZGq
	h0fcpUAtigXzjId07cluZAH+qG+Ni/EVaTAEQtTqEmY4VixIj/DKBnn0k09UjTolmeXN4DnObz8PP
	qfe3Z0AD/A2SLnr8HfrA6Y8ZnhkiXKleF//2DyQ/05lnBq7XCh7BiZwq982fJexay/M9oW1BlVYYq
	SWGt1/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMC-0000000CbvI-15AV;
	Thu, 20 Mar 2025 16:02:56 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHqB-0000000CY0u-2N4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:29:53 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEDdFE025715;
	Thu, 20 Mar 2025 16:29:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=N9t+AghIDu3YhdnKtuwb/m
	1eiGg+UJ8M9f9LIHIvdYg=; b=qBSWxkQRxYg0v28ApSjg+eMdESIOTCLCqgoPg/
	qUxjEA2xY9jPtKUpF7CM4yJSbxjyzDAA0/2Rl4nAeGVsi+kzLGmm3z/FVL7/IwjJ
	8Yq5I00kcf2c5xGxSQsgYl/x8Gg6CucpPi/JkcJTqoKbGLPNN+1VqVyrZObBTOuA
	+usEAhCY5yHqt0lK9aOaRLom94NLoszPhzXKhXtuaPGIA3FpiNW/MPNSlX2ldT6c
	Rrd504BJ1vkTY53rsxrP5LkXtHMqswFJa6SdS75fCKckTTn2DJ1pQsvTcxpGPo+Q
	DZm++goN/JSoTdj86vHuJ0NsgzFbw/JrBJB6xKy47sFaAVlg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuc8pg4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 16:29:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE1F3400A7;
	Thu, 20 Mar 2025 16:28:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FCDD8140B1;
	Thu, 20 Mar 2025 16:26:11 +0100 (CET)
Received: from localhost (10.48.81.58) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 16:26:10 +0100
From: Cheick Traore <cheick.traore@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Marek Vasut <marex@denx.de>
CC: Cheick Traore <cheick.traore@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] serial: stm32: do not deassert RS485 RTS GPIO prematurely
Date: Thu, 20 Mar 2025 16:25:40 +0100
Message-ID: <20250320152540.709091-1-cheick.traore@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.81.58]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_04,2025-03-20_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082952_072520_442E7FC3 
X-CRM114-Status: GOOD (  10.95  )
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

If stm32_usart_start_tx is called with an empty xmit buffer, RTS GPIO
could be deasserted prematurely, as bytes in TX FIFO are still
transmitting.
So this patch remove rts disable when xmit buffer is empty.

Fixes: d7c76716169d ("serial: stm32: Use TC interrupt to deassert GPIO RTS in RS485 mode")
Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 4c97965ec43b..ad06b760cfca 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -965,10 +965,8 @@ static void stm32_usart_start_tx(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
 
-	if (kfifo_is_empty(&tport->xmit_fifo) && !port->x_char) {
-		stm32_usart_rs485_rts_disable(port);
+	if (kfifo_is_empty(&tport->xmit_fifo) && !port->x_char)
 		return;
-	}
 
 	stm32_usart_rs485_rts_enable(port);
 
-- 
2.34.1


