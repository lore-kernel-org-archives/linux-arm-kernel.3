Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26278E65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxccnoYuwLE+PxJ9V2hHsdBypkFSFevlZOlX7TLkWt4=; b=Vw4TM0o4QbTv7tdnTQQHpZ68b1
	U2S/da2YVs7VJwQbsy9QqAqXWZRP0ZWAQ6nvPrgd1CMvmV2w/NxKIs5/WgHkbh8wfj91vR4DhYHwS
	CNoOTRFdsX32gBs0P5TirIbjnrOLoxj+iX4q0qMwZYII7yTQTVH5WgSYgEIlq83FITlH4jkJo1aCT
	JsZMNLG8Lz72FCvFa/7U5hWqG0xRKGLmJRBpk9x+M4mP9EIoYyZMa7AtH1PdYcEga6su1McYMxMtV
	e+mIJXqAKf0AGaBv+65TF49ufbUPDdVklrTGBPGdW+ZBVmCNAEsqn81y9AUin8WkOmbdXhUkfGlk1
	SKboxVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPJI-00000001y86-0pFo;
	Fri, 22 Nov 2024 08:46:40 +0000
Received: from mail-lf1-x161.google.com ([2a00:1450:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEt-00000001x3p-0qiN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:09 +0000
Received: by mail-lf1-x161.google.com with SMTP id 2adb3069b0e04-53da3545908so2125541e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264925; x=1732869725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxccnoYuwLE+PxJ9V2hHsdBypkFSFevlZOlX7TLkWt4=;
        b=ULwt8eMZL74/Lko62Ye+qpuLZVCGfduc09SmOeC24iG80oud6Nzi8iYqEkbn+jfjug
         5SVfYFjNABk0mSnBQg6hCkxF9tKhXankxhufEqMUHtajQ8VUYB2LGNzuZUf3uUGxJLNG
         elrBHdTV28Ha3mIy3+Tq0Scl+VATWPdrxZKI2Aazr7pMQxxRl3HWaSHvL06vIelQ7LqY
         hZMGsoh5hf/PCdGyuStvdUNzKCxG++vhoJSBHkGCGaeMgfxLX1O0sPE6pTEsyJKHxzJ0
         BeY9geXyqBpiueVR1cokizjXCfR8IwRjy3jNIeGR03nQGE7lByd+gM9JVc176DsehvDK
         ihyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264925; x=1732869725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxccnoYuwLE+PxJ9V2hHsdBypkFSFevlZOlX7TLkWt4=;
        b=MJK3WgcTdFD2sjOmsv1pX3MR4Lthjsl5PX4LLqZRf4AQtkq1VJAekR7TdwuLvGilzo
         YZEfV3gI1ul2TTDmXwak/Kyf0BVZQQYE/P/6o6yNVYPdS1ZTkYikvaPWt/dACvZWd/pS
         eguHKsU5Obgurb3E6VZSerwPaQK/acq/R4vpbjsryWfoeTsB65CtqcHTAfLoYYKeQ9vO
         +L88/L6QgZ25Y2u3sB1qnoj9Pe7BDR+7DJEH3tztcVaTBbPut0uPBbPF4+SYA4wSRJHP
         PxszgvKeUWqXWRBd7ipMrTxL6R3uBvAXzZE1TbszOjYdvkzovonXnktKwO5y4ZGRgRZ4
         qdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUwGJFFC8dTXro4VLnPQWfUXisLBpFEnsFCIICwhv1/a7ZdCqGvEgJ1rxmY8fZ3Bv71ZYxlZWrixraF9nSnqoTu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/VkpUZeqPWb5Cys5TAQSGNHHgSdSBphc98ACEbpLFo0rmhQ0T
	/c6BJ943rKQAt2z15hDl/LHzE2TLjb712CP2aD7OpRtVv3teGcLPzd8tShGah5h/nXDGG2f6HR7
	kPhr0CmFAk08Y9ZCA8ypocKBENyCWQxye
X-Gm-Gg: ASbGncsOHcIp50yBFIgQgVv4zisVHDvqnD1sGNVZlSxld3kI7rsBOUDaxuNVO49BhCG
	+3sT841eoel3JC89whWny5wJjflnfWWh6JOrwhIXDScmeA5M8z0pJAHn+EnI/BIUy98YrJqsGul
	j8Dc7i6//MtVTV0OVmM4A33OSehclQ8Hg4HW8EaobPf2zgV7psdpF1T5rDDIGqvzdkXdyaDpxSV
	klazMBMb/Rt3ABv+Sln5jAV8PEJc/iYibg/PrVaRlOoDFJoVlIjEfk5xU7EJ2AElg==
X-Google-Smtp-Source: AGHT+IHwAlWOag/sSwnY+xt8RVwblyGZ6BChTdlH0nZynOM3MgSiC7yPR98H0nrko8vSm39gGYDDmHy7pXJn
X-Received: by 2002:a05:6512:b9a:b0:533:43e2:6ac4 with SMTP id 2adb3069b0e04-53dd3aaff94mr774659e87.49.1732264925192;
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45acd1csm3682485e9.17.2024.11.22.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
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
Subject: [PATCH v1 3/5] drivers: media: bcm2835-unicam: Disable trigger mode operation
Date: Fri, 22 Nov 2024 08:41:50 +0000
Message-Id: <20241122084152.1841419-4-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004207_524092_E7FAB3C5 
X-CRM114-Status: GOOD (  12.54  )
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


