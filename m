Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22C1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZibngSwY8argeZ7qofhjDrNbekU97d1TCMP7QCVWYG0=; b=wV1vIceMEET67Mbaxb8O0IPZb3
	EYauArwkBhgchfsn1Z+0cJFM19i6To/EB8wavbyZ35pu5ZWb2OtSksd6jiXugc+9dr5+JFe+iY4HI
	7BuECBwS+1oiW1632hf6pzl819sOD078U7LyYvZYIzyXpcYUDlixMRg6lBxVEbU8vCI70GVW0HzrN
	ovgiseq9E+rTjv77rqqgLxN8Y805g+OSn8ouz/O2a1X9LCLkkXdVysinK3/1qZrhmTAcHqJER1n3g
	i4wld1r6yEtYBEMo8Uxx0iqs5VTFc5SoG8XIsJc8T7X4/JtMQC2v6FrGulhBKgAF7Ne52+v2k7ALu
	TYeAsewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSmu-0000000FXN6-20be;
	Thu, 16 Jan 2025 16:32:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfL-0000000FVU7-3LKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso1264192f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044658; x=1737649458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZibngSwY8argeZ7qofhjDrNbekU97d1TCMP7QCVWYG0=;
        b=AEhIiNMZCxkNQ6YCTwpn+UL8z3+SLu2eI9cX1+YTt2JxtbbUqU7KDsvZ6d5PaAUZU9
         BAJRhg6kalGY0YfaaWSDgUXutMS+LdYNq475iZJllaZT1DdcXJfWXb0E3Gm2HTGX62tp
         EmaGA0G0IV+2dEQjnnZoE9245TLztV5uVGlb8WlWxvSaKbcL+9Ueui6r09HXXkitq7js
         ZdIjz5ru2FEN87Jyece/ubRzJmyeYvGfRkuhu8yKjkTDe2qD4x+PrS5lmWQgv/Nv/T+Q
         CYPj/A3fwiNyR6fo52rJuhvOX1p3IicjHiT88iLN1rPK/cHxeTPzBigQzICIS4/7/WKl
         qN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044658; x=1737649458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZibngSwY8argeZ7qofhjDrNbekU97d1TCMP7QCVWYG0=;
        b=WOqtZNi6fF055mSBh4gOv3kYneouJPeyf1qVgcRZOeDq4W+8rPslsaIoupjki7SwpD
         NE5LxJj61zvcLKXdpt2k9tfcufsnMMtr0LtvHpqbSFEnwg0QSILJn42ZtAcr79+UrZWp
         Ow4QVBcDZryIvQzBBtNUy2ggKWj2nX+Itw29c8fG6/1iczLdzBZpGzDlkeFq8zNFOCC0
         YUGsJnIkduEiP+Wm+eWCgobDI8QKyFwuWmnD4xiDmBVGyo67sIonGfi39/gwhvNqATXe
         x6xSwclpesALcftilSCViJ6gdRKeXhWNYSc8xaen4QS6xpg/q57uF6u6raUpk0r/vTlE
         XLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkQd2dzdnf1KzRpywRZ/D1fdfa3ilaJgvzZrcQwuqhQmJnG26yJSGDAjGbw2+2qGTqcH8Sw4y0gQApkaE0kD02@lists.infradead.org
X-Gm-Message-State: AOJu0YwvRK+uDtpQ6ba9/lyen4SWEpzETa3FGd1rSxEDg6cbcW7BMcYm
	2n1V0sP3PrpoHYMpsfm3vhQ0yT5lYuetNlFUuaUebzYB29VZkbd4x1iPoM8Q2lZlSmBuXA7mVqt
	A
X-Gm-Gg: ASbGncsXnbGmA9VTRA9jBuPTFWtGcgpZfVkBcBbHLVMRXDU1+1vu9cXxrsT5K3Qzerp
	gtgY6qD9heMgrVqjUtOBXMFZX39np3kZ1mRXY9z10erxLXFMO74JkvawSYwOeiq2j1MtAjMcK8f
	SAlAncm19qORtZ8UVzVieEKAlRMChuCBZ2DSfwqv7UoJH6N8YgeQjx2OJt7aqzq7Y33TE8OA4q4
	Okhay7uURaSvxpgsXcCa01vU2YpHAVKwxeap/QrpR85UmZE
X-Google-Smtp-Source: AGHT+IFovdSUCLFl6t9Ci8wgrQdUI7v7DsdIkG9yNGdgleot+0dJp6sFALS6PaK+5Ttm99jIsf+Dng==
X-Received: by 2002:a5d:584c:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38a873573ccmr32438272f8f.50.1737044657836;
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:12 +0000
Subject: [PATCH 5/5] clk: bcm: rpi: Add disp clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082419_826093_796AC540 
X-CRM114-Status: GOOD (  12.99  )
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

From: Maxime Ripard <mripard@kernel.org>

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index b12d86720207..0e1fe3759530 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -139,6 +140,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		.export = true,
 		.minimize = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 

-- 
2.34.1


