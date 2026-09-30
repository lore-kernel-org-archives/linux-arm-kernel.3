Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7118CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=; b=p1W3aZfSpprM2d3hC+l9W5cDMh
	79ONK+XAt8Tv9ZEa/xAVRIPupDufqOhUaWDrX+RyFwz1ik/AmiCyzL7bWobSv41Tt+T5rBefBsOed
	68Ye7572n0UHWMkbyJQWxa4zk/HieglJYSnmB3N7BgCFbNDukaZKGh9SIDtTIpo46Z9juavnufCDe
	jAa+9+uRUuwvTueu0mCKzJRkEp0tUprx1kBTmmTX5q+U+Y/1abHWOOamva4Wi/Q1coBvH3DDjyLwe
	HOnzoFul9vahO841sHHhMkSsvGmwMm4/L0FmXWoUDmfgNt31PYEqXTi6mqjX/NR2ljPa4YcbCHA9g
	/lD2HX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwY5-00000006ZUa-1RsS;
	Wed, 30 Sep 2026 15:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwY3-00000006ZTz-2suP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=; b=UDg6FI0i7OmY8nJBF9YhQoHYrf
	8Kd/V0Rl28pIqMOa2VrUoXbgEVXDvq7owVEOjNjo7e2tE2jP5NPu/y6b2Y+RSQZirOMvTASdsEZ8m
	zJW9khfhyt+4JhZK/EATTLQdLuJZAPrfE4D80kBB443VbtwFfyCC/M16Gmu7+xGTjikRYdZXh3y3c
	Dpj4Hz0sUCugYoimCGPpHgBu8H91UxR3WwDEVuQrN7mBFypqnHOfr/UVzyVlYuQduadnG6X4SyjvG
	EHScfsmL3AFsZUVzulSO2LfIi5BgMYVETNdW23acUpwDsvq+fWl+Zo+BbcOTHHTGnA4/D6TR6o8Mc
	lnF7QSeA==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwY0-000000041Vv-3jOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:48:46 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a494638445so1773488a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783322; x=1791388122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=;
        b=ii639e0WZ94hJIKnH32q/PGyW+CFax+dleKYcTae06bMLbClmn2XJr5Tg5vWkkksm7
         O0AO05U57QK+m4xe9yw+AP+AhG/OmRDd5BlyQWmSM4njHkxamB8J9J2+lq4h1Wb+PCtf
         y87YOScPk+AMKUP3B+NxLipe7JK6xFqLIpPwgzjaYgLhYZ4Ly8Mw0rjuO3p/ktZeyNwc
         uIz8Crn20NLgYW05xBQVdmsszOwIYBve16v7KWt48BowzGglmnFxiIuL4075aKY1wFSm
         0UiJVeTL9zAKkVHB0CI4ziRTx5KUuKIb5zvCekUmQJrxPq94vvjDR1tMtXlqWodFCsxJ
         tpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783322; x=1791388122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=;
        b=iEoBsHQKvgkA22boxMc8suTu4p/4n0Q/2VTm9OrSxB6a4TfnpC9L1OMCdcIrPPw8Cq
         cLcm/QatlHZzUmrBUCShY6rThlXIEUiJ2HxTFBkGM+4d7qt2kq4RSZF1Y5Ua1WntanTL
         8jyTlpw1kf8gGdIBwdupGZnuN1gTKYTArnZfZlvPkUFlkIjZfnw1bzzcPp2Zi5o9M5tG
         CEI1k91Tn8GCbCloEGb+mJnlG5N6w8KLm30qF+hsa4lIWY8KcJbcmFU6rLCTpl100Ywr
         7ozxS0aVHNmkAQA/3YBWxewn8hlvgxVeb9tdDslBO43vTxi0E8RQEFBN7qmCHbPpfI+F
         89Yw==
X-Forwarded-Encrypted: i=1; AKwUvByyzEi+CmJuJed8hmdaDEOlta75no3q9CS1SYu1fi6bWt1AWHNi2F7Ew6XXAGfD3Pm5SD3ePs+f3jMWiNeGfcJS@lists.infradead.org
X-Gm-Message-State: AFq9FYKPSyWX4ZqHVTEFqY+ZzOlPbU9/9XY2sg7OOC63V5JN5b0FJthO
	BTR8lEty8Ze0SXURMM80DditlAQJUC5gBrWvuXr6C9O5PWAbpgjWxWSrwZ5AyNhswe3e
X-Gm-Gg: AYBFou39rB1Et/n+kfprvHjeBadgk+dSCc1owRx8H/pVGlut2RulRUX/5Hwohv+T0BV
	erXfHYmepJwqcfDY9F+LQn/WynOo/7hzNzhimbSeXIM11o6jfdxwV1I+9QymnIUJlNTFnflLw+i
	esNbKiCGpfHRM44RBM8riOv0zLfMRUclpW7T8ZFLkyIVaoqCIQYFiNcAkVIWDyXVorf4BMbmsTf
	yw3WBHUrxrnquFXMZfk1OoRDgJV2G5de1Tx0cc/eoTixEKrNGwiOHJ7cXBdisC+7uZPGY68iPkb
	tNlUBOpM6+/dgtGJT9AFf6Zx6QY+NjyDWUiEsOfDvY6cZN2YA27wuWr0+jTeCkb4pCOdYqLIP9g
	NQwPU1bsrIliEUc4hy7jLE+DjvFDmFLPI3o6Yc46AFnlDabmXKGl7gJSFxSNC/O0/0CyuxEJjqe
	vrKfv8m65h9bz4s3ygBrsyBvTKG7IiVvb9uNWCpH3RUOrV4HTLO7WanvHN0a7hHoM2d/tmFnGHt
	vIrdBl1
X-Received: by 2002:a17:90b:4b11:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a4d14eee80mr1153811a91.9.1790783322165;
        Wed, 30 Sep 2026 08:48:42 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:41 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: sunxi: Add the Allwinner D1/T113 camera interface
Date: Wed, 30 Sep 2026 22:48:32 +0700
Message-Id: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_164845_026048_B48EF81A 
X-CRM114-Status: GOOD (  17.61  )
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

This series adds a driver for the camera interface of the Allwinner D1,
D1s and T113, which the manual calls the CSIC. It is not the A31 CSI
that sun6i-csi drives: the parser and the DMA engines are separate
blocks with their own registers, so it gets a new driver.

1. The DT binding.
2. The driver: the parallel input and the first DMA engine, as a bridge
   subdev and a capture video device (media controller API).
3. The CSIC node in the dtsi shared by the D1, D1s and T113.

I tested it on a MangoPi MQ-Dual (T113-S3) with an OV5640. With this
series on top of media next, v4l2-compliance passes for the media
device, the bridge and the video node (streaming output below; the two
failures on the sensor's subdev are the OV5640 driver's frame size and
interval enumeration). With the sensor's colour bars, every converted
YUV format matches the raw capture byte for byte, and 640x480 and
1920x1080 run at 30 fps.

On the board's 6.18 kernel with the driver backported (only the new
set_fmt argument differs), 160x120, 176x144, 320x240, 640x480, 720x480,
720x576, 1280x720 and 1920x1080 all run at 30 fps.

The OV5640's 1024x768 and 2592x1944 modes give no valid frames on this
board, and I haven't found out why yet.

I couldn't make the FIFO overflow, not even at 1920x1080 with both CPUs
and the 2D engine keeping the DRAM busy, so the overflow path (the
buffer is returned with an error and capture goes on) has never run.
sun6i-csi restarts the block on an overflow instead; I left that out,
as I can't test it.

Not tested: a D1 board (build and dtbs_check only), BT.656 (not
supported yet), other sensors, the second DMA engine, the IOMMU and
system suspend while streaming.

The series is based on the media tree's next branch.

v4l2-compliance from v4l-utils git, on media next, with vivid as the
DMABUF exporter (v4l2-compliance -d /dev/video4 -s -e /dev/video0):

v4l2-compliance 1.33.0-5506, 32 bits, 64-bit time_t
v4l2-compliance SHA: 91dda32e4cc9 2026-09-28 07:58:16

Compliance test for sun20i-csi device /dev/video4:

Driver Info:
	Driver name      : sun20i-csi
	Card type        : Allwinner D1 CSIC
	Bus info         : platform:5800000.csi
	Driver version   : 7.3.0
	Capabilities     : 0xa4200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : sun20i-csi
	Model            : Allwinner D1 CSIC
	Serial           :
	Bus info         : platform:5800000.csi
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x03000006
	Type             : V4L Video
Entity Info:
	ID               : 0x00000004 (4)
	Name             : sun20i-csi-capture
	Function         : V4L2 I/O
	Pad 0x01000005   : 0: Sink, Must Connect
	  Link 0x02000008: from remote pad 0x1000003 of entity 'sun20i-csi-bridge' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test TIME32/64: OK
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF (no poll): OK
	test DMABUF (select): OK

Total for sun20i-csi device /dev/video4: 61, Succeeded: 61, Failed: 0, Warnings: 0

Nguyen Minh Tien (3):
  dt-bindings: media: Add Allwinner D1 CSIC
  media: sunxi: Add support for the D1 CSIC
  riscv: dts: allwinner: d1s-t113: Add the CSIC node

 .../media/allwinner,sun20i-d1-csi.yaml        |  111 ++
 MAINTAINERS                                   |    8 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   31 +
 drivers/media/platform/sunxi/Kconfig          |    1 +
 drivers/media/platform/sunxi/Makefile         |    1 +
 .../media/platform/sunxi/sun20i-csi/Kconfig   |   17 +
 .../media/platform/sunxi/sun20i-csi/Makefile  |    4 +
 .../platform/sunxi/sun20i-csi/sun20i_csi.c    | 1357 +++++++++++++++++
 8 files changed, 1530 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/sun20i_csi.c


base-commit: 5f21cd9a4ae4a891b273178b40e0e9eb5b9ac650
-- 
2.34.1


