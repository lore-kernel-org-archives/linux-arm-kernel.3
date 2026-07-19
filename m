Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA4C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SUAt/6zWUy8VxjfuD7LmHF2gwOSZYdtNqcx/e+ByoY=; b=uhAbioLBOo8eD2XrVnVs9c3s3e
	mRXwpGKrboH7u0uQ/4VolgMZ+N0LBoP7DukB2JydFb79ow9+qIo6sMdtgI0p1QmytOWsYpJ5jfdOv
	2w6lw5Uo4+RJzCUtmz5w4ysn2pTXCAiFcT9+fPLcK3bsWM5kyG6l0pIGbAn77gv7/d4ezgXdVfECU
	QYR2Ayl/rFGXDAxM3AyrVTlbRibu5ZtG1omXRe3TxzlQ/Rgajs775hsGO0nwBO7W3Y5lk9CmSYlyz
	NrSid9zJaEewZ2tKj5KHvY6AB7vyQQHw+OT8P5fwnHf9qEePTX+hKso4V8e5JQKB7cwzxhmowO5JN
	hBqW7fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU4H-00000005994-1ftH;
	Sun, 19 Jul 2026 16:08:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU4E-0000000597c-0jRn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:08:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so14335975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784477316; x=1785082116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SUAt/6zWUy8VxjfuD7LmHF2gwOSZYdtNqcx/e+ByoY=;
        b=NXFZJ/Zv58fGZSQb/zpXjzxOuaDg21HTVChNcEqNO6jM7zzngCH6ldymdwR3nZFn2Z
         szOWbaAxe9e0JUz4tNMXEZLRSX9pvWNd8s+WNY1r1aoAFrHj7Xy6ugDmfc6bJJfir7lW
         JHeIzvglZbo2fFuf7x5LZwF0bR/eN4XLPmCP2FQtXcGJX939BnMXsitJbp2PS07VlmEo
         eLFQS/EQ+3w6QFZWPLgA3hH20KGWK5592olVcea2hivh8+aNsZSaLwjN5z85bbyqO1D4
         Xs6jGNE3yjMfLdoua/s4SbLTmwCIQ+/m+QDnHdKT4ADs9VNFdnSfe5iI3ipaS2C73X46
         SzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477316; x=1785082116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SUAt/6zWUy8VxjfuD7LmHF2gwOSZYdtNqcx/e+ByoY=;
        b=pMlqVOd227/pL8yYius0URLWn6VWmbQZtVKF/UHbnOMKs4fnHT4giaBvaJM9zkdfw9
         BVgPpqrplb+Ji5Qs4A+D9AuE9Cpo3lCQ4DWPOTDSCDm23LK1zSMCXSYgi+1bbCjy5kyX
         /A3ZUU7TIfRf7ghAwxVJRAW3QXRGG1fWtNEJEEfmhvshiHXbgwPd4V55QfirY5Cra8fV
         eN/z4mmNZJD2eWw00Ty0vBMVZlWjjBpMIgr3Ei7Lq3asQ9+A6R/BrAVEg3mducrWlO1x
         IdNkWmC3Dq+vpAYMI0li0UGOO0klzFl/AhOygxfXoE373VKKyvWZsJ1XbDYJivS8BIdg
         EkLA==
X-Forwarded-Encrypted: i=1; AHgh+RoFfk328Z7umIe6QbLaqLJ2Fbi6pXgkwqLEDEpBb+uwnKrLuCqDBswBcFBKUNtkWWHuhd+KlMqq5rJTJOefTY7+@lists.infradead.org
X-Gm-Message-State: AOJu0YwE46d9NEgHpYMUUNjLlTFe2gbZ9qmrQ/jCJ2SS52sgZegSeyCB
	rq7Fj1eR2a/rokP3Z8VKMcODuGTvBQe5vtDLX3qxpZzbUikr65KZ2xVA
X-Gm-Gg: AfdE7cngnXD6dHffVzdpVgxX3mxjR2MUB7JhOVvJVOyMPaB3gL8rFlWZ2pWpozt4WN2
	BxyMC0LynT2dixIDfNkgmGRpASKCzR3cf5qoD//xRjGolRk4hIGIFGXdpj9Pb8kXftN8R5xwFAC
	9k0T5UwQjedTXDa79Aetmr/Fe5Nb+MCTJut9nBM6qAFkwsNDGJUst1+4M6tEgyUVzzPHS0wZGYl
	vsAWHgKLVIoMiiHGK1392mOP3eGstV0Vi5Y/HRwlZHNb77TPpUCVHLTNjC8jzk/LGKVV5wQDC1C
	okuDWfatvHNVeEx/UE4hwLlIN99/R/SbnKJQPHYpb+8pDombB3FLRR/tir9U5/cR73EBhEYpnV2
	QsH7AdIC87LMhpdWLD9jexl2qZLnfjmzc1Y86cZTlQ471yAOqWPUGK26mTzUlpiVzh+W6bgeS6Q
	NwuV5LVjtVMHwWSH1i+qqwH7B9HmhjeyuP2KoXv1UvjL6KnemXdv/hZx6GmOJUWR3PMR4hkGTjd
	9XAZwIAlNJkz3S4tYq1di9fS1v/yIc8orIGySZYKH2cHzG/aDP4rVcdPain/XrJyrLxFQwJ9FBU
	/ECi98nFXw==
X-Received: by 2002:a05:600c:4504:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-4954a40bbc8mr113521195e9.27.1784477315903;
        Sun, 19 Jul 2026 09:08:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm223826745e9.12.2026.07.19.09.08.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 09:08:35 -0700 (PDT)
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
Subject: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on probe failure and removal
Date: Sun, 19 Jul 2026 18:08:12 +0200
Message-Id: <20260719160812.35407-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260719160812.35407-1-kmehltretter@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_090838_236198_F73029FC 
X-CRM114-Status: GOOD (  16.29  )
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

imx_uart_probe() stores the port in imx_uart_ports[] before calling
uart_add_one_port() because console setup during that call uses the
table. The entry remains set if uart_add_one_port() fails.
imx_uart_remove() also leaves it set after uart_remove_one_port().

sport is devm-allocated, so a failed probe or unbind frees it while
imx_uart_ports[] still points to it. A later sibling probe can register
the shared console with the old preferred index and dereference the
stale entry in imx_uart_console_setup().

Reproduced on qemu's mcimx6ul-evk by unbinding a sibling UART, unbinding
the console UART and rebinding the sibling:

  BUG: KASAN: slab-use-after-free in imx_uart_console_setup+0xd0/0x3d8
  Read of size 4 at addr c49ad9d4 by task init/1
  Call trace:
   ...
   imx_uart_console_setup from try_enable_preferred_console+0x158/0x1f8
   try_enable_preferred_console from register_console+0x1cc/0x80c
   register_console from serial_core_register_port+0xe58/0xeb0
   ...
  Freed by task 1:
   ...
   devres_release_all+0x100/0x18c
   device_unbind_cleanup+0x38/0xdc
   device_release_driver_internal+0x230/0x288
   unbind_store+0x64/0xa8
   ...

The entry must remain visible while uart_add_one_port() and
uart_remove_one_port() run. Clear it when adding the port fails and
after removing the port. Save the line index before removal because the
uart_port is no longer valid afterward.

The probe-failure cleanup relies on the preceding serial-core change
"serial: core: do fallible allocations before the console can be
registered", which ensures that uart_add_one_port() cannot fail after
registering the console. For complete coverage, both changes should be
backported together.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..617c35772056 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2637,6 +2637,8 @@ static int imx_uart_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sport);
 
 	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	if (ret)
+		imx_uart_ports[sport->port.line] = NULL;
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2647,8 +2649,10 @@ static int imx_uart_probe(struct platform_device *pdev)
 static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
+	unsigned int line = sport->port.line;
 
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[line] = NULL;
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0

