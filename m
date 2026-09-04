Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3645CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Mo7t51/Gnqz3M93hIR4TBNBzPb6bGUI6Tlc2drcsBM=; b=yOQbOLBRb5wJHK
	Hf/vkj81LsZaiXDtmnMIeSTN0vM7pdCcuzQwUE/lMA7jfWa8DSizTxF/Z9TzWd5l6V7vbvngBE8IP
	m7ghywmQgBUETTTxaCx2/PYLQ10G2uSofqGGtpgBFMB4B/53GRZJImysNDGV3SUJj+uPsk5+a1z9l
	xgyn5n/znwotLundMnTqN3tHDBeg77+axuCsaia+GS8IkGGrEaVUBsI7UiKBsbhiZ+EoshKd18RUZ
	fI5b72PP6KxxJoo2jUEi4WSL1v63Bsds9sFq77+OW7SqU/ZXjZ20HR5XP1PhjpXr8ffkYCmZZDimX
	pDV2Ghxs7xFTAAcFOdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WZc-00000002gbX-100H;
	Fri, 04 Sep 2026 16:15:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WZY-00000002gb0-37FY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:15:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E6791A19AB;
	Fri,  4 Sep 2026 16:15:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01A406057F;
	Fri,  4 Sep 2026 16:15:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF42E11C79BE0;
	Fri,  4 Sep 2026 18:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788538516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/Mo7t51/Gnqz3M93hIR4TBNBzPb6bGUI6Tlc2drcsBM=;
	b=rOFY51G5YcfxBZg3OXPPlKDHAoDrxo+rKpfbiRqss0F/zqgaCGTUtztZazwqVB0vnlN1NI
	TrSleFCr7JmUMEGBYn8kaY5YwgAHPQPD4CzWbWMhBC1YUdg4kPtqh2jOn6VG8/sT6rkL5I
	D3D9MoaYwLYmCM+eElg0H1I3XsFQqGrHRjv+ODj6eP8kDkU544kuhKNzgTSOte91Bbq57E
	EsDh0qrWDV/nm7QJzoFcO1ebphuT8wwNLdXO0UP+78mHKxM9JOu25v5Vih09MeMH2qM18R
	DBVRf8igqslW35Um+D8rFE0VgHBaXBTwUaQ8kkLHPZk+UYl1mSVhO/YwJp95/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] spi: ma35d1-qspi: Flag the DTR capability correctly
Date: Fri, 04 Sep 2026 18:15:09 +0200
Message-Id: <20260904-perso-ma35d1-master-v1-0-b6936e8c6fa1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQqAMAwAvyKZLdS0CvoVcSg2agZbSUQE8e8Wp
 +OGuweUhElhqB4Qulg5pyJNXcG8hbSS4Vgc0GJne+vNQaLZ7MG1sSnQk8TgjB6d9S5QhFIeQgv
 f/3Wc3vcDn6VrwWUAAAA=
X-Change-ID: 20260904-perso-ma35d1-master-2c2423043aed
To: Mark Brown <broonie@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091525_120515_6656E2F9 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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

Mark pointed out that the DTR capability was not correctly enabled since
I had to set the extra ctlr->dtr_caps flag. For testing, I commented out
the spi-mem ops/caps and figured out DTR variants were still not picked
up. This was due to the spi-mem fallback implementation of ->exec_op()
not forwarding the DTR flag.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      spi: spi-mem: Enable DTR transfers using the standard API
      spi: ma35d1-qspi: Allow DTR operations with the regular SPI API

 drivers/spi/spi-ma35d1-qspi.c | 1 +
 drivers/spi/spi-mem.c         | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 278cfc33d25f58105681196cecd9222c423d0c1c
change-id: 20260904-perso-ma35d1-master-2c2423043aed

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


