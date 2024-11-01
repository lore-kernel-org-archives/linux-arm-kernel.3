Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D72CE6B277
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9bwHarTXYh8PlkfSoOg/dHvVxuaUbn7LxVppuXMoFg=; b=v+P6qqdfwV1R+y5dtuPE3IWyrr
	epAQQ+TTYKXSrvG6F30N4NpsfUDv5MnFeYb0Ne2kSt+b5RV9NtnXvTvJy6vqQ57DZKZUGZACLT/4d
	trgTgpjAJkKJnJZf6IdTy35Cpfk9EpWdmd31y6hRaFzc97zK0qMg7+7Wd11UQc4twRMPNd6g77ABa
	MnDtsbwt2BUSI1KPk0qStj8J7yTMgi3EeMq3P2iNFzCOW/oAXO4K3T282n4QZIV0I4tmlbLkoN5gh
	vU3vA9HQFf+FqnVCpak5/sY+7HUXN6VADhPy5EJP4BcG9f+UFDtxYoWYXOiIFZ5eBNWUIoeX+6n9L
	fTegk3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rM3-000000077UL-2Li5;
	Fri, 01 Nov 2024 13:06:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rKN-000000077GZ-3KTQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AA63A4372A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 Nov 2024 13:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8CEC4CED4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 Nov 2024 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730466274;
	bh=e0kHCPimWbLEYH5RJfV7zJ1ttlwCl6aBvjWS0mMg2pE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iaqLVQgIKFnydSYtSuH1xCyFuYz4Lr0NJ982QFQrpvd0Nn3GVgSDsQCW4Va1tbaBO
	 D1ojD6E+8adT1EiLpI02hmV7L4cRCH53EjsVYXDmnq8B48KwMx27jAKPaTj9X1Pu6o
	 +FjffQECHGnEn9oiIYkzSkah2k/xRrapIhAOWXd470vkxQoutqKkszWzekjUAt9sFK
	 5WXUM0v9lk0Yf0GKra3TZ2vyWL86q8EjMiW5lfA0GQe71Di4Js0WfcXWWC6wJi+X3U
	 3i3+vzQBESUi69ZV3zmnS26lXfJ3ZABM7jk4I2urhfuALuPB2ab0CXOIgyLbgchmwd
	 70ivUVr3FvKFA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso1950385276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbtJ933sLNaEM2yjbGIwixtCibghTH2NO3WTPCed2YyuGOC97UCcGxcABCR0mPvugAOMvL/mbYmKn0rv2LDyaX@lists.infradead.org
X-Gm-Message-State: AOJu0YxDc6tqTkSbooitP4Le3dbwL5CjUmZCdwwSe8snVCOUUYJEJGK1
	V5/It5W+6Fp+dxvoV0jhfpOz8hQSClSs2+iDzjFMg1AlJCFwRJy7qkJP6DwdjXhDSl3xQycNsQc
	wPL20ztMGEw15tjpugeOrUCKiog==
X-Google-Smtp-Source: AGHT+IHi9R9ZLKkNAlVKBE9uzRV4fcr3IA5fIkPC/OSO61Je9UZvHcfz23a/szZZMYXQXDoWvoY3JpYQe505hvFu1F0=
X-Received: by 2002:a05:690c:7445:b0:6e2:4c7b:e379 with SMTP id
 00721157ae682-6ea523d1ae7mr78626697b3.19.1730466273460; Fri, 01 Nov 2024
 06:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241029010526.42052-1-towinchenmi@gmail.com> <20241029010526.42052-5-towinchenmi@gmail.com>
In-Reply-To: <20241029010526.42052-5-towinchenmi@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Nov 2024 08:04:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Message-ID: <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Subject: Re: [PATCH asahi-soc/dt 04/10] arm64: dts: apple: t7000: Add PMGR node
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_060435_990855_C6ED1E44 
X-CRM114-Status: GOOD (  16.09  )
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

On Mon, Oct 28, 2024 at 8:06=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> w=
rote:
>
> This adds the PMGR node and all known power state subnodes. Since there
> are a large number of them, let's put them in a separate file to include.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  7 files changed, 672 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>
> diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts=
/apple/t7000-6.dtsi
> index f60ea4a4a387..77d74d6af1c4 100644
> --- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
> +++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
> @@ -48,3 +48,7 @@ switch-mute {
>                 };
>         };
>  };
> +
> +&framebuffer0 {
> +       power-domains =3D <&ps_disp0 &ps_mipi_dsi>;
> +};
> diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/b=
oot/dts/apple/t7000-handheld.dtsi
> index 8984c9ec6cc8..566346be5b53 100644
> --- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
> +++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
> @@ -10,6 +10,10 @@
>   */
>
>  / {
> +       aliases {
> +               framebuffer0 =3D &framebuffer0;

Looks like an unrelated change. Also, not a standard alias name. So please =
drop.

Rob

