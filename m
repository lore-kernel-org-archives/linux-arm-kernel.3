Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb3yq1vtfACEwe75yrbB1CPQfwdI7baxuA1mRi57je4=; b=1ddHPUCUTkhX/IgaSYVRfCniGp
	lHVXpc/ajT/0D5XLhDg7krAbUKK8gk0sd2hnxNRZoHaoORFdyp3HSDYjs5j4iqTkQsk+9X1DvqGWe
	WP30urVdwASfNWsovvKTE/EVrK1bwRe32j208hO3SYEgg9ZtUSRDGTXRaMMC7aoAnLnIGikX8Fwv4
	He0y+k1U5JnqKsfNeRvDxQL9yBp1l8Ewn6kKhKqDDwo4/zswZfLdP69jkJf7XOSnnSBkI+Rzcj/bL
	AuvcBuLoDHMTO06vjaReS2tK76Giwd54TrLhqlGAoZxJ+0uVurGQO/qymIWlk13JQHzO4NFkuxFW9
	zOSYGq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrJx-0000000HHUD-0RAR;
	Mon, 05 Oct 2026 22:38:09 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrJt-0000000HHTd-33az
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:38:07 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dde81a6820so1902397eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239884; x=1791844684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xb3yq1vtfACEwe75yrbB1CPQfwdI7baxuA1mRi57je4=;
        b=VVg+lA/lbPHOojej+STRAZv4gkfxV96J7BjuMcS2uyyZOrHWpGpPSJ7D5aCW8GyMiK
         yXykUROKvrQSdzPiPsO4hSc5Jubc2ah7txncTbOAudsxOONyR4QIESW8+A0z5bWZ6TE6
         zsBUcqAlXlkI8MvvZ3dTGWat1qo9DMLDK4yZ5Ipjr4xEX6gDB1Q+0KxMGTmq1ol6ZAlJ
         jcWqyT5MhaTd46qlTiRAXQDuP/pSePfSdYXyIQ4eyUBDzFD4smIEQRloOzb7mdmAyhz1
         6WtnU4xc078OVLy0ycOpu2dUpRSU5UrzSkFlN4bwN5u4h0rGtfM5NMhPwp1Vw7KcH9oH
         6kBA==
X-Forwarded-Encrypted: i=1; AKwUvByCnajJYTmNHQ1OcEe7Fy/iA10e7L7cVzg0MMN6vOri61BPoaBaq06EPgLjB2slczkFZgTtvJKybtZ+1g7SOjuA@lists.infradead.org
X-Gm-Message-State: AFuF++lvfGKOsB+QaK+1LkSRC5D1cr7XJjmtIe8P/sh3SodaLlh5K6b4
	WEKFa1ROF3GZ1FGki7br0UlPFvlyVsZLqCK7VlcBU2+EV3xpKAIq57jAmGn3pYnW
X-Gm-Gg: AYBFou2V8SBJk/l0NkhFadZKNUjwrlwfzXWQcaggw2ByPsuCVwuCbOpEeGx4/PDwSaQ
	0YxX9Qd77D8z+4/9L/PVeCB+ubxEThTvvN5nQRc8ZKSLhEIalDXDtj+PAvahuRqpgaanTy6QNLR
	b9Y74CA8pKG4H11bkFVzFlx4ZgXUOzawtNYS7sG17O5ZyMu3A+aq8JekQvbwbDQByrJpt6RYV8j
	N7yI4jWB3o94j/uqkVaInk4tm+J8ZD6JCGnBcTEgbUEew9IEZcfqtbqsdwhszMpwQuEuf/8eBB4
	NmzJZJppP/vlIb2t0fC4XiuejIM6iNwBOAUeoTtz1Wym/W4fZ4Bq3tjq9BrsifaGgpOV/UIWLkq
	Ul1AQw9tavOAwWNuALWO9+4ASEgDZXj3r+wi94PejPVxmusShCzdjCaOnaUoxnlb4gsCnDeBiNK
	NWF506Js5PD+OVVPLCSVGnja6JZSPcgHb1n3ztK2IM96rdeLBlsbEp4zGyzxsPPnK+39ZMniBlr
	ZNYLOIVzRejM6GSqLMJe/6NUzC+wp6DrneyPp0di22/fC24oJf+kduVfkjgTF2lqoJKd+zwBTMk
	lCSz2t6MhbNEUi+CItH4uppgClO5XyF/jRw6EUF+QZK/WQ==
X-Received: by 2002:a05:6820:a287:20b0:6e1:f7f7:532c with SMTP id 006d021491bc7-6e1f7f75ad3mr3441043eaf.40.1791239884329;
        Mon, 05 Oct 2026 15:38:04 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e4c276886bsm676426eaf.4.2026.10.05.15.38.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 15:38:04 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8258ac98bc2so1689350a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7ZYAluQULVit09cilE6tKWRkMzFpqPVVYEIB44fTld5WcyKXMI0DeivE6BfHbnebPQko8DVM27TMDzoqJX1kP@lists.infradead.org
X-Received: by 2002:a05:6820:2226:b0:6de:1788:c3af with SMTP id
 006d021491bc7-6e09db9eae9mr7389349eaf.43.1791239415075; Mon, 05 Oct 2026
 15:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 5 Oct 2026 18:29:38 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
X-Gm-Features: AclHuK9yFwOzqsj_JcPTvXfeG7bJIFye1-m4CrTXTFUfDaK1QknzW0JvhVf1j8M
Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] media: apple: add avd driver
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_153805_779540_1A12099D 
X-CRM114-Status: GOOD (  35.92  )
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

On Sat, Sep 26, 2026 at 9:16=E2=80=AFAM Sofus Forstreuter <sofus.c@icloud.c=
om> wrote:
>
> Hi,
>
> This series enables hardware video decoding on Apple Silicon M1, M2 and
> M3 SoCs. It adds support for all the codecs AVD (Apple Video Decoder)
> supports, which is H264, H265, VP9 and AV1 (only on M3+).
>
> The AVD is a bit unique both as a video decoder and an IP block on Apple
> Silicon SoCs. Instead of following the normal "a register for each
> parameter", AVD is programmed through one single register. This means
> the order of the writes are important, but its also important to ensure
> we dont write faster than the hardware can process. To solve this, we
> use the included Cortex-M3 co-processor. The CM3 accepts unsigned code,
> which we take advantage off [1].
> The driver prepares the instructions and writes them into segments,
> which are submitted to the CM3. The CM3 then programs the hardware and
> notifies the AP when the job is done or if an error occurred.
>
> The driver implements the V4L2 M2M stateless decoder API. The driver's
> framework is based very heavy on rkvdecs driver. It therefore comes as
> no suprise that `v4l2-compliance` reports no errors:
> Total for avd device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings:=
 0
>
> The fluster scores are:
> JVT-AVC_V1: 77/135
> JVT-FR-EXT: 42/69
> VP9-TEST-VECTORS: 216/305
> VP9-TEST-VECTORS-HIGH: 1/6
> JCT-VC-HEVC_V1: 143/147
> AV1-TEST-VECTORS: 238/242
>
> Since not all unsupported H264 streams are rejected, the scores
> depend on the reset working, this only works with a patch to the
> apple-dart driver so that the IOMMU attach/detach trick works.
>
> All codecs support 4:2:2, 4:2:0, in 10 and 8 bit. By default, AVD
> outputs in NV12, NV16, P010 and P210. Support for 4:4:4 and 12 bit
> formats has not been added yet.
>
> Internally the AVD uses an Apple specific compressed and tiled format
> called Interchange to store reference image data. This is stored after
> image data across all codecs. Apple Interchange is used for sharing
> buffers with other hardware blocks (GPU, display controller), support
> for this is on its way [2].
> The V4L2 pixel formats have been added to help with calculating sizes.
>
> This driver has been tested on most Apple Silicon SoCs in our downstream
> tree [3]. Its expected this driver will work on M4, M5, M6 and the Neo,
> with firmware already being written for all except the M6 SoCs [4].
>
> The groundwork for this was laid many years ago by Jamie, R and Eileen,
> who through a combined effort managed to reverse engineer many core
> parts of the AVD block.
> This driver would not have been possible without the work done by
> Eileen, who wrote initial support for H264, H265, VP9 and excellent
> tooling [5], allowing me to reverse engineer AV1 and make the driver
> conformant.
>
> [1] https://github.com/sofus13/avd-fw/tree/avd-next-fw
> [2] https://patch.msgid.link/20260917-apple-interchange-modifier-v1-1-875=
294689c48@gmail.com
> [3] https://github.com/AsahiLinux/linux
> [4] https://github.com/AsahiLinux/avd-fw
> [5] https://github.com/eiln/avd/tree/main
>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
> Changes in v2:
> - Patch order
> - Fixed dt-bindings by constraining all properties
> - Fixed dts, add interrupts, iommus and regs. Drop labels, fix names
> - Add Apple Interchange format
> - Add more av1 and vp9 validation to v4l2-ctrls
> - Validate more codec parameters
> - Use the new CM3 firmware (drop avd-hw, drop submission loops)
> - Updated cover to reflect changes
> - Link to v1: https://patch.msgid.link/20260918-avd-v1-0-49977931f455@icl=
oud.com
>
> To: Sven Peter <sven@kernel.org>
> To: Janne Grunau <j@jannau.net>
> To: Neal Gompa <neal@gompa.dev>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sofus Forstreuter <sofus.c@icloud.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
>
> ---
> Sofus Forstreuter (17):
>       dt-bindings: media: add apple,avd
>       media: v4l2: Add P210 pixel format
>       media: v4l2: Add Apple interchange pixel formats
>       media: v4l2-ctrls: validate av1 tile info
>       media: v4l2-ctrls: validate vp9 tile_rows_log2
>       media: apple: add avd driver
>       media: apple: avd: add h264 support
>       media: apple: avd: add vp9 support
>       media: apple: avd: add hevc support
>       media: apple: avd: add av1 support
>       arm64: dts: apple: t8103: add avd nodes
>       arm64: dts: apple: t8112: add avd nodes
>       arm64: dts: apple: t8122: add avd nodes
>       arm64: dts: apple: t600x: add avd nodes
>       arm64: dts: apple: t602x: add avd nodes
>       arm64: dts: apple: t6030: add avd nodes
>       arm64: dts: apple: t6031: add avd nodes
>
>  .../devicetree/bindings/media/apple,avd.yaml       |  127 +
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   14 +-
>  MAINTAINERS                                        |    2 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   32 +
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/apple/Kconfig               |    5 +
>  drivers/media/platform/apple/Makefile              |    3 +
>  drivers/media/platform/apple/avd/Kconfig           |   18 +
>  drivers/media/platform/apple/avd/Makefile          |    5 +
>  .../media/platform/apple/avd/avd-av1-entropymode.c | 4698 ++++++++++++++=
++++++
>  .../media/platform/apple/avd/avd-av1-entropymode.h |  284 ++
>  drivers/media/platform/apple/avd/avd-av1.c         | 1432 ++++++
>  drivers/media/platform/apple/avd/avd-drv.c         |  776 ++++
>  drivers/media/platform/apple/avd/avd-h264.c        |  862 ++++
>  drivers/media/platform/apple/avd/avd-hevc.c        | 1340 ++++++
>  drivers/media/platform/apple/avd/avd-inst.h        |  210 +
>  drivers/media/platform/apple/avd/avd-v4l2.c        |  992 +++++
>  drivers/media/platform/apple/avd/avd-vp9.c         | 1054 +++++
>  drivers/media/platform/apple/avd/avd.h             |  299 ++
>  drivers/media/v4l2-core/v4l2-common.c              |    8 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |   17 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +
>  include/uapi/linux/v4l2-controls.h                 |    2 +-
>  include/uapi/linux/videodev2.h                     |    9 +
>  31 files changed, 12386 insertions(+), 4 deletions(-)
> ---
> base-commit: 4efa625593e1e9c76346232413997556dea1d89f
> change-id: 20260917-avd-7ee5474b468c
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

