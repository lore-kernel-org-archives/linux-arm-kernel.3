Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65261C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=; b=O8vqBXmwoknfLDtjQGUEjnhGbM
	pbrb52Bebz7+rcHF80npXnH6DOQUjo5h7SMLd4V4M+qTTZOqytc6b2nQccaToAguiV4W0oUmAvrUl
	+mMWGxv+t4JAn3FWqHUItnc4xOJIyYqNLVTZIWmdHd1tFoCjhhQTf9RGtulxBZDmkX3DVL5wIV515
	CZWaLJPZOoGMSBpN5nRrEe9a23fR7yBKvc5DpAaVLbtPa7EMiuOc7Pa1w5HYryTOmKsboNHaVltQj
	E63JIxN84Uqs9gTDHxVgCna1DtiVrFYi4L6Q6uTZL9C+vBD2T8XR86tkkEZao81PolDRm+ue4wvqq
	D9Dk3bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxT8-00000008kKr-0bhg;
	Mon, 19 May 2025 10:11:38 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxOB-00000008jUZ-1Rqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:06:33 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-70cb1a09848so18557367b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747649190; x=1748253990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
        b=ibQtn0bP1AGoqZ7xec9oBD5IR3GtLJP4TbFRvVQg4h6w/EPLyAlmstn6rEohindzUa
         X400EJ4kfi9OBvVnEOTrKzZbq0DmKRR3qY4zBZ6MOyOxSlHpKnG/Rq1URnrsnP8kuO7M
         jK0za0Hh/3DHxq9PPxdDp7G9m+yIO7sosLeDCO23OEHUIJqzmYU61SrIEUZuEuLUPmOx
         CCrVGBNzhkCc4hXPAYe6GKXHVYb+0EbsmdNMKEGRZ5gkCpW4Mgi09Q03BcRfb3BVEkeR
         zKtVvLXgXmVYxG9CdntQDdikomscApFKkuw1PWTef3TXJ2j+PVUs1kePI7rYgA9YGXV2
         S1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649190; x=1748253990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
        b=qoPnvJWHgnLadOHyGxzsECIBQSemxPkxmE15Xx26oiL8cFgMvxEE5jME+FWhRqqFLv
         VefH77bWZzTH1EMC6Y1zyzOVIDmXQJZVbce25WvCrsXtvW1XS79lBK79x6L9ZpQp42a7
         F15Q0Q0qjjmrA79dn3CQORO68tt6MrK/K7mT0G1eOwPy/pCFOYNh6WdAAiOLGDoJbShQ
         PizrIYsR7WyhBzKyAPjcMJmaE0VJLMIapApsblqwXXrKCpjmXp7HYvhkFt8dFVSMFMyx
         sFa21xFQ7MJeT/hxFNRsDbO5jrm+H2LoCs6KL+i8vRzxqfPt9RRgPXG17CvsVYIaXfHz
         FljQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhODj/DOTs3hgVNQwzIUfML+LDMV7NMeM8MLjPcVowvcfDcrfptyXUvIuIXxOih7f1vr2/rRTuIKZfBMQATpJp@lists.infradead.org
X-Gm-Message-State: AOJu0YwqZNo+AFalqu6cH4Bcghm7rSy5qvbLiOwKsrPsElWGs3gJxTRe
	eQ8FIO44qHAZIwPHAVUDWwpn/h6q8K0JV2KxUaeQI5vKbyLSE5BpT1U8qQ5+67GSTBJW2luJA80
	ebk4FjGGL4g==
X-Gm-Gg: ASbGncvYgj6JiZ6rnPxowEYj1qucztlDAwvHsUPSYx2nCzEcOHzkcrQHil8PSH6aHuf
	fY86rHLM1frRLtMAvMfFrhnO0VPIvTKWBy+d2h61FVZ0mnd5LUktZV0Ddp9F5CjKjZ7XhVi4GeM
	VXjQccmL/e/UURnV2eglDDIllVn5zILgzKf9ACByZmb9TrPXyOypVs4fIJ9lrEvXatqaFi6jMPV
	x599g6vqt22WDjrGmQwHgXbEFIAaYtYhDsDxOOEwweM7gSoEl0lCdioJ9DNhXmNnqX6ISsTSLLp
	bCeqQwt907asUbXYaW6yWyxFrR5fpdHmF5xzN6XX4FfEHLlR9c43VdkREGUyZdi5yzqs/8G8ZOv
	tZENm7vblESVPiGSy9+Zs6mfypLZOSw==
X-Google-Smtp-Source: AGHT+IGaV8GJxar5o/h5fF/NIouZ/AP7khVojbTNbI+vh4vxKtCqdP6mSrEHxQjm3XrAa4qOWtjI0w==
X-Received: by 2002:a05:690c:630a:b0:70c:a41c:7040 with SMTP id 00721157ae682-70ca88e2652mr161614277b3.3.1747649190249;
        Mon, 19 May 2025 03:06:30 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca854844bsm16883437b3.120.2025.05.19.03.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:06:29 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7ba2583e10so612551276.0;
        Mon, 19 May 2025 03:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbYguSszvnEWKOpl/Bj26WevSCicMsKySYfd/G6WzpCNeFIrDAIIfvrqlMazbQ9rm9JHcVjZ85rJA7RNgGr6DW@lists.infradead.org, AJvYcCXZ4KETOeHmyKVFuXoJItbmrLVmQp6B1EqXklwI1Q+lo9LIXyf8V3tIKb9tCsW8rhKRb/rQKOM0Sdzpdxn3Q0s=@lists.infradead.org
X-Received: by 2002:a05:6902:e12:b0:e78:f538:1c54 with SMTP id
 3f1490d57ef6-e7b4f7de9a7mr24227419276.4.1747649189461; Mon, 19 May 2025
 03:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net> <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
 <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com> <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
In-Reply-To: <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 12:06:18 +0200
X-Gmail-Original-Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuVYFfDeK4R2yep7GIQJ3UmyiYoSLOyKg2oKJC5rUcszB1QB3rVi5LfFuQ
Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_030631_579163_BC188677 
X-CRM114-Status: GOOD (  26.69  )
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

On Mon, May 19, 2025 at 10:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 19/05/2025 10:27, Tomeu Vizoso wrote:
> > On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> >>> See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >>>
> >>> This is a derivative of NVIDIA's NVDLA, but with its own front-end
> >>> processor.
> >>>
> >>> The IP is divided in three cores, programmed independently. The first
> >>> core though is special, requiring to be powered on before any of the
> >>> others can be used.
> >>>
> >>> The IOMMU of the first core is also special in that it has two subuni=
ts
> >>> (read/write?) that need to be programmed in sync.
> >>>
> >>> v2:
> >>> - Have one device for each NPU core (Sebastian Reichel)
> >>> - Have one device for each IOMMU (Sebastian Reichel)
> >>> - Correctly sort nodes (Diederik de Haas)
> >>> - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >>>
> >>> v3:
> >>> - Adapt to a split of the register block in the DT bindings (Nicolas
> >>>   Frattaroli)
> >>>
> >>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++=
++++++++++
> >>>  1 file changed, 85 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3588-base.dtsi
> >>> index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a7=
0390fdc917a828433a9 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >>>               };
> >>>       };
> >>>
> >>> +     rknn_core_top: npu-core@fdab0000 {
> >>
> >> npu@
> >>
> >>> +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockch=
ip,rknn-core-top";
> >>
> >> You never tested this. Test before sending instead of relying on us or
> >> after merging.
> >
> > Can you please extend on this? I have tested this series before
> > sending and I don't understand what you mean here.
>
> I mean exactly that: it was not tested, because warnings are clearly
> visible/expected. I also found now Rob's report which even shows you the
> warnings, so how come you still claim this was tested?

Ah yes, I'm working on those warnings. I understood you as saying that
the code hadn't been run and tested that it works correctly (I do have
a test suite that I run as part of my testing).

Regards,

Tomeu

