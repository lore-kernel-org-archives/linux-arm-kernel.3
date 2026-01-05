Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F7C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPGhObJh6p/DSugBaOZ6iBeMK4ZTjHPbYDiZj+b1/wo=; b=RZSe19o9vBvNH9OwKiW72wFm6D
	BV474Xx+msncwWsO86JmL9Q+m/8Zl0wU2H/DB4NERI/iN1wrlfcMZhLZ6vC8EhQiCxZPUqG5zu5og
	HsufEs5vVI0gGKqSFVJVxzN9W38bWtrwtn28gApJxEvHH607usJKADDGZhqR4ncsSdKaqEpOarnEy
	S1eCHY+dTBdrnQlKgt009YNGe9lwlZiOfwhmjzYoXxjTh9deWXMYgAQPArqMcw+YR0J21lgL0CHrw
	XIeI7j+o4bGQitjc2AMfYB5GRi1Wt/CiIsxiPE8DZYWPMQUx4eEnqf+BmxhQPygpqUhIGAxIsBNmT
	C3rrsxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgR7-0000000B1ii-3NIi;
	Mon, 05 Jan 2026 08:59:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgR5-0000000B1hP-00WH;
	Mon, 05 Jan 2026 08:59:36 +0000
Received: from mail.ideasonboard.com (unknown [223.190.87.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3293422A;
	Mon,  5 Jan 2026 09:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767603553;
	bh=IrxFe1lrCBvxReChMTgPwOdsw66G0dqVQjkOzd+EC+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wNnS1q59LTsqwloUYby/iHc5Pwgxy0sMaW997kCOKfL3se6mYS/V9QAht0viT3qMG
	 Vd6N07jMMDGKaCBEqJwWAUnLlA3TLA6UX61l6Ou6zGrkOYWUT8edq4gTTly93JksVC
	 4bkR8S3AjHR/rKOxR5gi3RmLXp3Qb3QtTMBuO/yg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 05 Jan 2026 14:26:52 +0530
Subject: [PATCH v2 6/6] platform/raspberrypi: vchiq: Register vc-sm-cma as
 a platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-b4-vc-sm-cma-v2-6-4daea749ced9@ideasonboard.com>
References: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
In-Reply-To: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=QYSQaUNB5lBa98ydD83CEAKtQUeTbuJyuVjbux4+qMw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpW3z+sMGXH5sVaPa3fvc4cmzVziCxoz370dWdE
 Z+P6fu4RyCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaVt8/gAKCRBD3pH5JJpx
 RRQAD/9Pe2aMP1jkZ8t4yCvCmwzKA04VeVllyVHrvqIzuTyt9qlUfdML5ht+uFP4DuGvcv6lwWX
 vfZ+1XyOiaC8uEJALmVCk+fmAaw7+jId1JqPWk9rgK5ENRs3zP+x8sgD0w67s9EkVPdTRz0aVez
 EOujMxXsO0A54yPT/Suqw9MGLAcXxVFo4uTAbXvzyC/RsaMQlT36ytcEl5knmk2NKEGP7/l6wBO
 c9+ytklURyqDaUbzPNiCSHRJRqVgeE6DA3mH7dcREUzEayOsUzUjtxoNwPy5PgzmPF7WLceQjwY
 Tk4swoURnwgMa3B4BwHv9tozbIu+652invW14echlO7ePon8ygHf9JVmRWHAZ0Y++aoopVeafcl
 EQwrSvjRcXhyOITZ63Jtg1DllEvWBbbX15s/5aJwv+Ryrq7VvaMNQ9nrUSnovLt2s25vGy8E7vi
 OmHkPLffPhsvei7n4L+4okwTPOFrlXZqKZkcKFGqVPjlhN4H8cTlMM3h9D7JabBxXQoziP4BPih
 3JkE16WZSReRGqvqxvhmiTejTM2WE8e8Y3JXktvYaLmPsASbe5fpCIk9Nin8LYzzvQdTTGt1a5D
 ldBdTDmtR5hf6nPgko8HvXh/iIrW5iZ6q0kFwPxzJ+O3KSIFUUdL4Vn0x9QwsK+GLJcEiayCAz5
 aBgWSNUq+evaWiA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_005935_185361_B9CAE561 
X-CRM114-Status: GOOD (  11.38  )
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
index 2cc7574a6132d9a26278439eb5f89c7bad94d764..00c31f18bb69fa8f21a2a048393ea76615eb926b 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1415,6 +1415,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
 
 	return 0;
 }
@@ -1423,6 +1424,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index 541b4efd64d9a8229c7e4b5bc21137a9899af9c6..d59837eaaa8c0e699575897c01d17359a58b0e62 100644
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
2.52.0


