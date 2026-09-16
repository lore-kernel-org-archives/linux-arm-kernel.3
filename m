Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE2FC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=661YqMQMz5cvzMjOWZLBiKVm+v1hNc27gm9Uci44zK0=; b=KcHW3Qoc8nQZjTI8a1Xs5CbkwA
	d0nRvoImqtbxQtH+wVBkvpYznitiZ+O5c/h5CSvMmKszVBp1QYj/KcQVkRU3RRp/ePG1ePBl3Zw7/
	zWX8/no5w1LLZNLxjShZ71OARVjQDHmR/BusHAhAbDXrSNM2oyEFbH/Z3Wxl0PEnZoiEDtk9yrdPX
	KnqEF/2wvDMgnQQGyYUEq8168MRCb4FLG0juydx6VgQ0h1K3qH50qLqNGW/sU98+IL8fF2iIjwVsY
	j0rSV8P3cf9nTeUhGjfkLsTRYtm2SLOcf6onKtQGOm/lAXlyv9etBZxUhJ3W0Qv+xwUpFNKb7pwHe
	CUMXWqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgy-00000009QPC-21jC;
	Wed, 16 Sep 2026 14:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgh-00000009QGn-3U0Q;
	Wed, 16 Sep 2026 14:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=661YqMQMz5cvzMjOWZLBiKVm+v1hNc27gm9Uci44zK0=; b=AoTctt6HcLm0pk1qEu2u2n8rQQ
	f0WL5TLmWtkbJCOQBl9IzoyBo0q2qVR6ffWP9iJyKui5hMZcfsuNkWZDab57iWJCtODBZvLA407sH
	DtxejwIF0GgzrbazKCIDw1+K+yHKI148gq/cb/L0hzpp5XsNwjFKRlM++6wE2OJTZTQnwAr8n0QGf
	uKNEnRq89MLBsRyJuzW7vAcPoUiPJ3oPtzWKxUWO/2ani6dXLK0THwNYI8stBnp7g6H/+hq0TjCxB
	De1qmoHywumS49FWqZWqOZgbN33CPSDDM7xd6IU920D4IBhuZ7wXTDbpEm+EzJbo6bUy8iC+3b2CP
	v7XBUYhg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6qgd-00000007z0e-2Qpw;
	Wed, 16 Sep 2026 14:32:38 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C781D9D;
	Wed, 16 Sep 2026 16:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568709;
	bh=KdHne8JVWl00C76d/vQ/deohl8aXPm/dOynE+3pXqa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cPX5g+piqUc/DkzohvliUcjGHPQC1qfekEToOOQL4CN3R/c8QfGq6JNtGN8U2THC0
	 gPvXzXxlFoZU0Fu+e6AJkbYdEpvqdywKLKH44qB7UhcOxiEnZvOeUy9NzFN9amRh/x
	 rzhx3S4yp4icmRzhh+iDZxM/P6FwiL/DRQkmRahA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:36 +0530
Subject: [PATCH v4 6/6] platform/raspberrypi: vchiq: Register vc-sm-cma as
 a platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-6-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=5ezLzp30SU9AON3EIsJ/DU9IOTPIGbTZONyPk3ksxLs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqcBDk6V1seiAyxqg7E6I4IbgwOcvEAQPAqr+
 IfBQMggEoGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqnAQAKCRBD3pH5JJpx
 RTtxD/4oxIaT/c2vR2R4zKvJsx9C5/OzoeW+0x35u2KOLw1ES0VNz7jyCkAJWyECgCL55vsxYKr
 8CXVrcUAbEVV2s7f5bOg35jEdb45+ykmXP/EMpYdrLMKkyAtDvfDfedl9T5Ox+ZnhVsrwaCKvw5
 xT61fFFGGPlJ21Wzlv4jSmXvgiDrk+3xEgEkupqXVwY2TUSw/I7lP4P90ZyXrtWM3iELdSb/jJt
 GQT8p0CCJKcFOpYCau4s/4gqMwptzaNLwbmOi9bHADj/qScY2dq4AL266ADVPPXNW6d5nHzAJ7m
 J1JOnab5NfTeTiGZ4s5Jcnp8G75xyMH6B3SMLKGY7GsrXonZpFJop92zcUyPQpw3JmyNazEOwn5
 u8gfyBCGxOLmISBlusqAlxSr4pJxqblMpBBcCgKhHjBYLx8AjVcK3BOORQ9hfjq5F67M0SYg3bC
 a/MYj6cd/jOw2lFP/8Y06fK6+MthPfz7owh/QPBzepcaZNqwklvkXO6TvJVeV0ORaTBA0HuCQ6Y
 D1XpqIYPXpTQh128VjUfVw5OtRK13Grv7cWQD2AjO0qTHwRfbthQPvfxVTl+W8CDXxzUQk9RWcG
 A8pCZMHmGsXOeStPkFX9DVcoPhuSbW7JKUed46GK4Va4gbiHqJNROSeFpFiaSEExyusZZQjQ6oo
 KCDz4g7hzYTAVOA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_153235_774002_A21948D9 
X-CRM114-Status: GOOD (  11.20  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Register the vc-sm-cma driver as a platform driver under vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index d5a25033a261..ec951ab19d67 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1414,6 +1414,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
 
 	return 0;
 }
@@ -1422,6 +1423,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index 541b4efd64d9..d59837eaaa8c 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -62,6 +62,7 @@ struct vchiq_drv_mgmt {
 	 * the interface.
 	 */
 	struct vchiq_device *audio_dev;
+	struct vchiq_device *vcsm_cma_dev;
 };
 
 struct user_service {

-- 
2.55.0


