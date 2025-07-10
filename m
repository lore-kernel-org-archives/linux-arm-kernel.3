Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B686C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qo/cY1BhsRPObvTFNkP36pI9mVlSPrkm/t9jXMFZOw4=; b=MXdrCJMeDHCWESHFKZnf3Vuiqo
	c+ml2F9k7X69JfpxH8UDUrzhX3l0y258oA5x8I5ucW/IYOzFMQ+4PbvsN9LD6Fdz3T8GEVG3azt8d
	r0GFA8phhjoPeTKtYK0568u1+xjBta/nf+nQK93fpbU849AxXMEid4YMs+j+36Km65h89tPeJ6GPC
	MLQTwjwbMlfS+2TPOy7HImE+/p+EA4ifErYFdwQXp5RfU5qBTXeWw3aKDSwftiVOShzFgeijEwPxs
	sLG25tDtfLGlXJltTsPhahXkv90zBTPXRDG90oG5j4PgdqEIAqID+JUF7aHQzib0n46mq7N3lbp6t
	pvB/98uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjHr-0000000AgoS-0DCf;
	Thu, 10 Jul 2025 04:53:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjFS-0000000AgW1-3Pet
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 04:51:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b31c84b8052so823362a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 21:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123066; x=1752727866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qo/cY1BhsRPObvTFNkP36pI9mVlSPrkm/t9jXMFZOw4=;
        b=XpY8WBKAUN0ydslJv54VE4a9m1AlRlmvD3eWuN0PaWk0lF0tehdoDoXB3X3v/dYm2w
         YGvJt4jQFgZi2wunZ1MjsWvu4PlSNjTG/YGt3xXr/rO9T2+fTz4m1DLLVT0w9cB7+Z2F
         2c/ygffU9t3sj5j3DJ2/If8pvAw5XSU4KHfwSz6YNIxglisqXxik23+MvTIRgGm6w43l
         70qI33OD06LZHvUVI+LPRsO3SBf8Xmm/tGJeu1+U+/ikQl5jx+FD36G0sB8TpbB/gl6a
         o7Y8w+SAZLBjUtO01iHsulFReQsBQ0xjEKk6MjqgSiEXyCMcVhel4/425wc0Y/BV0ZJY
         H6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123066; x=1752727866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo/cY1BhsRPObvTFNkP36pI9mVlSPrkm/t9jXMFZOw4=;
        b=FipC1cTGKQgjie3IC5TY2I4a5d2a9KubjmAcMFjLAIbsrJWKDE2pgxO03Whz6jy9eT
         2mv7vxgT0TJO3sPAIE4ywNFPKl83xbYES28bg2EEJzmleaHkIm1QA/Dow+sEvSJUQYLW
         PSUOsAKyGz0jtC72NbDLkN24JXS9Br4LOqFizeZvbsSWsfYMwlFmSEcnphzjh3fYkU+O
         d3+VMNmK8F8Jc6GPpboa/AlP8YKBznedW9ulLepChLcZx+rYND3ybewX8+U90FhNuk9b
         uM/WAW8hZ9/+gtJV+43COxOf9Ny+GOQmPyNXld79aOJux71wKZgyvlVU1Hz5mis68qRZ
         VGvQ==
X-Gm-Message-State: AOJu0YwN8CbRMuMIwkfN6EJ9hAn0Y+91gpQSdT3xdfc2bR6zE8kLA6tZ
	zg6ZFX8ze+veAhwO/u/uPtKMEKly4INLNq/7xJ1JmoG3ijL5AF+APmKY
X-Gm-Gg: ASbGncsfwlg/cgGhq9M21IHuR/Yxd5hExoo4L+bizkbsXrwTEncGGJet8c2EgAmBpEX
	wsLMYG53xRPI3J6/dfCOJJ6ROr87/SehcI8W2ImYsTu8IOxdGydfqczd+nyNtgzQSNQ42ayhAOX
	zMCGlZPcQchgYcO/hcK5ECXP8fPk4/GIxjGIDl3FsGOP1gH7SjANHLwG4+lyHIld6UzpTB1BLXi
	yRP3yayo3R4KGWG1yf8UNcrcw5M+jFmvCQCUIYwaRucFDvW7J1cHWQYqUdBQsb4qxNsg2OOfn/R
	Cyp2ibR9fv3qMw3i7i8YnUlV/Go9zUlUeLUurmOTeHDbcFfyCVNQeDTxloiJAYVODMLe60ntwgH
	ST5y5x86OtiGR1DMnFr0AK8FcyACppswmkP0FDiRrlA==
X-Google-Smtp-Source: AGHT+IE9r99eJR3/RVCg4fjK8SPPymUKcSjxR/TwtQQOqNbDk6Zql1wagKZDicCE7BWBhqhlWueunQ==
X-Received: by 2002:a05:6a21:400d:b0:220:103c:436c with SMTP id adf61e73a8af0-22cd846ff82mr10327600637.24.1752123065546;
        Wed, 09 Jul 2025 21:51:05 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([122.182.200.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b355sm771458b3a.80.2025.07.09.21.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:51:05 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: broonie@kernel.org,
	michal.simek@amd.com,
	linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] spi: xilinx: Fix block comment style and minor cleanups
Date: Thu, 10 Jul 2025 04:50:57 +0000
Message-ID: <20250710045058.1325-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215106_847856_11898B8A 
X-CRM114-Status: GOOD (  12.63  )
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

This patch fixes block comment style issues and minor code cleanups as reported by checkpatch.pl.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/spi/spi-xilinx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index ded709b2b459..d59cc8a18484 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -89,8 +89,8 @@ struct xilinx_spi {
 	u8 bytes_per_word;
 	int buffer_size;	/* buffer size in words */
 	u32 cs_inactive;	/* Level of the CS pins when inactive*/
-	unsigned int (*read_fn)(void __iomem *);
-	void (*write_fn)(u32, void __iomem *);
+	unsigned int (*read_fn)(void __iomem *addr);
+	void (*write_fn)(u32 val, void __iomem *addr);
 };
 
 static void xspi_write32(u32 val, void __iomem *addr)
@@ -251,6 +251,7 @@ static int xilinx_spi_txrx_bufs(struct spi_device *spi, struct spi_transfer *t)
 	if (xspi->irq >= 0 &&
 	    (xspi->force_irq || remaining_words > xspi->buffer_size)) {
 		u32 isr;
+
 		use_irq = true;
 		/* Inhibit irq to avoid spurious irqs on tx_empty*/
 		cr = xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
-- 
2.43.0


