Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81660C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpeFXhV4Pw0wk1JPopUpgr4/oRK7CGjNZ/FePo/8uZw=; b=1/Pv1z4Zm8y2dw8jsxQ20CESt/
	LhLG6663HZxYEvO/9iGX1v38H0EF/NObuRYVTR1u3LMbGWJj06kqbyfn2QW0Hvyg9BLpMNxnhqUFN
	n1ARWUM9oBe4LtbK0iSwEBmI73xGDwVcyX1RXJjKF+VJkMn6QWOfkvcIxuHeNdU/Okn5x+A3vA+VM
	QxJyBzHCVcQqAq6WCMTt32nQV+U6mpMwDWPgjx2v8AKgIwVrHD6YKd+za+2Kdfvw8a2k/i83aWJQY
	tmmQ4jxLbGjkQPNPE/c+A2oFAMIWY+h0tVSdRMzb+CX6mSLVBrDa42CDpPZKRVTKDquaINE1F3oF7
	ivJ6TJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgD-0000000Gzva-3xDx;
	Tue, 30 Jun 2026 12:35:09 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgB-0000000GzuM-0pkb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:35:08 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-30bf132969bso6449067eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782822906; x=1783427706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpeFXhV4Pw0wk1JPopUpgr4/oRK7CGjNZ/FePo/8uZw=;
        b=ECHToqZs3atoC0x/IOx+7/O9keWumcilHKmGNy8hgMt0JAXs9USwABpLgzpXByzBWm
         48zwUAsv1PnxIBTJKGY/aAtrmtMk+d5ZZ18Cl1JKZI5X3Cu+kYV/UwiNzG23nEKoSeYw
         45rcUsKmt7WFdX0g2Ij7m81OU56UElbDn/ZbFxaob/SDqiDI1I1zkD9mQQLI5vnxkD6a
         MMbArbux5cCg59XCjuFbHGohapf9XEqjMQkXPjjTqQsJecbNzYlrCCDGhqUHOm3P+r0J
         4lRXGiBy4z3wxK2yJkJNpespC2GlmAT0L5W5pFun/GiaKenkneagx6DuainDklQSni/G
         Wk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822906; x=1783427706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpeFXhV4Pw0wk1JPopUpgr4/oRK7CGjNZ/FePo/8uZw=;
        b=qh9H/KdI867VCazm3Kf6t5GxGmQ1LLo/o/s8sfBwFZ8affj97FeOvxU2fw0b6hBTFy
         ieUpZNNS/XhWKtVE8tWXVNcNK/u5iTiFsb1rs/yhYplO0g5r8pCxGJCER8YYybGkI4EB
         RoYZHRQtVbIg8PwSguTN4qgC5IzzGYJk2CIE2A3JOxDcR79xOrVYuuE45iGsR7pEc//o
         12auWxJOkyxCAIOimQCnTIvzS78AXK1bEFyiU0ZHSbr6IKmnJw2t0Se/xMeCPMTxjDlh
         aw3vY+P4glz2feomHMMqTOxqov0IMgf4jX0VLpWgSXyCUAkxHcjZd/TqU3PjKTg7Jrt4
         YXLg==
X-Forwarded-Encrypted: i=1; AHgh+RoobZ2C2Iz7a93b5d3emXTOw4szlmwH4Xm9j03PseYyyl/99hoV5KGHoWhCNyBJ52HmVs77RO1p2KdYCnQiqArW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp3vcqCWvFPRAJACe44CkRIpD42dCoFcCYwuShSYcjZIFkdH0F
	Yf0jVE7IgHsP/MeD8/SLzYR7EajNBR80+6eJTHpFnGb8twx1z5ROQN/U
X-Gm-Gg: AfdE7ck0//c/roYaRCH4KW0HEJwE2t+D8w/76fIU1+jxGpTznJNH0ag1QxC8+b+cGz6
	xixlw+T0l42bZGspTfmzAEyPVQpvEq1ykNIp4B9zd2GypgAiWmLOPsMnDdGI+SFGv40dgOjTx7u
	wssGo8YJemPdcgkp9R9q0vQ9Q0YHhRqCa6DVTKoQ7tiieZjNll8nalJA1BMrZKqNQBU8DPayWhj
	cOTiR/XBmiWRXByzDtuO8cXfMjMSqUg0AG4bSW49VlyDNsjGBjh4R1lUzYvTQyP/UQbOYTeqAdD
	jt00KTSmEjLKFiiYe4IcUS/Wh2K/k8IGBslCIGzMVHXO9k4v+Jb9aoTGqPYLb5hi82GxjZQVbQF
	J/nlinZ8gzFVMH8KnSOSRz+PqBHcF46I5PTF9bn7bcIf2c+iHgZsCLXbDTHV1yEvFF6XGipXb4/
	wjOTQWAb6vq7UtyF+E1Q==
X-Received: by 2002:a05:7300:724d:b0:30e:d6ca:61a2 with SMTP id 5a478bee46e88-30ef09f6f70mr235729eec.35.1782822905746;
        Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f6:ed7a:33b0:ccdb:e58a:b126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee327cea7sm8743218eec.31.2026.06.30.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] media: pisp_be: Propagate platform_get_irq() errors
Date: Tue, 30 Jun 2026 18:04:52 +0530
Message-ID: <20260630123452.14226-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053507_233653_E9CB2F79 
X-CRM114-Status: GOOD (  14.17  )
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

platform_get_irq() returns a non-zero IRQ number on success and a
negative error code on failure. The driver currently returns -EINVAL
for all failures, which loses useful errors such as -EPROBE_DEFER.

Return the error from platform_get_irq() directly.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2ffa1..06644d10ace0 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1703,8 +1703,8 @@ static int pispbe_probe(struct platform_device *pdev)
 	}
 
 	pispbe->irq = platform_get_irq(pdev, 0);
-	if (pispbe->irq <= 0)
-		return -EINVAL;
+	if (pispbe->irq < 0)
+		return pispbe->irq;
 
 	ret = devm_request_irq(&pdev->dev, pispbe->irq, pispbe_isr, 0,
 			       PISPBE_NAME, pispbe);
-- 
2.43.0


