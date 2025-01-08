Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C14E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haQhNOyjQBZ9zsD++Rn1rcul3M/0sGJadNICjhHnplk=; b=e+dClojvrS8xkwguKsB+eOSVRr
	woePMjCTaCOhP+xYvV+JmO4daN0vLbNyIDbvriPPxI1mA4u5dCJ0s7u6qAYgsCGIcUIpD4JnfKeiH
	Yt1nGazjNs4n6r5ncmNyCPfgbEXb/7gXVDhW6uXLUoMZ+YZ5BBi23Zdw6rQMSQGVZrGTG3/FX72gz
	EVipou4GegkfggAcL7F5Hpum42Zgcu8AsKFpNct+vy6WQdt2u/g8x7qWf8plNoGULQqvRD7c8YKwK
	BQQFczBx7xJdMd/AiScnwXoxx9iqEVzPaFHajuXRSnt5LAoZpYaeBRrPlBGxU7u5uyllGdnI48Pjr
	IO/E+CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSzc-00000007upW-1Hg2;
	Wed, 08 Jan 2025 10:08:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSje-00000007sFT-3sWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:52:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so171692785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1736329941; x=1736934741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=haQhNOyjQBZ9zsD++Rn1rcul3M/0sGJadNICjhHnplk=;
        b=wcwtdsWv8b/oxrb3lhC3C/xDVOmrgAxk3oE7TMozV5c+3gUCGltwo1Agwl+1Qs4MII
         y1eDfFw1MdKNxpPlg3b16vqHLBL9wWoyyuBAIE2IXzRE1q++PLCDmIsZ2bexRD4u/VIu
         O6xv09KRBi6vDL3IJGw2o+PkXeKxqWEk1N0p1l1jq2103IqQgqz8kedhcAnzHZ0XO9nT
         rWnCSkJfQOlWm7+xe267wsvtRKR4N8rYNtBTEdYryJ/E+WbpFDXiRIwJf/GgU2K/k/06
         Cor6HOJXEGb3keIVQaHFQ0nh/qpfeUIpn6ZIrFOeSMDqRkFdTWKTIL1TcYn5Oq48FRax
         h4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329941; x=1736934741;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haQhNOyjQBZ9zsD++Rn1rcul3M/0sGJadNICjhHnplk=;
        b=dt3P+JYmhVu7lEvumfabeatxGkoVCdPjVzqHdIxRPVsPy0zIfgS7Px914xrS1S9QrK
         3dqrSLpm6aI13AwR9aozt8Dsmm/UrXBo7GngW86Ob07c/SO1eGuwG62YwK9Zetk+7Ch7
         BWhzYvMqf/ich1/sTijXvBzF9C5rBJu/avxiXguDW+4nE1pz5TQbU0tANMK10bEth605
         EUiDrRESMYZYp2O0tyWi8oC44hA6Fh8+pTg737Yw3QM8bKgVFSXNTzkXf4NP4UAkE3Ay
         Yra+BTD4l+gUUJ8ZaKWPuG9+6ow1CjTJLWe+0/nu3MY0kirQi9SUZqTW56+AHhFfG2mE
         ffig==
X-Forwarded-Encrypted: i=1; AJvYcCXwOI9LhVBAAssUGh89P0CrvFhdZMIGwmjHifDpPuc8a/XeKcwekzDuuz11K8quNcN8UMV/lwyoZkpSgtwj9+kr@lists.infradead.org
X-Gm-Message-State: AOJu0YzBSYoME+H8aaR+TnVbCPOfX3BRAdyQX4V1HHyVQhSYFJZbz4pI
	Prn7PbG7WBCrHHJAiRgZbBuX+H97tSeUNKkf572Coph8ExhA9+j2sKE9HdIPEr4=
X-Gm-Gg: ASbGncuQSkInjVeoaQbGYbYSfstgXIQl0CvSuAiGO1qDSefs7JZFX68XIkJoW0DH+Mc
	8fMD5KD/Bp5Ab3cbUMochzyqD7ZoY6bxAsJlXfIGmgXwJCxe6Lf0CyPz1fp8agt4M7dytSPwq1P
	D3IIrrc4j8tZ7TVtupgXLAc5ojaX3OZZwGGETnM3YVenTXZK5stu3aY/lSVEbO/oZAbOkPHHWyu
	hgoyv/SzKZBg9JZ7So4tsZ0MvSxXi+KyX+iTh+7VpVf3v1hEQLucGE+ewea+I1GB/71d/EgMCOx
	+KsfRhfldxLfHYmmsqhXp93oFPD1hkJx9obGBXt873/znSl9U3kkPpnaJsDh
X-Google-Smtp-Source: AGHT+IFyzlDBW0vXkH+stkA+DphyFfBet0yVr9hMTLYpxEMOFakvSnErsaOMXQXES69rhJyKcgy6NA==
X-Received: by 2002:a05:600c:46d0:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-436e26f4d53mr17246565e9.31.1736329940775;
        Wed, 08 Jan 2025 01:52:20 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc91456-cmbg20-2-0-cust124.5-4.cable.virginm.net. [86.21.160.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e9a5bbsm14672195e9.44.2025.01.08.01.52.19
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 08 Jan 2025 01:52:20 -0800 (PST)
From: John Cox <jc@kynesim.co.uk>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	 <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Cox <john.cox@raspberypi.com>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
Date: Wed, 08 Jan 2025 09:52:20 +0000
Message-ID: <fnhsnjlvifnma1rqlsm9kqk7ao3bc174ic@4ax.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
In-Reply-To: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015223_024481_E9687FBF 
X-CRM114-Status: GOOD (  34.98  )
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

On Mon, 06 Jan 2025 15:46:51 -0500, you wrote:

>Hi Dave,
>
>Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit=C2=A0:
>> Hi All
>>=20
>> This has been in the pipeline for a while, but I've finally cleaned
>> up our HEVC decoder driver to be in a shape to at least get a first
>> review.
>> John Cox has done almost all of the work under contract to Raspberry
>> Pi, and I'm largely just doing the process of patch curation and
>> sending.
>>=20
>> There are a couple of questions raised in frameworks.
>> The main one is that the codec has 2 independent phases to the decode,
>> CABAC and reconstruction. To keep the decoder operating optimally
>> means that two requests need to be in process at once, whilst the
>> current frameworks don't want to allow as there is an implicit
>> assumption of only a single job being active at once, and
>> completition returns both buffers and releases the media request.
>>=20
>> The OUTPUT queue buffer is finished with and can be returned at the
>> end of phase 1, but the media request is still required for phase 2.
>> The frameworks currently force the driver to be returning both
>> together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
>> would complete the job without returning the buffer as we need,
>> however if the driver has set =
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
>> then we have a WARN in v4l2_m2m_job_finish.
>> Dropping the WARN as this series is currently doing isn't going to be
>> the right answer, but it isn't obvious what the right answer is.
>> Discussion required.
>
>I think part of the manual request completion RFC will be to evaluate =
the impact
>on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not =
support
>interleaved interlaced decoding (only alternate), so they didn't have to
>implement that feature.
>
>Overall, It would be nice to get your feedback on the new manual request
>proposal, which is I believe better then the pin/unpin API you have in =
this
>serie.

Is the effect of the manual complete API different from the pin API? Pin
incs the ref count on the media object to prevent competion,
manaul_complete sets a flag to do the same thing. Or have I missed the
point?

I don't mind what call is used as long as the effect is to be able to
delay media object completion. (In my first veraion of the code I
created a dummy object and attached it to the media object, when I
wanted to unpin I deleted the dummy object - pin was just a cleaner
API.)

The pin API is counted and needs no new structure elements (which is
nice), but manual_complete does give a flag that allows other functions
to know that holding on to the media object whilst releasing OUTPUT is
intentional so can be made to work cleanly with things like
v4l2_m2m_job_finish so is probably the better solution (assuming my
understand of how it works is correct).=20

I'll try to build a version of the code using manual_complete in the
next few days.

Regards

JC

>>=20
>> We also have a need to hold on to the media request for phase 2. John
>> had discussed this with Ezequiel (and others) a couple of years back,
>> and hence suggested a patch that adds media_request_{pin,unpin} to
>> grab references on the media request. Discussion required on that
>> or a better way of handling it.
>>=20
>> I will apologise in advance for sending this V1 just before I head off
>> on the Christmas break, but will respond to things as soon as =
possible.
>
>One thing missing in this summary is how this driver is being validated
>(specially that for this one requires a downstream fork of FFMPEG). To =
this
>report we ask for:
>
>- v4l2-compliance results
>- Fluster conformance tests results [1] and I believe you need [2]
>
>[1]=C2=A0https://github.com/fluendo/fluster
>[2]=C2=A0https://github.com/fluendo/fluster/pull/179
>
>GStreamer support is there in main now, but without the needed software =
video
>converter for you column tiling, we can't use it for that (i.e. only =
works
>through GL or Wayland).
>
>regards,
>Nicolas
>
>>=20
>> Thanks
>>   Dave
>>=20
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>> Dave Stevenson (4):
>>       docs: uapi: media: Document Raspberry Pi NV12 column format
>>       media: ioctl: Add pixel formats NV12MT_COL128 and =
NV12MT_10_COL128
>>       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC=
 decoder
>>       arm: dts: bcm2711-rpi: Add HEVC decoder node
>>=20
>> Ezequiel Garcia (1):
>>       RFC: media: Add media_request_{pin,unpin} API
>>=20
>> John Cox (2):
>>       media: platform: Add Raspberry Pi HEVC decoder driver
>>       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
>>=20
>>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
>>  MAINTAINERS                                        |   10 +
>>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
>>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>>  drivers/media/mc/mc-request.c                      |   35 +
>>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 =
++++++++++++++++++++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>>  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
>>  include/media/media-request.h                      |   12 +
>>  include/uapi/linux/videodev2.h                     |    5 +
>>  21 files changed, 4880 insertions(+), 7 deletions(-)
>> ---
>> base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
>> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
>>=20
>> Best regards,

