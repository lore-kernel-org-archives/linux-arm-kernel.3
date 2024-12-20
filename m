Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F4E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=; b=2DeFgXROcpmNj3
	vjd35CeQUZIazIPddTGDfjReTNPo3RjGCPhqrVTenvxF32807DV/4Zc1/AZ1NwbdtEZ9v0Icfb3lK
	aZniZOKx8Ys+pzKj+3Wv8r8mLyLeQ30VEa3yGMqhpwgFQbRKRx/p1ZypDlTEJfqJcXWbTR1MVbMtH
	JfK9XpWRx5CAxV9sWSsckuwv6UPgIC7/vJERheV7NvXzYyR/rtF6FlS38GpHUHxZwXSPX3nOCYISz
	IkC20iV3rSrMMLZ+1T/zWTAm6zspe7E1/2dx9BX+HJocgjptz4d1U/0D3W3KuUjIJPuD+Koy92CHX
	3dUyZgG6WVoDzV0JbKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfoS-00000005STi-2Ouv;
	Fri, 20 Dec 2024 16:25:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkz-00000005Rr1-0JFd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=; b=B8JKgg6kslkwVehLtGJLZGCfV4
	/JjHyda/oU34KVsG3WZ3WioLzVlj8GMM7L2dr5Orv1mbv5ZTyxZSU0D5+k1scuxc1/Opzs6VcJNCI
	93u1RnE3QP8/jlPLpPlHZgjWEYydVtkMNDJaqvOyvTBXgqj26tyL4nInApQ8d78oxTEA08wkQXrtc
	3p+Dd+93So8QdVa4xE7PPNzSCCWlxTAXHSB6OxVZj8e1B5MuuVVtC2JuW4QzpgWEAGFpLYFJlsYVE
	Jx6518WkMpXn9BSfxk8qQXMrl9ksneOOBI82EkxmGGcnAgzizIxA76yd6MJc4FKEG4z1zCdTBWDBQ
	OCxDBiRQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkv-00000005iTd-0YpD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43621d27adeso14700525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711694; x=1735316494; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=;
        b=ocA/xqndM2XsCoOEMF0me11/pNBPgZvftDqb6g/zioNUYSYVQfwxyoM3N7UD8ZKD/f
         znfxkB0/2DjAj6UkhFA2P+NS7w/WLbp/tTzF+0C+CZuXn48tgh3AFemn7NUWqbAgSGzm
         dzCvsfGp8/TCUDwZGs0fK+UgOkUuQcTJKWKidkV60yCF0BsjDwbvBJ2h9bzmMMr8TfU1
         xlicbaLYjHYaPSwnipZhgVP58g3Q2/vyWE2oXLaODsFc6sKTU0G/ojU1xmRlMfUe3VvG
         ySxTdchKnOPmHjJEy5OdUJplZpVKvxadv0Ac7bkxc32x/0ULd9QZChC3OVV6WaubLJvF
         /xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711694; x=1735316494;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=;
        b=b+yHCYu0UNce0NP1jdgiwhSlCvb3rvZblwXYpM42SppI6EwdBwyl6CTZCS0TzI0Yxy
         BnVbgpOJ8NwTx8psMI+Qx0df7MqTOuXhj9QaDn7hGlnBAuQddp9JRTsDJSCjgdA7WGM/
         NQWUHSbYD2YG4y3yqew4+1y7d1km7ej9iMIuQRVxVSNhKcaxqpkEUvLL82jFervJ0fWr
         r9lpuNH21fO5vahovi97EbL+Ol0OCpecZbY0JXY3pI0AIsQ3cRTucXRQYSgbrDJu7P3v
         9FkN3EbeQH3Q/0gZb5TxwCbnPnXIqunvSz70xPHSGlJrOnzVEK+7NFrBUmhMqfTz34J0
         lqAA==
X-Forwarded-Encrypted: i=1; AJvYcCW5BLxVyPvgqDM77S5aJfWkav8oY7wau/FQfU/Aw8LfOh+eLNN5DI8UNZx3m0LTyT/xqnlL3wiZU02dXALM2Lzc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXMufFWQ2XRysDrvccohs/fml9zBX7C43OvefWbkSVpHzybctZ
	TkOhPFmXizuz6aTfKMedza6dXGr0QDweBnX5OZfP1AjJno/P7XCbLJ9Cg7uqtutlyIDgeSEsA6N
	sLPQ=
X-Gm-Gg: ASbGncsk4VH4D4u9fTr4EoSFkl4EJjTE3AQBCrC8rkwpWJ7QQalLBkNzLb82bERuYBU
	3jh66xK63A773AwIKy0SCMutfS7MFMI/YV9oy3a1Gy+IiCbtKi0DPPQI+E08ZZn5eUUYxV1ktVY
	dUSRqyk7+5/FM+eup1MNN9LcTzsioNVZI4D0w3ae7yfxB3oQw3creWoCrBecA1gAnJahFklfwqJ
	2kPU4GcAGnsjfEF8IOv2km15Z/ekjclixKxdl5fmAlZluTr
X-Google-Smtp-Source: AGHT+IHoMhxzo3nOSCXEz3c5go2jSoHmBpi1T83KWRryGLqx6ewmpsxMhEX24RS3Od99Osv6HAf6mA==
X-Received: by 2002:a05:600c:154c:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43668b49a47mr28606565e9.22.1734711693962;
        Fri, 20 Dec 2024 08:21:33 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:33 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] Raspberry Pi HEVC decoder driver
Date: Fri, 20 Dec 2024 16:21:11 +0000
Message-Id: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiZZWcC/x3MSwqAIBRG4a3EHXchtYjaSjRI/c076IFCBNHek
 4bf4JyHMpIg01g9lHBJlmMvUHVFLi77ChZfTLrRrdJK8wYvC6dTOOJy7OHY2M6iN0Mw1lMJz4Q
 g9z+d5vf9ACkFL4VkAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 John Cox <john.cox@raspberypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_162137_288758_3FBFE75E 
X-CRM114-Status: GOOD (  16.98  )
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

Hi All

This has been in the pipeline for a while, but I've finally cleaned
up our HEVC decoder driver to be in a shape to at least get a first
review.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

There are a couple of questions raised in frameworks.
The main one is that the codec has 2 independent phases to the decode,
CABAC and reconstruction. To keep the decoder operating optimally
means that two requests need to be in process at once, whilst the
current frameworks don't want to allow as there is an implicit
assumption of only a single job being active at once, and
completition returns both buffers and releases the media request.

The OUTPUT queue buffer is finished with and can be returned at the
end of phase 1, but the media request is still required for phase 2.
The frameworks currently force the driver to be returning both
together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
would complete the job without returning the buffer as we need,
however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
then we have a WARN in v4l2_m2m_job_finish.
Dropping the WARN as this series is currently doing isn't going to be
the right answer, but it isn't obvious what the right answer is.
Discussion required.

We also have a need to hold on to the media request for phase 2. John
had discussed this with Ezequiel (and others) a couple of years back,
and hence suggested a patch that adds media_request_{pin,unpin} to
grab references on the media request. Discussion required on that
or a better way of handling it.

I will apologise in advance for sending this V1 just before I head off
on the Christmas break, but will respond to things as soon as possible.

Thanks
  Dave

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (4):
      docs: uapi: media: Document Raspberry Pi NV12 column format
      media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
      media: dt-bindings: media: Add binding for the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

Ezequiel Garcia (1):
      RFC: media: Add media_request_{pin,unpin} API

John Cox (2):
      media: platform: Add Raspberry Pi HEVC decoder driver
      RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/mc/mc-request.c                      |   35 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
 include/media/media-request.h                      |   12 +
 include/uapi/linux/videodev2.h                     |    5 +
 21 files changed, 4880 insertions(+), 7 deletions(-)
---
base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


