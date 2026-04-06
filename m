Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13D1FB516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=; b=v4e9YBL7wRPXt0x7TbLALFG9aE
	/18+POC94aDDy7aDHW15pJx1vwwFuq01j3he3zu2Bml6F/y9OLwVXVAwkBy4kgKv4ipFIudbt4+p2
	prPFTvvR0zx7W8UEgYOtgTqCajuvVsrfcuU80V7wmVZe2XWGCRswpdaJN4ZXpvPiLlFQXSjWKlao7
	co97qm5TIr+CdrAwB7Gdk7KDtJ1q4+CXp5EiqCDFgbcF04Koa1qsPtL32Jbo6c0OBOEfjq2CHPD+1
	RKOZuZIeSHgL/xFq3fKrWrdB/+DHTbadf55UZRxGeHt7SzYovebddFl+l/APOwT36ST/403VExUZh
	UzcnzFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sD3-00000005Yhs-2nD9;
	Mon, 06 Apr 2026 22:14:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sD1-00000005YgG-18Yl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 22:14:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so5298298e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513653; x=1776118453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=hMzuh3jPG5vGRBRROO0QmdU5BsTIvXlvTeIr6+Vez+IwDU4uSHeBFJuib2/lNZ4kbG
         rVv81KEnqNZ8auftQLavXoBI8GHfTwBjhCz1F+atnIw4115kcwFWoe60Jz7M58qH9RE8
         GbgpKrPJheCQihKz0+PtRnbHk3KI6dHLVRClpajFFBZClJxEJXbY7GGCPupKkJwX8Cnj
         EQp5Q/gr9ViyL4ycUtddkdWb9Mh+vyaf2Z6P5Mn24V8UdFMUDz6+ODjfLU47+ChJ+0SB
         IO4BYFNfdSAHzVZUjYVgbhjW6pB3Plj/+rOd620peQOk9e0XBdY6bX+a/tPjWveNdAIU
         FGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513653; x=1776118453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=olmATy78pkJElmCyJWvFRJLgCe56bp7NVbwcKAZepXrUDrIe5kMyg/SObn9ckB9SPf
         f2Sg1nW3+OrtaYMwlbwEfMdj8nEz+COyjoxLFKYYfmlVnvhFDh+4vsVhyIbFOkyjEwQa
         Yhoe6ufx6dGdunPdAAzdLprzHoUkvii7UYkfbD4GvT07Gt+tULH7Ed3mFV/CoZdacLSn
         6g9NZ+vn2Sp4tvqKEeBna2OQsfXfYMQFc5nrUpvTmtZ0GvcEcBmDE1WKzW0CIDJ8G7VG
         UooynKrdYLaNKeVMLUlvKtj98tqVhdtC7QYJpDewMJkm8FbaFjhA4YyJqvd4eKIbutBN
         snOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy0Lly0o8VbM/teKRJPg53UiA/uXNKRtRIujte/Tv3blW+wUMtD538m6p10aZD4o+aKZj/HbI3myyC7mafgDjC@lists.infradead.org
X-Gm-Message-State: AOJu0YzAW64TaObFmfSOYPV1EfynS62jlR3nm5gxHmkttb9Z3L+uyESN
	3OclGoFMUtrxFWfatmMKA6PPzxOTqBKA8cVxJgJv1asCzVsmxonse2u7
X-Gm-Gg: AeBDievEupMrwp4q8YMihZEtiHMBnrcdkpgAO4P/eTSAwYhC6sbj7xxsMivPWUbYkZi
	d7WEUaSqJhFDFhbVsL99W3vxPJ41ozTnjzVmE3AbqVd2xcL4jJPBRm3nrifhLk8IuIZTOjLPIpR
	uZQD47tUfZv/6pvvKZB8/X+KARqM5x5FKUNL3c17Wn5Saudjq75vmavAIHz/NMN9K8W66zAgcgC
	tsiFTlgsEGJCHMsqxXCf4JcxqXdz8tUsrtVHOfU2e6YeypTC3g8E8Erto45Lqqc+fJSBUzqz5Ek
	qjXdPttymw3wM1etgZeH4eBrtyDyJaNmzJCgVLHizoVzWuq6gtKP5Cm5bjRjRJXMNEP6r2zH6ZH
	59zkO6ig1Z1xGVCf2MzCyrJZJCP3EmvJttrh9/jgumbLJa6GT1z/wGTHhnerYmeNYuIHmaYnjOA
	o1/wnKialDWSvrIbIQbx9LWOAdmg==
X-Received: by 2002:a05:6512:1151:b0:5a1:448b:317b with SMTP id 2adb3069b0e04-5a337591959mr5666904e87.42.1775513652798;
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f90sm3738693e87.49.2026.04.06.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
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
Subject: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Date: Tue,  7 Apr 2026 01:14:02 +0300
Message-ID: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_151415_368591_A0176827 
X-CRM114-Status: GOOD (  11.49  )
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

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]
Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
v4l2_fh_exit() in this case only destroys internal mutex. But it may
change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add details to commit message

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


