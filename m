Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A5CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8eDv60t59fij6+u3viH7XuZxXWmRapj5ScjYDalAZhI=; b=4NSYSFhSfkUvgQ4v6jkVNUJOXh
	q1c1z1PFagHHYILxoVxsh3ob5HVcosrlOyT3aGegDaxUP9HoijyMBkJRU9zZRAyPrCRcRQT+V94R3
	z2LRA5kP3Iez1HBlXZ5MllvLNDPwTeuXcB3g1hNux/4jMrWwq8AjNrjPvodfn82QYC6pWv47IpJtl
	GAGHG+v2+3rm6FWF+MgK4GRmiBHgjEdm8lTNo46SaLbxBd7WcJLQGkpHoxqrBndu1Ad1j0NakUDfY
	uGLQwGB4UkoCL7Rc07rs1ad7u2o5zbzbQdlMJGmuOpZ1O7TufLJqmIhgmNYyw811i1cw7LEP9BU/5
	TYjImu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzz5-000000066wB-3iYz;
	Tue, 09 Jun 2026 17:11:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzz3-000000066vs-2cqP;
	Tue, 09 Jun 2026 17:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB1FE40B02;
	Tue,  9 Jun 2026 17:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E20E1F00893;
	Tue,  9 Jun 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781025084;
	bh=8eDv60t59fij6+u3viH7XuZxXWmRapj5ScjYDalAZhI=;
	h=From:Date:Subject:To:Cc;
	b=a4kH32iFFZYBJ014WIRfA//0+3vbUCOXveTw2D8JHePmOxP9aTw8l0YT3ysWmv1Fe
	 wbFEakxFIMKwZHJGw7nT0SLFU9PhtcDRaILcY6/rZgwXhjU0VrisDWrYElSo5SqPF/
	 h7DgAr7Y2yzDPWatt5DABP0GBE5EoBbf/ncE0yGkIgP3vnXUCVYYMvbMHL14/sTIWn
	 3YBfy96ew7blLPaMLMgFGMpvWipNdtUwxlYq6Xr0yY/1B6auzWuNF097zmMAvBxX2V
	 FzTdEmGXvw54rsCCiXCdjv1OCc7d8k4keYi72hG13FfKD84rClgCkZpuOjxA+lwlHd
	 lJJxOeMv3igPA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Tue, 09 Jun 2026 20:05:23 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
X-B4-Tracking: v=1; b=H4sIANJHKGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNL3aTk3ILM5JzUxDxdM8tEi9RUY0NLoyQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAIgU7h9uAAAA
X-Change-ID: 20260609-bcmpiclean-69a8ee3192b0
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=BzLLIM23M2A1UoG7u/RhKM9xyYs5pfGf/s4pqyRUtvk=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLI0PE3bqvuLAtnk7P21OB33B7Q5V9uKuMxbZV/9PpX33
 G3X+3wdpSwMYlwMsmKKLNUm/2qF+3e4n3S1VIGZw8oEMoSBi1MAJiJ4nOGfoUpuLJf12fZds/6F
 CL0oz0vdGHe1yyc7sMZGdr3Bsrxchn9W7//5vN0zMbJwHrPGyf9yx0/91Ek5yPVaMrTDcOemV62
 8AA==
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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

v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
v4l2_async_nf_cleanup() is called.

Call v4l2_async_nf_cleanup() properly in the driver paths.

Discovered with kmemleak after rmmod:

unreferenced object 0xffff000084526b80 (size 64):
  comm "modprobe", pid 185, jiffies 4295013512
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
    40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
  backtrace (crc ac584083):
    [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
    [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
    [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
    [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..1508843ae58c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 	return 0;
 
 error:
+	v4l2_async_nf_cleanup(&unicam->notifier);
 	fwnode_handle_put(ep_handle);
 	return ret;
 }
@@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&unicam->v4l2_dev);
 	media_device_unregister(&unicam->mdev);
 	v4l2_async_nf_unregister(&unicam->notifier);
+	v4l2_async_nf_cleanup(&unicam->notifier);
 
 	unicam_subdev_cleanup(unicam);
 

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-bcmpiclean-69a8ee3192b0

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


