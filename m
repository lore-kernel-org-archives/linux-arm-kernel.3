Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36E4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=; b=0USjVD27nOLfFbQ+zMK8SU8Z8x
	08V00yUWJ/+FfSk+WQTWF32srJFoAz09yoN01OCizWrB13cmx9b3aP+VAgtf23+6yV4fSNylMRNT4
	YVcSTwoDuQczPDVP2V7bqV0aS43FTsSyICKk9+TjaILxlsbavuH+07RkhYtKTT/dJuxhucUB1Rar4
	4pO4w/ReBl45qtZv5cwnqURKvDNZMhC5GpkS5sF1u6640P7Ax5GVpGTmNzj2oeip2chdxQf56zktj
	y4OPt3zhGMRRpfGNbZmVjdjGOHS2FnOz5FMCZP2OmNpP5ZEKQjFYLoOfyBQdwbKtKcmb1Oh8cjGDb
	olKfyqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yin-0000000AP5C-2RQx;
	Wed, 23 Apr 2025 11:56:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XdR-0000000ADor-0iPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:47:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so6753596f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745405239; x=1746010039; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=R6kr84bTm/Zpi7ltmbF4pzc3EBn6plrTUaMopavOXsLZ4JvfI63l3nh7CjSbtlhvTo
         TaGFX42CusObc/Wak9tKZmh7UvLmEhN36kdyG5wF9odd50aI37YIoKsWtt7jXgQkqjvQ
         CnKSPua/Wy8RcPBHetpHJTMyM91ycxDTwFVXBTNihk0MViZ+xaZ1GHyWMPlF+sn//KLC
         TT0kdLl8hJxArYhJW2yp72vljOnAkFdtA2/MJCvQiQh9BgS8YYjiY0txfgVmvoIQmQh+
         LGLVmTjF8bJycz4WqF7MVf+Qp4gqMI8OSqf0lb0WZf0tzbV/YQKprYXdqft2+lkas1lC
         /jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405239; x=1746010039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=flfqcfRfXOptrLBn0BN1N6WsP/OhG24ZxgIr+x9btKmiRbYCKJyJ8Cqyjpu3wEJ6my
         x6hDeTKz6qsAsdDnB8pdiRQjJHcZm2wPpnY0W6vtXZFM+rugEf+4kHyaUbrddn7yOTrf
         Ok7G1CMC8byWgZ1a6UQt4jbTsoDYamK3nL/G06MeVDfisyxgbwTvlGyb7y02z9RBieoZ
         iur+V/ul42iUW1oDbmthRnjG9fmg9Tes0KOLkOb9gU5xJTSP6QmLwMWDc6Rmso0bNwOz
         tlELOwQRpTRgmZQnCWFANecp431Aslb+MXhJn6PZTvEhRhXTHZJzrNT2LA2fvM2Cy9Hg
         FFiA==
X-Forwarded-Encrypted: i=1; AJvYcCUwtvw44C7RN9YcYd3Di667f3FkCUSkUF4oaB9wC54TxmjEt2DzWYmgEzHKwMoowMbC3PdZDl7Bbdvh4yUbJOdh@lists.infradead.org
X-Gm-Message-State: AOJu0YxtiHUFX4Xj2H7vPNlE91INwfkL+ApEPEftje/SG+yUCZhB1NV1
	76g6/4+JQUfYJxuRMeOnuTpAWE9IXoF5kTtGLa5W7C/j8eGU8yfr0A593Xjqba5u6nV4oYXcCb8
	U
X-Gm-Gg: ASbGncs+Np10yRDsmKUsgvcJ3rkU+3fhRF7SNQNWE5JJj5nzAYYZCDBbrtaYTaFaYHD
	H2hmHxT9j49eQTZYtbdLPdW2zAKnMQ71xJLY6ul/Hh3Tyx6u8DAeqpXdNA6vorrysKMh/9NnK6z
	4qzFSrWhF/hs44QldVefsUHhbikArzO6TVK3+LtE6dZV4Vz9as+fbvHj3uN+TKg+ImsBeAn2Y+R
	ayZ5m68NDxe22z2SqHjONcj0pUzdVUQO5paLQOwYPHkxN9F2QRauTpwHHGdeH2ctxMTAn1mMdKm
	BAegKGbY3eF87baYNQrSUYK66fCzdJFfyoFgDZ4Q+Ms=
X-Google-Smtp-Source: AGHT+IHzSNJo3Tq0+q1KtrvricG5SZh6DtKPLrPA5t2OxS4b3WEMt4hP3LFMNMdr80qgkwfOW+ZF3g==
X-Received: by 2002:a05:6000:4308:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39efba5e837mr14942355f8f.28.1745405239415;
        Wed, 23 Apr 2025 03:47:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d2f514sm21242895e9.24.2025.04.23.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:47:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 11:47:15 +0100
Subject: [PATCH v2] staging: bcm2835-camera: Initialise dev in v4l2_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-staging-bcm2835-v4l2-fix-v2-1-3227f0ba4700@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIADLFCGgC/3WNSwqDQBAFrxJ6nQ5Oj4JmlXsEF/NTG+KHHhki4
 t0zEbLMsgpevR1iEA4R7pcdJCSOPE8Z6HoBN5ipD8g+M1BBVVGqAuNqep56tG6kWleYyhdhx2+
 0tbe+0dqRtpDni4Ssz/SzzTxwXGfZzqekvvYXLf9Hk0KFZMnbxtQdNfohJi42iGwL39w8Qnscx
 wclnBYlxgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_034721_294285_3E1E9607 
X-CRM114-Status: GOOD (  11.66  )
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

Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
a NULL pointer dereference.

Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
could be passed into v4l2_device_register to set it, however that also
has other effects that would need additional changes.

Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
---
Changes in v2:
- cc stable
- Add Stefan's R-b
- Link to v1: https://lore.kernel.org/r/20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index b839b50ac26a..fa7ea4ca4c36 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1900,6 +1900,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
 				__func__, ret);
 			goto free_dev;
 		}
+		dev->v4l2_dev.dev = &device->dev;
 
 		/* setup v4l controls */
 		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-staging-bcm2835-v4l2-fix-b8dbd933c23b

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


