Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8342CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdvN3hos4ZfIVGUNdDwdDNs5CgvOMtRQ9WBj592DhBk=; b=dx0FiSuGCoELWFt7+xJItnMBVb
	KGibfgEDHM8TEQfeEmGxgEjZrLmj8ePH8YkDoUNN1Knra2KR8LqZf4TP4+pz/xeTna2EJQABdOyLt
	WUco6X7N9ucQmGYAzIEkO1y8MraU0VbzcDf2YowjUc/Z+AsGo6BtIlcocZT2AwurF85kfDuhbHfjl
	PKeAeuCM/Ii9TbvgSAqDUQBKFWhC5uHFQzVMCfFyIifXS32rfShn17kMGq5cVyDzELm/LyJBMQlgh
	x4T1r8VQnSsWuUEhQRb43g8MJJHcXV/gh9owIYSHH9N12BfIcEv73WFfo9h28EZzIAS9DUS11oLXq
	YX8WbirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullWv-0000000APkF-1iOd;
	Tue, 12 Aug 2025 09:42:53 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljJh-0000000A6T8-3ZGP;
	Tue, 12 Aug 2025 07:21:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-af66f444488so730266066b.0;
        Tue, 12 Aug 2025 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754983264; x=1755588064; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdvN3hos4ZfIVGUNdDwdDNs5CgvOMtRQ9WBj592DhBk=;
        b=Bm4Tcx710M5MQX6aj9G1z6UzRftUkQDhB73JvsIiLSq1PUO4EjQry4hYUQaedxjgTS
         BwF7jPD2Jmb20heQHRFcJKwSEQMCH7gGa6UxWQRggK+ejCbmxTYhVUDB/zQ6RQAB8/qr
         cfjWJZIYXC8KRSqw7KIy8d2EmK9CgRa9DelhJhXj9NBf/K40N3xYBswmol9JFYlPtNH1
         8Z33zZoMCtmc8tYrGoKImSz1MtEgLyZU4HICIdtvYvOU7rox+8z471kyQN2TKxQhHDax
         UW2HyxwaqBMJ8ShupMNGo+mX7sYZN1ELGxz1GEbGqONrFkWA1K+dK51hOrv2RWEPyuw2
         iOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754983264; x=1755588064;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdvN3hos4ZfIVGUNdDwdDNs5CgvOMtRQ9WBj592DhBk=;
        b=KDk1+GRI9f9L+udZALvn40XYjOzsKlXpnk8KFKakbkTDXgjxa7RyrmKw1l06w/fN8Y
         sRK/GNsDPjzfR2DjTjqGdZ9vCQYkuZGiQfa/K2NmXJfaaGM566zIhZEsa+B8lOxY8FGQ
         Bs1FDm83dyqJ8zuVq+l8Ph5hXP0b7rTQMkgWhrU5js2Yumk0r/uUG2an2n3oqkxyqYJx
         54PXPARVLAlhCz2IjS5rVt0yKRJWF8b2tZ/Y9/SdNYEKY5LsQX3TbP/nbMkYCMmnY6T1
         VUy+Uiy1IcEg/P3KrXpB3Obzq3Mvvc+NnUb9V8Oq7LMtzCIsLfnyWsyHJVidPXaKxDCN
         fRRw==
X-Forwarded-Encrypted: i=1; AJvYcCVqMsS/zIxSfw3/f9onuSZXdb6pKo3VSGUDuVwq4Dj4Ira1sHOvMPZAQHua7GVtKfJM89k8jjQy0VFhLkWVnKA=@lists.infradead.org, AJvYcCWQsscErIWDFKlaxbENyjII6dLfBq9rmuAe55h73dgITC0yjU+cyLByEwg3n3JHCcMsg09noq4fwFdHYIrAMgo2@lists.infradead.org
X-Gm-Message-State: AOJu0YwpqWsLeSBNoDIVE5VIni/aZuA+QbvuYAeIavHj4XyjqZecNFmn
	zGaFE0HuNDiM3ETgckLcW2OfKQVs9uN5W4Nfy/ZTzoOy2NwuV3sV9nOd
X-Gm-Gg: ASbGnctL+/FAKfRqq7XsaIWCSqCiZtWpgO67bBsmVpI8zN6DCfiiMeQ5MfVizVaSmwT
	tUT5cTdmZEHnkWhmkJiGfA63TermzVxAehEFUdDd3AaFijEBo8aKVTYH5bBbzIKYvEF7AAMrSyA
	4zdQpsfJzeGxPbNk+2yNLjpudi0kpOIlhh9JuXxO98uWZTXyIK0OEaT0ZqiJh6HmQg6sybxCKlW
	6xAvFYE5HfCZ9RLrxR9NRhk2iwwKU0TV3aWCnEuFdNP4KWhAaLZXOn7gHv0WRMY+WJm3RRxAQy5
	AyuLKFb7J7RzVr7/Yi8iYdKo6frc0n+QAA44EsAA9OAr98UaUAKJiDvfATVHNY4t5xHh4P5DQrE
	haAtKwDfeyXJYioIU2TsJjpUJwHi8PDWafMX7Hf4180+S0shYI1+sqnasZL6FcRQxO7NGHrSW7d
	OAOXu9vT1hbgo=
X-Google-Smtp-Source: AGHT+IEEEuwo1oGl7QN9YdJIWFLJDjjJKJXuGCx345I6XSM6Vd9H1McXJijKZIxcZ5MMMWp2gsEhrQ==
X-Received: by 2002:a17:907:787:b0:af9:2e2a:64a8 with SMTP id a640c23a62f3a-af9c6403ac8mr1625756866b.25.1754983263453;
        Tue, 12 Aug 2025 00:21:03 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm2131936566b.97.2025.08.12.00.21.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:21:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
Date: Tue, 12 Aug 2025 09:20:51 +0200
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3786B8EA-9796-40A9-8EEF-16CFAEE27766@gmail.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_002105_890524_C7347EAE 
X-CRM114-Status: GOOD (  21.83  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 8 sie 2025, o godz. 22:03:
>=20
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.
>=20
> As there is a considerable part of the code that can be shared with =
the
> already supported rkvdec decoder driver, the support for these =
variants
> is added here rather than writing a new driver.
>=20
> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> controls for HEVC [1].
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
>=20
> This patch set also depends on the preparation patch set sent earlier =
[4]
> as well as the iommu restore fix [5] (already merged in linux-media) =
and
> Nicolas Frattaroli's bitmap patch [6] to support setting registers =
that
> uses upper 16 bits as masks.
>=20
> [1]: =
https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@collabo=
ra.com/
> [2]: =
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> [3]: https://gitlab.collabora.com/detlev/ffmpeg
> [4]: =
https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabo=
ra.com/
> [5]: =
https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@=
collabora.com/
> [6]: =
https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@coll=
abora.com/
>=20
> Changes since v1:
> - Add parsing of the short and long term ref frame sets from the new =
v4l2
>   controls
> - Add RPS cache to avoid parsing the same data again
> - Fix HEVC pixel formats selection
> - Fix multiple indentation errors
>=20
> Detlev Casanova (12):
>  media: rkvdec: Switch to using structs instead of writel
>  media: rkvdec: Move cabac table to its own source file
>  media: rkvdec: Use structs to represent the HW RPS
>  media: rkvdec: Move h264 functions to common file
>  media: rkvdec: Add per variant configuration
>  media: rkvdec: Add RCB and SRAM support
>  media: rkvdec: Support per-variant interrupt handler
>  media: rkvdec: Enable all clocks without naming them
>  media: rkvdec: Add H264 support for the VDPU381 variant
>  media: rkvdec: Add H264 support for the VDPU383 variant
>  media: rkvdec: Add HEVC support for the VDPU381 variant
>  media: rkvdec: Add HEVC support for the VDPU383 variant
>=20
> ..

Detlev,

I give run for this series on rk3576 and rk3588 devices (various SBC =
boards) on mainline 6.16 kernel.
Userspace was: KODI, MythTV and mpv.
All are using ffmpeg - but without [3] applied*.
Tested video rendering pipelines was: EGL DAMBuf and DRM direct to plane

Happy to report:
-all h264 content** i tested was decoded ok.
-on some rk3576 h264 rendering manifest known "green lines" issue*** =20
-hevc content**** was also decoded ok except samples requiring long =
sps/rps hinting from userspace (from ffmpeg in my case)


* - it looks (to me) your's ffmpeg branch changes are incompatible with =
yours rkvdec code (i.e. ffmpeg refers to =
V4L2_HEVC_EXT_SPS_RPS_FLAG_INTER_REF_PIC_SET_PRED but kernel v2 driver =
don't have it)

**  - i'm referring to multiple h.264 movies and TV HD channels

*** - issue of thin green lines we discussed on rockchip IRC channel

**** - as my ffmpeg7.1 has not applied newly introduced =
hevc_ext_sps_[ls]t_rps v4l2
controls for HEVC (due *) - some content is not decoded properly.

If any extra tests can be helpful - i'' be more that happy to do so!

br=20


