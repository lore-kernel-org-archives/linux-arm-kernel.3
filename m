Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D29E9B251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOR7dw2e6VbSE6TAo2/QiB5hJHo3XCf4r9aWZj1VUpQ=; b=Wg1aSlkXwZhFDw
	GCbTqCUV+fb8YVUBZFdbHKOh2z2Pc75eYRXUWdqzFagbJQy/d1qCAUBaBupYxm5YqjR28ix4/0gEk
	moDflk4SzgKqgbVQ0YqJ/m9zG3OdJedu7INZ3TRM6kuLXb5dTnZeJp7vYuo5qORmiIiOjSZnGamno
	AZKvnRNz08gCbd1prkjNqyOxMefRBz6L9l0UgZWu1H5wu7xSzGgzQ0huMBdAZ+aAOH+EemnHBeFl/
	e7g7UHta6yGw/uRWriumHnMsDtukWi9qVGuvHse3b5cqmDEU5MUM0OZJkYRRFkdrpmM/IQdMyezCT
	rPtKIB9st53wc8aPFIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqRm-00000001xsG-13Zh;
	Tue, 24 Feb 2026 11:19:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqRk-00000001xrY-3zBN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1117861421
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D76C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931959;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ec1Ad9rBGzW4ziKtYVy9VgteB4iquKM5tiiK76ayw7TSXjyfZqSM984jZYB+hudq3
	 4erjiwp9x0G29uYKomhukDaq52V8ENp3Ovj+DXBJPABve4u5c61ycvUxQJ806cbJKU
	 VI4jAUp3pHXtV7FAczbZFyWoB+iucpnPf+BKDMfRy40CE735aUY1/RVSGJJx983Pjg
	 qPn/BfL6zmsJys0v1fTUJAoX+PdhmHpmajUUYj5fy59Bp/gDgnWtmby8+Sm82OApUu
	 WUon+WH9alNLSf3Ig0ngIs8Ub1nLZIQm3yNfrW3h9KwLRLvYEk4y/pTF076Y2AI74M
	 t9I7T49Q2tgdw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0fb5ef6e9so367275e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 03:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBqHWFzEcQK6QqGMZ4yvbWSwdbAiKkkrWec60I7A5y3qkEVWlaChzmjTYs5c2TEwPr7z1bTG/j46xknDnYpJVQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyVyB2uCDsgSXbwcM07YFLF9Cys5oshIDk5HQW05bgAnhVmJvrF
	XPXsQdmp/sxKe+4/0Ovtn9lWQC1guU9ydIQzWdtgjXQ5jthky8iABzMszs23bPfG8MfpvWfc1MH
	3lgvQVt4zaulTF6+d+i2mRevfWy0yMps=
X-Received: by 2002:a05:6512:334b:b0:59e:5fc4:26b2 with SMTP id
 2adb3069b0e04-5a0ed83e246mr3961609e87.0.1771931958134; Tue, 24 Feb 2026
 03:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 19:19:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
X-Gm-Features: AaiRm51ME-8YiE4AvLn72GWWw2sauxN-ScuBUrDsWnKr42ng_6yKdEudjebdqcE
Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Feb 15, 2026 at 6:04=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
>
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
>
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
>
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi            | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi   | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi  | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts    | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts  | 1 +
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts        | 1 +

We don't know the internals of these SoCs, even though said power is
likely from the same regulator, as that rail provides power to most
of the SoC. But I would rather not speculate.

I think these systems are at the other end of the spectrum: the power
rail for the GPU and the rest of the SoC is simply never turned off.
Neither is DVFS available. In theory you could make it work, but the
voltage range is fixed so there is little savings to be had.


ChenYu

