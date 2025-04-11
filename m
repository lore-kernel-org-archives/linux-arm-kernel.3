Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC36EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 02:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5z1I+Yl9dtmBZZ8N6P8UIj5dgbJQZua1H9d8D+bvII=; b=g75GY66sn7OEJUuUJTcU665B51
	iQiylRFrScEuDmAI6FzXq62PYcVGBXiICfDPLLnj5/D8VyvvoIjLIbN1aPp8UflC7wk7lYPLALsHB
	l0f2LhwoTzQro8rarFfMyq9WbgZoXfi01mPIyDxOnpepwyn8Ly1h0EtzFH/M73uwQ72U/wTLMlZ7w
	1sXD6nHvln343t3+3qGwsaZ2Z4UPM/vDpMY8J4OUx3ZIlhh5SdTSgfHs9+wz89FI/Sm/l9JlOBM0m
	udILsEt0Oh0uf37AT7sZ0IGn8IJcs6/FEjjhDGwrkATbOJ6OXv1kd3Z28Y90OyMViZBybuPSvrkiT
	1vCrB2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u33mo-0000000CI2s-1dI2;
	Fri, 11 Apr 2025 02:06:30 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u33l0-0000000CHwV-1JTK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 02:04:39 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aca99fc253bso235722866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 19:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744337076; x=1744941876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5z1I+Yl9dtmBZZ8N6P8UIj5dgbJQZua1H9d8D+bvII=;
        b=B+q8LGZZVS3+xRA0fJc8owOyqo9rb2IObxxTozaO5OGxCfsrC8MWJyaoj5nwdr8HAs
         DvlIKuzrcRaTnvPl8H9fyQLtC6VYP1it3TV0Nlm3VL6aPI/tBxNfrj37X8MSU+dafN2o
         mDdhzWvRsy+keJvxr9JWWXep9gM7rb25DnNFMZX6V/eO+eMyYzn+Vj6N36RzC3+I7Izb
         oKjMm9hqBynNGxOtrGc0IaZ3PzrdK7FdiRRztmBo+NjXkOf4ffzp0dKkHBZZX+N6WfSc
         g/ffjyPunuG9jMuCzA0WMqrZNXYCvKyF9opDhLM3Rt/xPCBUSniv61XKDNazPmtPmCoY
         uSCA==
X-Forwarded-Encrypted: i=1; AJvYcCV0AlzgmVIY019Oqv0JLj0QQXDsXDgusbnVgCEddyKRX4JD2SEfIwB8327myhH/BmygFhrwPQAvRL7Wl1cpP7Fg@lists.infradead.org
X-Gm-Message-State: AOJu0YwuLSB96nadDr9DkyH6YeXXa7eRxnze1Tm413bczHBqGPQQ1rpT
	5M0zjHJ+lwAnga8oGB3AEGiCAf5HIiA5gzuAwFWddgBhPc3prhBoW+iJi3ZP5gg=
X-Gm-Gg: ASbGncu2kvhncYmX51HfA2MM9z3XLQh6WG1OWsgVkNpbr4U1NmuCl3KreEjkm2JhGfY
	PjBUkofg1NqBAg8aGmue+ex0KmJXbF4UaabR1DtaB7+WCB/lbA/8yhMymTg6SLesTurvDhBXd+A
	VwrYoOmWflTZ0W77bL6eUa7VDW5+QJ2hlp1+oIxkB85n9ULhE5NuFgaRXBMQmnZUeoghpNfcCOS
	UVoh0PTvmuYSEBN1Hr3hfAQewnnwel6jrU5/dS/wupUt9XePfyaS8/unBBN/0hidDWQjSfj8ptW
	WWaawe6HpGnwnDodTWrFOs3uykeKiBsKNLK0MlgTDdxptyTpv7LaWwKTIF0aSfspODQyHbHL2JF
	xku/WeA==
X-Google-Smtp-Source: AGHT+IEXhiVW5EcL7SxC8pc5PDcnvBBDtX6NuFxLxFUVzVwyRTjx+ZR4MMqWSEGhQzzuX8yahUBMKQ==
X-Received: by 2002:a17:906:f1d1:b0:aca:d649:72ea with SMTP id a640c23a62f3a-acad6497352mr18378566b.34.1744337075846;
        Thu, 10 Apr 2025 19:04:35 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce730csm355510366b.162.2025.04.10.19.04.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 19:04:35 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so2344241a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 19:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3fc66k037qZhlYkZHKLCOtUVfIZN02h+bS6ePomwHvnfio4S49YH6DUCe/D8kuevWF1CIBWyK8OitS/ev5HHi@lists.infradead.org
X-Received: by 2002:a17:907:7215:b0:ac7:805f:905a with SMTP id
 a640c23a62f3a-acad34c6e4fmr59887566b.28.1744337074794; Thu, 10 Apr 2025
 19:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 10 Apr 2025 22:03:57 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
X-Gm-Features: ATxdqUFptu85Pq5XS2Y77lz4M0bInU8AWjExnkfiEk-bZJ-0RHCXCTLUmPDmg_M
Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Driver for the Apple SPMI controller
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jean-Francois Bortolotti <jeff@borto.fr>, 
	Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_190438_354818_DF368215 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Apr 9, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for the SPMI controller persent in most
> Apple SoCs. The drivers for the attached PMU and subdevices will be in
> further patch series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v4:
> - Rebase on 6.14
> - Link to v3: https://lore.kernel.org/r/20250310-spmi-v3-0-92a82e7d9f0d@g=
mail.com
>
> Changes in v3:
> - Inlined helpers, dropped unneccesary error prefixes
> - Link to v2: https://lore.kernel.org/r/20250307-spmi-v2-0-eccdb06afb99@g=
mail.com
>
> Changes in v2:
> - Removed redundant error prints
> - Various style fixes
> - Better explanation of why the driver is needed
> - Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@g=
mail.com
>
> ---
> Jean-Francois Bortolotti (1):
>       spmi: add a spmi driver for Apple SoC
>
> Sasha Finkelstein (2):
>       dt-bindings: spmi: Add Apple SPMI controller
>       arm64: dts: apple: Add SPMI controller nodes
>
>  .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
>  drivers/spmi/Kconfig                               |   8 +
>  drivers/spmi/Makefile                              |   1 +
>  drivers/spmi/spmi-apple-controller.c               | 168 +++++++++++++++=
++++++
>  8 files changed, 250 insertions(+)
> ---
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> change-id: 20250304-spmi-6d3c24b9027a
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

