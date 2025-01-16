Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5HxNgVGZwH/KqwnSlM0sxwj6zn21A4I2jmnb/ZwvBTg=; b=BfarRgdMFY9RLRlDIcCXgiVtMs
	jHb0uMowYsPw4QHxRqbXeCCPPC4HshFWEgyVg/CV0o1cLl0t5qbW2tpCF/UPZqKCmr7aX/tVNd78F
	zDvvzztRp4A4CNG/s/Vg+ff2z9lA1TqzZfCovzHoF5qOUszImip1u+owNSINXrmjBgryyd8IPy3Oi
	s0De03XrWlDqV95NrilPaFPIvAoPbZCwRzFBa/WER090eneIdaXhQP6hCDPkJ9hidIhVh14m9l30d
	cGhD5+mZc9GoFjzUCEq9NwXMOuYlz49wpds91Tgvzustz+lHex7XB6O9M/wJagTZ2tHDaL/3SMRsl
	yukNKLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPdO-0000000EyJR-1ZJI;
	Thu, 16 Jan 2025 13:10:06 +0000
Received: from mail-wr1-x463.google.com ([2a00:1450:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPbG-0000000Exue-1LVi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 13:07:56 +0000
Received: by mail-wr1-x463.google.com with SMTP id ffacd0b85a97d-385e06af753so486230f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737032872; x=1737637672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HxNgVGZwH/KqwnSlM0sxwj6zn21A4I2jmnb/ZwvBTg=;
        b=TxCJ69BGHpE5pLOdM5WcASTcv8nBcwyQ0oIp9XzNdlWsOvoxpj1GMCd7VtmFtngdFr
         ST07P6eC1ndZJ51bZIBjD5oOFsjfXRhpsRQOUMNUpCdr+Ij2kcff9eWQ1pPbf2y8yH9Z
         4tWYD+4QC7GJgvnxubB49mVbg7jTmZf26QkctXYOttSY2C1g7J76MGjTm6X6uYTCkWxC
         3MxTqY23OT8jhmJc9iJ4JgNhjKZGfe2HHeMDBZ3qrkhZJ0udaTSGQHzTja36jGhEZZbV
         6Bb67p9OIS3Xf8dhlE5v2fn72XkWXr3GjQnX/siRlu+poIt1hQlzk2arzo31j6awJ6ab
         TTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737032872; x=1737637672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HxNgVGZwH/KqwnSlM0sxwj6zn21A4I2jmnb/ZwvBTg=;
        b=uLsa7smBnJQbP5nsrEyVCtsOMFLE6cBZse63jwVMWXrJHEyyzALGQDfVHpdzmUxTGZ
         1euea1cCNZ0YNTF5kDRoMPan/AyBGstnQM4RWLj2n8BHcz8xYcxBZxklqVDQpr9u+Imj
         D9J9MfGLGr5EtQfJHNuN0J1qZePVHeM26oCRuR6FD4yck+EQqoMEZ6xCuz4bB/Re3TrF
         TPUUTQvbl8RS6IG9wgys7j7fdQwDY4lowDoMoQzJ/PR1RZQV1z2PrJiFfFexZpixaeud
         YFr8qmrhtHlBc1HR06bEg8jwk3KppcCJm7Mpk7fbqL1VXaMj4/7aSrSezCqhspBOZsE5
         HnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3vQ0f6G5T+3DTMCmak1opo8tZMKcqkgNGHObK0jocYEF8T/8AK4vUXqlrUxIq10kb5UttNN1IG25NAa01+ZKF@lists.infradead.org
X-Gm-Message-State: AOJu0YzGuB2u2MFfv/4/sIZr3IcosxRuVvHMHyVjtsNNPnbrCN37ErZg
	L2ZHQE+IkxUOjNrDtHMBSPAc8m6aWyjVtZhq3KEnjW+GLps4gpUgi6TU8Mo2NVKhCVs3fRhqC5V
	WmNakY5l3s8rGm5wYsS+lQr8KLgV74QEX
X-Gm-Gg: ASbGnctiMNYpUFZyYbgY19SuiZYL9JqLyUYovwCZuH4WhEU3i4Y/V90YW3jTCBLgKlC
	uVO12S3Qi+Ei3CWgEMo+Dt4aft5DdeO+savMsT+/VDIUTPCNg4FjtDw/smEhjDYbCu8qXlJ+zBK
	CwO0s7YRrHQiWGD+549Qoi8YlGUoBvV0BROK9IdyMX6iw3WP9bR+x1bGrJfDxAa5Jx5rFfW3xRj
	yb5YgOk4tcEk4xuwT5+K8M6x+6Tj10qYtgx3sCEacaxP5YTheoO80ba1t6PDtb4hTUfSJUu
X-Google-Smtp-Source: AGHT+IHiAaTiBf25Gwr72JHYoKPV4xCSfTK59cClLVoa72fNVex51rii9yV5aQj5c6YmFQNoO2WZlXxc84Q0
X-Received: by 2002:a5d:6da8:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38a872f7ef2mr29722324f8f.2.1737032872303;
        Thu, 16 Jan 2025 05:07:52 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-437c74b94a9sm4463345e9.22.2025.01.16.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:07:52 -0800 (PST)
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
Subject: [PATCH v1] media: pisp_be: Add support for YUV422 planar format
Date: Thu, 16 Jan 2025 13:07:48 +0000
Message-Id: <20250116130748.3426194-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_050754_370971_9CCEC75F 
X-CRM114-Status: GOOD (  11.12  )
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

List V4L2_PIX_FMT_YUV422P as supported by the PiSP backend hardware.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be_formats.h     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
index b5cb7b8c7531..09edc2774668 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
@@ -129,6 +129,16 @@ static const struct pisp_be_format supported_formats[] = {
 		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
 		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV422P,
+		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
+		.align		    = 128,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
 	/* Multiplane YUV formats */
 	{
 		.fourcc		    = V4L2_PIX_FMT_YUV420M,
-- 
2.34.1


