Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53252E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03r1MUnoANbps6OakqIBWa8kGI5iV3U0tsXfTI9VdjQ=; b=f+Fe7kudYWYwo5
	aKrMftDuSO0KM04Qfhp03IYtDp4iJ84bZi8L+vtTF9uJC3ujKcLkVJ5hs3r6ntss3IYxNpkvH6YSg
	yz+LledJYoKOP7G5iXTNVimm3933OgBlgA6CHLHqVOieFnPaUrruPPGrr65JP1QltrbRslTPaP16O
	8H5q82RUIQoufaocReR5NEn9eXrMD1kVHkXfkuiAWCqTfWIGCOuq5PZjaYYI18gCplU+FdPEGWQk7
	lmOgh6pslHJursw149DzjPsinF987OtdPlW9SP5LjvvERg+75ROPAMhevGEdPVZPWxquvaSSfSo56
	4Tt6t+/3FLFwHUsA4FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSua6-00000008SL9-1IfB;
	Wed, 01 Jan 2025 08:59:58 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSuYt-00000008SDx-3FZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 08:58:44 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401e6efffcso12933973e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 00:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735721921; x=1736326721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03r1MUnoANbps6OakqIBWa8kGI5iV3U0tsXfTI9VdjQ=;
        b=B9QjLvTdnqx9ftDgDMjpCLXdAfxg22xvSIlfAt6aOHc4+QhSNhTnF0VVrYcS+XPbE6
         M5yim3SuozB9X3BgctdrWfSMgIv4s1GPBNfvI/SH7+XXbt5pdCSNOa/CIOWfaj1INAkN
         MOqlXqM3llwxagqgkrQNnZsmf6SMO27PJfeWHTBUScsX1S4y9B5RShc75UFGNl2zsmjG
         WlNIpsHkKARUscb4jAwcYdoG2FZ78JBnrt9XL9+8VKHYxxjTHkGNqTOS58X/+9T8MHOF
         2n58O8Or6Io2+e33rPrGjngpBgYDFMBlXr1pq2zvnRDYkLRcmtlqw6qhaVQ3chY9c3qt
         w1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW4a2bsA/M54YkH4YHuaxJ8xhi2Z8Da7MDFTyP6edGq4kUCtE58x2DUl6cKPnyjGDMLkcfRp1Zf0PXXhk8MgYGO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6rTdRY1JiZLCS4ylYGYr+MyeIyDJqvWO7LiVU4XnN64a4puw9
	NK0n8t3yy7m5v2hEILZGjRrjcImJM6sXoIL4yHfH7AZsGafxzQeOIdggBpRH
X-Gm-Gg: ASbGncvQowlxydIMAWEjXSmqDgKU8CCO7RvYXw6wVEWnzjt3j1u42zlVJ0wV3h4n/7d
	lGWriO+XbBJkcvwNnyKLwvCk+IfkDioy3jwCU61HucjkYBIduz1D5+ZPEKUUbSYa1LFWP4LuOeW
	GAzGciTlc78dqqw1vuPT3n+nbW0fAjqMUa7LCJHTUgMBJgSsOM7136jHs+XMsRYo6wwoKlwt6Ar
	cmPlwECv4V0AUSMVEg8ZncVIful1TYqvtyNF2240xyeXGkbODX0oPR4dt0WwNUNyOsMtDRxwO6j
	CXs6vaZLl85WTA==
X-Google-Smtp-Source: AGHT+IFpsj7wH+BJDKJVwB/YGw8fOVrUm+GOqEdpiRNnhSKZJKYGXyAaqT2Hj4PDM4u5o2jVCN02cg==
X-Received: by 2002:a05:6512:12c4:b0:540:2f1e:90ea with SMTP id 2adb3069b0e04-542295a9ec7mr12044432e87.56.1735721920613;
        Wed, 01 Jan 2025 00:58:40 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813700sm3631842e87.135.2025.01.01.00.58.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 00:58:40 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3035046d4bfso98176181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 00:58:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV29ob9uvjtwhqkJxoHQyTH2ttPngy3bbOVXehrmXPfDJ5ON++bgiQVX3h9lP9bDvCu91vMahuUWAba8oT32HH3@lists.infradead.org
X-Received: by 2002:a2e:a58c:0:b0:300:1aa5:4967 with SMTP id
 38308e7fff4ca-304685c1985mr174943451fa.25.1735721920308; Wed, 01 Jan 2025
 00:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20241219105622.13691-2-code@stefan-gloor.ch>
In-Reply-To: <20241219105622.13691-2-code@stefan-gloor.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 16:58:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
Message-ID: <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
To: Stefan Gloor <code@stefan-gloor.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_005843_827194_E5F33EDD 
X-CRM114-Status: GOOD (  16.25  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 19, 2024 at 6:58=E2=80=AFPM Stefan Gloor <code@stefan-gloor.ch>=
 wrote:
>
> Add explicit alias for MMC devices, so that (e)MMC and micro SD cards
> are enumerated consistently. This should fix spurious boot failures when
> specifying a hard-coded root partition, e.g., mmcblk0p2.

IIRC we have chosen against adding explicit MMC aliases for the sunxi
platforms. Please try using UUID=3D or PARTUUID=3D for root partition
references.

ChenYu

> Link: https://github.com/linux-sunxi/meta-sunxi/pull/431
> Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts b/=
arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> index a1b89b2a2999..9cd1eb690134 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> @@ -60,6 +60,8 @@ aliases {
>                 serial2 =3D &uart7;
>                 spi0 =3D &spi1;
>                 spi1 =3D &spi2;
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc3;
>         };
>
>         chosen {
> --
> 2.45.2
>
>

