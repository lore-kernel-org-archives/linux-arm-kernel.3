Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46263CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xe42vBQMCuhgRuQ2UM2O+6uyWRhcGpGXk0bD6Ud0svk=; b=zrh1QBs+Gd0WFs
	a/Brgh0t4UCQeh60AGjCeLB9s5b4zsI4w+bXhtZzswfozXCeEdb4Eg68AiG2R1200DaqffNP82/jP
	VG2TWKsRWlXRrKd2MoU2NARl0aZw4lsPq9mzgfeH0l1BbWI7qs8LAxOoZHpekMf/S3OJIdB8DHZ1D
	z1F1YhohDOYkp6kenzJ5laCev9Iy5r4iykCmHcxsfTb2o9C/nI3cXBgWDICfIwZ+qSlDQ16nbpSvB
	HjD5vbqebm7j01LB9VTSnk3GldosKnaMALlN81ysyoUpUtkZg3hRy+RqQVr+llW3i3o7VMREmzH+6
	p0L4AxHNcTPBd+rAc1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBGV-0000000AJc0-0YU8;
	Sun, 07 Sep 2025 09:00:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBDi-0000000AIdH-2Yv0;
	Sun, 07 Sep 2025 08:58:00 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:84a2:d86d:fcf7:24b4:e467])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B734E156F;
	Sun,  7 Sep 2025 10:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757235402;
	bh=m/UHy/ZLrHUE5XV08ED24MSjRUavmbTkg1b809+RU8k=;
	h=From:Subject:Date:To:Cc:From;
	b=T19QGUw7UlW8ym1Uk9jeflpbJ0wV7oLmLHJUIzjZRlPsvJzRSrXVRownXT4OLqJKL
	 5VKcb90+Iz7cJEizdLWAYG7H2VzBJJnUIQeggBj8OEFS5SoSTYfidFIQjGjhVZMDHF
	 g5haGaLtnYQlnfpMNzY8ptJ+nDkhB9/nlRa+qhMg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
Date: Sun, 07 Sep 2025 14:26:20 +0530
Message-Id: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRIvWgC/3WMMQ4CIRBFr7KZWgygyGrlPcwWyIwyhaCwIZoNd
 xe3t3z/570FCmWmAqdhgUyVC6fYQW8G8MHFOwnGzqClNnLUVlQf+CWQyuz6uTsiKTpYYyxCd56
 Zbvxee5epc+Ayp/xZ81X91n+lqoQURhrtJI7K7/WZkVxJ8Zpcxq1PD5haa1/q7yECsQAAAA==
X-Change-ID: 20250827-vchiq-destage-39de1e67557d
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4287;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=m/UHy/ZLrHUE5XV08ED24MSjRUavmbTkg1b809+RU8k=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBovUkFefTa9sxVPoan3sf14F8HxeMoyHhT0YFvN
 ZNF5857Q7CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaL1JBQAKCRBD3pH5JJpx
 RSPeEACPrBHdgfZT6tFgQOYwtqOzPQREVps+92zZIoOJ5pvGZsE+8wS9apRuYO8XIZEiht51P0s
 hrBKXuCekn7r+x/KU2Fuawuozr2aGCRbMPa74OxPl1ZdUr0IK7nWRPdy4x4hbHPMtgga3eCUq7F
 YJBHpg0TFd0blqFj1FkCt1pjQXN7Ub0gTZsEw/HkJa38L8tDgE2XkekBSfOnpPN9zn+BYZpMViu
 Z/PQ7bGEQMbMZBGlK6rC4g2RJgsJ+gAocqqhcAlzjXkixWYa1ouGZUP3qM2uMxSaFjdXl7jngOT
 1UxDsAbwri7V25/MRKw6W8vviM58qcwfPJ2a7/9tDFDVmrY9XCXUaaqMjj181H5VB95wsb1UggE
 nYuzdtoE63DrVBe3kVbcr37bHsP38NwGyqoZLQS2yW0RKfArRFcJkf/UhHuwJJ/fYuBdzdyoisC
 xMywOqdw1mGmzReqRUTk697u4AwhW+F3qQB/b7T2gjfp604EUA8Mj6LWawkKvMlPEETPIDflHMX
 os4F96CvdxVMNz0F+MA3Rmeu3kWnhkrXMYmMA57Bi8WYLoGtebPRiJJlJp3Hh6cx5iQl62rMnAm
 CvRwxkadfqTFrwZ2DUZR0F6Zk5U8uE44znnHT9/gdkRy89PSWF1H9S248eV2u3HrTRclZxVko3o
 zJKf4eV9h/AVoCg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_015759_090270_E83A83D0 
X-CRM114-Status: GOOD (  11.00  )
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

Hi,

The goal of this series is to begin the destaging and upstreaming
process for various Raspberry Pi peripherals that currently interact
with the firmware using the VCHIQ interface present in the staging tree.

While destaging the interface to drivers/platform/raspberrypi, also move
the VCHIQ memory abstraction layer (MMAL) driver. Secondly, drop the
bcm2835-camera driver, as the bcm2835-unicam driver using V4L2 framework
is the recommended way to capture from CSI sensors on this platform.

The bcm2835-audio driver is left as-is in the staging tree, as I am not
an expert on ALSA. Volunteers are welcome :)

In (a) subsequent series, I will upstream the following components that
use VCHIQ interface:
- vc-sm-cma driver
- bcm2835-isp driver

Thanks,
	Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Destage to drivers/platform/raspberrypi instead
- Move BCM_VIDECORE menuconfig definition to the new directory's Kconfig
  along with BCM2835_VCHIQ and VCHIQ_CDEV
- Link to v1: https://lore.kernel.org/r/20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com

---
Jai Luthra (4):
      staging: vc04_services: Cleanup VCHIQ TODO entries
      platform/broadcom: Destage VCHIQ interface
      media: staging: Drop bcm2835-camera driver
      platform/broadcom: Destage VCHIQ MMAL driver

Umang Jain (1):
      include: linux: Destage VCHIQ interface headers

 MAINTAINERS                                        |    2 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/raspberrypi/Kconfig               |   52 +
 drivers/platform/raspberrypi/Makefile              |   15 +
 .../raspberrypi/vchiq-interface}/TESTING           |    0
 drivers/platform/raspberrypi/vchiq-interface/TODO  |    4 +
 .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-
 .../raspberrypi/vchiq-interface}/vchiq_bus.c       |    4 +-
 .../raspberrypi/vchiq-interface}/vchiq_core.c      |    4 +-
 .../raspberrypi/vchiq-interface}/vchiq_debugfs.c   |    6 +-
 .../raspberrypi/vchiq-interface}/vchiq_dev.c       |    7 +-
 .../raspberrypi/vchiq-interface}/vchiq_ioctl.h     |    3 +-
 .../raspberrypi}/vchiq-mmal/Kconfig                |    0
 .../raspberrypi}/vchiq-mmal/Makefile               |    0
 .../raspberrypi}/vchiq-mmal/mmal-common.h          |    0
 .../raspberrypi}/vchiq-mmal/mmal-encodings.h       |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-common.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-format.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-port.h        |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg.h             |    0
 .../raspberrypi}/vchiq-mmal/mmal-parameters.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-vchiq.c           |    5 +-
 .../raspberrypi}/vchiq-mmal/mmal-vchiq.h           |    0
 drivers/staging/vc04_services/Kconfig              |   49 -
 drivers/staging/vc04_services/Makefile             |   14 -
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c    |    5 +-
 .../staging/vc04_services/bcm2835-audio/bcm2835.c  |    3 +-
 .../staging/vc04_services/bcm2835-audio/bcm2835.h  |    3 +-
 .../staging/vc04_services/bcm2835-camera/Kconfig   |   13 -
 .../staging/vc04_services/bcm2835-camera/Makefile  |    6 -
 drivers/staging/vc04_services/bcm2835-camera/TODO  |   17 -
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 2011 --------------------
 .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  142 --
 .../vc04_services/bcm2835-camera/controls.c        | 1399 --------------
 drivers/staging/vc04_services/interface/TODO       |   28 -
 .../include => include}/linux/raspberrypi/vchiq.h  |    0
 .../linux/raspberrypi}/vchiq_arm.h                 |    0
 .../linux/raspberrypi}/vchiq_bus.h                 |    0
 .../linux/raspberrypi}/vchiq_cfg.h                 |    0
 .../linux/raspberrypi}/vchiq_core.h                |    2 +-
 .../linux/raspberrypi}/vchiq_debugfs.h             |    0
 42 files changed, 103 insertions(+), 3703 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250827-vchiq-destage-39de1e67557d

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


