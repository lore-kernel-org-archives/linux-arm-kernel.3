Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51728C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=; b=DC76fi5dymk92tRJYPR6sotcZ/
	6ECpk4QCzGKG29jkViMVMZWeyt85/6W6GXlelmO0EZ3LYUYdnJKlsivbBf+1ZPPqX2oLFJRpL2EIS
	d9YSebrkuePwwV1o8LNxLTFtVPekDyEFdYAhYWCCPPo9NXjo7x1vOh3m8bm940k3d5gFjl+5csa3w
	P9LYy/c4m0fWWRqWPJGd6ywHlrDQaIPLtPtjh8OAiIXvc8ZEyUcVw3tvImnEQCyKUgRzHWqe+m2Xw
	FK29NPmuc6kKvXCVIGAidbnUtsixI0Rj7E0QVNrNHLtJHojLiSfRh38D9y2okVM7ImrERFvJCpULa
	J76PeEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvtf-00000008MDC-1WHb;
	Mon, 19 May 2025 08:30:55 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvqa-00000008LoA-2nAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:27:46 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-70d70ee042dso3620477b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747643263; x=1748248063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
        b=1CrwJRzjKGqvGK31aS4e50pzKD55AiiIyGPPN2gIbt7Nz2dSRc1m9N/CqwgaWBN9np
         fCk7PUZsocrB+ezS9qFz1GmuDGdO3JSSISB7o+NBN0WZrGqlkgnLJIwnQVtVw5plY37F
         KyLS2qtSuOBk1dDionweuJKvpMO8aXHriehEpZjYGBA2rbS4wxAsYKnQRTY5ViSeca0g
         CfXdLSLS2dBAJ03qQezKs4au9+dVcEdqKwDqB7Y3iWKXuemp3nPP5F8PG05GRxX8Otkv
         h4Pagj60OE1p9opUKtOmLe40u5tRUiDoiEPgMexmf/f2CKufI0RFldteAlCqsO1hu7oA
         rW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643263; x=1748248063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
        b=gBQVq5shrTbsDWk1B45Cd+Ouma6qp4lgqOg7hWdvimbhXBlfo4czZ21Io9sQrKsA1+
         tW8eg06v8+6wAK0WDiuyiSXZG/Ts2KsENaQDDPGJWaFOLQ3dCmLiBsQVgp0eZOkfZmvW
         0AyI4X93hcGYNFQd5Z/fxTqftpG1s76bety65CBDJfDeJIm36GlQ3d0Ou4LlfgYuHIES
         0RED7zhamz5VAUxQkO2EyH77QtcmOAkmH7Rlh9tvT2ILOqvbBEYor/CMDiH2FNqrxBeP
         vFPOxjRJEp9DruRiivOMHHUVd/c1ju2YdVUEdwvDNdOe2rAFumJE+jEcpcKPNU6Eu6w3
         iHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnbic8HL3XyD75g1/J38D2ZqW4uJ4JZvPStvQw7zyabb4czDY0NaA1sh6omf7s+0t0jzsEXZwEk7EpGSJxArig@lists.infradead.org
X-Gm-Message-State: AOJu0YyUs0lpIlBuNLkl+VXZ/PRzmqcHEyJf2yvak2nCLDZ/jJrU85sS
	mdUGvJD466FBiiuC/UhgvBleJI14Dcbz0fBwF24DZl6EDGFvSVXTR0qrwB2MIK27U0nR1ZWQNBd
	JISKoqdFlnw==
X-Gm-Gg: ASbGncvBoUErcxMYy9s7qqMFdbjNNg6MzTze98e1S4gxQ5GaPSs2hVOxCJtITVUNHQj
	gJ/z6c9fdCQw7TZFTMMwKiyZLMFlpkUtmyahfLnKXTLIB+ij4JEHD56cfOiazDHhMkBEfEg2QZx
	vyDqN5ByMCDXd8gWoFlLgrAfc0FhflpSbcboGcu+2Esrs5AT+i7Hnkb6XdJCjqQ28IDrSOXx8EW
	TKofMLEj6E/zAmQi+ZVVtHSfXj/zINYEUlKsvGR7kIOrsxMiki3CPotRD8FjbG5pgbWnp9HPQqx
	F3lO2L/ezKvEhYyfoW26MWdRS72Uy8kNUb0AEBrwKDDA72thYxu8aXFHG4yGe+LmopmJuk3PuCu
	UWJb8yqMgcvz2+2XODzU=
X-Google-Smtp-Source: AGHT+IFsDU8iZl643p9OTFISOkawWGmY65UGPAKsnVkge3FtH3mhwXz0U8rAokrL0a6ijkXDVAFddw==
X-Received: by 2002:a05:690c:6c82:b0:70a:36b2:8f94 with SMTP id 00721157ae682-70ca7a5047emr173649507b3.18.1747643262718;
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70cb4471e82sm13802757b3.29.2025.05.19.01.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7b962a156cso813055276.0;
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTDiaO2oQ7UqCRgrbGA4SgZ+4cDfGHoYDZzgQZ2YT3DmkPJlVi3cQpIUtYcdQHkb9X2pLUoTcPR2irhiEhCyc=@lists.infradead.org, AJvYcCX2FNEwUX1o35gWHehxul/WMW4RiFoRU0XHkPJtk1rEHiVq2BxDEqQlZLNUXKYH4UxC8lxc8Mweg097uXM2CgU5@lists.infradead.org
X-Received: by 2002:a05:6902:e02:b0:e7b:96e0:68e0 with SMTP id
 3f1490d57ef6-e7b96e06d2fmr6708556276.13.1747643262000; Mon, 19 May 2025
 01:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net> <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
In-Reply-To: <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 10:27:30 +0200
X-Gmail-Original-Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
X-Gm-Features: AX0GCFuGQeY3CKRDKxmbkhGEJEzp8Ivknwdq0OVtRXBXcahkrM5jAa3oB7F__bY
Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250519_012744_901930_DD83E2BA 
X-CRM114-Status: GOOD (  24.43  )
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

On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> > See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >
> > This is a derivative of NVIDIA's NVDLA, but with its own front-end
> > processor.
> >
> > The IP is divided in three cores, programmed independently. The first
> > core though is special, requiring to be powered on before any of the
> > others can be used.
> >
> > The IOMMU of the first core is also special in that it has two subunits
> > (read/write?) that need to be programmed in sync.
> >
> > v2:
> > - Have one device for each NPU core (Sebastian Reichel)
> > - Have one device for each IOMMU (Sebastian Reichel)
> > - Correctly sort nodes (Diederik de Haas)
> > - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >
> > v3:
> > - Adapt to a split of the register block in the DT bindings (Nicolas
> >   Frattaroli)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++=
++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a703=
90fdc917a828433a9 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >               };
> >       };
> >
> > +     rknn_core_top: npu-core@fdab0000 {
>
> npu@
>
> > +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip=
,rknn-core-top";
>
> You never tested this. Test before sending instead of relying on us or
> after merging.

Can you please extend on this? I have tested this series before
sending and I don't understand what you mean here.

Thanks,

Tomeu

