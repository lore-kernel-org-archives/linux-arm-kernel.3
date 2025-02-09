Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F48C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZtSlMlkn5zHaXo0WZfyndZctK7R7et8V22vFKv8IdM=; b=XlIPj0INQHoMDPiJ/DkwdFARCb
	qziD/5Xg70+jGkaBZffQOfgW9ltAtiPqVilccbiD2vu4VLD45kyMbS34cH5LNP1hbMNPV9UMersZS
	F2GvHXZ+CfB1gCzmrblVHV8LvXX56FdQBSY/pUgxB/TBao/3eUPiO9S0RgWoUxjNKRTUW1LTbbNYW
	sVJ+kRzWYHiJc0s1BNuWa23VT6AVLxrkMtMAYmH8HeNwSN6pvVmoduCJyqPl+iNXN4bOwNxF3lDSf
	BSxLBKaiIwuAwTcKVs/86RriFmPorkjhlJSrA9j2ZSfy8GSR2qO8jV8UQXEjnhEpB6jRCLmV3ksNt
	3XauYbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th56T-0000000EeqC-1hci;
	Sun, 09 Feb 2025 11:03:57 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th554-0000000EeRl-1g9P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 11:02:31 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7a342ef4eso202636466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098948; x=1739703748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZtSlMlkn5zHaXo0WZfyndZctK7R7et8V22vFKv8IdM=;
        b=QZtPXhE6YHBg+him1qGrand1V1phykEDxQaSV0JsUj7XF8DwxETku3F8PYmJOSzQYw
         k2eu/EPQZJBlXk0bzRgAiNC++V360hHQn/hsv/ONN8EpnXe+qnQKKZGE7cceq8ksqLYr
         WrSCPDigEqkPrx5SJaf6iR0tiJqxECPxhAnQPcE82TKWgm2DR8hSZNtHiEAElChvrWP2
         d39Cf76hCpSKgwdf1xEwxQEC/DA3MDLIZlEkU5rxwm7AqQCD3s35dSkechj+D97RbC8M
         91cZFg3dEZrv+BjZwLnyfuufGucUz+v7TrIpm78hgXZiWTmCckhKyFZ5STR/tGosm8fC
         ooTg==
X-Forwarded-Encrypted: i=1; AJvYcCVb3WcDdIUiEt1+h5hKBtawgUfL6puguWKpnOFM2AjXwOAB2VBrkoem6J4s9KRNCVPXfbyuoLvEdKf68BxeKkp0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6b5+sLzJC8Jto/S+B2xqdzEFsZQWg1ftp8W09DcY863o2P0at
	EmfnRyfbAOxq72XCKWbXyp82Y841Ip9LsRa6Jq0+1gyhiAJAZoInmTaaANo9gPI=
X-Gm-Gg: ASbGncuZ8usnD7v4OfqXdOPj+o4HiOMlVzE6gDxMp3DkT2ulTllRrproSMsaz5RFmw8
	kk/47K97zuvr/IHn9ljXtvtGNxumsXgI4RTDUmJLJhHHqnnqtssM9oLEEmqIYBe1KnmFEL0DI7b
	p2XOKC9b5lfjv4WKObY3s/L0+MNdyJxs4HOV6ZrTE9HIRKcJRyM7EE49Xn+MFRwzU0xq9O0j2Yd
	afmXpKAB49PYZ9F4CwXDw4F8DtN9E+mNJArv6CRsNnFDJd8QTp6MPaZan5A0b6hGjN+TKW/CpPZ
	ya/vU1WKhZ4AbC5nmojXacWwRdHeu2uf87znpv2f24B0rw==
X-Google-Smtp-Source: AGHT+IGdVNXnKgnZ7RX89pCiofl36L9H9HiDIWh/ACuLTk6Mg1tMVbZBKaEsMuwsDG/aJwBS2fQS3Q==
X-Received: by 2002:a17:907:1808:b0:ab7:be81:8942 with SMTP id a640c23a62f3a-ab7be818c9fmr27403066b.8.1739098948257;
        Sun, 09 Feb 2025 03:02:28 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bca07294sm41353266b.68.2025.02.09.03.02.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:02:28 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so1306484a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU++dOysFGLbFDtbeQ2ydOhNblRE7MA3opVXf7/aLWc11W8e8qierSQw0pYGonvMRqiEnMDvdssULYAjSg7Z5YG@lists.infradead.org
X-Received: by 2002:a05:6402:4608:b0:5de:42f5:817b with SMTP id
 4fb4d7f45d1cf-5de450b1c5dmr9937857a12.31.1739098947851; Sun, 09 Feb 2025
 03:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:01:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
X-Gm-Features: AWEUYZlNJz2VbuDrDkNmceAgZ0ETGFMAFQeCJbSKwBdyoI2QQNmlLF0UVoGPB5w
Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_030230_440523_52AC9CAF 
X-CRM114-Status: GOOD (  18.73  )
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

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2=
@gmail.com
>
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1=
@gmail.com
>
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f=
@gmail.com
>
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09=
@gmail.com
>
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate devic=
e
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a=
@gmail.com
>
> ---
> Sasha Finkelstein (5):
>       dt-bindings: display: Add Apple pre-DCP display controller
>       drm: adp: Add Apple Display Pipe driver
>       drm: panel: Add a panel driver for the Summit display
>       arm64: dts: apple: Add touchbar screen nodes
>       MAINTAINERS: Add entries for touchbar display driver
>
>  .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>  .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>  .../bindings/display/panel/apple,summit.yaml       |  58 ++
>  MAINTAINERS                                        |  16 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/adp/Kconfig                        |  17 +
>  drivers/gpu/drm/adp/Makefile                       |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>  drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++=
++++++
>  drivers/gpu/drm/panel/Kconfig                      |   9 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>  17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

