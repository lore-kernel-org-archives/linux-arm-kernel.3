Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F6107639C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=; b=ibjYHwyxk4d61w3UspBko7zPFG
	52LM5Eaw4JdC6JFlCcoxp98JSdsbkX/9x66BLGANyfoJd2i//HipQ+uWh5WQIDvF/uRLqz+7dYQgP
	ZDKtNm0Js6RjcMwgNde/FnJL5AahmpTCa6VNX0Dpym4sVV7sliDuU6uj80uXpPMEsVjm5A0sLM378
	vF9KfAhn3n/V0+CDzG5smQCDW9S27cuWyCjMO08YCH9fXr63Eun3t0Mzvt9hAdkhDKuExX+M5/z1f
	Y4luRzrMqWotbffDKFAtDsuYAYDZpM5nE+VfKNlNTprWRfOOYmZMD7knpxHQol0z+xKQwiHJIBN5u
	pO176mNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w811s-0000000G0Un-06Hy;
	Wed, 01 Apr 2026 19:15:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w811p-0000000G0U0-3h88
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 19:15:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so154190e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070899; x=1775675699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=NX17om7aMHXX3c//45zxRfAhTBwogNrsmtVW/m/VeTrpK2vN20w10vt1mmtI4QDa1d
         fdWc7lnHhgSAwRHIwaFuJGgg8/NGU+j+4C4OEZtC42w0zr4k3zIJE7iZZ8MDBSgHnxlA
         a478jYY/5q8xX/HyG/2ccyE+0eEBgxM6tjkXf6oXfIW3sfdAZ1AGrawMVXA+myK0wYFf
         3LdlR6xFCqwqjTiFsGUOdZhk15fbsvO+ohmzi71Ogk1REriHKOBafgnGTAytZTdPF9L9
         t2Ooi7Rj9b0Ja18iIcfFdlkgE/4NQuQyXYRlE5cWtQpqrUbuBcRqbt+X7uJDOEcj9zpV
         pl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070899; x=1775675699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=HPPOD3CxIiqceRBEVXKccp5ZDSWAi+DuWxOeN3La60BZBpp5+RyxaGC9IOMp5ZmYM8
         9WK8g0PqPVOAlNdIpkz1sytbrU5BALIsB2jhLBpRt+3cO1jkyBqshX012FLFHh3DbiUQ
         Gmfs0LV3stNIaoMP7aVmw152euX+N5DbvqsH1nMBCxoRJ2VYFpEiIafMf1BWSp3jdMLX
         SAoMWsu8JEVGyXYtShvGVpVMZqZ6PGUVrod3YqGJQY1XpoJ0b18lDLULsjyK0xEa4aBG
         MN85iByDzQC0T4pNs7+rQ536g35yVr6Yu/tbMVcgVxheFbxgI9OKwBl6ZAAl1QhG1EQw
         lajw==
X-Forwarded-Encrypted: i=1; AJvYcCWBVb8gcjkxdR2DSc3IwoHR9SouRWukQSLCUzGXyVbtRgDa5B0k10hzrnhgXpu3XXMaka8IRhrCdleHgGxd0Db+@lists.infradead.org
X-Gm-Message-State: AOJu0YwX6HBKi3TqTwkrUFDi3MCc5TBQjkZ+ClDffjS6EqAGIh0cIiGY
	7o4lewdikh3woBauxVSl8lXdToATkc9thOJJSvDrG0sLaeFyw7rNbmkG
X-Gm-Gg: ATEYQzx/j7e4iB+n9vJrNoG70bLFWbM1AlXCxOB5hcUWGNTg63KtW49Q1ahMCHX7em/
	tSUTpC1SqcgLhM3KhUcOs0iP5iFt7R5ma2O3bYzMayEVOWS7caCsZuAMsII85E2mEhdCZ5oV+/+
	zHOtE340L2G11k3rmJEGy1j83jJ2D1/4W01Hu3kZBCq+y7qpYCIohUTrDsqS+g5dcANa2pnXK75
	O8OkjX8OC4chUV3ZDpA2nQWwYd4J8IszIH4Cm17l0K2KkHbyOj4hvebdxDbxpW7fnSojdEGgxi0
	/Q9jiveJOxPmUc0OQevEOrBDh1FKr4P3bxVnJtWwAWHhfXKRPkQ5j0MUdSboBAJHhAx3ABTtJTg
	8aDcAwdAmJm+0SDhk7Rb8qpBGkPaKp+iQ4KzVIgqtGk4W+gDecdkg9wQPWaAVyoNTLL3j4PU9LK
	9yCdkaRv3K8vevx+6EKSHnaAiyWA==
X-Received: by 2002:a05:6512:3b87:b0:5a2:78fa:2700 with SMTP id 2adb3069b0e04-5a2c1f3c4d5mr1943599e87.23.1775070898394;
        Wed, 01 Apr 2026 12:14:58 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:14:57 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Date: Wed,  1 Apr 2026 22:14:40 +0300
Message-ID: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_121501_955973_7AF684EA 
X-CRM114-Status: GOOD (  10.68  )
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

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e2..1d2130f35fffc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
 err_m2m_release:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
+	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
-- 
2.51.0


