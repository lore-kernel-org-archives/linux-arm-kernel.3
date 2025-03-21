Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AFAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oQ5hD1cA9VD/VPcz8yv6T4aW7gPvF07IV6qUGx1gU8=; b=1hMM60h88L/IOMSPu2j2fybR2D
	N0CLbfaMw6SJ5bPfraozOaw4SxdXeWo2oUKwEo2g/QYE12DOk3Hh1kO1YyIUa5sXkieHV/cudCAt9
	HWpeSp8QTxKQPt6jt8tdvKAqW/kSDerfugEjnenoOMZe6DDQ5wpnJSE81ZXm/TLXThEwAQXRzrh/U
	X6l6GX5Pi7+nuLJGUe07uV66zNdqJfIBCSg/XsjmeoUVlsDiZQE0ORvh95FYf1/ELkmhdNSx4y7WX
	GUWcwULxLV4ui3sYGawRyuP9vAuWS8zmwN/iy/cwehDsanhnC4hPSrhSJDJViMD4253ZFqke+Xxzt
	fkQLrh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfWr-0000000FZMa-22pC;
	Fri, 21 Mar 2025 16:47:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfQw-0000000FY4A-0yGH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:41:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac25520a289so395721166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575280; x=1743180080; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oQ5hD1cA9VD/VPcz8yv6T4aW7gPvF07IV6qUGx1gU8=;
        b=dLs+D918RtmU3glFIKRMBP1Q3B3715xJ2yjXVTarNE8fj33nlD5M8R6IMwtPHBxCdo
         viMjLsJ70hnYdmAn5gh71sRCLOpdWSgLiqpQKuBDhpk2vOSPaQvLyGEsU/++U7ysF1ub
         Q9nMg2ZOEoD70R+ZkeqQkfKIdcmj1TeKiwzrf1kJ583cjcWspKJsWyGGjAXnZquxG3gJ
         GA5vFz1NygUfH9QhYZVy3iSHgoucQUl6VwoC00yEqHqNdDrs/fdtsndtu64e+UKAqCSR
         ohuxRtA9PbSN0DdcKaVwGY36lRoSy94B2ej6Ws+2SOtuA1oXqklpSQwpO+NG1s809aJy
         sIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575280; x=1743180080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oQ5hD1cA9VD/VPcz8yv6T4aW7gPvF07IV6qUGx1gU8=;
        b=EeD4k0qKYH5rZt8FLtEzlpuLlK0YCTdNUr1RpGYHAld1nrqNx+FeN6GsPwrtDaBdgd
         p29RA5mVEICadZG46xprUEU1AiWEGzYn9GOzskSUNawgCcT8bFoJeuVt1tlQ6QcWg57z
         MLdcodh31t/0S3/9TCtSgoAVgkrnHJWh+uSjK+i0RSmf/FVdO4popo9Nxk6ExvB2LshF
         1D1Gnf2xpVXG0j7O7wTuiVaRG3k+KwSpTmJRn45SM05bL8BzVVbQ7oaazSSHemiPkFBw
         cHe1BLaVoiXJ01kNLVr7N7mmwtFL3ZjerxcrcX6bu8e7+hGvU/q6ChJKkZMB82wuNvz8
         aESA==
X-Forwarded-Encrypted: i=1; AJvYcCWwup20fbiEfcVmDYONBNuEZZCvmBlO+ZfclcmTyQrTjLiZmamLVulM3QIdjrcqDhSj9GYNiILYBuum/TrcUYHC@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzHfxWHZx9Et8ICfeZKqqwLvoU2vEFuFtDc3tbwOVV+Z9dn6Q
	+SyIo8aB8X4CEz+u0ydyl5aOsf3GOfziUKPfa26Q7H/CRsqfPl2nL5vWfLhGsNYhna+/V3ISiUw
	wRjs=
X-Gm-Gg: ASbGncuar41WmwAFT47xPVujxddG+IlEvffN4xLkVw/jFrxUuFU3kI9nwU4EgB/qjlI
	nNmZoBcySXR4y3+DU3imhG6xjPGHtYghhIZ+svINIclaxuLClKGiO4TWDtR6sJBw3RvieLxbSN+
	8ctKqIxglvMV04mo9tCdx0kYpCLpoW6MkJm08Xi7Dr7Hze14MVz3eSpUo+qPxF/fSHI5usB5SMw
	MUAolVr0lVPR35gKkh1NNJtsGkXhzefSJR66FkqGq/zVYshWKEQQNO5cg7WjH385OQfkfU1xmzM
	vd9rLtwXzd1khjkLmyHAdT18xAlq6I/RxTK4l/tQ0XqVS9co/IquW6X/RIGMoywhTUzlO2xaB0J
	8VXbwBVrzUIsHQTcOV1PHH742RCG8
X-Google-Smtp-Source: AGHT+IHAwCySYHv7J4LG8oqKj+pJ3kDHG2FjXW74oHg2qd/1H+0+7k4RIohqqkos0sYylQOT2uGzTA==
X-Received: by 2002:a17:907:2d87:b0:ac2:fd70:ddb2 with SMTP id a640c23a62f3a-ac3f2086f35mr381559166b.2.1742575280417;
        Fri, 21 Mar 2025 09:41:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 21 Mar 2025 16:40:57 +0000
Subject: [PATCH 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-acpm-atomic-v1-1-fb887bde7e61@linaro.org>
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_094122_269595_E3376BEC 
X-CRM114-Status: GOOD (  12.66  )
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

acpm_dequeue_by_polling() uses a loop counter and assumes that each
iteration of the loop takes 20us. It may take longer, though, because
usleep_range() may sleep a different amount.

Switch to using ktime_get() / ktime_after() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep without having to adjust the loop counter exit
condition. This will come in useful in a follow-up patch that changes
the delays.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..d7ed6b77a957af5db5beba7deecce13ac7b30fd2 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -32,8 +32,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +283,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
-	unsigned int cnt_20us = 0;
+	ktime_t timeout;
 	u32 seqnum;
 	int ret;
 
 	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
+	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
 		if (ret)
@@ -300,11 +300,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (!ktime_after(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog


