Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE002CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EtM0NmDXgJTrNIb6JfBeypppOPW5YnsWzYvqHm4pFE=; b=1/PVHS7KHvn/DrUsm6q+c1TtEJ
	yYp9TmZoMazLQZUq40FcvwikBBDhy+sc7RJRuCfJkz5ADN1504gNSG5hyp6RnpcpgrG4ftefaw9Ix
	UnlCyw+N4FpeTNivrfFikDxbY1dhLEhVUFIbyPIn8QWx6/jZH9u/rtU1ocXBk9I9wZ5dMf3Ol4JpS
	hnv0KvrMdUy1Jvm4D2n5Adyi+n8O/f7e6FGq+GITsl7JU/Zrf7EmW8VXpC6F8QRSFPHpBA21SzVTu
	WP01NJU9+YXbtojhD7yDII5Q37agzbMIalx5hhVRnO/Q8xZtftp9FtKOVwj0ljqDRMZayL1amD2//
	qyu29b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OjN-0000000HRNM-1aTC;
	Wed, 24 Sep 2025 12:36:21 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OjL-0000000HRLD-08Wc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:36:20 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-31d6b8be249so6225611fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717378; x=1759322178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EtM0NmDXgJTrNIb6JfBeypppOPW5YnsWzYvqHm4pFE=;
        b=fNJMnJZvCBf5KK7UbR+YD7bSYqXvX9GyKy+Jt7e6ZAJKLcZ/uhCIQQlwk3DFCsORM9
         AoYMoDviHz6iLJ86mtiF0z/f+FvHMjtduErQWDREieExUXUpqxuUEiGnGOxNYtq3CeRK
         QFCyvAm9pyy9AhVyRuXhVFrs5B/t05/uEb6x1qnDEMU4eTHT3a2z7B5/ThqbZ+oAKnht
         ChnrCycSv2j5Mu1uAU9y3vhsewzXHVCdT5qXnoO810baLjgHsmhP09jpMUYQe0Ucacdp
         inE8/jIISWHLUX/GIoGOegnJD6g87urSKZ2SOYCqyjQMGq0js9+jH0EApeDzsAhkbFlo
         o6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9qFd5NFT74tDO8WbySLCh9NXiW48w/D6RZMZiQ/x1FydztL9nls22OIXeuElj3cx+X+vgEuVX8GvKfKyufFXm@lists.infradead.org
X-Gm-Message-State: AOJu0YxLfhF/+a011XwPYFaIhFOO8YMwUSiJsfVY0bwX9fXImvuoUdVY
	0wvHQcpW20PA/DBmdfXON/VX7+MBEqUCVr1meIxHDznAnD5+BiM3ATHIPWh+7XFo
X-Gm-Gg: ASbGnctVP6rT4+nrG1tBI1d4dGhGbqbT/QoFhqTuUheJp0FEp8y/xX0GUYavALRE5NZ
	lPkohwCqPUz9AW19l6+GQ701tifgOGWeVPyrxr9hbBHs3k4zImZA9iiVKK+2WX3dNNik2SNLRA6
	WusYQVoDrIeHhFRj7UX0vaUfExI5ak/MRjUsS3GiFgo4ElahoLfmjFOPZHRSiftvQ/7y/PC+XPX
	xg3obegdnFk+/TrGB7IHo1rvFCaMVsaBRPAIb4PKlHDWbo+8CLcitPN1q8uodk53YR7t5hTzp7/
	BkunVshRStBflWi2lblPUPdkJ2sVYtzZJaDL4o9OwGWGMEhKk9/Th+ZbQSmf0aHAHNkO449C+tA
	TQdXBwHSMF9r58gqlbkcxOihTN8F6K+Rk5laZf3tVEaBqkcfSauyTQ49NUqiv
X-Google-Smtp-Source: AGHT+IGLpjMplwezcEK4kxPIGH5h08/PuqHlbA8apuE31Qw75zTegvLtYCdpHSV58OOqjcX2KlPKsw==
X-Received: by 2002:a05:6871:8a1:b0:347:ab34:9e48 with SMTP id 586e51a60fabf-34c82c9c195mr3547272fac.34.1758717377608;
        Wed, 24 Sep 2025 05:36:17 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-336e5f4fda5sm10323043fac.23.2025.09.24.05.36.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:36:17 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30cce86052cso5196601fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU3KeHGpVTbF2mOgvLSzAABRekqC5NkLlGkHeP4AaAGI6nnWNYdjcUKaXcuOit2t4ec0DkYisMrozctPxcJ0NZ@lists.infradead.org
X-Received: by 2002:a05:6102:26cc:b0:4e5:980a:d164 with SMTP id
 ada2fe7eead31-5a56fff866cmr2086659137.0.1758716909035; Wed, 24 Sep 2025
 05:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com> <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 14:28:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
X-Gm-Features: AS18NWCMDKVUGKQgSB3C0NvRa7hF5DASAIBkCuYR4D0F9J6oYSce5vNi2fPDjI0
Message-ID: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
To: Biju <biju.das.au@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nishanth Menon <nm@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_053619_076106_DC9CAA63 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

