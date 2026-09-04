Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BADC79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2A0zeO3ugV0JUUNHg2Amdc4tuaijpGdF0pZT16CH0g=; b=HrCRlGxIKEt2on4Y48tmaez3fT
	NH3l07G61r3Fa8aoReJyEMjoB87drI/Ph1UbGh9wC0kUOf3iN5G/Hljn09WHtcGz7kfxPR6KTd7VR
	VFePtN8kJJYt0jiirmGtRvPizcVMYdz9ILWVf91Rq3nIhwo0RY+5IRl8CrLSZbAKxXDDrJ37ke8cg
	iNsifeDab7wNr5CT8Ru8ntygcxYrToMRcqt4IbPEQMRJg0kba2cWIB56THNiJVeCQzWwHhBVwYX0S
	04BT2mfPz0w1Z/cIa9AeEI35E2oBosR8Ws1aiBLTecobA0HCXDnkMoqcAgS24we27sT6NzHzUwyaH
	4Nz08hKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RSr-00000001j7e-05pX;
	Fri, 04 Sep 2026 10:48:09 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RSo-00000001j6f-1b6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:48:08 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7ee4399c3abso830330a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518885; x=1789123685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2A0zeO3ugV0JUUNHg2Amdc4tuaijpGdF0pZT16CH0g=;
        b=kpG+AcWQsS6H8bqLWRBHQgRE7OvAxL5dSISyVh/IXESBUuV1XBkm/MM8HU5Wf6Y+DT
         yVdbyZy58OIOWnueclkfY0S5xJUyiq7kdz7JJ4o/qo2va3Xmhdqj58KkR9RBOaVi9WFC
         CmauC+VSifBkNl0F7mIB7jDWDk4rXsBjEj+Ogl+X2kLLCOOMqQUdqc/0tWKQu2Pzf/Qr
         o44hHTxFi69JW5qXHQkSAbkASR1wbeOBR25/UWHlRDF8u7zVNgZV+QIQI2nN9tNuWaBR
         NENDmj6F/WmAWHheHeUTssdokkK7OsJUsKrxRDcIIz2+IJu0At5LLoZvK7ELsL784lqz
         rsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518885; x=1789123685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2A0zeO3ugV0JUUNHg2Amdc4tuaijpGdF0pZT16CH0g=;
        b=P81q7f7Tyy9LxUH4YBZNXuh793i0F5eDkN9AHwX34Gp5Phh4r0z94dWw0Dxy+oCRDH
         +fZBmNkB++lc5cVG2u7jR6lX7UShIGGHdrDpunCJKAquABkcJHzWatTR/pCbBgKpS61L
         7h9EjIADfoD7Y2CqZf8TEHs3Z+JVeABngUG5aTRfuoq+GkpHQM90NOMLCPBgGjKsYPVY
         PjASI+Ldl77pwNQk5llLUpaAGMLZEFQurEPqBog0ijfKwOa0Ice1f9dPPeI7MtODeGBz
         O/KXzn4JxKdXPhLx+YnrczxFYsUzj3fgVW7FpI92m8sMecHwdfvy7SsNI0zilYH8/az4
         roWA==
X-Forwarded-Encrypted: i=1; AKwUvBxgVKrdJAFX8AN4Qjj0PBVK6GcdMvTi+YGh6ZO0kEVFIRdV0vYqBkxkk7XnnnS4MvZKC6FatdbaffxQuX4TtYOY@lists.infradead.org
X-Gm-Message-State: AFuF++m9bIjXSt3QtKJvu28ydiV6aMfPBwaCfzjMwlhzBBe3v+hsepq3
	WQS3WuPj1Ac9dX0FgTm1UFZzUBjfaIfRbF0/DZW06qeVNcVMamyZdONr
X-Gm-Gg: AYBFou2pnr45LBnz6+/2aPmUjw5SET1748mCb4zmVH4q7b95vvqDPYyvGrpruzUlDq6
	t3DYjo7hhDFIzK7gSMU8hweRhgFTOThnN8VeAf7cDlRs5x4T7GG/MjBJkM1ZWYNaSibp/+mQ9Zd
	OYmoYKZnlr36LoTK/TxhcBjb8v6467IVCshBBY33iVd5/sSsey1vbwB6dfF0eqUoXulabX1iG0H
	NRyAGlzQ4iPquCLP/70hhIAuyjO6CkIK/iZ/YvKKWg/hLB36lxJpaCTAFJ1QM7B7/SM14vzI73P
	3GKe5jQspiqOTOSkz6Wq5rG4q085RnqlDB8wtA8cw7f25DqMe0uRCdtVK8ueXo8nBefh90hO1IQ
	wvKiw4ZYjm42uf/7Ch1VzvVIqss4PacngzqBSwxszpEHWxN8MvePusP2lpjrnkoqZ/8ayfuIC1+
	R9qtJGcO5HE1hiLtaA0tv9dXWtJqusiwrQfJatSbRdn8rOdvwuU59WDO1jn+cu6c9QQyD+l7WHq
	1qQVdurL7uiE9g=
X-Received: by 2002:a05:6820:809:b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6b783c6033amr1231122eaf.42.1788518885125;
        Fri, 04 Sep 2026 03:48:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm5858825c88.11.2026.09.04.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:48:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Joshua Kinard <linux@kumba.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] rtc: fix typos in comments
Date: Fri,  4 Sep 2026 16:17:54 +0530
Message-ID: <20260904104758.23905-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_034806_426548_A1A98BBB 
X-CRM114-Status: GOOD (  20.28  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/rtc/rtc-ds1685.c   | 6 +++---
 drivers/rtc/rtc-meson.c    | 2 +-
 drivers/rtc/rtc-pcf8583.c  | 2 +-
 drivers/rtc/rtc-rk808.c    | 2 +-
 drivers/rtc/rtc-sa1100.c   | 2 +-
 drivers/rtc/rtc-spear.c    | 2 +-
 include/linux/rtc/ds1685.h | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 5fc8e36b1abf..beb987b76f24 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1231,7 +1231,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "Main battery is exhausted! RTC may be invalid!\n");
 
-	/* Check the auxillary battery.  It is optional. */
+	/* Check the auxiliary battery.  It is optional. */
 	if (!(rtc->read(rtc, RTC_EXT_CTRL_4A) & RTC_CTRL_4A_VRT2))
 		dev_warn(&pdev->dev,
 			 "Aux battery is exhausted or not available.\n");
@@ -1395,7 +1395,7 @@ ds1685_rtc_poweroff(struct platform_device *pdev)
 		rtc->write(rtc, RTC_CTRL_A, ctrla);
 
 		/*
-		 * Read Control 4A and check the status of the auxillary
+		 * Read Control 4A and check the status of the auxiliary
 		 * battery.  This must be present and working (VRT2 = 1)
 		 * for wakeup and kickstart functionality to be useful.
 		 */
@@ -1407,7 +1407,7 @@ ds1685_rtc_poweroff(struct platform_device *pdev)
 			rtc->write(rtc, RTC_EXT_CTRL_4A, ctrl4a);
 
 			/*
-			 * The auxillary battery is present and working.
+			 * The auxiliary battery is present and working.
 			 * Enable extended functions (ABE=1), enable
 			 * wake-up (WIE=1), and enable kickstart (KSE=1)
 			 * in Control 4B.
diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 21eceb9e2e13..44bcc0678dee 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * RTC driver for the interal RTC block in the Amlogic Meson6, Meson8,
+ * RTC driver for the internal RTC block in the Amlogic Meson6, Meson8,
  * Meson8b and Meson8m2 SoCs.
  *
  * The RTC is split in to two parts, the AHB front end and a simple serial
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index df5e20cbc26c..d0ebf4fd227b 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -7,7 +7,7 @@
  *
  *  Driver for PCF8583 RTC & RAM chip
  *
- *  Converted to the generic RTC susbsystem by G. Liakhovetski (2006)
+ *  Converted to the generic RTC subsystem by G. Liakhovetski (2006)
  */
 #include <linux/module.h>
 #include <linux/i2c.h>
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index 59b8e9a30fe6..718f19b5911f 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -295,7 +295,7 @@ static int rk808_rtc_alarm_irq_enable(struct device *dev,
 
 /*
  * We will just handle setting the frequency and make use the framework for
- * reading the periodic interupts.
+ * reading the periodic interrupts.
  *
  * @freq: Current periodic IRQ freq:
  * bit 0: every second
diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 26b2f4184ecc..144bb6fd8f6b 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -228,7 +228,7 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	 * initialization is unknown and could in principle happen during
 	 * normal processing.
 	 *
-	 * Notice that clearing bit 1 and 0 is accomplished by writting ONES to
+	 * Notice that clearing bit 1 and 0 is accomplished by writing ONES to
 	 * the corresponding bits in RTSR. */
 	writel_relaxed(RTSR_AL | RTSR_HZ, info->rtsr);
 
diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 959acff8faff..74d4aa96826a 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -43,7 +43,7 @@
 #define YEARS_UNITS		(0xf<<16)	/* years units position */
 #define YEARS_TENS		(0xf<<20)	/* years tens position */
 #define YEARS_HUNDREDS		(0xf<<24)	/* years hundereds position */
-#define YEARS_MILLENIUMS	(0xf<<28)	/* years millenium position */
+#define YEARS_MILLENIUMS	(0xf<<28)	/* years millennium position */
 
 /* MASK SHIFT TIME_REG & ALARM_TIME_REG*/
 #define SECOND_SHIFT		0x00		/* seconds units */
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 8ec0ebfaef04..55d3edc7e972 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -200,7 +200,7 @@ struct ds1685_rtc_platform_data {
  * access to the extended NV-SRAM by automatically incrementing the address
  * register when they are read from or written to.
  */
-#define RTC_CTRL_4A_VRT2	BIT(7)	/* Auxillary Battery Status */
+#define RTC_CTRL_4A_VRT2	BIT(7)	/* Auxiliary Battery Status */
 #define RTC_CTRL_4A_INCR	BIT(6)	/* Increment-in-Progress Status */
 #define RTC_CTRL_4A_PAB		BIT(3)	/* Power-Active Bar Control */
 #define RTC_CTRL_4A_RF		BIT(2)	/* RAM-Clear Flag */
@@ -215,7 +215,7 @@ struct ds1685_rtc_platform_data {
 /*
  * Bit names in Extended Control Register 4B.
  */
-#define RTC_CTRL_4B_ABE		BIT(7)	/* Auxillary Battery Enable */
+#define RTC_CTRL_4B_ABE		BIT(7)	/* Auxiliary Battery Enable */
 #define RTC_CTRL_4B_E32K	BIT(6)	/* Enable 32.768Hz on SQW Pin */
 #define RTC_CTRL_4B_CS		BIT(5)	/* Crystal Select */
 #define RTC_CTRL_4B_RCE		BIT(4)	/* RAM Clear-Enable */
-- 
2.48.1


