Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0CBD609DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8u/tqgNbTDWlnzWRktGlQ9tYzEXbqX8e0KFyaCvDAo=; b=YcK6xwHsjZc4zS5aYOwx4dWCF1
	YwSfgigpuFKcYGRcjYHhkp0W1vmj6JxUkf8PerasVxSStlOtwkEfv+6ykm9C65DPOmNO1R5IUd3zr
	GcN2C/nT1FyJvlDwKzd3Fa7YkoDZqkQjy5rew5IZQAECaRCnCAXQ12vz/anAX/MLuPjV8n1dC5G+V
	CI7ryqRwg33yfWQUuCA6XEAdQp6xTerSdJWJPfYE/E2/exv4Xf6UeNrpkl43T6ItwYbI9sh2TRB9I
	v9bgIgnxZQ02mLumYdD91Dd8OdO3DL6gAKubNIA1GglVAjhGZGzVHK0cK74DKo7V6IH+S4NZMvoeS
	3g+R1n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG7O-0000000CzhV-2XkK;
	Wed, 27 Nov 2024 11:22:02 +0000
Received: from mail-wr1-x464.google.com ([2a00:1450:4864:20::464])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0w-0000000CyIB-3lFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:15:24 +0000
Received: by mail-wr1-x464.google.com with SMTP id ffacd0b85a97d-38246333e12so6524144f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706121; x=1733310921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8u/tqgNbTDWlnzWRktGlQ9tYzEXbqX8e0KFyaCvDAo=;
        b=cA7UMZ7Wb3XpEaX5qEjpzAibvFoX9n2mGCYfiHGbUfXypCY07lGln0IsROhlDEMgDY
         1nBr5G8jSeyKnAG9RpFCEyIRDFBIyXU30hDsr99k29ejIGX5WlGzbVXdCW0/dWNp/BuU
         n4De2mYcY/soqWnTgyCrxlYIRlLCbbzAk8rvZa5AZr6STfM6xCR+txsBF/lotFvUN8gN
         QLKzVIVtp8/cy67SJdo4MvpDYEP/3OUpiIeryjWJAmzT9M3JSQcySKbbvHjz2sIXnSGZ
         IDEpjzzTP5oVn4U8MLHDHljmwYzJPjfpBg4pg8mLqA8Kflsw6UuWc5VMO1pCQJFaS8AW
         X8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706121; x=1733310921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8u/tqgNbTDWlnzWRktGlQ9tYzEXbqX8e0KFyaCvDAo=;
        b=on7t97ODFPHCDt8YQRpgBQNGeUJwLWZcFStY1xg3styBKtqzNvY+SaFIprmXzN6Orl
         bKzzKXNnMZGZs/zY8Jyu+HaDoO7K3otPKx0j6CKRR/DGHTnIYNHTdQm1Ft+zc+dVDbqf
         OsX49LGZ0U5gigbOqKEm6WvH1/6daca9LDD5F105k0Y6lKtAUl820DGSf0MzOuA0BwOX
         APejAjRiinPXFzq/px6vQjbw5rtGHYQUwdHjSikBcXQUgI9LVt5UzHOPwEgkoIVAwfOt
         nmICQTA3ZunFOYUv+/EaMgVuWHyoyS/yFqVkAk5ebqGxdx16MVy/Q1TAiVo4GQcCDzkG
         PiPg==
X-Forwarded-Encrypted: i=1; AJvYcCVidmJs/cfkjX3TyBA64JSJDn3SCFoG2XfrW/h0LS6DcthaG9KXIE4Qr8/CB0gdmdFQqYM3tInLQV91CWVW2zAr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5pPPXTcxe6IYhImT6kxzrkmPIlBhhBnXCEDJc7fZ1wx41aW80
	UhVcmq3z6YjBhaR5IqhdqpTrX3D4w1hUoCmS3iXSkL2607oJHW/kW3bj/3C81yzwCohijl2T4Pw
	XAyDrjlsK/VW+r5xWIN/6/KykOR05MJ8+
X-Gm-Gg: ASbGncvcok7o1Hyp5hHENLyS9fT7XfqX3CP1wNUoArHSO64+4KKn6lrsXdvvwpNOuWG
	yyc0jNQmASaTF35zgFnXa8WAGZ0GnJ1q6NvB7VKTNqNM0ZjQS4lyZDOBuQIAaKeQgMr+2iP+c4D
	KZhekPfFZ983K0z7dXGes/xad+mpNhAks81DRf4xgDWRi1OiXHneAf6JNWmlKklyHvzQzWiRQ3/
	BzRu1QitbZHvlTEcEwHi7xzTgmTTn3dJIvOkBLUivIFEEwwD/JIIrq+fH3eUnP00Q==
X-Google-Smtp-Source: AGHT+IF6UYuhlMZWwu6G6XRnHvnHedKpIlZ7ngLVPHb1A9KO+apfgpcWvh597QK+I/YFytjWK0k3yOJSuLhK
X-Received: by 2002:a05:6000:389:b0:381:d890:b5b7 with SMTP id ffacd0b85a97d-385c6edd314mr2620035f8f.52.1732706121160;
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fbee19dsm441144f8f.82.2024.11.27.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v2 3/4] drivers: media: bcm2835-unicam: Disable trigger mode operation
Date: Wed, 27 Nov 2024 11:15:14 +0000
Message-Id: <20241127111515.565992-4-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031522_936696_98B6CF1F 
X-CRM114-Status: GOOD (  12.71  )
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

The imx219/imx708 sensors frequently generate a single corrupt frame
(image or embedded data) when the sensor first starts. This can either
be a missing line, or invalid samples within the line. This only occurrs
using the upstream Unicam kernel driver.

Disabling trigger mode elimiates this corruption. Since trigger mode is
a legacy feature copied from the firmware driver and not expected to be
needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
effects.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index d573d4d89881..550eb1b064f1 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -834,11 +834,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 	}
 
-	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
-		/* Switch out of trigger mode if selected */
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
-	}
 	return IRQ_HANDLED;
 }
 
@@ -1002,8 +997,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
 
 	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
 
-	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
-	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
 	line_int_freq = max(fmt->height >> 2, 128);
 	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
 	unicam_reg_write(unicam, UNICAM_ICTL, val);
-- 
2.34.1


