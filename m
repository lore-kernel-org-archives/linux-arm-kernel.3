Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8ACCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8rAHLd4k7CMkVwThCqC97mecja0jpqRfR3JTN6TwTU=; b=RaDKwyB8Ks6pB0
	Qh8yC351I8id544c4VD0MTHUI1gIT51ST1p+v64jdvXJsxcxO/1Pp972CmMyQt4KEkVSVyaeu4nw5
	tVzNJQQdKSnURT4FxVmiuLRBwuIpwobrCJome/1g8gIhMhva7tT1EQ0Cez8r3Pr6bXGujFFA6T/do
	iHZuqJ+bJjx/r5y3uGieeIvKNpshK8JY1DbaxLRoljoYD3WPBZGZjf5QEBMKN2uFnpFPRiFaAlOwt
	ut11YO2doRHlpzkevr8s+eu8aJ/ZlakqFQsZEAD55sX9wDj+zViSHO58wEEj32U90S/wUlRGr06fL
	S89Ftee7d4Pa1w2MHDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3SR-00000000lmY-3ZXn;
	Wed, 29 Oct 2025 10:31:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3SL-00000000lkF-0rhL;
	Wed, 29 Oct 2025 10:31:10 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E57B911DD;
	Wed, 29 Oct 2025 11:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761733752;
	bh=zWwTB1bRbhn07J7+tC2NHNnJhjR0kZ1TVfVS15isUIQ=;
	h=From:Subject:Date:To:Cc:From;
	b=iAW0kRtk+Inveiq3hawn16XE7/i5hHXHbL7hdWMCUoMGSW3+EWDDabS/ns8G8hD5x
	 CQ3Mmf11SS5wWB9EYoDArLN5TQSAMT6Jtp66c0dTVJIlpVo27I4Dh0fspnd3mNNjcJ
	 8nmcPkc5A3T9EAm5Tgjl3IEJEOjyk1D2tIlFvRnA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/7] staging: Destage VCHIQ interface and MMAL
Date: Wed, 29 Oct 2025 16:00:04 +0530
Message-Id: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzsAWkC/3XMsQ7CIBDG8VdpmMUALYU6+R7GAbnT3mCp0BBN0
 3eXdnFQx/9dvt/MEkbCxA7VzCJmShSGEvWuYr53ww05QWmmhNLCKsOz7+nBAdPkyrPuACW2Rms
 DrGzGiFd6bt7pXLqnNIX42vgs1+s/KUsuuBZaOQFW+kYdCdClMFyCi7D34c5WMKsP0okvRBWkt
 bYpEHhn7A9kWZY36VYT+vYAAAA=
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7528;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=zWwTB1bRbhn07J7+tC2NHNnJhjR0kZ1TVfVS15isUIQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAezYJJ7vcBBXayN5I77b8KgFd5Ud0BnyGvfQr
 PCTl17L6bmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQHs2AAKCRBD3pH5JJpx
 RXVrD/9zV9yvNJDKOHDfoUhNEM6Enw+HOaxOxou+spvIrqMVbVIS5TAzNxBFftBW7SXFCTteuB0
 m389+B097UHcRNRTfyKJO/5ARiZvU0/lQn6FyQuiuWHOh9F9jMoQuvHvK6F3mtkaWF7KOytDtEh
 knooL78StOFYoOs3SU685rgj/QP6mo0xLhw3NTepBmEOM++hbGGtPU5Z2jGg4WDpoAdFD2KFKew
 0Gwl/9O8Uwix0V0r79/7zesDIRPy47ypxmwV7671MMrANMCBQ8z/FBr796ZmiZHMngipkbUDFVK
 OEGNA/wTJJy2Qv/7h13TXlmasS9BoXbwk47SImkI3LSm7VtCN1pGjarQVaYVUhNpuX2/HWaBPMe
 l/tNUelevk6jc5m9qY/hce1DvtQUea2lNZyJ7rBIKYulHOwuCTKixPPmRedKaO7rWfpg+99aqdQ
 UvTf8zpTddnd5qsQ8qjpFTAUGCI+PJIq/C/lgVJC8RA5cJtACs6LHZdxAOS9wPuSQDeq0neCOLI
 OBULVH/0PZeSC9FtrWSAwkXMUMve9VBYtXb4ym8FlKQZsPyqoZymUC+IIDGUGTAzTXZUxvKqtv+
 zDde3uciBJaSLDa2Smr3bw0V+WgVUuXKr7DtnHQM/+r0sIPtGT6EPMemcw6Sxx6ZLSQnI06pUGR
 FXAj681stkRVrrQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033105_685185_5D204F42 
X-CRM114-Status: GOOD (  15.49  )
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

In (a) subsequent series, I will upstream the following components:
- working driver for the OV5647 sensor in raspberry pi camera v1 module
- vc-sm-cma driver
- bcm2835-isp driver

Thanks,
	Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Reorder patches, drop bcm2835-camera first before destaging interface
- Add a new patch to drop usage of bcm2835-camera from vchiq_arm
- Add a new patch improving inline documentation (picked from
  https://lore.kernel.org/linux-staging/20250509221152.13564-2-wahrenst@gmx.net/)
- Update MAINTAINERS file to cover all drivers starting with vchiq-*
  from the first commit, rather than changing it twice
- Replace s/broadcom/raspberrypi in commit title and messages
- Link to v2: https://lore.kernel.org/r/20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com

Changes in v2:
- Destage to drivers/platform/raspberrypi instead
- Move BCM_VIDECORE menuconfig definition to the new directory's Kconfig
  along with BCM2835_VCHIQ and VCHIQ_CDEV
- Link to v1: https://lore.kernel.org/r/20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com

---
Jai Luthra (6):
      staging: vc04_services: Drop bcm2835-camera driver
      staging: vchiq_arm: Remove bcm2835_camera from vchiq
      include: linux: Destage VCHIQ interface headers
      staging: vc04_services: Cleanup VCHIQ TODO entries
      platform/raspberrypi: Destage VCHIQ interface
      platform/raspberrypi: Destage VCHIQ MMAL driver

Phil Elwell (1):
      staging: vchiq_arm: Improve inline documentation

 MAINTAINERS                                                                                                 |    2 +
 drivers/platform/Kconfig                                                                                    |    2 +
 drivers/platform/Makefile                                                                                   |    1 +
 drivers/platform/raspberrypi/Kconfig                                                                        |   52 ++
 drivers/platform/raspberrypi/Makefile                                                                       |   15 +
 drivers/{staging/vc04_services/interface => platform/raspberrypi/vchiq-interface}/TESTING                   |    0
 drivers/platform/raspberrypi/vchiq-interface/TODO                                                           |    4 +
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_arm.c     |   20 +-
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_bus.c     |    4 +-
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_core.c    |    4 +-
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_debugfs.c |    6 +-
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_dev.c     |    7 +-
 drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_ioctl.h   |    3 +-
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Kconfig                                  |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Makefile                                 |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-common.h                            |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-encodings.h                         |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-common.h                        |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-format.h                        |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-port.h                          |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg.h                               |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-parameters.h                        |    0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.c                             |    5 +-
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.h                             |    0
 drivers/staging/vc04_services/Kconfig                                                                       |   49 --
 drivers/staging/vc04_services/Makefile                                                                      |   14 -
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c                                                 |    5 +-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c                                                       |    3 +-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h                                                       |    3 +-
 drivers/staging/vc04_services/bcm2835-camera/Kconfig                                                        |   13 -
 drivers/staging/vc04_services/bcm2835-camera/Makefile                                                       |    6 -
 drivers/staging/vc04_services/bcm2835-camera/TODO                                                           |   17 -
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c                                               | 2011 ---------------------------------------------------------------
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h                                               |  142 -----
 drivers/staging/vc04_services/bcm2835-camera/controls.c                                                     | 1399 --------------------------------------------
 drivers/staging/vc04_services/interface/TODO                                                                |   28 -
 {drivers/staging/vc04_services/include => include}/linux/raspberrypi/vchiq.h                                |    0
 {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_arm.h                |    0
 {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_bus.h                |    0
 {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_cfg.h                |    0
 {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_core.h               |   58 +-
 {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_debugfs.h            |    0
 42 files changed, 163 insertions(+), 3710 deletions(-)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20250827-vchiq-destage-39de1e67557d

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


