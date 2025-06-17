Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DAFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYD6S8hPGQTHZufVd3WUoAkSmrJ1ECG4GZkVwsff6jo=; b=DfnxfHrc0JJiwJyDMu7BVW1jIC
	JFpI5TobT6Fu4RemImWM3v1+4WPbS639riXUv7oRV6w4er2nRQhV/uWwKvDPuv3lpQ9MrgbqxWDOG
	fUspt2ZLvO7b7Yw0FqwExTU/SHS0WXsYCtY/pRsfRVvF1MvqbQW7tMISBvvJfS8VhgvqhH4gCIYud
	VFfSrMrSrwLLUG7R/UB0MKRNamIfz+Bw3v2Z7nDtCWL7LVqsKEw+H8hX3+ffUsOD65Gvk4JEiUaHR
	HVHw5ZzP5Bu+sAJ2ooc5wVI38zVIJ9H3eGaTK5zle8qo6VwxScJPiphr52hibvTSzRYpSrIT2Xmvu
	FWxBMmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXj5-00000007ejy-2evQ;
	Tue, 17 Jun 2025 14:55:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWsv-00000007Slo-2OEF;
	Tue, 17 Jun 2025 14:01:58 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE7BA4371;
	Tue, 17 Jun 2025 15:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168445;
	bh=+zqqmKIUftUfrElMykNoEhWSaAdLvXt5iznvaoygcTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HZx1zX53qc58axyY+buCnKjSNgBYyNb281iQ+d8JoeKYrFZZWX3+Uq7/tc9kqNKlx
	 a1/Qcm2aoy5sOg+iSbY+pNP1HmmG87SmilEjPDO3A0IytziFsH+5ccIqEEf/s2TiPZ
	 22rJvmVLKMOIunr402Td3u51fw2mZjU5VIXmY+WI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:54:02 +0200
Subject: [PATCH v8 4/4] media: pisp_be: Fix pm_runtime underrun in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=+zqqmKIUftUfrElMykNoEhWSaAdLvXt5iznvaoygcTU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEbA+dXnVyiD4fxG8s5bJd//kD7Vj5ntMJc
 MB1aGNB5uSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PO2QD/9FWbjUfguHOEg9Va0TjkdMBLIiy4tT32D8DssRg/qq2p4rWJPSjE1Hjabozj8wAgpJ8Br
 puM+Lgw2lxhq1t5DSJvKQkkEirD3uedtCHet2vwU95CswdHsnqljKsytl67N623aNIgE9cVBEYF
 APlOPUuY81umvgcQeYmTVdvOHGXphD5IRSuJPDiXb+FcxZWozgMIkkM3Mc5muYq6RImez9DGOKT
 iT9C/A1isjiYMu3nYac3kMWods8nBeibf/nsrblNt3dvEo0mRqwUf/S+YunHLZMH1+8GZasW1SB
 H5Uh4zeUlPKLBChdkjBJDZBMCUAlPPcfMxb46pYfmw/iZvZ3yU16Q5o9r9uwVBztwBGkdOK2yGQ
 K2vmzZMSPFPzaxKPfXkb77G2QVOBxFId3FwBaXQwcviPRoEyPvonGhpb/Zs3BzsDr0RH0eo407D
 CjRtH6tQo/KXPI14oFJGBY4JczLbJjK6zxtTtVM4baqlfZxakT6zXDS7qsE6+iQJM3JqYTDR2sr
 PNY2qS9g8jZ5AkyURyU7s5FeHytuA8Qd/pJhqXaCFGQWiel6O2DR33bBjXww6HGkQ+WxWTo4ucL
 Fw0sAxJZyaETE+CFXpcjIrtDpwelnpBxtr2B90KZs4joHTNuCJcFaUgPDdrEZFBP8jr6XjzubjE
 1rp2/O83LtcxvZw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_070157_745304_56A797BC 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 46765a2e4c4d1573757ff842f208834216e582cb..a9e51fd94aadc6add70f883bfcea0c9fa91f0c4b 100644
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
index ccc6cb99868b842ac0d295f9ec28470303e60788..be794a12362020f42b3cf5bd291b4a1625543b5f 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1725,7 +1725,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
@@ -1747,7 +1747,7 @@ static int pispbe_probe(struct platform_device *pdev)
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
 pm_runtime_suspend_err:
-	pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_put(pispbe->dev);
 pm_runtime_disable_err:
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
@@ -1761,7 +1761,6 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
 }

-- 
2.49.0


