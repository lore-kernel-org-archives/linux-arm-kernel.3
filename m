Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807C7D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4Uhvy8tTjWy5oxzfIAviwoG/Zaxlrw3hfu/LH+0UAk=; b=cYEDoXgZXJtPtHh9R8XGRW9h9f
	wJS22+Y/axcACYATCj7kUvITPvi6Nv8cY9P3fke01N8PXdwHsQYslZajV3w1kJ6vwvSijZErEi7Wh
	wG4BAtILbFbo8YFx70/0jZK82AVJerq7vBFzmMny5/7wN4m3p2watTwwAs2BumMRLs+IyjxSRSr/R
	HYn3+64PDanOHJ8xsmMx96JqHNXD3EezqhFO+nntlRAiqZ3UQKUMvoOB0yiipPtUh3j4bHqVQrepN
	RJAhsMrr2eCBWFzLddTEBTl+7MBgVKyF9xtGIzZmcMgzl/VWdS5fiL0dTWMpZM/qVAIgOiGHuj8KN
	eNNbVzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAMH-000000072gW-2HNj;
	Mon, 02 Dec 2024 17:37:17 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAGG-000000071KT-3Udq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:31:06 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso7272977a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160663; x=1733765463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Uhvy8tTjWy5oxzfIAviwoG/Zaxlrw3hfu/LH+0UAk=;
        b=nSRLpUkdD6gSRi/OgT21Ck9TGLLucNW/knoOsxPX3WRHD7mttQ9PaKugaLtzkndapN
         giEakIHIoCHL5Bnv2xeDMcYHAH2/ChfvVKNiFOB5dYGbEYVtnnA8ZnprgeJmTi3HkPTA
         f5h126hbo+SBntKtlsps4Yrprg0QC3lTOF7P9KwOD3Atpp6A+WOvz9z6uozpHUrl+wff
         Z0692in8gOsUyRDjFCR82pzxedV23ZS+H4NjRTQkXky1Z4JpUrOMgMGc4zqEoipELRsh
         qla+SWub7amp8Gnii9fhCdUC2IMiL6ox4DInRgk8+UfOGooK5MqYCLScE9mIiFlNuQYN
         j3bA==
X-Forwarded-Encrypted: i=1; AJvYcCVTpHYaalePSz2V1PmWH2C4tNJ69CO15RX8QNbXcEmQYjHcp91HYbc1B9COY3x9OKX1ch5VAvrN7opyCmoCMTLJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb+fdjrwXe3/3KNcBnCAlQIRgiqHqyrWgWO64Ep49Vqrz2pxIS
	LcGXOULSBEOjHjm+RmlLBeaS5q6OhwOIlLK013SqO+MIPnoUmZpq7/DRZS9wUHA=
X-Gm-Gg: ASbGnctWlhTh26U7fjqVPC5TNix+Bd9STMaHkrmfSaoxg5ztqHBw+m/xxgacJ9Hg0ga
	6vvCeM75Dlbtqkt6+jiUGNS4XNTFvVCjiqbppRBI9aTZ+eezB/87Jb9TleAUSdFfAgjF1bGfZou
	MfxkVHnH+PluN28MQYDZx+Em1wnse8ACSfz/XBvaXGrx0wGcsqUXi5a+jFfPrTja7ue8zmel8RI
	vEN5z1IGmAkmZCdhmSbu7tWODYXSwoj3uuk1eQxfDdp2RYD7X3wzej7hJJ/HaqrRtzn92IHZa0k
	5++b
X-Google-Smtp-Source: AGHT+IE+aMzDUBspt6FFTcewWzA+sW2qoR6T/NQdxO/HJ8/iaXfFXeuHeXoN3vyAbRFmlw+JIsLgwA==
X-Received: by 2002:a05:6402:1e8a:b0:5d0:224b:d507 with SMTP id 4fb4d7f45d1cf-5d080c7483amr30861482a12.33.1733160662404;
        Mon, 02 Dec 2024 09:31:02 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5999731a1sm530394166b.201.2024.12.02.09.31.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:31:02 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa578d10d50so745543566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaN3C0B9hsRnVHRlemWSPZKNKiQxRbkOmgXoalekglgEiXS3igxcMeiqY1X45w7A6bAth6T/s7Jntuyc0Kvlzm@lists.infradead.org
X-Received: by 2002:a17:906:2932:b0:a9a:238a:381d with SMTP id
 a640c23a62f3a-aa581073eadmr2214547066b.52.1733160660680; Mon, 02 Dec 2024
 09:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
In-Reply-To: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 12:30:23 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Driver for Apple Z2 touchscreens.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093104_871388_07E0B8B0 
X-CRM114-Status: GOOD (  19.88  )
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

On Thu, Nov 28, 2024 at 5:29=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and fo=
r the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a copro=
cessor
> in charge of speaking Z2 to the touchbar).
>
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-m=
l-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - In a separate patch, fixed an issue that prevented the SPI controller
>   from using GPIO CS, and as such, moved the hardware quirk to there
> - Went back to uploading the firmware in probe() instad of open()
> - Other changes addressing the review feedback
> - Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gma=
il.com
>
> ---
> Sasha Finkelstein (4):
>       dt-bindings: input: touchscreen: Add Z2 controller
>       input: apple_z2: Add a driver for Apple Z2 touchscreens
>       arm64: dts: apple: Add touchbar digitizer nodes
>       MAINTAINERS: Add entries for Apple Z2 touchscreen driver
>
>  .../input/touchscreen/apple,z2-multitouch.yaml     |  69 ++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  26 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  20 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  24 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
>  drivers/input/touchscreen/Kconfig                  |  13 +
>  drivers/input/touchscreen/Makefile                 |   1 +
>  drivers/input/touchscreen/apple_z2.c               | 458 +++++++++++++++=
++++++
>  9 files changed, 627 insertions(+)
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241124-z2-c012b528ea0d
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

