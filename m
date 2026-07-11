Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586B9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk5V5J+DbPG/Ee/w/hWVnY1n/ftwZsWJmMFAPAEy6a0=; b=bC0IDnFRJA8a+juElEcCWD/N87
	IQIVSJNkbZ4z/8J+69r+ilLW7n1TFpn3aojJHza3fOo4nu9G9dEnNiFCcD+kANqTf2ARKcB+2mGQs
	uvUA1wTj9V6Ky34ysg4k9/jaZvHGYH1sH9d9rfIx74JKmHVTkrZWgJxuSu7huH307cWM1rcrIHmX8
	jYr9RkdUngHEQLCZGMjxnekbSCqP0zXN+vRTUw47hRx/eWobUKGoP/1vI3Uk60QQDybycZtb9P0kI
	ighVc8StnxbOBI6UTPmy+UXR79dOc7+Yrrby2757JfOuCntyU2MnGo9BVPbvEkiqZ1fejLWjSTn9B
	cQo5Yrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDg-00000006VQW-21sZ;
	Sat, 11 Jul 2026 11:50:08 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDc-00000006VOL-1ESo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:50:05 +0000
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so1425630a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770604; x=1784375404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hk5V5J+DbPG/Ee/w/hWVnY1n/ftwZsWJmMFAPAEy6a0=;
        b=NG3Ha+uCg1zeXv1e3+37XI663kQ9GVaAbYqwUJy+ferhQdKeLJGAixjlYd+TldeQxu
         r7A+0ebb61OoO1RkpC0I2nQxE7UekAuTafFuOa8/HI5A8jQJ1RMzk43ZJLfSpHopxu9O
         r36W9D2pHHDHHrd4gzOxf6tR5gUwT4cIlBNrkzgtY/4iO719KDQvjt+PHh0/Yxpd9o0h
         bLbWKBs20ZVbikjUOo4Lfm4KlUFV0TsBrhJgZ2C0sz8qJK6xcqirQuY0vKOmIr95IdxD
         RGW1Qu8dv5+UHnL+F8UVFcoh40POgglJq/NiSIT6vTVRqoLHbqu+1e6d91+Ep6DIuGP9
         nGiA==
X-Forwarded-Encrypted: i=1; AHgh+RqFYwRFu15ddR7oxZWn8+Q5FqvaePdGu/fPHuaHHmMkvWHahCnGu9OPqhuKjam0I3Vwek73qvVUxK9gZNkiL5/J@lists.infradead.org
X-Gm-Message-State: AOJu0YxgZtGLT32UM5wcn2mCoy2ek+hp/8JG8QOWjYXmJ0gU3OM1QBm7
	1b/CLgNyHU7JZhqgu/pJ9ixLhfTwbFrJnvYOL2HqoTeYiu9brqoQO1Q=
X-Gm-Gg: AfdE7cm6nbSjIxfc/EA/gZTlLmsj0iKpHZGynsOW9xsgTNX8alM9KDO9XoHmtZX+9hw
	4+DxkqT9ODsIQpRbx9I13qEMZ7Qxs42+gSffWRZB8D0ZyWWAAj0I9EztQkKJzlsPY26kgnvpIA4
	ACy0RMoLD9BY2DlZJij6me5qcPNkWlSFB4/KuwceHqoGEXLaCBIL4uebgfIoKhstqNWm7IoF979
	bKkBzbPfuGXLZxVRAOEd81/trBevaBmejnE06oTwzscXgDTflxmMPWkbDK7u+/BIS7DDe7kLky/
	9L5Eg/8avhvjEsqRE36n4DMzGwn7xYNcSP1IGd4Ihmz05Amgqyza/Wy0UEHQoBrymvTkGhV5OL4
	eMcRCM47P3HNE7s8hfnSNHanV0tWMuDx4myWC8qYcDCd4PAd+M29rywwWESuHwM5AMvUQryPwap
	WoqXoXkFjpBR6nyWQQJkI4DV7FW2Lt/gg0zsxPawmXteahJE6ElXu8MT3dyzu90mzWrX7CSv1Kc
	aDEHqcO7sqMcrvOTQfLj6TIiA==
X-Received: by 2002:a17:90b:58f0:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38dc77b82bemr2604555a91.35.1783770603661;
        Sat, 11 Jul 2026 04:50:03 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm3957570a91.1.2026.07.11.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:50:03 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Shih-Yuan Lee <fourdollars@debian.org>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] Input: applespi - fix NULL pointer dereference in tp_dim open
Date: Sat, 11 Jul 2026 19:49:36 +0800
Message-Id: <20260711114937.16670-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711114937.16670-1-fourdollars@debian.org>
References: <20260711055247.5412-1-fourdollars@debian.org>
 <20260711114937.16670-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_045004_332967_71812A21 
X-CRM114-Status: GOOD (  14.60  )
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

The tp_dim debugfs file is registered synchronously during driver probe
in applespi_probe(). However, the applespi->touchpad_input_dev is
initialized and registered asynchronously in the driver's worker thread.

If a userspace process opens the debugfs file before the worker thread
has completed initialization, applespi_tp_dim_open() will dereference
the NULL applespi->touchpad_input_dev pointer, causing a kernel panic.

Fix this by using smp_load_acquire() to safely load touchpad_input_dev
and return -ENODEV if it is not yet initialized.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/input/keyboard/applespi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 3bdb9e7cfb8b..4d339445e9c7 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -963,12 +963,18 @@ static void applespi_debug_update_dimensions(struct applespi_data *applespi,
 static int applespi_tp_dim_open(struct inode *inode, struct file *file)
 {
 	struct applespi_data *applespi = inode->i_private;
+	struct input_dev *touchpad;
 
 	file->private_data = applespi;
 
+	/* Pairs with smp_store_release in applespi_register_touchpad_device() */
+	touchpad = smp_load_acquire(&applespi->touchpad_input_dev);
+	if (!touchpad)
+		return -ENODEV;
+
 	snprintf(applespi->tp_dim_val, sizeof(applespi->tp_dim_val),
 		 "0x%.4x %dx%d+%u+%u\n",
-		 applespi->touchpad_input_dev->id.product,
+		 touchpad->id.product,
 		 applespi->tp_dim_min_x, applespi->tp_dim_min_y,
 		 applespi->tp_dim_max_x - applespi->tp_dim_min_x,
 		 applespi->tp_dim_max_y - applespi->tp_dim_min_y);
-- 
2.39.5


