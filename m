Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1807FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=; b=kvGROJbvcMy4DnSIvBBQjS+1Ul
	y+2FEWXRDewnVbjYmYWVEOiD9bckRS2b2ZwUY02sBu2iM995XVVk06dA9DcHzmYHUcDoQNKTuXED0
	pHHSdji5i6DKR6b5oDNzrnZ9sI7amZf1rD123YDwL2UI0ofi/6U7kg2RvUXpiSxD75JJWjEjYKM93
	/3j2n4dcxKa4Q/XOralMc6AfjX03uO3dwOKft0M3MI7TTQp5jCfnoy2QmTQJZgaQUE8RFQnT/xE0z
	OM+LmkCg974n7Bx06cRI8i8FGAuv4cp3DBgRyRdFcKhasenV44UXpX39ncnnitublCknTlA8DiVHT
	k0q9vAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISKl-00000005a9z-0L7N;
	Thu, 30 Apr 2026 14:25:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISKj-00000005a9b-1Zs2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:25:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b461310af5so4150865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777559140; x=1778163940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=soCucruw0tsEuq7xS166J8Sftf6XhT4PKZJN2UoXFpSD6vJNJ8EBbXdpolOji/N6XT
         9PItPeMHBOpTJ+iihdLaGZHKxTE1YFJhtUu3PE6uAoYP8dEiqjkP7P+OWaMwgu5jwXB9
         wm/9A73Pi9yEN34GZDfjvH+1b616WCVg04b6AuTD96soeEhxGMc7rdkWiz+6IzhJ/cWN
         5T8V87qF+0a6yciDw6emJPA1MGHnAYmpkiWHbwn4Ma9TZVzWb+bBrsgk1UMQVVEIh6lV
         NH/LotvzVg5ORg1b5j84ZoSgSRQtDSePW+7lGZbIoSuC4GflFojuYg3IW11TmOm7Lmzd
         A3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559140; x=1778163940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=FiH5BfHmEE6T/Iqx0tXUgUwFyZaHsEQJZYyeaSXqjL9LKFKMcgoJYJXZW5isNq/Oup
         Zkcerx/KaYA5IkRCSJX1NVq4uhks+6Ee/crWNXHMJlBEMwOGI6ZrG9CGnBEnjjOQofov
         7STlBfBSCxg9tZNDQUzBLRc8hq65kCYGDt1R0vt7pHHnawiMQbRi/Riiib21GmUCs5cP
         Pin3+++YCD6skt143JAnYlUm4D0y0ilROBbuM223rmigp13PGWEKf63pgWt1pqvSkqvn
         QMItSJvfHnnHn+jU4aZ1UF+lrwx9qNKuvEjBidFLFRpUvkH2aWXUp2sjY+xEwUwrhyKh
         kodg==
X-Forwarded-Encrypted: i=1; AFNElJ/HiDCRa7JD0BsGjxAA9TlyZTjYoF9t1Ykoq+ZkA116vk+R+5hAnA1my6eJgdCQYZWuGWWR/EdaR9VK5Dwdtrw3@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+tPOXWPpbGdhrknjp187V5gfQmmwKyR7Ml3plWYlZN5OnP3y
	/IpXgMfxgGgAyGXpaQ3CwIHNE5fUelQ2C5iYJgqhgRB6ilWgF55sYlk=
X-Gm-Gg: AeBDieu8QDfPIuSE5eCVLbVKAfmFBDBX8Md1CslKStxWmEYdKKhbF80Rl24Ta0xBbAf
	Lw0aV2RLwbyp0GIMBraS2w8+OHMflK6GtEsFix91wt0YtgDGP3nDjjfze8g9Gg77FYJrCxXatHP
	yyR0SgXeL2KtMG8HjBbE7yaNCqi6k4ctIVzFMw7KSJp8WDKImgSVYlXf1njqx+kFgHjh87gBDwP
	BmgIRA8so8Ptnputk0C5bk7IHBcqgP2+1bhIMUHROyBRwco4MHgzlZJyZpYPOJPuJChYSh1QBzH
	/YoCnhlCvGJwixjAUr0STcGgiri27ztHsC3pC3SN7m9Qv0sDQL0KL+xGD4pZX4vMi1fMqjKHKER
	5Br1G+/78JMbZrFXMV+f3iloI4taPX1jXDxNEkXN2rj7DXBCPHbE1qAtufMVxpVPU+imJ4IIsEv
	fJtBg1QHJE15R5Wi8MdbuA8qraop/KZVZZKJRJFmtdjH3hEu9nDFKYUcI5jfp1fqxtEUrqWqpjp
	PL3VhmeoPrYU1eGDXnZqAZ9VYq7jxGCXjpdm66OtNBAeFiIwmHyPPNAsAgGmKA=
X-Received: by 2002:a17:903:3b86:b0:2b2:ec33:cf15 with SMTP id d9443c01a7336-2b9a42dc3b8mr23951415ad.7.1777559140212;
        Thu, 30 Apr 2026 07:25:40 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897edefsm54194885ad.74.2026.04.30.07.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 07:25:39 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] media: cedrus: clean up media device on probe failure
Date: Thu, 30 Apr 2026 23:25:29 +0900
Message-ID: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_072541_438998_C69146BB 
X-CRM114-Status: GOOD (  13.85  )
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

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1

