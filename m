Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC79BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mUQeo4WtwZOyiPosjJ+e5V/s5KXRfRIpXXnzgHHEpY0=; b=ghG0pyXkaiiyr5aiE7gy3CCDVy
	FdCagwzA+JuzGdcF/6kz3j3dqEMUfVvwZ61HpHSXN2gSGQVuhOb3ml+bnwxHEWoeIFp646kNSsBBX
	YtwNgo1b4ZwK/WYaUAxOvZnE99BpYHa2NGt9hlxFKDinJaLJRd/Iz1v9xJMCaP0CSI7mvH6nU5aIU
	kH6ZflgOz8AhVQzCKjCm5DIByBNtMwTlMY5h1NjZK+2tB3zC3ED+a7kFuzkzapwKCR25NEhawQ5A8
	q5DjLZxBPObyCpj6BqXbD4egsNBeYErIWz664AJaL2YwwaIZV7HzwiXbbuNzdzkzTC4SLaXXQsoFA
	Z0aJYMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo5G-00000007lIK-0LxX;
	Fri, 15 May 2026 08:39:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo5C-00000007lHJ-2YPe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:39:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2baca4df358so53879065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834385; x=1779439185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUQeo4WtwZOyiPosjJ+e5V/s5KXRfRIpXXnzgHHEpY0=;
        b=FHoUP59LVQoYEzjUfBwbNEFDK7rv0/euJoCvmJp+Nt4TxjLUYoyOQSU+YEY0ddBlA+
         hpA8bpmcYpbZKEt0NGnV4WQ0GQ/bFP5OvPaKeyu6I1yXFOYahE/bMlPAOSUd/jAN4iB7
         1Bp1hh1NeHcytmz33iHXGHyox2WNt6Zv9yY2PH902Jw68VRyP8+SRF8Xu/At4AM2SkxB
         s4EoR9VwwvWEpdjdW79cNU7RECEPBMgL8/aGz/mXvDKCULpcV4vVYtQaz9pJTaUWtPEK
         e4ExIJYJG/7qrNHrBs+yHUKv5NlWRmruWqa51R7ikXxC9q9Mgjz/PtClTKB7ZYrPfo0S
         PFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834385; x=1779439185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUQeo4WtwZOyiPosjJ+e5V/s5KXRfRIpXXnzgHHEpY0=;
        b=nmpjXLwQ1IvB/qeavzicZq3/g8cU0GLnuORlncBwn/hM8Rj5IQlDcgxtC+wlWILmij
         Yff7IGzqVib46WbZiGiWjEgDIlvoJarXszUY20wQCn98BiBoBjVbO/4+Ppuj+WXEgCNO
         iTn2dPxOVhsykjxA1gJZ8tRnEVoNuIq2/xq2LMAaz1m/TVP/K91O2Y1RZxriHYmR0f/j
         RPsacsQVIcP/4W/Yd0tgC42+yAiqXodOHhbeGIxqMibuU6z7asokIylCVeZRzpdzzAkv
         t8cmNXobTzf9afitR5b94WOUB1CfQaDRzPFucZnBnfHi/TWAOXko7SFWmVHkho8U/pUA
         OoSw==
X-Gm-Message-State: AOJu0YzZFURorQ0AgDXcSsI8uC4oW4mmpr31j7h+tjRqTZVd1CRreSFu
	uW4i1AqKOesqFwkNtVDaC7oXpxZcvft9gyxG0AM0tJea2zdL2lwGXUPM
X-Gm-Gg: Acq92OHvgm40bgWRUCX/84oABBt37iQuJ2Mcmfbcm2PWsIBz3QTy6WYTPx9GZbLoDpF
	tFGgjmNJaH2hLc3L4+i3TBMxN9i7SSOTCzSGGjpRbDNsBFTLAIuhxKqCfSEwHKK+tUGiVvSoVwD
	NcVtDjej0h5AOo/3rmfzRLkaoLnBUBdfT5SPImzlpNJeTjhPFIV65kZ0YP8BHwCRxCW5W51ygAe
	S0TVx4kEnn8PifFYZJwX4MGd2gKUMt2oOWH+usyJdOyxrUJs1XwWySgswtp7ic5rUrmqhmlQE3v
	dBHyznqmR507aYF/U4AJxg62y7FBBXzZL5frkxSBhERFU7AnpzSxlOGS2i6seYxo8ubDZacWMpB
	jbhUN2elNY/saXfpHqyiKrHhGfnCw4y/RLMU5sl1QsAvd6A698vFh6bI76wa8Bg5qUJnSxnAmCF
	9nFj/rq4IqgKnf1l47/Iw1ORB27t1aV8O7GmUcVV5M8I4kpB9cnYPH1YNaJyWaMphcjTB5g1E5V
	CEiQ7xcQqU=
X-Received: by 2002:a17:903:3d4f:b0:2ae:450c:951e with SMTP id d9443c01a7336-2bd7e9040a2mr24024255ad.17.1778834385278;
        Fri, 15 May 2026 01:39:45 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05fcb3sm53551645ad.26.2026.05.15.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:39:44 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: brgl@kernel.org,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] i2c: davinci: fix division by zero on missing clock-frequency
Date: Fri, 15 May 2026 14:09:26 +0530
Message-ID: <20260515083927.5033-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_013946_645672_3298FF3A 
X-CRM114-Status: GOOD (  13.79  )
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
macro was defined in kHz (100), whereas the device tree property is
expected in Hz.

The probe function divided the fallback value by 1000, causing
integer truncation that resulted in dev->bus_freq = 0. This triggered
a deterministic division-by-zero kernel panic when calculating clock
dividers later in the probe sequence.

Fix this by redefining DAVINCI_I2C_DEFAULT_BUS_FREQ in Hz (100000)
to match the expected device tree property unit, allowing the existing
division logic to work correctly for both cases.

Fixes: b04ce6385979 ("i2c: davinci: kill platform data")
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


