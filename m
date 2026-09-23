Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F937C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=; b=SxuhBjXlDX1ycrzETqy8ieUL0T
	vghnEcH/pLxt/t0p1OgEzzyFz0ziPIZnrXQLboxUVfwWqrLMczTid9nqs3qid+TyvufBXwSJAchW+
	G9sQptRqOVntkRpIFuikSfLmDoGD1/ndrtXKTyIlg2SdDGgBFhjlcHnKf1Q8CP421p28bGcdCM1Ex
	L+VZhzJTYTnPoiTsqno1AzG17anz0WmyitW++dzVjKRZyLw0W/oHbZNd2ObgnHdLcSbWt0Eeie4Tb
	FECSV3ZskgrfRTvYSqyXhGExlu52dy4sELcKTOL2jReeRiQFALamziPx0cpfjlCngRWSaUbVFCJUT
	a429b0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Loa-00000008D10-1Sdx;
	Wed, 23 Sep 2026 12:11:08 +0000
Received: from mail-dy2-x1a.google.com ([2607:f8b0:4864:36::1a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LoX-00000008D0P-2ZeF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:11:07 +0000
Received: by mail-dy2-x1a.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so830521eec.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165465; cv=none;
        d=google.com; s=arc-20260327;
        b=s6krpOMMNjrExPY6NU5STWQjTNKd2SUzRmMGLZKKdK6kadqIGFyRdthdGMnmf+KHU/
         qRPB+bc9JrZCqlz85EXkzaFwfiy4GPJiEP9JsJ/YZ4yYKbQRBWAJzT7mtrN+0Kwb+4Oe
         rtqDQO85SoKfJCUinIEnLcFQrjRfCA6eJLXsf8Yoo2OHaossYtitUluf/sZKNkln8Tjh
         hm3HOfxc8FEWcORsqT2yXKCh5AqwMy/avSv0KGUuzNpsy2yQR8JxO+AKanT1V3g4A3NH
         Yo3pC4WSrYCtb7Ya1fo2JuY2OSiM4EH7IuETRucu5Sf8QS0FOnvPsToCujZ/fBt6C+vo
         ck/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        fh=sNNSdzsWbAzou1PWIlnHxuAkjPUlDIfYSGnmEGu4S6s=;
        b=kun22RugzdlV8hAZHpG3AXXTZkmVVHvr6PHXfl0vjYqzVUaiQkYtC8N/NeXb9XLJ+O
         tkbQknrKEBm+msr4XYINJlnAL0HsrbBnXn05SC3Z1EkfhcP3oGtJ4ZiHeQfPoH/OKhv2
         VYdYz3WzNXL4wrBbqkmi6csf7ySGCTVQdD5849EBjZrCHeA3TN0stDDkX8Kh1pBvzo/o
         z4u5aamuBHTfZDbmEPp7eV17KNEGyv8LBRKRCBvIXxJbOy0pXwVdWLv/ZKPQg0xe7Bwk
         +NLOaPPNGKZ0c4UTdwRJPmfeUh8V6JmKlJdw9MVY0oHFe3H2X2bAZxgxzCAq4PPfps01
         eWow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790165465; x=1790770265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=J2BnKaW6BF4VT8FAXyWuFqjcJbxEy6gbfWgQTKYNnLvuaDd8cmkqyEVe6L5crEOroX
         saRny9gCDwJzYozjhtWFBszuDyKh184/8JTeoM+L5Pdph0Yoq9NRipChbLOdIvGIrKte
         xgY6aECcqj1Oa05iN+vJNoTiSMJOOVh/d0pQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165465; x=1790770265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=vcAQ9U6OxHWtlwzeaYgp4zdKYHu7K8vcPPhbSXEWaOOiQsdZcBEWntvCJJVMKI33nD
         9DgNwNPMEnaSpd76OdKdKDduVcAWJCWtqgH9AWF8bA6bsvcG+8juEiUsP93u5lOGi4h1
         6R3I5jpy6VVHbGCR3ZexmvCs3x+TiOAeHcXiOYXIzkj6vsR/M/aeUeL1dGPCq+Kx3dl4
         7qzAc0e21UMR7dWAUzxfFZIbV0CmDJiAiytVlDAFUHWgYLzW/IyRSrmuHlZWwTi2bije
         /aSWdL5podo7B8Wlk4V8pwTrLTzKhWzyzKKNJ3mrtrJ/6v5py0bopa3KA9UbJZ60xPeW
         Xzxw==
X-Forwarded-Encrypted: i=1; AKwUvBxtwKFjBRbjTasL7f7BArmCv6lPigkKczvUXxnQeZ7cFKGLDXzYXup0WKIXn6dWWjJchiUdIrOWBPxO1rSzRtfU@lists.infradead.org
X-Gm-Message-State: AFuF++lUINs4hecjc/RClRZQvgGI/6Er7SJ8BvLLxBDjX9TsfUEAu+dD
	zNdMjaecXsNdDoRy0mtUkQ2koEK+8bvH8cuDQb3QkA4ityAdQMWonvH6TnE9qRUH/to0BLq5ouy
	nmQVxwGgEZHizIACJ0KDpVCuo8+XFZa2FCgpMhNd7pg==
X-Gm-Gg: AYBFou3Q49wjs77Pij2hnlaSx9fNA6O/gSlH9UwKvOEWiENBQt3j7w5gXBkSKaiNhli
	gnAF/IyYDpjLjwoHq20O5Ngv+GhybNxBwDA6QOnTjlKyOSGv4a3hG005sw12CZzA4udYqc2bhhM
	6nwr8WeNPFwtxJ25Z+f6MFhQWHUz00Dq/EbuKqHDr/qzlET2FeO1dWlFVWruKEb+LCITMiIV/JE
	sU5vnbTjafxB7dDH14sxYBg9WCv5UkwBDYCseXBZy5ww8tE9knZIocl+7mGut1QtSj8tpmBau5k
	qHEu12dxwmdJyYbPi97WRkAq7W0CBEAQv3cCGvdS0TXkyK4chTpTeTon2mnjHa7zOaH2Cw83Iu9
	ukfEWrO8O
X-Received: by 2002:a05:7300:c7c8:b0:315:9d54:6bf with SMTP id
 5a478bee46e88-33ea4d875damr2193402eec.10.1790165464415; Wed, 23 Sep 2026
 05:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
In-Reply-To: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Sep 2026 14:10:52 +0200
X-Gm-Features: AclHuK-84lPkb8p5nYwdkesZrMKYeKl0UBKC7sQ4h-YVRpCrvvaQQCitxdpuwrs
Message-ID: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_051105_656077_AB93EFDB 
X-CRM114-Status: GOOD (  26.26  )
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

Hi

On Fri, May 22, 2026 at 4:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul,
>
> Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> > This series introduces support for the V4L2 H.264 stateless encode uAPI=
,
> > core and support in the hantro driver for the Verisilicon VC8000E.
> >
> > While this is a first version that will likely need some level of rewor=
k,
> > it is already usable for most common use-cases and supports constant
> > bitrate rate-control.
> >
> > A GStreamer tree can be used to test the series at:
> > https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> > And an example pipeline would look like:
> > gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-=
raw,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D8=
000000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
> >
> > Note that documentation for the new uAPI is intentionally left out of
> > this series since it has not yet received approval.
>
> The unfortunate part is that the spec is important for the actual review =
and
> interops analyses. That omission qualify this submission as RFC from my p=
oint of
> view. Any chances you can reply to this cover filling the blank for the f=
ew
> important bit (something similar but non spec style of:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-statel=
ess-decoder.html#initialization
>
> - Querying capabilities
> - Initialization
> - Encoding
> - Dynamic Resolution Changes**
>
> The other sections are just going to be the same imho. The ** for the DRC=
 is
> because H.264 is not that complicated, its intra only, so you can reset t=
he
> encoder (use the drain flow). So that's probably something for future us
> (VP9/AV1). Adding your view on these topics (or just matching what you ha=
ve
> implemented) will make review more constructive.
>
> cheers,
> Nicolas
>
> >
> > Marco Felsch (2):
> >   media: hantro: use hantro_decoded_buffer only for dst_vq
> >   arm64: dts: imx8mp: add VC8000E encoder node
> >
> > Paul Kocialkowski (12):
> >   media: h264: Add a more generic reflist builder init
> >   media: uapi: Add H.264 stateless encode support
> >   media: h264: Add SPS video definitions
> >   media: h264: Add stateless encode core
> >   media: h264: Add stateless encode rbsp
> >   media: h264: Add stateless encode reference management
> >   media: h264: Add stateless encode rate control
> >   media: verisilicon: Report default pixel coding for non-JPEG and fix =
JPEG case
> >   media: verisilicon: Cancel job with runtime pm put/clk disable on fai=
lure
> >   media: verisilicon: Add common encoder parm and frameintervals ioctls
> >   media: verisilicon: Add support for the VC8000E H.264 encoder
> >   media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
> >
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
> >  drivers/media/platform/verisilicon/Kconfig    |    1 +
> >  drivers/media/platform/verisilicon/Makefile   |    2 +
> >  drivers/media/platform/verisilicon/hantro.h   |   17 +
> >  .../media/platform/verisilicon/hantro_drv.c   |  180 +-
> >  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
> >  .../media/platform/verisilicon/hantro_hw.h    |   28 +
> >  .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
> >  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
> >  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
> >  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
> >  .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
> >  drivers/media/v4l2-core/Kconfig               |    4 +
> >  drivers/media/v4l2-core/Makefile              |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
> >  drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
> >  drivers/media/v4l2-core/v4l2-h264.c           |   69 +
> >  include/media/v4l2-ctrls.h                    |    2 +
> >  include/media/v4l2-h264-enc-rbsp.h            |   72 +
> >  include/media/v4l2-h264-enc-rc.h              |  108 +
> >  include/media/v4l2-h264-enc.h                 |  135 ++
> >  include/media/v4l2-h264.h                     |  146 ++
> >  include/uapi/linux/v4l2-controls.h            |   33 +
> >  include/uapi/linux/videodev2.h                |    1 +
> >  27 files changed, 7231 insertions(+), 21 deletions(-)
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h=
264_enc.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_r=
egs.h
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> >  create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> >  create mode 100644 include/media/v4l2-h264-enc-rc.h
> >  create mode 100644 include/media/v4l2-h264-enc.h

I tested on px30 and achieved working H.264 encoding with some small change=
s

Michael

