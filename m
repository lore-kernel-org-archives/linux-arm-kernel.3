Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B873BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HDHYXoTbrX8GXUMHXZJxssVKsM/Fz4OTbb2GfgUzg2A=; b=a8HjLgz1hTdtKw
	5eYKTDxG2G7SBNY/TdQ8ZxLlcZyM8RIDCpWWyvxrDJZXROdNEVdifjQ09WUpE1kfegoa9iRm1JCGO
	U0mmmD6aSGw00oliphuSGetDMxDrDqfXmTrHrxRMdGPANHWglLdC0bOsvkt6/bVC9kNcJ09rwpTLj
	vA5CShxoBX9hUmPmlHOPHIfiKe6nBFYgaIqC+uQeZf0kgc8zhrXDVcZ31KuOzAWan8DoYbFeHA3St
	z6vksLiMYIp2M50Z5S8Jzqy++A3MyF3l09UvuBCyvGFX2rY8MZ1xBaaSXvUt2bPw/NS+yfp0ZN8T5
	F/r+7WWLNdCFhx9q1xOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEBx-00000007m63-28Um;
	Wed, 12 Feb 2025 14:58:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAW-00000007lbH-0uZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:53 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34DD3778;
	Wed, 12 Feb 2025 15:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372127;
	bh=IARuWv5q41i1jF/n5oRcxWGvOepjwqWn366nRpA9NGc=;
	h=From:Subject:Date:To:Cc:From;
	b=VauEEstVlYcHP7Q92P3kEmmYqkQI9l7BlPAIpd51or/Tm80bjYNLSC5ft8V1gykUV
	 oIx2QlUKORFVlaGEcBHF1rzNHBfz0M/Y6I+xRZhUCf57ODwp19qiqAT4kcCTfS75u5
	 RTkLmXhUoj8QXuM2Ktxo0NNvEWVBXcKkM6jgKw8w=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/11] drm: Add new pixel formats for Xilinx Zynqmp
Date: Wed, 12 Feb 2025 16:56:04 +0200
Message-Id: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIW2rGcC/23MQQ6CMBCF4auQrq3pTCmoK+9hXJS2yCRCTUsaD
 OHuFowbdfm/5H0ziy6Qi+xUzCy4RJH8kEPuCmY6PdwcJ5ubocASAAWf6E7DxFsfej1G3tZwFFA
 hHKRk+fQIrqVpAy/X3B3F0Yfn5idY1zeFovymEnDBRdOiUVDWtoEzWaejHxqvg90b37NVTPhRl
 ABQPwpmBSohsTa6Uqj/KMuyvAAv0o3Y+QAAAA==
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IARuWv5q41i1jF/n5oRcxWGvOepjwqWn366nRpA9NGc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaije6yZUs92MxGzGxpJE/HKXYX1MER8neox
 6GlUInFcZKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2ogAKCRD6PaqMvJYe
 9b/iD/4h3m93HpFzPpZomvCMncvu6lbCfnKjdFy79Fano2vP0xkES2L9w0Efy5ETWj3m/0jmBbq
 kUfII4XduBb6npzaGG44Rq5diw69x/DywDy2+s/ugn0bnWZLtFxyMrUCDxXGsu5wsBwKhbJKpzA
 1hoiloaahOzXVSIXn8xyGnv1yVvRXq3gkYRF36OtgOFGXCDzYqFzgk5w6wr7QXlh5e+rZZAE3+U
 M922iBlNCfGKmPo0OLZ+x2I5WXwo/dpCVij5UeWPvibElUc2rHusAbSo+42asfHULWm0gaNyC/8
 xrFYujraWjmE1qT1F9TiZWElUBnSlzaYgfkZ7CVbGD8tuVd/FEiK8EQJB6LgCb1Sadph6AUtYBp
 QsBcJOdniHo6U1C8IzDjMm70ehw+u4yBLWdpVlnZw46ypNLZNRQo4FUrkUrAK1U1tRlo9l/pRM5
 BSAJcC8RikZfsSDmH6Roknzz9quTR4TA/85bV/8ZkQK550QMVInchFSWPVGhqTyW9K5V7N5iMwV
 PrI53sp+E0i8ztsdryHlXRzIOeVHIWvZa9R2Rbr8AMKKrJMl6Aui0t9XLDIKXCUODJ6uvECoQyl
 cfpg03pJglMmTdvTQ6BoWul39Yg9EcL3zP5cnhbHr0XmxZgfu/BdeYR54uRPnQ5LBGw4yzwiUig
 VVRJ3DwGs25ZEqw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065652_389384_95188F02 
X-CRM114-Status: GOOD (  25.09  )
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

Add new DRM pixel formats and add support for those in the Xilinx zynqmp
display driver.

All other formats except XVUY2101010 are already supported in upstream
gstreamer, but gstreamer's kmssink does not have the support yet, as it
obviously cannot support the formats without kernel having the formats.

Xilinx has support for these formats in their BSP kernel, and Xilinx has
a branch here, adding the support to gstreamer kmssink:

https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5

New formats added:

DRM_FORMAT_Y8
- 8-bit Y-only
- fourcc: "GREY"
- gstreamer: GRAY8

DRM_FORMAT_Y10_P32
- 10-bit Y-only, three pixels packed into 32-bits
- fourcc: "YPA4"
- gstreamer: GRAY10_LE32

DRM_FORMAT_XV15
- Like NV12, but with 10-bit components
- fourcc: "XV15"
- gstreamer: NV12_10LE32

DRM_FORMAT_XV20
- Like NV16, but with 10-bit components
- fourcc: "XV20"
- gstreamer: NV16_10LE32

DRM_FORMAT_X403
- 10-bit planar 4:4:4, with three samples packed into 32-bits
- fourcc: "X403"
- gstreamer: Y444_10LE32

XVUY2101010
- 10-bit 4:4:4, one pixel in 32 bits
- fourcc: "XY30"

Some notes:

I know the 8-bit greyscale format has been discussed before, and the
guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
would argue that adding DRM_FORMAT_Y8 makes sense, as:

1) We can mark it as 'is_yuv' in the drm_format_info, and this can help
   the drivers handle e.g. full/limited range. Probably some hardware
   handles grayscale as a value used for all RGB components, in which case
   R8 makes sense, but at least for Xilinx hardware it is YUV, just
   Y-only, not RGB.

2) We can have the same fourcc as in v4l2. While not strictly necessary,
   it's a constant source of confusion when the fourccs differ.

3) It (possibly) makes more sense for the user to use Y8/GREY format
   instead of R8, as, in my experience, the documentation usually refers
   to gray(scale) format or Y-only format.

As we add new Y-only formats, it makes sense to have similar terms, so
we need to adjust the Y10_P32 format name accordingly.

I have made some adjustments to the formats compared to the Xilinx's
branch. E.g. The DRM_FORMAT_Y10_P32 format in Xilinx's kmssink uses
fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
a packed format, three 10-bit pixels in a 32-bit container, and I think
Y10 means a 10-bit pixel in a 16-bit container.

Generally speaking, if someone has good ideas for the format define
names or fourccs, speak up, as it's not easy to invent good names =).
That said, keeping them the same as in the Xilinx trees will, of course,
be slightly easier for the users of Xilinx platforms.

I made WIP additions to modetest to support most of these formats,
partially based on Xilinx's code:

https://github.com/tomba/libdrm.git xilinx

A few thoughts about that:

modetest uses bo_create_dumb(), and as highlighted in recent discussions
in the kernel list [1], dumb buffers are only for RGB formats. They may
work for non-RGB formats, but that's platform specific. None of the
formats I add here are RGB formats. Do we want to go this way with
modetest?

I also feel that the current structure of modetest is not well suited to
more complicated formats. Both the buffer allocation is a bit more
difficult (see "Add virtual_width and pixels_per_container"), and the
drawing is complicated (see, e.g., "Add support for DRM_FORMAT_XV15 &
DRM_FORMAT_XV20").

I have recently added support for these Xilinx formats to both kms++ [2] and
pykms/pixutils [3][4] (WIP), and it's not been easy... But I have to say I
think I like the template based version in kms++. That won't work in
modetest, of course, but a non-templated version might be implementable,
but probably much slower.

In any case, I slighly feel it's not worth merging the modetest patches
I have for these formats: they complicate the code quite a bit, break
the RGB-only rule, and I'm not sure if there really are (m)any users. If
we want to add support to modetest, I think a bigger rewrite of the test
pattern code might be in order.

[1] https://lore.kernel.org/all/20250109150310.219442-26-tzimmermann%40suse.de/
[2] git@github.com:tomba/kmsxx.git xilinx
[3] git@github.com:tomba/pykms.git xilinx
[4] git@github.com:tomba/pixutils.git xilinx

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v3:
- Drop "drm: xlnx: zynqmp: Fix max dma segment size". It is already
  pushed.
- Add XVUY2101010 format.
- Rename DRM_FORMAT_Y10_LE32 to DRM_FORMAT_Y10_P32.
- Link to v2: https://lore.kernel.org/r/20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com

Changes in v2:
- I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
  Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
  relevance here, P means packed, A means 10, 4 means "in 4 bytes".
- Added tags to "Fix max dma segment size" patch
- Updated description for "Add warning for bad bpp"
- Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com

---
Tomi Valkeinen (11):
      drm/fourcc: Add warning for bad bpp
      drm/fourcc: Add DRM_FORMAT_XV15/XV20
      drm/fourcc: Add DRM_FORMAT_Y8
      drm/fourcc: Add DRM_FORMAT_Y10_P32
      drm/fourcc: Add DRM_FORMAT_X403
      drm/fourcc: Add DRM_FORMAT_XVUY2101010
      drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
      drm: xlnx: zynqmp: Add support for XV15 & XV20
      drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
      drm: xlnx: zynqmp: Add support for X403
      drm: xlnx: zynqmp: Add support for XVUY2101010

 drivers/gpu/drm/drm_fourcc.c       | 25 ++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 54 +++++++++++++++++++++++++++++++++++---
 include/uapi/drm/drm_fourcc.h      | 21 +++++++++++++++
 3 files changed, 96 insertions(+), 4 deletions(-)
---
base-commit: f7d07bcd0651b90dda8a6962057eb5fb1807a089
change-id: 20241120-xilinx-formats-f71901621833

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


