Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC277CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=; b=spFowASPvAEBM2k07wSizo4DLC
	hH2d1x2tla6V+3QgcHZwjusY8C5RFaIGTw+LUWq3jjwkZ8EsvoM3FpJ8uGTdAnBSeHoF2H4C3/mQW
	Rk33beVYw7hDWb+tCpGggCjFOGtTNkqEte8W3GIyoeiysCXPmAd7F6VapqYzmZzzOEmz4XTEmIobr
	AWckJiB4Nk/WFT2Ef/6oaEb7GIjocOIcJe6LU/On0Fr4TO4pOnXVKG6XLypJpqL+SR9a1/HzZaJJ3
	J0qljjVE3uz2rRfot0wnUHYIs1O5tLeKcBVPhEzIprvCqL/a6eBm31narn/CQG6Wc5WtdzAgC9fl9
	5lgu49OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67gk-000000023xV-2ZCD;
	Tue, 07 Oct 2025 13:25:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67gi-000000023xB-24QV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:25:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-26c209802c0so61251335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759843507; x=1760448307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=Auj7iB1yhSCKMSWrTvCGw0VnjJZ8pCwgI4cJwslVmuVbPf+L10pXFKywag6tJlfPSs
         l/XKMoc5y7Xd74IsxVk8BMmv8Jvx4NwVEo1KT2ZvOrG9/ccLAcnkeJzNpd7dIKLyK4w1
         HZuXqikeJy5iPTIdzjcLUBeFlx8wLyJULMdUZrbHKqwZpCDQLbTTU8qIeO+KLyZGiCBc
         yh0CG+CrZCoMgcISqQuGGrtHBOL5YAZsv/3ZJKQMcJQDSGKT//z1py4nh++iLO1ma2As
         XIY8fwxqnWP7fYQwofHPue/hVl76o2mix2T8YOYrC8ivPVBTT6SNUI1ydaQDCenLZVtP
         xhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843507; x=1760448307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=Du/8jjNE8XaWYNy7rP5XlsADF9274JWUnUT1+hIEPYuP4R5bNZrowOdIGxHxvY61WR
         pAF1BQVp5J17EAssaZ7ZrjPN3mJZKsBGfGWiQYmqLzhdZQc2qP6Ac1zFQgQmZRajAPif
         9GVhCoklKR0RI9WcnWirmyScGqZ1zF+H5l0dlkf7ltL/zQu4mPX0jQbPKVYqjA8DFE3v
         4eOJQuqOtJnNhKbsf4sUSK1P730a9CULQ/ImwvaprzcWlgJ/XU5+VGPtT35049gS9plp
         p3+qKHuuDU9GKJjTBbuA9+p4VdINpxnocR/2AG6TdATLqLiG8J6xgKclwHDtZu6TccyL
         6qmA==
X-Forwarded-Encrypted: i=1; AJvYcCWtWByzpK/x83efdYQNU9lFBA+SDsteC6uZhwnKHfXihmGEncKrw6m+1XfSi1mjmWLVaQAzUeIhmQk9R8HotncO@lists.infradead.org
X-Gm-Message-State: AOJu0YwYRkV/hYoZBc0uJQRJgYX9Ow1Xwm45wgwBrcFWqd2o/8U+7xyD
	G0S6Vj5AaJYg+Rq/tmBIAv59dr8BZfcov0tMEJtgWD/yEXqj04/KvTzz6Ly8PNqfmA==
X-Gm-Gg: ASbGncvbc65f5umMNbypw9+HFJ0EOfzFHH/wY1NM2g9IyHtnZsWH4aI6SjV/4lLiRE1
	8X2j7a0x8LUNYlLgY+gAB/m8wit/9EKWTEFL31QvyIKwXMQ+Cc/MvXALRi/zVcPXYYytJy1bIGr
	Sirl+TzJlZZLROJCPBJw3d8sG6eZaYk6H8zMchMgxGi+lBPehmC3HKCQc0DYmvxe1e+/dvmww/D
	Zw9paRosRWj49MRSnqE2pn6MSR5AWNNfVOk5PI5P5RLEFlREdJVZrv8Y8PavQGMOs9WbHmPx2UN
	y+xc2+WaKccVi2ummK7FADCZKhtMUfcLlYAHJUZU9u2X8I6yAat4qifjDdGzU+6d41TbticCwk5
	Cy3/TOz3aXXR0Zz0bE1OrRv5tGv1NgvgEQt+lEX00A3J+5L+hp8hYNZHb8gplMr1Xkf3ODCpxwS
	6phpdNIGvRg+H0t9XjwcQ=
X-Google-Smtp-Source: AGHT+IEzTWHDadnlhRp/S58ULeXoWMCkCiR+8Dg1mH5fcmjnNA/DLN1UQw7CdyUCQ1szY5TdffBgmg==
X-Received: by 2002:a17:903:f8b:b0:26b:5346:5857 with SMTP id d9443c01a7336-28e9a5a8788mr206165375ad.24.1759843507414;
        Tue, 07 Oct 2025 06:25:07 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([182.65.86.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm166409045ad.94.2025.10.07.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:25:07 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] mfd/macsmc: make SMC write buffers const
Date: Tue,  7 Oct 2025 18:35:10 +0530
Message-ID: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_062508_534841_865DA402 
X-CRM114-Status: GOOD (  11.77  )
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

Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
and apple_smc_write_atomic() as const. These functions do not modify
the data provided by the caller, so the parameters should be const
qualified.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/mfd/macsmc.c       | 6 +++---
 include/linux/mfd/macsmc.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8..0f8ed400b986 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -173,7 +173,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_read);
 
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(mutex)(&smc->mutex);
 
@@ -181,7 +181,7 @@ int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_write);
 
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize)
 {
 	guard(mutex)(&smc->mutex);
@@ -239,7 +239,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc)
 }
 EXPORT_SYMBOL(apple_smc_enter_atomic);
 
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(spinlock_irqsave)(&smc->lock);
 	u8 result;
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..3c5467854e28 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -149,7 +149,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_enter_atomic - Enter atomic mode to be able to use apple_smc_write_atomic
@@ -176,7 +176,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_rw - Write and then read using the given SMC key
@@ -189,7 +189,7 @@ int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize);
 
 /**
-- 
2.43.0


