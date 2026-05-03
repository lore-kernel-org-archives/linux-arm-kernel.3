Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141F5CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RbGHm08BxGQD7aCQOyLWw7aVLNNFoqSYxYwfTxucUlU=; b=yKOi5LMhh9K4gQJJe38UckhZ5Y
	n1LLHNVz9QBO7z3TppqeGC029RqBmGwSoJyqIPkZe62Arm/thuEH5LUDy3cuqLR8DmTfbODpPFXZH
	uJBbhlyV/1gClfIhIxdztaC5/zayMrd5ZDDpP81n2EIDmg3YAmQDXEWLDrXrj5yScgTyH1nyZ5e37
	yYwJFeI1MBX8nwJ0Nr0IF0o4ikF2ZFEQ53VJnM4yMpY+/lwn69Pr6FceV+gHdXOpz1iHSyh/ZjIP8
	Y1K4/83Rp+LXQVk7vUCFNv6Nn3U/XBgrP92u7XvlopfxenoCT13wqwjAVfB9zdiDjRribF5yXm+bj
	GQ8S/gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdBC-0000000BePY-2l20;
	Sun, 03 May 2026 20:12:42 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdBA-0000000BeOy-0VYC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 20:12:41 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7de431da8fbso3206392a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777839158; x=1778443958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbGHm08BxGQD7aCQOyLWw7aVLNNFoqSYxYwfTxucUlU=;
        b=bTfSMnTnSo2C51nMYMwWSsKMNPlRpTXIcAd6cthSMu1HgAJoh/TlJzwARhPTQdhnJS
         pa79gzoRwtHymJ6QnJs32sIoPLJQXLf50ewNCnQgcN1JDwZzXgFtxGwsIyzNcSnfGPrB
         1yHKihJnzuF6Wze0JhLmWjRigrNpgLXBgfl1LOXYGdPCF/q87CrUBwkUzvnerBuYzuHP
         n85blFS8ZLNLLA7zcpPU1zjJfE5/0YkV4pjZ//ji75xnDHraZEcipd4v6FNXcRBZSJgc
         Jk6YQYJeO7QMRqpy3/rt/8tzr3639l5Zo8O+F86pBj6Z5RuMYkf1WIgNQE/YSul2cDQE
         wiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777839158; x=1778443958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbGHm08BxGQD7aCQOyLWw7aVLNNFoqSYxYwfTxucUlU=;
        b=iZ0YwaBotb8U8nFX/6+5AWHHU+53i2AsYqH+EBDnIo55ZuZ33HzjyS3sQT5/tpd91x
         F4WJbkt0V5XpvEA2IYibqdd9UbSzKTzAyPIRtnYaIZY+mMAsvWhNtBCKh6XfuFOSJx1g
         jMJapJ2wu82N3AQVAVgqTKKg4A6Fh3NSBm/TjbNEcHK/RLL5F6NhpMbk2m/ZJS2ofRXH
         XDkAlw50ahHLTST6JPqfYjXqhOYsAksDkfhPuY76ssx7XoOIGR48LTElOZqbIrdYDi7d
         I2sxISF3IJCvuVMJX9WJgk/3CG8vGKcMq98xPDyM1dL8UTxQsH4EJDoMa7uSTKL+no1d
         51lg==
X-Gm-Message-State: AOJu0Yzkjc1eeRFWzAvN4PDCILQcAv/7bgpqDVCSGmZ/15Ap1RJiuiND
	4fBNp5KDmKupL4YtW/hRcWqXoi22BgqrE5PMtS65Lfi16VMqw2g+XOb7bT0pLhU5
X-Gm-Gg: AeBDiet1QNKiDDtdodUhWkaMdx6sWpa+dpm+JjGGNyaexN832hj7UEEuC+7afo4W6BY
	AC/JWwGZRoRkmvj9pxfp/ONgfzU7/JYyjC6TLIYcZlcQHf2BGTooyIh2bfsYZjvKvFfhLj5OX2A
	JOX1ZN40Qy2/nabrd6+WW2xbKN5st122ipXYWxM+n8mGLmH2XEuQK8qbRjX/fVRhH2RkQuFEXia
	HTbl2JFCkBmh8Rfp3cAGeA7MOvoH9TGe9P5bp5IfXiOOBIgrDDgZs5bY7fPH4JgiEJub5hJhc/Y
	lDzd1qOFIeGE3IUacmZ7cCmueMP4pho68kISwJ5emdEylCcgVHh5rcTM1Q9KQ0L5dVAt2AP1WT1
	gSBmhE3rmUWJ0xQZ1LzMKJbsbVrtgkmcqZ59HKmGgO/rvOWsS6HJWwhg8ptJT6lz7RfD9q1FiV4
	uKTCm+w0XFznnRBphNAugdQahvtk9mWakc7CZdQtKFhIxYOYggUgs7mb6uFBLM5lJZrNxv
X-Received: by 2002:a4a:e90b:0:b0:68a:af54:cb61 with SMTP id 006d021491bc7-69697e1852cmr3063891eaf.60.1777839158605;
        Sun, 03 May 2026 13:12:38 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6968947934esm5194328eaf.8.2026.05.03.13.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 13:12:38 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] rtc: ab8500: replace sprintf() with sysfs_emit()
Date: Sun,  3 May 2026 15:12:36 -0500
Message-ID: <20260503201236.29685-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_131240_188747_E78DE0A1 
X-CRM114-Status: GOOD (  11.20  )
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

This patch replaces sprintf() with sysfs_emit() to ensure proper
bounds checking. It also simplifies the return logic by directly
returning the error after logging, instead of logging, calling
sprintf(), then returning.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 note 1: original patch can be found here:
 https://lore.kernel.org/linux-rtc/CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com/T/#t

 note 2: I rebased this on to v7.1-rc1 to make sure there wouldn't be
 any merge conflicts.

 drivers/rtc/rtc-ab8500.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index ed2b6b8bb3bf..c6147837f957 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -284,11 +284,10 @@ static ssize_t ab8500_sysfs_show_rtc_calibration(struct device *dev,
 	retval = ab8500_rtc_get_calibration(dev, &calibration);
 	if (retval < 0) {
 		dev_err(dev, "Failed to read RTC calibration attribute\n");
-		sprintf(buf, "0\n");
 		return retval;
 	}
 
-	return sprintf(buf, "%d\n", calibration);
+	return sysfs_emit(buf, "%d\n", calibration);
 }
 
 static DEVICE_ATTR(rtc_calibration, S_IRUGO | S_IWUSR,

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0


