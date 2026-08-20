Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4216C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=; b=f9gxFEFdFVgl6BUQg8aof74MIL
	uFrLnjDn9mg3kwWP38QLF5uvI57XNx066G6wg8+kLqGB/wHXF2O+hmqj8ErcvQCTFACpBPhfulYFb
	n6AegFJKcIDBYCmmuslvpPius4kWvex1jDFoaD/URy2z0xl51+YvcBwgIdSIS2UH2ACFVoOG2Ah7F
	iVjgcIMm6nu+H/dtwZQPx/IwvlGeHupj+pWq7xWFgJiEtXexxCjHCf7SWhl2k+wm2FQOQ7xdUISlh
	7NJl+r2GFN37V0Hu7WzGWW1+RbyVq683IOP9eyd7vcpYtfjMNIXRKZIeMy/EVEuvaOc9aEVe2f0pR
	QCi4cN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5L6-0000000Brbr-2Tju;
	Thu, 20 Aug 2026 16:10:00 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5L2-0000000BrZX-1Cvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:09:58 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-841f1dfc30fso18280897b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242194; cv=none;
        d=google.com; s=arc-20260327;
        b=jQhf5zIlpi84tWFaRTz3YjnRi81Oq/X1jdhYnB12rk0qenJjOEUp+x13F8WqbNyPgy
         1wDsIBHvmt/bMziBjMWYwimXM0JjcBTmMclkCFgZWl38euOyDyFpu/DQ03dPjZyhKJfY
         IDIfu3JE3cbXlF4TflLSs0lvAOPn37mUldrN5QZVVvOZ39RLvq6iiSmBHKnOfKIMEe6q
         +QAO7a+w/Gbw9OK0zXb4cdqoNqs/tstArBQZnhJpLKNITSE8vwUmHGtcbHUhU3n30bDD
         LZ3qrtWJX0sg7PDRv6LNhzvuWoIEus53VkxuNFmYXVdx14RE+jCBIP2nNBTa6A7FkXpU
         fCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        fh=JsTU0d9usFwZrjJ/lAslNj7EfRhmCJvONvQUMRhuzZc=;
        b=k4FJ7CIu89ppOKWejdDkFlwD+D5FFqj9u1qO8t25KcKvr7JZKFlcLE48dawKye5YzZ
         QFprMaXdN1dIj3ZplPqFWTLJcKi4RSYQ82dzDIkFe5gH8Ni5h/dYriSNK5YvfSrq+Imp
         U0No8uAuG1bzB5nmlB1kMz/8VGTkvbSIWvy0Cftr214cDo10kbTi/NBkcRPpfgOVafsk
         htmzeulgtBUGd9WnRlcBAmLC10LJAx6g6lJE3+DtAmIwjmTKCeypJBRSj7hRQivqSto3
         FUgy7N8e94DHiDVMjX5TLa6Dn+neWONygfJY30RQXK2Lsw99/IaqQHK6KqM0hEZ1DpNC
         I50Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787242194; x=1787846994; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        b=TNVNFsS438ATpNI9lzyTU4vmPzuQVyw2wkbmp0p+Um2GAV8HacHBNK2CI4S1A2eHLa
         IGB1R3c6VgsZVnNmOYl83qcVRwh4PEvnLtiefNaxTbeCK8lNG7+5HSjzn+mj59EmDiJG
         bx0G4VrKSZnqndUvGOxnFWN7W/AKnDvpCS9NtXl6AQx1EZaWXC73XB2VckCVPcsVyXK7
         7lb59de9+CrlKOLIlvYMbOhIbEXs2YYB2QV3jX9ZNy97fPs+29cWtajLnXU+mAXSZqlI
         vBuKEjztiWzOQb3k+BbFtZd4aRIBpTJgh3KHb1RTHwXCDYaMvEl+WBgWiGYZ6s9yjCq+
         obOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242194; x=1787846994;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        b=Dy4aMP3IV1ZIiI2xgZbjNG5/gaOA/e3+an5ZgfHH6IJrjP2pvgyvAqqWzWfBIQ9TQT
         Co/WUGrp7d1ta4itxwf/WSVEbNHR4BDhkOqExnms9t+GPBSj2VgexMzfbQsR/ak+93lX
         91T8nBEJ/ciK/nJaHZOCsV2E8nEXHUA2qGqH0Pb+NKLkIZmS1C+v3bGRN0MG66lki5GU
         Mpp0kxXhyzX5DCuIT6GtdzzoftmN/6JqpLk0YSASROtUjkODzrSsEh6WW0Fo4noOpjO4
         zk02YnkA+OtqgPbQVcU6IMq50ysAVAJ7QMkrEnOoDghJa4h3TIVxqLEFEsMl4WKLinjy
         2a+w==
X-Forwarded-Encrypted: i=1; AHgh+RqYko5aJshlB55rI2gm9r318psdyHaWEr2zczEqqKYKf2sGGKSeRSUNdbKuszTrXpHuPW18F/twamU2hMqp7Ay1@lists.infradead.org
X-Gm-Message-State: AFuF++m18yxs/Skm6IBpSY91a+7oR6Qf0mJBz/XLFcxC3vPhkY6k3Taa
	Fw+SrXg7Prxtk2xn3hmDBsjiT6DAK/TjAoDvB2LAsgBdmHW0Yl4fOmax0wSGthcjpNejFyZe8bA
	2PhFrYmnCnnp9aDZHzPIaE6qPa8ZPSRDzySOiMDA4ww==
X-Gm-Gg: AR+sD12XDkXVInSZeiPlp9tDQzthHBRewtSP/ckAHO4pURc9WsgQheKiRbVgbW+duod
	wZRnP25dilr5sO5OurkQOfXIeaGT30iuoFSuJO0SfaKys2izgZB87mnts4+3MzyptFWRz0mzIDE
	WFPi8JRUyedmfewrLO7UyuHzCWGlCpUmXxKDKt6s7bF/8jfbAyFcAeCIImpDpxt4W1hcPAD4Uc3
	y9+6HH8+PHrg0bcCB4mttCjrnMHRlJ5uLLjRByXd/wF04Z3ebftNoN0Y5EjF1D784MdEByFX53H
	aUkxUmzyUXOrKb/TvFRS2Z7qRBGTFXWcMOSVBHA4y20=
X-Received: by 2002:a05:690c:368d:b0:81e:bc7a:df50 with SMTP id
 00721157ae682-847073bfb74mr30025847b3.3.1787242194117; Thu, 20 Aug 2026
 09:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:09:41 +0100
X-Gm-Features: AcwNN1VgmVOYcrk7bMwBzs9TxTriEzLAFAfw5e5S7lqbNmSbT0-zJcMx5yXZZGg
Message-ID: <CAFyCYyMC-j+9CxyJ+POOC55eHsv7cB9jKogpLF5KVv6TZouFcg@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] media: Add support for multi-context operations
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_090956_383927_E9642FAD 
X-CRM114-Status: GOOD (  42.38  )
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
Reply-To: jc@kynesim.co.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>
> Modern ISPs are designed to handle multiple "streams" of data, not necessarily
> related to the same image or video stream.
>
> The hardware resources are generally time-multiplexed between different
> execution contexts at the hardware or firmware level and in order to operate the
> ISP with multiple video sources it is necessary for drivers to keep track of
> per-context data and resources.
>
> In V4L2 the M2M framework supports multiple contexts through multiple opens of
> the same video device. This doesn't however support drivers exposing multiple
> video devices and sub-devices. Several out-of-tree drivers implement
> multi-context support by registering multiple 'logical' instances of the same
> media graph, one for each context. This effectively multiplies the number of
> video device nodes and subdevice nodes. Userspace applications open one media
> graph instance and operate on the corresponding video devices, under the
> impression of dealing with a dedicated instance of the sole underlying hardware
> resource.
>
> This solution is however a short term hack, it doesn't scale well when the
> number of contexts grow. ISPs such as the Mali C55 have been designed to process
> 8 cameras concurrently, and other ISPs may do more.
>
> For this reason, a solution to expose and manage multiple execution contexts
> without duplicating the number of media, video and sub-devices registered to
> userspace is needed to improve support for multi-context devices in V4L2.
>
> The series enables userspace to multiplex the usage of a media device and of
> video devices without duplicating the number of devnodes in userspace, by
> introducing the following concept in the framework:
>
> - Media Device Context: a context created at media-device open time and stored
>   in the media-fh file handle. To a media device context is associated a list
>   of media entity contexts which are 'bound' to it.
>
> - Video Device Context: represents an isolated execution context of a
>   video device. By storing the data and the configuration of a video
>   device userspace is allowed to effectively multiplex the usage of a
>   device node.
>
> - Video Subdevice Context: represents an isolated execution context of
>   v4l2 subdevice. It stores that subdev state which is now available in
>   three locations:
>   - in the file handle: for TRY formats
>   - in the subdevice: for ACTIVE formats to support operations of subdevices
>     drivers that do not implement context support
>   - in the subdevice default context: for ACTIVE formats to support
>     operations of subdevice drivers that implement context support and
>     are operated by non-context-aware userspace
>   - in the subdevice file-handle context: for ACTIVE formats to support
>     operations of subdevices drivers that implement context support and
>     are  bound to a media device context
>
>   Both the Video Device Context and the V4L2 Subdevice
>   Context extend the Media Entity Context base type so that the MC and
>   V4L2 layers are kept independent one from each other.
>
> - A Video Device Context is created by a new ioctl VIDIOC_BIND_CONTEXT and is
>   stored in the v4l2-fh file handle.
>
> - A V4L2 Subdevice context is created by a new ioctl
>   VIDIOC_SUBDEV_BIND_CONTEXT and is stored in the v4l2_subdev_fh file
>   handle.
>
>   The VIDIOC_BIND_CONTEXT and VIDIOC_SUBDEV_BIND_CONTEXT ioctls associates a
>   Video/Subdevice Context to a Media Device Context. By binding a set of video
>   devices and subdevices to a media device context userspace can create several
>   isolated 'execution contexts' which can be operated independently one from
>   each other.
>
> - A V4L2 Video Device and V4L2 Subdevice default context is made
>   created to allow drivers that implement multi-context support but are
>   operated by userspace that is not context aware (IOW doesn't call
>   VIDIOC_BIND_CONTEXT).
>
> The first 20 patches implement the above described changes in the
> framework:
>
>   media: v4l2-subdev: Validate media links with context
>   media: mc-entity: Add link_validate_context
>   media: media-entity: Support context in pipeline_start
>   media: v4l2-subdev: Get state from context
>   media: v4l2-subdev: Add subdev state accessor helpers
>   media: v4l2_subdev: Introduce default context
>   media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
>   media: v4l2-subdv: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
>   media: v4l2-subdev: Introduce v4l2 subdev context
>   media: videobuf2-v4l2: Support vb2_queue embedded in a context
>   media: v4l2-dev: Add video_device_context_from_queue()
>   media: v4l2-dev: Add video_device_context_from_file()
>   media: Introduce default contexts
>   media: v4l2-dev: Documentation: Add VIDIOC_BIND_CONTEXT
>   media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
>   media: v4l2-dev: Introduce video device context
>   media: media-device: Introduce media device context
>   media: media-entity: Introduce media_entity_context
>   media: mc: Maintain a list of open file handles in a media device
>   media: mc: Add per-file-handle data support
>
> For testing the implementation I used a Raspberry Pi5, implementing
> support for multiple contexts in the ISP driver. The PiSP BE driver
> however only implements video devices, as the single ISP subdev is not
> exposed to userspace and doesn't require any configuration. To test the
> V4L2 subdev context operations I had to first expose the ISP subdev to
> userspace and implement link validation and pipeline allocation for it.
> This is implemented in the following 6 patches NOT FOR INCLUSION in
> mainline but just here for reference
>
>  [DNI] media: pisp_be: Register devnode to userspace
>  [DNI] media: pisp_be: Implement link validation
>  [DNI] media: pisp_be: Implement set/get_pad_fmt
>  [DNI] media: pisp_be: Add support for subdev state
>  [DNI] media: pisp_be: Start and stop the media pipeline
>
> Finally, the last patch (again NOT FOR INCLUSION) ports the ISP driver
> to support multi-context operations and provides a reference for the
> multi-context API usage by drivers:
>
>  [DNI] media: pisp_be: Add support for multi-context
>
> The multi-context support has been tested with a version of libcamera
> that binds all video devices and the ISP subdevice in an execution
> context and allows to stream two cameras at the same time using the same
> media graph.
>
> In order to validate the fact that introducing context support in
> drivers doesn't break existing userspace which is not context-aware,
> capturing from a single camera with [mainline libcamera + ISP subdev
> configuration] has been tested as well.
>
> CI pipeline:
> - https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1472617
> - checkpatch errors are due to "DNI" prefix in last patches
> - static check errors seems unrelated to this set of patches but to
>   existing code
> - checkpatch error are due to the usage of "Generic" which checkpatch
>   doesn't like
>
> Branch for testing:
> - kernel patches:
>   https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/multicontext/mainline/2025
> - libcamera multi-context:
>   https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/mc
> - libcamera single context:
>   https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/subdev-no-multi-context
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v2:
> - Add "media: uapi: Add 'flags' to media_device_info"
> - Fix robots complaints by protecting users of symbols only defined if
>   CONFIG_MEDIA_CONTROLLER with pre-processor guards
> - Link to v1: https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com
>
> rfc->v1 Compared to the RFC version sent in September 2024:
>   - Implement support for V4L2 Subdevice context
>   - Implement context-aware pipeline start and link validation
>   - Break out from Sakari's media lifetime series the only 2 required
>     patches that introduce media_device_fh
>   - Test the BE ISP subdevice by implementing support for the ISP
>     subdevice in the BE driver
>
> ---
> Jacopo Mondi (25):
>       media: media-entity: Introduce media_entity_context
>       media: media-device: Introduce media device context
>       media: v4l2-dev: Introduce video device context
>       media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
>       media: Documentation: Add VIDIOC_BIND_CONTEXT
>       media: v4l2-dev: Introduce default contexts
>       media: v4l2-dev: Add video_device_context_from_file()
>       media: v4l2-dev: Add video_device_context_from_queue()
>       media: videobuf2-v4l2: Support vb2_queue embedded in a context
>       media: v4l2-subdev: Introduce v4l2 subdev context
>       media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
>       media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
>       media: v4l2_subdev: Introduce default context
>       media: v4l2-subdev: Add subdev state accessor helpers
>       media: v4l2-subdev: Get state from context
>       media: media-entity: Support context in pipeline_start
>       media: mc-entity: Add link_validate_context
>       media: v4l2-subdev: Validate media links with context
>       media: uapi: Add 'flags' to media_device_info
>       [DNI] media: pisp_be: Start and stop the media pipeline
>       [DNI] media: pisp_be: Add support for subdev state
>       [DNI] media: pisp_be: Implement set/get_pad_fmt
>       [DNI] media: pisp_be: Implement link validation
>       [DNI] media: pisp_be: Register devnode to userspace
>       [DNI] media: pisp_be: Add support for multi-context
>
> Laurent Pinchart (1):
>       media: mc: Add per-file-handle data support
>
> Sakari Ailus (1):
>       media: mc: Maintain a list of open file handles in a media device
>
>  .../media/mediactl/media-ioc-device-info.rst       |   6 +-
>  .../userspace-api/media/mediactl/media-types.rst   |  13 +
>  .../userspace-api/media/v4l/user-func.rst          |   2 +
>  .../media/v4l/vidioc-bind-context.rst              |  80 +++
>  .../media/v4l/vidioc-subdev-bind-context.rst       |  81 +++
>  drivers/media/common/videobuf2/videobuf2-v4l2.c    | 139 ++--
>  drivers/media/mc/mc-device.c                       | 213 +++++-
>  drivers/media/mc/mc-devnode.c                      |  20 +-
>  drivers/media/mc/mc-entity.c                       | 220 +++++-
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 775 ++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-dev.c                 | 158 ++++-
>  drivers/media/v4l2-core/v4l2-device.c              |  11 +-
>  drivers/media/v4l2-core/v4l2-fh.c                  |   1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  72 ++
>  drivers/media/v4l2-core/v4l2-subdev.c              | 414 ++++++++++-
>  include/media/media-device.h                       | 230 ++++++
>  include/media/media-devnode.h                      |  21 +-
>  include/media/media-entity.h                       | 163 ++++-
>  include/media/media-fh.h                           |  37 +
>  include/media/v4l2-dev.h                           | 252 +++++++
>  include/media/v4l2-fh.h                            |   3 +
>  include/media/v4l2-ioctl.h                         |   7 +
>  include/media/v4l2-subdev.h                        | 293 ++++++--
>  include/uapi/linux/media.h                         |   6 +-
>  include/uapi/linux/v4l2-subdev.h                   |  11 +
>  include/uapi/linux/videodev2.h                     |  11 +
>  26 files changed, 2890 insertions(+), 349 deletions(-)
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250716-multicontext-mainline-2025-3479c7c24b7a
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks for this patchset - I've been writing a driver (not ready for upstreaming
for several reasons), and it works well to enable processing several streams
at once. I would be interested in seeing it finished. I have however spotted
a number of issues which I will address against the relevant patches.

Regards

John Cox

