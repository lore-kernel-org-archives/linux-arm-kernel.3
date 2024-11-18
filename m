Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B653FD49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=; b=IToXExvKwH/ShBxG6tpZtc3eKl
	IBbOfDoivy15deave2j1uipT90J2hsX6lSrZtNYsVIOJjsFW+k2wsqUGBkxse8hHExsOdREVTzESW
	C7XSMEcS4ROo3fFIsiZ/wMxsj1J8GuuqdkgKMCA2BpvpyGnkhnS4SFZCOtVi7hGd/n4+LXPXh61Yw
	HWh47M0gvKeT8oskHE7f4O4KFum9R0wmLI35u6+U5G0hp75D6na0bVCMC/YTiPa+cLIcZMQKx5Zxb
	lc6ACswqUxWxdnLOynQtENbbLXBZXeO23Dms5mbsiVUQRz1lvSPdiDtaigTws+klVDKRrMtKkZ7Dp
	9qEwdYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyii-000000091bK-3A39;
	Mon, 18 Nov 2024 10:11:00 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyhm-000000091Om-3nuF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:10:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa1e51ce601so367757566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924601; x=1732529401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=RuT7dIHdu0yPmxySdxPbRsv0A4R5R+IbVJPAuP+tM59EeDy9havTs9BZQG9cu1kWHR
         pinRYa5lybUpDcVOIYpk2SXO563YtjuLgAg/pFGnO/P+elJMWFm+I5/eoQSFvaf5yHDB
         sQBWEywi5/vbQaHzLxQraUEkoi/KlGPuNi75nJLDxu9EOX0FRjhZ6/XZxIXx6Os7QFpm
         QRLzCBztBImGaCSlO4kWw12Ag4KF8So9tuLRXKtLOfS3IhJ0Y2yA9fU7EKdI+byCM6ML
         YrW4SkECQ21FjiVS0Ai/cxE7Y/ZXZhZa41+35MtVunjFF6KKQDnnfu7AdSTULDRcxlw8
         4TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924601; x=1732529401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=wU7a6O3AKT04fPHgsJn+ILZUh/4WEDZTn+G2PxhI+bG4XG8MxqKSEnSZyRdyAUAGJy
         D8YYePcz4VLgNa9bbp/alZ11VL3sf2T6wqhEBuKih59vcFPa6iTYNj8+Yf/3m/cLgb51
         ohYb+wlnsuG8zcZsCQMSGtZaIYNZo6SbgJBp40tdVOFlpG1QLPtGh0zDmEznVW/VJt9c
         KjdM4orZSSD0mUaaUSsvfzvGY9RBWTbCDX/2OBINq7se7FtNGKSFFaC8LfHVc1npLu/f
         ZKjpRx9hfwwQzNHdlqwg3u7ErOLNY1WI9pDN/oXV+HH7INnhArOR2KcAb0MWTz286oSh
         pqOA==
X-Forwarded-Encrypted: i=1; AJvYcCUaBDB/vN3UdXC/zQzHwAj7qX8Xfd/5WDmo3UN2qc0WYMu6QnykvaErASqdNWwqJjPmBqd0UhnzYss/t/eI7wbD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1GNV2Ba9JWaRW5tiiK0ov3xcj8G4yYMLhSgnVExVlH4OTPmHA
	ns+ISfB0gKnvhVrXazz1nqHk008KRtm9pZtiEWhi+HUd0mvraMCY
X-Google-Smtp-Source: AGHT+IFVn+W6t7IcvDHzZ8JEBQMCSTtIpGFYZyel7ibDDUcP897/DW1p4IYqqtYfdKiVpsTwnCY1Iw==
X-Received: by 2002:a17:906:daca:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-aa48347e0fbmr879397366b.33.1731924601276;
        Mon, 18 Nov 2024 02:10:01 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:10:00 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:09:53 +0300
Subject: [PATCH v3 1/2] power: supply: max17042: make interrupt shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
In-Reply-To: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
 b=r/k4DDMvo/iWEzDXWTNKTdhAJ+2yN2gMZDbBBo0/+qpXaIxtBxrxlSbcICNM9WInILIvXpnR+
 +H8C6RzzOzvBbSTtw42c+JXXlJIvIZMBNAH/oZfjB9gXGMlrJC/ZiNZ
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_021002_954664_3E0B7052 
X-CRM114-Status: GOOD (  13.25  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Make interrupt
shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.2


