Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C12D3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J4/ttGaRm98zv12VoaFPFO8waJIbzjVITcc+F7Z3btA=; b=CWqR0a30CZCjxA
	6RnG3DhZQJdyPrLoIJ6ZIN49GUo8PRXoDW7lv/9zOavVNN9/ggG7pehCjUDtLjnugFqb7rnkExuRY
	qw/C4HGuBWHSnFaFfbvZYU8vqvqkGNN3exPtuwOpyhVorLOujuCSEwKCaEZJ/oFnVJR9ZVYGqClQS
	nJypyKtE0fNXgNwM29btrvSyX7cSsusLLBJbFqNokXIqNwxMN8nZaCl1hkD4us1Mjpc/YmIX4KFPb
	SKbV87tU0uiFrNQ+dtSB5VPR0WUeQRzoXTg+AponmkPqmdVEzihXkk3Q0QqSbLjg7mWfl3lo/6n+s
	3htdKAV6gk7uoaTALUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iy-0000000GTLF-2dpL;
	Wed, 28 Jan 2026 17:26:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ip-0000000GTFQ-1GHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C01522F;
	Wed, 28 Jan 2026 18:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621123;
	bh=+1hJcXOo2hwC7RfuS9MTTjHuLeugN645NiJr8iWNY5Q=;
	h=From:Subject:Date:To:Cc:From;
	b=FL7jy82qvGoiLejEpfGj0bVcvEJzaK3vt4QAFtBRAQvUJAJ6tJz37U9NLDDfZU7PI
	 TxHEHlLTNWnLLikLHDPBJ/WhTIqsqsmxPL8HGCT53kzeXnzeyR1pna+zayX3qT2E00
	 3OKBXoZJdsc2TJ6HDdjq0NwgkVLB7kOVi96WJpEw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 00/11] drm: Add new pixel formats for Xilinx Zynqmp
Date: Wed, 28 Jan 2026 19:25:25 +0200
Message-Id: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZGemkC/3XQy2rDMBAF0F8JWldlZvSKu+p/lC5kPRpBYwUpG
 Jfgf6+c0hrqeHkH5sC9N1ZDSaGyl8ONlTCmmvLQwvHpwNzJDh+BJ98yIyCJSMCn9JmGicdczvZ
 aeTTYAWrCoxCsPV1KiGm6g2/vLZ9SvebydfdHXK4/FIH8T43IgUMfySmUxvf4mnywNQ99tsU/u
 3xmizjSr6IAUW0UagpqEGSc1YrsjiJWhZA2imhKBx5iQNBdp3YUuSqC9EaRTRFEVgA47Q3tKGp
 VJG0bqaY4I0kLEqgF7Cj6T0EA3Ch6WRdlD0b3Su7uYlaFHihmWTegUkfrY4jugTLP8zdTK7U+V
 wIAAA==
X-Change-ID: 20241120-xilinx-formats-f71901621833
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7666;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+1hJcXOo2hwC7RfuS9MTTjHuLeugN645NiJr8iWNY5Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekaf3WhojLCgHdJ2x+G+WZupFh/cUA+d7wV0F
 h1kUn8GtbuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGnwAKCRD6PaqMvJYe
 9fssD/kByjrdHpaLL3Eewhmk3qATZBcgr9lkAFyq4+eOQNiieI3Wz3UESR01QjuGhG/Oh1ACzl7
 +5vXfEtotmaQzzmYcXttbNzIK0hupHBkPkTrPAFZz1nwqnKbJGqHmSKXQi/ACwdkiuM3TVxPf1A
 p5jQUpA+2TN309KmOaZ3aPp3IpWtEoDqAgUF277PXZnBqB9WnbwlQwperU/o2T3NMya9iqA9IEj
 IVXH1gIuuUGFPwiE4YBLEaKDbumoPzDU5g2iRNVF4XPbZ78NUpLpzkLdddGWR3E8PrCsSFYSWIR
 o4BKEZNEN+MXVnYpITuZekgOjgvpfCsSr9/6/VqgLu+b4fmtnUOSKjD6nYM2Y1R6EX2O0s3F301
 jE/fCCph5HfcQMqei5E/hi0wvLk1uNFXneMYp7CDOpxdFbiZZZ92c+VUIUM0Zdj0oS4XwAEY5H0
 lMu3U20FjY2hc/16jrMbdGfVSKttk1LzboyJ40WSBxJyScmpxl+/fU9n9JTJPW7rNI6YPHc/W8x
 teD/RyeRjLKLZy5p7xuxIv05KQgM2BmXUr8El8Ut4dINwIxC4jklXVJ0ZvEL5cSn7EHUa/sKhoE
 AsL0ODwCc3PpF+B0cAY+pczZvuFeOhU1tBXlXOoAtzGuP+G3oCK13/IRpTN9ceVoE5ftKPVeLxs
 xL7717XhQbPFE4Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092603_484629_0CEE694E 
X-CRM114-Status: GOOD (  27.45  )
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
   R8 makes sense, but when the hardware handles the Y-only pixels as YCbCr,
   where Cb and Cr are "neutral", it makes more sense to consider the
   format as an YUV format rather than RGB.

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
Changes in v8:
- Expand the "drm/fourcc: Add DRM_FORMAT_Y8" commit description to
  explain the rationale
- Add comment to "drm: xlnx: zynqmp: Add support for Y8 and Y10_P32"
  explainig the Y-only matrix
- Remove extra blank line
- Link to v7: https://lore.kernel.org/r/20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com

Changes in v7:
- Added Reviewed-bys
- Rebased on v6.18
- Link to v6: https://lore.kernel.org/r/20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com

Changes in v6:
- Added tags for reviews
- Rebased on v6.17
- Link to v5: https://lore.kernel.org/r/20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com

Changes in v5:
- Add comment about Y-only formats, clarifying how the display pipeline
  handles them (they're handled as YCbCr, with Cb and Cr as "neutral")
- Clarify X403 format in the patch description
- Set unused Y-only CSC offsets to 0 (instead of 0x1800).
- Add R-bs
- Link to v4: https://lore.kernel.org/r/20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com

Changes in v4:
- Reformat the drm_format_info entries a bit
- Calculate block size only once in drm_format_info_bpp()
- Declare local variables in separate lines
- Add review tags
- Fix commit message referring to Y10_LE32 (should be Y10_P32)
- Link to v3: https://lore.kernel.org/r/20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com

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
      drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
      drm: xlnx: zynqmp: Add support for X403
      drm: xlnx: zynqmp: Add support for XVUY2101010

 drivers/gpu/drm/drm_fourcc.c       | 28 +++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 56 +++++++++++++++++++++++++++++++++++---
 include/uapi/drm/drm_fourcc.h      | 28 +++++++++++++++++++
 3 files changed, 105 insertions(+), 7 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20241120-xilinx-formats-f71901621833

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


