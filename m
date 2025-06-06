Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04053C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXB7owaITI+QPHgQ5AVRw6SvUpijKJbmxq5X2tdK1fw=; b=STNl42r2okQaM1QkwBHN5rVcFK
	x2u6obCvtvw/8byOPK20b117P/3MC1PHL5MMtJiaWEv7e/s9yhkTOe/HxRPAMTohLsrf5ZXxIOk+S
	lUqPnICWXXvvPwJAhJMQmObUho8p7WpazPFSjCM7X8TKdpTfJw5PPK9/RS7XV58FEI9+/OCuCgxNt
	Q7pmUm27YWzMS9fZWCAtAeUl1pf9i0PKkjoI/nxtaS9tsMk9sYl7128w15zZTF45FqX76jJvCCxlJ
	CRDnOCrOgckCzMpcylpjK4EOnbPnyUknVmlCr/5KHva5j/J5Ss/tNHt1w2CukRa9ogq2z+e8V/Dy2
	Fcz4Wafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUVX-0000000040y-10X7;
	Fri, 06 Jun 2025 10:41:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUKP-000000002tY-2URi;
	Fri, 06 Jun 2025 10:29:39 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 910C31648;
	Fri,  6 Jun 2025 12:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205770;
	bh=V+Ek8KvYXVxMnGDCEA+ZZupIN9VfOzRn2A+zOM1rIFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LyobtJeSR70kPu/NJewF6WvjT8KSCw1gBtLv2N60eJvVep1KxdIMKo+yJFYWyLxLI
	 a/C3EctwsYf1Tl0hOPeG0s4X7T4UckFvl716UipY5Rjm9MQKVK3ssUBgVnK6l6RNVj
	 jMGOzQZDvQXnGUwkQ50NLofmFC+Q7ausn4aZS0Y8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:24 +0200
Subject: [PATCH v7 4/4] media: pisp_be: Fix pm_runtime underrun in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V+Ek8KvYXVxMnGDCEA+ZZupIN9VfOzRn2A+zOM1rIFI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMJy30vmgezVQQsGohmNhEl7scj92nRO6VT+
 83ukN8V4LqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCQAKCRByNAaPFqFW
 PLwBD/4jPLV38ukgCPlmkOKp/S5DffYm09zKURW5qlvF2508WzIcSyvSUqDlH0oc1+OzTnU6uaA
 tvkt8OjmyqHCJQGsWQ/K2OSTvs/Q++BngwUkyduUk180Xc3qlpZlI9Qt9QHpsI5imCxa0vFZWzB
 7pcP9r2+k/2Npa37fxuS23zrwG9UGcwcHlZAummjU2z4eLQMHfSNgnvUJdwNcOSJMxtjCKxMAtS
 p1XUvMATHwzi2DZss2yj/PBjwQv07zIXi+oJAuaaC1vVd9lKlAT55DbxewopHQnTXsJLj52iHqd
 tVYHeuuzAuk0ACtEqEkXhJnvI77s8KbWQa0FHEvNfR2UK4TSDrIJqbE74COoyJKSJLQkS/1+x2B
 3Oo3AV6uIYMg22nFy5opWcjeDROQJkrSVJNWO4TOAFZ83lsmySSUtxFyY8JH21aLgkYQxMVaZUd
 26p6NYdGlMI0Kl9IbwefIuD9UVY62zmVmw5KoOvI8DnGcxGpLQyedyxSyLyAindzmt89jq6ilZ6
 8SOpvj/908p9v3uJem0eNt0Ow/ZrhW4PvVAtyw4QBZiAKNjPmPmjc9epAUCLR51ZGdrlIgYrcw9
 UEC7p5Q7ks5Pxm7sRpScEDFzqYqN+Nv5tk3mUzog08SKZQpGU/RFDCYAwPFMEd4ourQvHMDCMsW
 EIlxkCnCrIBAM4Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032937_798126_41684D48 
X-CRM114-Status: GOOD (  15.02  )
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

During the probe() routine, the PiSP BE driver needs to power up the
interface in order to identify and initialize the hardware.

The driver resumes the interface by calling the
pispbe_runtime_resume() function directly, without going
through the pm_runtime helpers, but later suspends it by calling
pm_runtime_put_autosuspend().

This causes a PM usage count imbalance at probe time, notified by the
runtime_pm framework with the below message in the system log:

 pispbe 1000880000.pisp_be: Runtime PM usage count underflow!

Fix this by resuming the interface using the pm runtime helpers instead
of calling the resume function directly and use the pm_runtime framework
in the probe() error path. While at it, remove manual suspend of the
interface in the remove() function. The driver cannot be unloaded if in
use, so simply disable runtime pm.

To simplify the implementation, make the driver depend on PM as the
RPI5 platform where the ISP is integrated in uses the PM framework by
default.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

--

Cc: stable@vger.kernel.org
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 46765a2e4c4d..a9e51fd94aad 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
+++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on PM
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index c25f7d9b404c..e49e4cc322db 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1718,7 +1718,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
@@ -1740,7 +1740,7 @@ static int pispbe_probe(struct platform_device *pdev)
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
 pm_runtime_suspend_err:
-	pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_put(pispbe->dev);
 pm_runtime_disable_err:
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
@@ -1754,7 +1754,6 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
 }

-- 
2.49.0


