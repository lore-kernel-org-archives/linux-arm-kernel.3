Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE53FCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiDLQo6LxMnNaRwvgrfh4SktcEegnVe/AK/y3q5hSoE=; b=r7W+90vJ9BvNEJl1lzTtaaRV2J
	EY9gHS2jp8U+VGSCVsqGQaIYzvRJzotwgSOhM8rsOJ3PEUdkYDb5ez6IvF+/rewR/igOR8uU0hwAc
	3bK2w920sV6zGZcsC7Go3KGAKNqJujo+VB+Mhhbm1qsp/v3zIFSN57HgEt1iBhVIsmOmMnw3vWWkF
	27TJtat0ndqHf1Xb/31IVVAlP2SXgM0K7VLZCobsK+LQKe9cjbRh6sLJtz7DT6zEG2Hc1jW8HtTF7
	EisI62S7Qyynjnq9dglsJRJq1A+V0Qwayh25QnhdwddbnBs1DuM4lGWD3e+7IErWRhsTQEbtoTO4w
	MGuByc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvq7-00000000cHp-2hVe;
	Tue, 12 May 2026 22:44:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvps-00000000c0P-0g49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so468873f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625858; x=1779230658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiDLQo6LxMnNaRwvgrfh4SktcEegnVe/AK/y3q5hSoE=;
        b=TG9RXQ6buUbE0qP2mFzVepsZUo7cg1mSZIHo+p8zD0s1t43nOFIEe2p5/oX1rt/y7m
         IyhViTd3tihHK3akk1iSr8yYb48E842+hjKOshDbG1DNGoKN1wIftbms4GAyo3b07Yy5
         zeL0vEn6lycB9rYsgOwocny89njKe0gtpulHhbNr0LJyHiBnkjhiHO7Rda0L/WYcQZ3P
         06QZDK/k6HVUUtul5TWWkDN8nCYHh0fzDdKGWavU73r0WRWzN18Ao9Fgll6GFMGgoub7
         xPWgDWW5aRKfIah3Qu9EeBSSnjVrB7+38nMTfHIp1fdhsRTSzlM4+Mvp8R0ASuVCVqSO
         7reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625858; x=1779230658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiDLQo6LxMnNaRwvgrfh4SktcEegnVe/AK/y3q5hSoE=;
        b=GAHHmxH36a1MV7E5uot35X6LU7T91i39GyOn2B7X8/hrhFSFGAw5fLAVXV5BUzzp2B
         JBNP2lKNHAM8AVQ9scspIUoeWLTjObWaVrSQxbmkoA4+8Hp1xTTTTc8pahdrhLIk1bOi
         A1bcWpZ9seIMefvk9aEh6upF7zTMu9MzzRNogBLZsAdMfknwveBy183TxlGLocUB7RJx
         /Tt3wTKQ/Z/oNjtEdzwb/xvHc+bOwZfdyIg44/V2Hp+vCJIOZEQ7NjxTQeKmt5uNPxX4
         f8m8w3RZy1M943s85nMwXwR2IvfJMma7jUqK/55CMJtmyBQ8PnG3xnR+pqQRBSYb0pq7
         wGZw==
X-Forwarded-Encrypted: i=1; AFNElJ89r9ZBCglWdG3Ts82wP2y0F2JkJKHlKZGY4RoS9Ds/saDC+SSKSxAQcLtIHFdp6DYs5poMjXHlA2zheajTg1bC@lists.infradead.org
X-Gm-Message-State: AOJu0YypdYEWUG+b/zgKKK+TY4Z2QHNXt9mgRx155/eRfUiaP81jbKVG
	Be3vcn+ipalq9cIkAYdNQyVOX6AemA//cAVgRtZf1Qot6aJDyicf/fvN
X-Gm-Gg: Acq92OFx8Mrte0SLagz8X1G1oDnWlqvNlojFSaKZ/CXHSIH+T72W9E17hfyP2bjx5Z4
	Z8DSXQfRaVTk4/WT55bw17YmBTJtdVjjGgCrVxjQzC4Lv+w4M4DHpsQ5h51R1glEmatP+NKG9Jv
	XJBIyrfrB74/YZ6qsYs4OK3iWPc/ENvgP3w9cMADYiiiyG2lEOI82a7cJT6NMASUEJqowdmEKCF
	zPbhGj7H9LVrbypPITzTBKxjhqqNioo3UKHZ0b0dUeWR5DK9Mz/Wg7Yrf33VQ7afpRoGSwSP4aj
	aii+vM6SPWRqRs6WBd94NwaL3ysKFcb0hnbV+LlxzBYLJClL6tssqHw2E64ktszA+OOdU+FljZ/
	NmD4x+xMG6oNw6fEijyMdav2+2qbkupnkU6CpYgBjoeaDUTQZr2Q3ImT23GvnmyNLWv5UtgGAoh
	3kZWvAUSmOy/l2CYpAHR8z9X3D6zTpIINjy42p8CwI9FgPVL2868N9H6Fgg/8hNFk=
X-Received: by 2002:a05:600c:4595:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-48fc9a1c617mr4696215e9.3.1778625858129;
        Tue, 12 May 2026 15:44:18 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:17 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 10/12] crypto: atmel - update workqueue flags and add flush on exit
Date: Tue, 12 May 2026 22:43:47 +0000
Message-Id: <20260512224349.64621-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154420_216295_29F92DC0 
X-CRM114-Status: GOOD (  11.82  )
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

Update workqueue initialization to use WQ_MEM_RECLAIM instead of
WQ_PERCPU. WQ_MEM_RECLAIM already provides per-CPU execution
semantics via a bound workqueue while also ensuring forward progress
via a rescue thread.

Add a flush_workqueue() call during module exit to ensure all queued
work is completed before destroying the workqueue.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 50b6bce478d2..0ec2d768a763 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -626,12 +626,13 @@ EXPORT_SYMBOL(atmel_i2c_probe);
 
 static int __init atmel_i2c_init(void)
 {
-	atmel_wq = alloc_workqueue("atmel_wq", WQ_PERCPU, 0);
+	atmel_wq = alloc_workqueue("atmel_wq", WQ_MEM_RECLAIM, 0);
 	return atmel_wq ? 0 : -ENOMEM;
 }
 
 static void __exit atmel_i2c_exit(void)
 {
+	flush_workqueue(atmel_wq);
 	destroy_workqueue(atmel_wq);
 }
 
-- 
2.53.0


