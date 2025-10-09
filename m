Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EB9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ur94X0sKlPkrhA4/pxn2sYt+nq/eXa1vX1hEsk2e8ug=; b=lDBfhlyRJyYEPUlyqLVg0GLxqT
	jWxhXbVPQiaRFFHm2tEbKUF/wd0R5JkOKbC7nWjAQOYvKs4F5eK35aYiBAyaE001Pt9XOMxZv0PGP
	kWlOBhs6TlX22KbHBMhBKHYHDKAbDo525P1gHdHpVT31Dca/DGkPPj0cYrQfJiEFC7WkYY/kDOOWD
	xt0gGDYUlEy0OhBiZ1S5tePDIJCOHfrT3J798+YZDNWkffA0i93bmrglunCCVtCI3pdASRmKIZd6k
	64kfn2UKAvhw1R3pk4N1yvdLTAV00WtA5cUgai69HvckNQQwLIIhOtshNhzBDuScw+YQeiHLvLhPN
	qAf1+9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sy6-00000006YX4-2Pki;
	Thu, 09 Oct 2025 15:54:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sy3-00000006YUz-3vJM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025252; x=1791561252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zz+Uj157nUwkCRjTCQp7hgcM6Q5j7SCBgxkxYDjw0r4=;
  b=tczsJavBleMKBSLDTkXGqW17CD7TZnQNw4GUj+C1Yy6xw2TiI4QnQoaE
   w18eQ93F2vI8DZpc/248aATM0F//QHUXU0OmAZeEVizQ8JNj49pK2KReX
   jD67hP0FJPxoJIvCh6giGI2MgxDgJ9kKSG71JSY49yoYtOG2N8gK+Zj73
   QNzkFgnHNg2N3cb6fYmgsZyP6DHBFamRQMITaR3/wqheb3yVV+jh3m8LW
   BDeai4xgK2FwUJ7oh07ytj6E5PLKSy2PFFsC0MdYJAtckvn0AWWthcQic
   zwRww5goq2CmdKP2xypAbuQrzbco2R2iWfEuDsBCCqRKA7wkJ07ZQvEPN
   Q==;
X-CSE-ConnectionGUID: lBmy0Ek5QtOpGZTOa4YF8Q==
X-CSE-MsgGUID: VHYNVfB/TiC0i/p9yG12qQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:10 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:19 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:11 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 00/18] media: microchip-isc: Color correction and histogram stats
Date: Thu, 9 Oct 2025 21:22:33 +0530
Message-ID: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085411_982038_3B9C6650 
X-CRM114-Status: GOOD (  10.88  )
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

This patch series has a set of enhancements to the Microchip Image Sensor
Controller driver. The objective is to expand its image processing
capabilities and to improve the colors.

This series also introduces a new stats driver that exposes the histogram
data to userspace via v4l2 controls. This allows applications such as
libcamera to access real time image statistics for advanced image
processing like automatic exposure, white balance adjustments etc.

Balakrishnan Sambath (11):
  media: microchip-isc: Enable GDC and CBC module flags for RGB formats
  media: microchip-isc: Improve histogram calculation with outlier
    rejection
  media: microchip-isc: Use channel averages for Grey World AWB
  media: microchip-isc: Add range based black level correction
  media: platform: microchip: Extend gamma table and control range
  media: platform: microchip: Add new histogram submodule
  media: microchip-isc: Register and unregister statistics device
  media: microchip-isc: Always enable histogram for all RAW formats
  media: microchip-isc: fix histogram state initialization order
  media: microchip-isc: decouple histogram cycling from AWB mode
  media: microchip-isc: enable userspace histogram statistics export

Balamanikandan Gunasundar (7):
  media: platform: microchip: set maximum resolution for sam9x7
  media: platform: microchip: Include DPC modules flags in pipeline
  media: microchip-isc: expose hue and saturation as v4l2 controls
  media: microchip-isc: Rename CBC to CBHS
  media: microchip-isc: Store histogram data of all channels
  media: videodev2.h, v4l2-ioctl: Add microchip statistics format
  media: microchip-isc: expose color correction registers as v4l2
    controls

 drivers/media/platform/microchip/Kconfig      |   2 +
 drivers/media/platform/microchip/Makefile     |   2 +-
 .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
 .../platform/microchip/microchip-isc-regs.h   |   3 +
 .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
 .../media/platform/microchip/microchip-isc.h  |  44 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         |  73 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/linux/atmel-isc-media.h               |  13 +
 include/uapi/linux/videodev2.h                |   3 +
 11 files changed, 1001 insertions(+), 64 deletions(-)
 create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c

-- 
2.34.1


