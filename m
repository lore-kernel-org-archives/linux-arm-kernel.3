Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D761606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KL85GPew;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrbN85Oq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ht3eHe4EzKYxFFLbnOBIrMS9lRut2mY+uEg1RLF4XUA=; b=KL85GPewaOwfBM
	d7w0t7Ujygwn8ROkxxerENFHVYB4QxXxvIpqcfpQUeODK0FXBhnJtniMC/p90NJPQAl/LCPDNqsq5
	neM7sCF/HdIcjo6WVw9LX3VZFbN5B9XDFnXLrpGMiIkDqrAneJr2myPPWL4bFD03MHgpOfI4hY228
	xcMgv1ZURx1VBqh92g4xYF/d5ag4VvXB0+SWpsnOqQ4CJ1PS0wK/VR7Lo7l7ifnW3ONTn0BUqgLuG
	9f+NESy2k6RXg06J7TorBBvDoYu4sVejQM0wOuWjKvQCY/Q87UrO3TDrC0fjoJ65NYEs1cwrPXc24
	ierGZRR1YuwYOXqRVZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCaq-0000000DVge-159a;
	Sat, 31 Oct 2026 17:10:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCal-0000000DVfL-20L5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72A3E43B50;
	Sat, 31 Oct 2026 17:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CB91F000C1;
	Sat, 31 Oct 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466606;
	bh=Ht3eHe4EzKYxFFLbnOBIrMS9lRut2mY+uEg1RLF4XUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KrbN85OqY1lCsidheCnNJolG+HjnxA3FM3VFV1wn90pXbtHW7nKFH6nms0CY0E5Vu
	 QsJ2zC7Cyb0Ez6cVoCm7nX4gF94MWLsJxjPF65GEZKV9oWAvmDiNMVVfMCBELi26PZ
	 5dMzz0TOCAu8uYaGbPWLnaj8ZcOCRHjL2ukFnq7EdpJzNiaaemdYoCaq3OiuL7cIAp
	 i5yW5pb0V6tUzX8GfRGTzWH8AA/FWOYg4qDco0YnDyVj6yeI1SwTEx/5ajQJn+ONnV
	 y7ZCyasozMg/63Ze5mZisuNx8VL4T1Im5njy1NWu3FeF8av2C0TsanGNM7WZm237o0
	 TH7jiFuraDKGA==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 31 Oct 2026 18:09:46 +0100
Subject: [PATCH 2/5] serial: fsl_lpuart: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-2-7bdadcadc4dd@kernel.org>
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=1119;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=2oCMjGtbSQHN64VRa5dtTxB0LFjvNWUjbw8MWTfVbOY=;
 b=cLUcxGR7/9wLAmRMhc+sl8k/QOn4ZFAiZc86JXTxphHlomh6NKpgAKNnKN3vaCWkNhcZAIwl1
 Nmfj7RRHhi8ANbairlQHfGVoH2TDp+O673CHwBph0L5tTNU1LJtd1Ht
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
 drivers/tty/serial/fsl_lpuart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..411e14151a50 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -2987,7 +2987,6 @@ static int lpuart_probe(struct platform_device *pdev)
 failed_reset:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	lpuart_disable_clks(sport);
 	return ret;
 }
@@ -3008,7 +3007,6 @@ static void lpuart_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int lpuart_runtime_suspend(struct device *dev)

-- 
2.56.0


