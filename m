Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C61C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVz8bC00NcJv/IZ0bhV7772W619cZqGGdaBgIBaPg8g=; b=QCqMGISnWLwQARzf4Fpr8FAuQU
	5S8chU5MFRhQkFbhCoEhOR+o4DwCwfhqmSK78mVTNRIUAIRqHHjj1TxStOUXRDciGT8Ips3pMtJnW
	hF5EG2+WvrmsUIElE5rtfZEvt8J32Rmy75IEbibgh6oZGDKhrUyGPCVJOJ1uB0D72d7VsX6tSL97J
	k/4zS+XelUSg2kmWoffXjNm0SA0l0cJ3agFZ5jU4ES+aaQqNrr7cMziaMZbGvFgstAvfKTxWjgl7B
	dzN/330RrCUjTKCBvIXi6bENYidYohX2+8KGVtq6WuSnKcZ4KafgzsDj973HucAt4RsQiKQl0yPO9
	wbSInaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSho-0000000FW9n-3rxA;
	Thu, 16 Jan 2025 16:26:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfH-0000000FVRF-1EiS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436a39e4891so7512925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044653; x=1737649453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVz8bC00NcJv/IZ0bhV7772W619cZqGGdaBgIBaPg8g=;
        b=J913Avw1IMpA/8m9QV+2T9wOm/SCcOg0NdsSRc5D6Tp7eFr0cn4nJH6WeHydAzVzv6
         gIrFh/OrrLhYeN/+7/2/OAYoaZG8bC9efpy6KQxjcRA2YuCBdHrvTd/+ytlBIr69175W
         zJskSy3hqQAIslF9y/x2ij5JKLjVGbQmy2eNcr5SwbxEYl95AMtiCAaLGP03H/ElVV+5
         Lwo5D/ZMmzi/engZrAcoo4+vSAM6uhZOWIHA9IjPCg6AYzFYcLR95bFATJVxhUQ8D2GQ
         sFwKLOeUuqQUiGoaNnTxt+0AKVSJGk6z+0cQPhkiPtXeUbBeaSZSkQvHtk/rTWgojCgo
         WQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044653; x=1737649453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVz8bC00NcJv/IZ0bhV7772W619cZqGGdaBgIBaPg8g=;
        b=RwvwoRr0evxJFvUOItsBLQEgYEVLZOrMyIIJm4wI8YOVc/zA8otPAz8yTQkwW7vx04
         mWo1W84Fq0EIiOk9140C2G08AZ5zU+xoxEqUyT6LecaRQUa83AGEHvW9Km09p0uyzQ9t
         MFS+AcGv/jY/FrwpFyhamEFDm6Da4GjggYilB9XFy9k52dU1bakPHlHNuLm7xZvK/0Rq
         xYsF6jdXMIBmlSa9d6In1V+lcf5KF9JOLY+chg5+oXYADt5U6mhUjL0qnKIEr8qOHrb6
         DD0Gbt6krFbzRJ30bbjbmXHH2juJxdH/TBnEfid20UVImBLpMPKgQTNbTexBd3O5CFnF
         lBlg==
X-Forwarded-Encrypted: i=1; AJvYcCUm/Or56GNqSrT9ypzTJH8JLVHgKKU+54ivm66SNfeRnFYIz8J/bC/m/1X44ZcfKumsXBkCVSjKFg4Ab7BGX6Bm@lists.infradead.org
X-Gm-Message-State: AOJu0YwT+iylOquI2fHwID138/7nkOKJjoCwhb9UtR2V5rRY3sABvRYK
	hD3qjrpZmQauS4YdTZWpbzI0Ffg6kvq2b++5N/jsczMzCqIjvxtaNZQUQJ2eKTF6V2OPm5+YAz/
	s
X-Gm-Gg: ASbGncuatprtkYzyQBhD+1JKd7K0aYIr7USAApRXAI2CqBTfYlfhYeoaGUq0qPCvPml
	F7mqnYqwmMzbHTxYBj+Y/t7wVHChAiqfiVySL96TwQLGtftcXxEYtQhGaZr3h0ociOkycFcIAL9
	2JNcBkgYPyC+BleuKOZBJ0RhhaBehpxfKcG2ZJ3bl/OCvHdPcSvlzCFY8XbyO+NJJenuqOljU7n
	JxkOV0JMOVxobF/9F7bL/PEsYIT08y4/R4mfocbUBX3dxzp
X-Google-Smtp-Source: AGHT+IFsOpMBJ93/MMR+dU+EaZC/TmrWLHZaiOoyuDyhD3Z2W0qeIr52x3Uzv4hcGCmCAktAv12ABA==
X-Received: by 2002:a05:600c:468f:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-436e26ebe46mr326154805e9.31.1737044653375;
        Thu, 16 Jan 2025 08:24:13 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:08 +0000
Subject: [PATCH 1/5] clk: bcm: rpi: Add ISP to exported clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250116_082415_323923_341D1458 
X-CRM114-Status: GOOD (  10.59  )
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

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1


