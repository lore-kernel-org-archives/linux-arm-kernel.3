Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Id/2Ge87;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DztTtqai
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aY/ovidFv5oOqnqGNioiPlwdlj0XKYaRdg6c0us2fg=; b=Id/2Ge876tRwYH3ngjJidscy/a
	s3D2KdcC0WeRLDoKsP1TpSgY1pS74ILPfK4cBtzo6HZUarelZlryuF23QMT78uyuJWIF0E45S3etC
	Y5FJzBE60nzMgLF9g7uY0dl7LKQdAxIc4vOInrECL+KnPYFa8ttzMM4VSFPq89r1htyX3EuoJgMdX
	WTusKkfoELPnrsp+xG1XiO0FjSOx0HAdHvIjICQ3iH+ikzD+Uk+y/D0YgTMj8P94NxyWbaCWtvf7j
	bbkF1X31wWsTcmFOd8Pw0G+656K0SKB/lUro7CmDi6wLNcx2Xhe2m0napkJvfE6Vul6zHtOZzygR9
	A+JZ0QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIul1-00000008Mkq-09q8;
	Mon, 19 Oct 2026 21:18:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIukx-00000008Mju-1l4J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:18:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3D9AC5CD5C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:19:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA22960582;
	Mon, 19 Oct 2026 21:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C749C10328C52;
	Mon, 19 Oct 2026 23:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444727; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1aY/ovidFv5oOqnqGNioiPlwdlj0XKYaRdg6c0us2fg=;
	b=DztTtqaiMFNxQyeT/XjiWwK1V6UffMiaMoegSAVrYBY6q+Sq5lG9Men7q2iCjuO3qYEusE
	LZJfVRHOqRNva2Ht11r9c5SzJDXU7oaXb8Xgw8qfD+YkgSDQpAlnozdmiGIKVWwzPDQKMj
	PuYiw6Op4ELUS+ooThQFuvY3BxCjhgM8h+wnw3H49sbBoc7Qr2WFRFtLlKeKmSmigS7BeH
	VBDRHs3uTitLTuTm+IBSSLJYZ9roCxTB+AwmWtHMyLKgSKcnxbdSScA5MiuZ7NVAi6JoMq
	T28SUIn3TtaE+0j55Kt6jBMRlVHqzGJ5m7tkb0th9fHuAEGZx3qOQV8Hi808tw==
From: alexandre.belloni@bootlin.com
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/19] rtc: asm9260: use guard
Date: Mon, 19 Oct 2026 23:18:04 +0200
Message-ID: <20261019211827.126262-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
References: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_141855_633544_9CFC709B 
X-CRM114-Status: GOOD (  10.23  )
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

Use guard() to simplify error handling

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-asm9260.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index 705470ae8428..422c2e5d83aa 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -116,15 +116,13 @@ static irqreturn_t asm9260_rtc_irq(int irq, void *dev_id)
 	u32 isr;
 	unsigned long events = 0;
 
-	rtc_lock(priv->rtc);
+	guard(rtc_ops)(priv->rtc);
 	isr = ioread32(priv->iobase + HW_CIIR);
 	if (!isr) {
-		rtc_unlock(priv->rtc);
 		return IRQ_NONE;
 	}
 
 	iowrite32(0, priv->iobase + HW_CIIR);
-	rtc_unlock(priv->rtc);
 
 	events |= RTC_AF | RTC_IRQF;
 
-- 
2.56.0


