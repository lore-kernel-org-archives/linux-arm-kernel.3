Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGoMcLg7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXr8VFkh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W5pbACeLmZxOgIPqMZmA7R0XTuCDvCRAkd65xmmHjps=; b=gGoMcLg7fw8sYr
	3avEWizhrWCkFpxEIcUUv6pXXmg35J9h25cvBXTWbfDz2gpZEajDNVLedGkSRb/m57D0rSmtgI3ep
	HUVI3y+vaqLygQr3vJs7USxkHZZRDg6X5Y9UxSMq7EMM/7tQVsqPzwGLmwiktIP5bfGS+vsnL9fk6
	ZxoHkKykwu2b0sZmag94aOettSJ5ncDQjEsgZgAXut+rjg46OMqXDMlU7g7sJnRQk/DWR9ZneGw0d
	GFhdrwU7s6ysXzbdeJh7+5EmUAUbTgnzVdbwjyXJUGd7VeTnSmsmQtChfgosdZL9hTqPe7MSzt4hZ
	/LO6jctvtwFqVwM1qtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCaq-0000000DVgJ-0cSD;
	Sat, 31 Oct 2026 17:10:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCai-0000000DVeq-3YLB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B11F6061D;
	Sat, 31 Oct 2026 17:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172B71F00919;
	Sat, 31 Oct 2026 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466604;
	bh=W5pbACeLmZxOgIPqMZmA7R0XTuCDvCRAkd65xmmHjps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WXr8VFkhseeAagtDUGfC8bF92PTIxvdLT1NpPWhdA6T92SXjh9DnkGQlCi2zQ+a9H
	 JNCyE9o3HBjdPGWUwzIXbGfG+t5/yHTYmdhfzBqGcPIh6iHBuZBpyD1hPrZPlkDbUk
	 vgs6B/XD7wrFwVr21G+r60HjC4ATEbb7Mi31RmijnmbEB6a+CuQeI+e2tLnfpC2bh8
	 yl9tUDAXDV2A23OMP7x6HzHa53vCXkS6Py4V8RQFAZX/NNVwfaM7GJN97WOrOMLHLH
	 kS86fu1ufMo8mwo0C9IXofNdMrAz2Dt+Jqct6s3Bmu3c3nWfqFHmAqyiAuK53Zeh/2
	 yU1xRmfdxtJWA==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 31 Oct 2026 18:09:45 +0100
Subject: [PATCH 1/5] serial: 8250_omap: remove redunant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-1-7bdadcadc4dd@kernel.org>
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=1219;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=MJ3P6Nb034L4X0qZnePc1m99BfQRbCOFnwq53NCQfmI=;
 b=DI3XA8FRtJKLJpa/DleKCsuR9oBj0b1rJwiZPWuwjd8XYHTP4/yIKWfmLw5WgkzESw1XV7FOj
 kENn+QC1qGMCQsE1TkWHJ4Im38hNr5AsK3eqBGqljRoLaz+oQcR71LN
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS,T_SPF_HELO_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/tty/serial/8250/8250_omap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 29a203ed93fd..5d6911b1a2b0 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1608,7 +1608,6 @@ static int omap8250_probe(struct platform_device *pdev)
 	return 0;
 err:
 	dev_pm_clear_wake_irq(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	flush_work(&priv->qos_work);
 	pm_runtime_disable(&pdev->dev);
@@ -1631,7 +1630,6 @@ static void omap8250_remove(struct platform_device *pdev)
 	serial8250_unregister_port(up);
 	priv->uport = NULL;
 	dev_pm_clear_wake_irq(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	flush_work(&priv->qos_work);
 	pm_runtime_disable(&pdev->dev);

-- 
2.56.0


