Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=; b=pGNLHiD7LuBayQwabOz6sQHnMz
	V0Lx2ps7wsPi6XHsw3pP2+Fqp0FGYW9GSiP7CzQLXWaAdlSyZrdnot0AvpUWdu1pOz7Yp41vogHg3
	gb7u8gjqOOZZGpLENaVEADcfmcCWSSxswLvPN45a5/FuIS3M9zUJ8TQHQ/SFkiMT8e1OPKkHn9ZSc
	AvZ37Xjb+hexA0HePRrjGjtSCHuLtbCpItQS0qNEmbsITOMVDiKn0/OUxz/wXTR1edb5T2aBtQHfN
	4r3vL3V9wsxKA3q0Qm6pKGKoMeVvLXxnf8ZPEDlQuLg/BJsSxjTk3vNCf9Q6YL2Yd+HF3+4uDNRzc
	uYs7sDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LJm-000000086S9-36TP;
	Wed, 23 Sep 2026 11:39:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LJj-000000086RM-2rbq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:39:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso468961a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163554; x=1790768354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=D4SF4quMLD1K3nysfrAg4NZp6I6OteYnhd0H1qGwFOB81r0YzTarOw7BnIZOnt4XPG
         f2MBjWioi/QMF5HAVqASbe3A+kdqt6JfKz0nEqDlv3dsEW7I9XrxqGwiEkunBeyF4eYm
         0GLZeVyem8qayX/E8OKpl8oh9YkE/8qLbHVcxMMVp2jtv+Y1E+fhFMM9P59/gMFoyImy
         zvlgU72+J0c/SY8nbWONhH+ohwfsWXw2kLdX/90J+cG3wUaAH1Cr5ev9zjJ4wbYFegUX
         ARmvK6F+piYfv1kHec9I0rPc9/pEYeZEpVQhuoU8bYwvea4y1b1HfPWtDgDIaFMesWb+
         7RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163554; x=1790768354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=VShuLBu5QOHKcUkeWoUAX+2sJCQKmheKM6qxoosE2SbM8peURMU3t7rICWw647H2Yz
         2fHo1nnAx0O03FQIzjr64pB3WD6l8uR/AjSwzqLcbZ3efLE6/IVpsbjPL2W3sGGpi9Ra
         UdR4Fs3d9wueEfkCnguDLuKe9HOsuPdJC9TArSuJuVC2cWcCprIjGi6/7Lld1oBY3R98
         k6aDSdJaKgEsl2D/FV7/iIT5pSio8Gp1e2XUp6MKnEkgRXuOx6wjbJesBek9vkZp2Zck
         CKLqjDKeFh6IlQACfiLRWt64V4dXec43uSJOxQD2J/ECxkjlNRy52vMrmTYy0O6TUcZh
         Whaw==
X-Forwarded-Encrypted: i=1; AKwUvBxPW/thZOi2SzJOmW4bZI3dAhAAEfNGqBBMOJe8QY+vJ3rPlG2OBtoxtOSD3X+v+1lZL80lUnjvIr9/ImVuguyq@lists.infradead.org
X-Gm-Message-State: AFuF++myMZLc/Ha03TQkcAhUS/ANR5sF0nLC5w2r+RujHi5MNxnLd+sz
	RYSN0bTLLFlHAhF+nxqBh2qXVrXcLedWmlh5p69EwREaqgNT79FteO+G
X-Gm-Gg: AYBFou37kiuHwPmQ0Bt9q9D6rZOs7OGv8VGynPq2tdvVVf9Ofj9naflEf2Ri7QBv/N2
	V73yX9vx6kdUidl8SSItW4Q3oc5NRCWRWGeDhK2YEVnAgdMjzzc4i5H2CGQOJ2tYqKg5zGGNxwn
	aNLfbbU/5/YBUYdv2OEzaifzryrv8fnocO2SvewxCLcc7UyeCUrx8gP5jwgCp0Rtw4ptEhmemJW
	fG+7948eByPEhTXMTkXcnTrc88NQ1tu/d52ogzqxAORiuFGvjq8ioJ9bm9S1a8Vjta8fE8hmPW5
	nDVood9XnW3/7/x/d+sc9stn9wFvr5lzSAvrcq4E4GSc7IShcCCVGF+lB+tIWqnYw4DL1aHqTdB
	erdK4ZJ+MHW2KRkAi/dkQmmwO1Pg1aoXpSyLPdhyFIR/rjh+U7ZLIPIk3EvX3CZHRAHJ1OunDaY
	LcBPaFsV8nD8qF86+CmN0c4C+nwvCx4IuN3Va9i7/43T/q1WapCuHWZqBMjHKSYrO0WsRPkICXn
	gJRSXcQZalusJX9USPS
X-Received: by 2002:a17:90a:c886:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a07e5373camr2045004a91.9.1790163553103;
        Wed, 23 Sep 2026 04:39:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4easm4654288a91.6.2026.09.23.04.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:39:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 11:39:02 +0000
Message-ID: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_043915_754678_CBFF97E4 
X-CRM114-Status: GOOD (  12.93  )
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

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and xgpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 26b04774621e ("gpio: gpio-xilinx: Add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_XILINX=m. Not tested on hardware.
 drivers/gpio/gpio-xilinx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..9406ce85f933 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -271,14 +271,7 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3


