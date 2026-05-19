Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5EDCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 00:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zIbP4h9WDI9+Yz7sY4YHYJ+etVo6kSOqTkbaLsufTQ0=; b=FlA+gm4zhi8j7VTQ9a/+vwNTsg
	Kvb8c73WDK9IkxqGfkT6CwKvOYJ3M9OCNkvQbtXdRBu6apOQA0UTtTGWauIHKChhuhQSsMOG/t7DY
	glCOGFmoIfFbfmEeoe6p1p/Csyd1DV2eqtMydlO83xmFotE+WBF5nH3ajA67oxsjHZesUqvmpnIhI
	WhxwwOkwUDXpV/JbmocaEMiTMKNQ9hF4rP7L1PjX7cLWhH84ZrXvFd76TVNUTp+PFxiHJ8NfVUlru
	MXBJIx8GHBnUbKJKq1Z4NcJ1qFyJUMzMkrYBnlJP+O+jQMknV7PXHwTOR/OT+jb92j+1lIZFYLbaI
	3y29hEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Rm-0000000HHJd-2FC7;
	Tue, 19 May 2026 00:36:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Rk-0000000HHJ8-0PMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 00:36:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b4583f0a1aso17786805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779150991; x=1779755791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zIbP4h9WDI9+Yz7sY4YHYJ+etVo6kSOqTkbaLsufTQ0=;
        b=aniagmCuSAMH5Dfwg0ZmK53qdIc8guF4Pj6WVFTtxuNS3V/JhWOGtq/2SPQfy6ou8b
         NnJOlkgiH9mVM/9yyDJ7u8j64Gk2CU0+6yYOoBxyyeL41IV0fvGM0AMOqwhsoeatKA5v
         /mA0N0XDGmPNRt2Qx6Et65zZRYw60eCKA6PDi4edYq8XpbPFwc4aIrMP8OdaW9tVznrd
         aywOfOtWhbAMXVmQWX1p/o9SmyfXp0Ggh0CaRWFjVwWiT14yvZzgx7d576d0/63AQLcv
         CeRK9NPVLYT2ne9bhDdv6M+0BiTXlHl5hVEIbQsTod3xSL1675XogbfKeG6AQSdjeeqY
         cwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779150991; x=1779755791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIbP4h9WDI9+Yz7sY4YHYJ+etVo6kSOqTkbaLsufTQ0=;
        b=SqsvIJJvfMo8cQrM3T4O+tnN6HgX2gGUbxb7QZ0wN9IXU0/fhNjLgkXOthViuA8tw5
         A48BIEZUstndYNwnGaoVcBGoaI+Y6hdZM/AFdpIe2LH8bXH+pEvAQndIwgMaXM77BvO8
         D64xVa7pEKXXcQkaKlzxyPwBiYQm8FdwSN/CMp7JRv8CZ5CUx/sUQY7A0/ReB2y7O2lK
         +qghZ9UHKmxuJ6Fu4Yfj6q3w142jvvvXcG+huPMNGBhRNso7fzaFY6A1aAIcTOc542VO
         yK/LH9jvbBraEe7RtcxSm75kzdZitTwhdnAqVHjWW9F7JNEyDsDTVtVL3TqkYrwi+oMj
         xLUw==
X-Forwarded-Encrypted: i=1; AFNElJ/b43IJ/fRy9YMRA33JD50bZeINBDGqEDUW1wkAJJH20skcwYErOBmTh/TEgZBb8UnhLHqNzqK+fBQM429CfSqR@lists.infradead.org
X-Gm-Message-State: AOJu0YzpMyjxqM5pxRKbcpYpn0Rx26iJEk2n5a+opVS2/Hw+cWwgOJoB
	l//GtxDk9KzjNC9QfPbhYV+4C/lpZOJFlMtRbIRnpsYpLIJ65HOti7gh
X-Gm-Gg: Acq92OH0vvpQr+9/NfoNSjaYLYpD2Sx6lGgIfmMAy/QJiQq4ck1CxCdZDeKI7zR2SPW
	+1bnGhnJt5FLIH6oOFrjkKMqrObD/VAvqmqhNvIlRRrGMXELci5h+m99voe1ZjRhQ3uE+OPYzGW
	YXtxhMLsohjcUPvnnucbuTg93r0SFqBVdCvi3oEG24VIe+WGRkjeGAHaDGZM1lvTltzhZZKkAA9
	H0ly1652T0q6UQBNGgdPbylEF+6H4Sdpzsa+6ZxzyP6Vat6B88PfBmR1LUYV9KvayoVoGasx4fz
	KXliwHPDozYfpnR8OmEeoGSdMUvcjpRDtQaTYeqO5iB6Lvcdb6KbcwGEwUAGO07meLrWUSRQ10W
	hIB5MYuu3JtMFcP9ZJMiHrx+isv5kvt5v2aS325b2O3hRxtPefeZf50Qhn0Uv4yT56VBl11Do74
	gvIPKCHtLMDL5jOw7epZLJtOyOq8J676JKfFtfetZNw69wnoNsCnNv5XIYAfDXLuFlEf/AuDbto
	IEQVseynnkS7EBd9nbtKVKl7Q6XMhtrC0I=
X-Received: by 2002:a17:903:2ce:b0:2bd:6cab:85d with SMTP id d9443c01a7336-2bd7e782281mr180580205ad.3.1779150990945;
        Mon, 18 May 2026 17:36:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6b8fsm170619925ad.46.2026.05.18.17.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:36:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] fbdev: atmel_lcdfb: Use of_device_get_match_data()
Date: Mon, 18 May 2026 17:36:13 -0700
Message-ID: <20260519003613.626271-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_173632_140385_0A0A61CA 
X-CRM114-Status: GOOD (  13.09  )
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

Use of_device_get_match_data() to retrieve the driver match data instead
of open-coding the OF match lookup and dereferencing match->data.

This also removes the deprecated of_device.h include from the driver.

No need for NULL check as every compatible has a corresponding data
component.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9dfbc5310210..87406a5a2dcf 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -21,7 +21,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <video/of_videomode.h>
 #include <video/of_display_timing.h>
 #include <linux/regulator/consumer.h>
@@ -56,7 +55,7 @@ struct atmel_lcdfb_info {

 	struct atmel_lcdfb_pdata pdata;

-	struct atmel_lcdfb_config *config;
+	const struct atmel_lcdfb_config *config;
 	struct regulator	*reg_lcd;
 };

@@ -930,8 +929,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	int ret;
 	int i;

-	sinfo->config = (struct atmel_lcdfb_config*)
-		of_match_device(atmel_lcdfb_dt_ids, dev)->data;
+	sinfo->config = of_device_get_match_data(dev);

 	display_np = of_parse_phandle(np, "display", 0);
 	if (!display_np) {
--
2.54.0


