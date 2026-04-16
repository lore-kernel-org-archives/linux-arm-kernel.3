Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF3FF8A143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8KwIRBAxcL/Nko4wwgY9WARhqxl2Sh933ZVC+mUoA4=; b=PU4aPxCHxNxPz6JP4f2GkiFh/S
	u0I8fx06huTVnBlzmVbWtXD/Yn9UVY8fkP4u9xQY4MflGMLGlTmJKebrYxenb/yQ5M5GdGhehKLid
	Z5a2C1qmuEOmRrjyl37F8F/jzkNQN4vHJGCh+cDyXTaRKx0X6YYjb96kc3egReizSc2FrDV14CLyR
	DT177u02az6uZPSTC2eWaf7dPUr3S9/56ZMd2QNbYpP2KgumA95rCEmmC3L6mLRKsEbU4zRkLy2rH
	hfvlSKdQrps2rVicvC/sLUThT6XQvx1Shy8n6BBIVckO3bJbhSt7lfioPR4nYq/uCPpG4bMgoYr6z
	AzGHwo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDI9r-00000002BEg-2baF;
	Thu, 16 Apr 2026 08:33:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDI9o-00000002BDv-3KrK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 08:33:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b8efed61so4026385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776328382; x=1776933182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KwIRBAxcL/Nko4wwgY9WARhqxl2Sh933ZVC+mUoA4=;
        b=jyp2W1d5dLtN230Cjk5aTMGfhTinB6oHdWfYn9e3u7FTPJWWG6ArxdGZ1p8tnnEGz/
         furekoooupdpe3Rw84Us3RtSdIMTbbakx+rQVjAu6rERjZHesAxw3RL7zT0GsU7TEfxC
         VH7iURy0ix2j6HPhKSR4RDs3GSLQyKg6iaFevh618dH6rli/7q7cthRtGQRtaUlYKa/u
         Zb9Z4eJgW4xQ9TRjbhdwHc14EhxTDVFGuJEzHjcwyxwXlqy5/dhsiNx+9st/Acfw+0l1
         ybeGHRL8anv8NqwGpOK4roIAiXTnNH936ecl+kB8PJyVSCNzkfYp3Wgs8puEusVE8hSc
         A+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328382; x=1776933182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8KwIRBAxcL/Nko4wwgY9WARhqxl2Sh933ZVC+mUoA4=;
        b=Se7Yw+NZm+SuSXAnTJja0v7hmlc05OGnb9q86WWlCEmiBxT2ULx3zSiv3pbVnyvUMq
         yMndy964u0teG33x71MFJ3gZ8y7sL34DeSActyVQk4v8mCgJ33gdMeBLFedBrEMKSpuX
         gFQmuiE/BKxcMpSkxnZNF/iM/KD6drSk1WAlpen1Xb2Wn5R5htS5A3NWnwB/7inBHdpd
         7dpT376WN01urV+yCMFLmBcvuifv17zLbyHldFT/6DYkP1ffq1Ld/nNXMJN52IWBeyg5
         81WtF3GNt/fi0pvxEIuzwHeT3QKfOHTsKgMx3x+muRV2HSucaHhARLALqN1F6WfWO3o8
         6Chg==
X-Forwarded-Encrypted: i=1; AFNElJ+Vjfh80BWZ6VRYJCAQJURyZoQia5I8tJY5EHeNhv6erpotfzW2K8GUvs1q7/6y+vCs4jhN5mCwpyuGTUiBHBpY@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOknEWd9xxFj8Ss/sUXEqkds2CtylboqwsI6e4ErK9GGGoLQZ
	2AYoPlCnvqTS0RqedcYxHbAGM7euJDJAdKpjrZC931pnkufLHZBCMjYo
X-Gm-Gg: AeBDiescoK0Bla5xt5ZD57uwJAPX4ZaWm6oHIp9plBRF9uuKoZ7jOmdow+8xyr13mMn
	6wXczIqolIciYOzxZLiapLi3LC4jq+QHOFH4iqryOy5m1bjygm49/lrFXmIkp0lDGVbECGeOg16
	IpcfjD/VbWtAFjygYGzz9XhLVCKT/4msJ+AeVKw4F7e+jrhuk2txq5Ng2b8B1amZ1A8JtZm/k5g
	Dc3GkuuIQRCA6KEnAq6a1JHJTbgs2i2pSkOGGpDf4Lv59bJp0r/EnRMd8HBTuhe5a8ZlA2JjWWF
	jS3hwPjMfZp7sFPL/P4CzAZMHkDrUkCkTTkZl3mqVQ+xkkjYA2Rftph79NONMB/w7nnVm7V9Czc
	zxorkaff+s6X+aJK1WNKNvDIW/+thrOyu7xyHvwypeMzbqN5kfv+PasYagqelJu7ifQr1qOo8mB
	qO1x5qlDo+tn5ihh38GqpECPqwpVFi0Q==
X-Received: by 2002:a05:600c:1549:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488f4823c3dmr34362705e9.13.1776328382058;
        Thu, 16 Apr 2026 01:33:02 -0700 (PDT)
Received: from fedora-dev ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5854097sm41107735e9.12.2026.04.16.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:33:01 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH] serial: mxs-auart: Compare the return value of gpiod_get_direction against GPIO_LINE_DIRECTION_IN
Date: Thu, 16 Apr 2026 11:32:54 +0300
Message-ID: <20260416083254.1798-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_013304_843517_0E8D8B9D 
X-CRM114-Status: GOOD (  11.92  )
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

The GPIO_LINE_DIRECTION_* definitions have just recently been exposed to
gpio consumers.h by breaking them out in a separate defs.h file.

Use this to validate the gpio direction instead of the hard-coded literal.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index cc65c9fb6446..6c6df4d5c21f 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1519,7 +1519,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
-		if (gpiod && (gpiod_get_direction(gpiod) == 1))
+		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
 			s->gpio_irq[i] = gpiod_to_irq(gpiod);
 		else
 			s->gpio_irq[i] = -EINVAL;
-- 
2.53.0


