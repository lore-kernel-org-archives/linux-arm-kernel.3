Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F1FCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T69VpODlJXAU3bSVams7rzUUt2KCsw+G6blftptzXF0=; b=41MiYbx547jFrS
	MskPYENUzohU0ourzJ0CqmNVf4/MN8bBqK82AVHWsRTFiCLHLLjMQtg7BSV9eM6rJV4xBusChjB34
	WXuTeKyARSk8TaBgElvvd0lhJOHfJevq9V/4CvXEtrsQ051fuKug5uguTdkYZPHdPr7HYMf7fcxfA
	sZ4RyyYdVSO8C1KF4ekIfNsKi19/PFz4E1tFzoaYpgG6E4EQZZ433yPGzlJxtdpLWCSt2GJBoArD2
	ORy0CLTNsTF9rMB1yS7C5cfCgkq7oSc3dVs0hGQu9DhPY4qK5eCZ7PoI6fVpdmDb2DbKhQeNmhD6F
	vlaGliz54ChWRWAqvmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAu-000000033jB-3avg;
	Fri, 16 Oct 2026 13:40:44 +0000
Received: from smtp-190e.mail.infomaniak.ch ([185.125.25.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAo-000000033g3-3q45
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:40:42 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKY2PFmzbrv;
	Fri, 16 Oct 2026 15:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158033;
	bh=T69VpODlJXAU3bSVams7rzUUt2KCsw+G6blftptzXF0=;
	h=From:Subject:Date:To:Cc:From;
	b=Yj6Ih9GfnHv90Pj4bMMklTM/TgmFrp0m4jXeotVV6RsVbQV1H99GQFZO9ljmw/uVB
	 jk4CWxS0UAoAaJ1qWKGerli41/xRmh1GPQG5LeOtQI5JgkLcoFU8gz1U3d+JE84ld4
	 MeHlT+e9LL2yxhoHiIJbdNamcrBZtVMCgjxMBX8VeOkit7EVfHrH9NYO8Q4BfPXB0V
	 zWwH7WRDEEadNZ8U3ig6TSc4XaG/z5TQZE1E+EKBtOP4JVxSc7ICAAhPZE1ZxF8Rb1
	 QYUVzigxNRquIZaTI+92maR3iWtrdV53mfxTqUypa8ezv/j1LP+liOePQmUvNe4rPA
	 qz3PKlVm9704A==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKW0yKczBnm;
	Fri, 16 Oct 2026 15:40:31 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/3] media: support Y8/GREY and Y10 bus/pixel formats for
 Rockchip VICAP and Synopsys CSI2RX
Date: Fri, 16 Oct 2026 15:39:56 +0200
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQiK3RqxQXcRztFFHJaKiId
 29sl2/x/wHKQVihzg4IHEVlnhLsLQN6+WlglC4ZcpM/rLF3jMWIu8PdGiQVjEJ+wbY3RdWRLyv
 nIKVL4F4+v+2z+Vu39s20Xi84zy8rnwOIeAAAAA==
X-Change-ID: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_064039_334374_92BB3108 
X-CRM114-Status: GOOD (  10.25  )
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

RK3588 Jaguar can support up to 4 2-lane cameras (two on the main PCBA,
two exposed on the proprietary mezzanine connector). The only camera
module available for this device is based on the OV9281 greyscale camera
sensor.

The OV9282 driver (which also supports the OV9281) allows two formats:
- MEDIA_BUS_FMT_Y8_1X8
- MEDIA_BUS_FMT_Y10_1X10

but they both aren't listed as supported by the RK3588 CSI2RX controller
and RK3588 VICAP drivers.

Add support for those two bus formats to both drivers.

Capturing a frame with yavta[1] for Y10 only works once
struct v4l2_format_info formats also exposes V4L2_PIX_FMT_Y10, so do
that. I couldn't make gstreamer work with Y10, I'm assuming for the same
reasons explained in this issue[2].

All those patches, suggested by Michael Riesch on IRC. Thanks to his
support I now can capture shitty 720p greyscale pictures \o/

I am not entirely sure whether V4L2_PIX_FMT_Y10 is the appropriate
format as we pick MIPI_CSI2_DT_RAW10 as the CSI2 Data Type, which
according to Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
(very end):
"""
The 'P' variations of the Y10, Y12 and Y14 formats are packed according
to the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI
CSI-2 specification.
"""

so I would rather expect Y10P. After changing Y10 for Y10P in
drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c and
drivers/media/v4l2-core/v4l2-common.c, and patching yavta to support it,
I also get an image. Other drivers seem to also be associating Y10 (and
not Y10P) with the RAW10 format, so I guess that's fine?

[1] https://git.ideasonboard.com/camera/yavta
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/3738

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      media: v4l2-common: add V4L2_PIX_FMT_Y10 to v4l2_format_info
      media: rockchip: rkcif: add support for GREY and Y10 formats
      media: synopsys: csi2rx: add support for Y8 and Y10 bus formats

 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 10 +++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  1 +
 3 files changed, 37 insertions(+)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


