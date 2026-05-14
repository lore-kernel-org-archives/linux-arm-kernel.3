Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B545CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=docZu46gG++Kf1XBSX2+6MGhAZFNy07C3ni4sJC8Jrc=; b=kNJZjAcFU7Osv9b80HbH1VhE2Y
	VKDmGmTr7yrb/XtMVzdMx3dmpbvRp4oitIdWkhGs7+1CZmLStAfBiKiR6saxSsDWYNndGO/gVxotl
	t47F3ySBeMHmarssTXKO5J5PjBJ4bAXqNWe4xHzEMUbGY3hFLr5gSW1Cmjsfcj0pz5F5MKfNYi2Cj
	WQXR9GWzinVTsCe3DHbSXD5TxhSyigN0r6X9gOmVmPgJifziUD91GUA4QVe8aBT62/OoKjdm96PyA
	ug3nAT0shl5okdeX9zeDA15X62SeYE5lD7nnTKk7bKqE/YQVJaHlGTgxpL8dvnxCjbCIaMDPB7p4x
	awEW4iiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTS5-00000005DPT-41gQ;
	Thu, 14 May 2026 10:38:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTS3-00000005DOr-2pHL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:38:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-366139223e4so4773227a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778755079; x=1779359879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=docZu46gG++Kf1XBSX2+6MGhAZFNy07C3ni4sJC8Jrc=;
        b=VVeBLr4f04hZ0tnvwrMcwjvnPQUcbOd3zAND0eywqUEsEIWLdqln4tXDtycleWRmGe
         WzwmW1Iu3uFwY2a5PeFdV9bTysIwhHzK/zzqUtTEWU0UtuDejKZrXSMTg2eBhgA6ajO8
         1GmJqrMbsnkbVc1P0NVHQquBuUWZpvXiKGKo00S4hcFZ6HBgafPMflo7zTchU9Qkl1pj
         l9FoNldpVAaDT7YZPFFRTNi4JmaD8V2hx+P7d1e27EtACif6Cj+GQGbXdDrXuTiGJwxW
         qEicUg+z8LVom13DiIEugSPwJrG8pXfX6xv8SBV26yXtEBflctst3ASlWQtEklUtJWVA
         0Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755079; x=1779359879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=docZu46gG++Kf1XBSX2+6MGhAZFNy07C3ni4sJC8Jrc=;
        b=rDWJNR3NJdQ+pkfGYostiUmO4Vu7ClHR/xKXxyHaXvf9CoVoA0hjgTKzEH2eNHePiq
         fRnRK1FEF+Twz6kKQ479Cs7EqVENKlXduQHQcLHzhOHjI4ZH4Ghb96KevTQCum64v6gA
         vuipkHAvZX5Pt0faBms91ltVAJoES23ZahuoRrDCFh9NXTEte5J66bfxmxY0EaVDwBkR
         BHnkMAYXFY1bzCsvA65YP/qWkp4/YQpoRHSJZvaeQYUWnb3CN1UFUtvGDMd3WV7Pj2Jt
         5E3+uaSXCg5cGfZDTukNatq/3HZtEiN0IJQSnvGsoW/1B14p8w3tYPSO5aAwozfhK4Zl
         Ww0A==
X-Gm-Message-State: AOJu0YwWo6Bk3tAdg5giAkvybSjiumeshPaTPjrVnzC/D4EO7Ofn6gFQ
	C0TukwiDe9ulXU3RI8m6XzQtUPA1Vd7Eitn9v9o2ihOwr+xP4VvtgSEK7GfOD7IxZpA=
X-Gm-Gg: Acq92OGmXl4UHx0YyAsOII7qpjnUKyxJNQS3lFouWzA7fTmf3xqmvtJK+0ZWlwJ/o7E
	UFf1rok9NeNDfjzrogpufndKNIeaHKqnwV0GdkLUcNK6wZqoxEeHOYzhZhXQ56YOklAaTNOmywV
	R9VjwVO6bjRGGR1a0yibnebAGD/j6DT7rm+9c/sIbSCnrpCha3UQAjeYgWaSrNuaYzYlULqLxFQ
	D3K4LM68ssQI6Or82Fk8C6ZV6aTrq4QuCceMp8INC0u9rYv4hgHRyVtXrtwHpmiXZl4ic7t6WaP
	dbZGmNR4yb/M69GPRLPyqGwwOludW6AyO6rVKIcysqYwMYGKHfm7dWvtLsykd3kQh0BoZ3QiFB2
	mMuZP4m61APqP2BzIUGFxSnXrVC8xZNrwbsM4QRIfzDtm/jWaJf/j8zCb4KIYdq4ZmMn7ddVgZK
	7WsEeJ7pl/F33g8MLNWgeh6dCWBbMxX/QIy/2jZddPRq37cjX29/LV4gda8hwC0UZBcFkiSSqp
X-Received: by 2002:a17:90b:3c85:b0:368:12f3:fa4a with SMTP id 98e67ed59e1d1-368f3d4400dmr7945009a91.23.1778755078444;
        Thu, 14 May 2026 03:37:58 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692f4a038esm3164644a91.15.2026.05.14.03.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:37:58 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: brgl@kernel.org,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] i2c: davinci: fix division by zero on missing clock-frequency
Date: Thu, 14 May 2026 16:07:40 +0530
Message-ID: <20260514103740.5416-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_033759_714784_799BA85D 
X-CRM114-Status: GOOD (  14.91  )
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

When the 'clock-frequency' property is missing from the device tree,
the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
macro is defined in kHz (100), whereas the device tree property is
expected in Hz.

The probe function blindly divided the fallback value by 1000, causing
integer truncation that resulted in dev->bus_freq = 0. This triggered
a deterministic division-by-zero kernel panic when calculating clock
dividers later in the probe sequence.

Fix this by isolating the division so it only applies to the Hz value
read from the device tree, cleanly assigning the kHz default otherwise.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..bd0754abdcb7 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -760,9 +760,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
-
-	dev->bus_freq = prop / 1000;
+		dev->bus_freq = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+	else
+		dev->bus_freq = prop / 1000;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 
-- 
2.43.0


