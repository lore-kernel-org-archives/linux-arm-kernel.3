Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3755FCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ieO/EupsjpYCvx/Gj3ca48P2wH3mZNpMcBklH6EgXjU=; b=q9J5pO0YEQt2/N
	O10kTcqY5ZDtbvVBWWY7EKD+K92BxgSCDzKZkn8N9sDxwm4we+zQte5zlzllvWRpINliSXA1ZvnX0
	STq0i7sWbbDozCuTb3eVCM3jEwOsDRUPJXNeC0L+YfoZa+dEvr1T0BTpBDf0eiw/w2aJc2YS+01Og
	YXhJHQc1e6EgD0viK/BzLdzwrv1Gvv1oprUeAIj2x+s2bneOwTOEcXlefr5SMw58PDLNLORyCM91F
	C4G/ehtSQGrVVaVDNny99qgjHjhyOGiwYbnGNZLyZpNfI7MtBuUI0qc5sW9n6GnfjCyPBi727iSte
	WAQnMjVyd3UlISKHu0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9dB-0000000EG7r-2aJ4;
	Wed, 27 Aug 2025 06:27:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9aU-0000000EFjb-1XjP;
	Wed, 27 Aug 2025 06:24:51 +0000
Received: from mail.ideasonboard.com (unknown [223.190.80.94])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318F2300E;
	Wed, 27 Aug 2025 08:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756275820;
	bh=EtUNz7kErHkJEDA3qLyWBB/J5HXF/UDPj4Bc0vPU/vU=;
	h=From:Subject:Date:To:Cc:From;
	b=Y9hRrN/AKtDl5FZ5vwsQ+OV1MC9UrM3yz52y3qSRYCLtU9MFf0cCSbUqfzbXYBOsy
	 dZtMdfpL2ko0sm+XS8YOh5wBIN2slpZichZ04NptBDQhPFLhg8unX7ryRSf9IF5/ve
	 0U0AB1/n4BJSPIMzrERc9dtflTuePoRgRO7Nokkc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/5] staging: Destage VCHIQ interface and MMAL
Date: Wed, 27 Aug 2025 11:54:07 +0530
Message-Id: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIekrmgC/x2MQQqAIBAAvxJ7TlDDrL4SHUS33IuVhgTi35OOw
 zBTIGEkTLB0BSJmSnSGBqLvwHoTDmTkGoPkUvFJapatp5s5TI9pcpgdChy1UtpBa66IO73/b91
 q/QBX3Sv+XwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3934;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=EtUNz7kErHkJEDA3qLyWBB/J5HXF/UDPj4Bc0vPU/vU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBorqSWMz/LstFox1XD8YJZ2iNfr3r6C2FjT8GwI
 3WLJG3SI/6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaK6klgAKCRBD3pH5JJpx
 RWpJD/9bobUpaIVvLFGyCTlDcB6FLJPOluThmgC/UewvxRBlhJ1Mq3MF0GT6OVS4r4ORGrpY45/
 2EbxmdPy7t4+73z3KzAaqK8Wq0s+tmEfJ200RO9rZx+P7rqXrrqhH8DX0x+NjDXLsm6r6Zo+q5o
 6SBai6Rb0EnLMuJ1q1Co1IazZwauc4DWOqlJZHWdu+GmczGWSQndYdaerqJ0rTVAqr29Ng+YoJs
 8y2nL65v2aguMoEDh0uOFQva2EWjLXuAElWOfpeEf+0wd7BGgosVM9ZinmLfEZQ+RhNAFRV3Exv
 NvkoKqIMAHKb2pEPjNFPd4vQdPAiQ2od/N6KfL6EsVJp3REdWGsPweYdNKVgV/Tb8jsLPQ0eD3t
 YntewlTgeNe+qIh9gAGGzpGzKDUTcyhvOQBvWijLGJ5OGn5AldhQINGqZhQpJjUEyEBxLEzih/r
 h82tvYrF7jWDe+FebM40hhYQY1+kKIkJ9+LU3FeyuOUsYgFLaAVTdEfqjQOpQ2kCu1ZjRBiSern
 4O8p4xoCNxoSpI0PNL+4vgsxnUqddtCW+0L9+Hu6+az/7udmfjWPm8rLT1panFsGXrpjRICBX+z
 I5TeyQxS9kebMzK/2z+tYIDyS3FmEPTYQPS+gq+AxQMvqHodwTw3iSnsFNJkhfoBbvE0HtE3Z6T
 VF92mV36iJv3t2Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_232450_558433_AF846237 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

While destaging the interface to drivers/platform/broadcom, also move
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
Jai Luthra (4):
      staging: vc04_services: Cleanup formatting TODO entry
      platform/broadcom: Destage VCHIQ interface
      media: staging: Drop bcm2835-camera driver
      platform/broadcom: Destage VCHIQ MMAL driver

Umang Jain (1):
      include: linux: Destage VCHIQ interface headers

 MAINTAINERS                                        |    2 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/broadcom/Kconfig                  |   39 +
 drivers/platform/broadcom/Makefile                 |   15 +
 .../broadcom/vchiq-interface}/TESTING              |    0
 .../broadcom/vchiq-interface}/TODO                 |    6 -
 .../broadcom/vchiq-interface}/vchiq_arm.c          |    9 +-
 .../broadcom/vchiq-interface}/vchiq_bus.c          |    4 +-
 .../broadcom/vchiq-interface}/vchiq_core.c         |    4 +-
 .../broadcom/vchiq-interface}/vchiq_debugfs.c      |    6 +-
 .../broadcom/vchiq-interface}/vchiq_dev.c          |    7 +-
 .../broadcom/vchiq-interface}/vchiq_ioctl.h        |    3 +-
 .../broadcom}/vchiq-mmal/Kconfig                   |    0
 .../broadcom}/vchiq-mmal/Makefile                  |    0
 .../broadcom}/vchiq-mmal/mmal-common.h             |    0
 .../broadcom}/vchiq-mmal/mmal-encodings.h          |    0
 .../broadcom}/vchiq-mmal/mmal-msg-common.h         |    0
 .../broadcom}/vchiq-mmal/mmal-msg-format.h         |    0
 .../broadcom}/vchiq-mmal/mmal-msg-port.h           |    0
 .../broadcom}/vchiq-mmal/mmal-msg.h                |    0
 .../broadcom}/vchiq-mmal/mmal-parameters.h         |    0
 .../broadcom}/vchiq-mmal/mmal-vchiq.c              |    5 +-
 .../broadcom}/vchiq-mmal/mmal-vchiq.h              |    0
 drivers/staging/vc04_services/Kconfig              |   39 -
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
 .../raspberrypi => include/linux/vchiq}/vchiq.h    |    0
 .../vchiq_arm => include/linux/vchiq}/vchiq_arm.h  |    0
 .../vchiq_arm => include/linux/vchiq}/vchiq_bus.h  |    0
 .../vchiq_arm => include/linux/vchiq}/vchiq_cfg.h  |    0
 .../vchiq_arm => include/linux/vchiq}/vchiq_core.h |    2 +-
 .../linux/vchiq}/vchiq_debugfs.h                   |    0
 41 files changed, 86 insertions(+), 3671 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250827-vchiq-destage-39de1e67557d

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


