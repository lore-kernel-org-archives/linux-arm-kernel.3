Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC5CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9svfT9glpJgkoC//MjvMoYEtW7Hx9VQdKaO91u+NqI=; b=bLquBAaEWMMo/TyG3Xf7//Jl4F
	vWCl+yVrZ15ZPVTzCYkaGvRhW3XxqV1bEM4IS+uY85s0VsvnpwMLNlGV+AnC5ce5UYiFa1zworJkQ
	1v4TSUDqyUwv2V+t4cZcXHGEHvCmHaQUt4KwSC1FroW0P772YmWsQ3kbnuwtydFUBiG8VuH5UO77o
	RVQHTV2OtJoXbTSi+HdLASbpV1dpBLsw36BMEXhuPWaL8lBZt9Rw2ixKj9sXX6ZMZjabBa3WzS+A+
	9O45C57uC/y+r4aUsHW8G23P/qCgDOtzG74d/mqbpEU+C3OJbRZ5JHeo/1xgT5ZvpurANzQyw/XJk
	IfICaXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RHw-000000066RJ-0L5v;
	Tue, 15 Sep 2026 11:25:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RHu-000000066Qu-2KDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:25:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caced6038eso8438325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471521; x=1790076321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9svfT9glpJgkoC//MjvMoYEtW7Hx9VQdKaO91u+NqI=;
        b=jM1LUyS927J91sh+iCImAA0kwsCY/xczwpE738TwA33WrBQAxOL3bJ3ad14j08K7+o
         hMRahSv11RE70VyFyDHa33HXcZr49jFey8btpUpVOJf2Bx/rYoAsEez+80+mohJGUusW
         VyWi7uxOB6CREOTFdJU3WVhUh5psMt5Yg2qa5RpQAmDjjnK5v3cpcCwVrtaE9Gio75D9
         O+vMn+s+ZEiam4d0Mn/NJ4jB/iXxZcOwLEOBEu6meN3Q4n+wwJpYA7Zy5F/yyMRJTERU
         3CEk6UCMoNxTpw1h8d0GvLGtaRQ3pQg18tAf3AHask07fZTOXnHmJX0TwAUKm5jKRL2r
         uUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471521; x=1790076321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9svfT9glpJgkoC//MjvMoYEtW7Hx9VQdKaO91u+NqI=;
        b=nmlrH4knhcnX0eIH//aiHzgqAVrdRuwox1HWP0Aopl2oenjEHzL9BX5ruVkFllU0iv
         u32EX/0uLMK4ttskLy8vR3s7xBQgN+53W2IsVYDBRyw43w3plZ4G+L3DqV5Y3p4f35mu
         i4d2s86G/J1wf5r0x4IjCEOC3dRG8Sk/1k9pGAAMGX2ixvjey73tPtSrL2JRBhVp6PA5
         VsGXEQ6SOLCOEeGJzDyA7TS8FoJaDMi2PE04I5boCxPTlkkxnmeze8wldWSN+nQUI8NE
         ui5lTUL9zEtDf9dqJt4M5JfpzsizeeEtad+eb5jm4c2f49yVozX+4uQUx/UXihAn/mUR
         0uVA==
X-Forwarded-Encrypted: i=1; AKwUvBwZIdIFfNxMyEET/25R4wRoSC0OnyM18iIkTq7P/GEsvcaimyFb7HBpfBjfKEIDNgT9W782QeH0vE7So0inIub8@lists.infradead.org
X-Gm-Message-State: AFuF++nDaUFhgqleRIQ94wncYn3LIgwjYozf9HT6ZS03PZWKddJae89t
	UF1lyd7c3KAxmWyiouGbCW9LBux8cSHp90hd9dlaSgDgsQ79Pt5m3el+
X-Gm-Gg: AYBFou0m88uq6CUh8gvVeDcCjJC3t9uCcAG6LcbMkc2jNsDYyK85GcbBSjBvNG+zHDj
	OW8KQvqiJ8odd7pmmNagEzhfNA3drxHZjgjrrvzMaRKKnh0N5tRJIDqa21h5aPvnEnn4olyP8cO
	bfh6riqPyIQxblSI6X7/rGbP5hRq1DWE61ZPHINbgB1dk55jwNqzOl2mHcFX1dOdJ348DTVBpdB
	0DXoYAMTh87wc+9DpXoWJAxqiceR774OdC2ySZi2l9WkAQ+F9VKrfeJWs/u4ysop5nnKgZGECcD
	yAHKdwkzjt6WUUUlnnymWrWl9Y4rBtEyzoESQ/EKsL3RPi24dNG/zeTMX/65n8MjZNx0z8t4vnH
	o4raVGopsx0GIJhcx/x/Rx04bMrJsK/95d8gBNn3gp7iDEF2oe7QlngZjEEPZIQ3IoXzGJbNDxa
	tAeY3ffZTImZiYhqBhjY+JMiahlCFJVatroIp2JSyw23UvexXvnX7H8w==
X-Received: by 2002:a17:902:db0c:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dd763da77fmr44939985ad.0.1789471521158;
        Tue, 15 Sep 2026 04:25:21 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2d2565d2sm65391005ad.15.2026.09.15.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:25:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: atmel-isi: release unregistered video device on remove
Date: Tue, 15 Sep 2026 19:25:10 +0800
Message-ID: <20260915112511.2397941-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_042522_629114_7A84B82C 
X-CRM114-Status: GOOD (  16.72  )
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

atmel_isi_probe() allocates the video device before registering the
V4L2 async notifier. The video device is registered later from the
notifier complete callback once the remote subdevice has been bound.

The remove path relies on the notifier unbind callback to unregister
the video device. However, if the remote subdevice is never bound, or
the complete callback fails before video_register_device() succeeds,
the video device remains unregistered. In that case the unbind path
does not release the object allocated by video_device_alloc(), and the
remove path leaks it.

Only unregister the video device from the unbind callback when it has
actually been registered, and clear the driver pointer afterwards.
After unregistering and cleaning up the notifier, release the video
device directly if the pointer is still present. This covers devices
that were allocated but never registered while avoiding a second
release of successfully registered devices.

This issue was found by manual code inspection.

Fixes: d12c9088c0b2a ("[media] atmel-isi: remove dependency of the soc-camera framework")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index a05a744cbb75..6a7e240c5b18 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1121,10 +1121,13 @@ static void isi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct atmel_isi *isi = notifier_to_isi(notifier);
 
+	if (!video_is_registered(isi->vdev))
+		return;
+
 	dev_dbg(isi->dev, "Removing %s\n", video_device_node_name(isi->vdev));
 
-	/* Checks internally if vdev have been init or not */
 	video_unregister_device(isi->vdev);
+	isi->vdev = NULL;
 }
 
 static int isi_graph_notify_bound(struct v4l2_async_notifier *notifier,
@@ -1323,6 +1326,8 @@ static void atmel_isi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	v4l2_async_nf_unregister(&isi->notifier);
 	v4l2_async_nf_cleanup(&isi->notifier);
+	if (isi->vdev)
+		video_device_release(isi->vdev);
 	v4l2_device_unregister(&isi->v4l2_dev);
 }
 
-- 
2.43.0


