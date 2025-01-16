Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB9CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqi4zrR14V9nobpcwSveNX0mOCCq13/co3EtArUhSLU=; b=oFTOaqVR0oWH0cH5LPVmsRY55Y
	WSLUV1nSSZZIr5Tkl4xndpYeBJLQH9l/JUHgDPQYv1igiKyHYusnToR6qoEh+NNarTBOlPP3iP0zf
	mkMYBYKIFI5FOjEJACh0jhukuPUSO8cscOuApkxr0qBbyg4O2gSu4VhQv5HOZFRAKi1sWqZLe0QVL
	YrtPFLH8eO8akh9zHMX7Yy3Rb55GeJ0jGHFKdpjWUjVeATcLm5CDtsGiYy7/7UtiWpccYDinxux6p
	cgCjWGW+goMdwdCaD3R4w+ZkGJF4tvHUSkaUGZzBnLQM84t0uNJG9197pCCSzCo55QqV5wJQpFj90
	6i2IivMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSkN-0000000FWpY-2tmU;
	Thu, 16 Jan 2025 16:29:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfJ-0000000FVSN-1jok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361f664af5so11982505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044656; x=1737649456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqi4zrR14V9nobpcwSveNX0mOCCq13/co3EtArUhSLU=;
        b=F9KzjD+VofBUvE2SUtXgIQlU8PFuPQAg0kbmL4LSO0qtPEOv7O2GtBLYrxnkHkmsfy
         Hdi6tCMAwXDni0QVKcJJf7rtvGzfl+FUuqOcwDAJ3Mkl7fjewsCa8X6CQSfVCjKv9yIt
         ADOLdL40F9DgUwlynNCY1tPTxHAQlg/uiTo0hrWO3yFnMSOBqSoaDloby6WnU5XDBPTC
         HzhDYw0zf48DGBva2tWLVi2fDZMSlJo9PsJNTnK+qNIJFF8B1INvvFHWIKu4v69IQVen
         hKPBnhUsDaj7esYar2h05pjO0TmqvRaejDxbFphR1ryvHy2R9YOL5d8n5fdZTKNRwpzL
         2X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044656; x=1737649456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqi4zrR14V9nobpcwSveNX0mOCCq13/co3EtArUhSLU=;
        b=lzFZiTOBOo6ku88kYmamxTvRzxNaGgKkiUWAt5xz7ILQnXeCrXghVVePbpJ850JLdY
         99aa5kZqhuxXotfEs5UVx0hjn8fCoUsXW9Aicq7G0Z+iUh0GrSdWtN2kt9ye5No8vhkS
         mFWMtl6BfoEdJoCo7j9s+v+sqXrR395XF/UJYJPUZFkNenVOMBxEtCpwH72g51W5+o0Y
         9DBWk7eE6mfTD/V88DfirYSc1C0PTu6yyF9Ky4VmADfSBFCG3bLMWfdPIbeQdCwejltU
         cL0K4HeK0VI7w44r9zK6jDzjy9FeN6b4k/FIap9bFvI1yyYalLNTMVI4YGFQKy3saKek
         hAjA==
X-Forwarded-Encrypted: i=1; AJvYcCWPKF4ewK2Aqq/xoUGT2m/HFNYiNnXi36/JB/pkXK0rPiElqxrjzjl3o25ikxzmYnS6xjpyAbi0O/28bZP/OENN@lists.infradead.org
X-Gm-Message-State: AOJu0YxWyy/pmY8vbei0L/nH1HCTMNlQmKJLdkjgti19g53gniSP8jji
	RGfRUOkih2jlheyWd5bCNCJp6H4/eD8XUVEIgqVnHjBr1xxChXaEbkh/AQkSHVM8tQZr1wSyPd9
	v
X-Gm-Gg: ASbGncuPgRGXy3+nf5ph/enEn00vI1IP8sujlgeV2YvqszGQRuydV/K5YlESjonDcgu
	8qZ+wFSn2IZwSRTK/02Gk11JPs03Q902VvQ6K4lQWc9TlQzHojAM3yR72sRXrgiTOyI+I70oFsB
	Rm9DIznHvwyWN+aIP4WrTrzpNTR6enZxEhXtSo1z39LLe7rQs5CqUbLaXu3ivrUE5PnBEGj7VE3
	njAqSIYt5AdFTB1LGiRaOJj8Wz1HPdBk1ss5l6UVEqEH1Av
X-Google-Smtp-Source: AGHT+IGYVMhTyECS8mk7dbNPcu0xv+jBr3muLUHN1CCOwv0ti8nhpLb9Y/RxEUO53LqAtFGOLogLig==
X-Received: by 2002:a05:600c:138a:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-436e271bcb3mr341342715e9.30.1737044655871;
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:10 +0000
Subject: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082417_450840_972B432D 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index d374538e7108..9f716b2223ae 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1


