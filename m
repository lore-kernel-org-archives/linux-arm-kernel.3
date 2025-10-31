Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779CBCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83TX57/PmSJw58PmSRiMF2q6MkZxkb2Yagt86BaYVvM=; b=vfJLJdpqe3kTI3AUfoTsXksQdm
	xkfk91q2qmGvEQ22KD6qh7wKWvxvdFQtU/ew66NVd+kxLo77YtMqxHIjt0BOn8K+drmVyD7V6iPL2
	zM9xcavcuOTKp3BDtNbxb+HWUhLD2l/LlYpwe8mIUH09CE/VdQ+7UQ6Jy0SZ7o5ERmmQOHevEXLxo
	Z9jHcCLskh+TkLCJ041NQ5poT8W5hySNni3itfBwO7LpD0RYZdlArBE+YNaO+3ynOcN4WsRUKvy//
	NRcGhevPEFm1z+GfrYUW0soKM/CWG/C21z2a1QUQriZVghLRSLH54qoNzcPKCrBxSHiV58Sq7kd/y
	tEFjmjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt46-00000006YK0-0ztA;
	Fri, 31 Oct 2025 17:37:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3Z-00000006Y5S-3NnD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:36:59 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 660DD19AD;
	Fri, 31 Oct 2025 18:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931644;
	bh=9CJ7u1jnlnm84awcn639u6Yp/yBstqIpcAoOOdICSkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MJdDdwY6W2U6sGWpx79RZex9hPLCL0rz6ZVb0ZU5ctpvkqx6nGysWUil4gbDvrdjh
	 0M4INmFp7O38NvgKOYyD7zIWhUUpQIuvFs/ciPbbnjpGYmx/+d0NiU0qxXnBQmUUHB
	 /KbzPPnKxIhxKSALiGtJPad4Ky7baUYW/M531ERs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:33 +0530
Subject: [PATCH 13/13] platform/raspberrypi: vchiq: Register vc-sm-cma as a
 platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-13-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=rAaQpRHtWGp7BJRz7YWXM337EB/6DfYZ9A46xHhwYZY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGgaG15cb+ogx/QrVis56z2df+pwHeMLcxzo
 qRCX/wZD3yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxoAAKCRBD3pH5JJpx
 RbJgD/4wpdKvt6yg4rO214J6mG4ABEkpeK7I0bf88qPV1ZaNUcjEAz9XusPjEpkUOwDxPgoBfmH
 1FBudws2zDI2/GgOa/H8/1+IWkJY+SSMWzo4hf/KbdWM8tvFST1efw5jt4Tc7UvmItrtbDXVesI
 Eswog4EObYV/E88rvqxRX9aaF3xEqwMz3H8an0MIGIt3DtU7gpO5AuaKcQBiXyUd+jPYy6TLijD
 /fHo0tkjjJC484M7eIE8IFoudnuoD1RHxZzDURgZAgpEBQur+y5k+mjsA6lKXoVdifBX5JYl3WV
 Mjpcl8i5V1I8+eM0dPzwaff1niZHbe5Twz66m8S02LIaAv0jDo3LF4w3lLDMDzX7Uv2jaR6XeKc
 e3yK+2u/SguX6cRULhgu4ukwWMFujsOFWi185jbLSZhF00Gy3YqaXCR5K9Ip7drsPMaxQv2pRW/
 Fw98H16fY5yAKxlQSKHim9ETcdfSLm0uGCW6N9J43E6AKvSm4bNENCgh2TA6Cl+KPNwAPvuW1uj
 /veJBmoYagW91F+gyq23/VSeuQ6hhO6XMKzYyK5H8PMtV6p05OPo3aDYglBZS74P5JxvucjB4zQ
 0NstgRBYQoeVRD5KKqyxmzzQNNm2k1FE64UAgMtcotHGoSW+lNc+NzsBl36WbwZNuxD0vr31ISP
 skDwFCSpnquUd9Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103657_992021_8F3D2E93 
X-CRM114-Status: GOOD (  11.01  )
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
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index 6a7b96d3dae6275a483ef15dc619c5510454765e..09d33bec46ec45175378fff8dd1084d0a8a12dd6 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -63,6 +63,7 @@
  * the interface.
  */
 static struct vchiq_device *bcm2835_audio;
+static struct vchiq_device *vcsm_cma;
 
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
@@ -1421,6 +1422,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
+	vcsm_cma = vchiq_device_register(&pdev->dev, "vcsm-cma");
 	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
@@ -1431,6 +1433,7 @@ static void vchiq_remove(struct platform_device *pdev)
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
 	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(vcsm_cma);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);

-- 
2.51.0


