Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB3CD609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2z95vIVxpdoEpIHV1Hs2li8opRkM10lvZmaKrYhPuQ=; b=4gKMVJlfUBShsm9y3rhbaDNMK4
	YPoo3IJcRRvbkazzXk6jhuLdvpXw71aTtm220tRlQtX9KvW6fkFP8DXW+cPRvYPj++ZtwQ0vXleMC
	MbFSko4NLoc4Gv0ct+KWPfPzWrfVj7fZbg9rQx5ITOzhBuRsBhGTQIHBWDpOpYzALkJRtGdBcQFDU
	XJI/dY0yU8QsGFsm7pVc8upn3rjtft4wRL6lG0tcu5QSiP7N63j4U9l4Y0/SPJC5nY5Ozcw6AhfP6
	pPGTORSGSsG3Acv9j1lqlSFD6lYRcCRV3PucHyIPp48ZLLdn5CjALJRX6WTRhfgAI9DImYlaYeoPM
	GpXKyMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGAE-0000000D0PG-0t5f;
	Wed, 27 Nov 2024 11:24:58 +0000
Received: from mail-wr1-x462.google.com ([2a00:1450:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0w-0000000CyI3-1lQz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:15:24 +0000
Received: by mail-wr1-x462.google.com with SMTP id ffacd0b85a97d-3823e45339bso4784827f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706121; x=1733310921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2z95vIVxpdoEpIHV1Hs2li8opRkM10lvZmaKrYhPuQ=;
        b=jGPGZdUbBGvf/TnS+fcMkYPZTv7SBf2UwmB55X/gZz4V06OZL8QnDqAB0SYXmBc6OW
         iD4L6UALZsf24q8vv0guU0z0r+hK74TYNfe8HogfS2QGchvMvR27rq6sOq3rehAqzGwy
         a6NhX72Lx2eurGzLi8bRfkKx5fV/1X3Ya3rDKPlA7yVe0s2E0ugX+APJBnZCKKspsJpE
         66t+Hqwzcxjek3cgMx1Ns5kPORDMun5m6EYhfIlD5jlw4YObe5w8rTZGEOM3Lgj5B1v7
         hVLiY4ZmbnmSwRBlvITwMmSpVGkbRCvnP8g96VCUksi6mWbrHreUgAQMpAkt06DG9rYp
         bTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706121; x=1733310921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2z95vIVxpdoEpIHV1Hs2li8opRkM10lvZmaKrYhPuQ=;
        b=MX3lky0ZEpSUWXFxlv5GXB9ig7Wg4M/wrtgv0KMxTRNu8AIWNZjIvnLHo+OqEQQP3m
         2daKtnqEvyTghK05/ff+bugVsy0fy9Clo7eAKMKV/hEwAAzEfI4eFQpG86NHrF9Iw7iG
         EaQpEGXWHF7eqrssXzdhRW5be1J8o9OAWQalDRz72d4E9IW/JK9KXtYO0QoB4QiJYql6
         +gLXKdIaak7HFb1hmVslFj86UxRsYlyo1+pDUbMhHCtcJ8GsekU4BGshHzMouthmMmqm
         VB6I5khz1bSvndo/3mO4rISjnf/a8Wj6TWEYqJg7g87YgMt7SvHCr26z3KOSjw0asCx8
         pUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkNlr49P3pF9zxwZ9Uzj2mfuu4dCVSk3dujLIh5fo5mz8ww8UZ+NAnaNCYSpFh00uYuk3zXcBJUVsBrY85dcuP@lists.infradead.org
X-Gm-Message-State: AOJu0YwgjANPbcfIFSwCfIzd38T4olfSKnRGQaS6KAYdYCTTAuxarKjD
	X03MD3P7nyMWqKhet17czYpVYKiqkoR8rjnbkgC5u1BV/rgT/RBniGk5noOah5d2KZWUd5nw3uT
	M2/U8NaanDAXESlHvJMu4IEh77VA+vLD1
X-Gm-Gg: ASbGncsp0L4hmknBXv8hFuiNXJKutyY8ttbVH78qnyc3XNbQxRRYoxu8MFywcW8qGVb
	cadXcBkql/9am2JhhHx0/t8kRPWFNO7i6L5K/d/vmImrgBEwral6XYaxIna5N946gs2k/82qlUd
	iHilYyk9Qvcp/bWrh8iOv1Wr/PGHjA6jPYJzSsbczsFPivpOaHThfVMb97NlHPcVt75chNJ6bh1
	NXqiZKtv39MZDhCf77Eq26s13UxCTFpq6zm5P/V5/idNxq4uyLouaqdW3Sx/7Ee+w==
X-Google-Smtp-Source: AGHT+IFqYJhAmhFIs4MrJEK2DwK6ZnHRiHMIjhqtLKd1Q8gK+tAk+5Dr+yVE8hWUGs5AFt4Q0h739aNEfBbT
X-Received: by 2002:a05:6000:18a5:b0:382:2349:5a7b with SMTP id ffacd0b85a97d-385c6ebba1cmr1732527f8f.16.1732706120527;
        Wed, 27 Nov 2024 03:15:20 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fd0041fsm441847f8f.95.2024.11.27.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:20 -0800 (PST)
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
Subject: [PATCH v2 2/4] drivers: media: bcm2835-unicam: Allow setting of unpacked formats
Date: Wed, 27 Nov 2024 11:15:13 +0000
Message-Id: <20241127111515.565992-3-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031522_474202_61FCE575 
X-CRM114-Status: GOOD (  11.74  )
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

When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
formats as well as packed formats. This allows userland clients setup
unpacking to 16-bits from the 10/12/14-packed CSI2 formats.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 36fb186a0421..d573d4d89881 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
 	}
 
 	for (i = 0; i < num_formats; ++i) {
-		if (formats[i].fourcc == fourcc)
+		if (formats[i].fourcc == fourcc ||
+		    formats[i].unpacked_fourcc == fourcc)
 			return &formats[i];
 	}
 
-- 
2.34.1


