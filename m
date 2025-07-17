Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09486C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mm4PQuSpd2NG4zU5gwX0zqKyPqqIeBBFORJusDA+nsQ=; b=1rmp20AShFJ9j7
	GlyPkTo3kGu9Lau0qQnlHh47HHN7fG8Y6fS2XuqCUNSwGDtzHXxpIfUGQC8rUYf0KLh0QRWiElLVr
	zSzGDZ074eELVrL3AgPMBX2JR1rXKa3A80fqziwFeEThIkowzwNME8CxXdFqtkWcc+fyblHkvTMW6
	93BJmWSN/Zq3YWpW5SHSrB80ICagiHNuGKrOKcLjxoWBSJbP9Wb0j7e7s8+QyWMMzNgOZD9O8XlUa
	M03ArUvOjXKVFpNf/tKxAzQuFv9NIUpg/0WLnmQYY6ShtenBAinRdIgvGj8gN+hf8rk3QlgTutoAO
	hqFUhted42DYqRLCIOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMf4-00000009xoQ-0w2P;
	Thu, 17 Jul 2025 11:20:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7T-00000009sdq-3w5P;
	Thu, 17 Jul 2025 10:45:45 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B70F61E74;
	Thu, 17 Jul 2025 12:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749106;
	bh=cjoxIF1FShQ3MqmokiwQg5mBWJtk/4HRO0233RI0GIM=;
	h=From:Subject:Date:To:Cc:From;
	b=H3A6A7JxdxA0S9lbFiTrwPi/PtveKTmJ0vmkhK73K+SOg7q8CIa1SsEAYiguJhYKl
	 x27Ov70NYTQ0De0InXRWwZyhvrUlfZzRtAOOr/MrQGcSVDU2ns5BmlIufjnHzxYw2Y
	 w/cp3r1WnO8fBdqGiDOU7pJMfFkf6+XokYOKhF10=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 00/26] media: Add support for multi-context operations
Date: Thu, 17 Jul 2025 12:45:26 +0200
Message-Id: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbUeGgC/x3MQQqDMBBA0avIrDugqTboVYqLdDragWSUJC2Ce
 PdGl48Pf4fEUTjBUO0Q+SdJFi1obhXQx+nMKO9iMLXpats8MHx9Flo085YxOFEvynhmvLe2J0u
 mfVkHZbBGnmS75s/xOP721rA/bAAAAA==
X-Change-ID: 20250716-multicontext-mainline-2025-3479c7c24b7a
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11032;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=cjoxIF1FShQ3MqmokiwQg5mBWJtk/4HRO0233RI0GIM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNROb0GemA/i0r9h4c/KRtAhDmkjpyXAiOaJS
 tNPwD+ewZiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTgAKCRByNAaPFqFW
 PF2cD/46wzbAN+xWBi2DKuxKgysNCfY5YuMnTXlh5iKSQV/41fFfHlE5H9qiq4ghLA0GXzr2n1T
 USQILYg8nhnPfmFdcZ8Z+ngh90ojC3YFkj2BdtNP1mT0kmhxFtzrDoFK59HOXWX4z/QFqK81wmZ
 uyKT1u71KWQC4WvJ2w9+SpoYcNDY4lif59/J8k2OlTlyjXUXRjFAjoqhew4A3PkQI2eVNpoxoMB
 sdvBgB5AbrqR2zRndyKGbNcJthZxTqDtNLq10xCX2IibCdaKRMrQ7WP0mCY81+Px/dUYw62iMyD
 MZgRT25R0503TvqSqnwEd82aow2O3JFJTB0J/MKTC+dEU57+4ZLI5L7U7Xw3zv8u6Jwkfd6FzCe
 FeJTBWBAsBGF3C7BO9D9MdOpajwBZmidc5IajRvk1p22d9RZ3TXChss3SW5lU2yoC9v7CjqGZVf
 CNmngAj5TJkP8c1vGXVtXGAdKEe+W7E5acqBMI5ARXniINQwe0dccMIWl1GdwJD2o8dC5rwdTv8
 5mabi/vOL5k8GgUjm5faCFljihRU8MTEevBpyHIM0BjJCcA4guiwFnguwh0JSfp+ILzOI/D4jJw
 Pn4xd0uqW208yll0k7opevLMO8g03/5mpOfr2ALspFPrdvBMsXv4t3EOtcfhzhPNz34u8OnAEND
 Q+usWoHGvKighRA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034544_129739_1ABE8313 
X-CRM114-Status: GOOD (  23.36  )
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

Modern ISPs are designed to handle multiple "streams" of data, not necessarily
related to the same image or video stream.

The hardware resources are generally time-multiplexed between different
execution contexts at the hardware or firmware level and in order to operate the
ISP with multiple video sources it is necessary for drivers to keep track of
per-context data and resources.

In V4L2 the M2M framework supports multiple contexts through multiple opens of
the same video device. This doesn't however support drivers exposing multiple
video devices and sub-devices. Several out-of-tree drivers implement
multi-context support by registering multiple 'logical' instances of the same
media graph, one for each context. This effectively multiplies the number of
video device nodes and subdevice nodes. Userspace applications open one media
graph instance and operate on the corresponding video devices, under the
impression of dealing with a dedicated instance of the sole underlying hardware
resource.

This solution is however a short term hack, it doesn't scale well when the
number of contexts grow. ISPs such as the Mali C55 have been designed to process
8 cameras concurrently, and other ISPs may do more.

For this reason, a solution to expose and manage multiple execution contexts
without duplicating the number of media, video and sub-devices registered to
userspace is needed to improve support for multi-context devices in V4L2.

The series enables userspace to multiplex the usage of a media device and of
video devices without duplicating the number of devnodes in userspace, by
introducing the following concept in the framework:

- Media Device Context: a context created at media-device open time and stored
  in the media-fh file handle. To a media device context is associated a list
  of media entity contexts which are 'bound' to it.

- Video Device Context: represents an isolated execution context of a
  video device. By storing the data and the configuration of a video
  device userspace is allowed to effectively multiplex the usage of a
  device node.

- Video Subdevice Context: represents an isolated execution context of
  v4l2 subdevice. It stores that subdev state which is now available in
  three locations:
  - in the file handle: for TRY formats
  - in the subdevice: for ACTIVE formats to support operations of subdevices
    drivers that do not implement context support
  - in the subdevice default context: for ACTIVE formats to support
    operations of subdevice drivers that implement context support and
    are operated by non-context-aware userspace
  - in the subdevice file-handle context: for ACTIVE formats to support
    operations of subdevices drivers that implement context support and
    are  bound to a media device context

  Both the Video Device Context and the V4L2 Subdevice
  Context extend the Media Entity Context base type so that the MC and
  V4L2 layers are kept independent one from each other.

- A Video Device Context is created by a new ioctl VIDIOC_BIND_CONTEXT and is
  stored in the v4l2-fh file handle.

- A V4L2 Subdevice context is created by a new ioctl
  VIDIOC_SUBDEV_BIND_CONTEXT and is stored in the v4l2_subdev_fh file
  handle.

  The VIDIOC_BIND_CONTEXT and VIDIOC_SUBDEV_BIND_CONTEXT ioctls associates a
  Video/Subdevice Context to a Media Device Context. By binding a set of video
  devices and subdevices to a media device context userspace can create several
  isolated 'execution contexts' which can be operated independently one from
  each other.

- A V4L2 Video Device and V4L2 Subdevice default context is made
  created to allow drivers that implement multi-context support but are
  operated by userspace that is not context aware (IOW doesn't call
  VIDIOC_BIND_CONTEXT).

The first 20 patches implement the above described changes in the
framework:

  media: v4l2-subdev: Validate media links with context
  media: mc-entity: Add link_validate_context
  media: media-entity: Support context in pipeline_start
  media: v4l2-subdev: Get state from context
  media: v4l2-subdev: Add subdev state accessor helpers
  media: v4l2_subdev: Introduce default context
  media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
  media: v4l2-subdv: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
  media: v4l2-subdev: Introduce v4l2 subdev context
  media: videobuf2-v4l2: Support vb2_queue embedded in a context
  media: v4l2-dev: Add video_device_context_from_queue()
  media: v4l2-dev: Add video_device_context_from_file()
  media: Introduce default contexts
  media: v4l2-dev: Documentation: Add VIDIOC_BIND_CONTEXT
  media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
  media: v4l2-dev: Introduce video device context
  media: media-device: Introduce media device context
  media: media-entity: Introduce media_entity_context
  media: mc: Maintain a list of open file handles in a media device
  media: mc: Add per-file-handle data support

For testing the implementation I used a Raspberry Pi5, implementing
support for multiple contexts in the ISP driver. The PiSP BE driver
however only implements video devices, as the single ISP subdev is not
exposed to userspace and doesn't require any configuration. To test the
V4L2 subdev context operations I had to first expose the ISP subdev to
userspace and implement link validation and pipeline allocation for it.
This is implemented in the following 6 patches NOT FOR INCLUSION in
mainline but just here for reference

 [DNI] media: pisp_be: Register devnode to userspace
 [DNI] media: pisp_be: Implement link validation
 [DNI] media: pisp_be: Implement set/get_pad_fmt
 [DNI] media: pisp_be: Add support for subdev state
 [DNI] media: pisp_be: Start and stop the media pipeline

Finally, the last patch (again NOT FOR INCLUSION) ports the ISP driver
to support multi-context operations and provides a reference for the
multi-context API usage by drivers:

 [DNI] media: pisp_be: Add support for multi-context

The multi-context support has been tested with a version of libcamera
that binds all video devices and the ISP subdevice in an execution
context and allows to stream two cameras at the same time using the same
media graph.

In order to validate the fact that introducing context support in
drivers doesn't break existing userspace which is not context-aware,
capturing from a single camera with [mainline libcamera + ISP subdev
configuration] has been tested as well.

CI pipeline:
- https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1472617
- checkpatch errors are due to "DNI" prefix in last patches
- static check errors seems unrelated to this set of patches but to
  existing code
- checkpatch error are due to the usage of "Generic" which checkpatch
  doesn't like

Branch for testing:
- kernel patches:
  https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/multicontext/mainline/2025
- libcamera multi-context:
  https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/mc
- libcamera single context:
  https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/subdev-no-multi-context

rfc->v1 Compared to the RFC version sent in September 2024:
  - Implement support for V4L2 Subdevice context
  - Implement context-aware pipeline start and link validation
  - Break out from Sakari's media lifetime series the only 2 required
    patches that introduce media_device_fh
  - Test the BE ISP subdevice by implementing support for the ISP
    subdevice in the BE driver

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (24):
      media: media-entity: Introduce media_entity_context
      media: media-device: Introduce media device context
      media: v4l2-dev: Introduce video device context
      media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
      media: Documentation: Add VIDIOC_BIND_CONTEXT
      media: v4l2-dev: Introduce default contexts
      media: v4l2-dev: Add video_device_context_from_file()
      media: v4l2-dev: Add video_device_context_from_queue()
      media: videobuf2-v4l2: Support vb2_queue embedded in a context
      media: v4l2-subdev: Introduce v4l2 subdev context
      media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
      media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
      media: v4l2_subdev: Introduce default context
      media: v4l2-subdev: Add subdev state accessor helpers
      media: v4l2-subdev: Get state from context
      media: media-entity: Support context in pipeline_start
      media: mc-entity: Add link_validate_context
      media: v4l2-subdev: Validate media links with context
      [DNI] media: pisp_be: Start and stop the media pipeline
      [DNI] media: pisp_be: Add support for subdev state
      [DNI] media: pisp_be: Implement set/get_pad_fmt
      [DNI] media: pisp_be: Implement link validation
      [DNI] media: pisp_be: Register devnode to userspace
      [DNI] media: pisp_be: Add support for multi-context

Laurent Pinchart (1):
      media: mc: Add per-file-handle data support

Sakari Ailus (1):
      media: mc: Maintain a list of open file handles in a media device

 .../userspace-api/media/v4l/user-func.rst          |   2 +
 .../media/v4l/vidioc-bind-context.rst              |  80 +++
 .../media/v4l/vidioc-subdev-bind-context.rst       |  81 +++
 drivers/media/common/videobuf2/videobuf2-v4l2.c    | 135 ++--
 drivers/media/mc/mc-device.c                       | 212 +++++-
 drivers/media/mc/mc-devnode.c                      |  20 +-
 drivers/media/mc/mc-entity.c                       | 220 +++++-
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 773 ++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-dev.c                 | 158 ++++-
 drivers/media/v4l2-core/v4l2-device.c              |  11 +-
 drivers/media/v4l2-core/v4l2-fh.c                  |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  64 ++
 drivers/media/v4l2-core/v4l2-subdev.c              | 414 ++++++++++-
 include/media/media-device.h                       | 223 ++++++
 include/media/media-devnode.h                      |  21 +-
 include/media/media-entity.h                       | 163 ++++-
 include/media/media-fh.h                           |  37 +
 include/media/v4l2-dev.h                           | 252 +++++++
 include/media/v4l2-fh.h                            |   3 +
 include/media/v4l2-ioctl.h                         |   7 +
 include/media/v4l2-subdev.h                        | 293 ++++++--
 include/uapi/linux/v4l2-subdev.h                   |  11 +
 include/uapi/linux/videodev2.h                     |  11 +
 23 files changed, 2845 insertions(+), 347 deletions(-)
---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250716-multicontext-mainline-2025-3479c7c24b7a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


