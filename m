Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3863CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RWaGVwrz8dpWHB2wk2T9j8VY/b7+3Y4aZTgZzUxXD1Y=; b=MttHMeLlxkEEhH1Gbi3qoLQMEK
	OMb7F84OD16wgGV3bYmuuoxOMa8uZimPD2EohFgTdepUHsO5iu8srVWAgb4jcQf7mmjM11KQxRL0I
	C+FvGb+mgm3amlYl4NAElStyGbn5m14r0kgtJfKIBXTXxjkAl1MIT18qpHYD4R3n/+ZUQOiF3LWvZ
	Ya6fKlisxi0QA6tu9+wMkWX9nIBRXkhzlXcGACRdBh88ZUWyYxUTdt77oaFklwtzTwjNxYr2MYGuv
	DyPDCnHXnSTzSNtxE1EhI9wSd1jaX1/UY9fAhMYJhRearGQF87ovy5BVwKMdt0MYoqdwSa/tNg9Be
	RqIhcCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhZ8-00000001pwq-0MXm;
	Wed, 06 May 2026 19:05:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhZ6-00000001pw7-2MRL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:05:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so100855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778094346; x=1778699146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWaGVwrz8dpWHB2wk2T9j8VY/b7+3Y4aZTgZzUxXD1Y=;
        b=IkPC4+TmMLcXpGMv/wppRdgJ/CskgOlcvrGGxgROpDdwOQ4hFE6D0rPEM+VcyDgVNa
         S1/es9bFkYFkV9Sko19sKytSQNhQGGD7RYo26O6Phk6Rsjc+rRzn93nBPbJ/4/Yh+Mek
         aq5wxuCWw9wLbaAxJ/B8ItKVi1QX3v2G7jcN2xRlhZ4ybyx0aoz1F2rGHHB9FCkP8Ofl
         9q7FiMs0H9DRlVg6FBLJK5gNcjOUbyPeLtX/K94L7m51RFNgrJ37D6izjUHSSXORu3S8
         hOxrPhirjxeFTwSdWxNM/6Pk5czEUz3aWUi9U+Bx0gkjEXonwdzcQAL/3/50JatHJ+oN
         +TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778094346; x=1778699146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWaGVwrz8dpWHB2wk2T9j8VY/b7+3Y4aZTgZzUxXD1Y=;
        b=nSImp575xT3LT28DMS7bOSBBZspJ9lb74+O8p2lDmAWa17W3IlgdXSXVnKkoanWnds
         DPxjdMoHDWQ+Mo9v565H4cYKYDlrZuu05CPweSxjc+KJdq8kAPFt9R9QN/wt9Bgy84/H
         UKNfhQpjLKS7t6qnOKzgeOxIxyMbADjbQpI3T7+cXQTKXdhOcfT7jGojht5cD6DlUhYt
         E+na7ARA3DjWIdQGoBIqy5giWms++audbfiOI/MkxMGHp6M//Pu8H+h8YqLFfP+mNlYV
         GUCseQ3Ri4cSkG97QTA5zkZMrJwBkKlBtkM2c7KrNtWogeCrOudiUEVDIGPxUI7JgQ1A
         sY4w==
X-Forwarded-Encrypted: i=1; AFNElJ+NoUbAD+/DAQAqkEDDFoKuTDOTpelF1LhslLVvWkGejENyo+IXzbeFl6/Eo2HiDgmsgi6ujDjPfMPTG1XOOV5V@lists.infradead.org
X-Gm-Message-State: AOJu0YxGopiTpujVssj56PFDAIFsFjAfjSBN2D25AZmfLE35Ly5tyJMM
	K/6qL0NmYAT9gjpMX4y6CZ6tf0+QHCZ17ieCSyO77KXQRuSQqUGbdlKY
X-Gm-Gg: AeBDiev98kvG8R5vEBKTauFo97Cf5YnnpboeP9skkpPV8fJ7sGhgtdMhh9o+OwcNVR+
	FBwllgtJxB10tQ7DLQuE1Z/bi/WvzBVqKYS6yGZIdRs5cAm2z716rrdTti2OxI2fbiuuwAThU74
	+mhiXii1KMIyBPd8Tjd6VxGotim7YY+/QrFhmtmPrF8N87Xg+KN54pWwmJTdgYgOdUYy90Gvwp+
	GKqlZb9Taje9puITsgesZOGd0iplQP+m/j9YsmB0lDOihoDOwXGi/RHQ3SlDdunMT8GxnkP4Cxr
	V79HNyWysG0xRoNZhAm+ToNdqkO4gOgicXKUeOpM3FqTX0+v56I+hmg8+WJyxRfyLjKLyTxE+bY
	iAoTxONNlD/rlZdaUoxSLBhYPfHYTVns8MA0vieQ53zhnaQ23gV1rlBzX8P5THkISa1/Uf8hyns
	GBlz6YE/xHtcDAnICXhufkpxaVFl97gMhDAsHFz9HHI8pHXpYvzqE2
X-Received: by 2002:a05:600c:4588:b0:48a:5302:8ed9 with SMTP id 5b1f17b1804b1-48e52f1574emr36086805e9.0.1778094346183;
        Wed, 06 May 2026 12:05:46 -0700 (PDT)
Received: from LAPTOP-9UC0RPH4.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b212esm30832605e9.1.2026.05.06.12.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:05:45 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: ulfh@kernel.org
Cc: brgl@kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] mmc: davinci: avoid NULL deref of host->data in IRQ handler
Date: Thu,  7 May 2026 00:05:37 +0500
Message-ID: <20260506190538.596-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_120548_622897_D32B48A6 
X-CRM114-Status: GOOD (  16.24  )
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

mmc_davinci_irq() returns early only when both host->cmd and
host->data are NULL:

  if (host->cmd == NULL && host->data == NULL) {
          ...
          return IRQ_NONE;
  }

So we may legitimately reach the rest of the handler with
host->data == NULL (and therefore data == NULL). The DATDNE branch
already guards against this with an explicit "if (data != NULL)"
check, but the subsequent TOUTRD ("read data timeout") and
CRCWR/CRCRD ("data CRC error") branches dereference data
unconditionally:

  if (qstatus & MMCST0_TOUTRD) {
          data->error = -ETIMEDOUT;        <-- NULL deref
          ...
          davinci_abort_data(host, data);
  }

  if (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD)) {
          data->error = -EILSEQ;           <-- NULL deref
          ...
  }

If either bit is set in qstatus while host->data is NULL, the kernel
will crash inside the IRQ handler. smatch flags this:

  drivers/mmc/host/davinci_mmc.c:933 mmc_davinci_irq() error: we
    previously assumed 'data' could be null (see line 914)

Gate both branches on a non-NULL data, matching the existing pattern
used by the DATDNE branch.

No functional change for callers where data is non-NULL, which is
the only case in which these branches did meaningful work before
this change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 42b0118a4..42ad87aa4 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -928,7 +928,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
 		}
 	}
 
-	if (qstatus & MMCST0_TOUTRD) {
+	if (data && (qstatus & MMCST0_TOUTRD)) {
 		/* Read data timeout */
 		data->error = -ETIMEDOUT;
 		end_transfer = 1;
@@ -940,7 +940,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
 		davinci_abort_data(host, data);
 	}
 
-	if (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD)) {
+	if (data && (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD))) {
 		/* Data CRC error */
 		data->error = -EILSEQ;
 		end_transfer = 1;
-- 
2.43.0


