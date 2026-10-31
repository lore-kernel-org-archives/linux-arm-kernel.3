Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A86606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XjAOqw/1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=doJgM/Rk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V3lTSEBxFP82FPR6J1VxiQBr8pSV2kirBbaP84zkoiA=; b=XjAOqw/1BP7tln
	qflg5/SN4V+wm69wUvasZRD8JkC9x9Z05957nq0YGJjq+SdjNl/71BJPRdP7d72CkEzNKakzeyO9P
	ywd/pY21lLE/P/0pc8GqTKowgvgah4cGn4uCfBvTpbMlaceprNG9O4tnFZSgMYuEXhYpUGsgZExek
	I0fWFMjZpBRzFPpEg7vpVTKeOUpC5Zf8SkdgG+zrxXk5qZrZSk+Gc6KJcyUc+bkLKRQpvSAQQpGN5
	geTVJ0/nv7nvUmzijonvtubAXvMMHdjwpkbKt/LCOHvOOUte0NjEUIpP63nABDTKwzZWWlOhFcG1f
	yx+LRerLtlmWC5MachMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCaq-0000000DVh6-1m4P;
	Sat, 31 Oct 2026 17:10:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCan-0000000DVfl-1lkU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5AF643B50;
	Sat, 31 Oct 2026 17:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF70A1F0093A;
	Sat, 31 Oct 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466608;
	bh=V3lTSEBxFP82FPR6J1VxiQBr8pSV2kirBbaP84zkoiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=doJgM/RkBgBP720Hvu+93fMsfl4ev+06fwYvoa8PuIaMwgf8oNqvt852DYrgGzR5Z
	 zlYuSnivsPYsF4wB4xGcTgNoZTJzqGZz/w1rCRlaaVEwOuKU/dLVccJc+T07QY9odZ
	 H7FpP8vA5wNFqgVu41lks+t7l6aTNPzNRE/5XElSHXM9GVUU/Cfms9zJikf3AA0yOk
	 W2egmR8n1VlZCjLyqfg6RLteZxkCW6rwnouG75i/0iJ0Xl/uMaF98XUBG1avEmYK0l
	 I2BvK9QIsl5+TZG+OeGNut5va2PRLuyu5TJEjATK1ea0EZvgJ3dH/MfNvEgO+3zhoW
	 sbRHyu4CFc7uQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 31 Oct 2026 18:09:47 +0100
Subject: [PATCH 3/5] serial: xilinx_uartps: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-3-7bdadcadc4dd@kernel.org>
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=1272;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=7bLXE1zIwkiAxLH9OQkboodAxW/t1137Dl+DuqntUDY=;
 b=u486STetJaM/0XNEuOBsXII7plPuhrm3fG///hkv3oZLCIYdWHZt4R87hAW4xfeo9anmOsj+D
 dinCV8/6FqNA+XBnwW39R7v158kvZlFJgLLe4qh8MhbilNA1ArZqy61
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/tty/serial/xilinx_uartps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a072b75dbaf2..5901517cce5a 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1844,7 +1844,6 @@ static int cdns_uart_probe(struct platform_device *pdev)
 err_out_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 err_out_clk_notifier:
 #ifdef CONFIG_COMMON_CLK
 	clk_notifier_unregister(cdns_uart_data->uartclk,
@@ -1880,7 +1879,6 @@ static void cdns_uart_remove(struct platform_device *pdev)
 	clk_disable_unprepare(cdns_uart_data->pclk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 
 #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE

-- 
2.56.0


