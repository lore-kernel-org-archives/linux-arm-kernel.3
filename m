Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D312606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HX8vZ7mt;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UWuKA/lD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kFcT8W+2UTHSKifaLK0InKSMUNNzp4iqDnKoB68nIR0=; b=HX8vZ7mt5Kpooy
	//sOwJ7lVgzgkvC0Dpjba+s03wyyoun4FU8r86phFuW92aWQlIHT4/ihbupfA0AAPrM6mkb4U+1jI
	MWPuXFHZr/C2Zz3TO9pHSKlbht7t2Gr9h1P7dLM5YK51HCxk65Mxj2OAEr+z1SWYrAUsZovJp3XeR
	z578/UzOlXKMuJJaHfsPzPXLKQUXcDUdRMJ3yUPGxIPh9pyB4xiJYKCaxQHJlsERKGRqVPmZ7CYqC
	XenLUlgsHz3h2xisxJlAbJ13bLWqck9FUv4gvT4UAXXn0uREwvMmNjURtVPPrGuWo7GpdUmA3dyQY
	NhOAOMQYK5gGLDVTTexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2f5-00000000ksQ-1A7P;
	Tue, 03 Nov 2026 00:46:03 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2f1-00000000kqZ-2s7T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:46:02 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 533e14b12;
	Tue, 3 Nov 2026 08:45:51 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tushar Behera <tushar.behera@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/2] tty: serial: samsung: Fix potential NULL dereference on removal
Date: Tue,  3 Nov 2026 08:45:47 +0800
Message-ID: <20261103-cmc-tty-2-683dcb126b@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103-cmc-tty-0-f5f5ec0841@mail.sdu.edu.cn>
References: <20261103-cmc-tty-0-f5f5ec0841@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19ede9a5903a1kunm33c27c80118226
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0NDVh0ZSU1JHxlJQh9ITFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=UWuKA/lDrlecki3KggJEW/DWLReYqRDsN4s6bcrPtfGTOAOgtzyZa0lINfL2C2JM5ST6rqgO8AV9w47NTmnmF2Dl7s5WNwJ3s1QWYgtCppTF8WU+7Byc9N4W1gV95MAm6HFImK5DRtO2jV0j/RX3pl+IsyYpWXdBMKyig9f7xTM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=kFcT8W+2UTHSKifaLK0InKSMUNNzp4iqDnKoB68nIR0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_164600_479918_CC106A82 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Removing one port unregisters the shared UART driver and clears its
state even when other ports remain registered. Removing another port
then dereferences the cleared state.

Keep the UART driver registered until all platform devices are removed
at module exit. Retain registration on first probe.

This issue was found by our static analysis tool under development.

Fixes: 6f134c3c7703 ("serial: samsung: Move uart_register_driver call to device probe")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the affected object with arm64 defconfig and LLVM
(W=1). No hardware or fault-injection testing was performed.

 drivers/tty/serial/samsung_tty.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..9768effbd39f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2058,7 +2058,6 @@ static void s3c24xx_serial_remove(struct platform_device *dev)
 	if (port)
 		uart_remove_one_port(&s3c24xx_uart_drv, port);
 
-	uart_unregister_driver(&s3c24xx_uart_drv);
 }
 
 /* UART power management code */
@@ -2684,6 +2683,8 @@ static int __init samsung_serial_init(void)
 static void __exit samsung_serial_exit(void)
 {
 	platform_driver_unregister(&samsung_serial_driver);
+	if (s3c24xx_uart_drv.state)
+		uart_unregister_driver(&s3c24xx_uart_drv);
 	s3c24xx_serial_unregister_console();
 }
 
-- 
2.43.0


