Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dA1sVMAE;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CuPFDcOQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZjG2IwYnhcLEtk23bjX0dkfBTdvYZcrIyrdACv8Msk=; b=dA1sVMAEsvLKVGFXUln5uQ/Rui
	LKkno+ACM/lBZ4xzXlj7J0nqmUy5rNexQ+2UPaWHyji/orAhK/MbL4qiabmiFgLPKwpOvRKA4f+t/
	cs5PxhUGJPfnHNMgGnQs5BJVp4BoVg9qkODNe0ojGCTdcA8r/qbPk5wdegCBwjvVk5nICCWUFtluT
	hgnh4+qHv+7a018YHcpBLhNVmfVoSjwBv855w/M7v3kFQixtvzMeO3CVzyQRW64xwrJGhnl3iemGn
	mG6+SPYkx1Or1w17+N3KGSuEiBSQtST90xfMQ+/9UEaNE/1qfhzIpJpCRDS3KztjVTpw+ptC4u4tx
	mfLVsrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIulv-00000008MvJ-1E0O;
	Mon, 19 Oct 2026 21:19:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIulo-00000008MuJ-13rf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 027AC4E4127B;
	Mon, 19 Oct 2026 21:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B6D60582;
	Mon, 19 Oct 2026 21:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CF0310328C22;
	Mon, 19 Oct 2026 23:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444785; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yZjG2IwYnhcLEtk23bjX0dkfBTdvYZcrIyrdACv8Msk=;
	b=CuPFDcOQ+v4qI8I69v9WKpehVrcXLlDsov6Zg7+hr/Wg0OdoUdbjpFWNy4cf+sIfC87wGl
	L7QzMSstyd7xIlyKRfpiZ7TLdwKb3AqCG7FZOEjpwEeALbRZiG/G9uPZrx7KCdoH/XWp8x
	QiDDhYZNqPZJBhPIT0U6aENC6bB3Vg8UveJiwM51/YveZ78F0Hkioz3mU5yu8lxxM7gzmH
	+dNZJZIhr25yh0ywUa+nWoe+M6N9MappPKkqCLv5ybCCrR3jCTBcDsu0WZ7S4YUJwewrvd
	itMnhEayIBY8SOWdhX93S7OmHYBcIkq+Whxx8rXEXXFPKzpbeL2REvWWSlPWbg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/19] rtc: stm32: use guard
Date: Mon, 19 Oct 2026 23:18:19 +0200
Message-ID: <20261019211827.126262-18-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
References: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_141948_425842_BFEE24FA 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use guard() to simplify locking

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-stm32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..1c4e4bd7afe4 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -465,7 +465,7 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 	const struct stm32_rtc_events *evts = &rtc->data->events;
 	unsigned int status, cr;
 
-	rtc_lock(rtc->rtc_dev);
+	guard(rtc_ops)(rtc->rtc_dev);
 
 	status = readl_relaxed(rtc->base + regs->sr);
 	cr = readl_relaxed(rtc->base + regs->cr);
@@ -482,8 +482,6 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 		stm32_rtc_clear_event_flags(rtc, evts->alra);
 	}
 
-	rtc_unlock(rtc->rtc_dev);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.56.0


