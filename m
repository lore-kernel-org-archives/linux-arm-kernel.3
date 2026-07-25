Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A49C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sHLG58jMqxDvbOMKd1AgXZwgrkw+Z6jJpWALEhEDl8=; b=lOPp1OqVlRXw4XPuO0bzHd5mff
	TUUVITQc893bDM6H3kzPBoMRgBLRqQBpou9x6ZGCQvQ2Wc+zwsmKBDKpxhMow1hL+NlxZxTfNVBHG
	HeNWRkBxEn/+evciVBYc9d5YaW2MeirxFnGd1SwbYg5JuN5H3TQv1Vt8qtMiN19IFi5koM8Qks42f
	9vFHBz+WVhJXYwtaoZIShDx6gNqyTzRbTsaBuVcy9oSBmSf6KeczJtjfdAJPnypVia5OSH5b0Fe92
	hiCf87Fz4h/QLPomvZZunBH+Mvu6J29tRrubwaxABQVPBJD0CIO1KvEkBRlXPSL6i80vqfCPrOfJc
	19dB7Hww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYvO-00000000Do6-1G8I;
	Sat, 25 Jul 2026 09:44:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYvN-00000000Dnq-1JH0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:44:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A13600AD
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CB71F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972644;
	bh=+sHLG58jMqxDvbOMKd1AgXZwgrkw+Z6jJpWALEhEDl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oWyN4RD6GUDboGVxC/E5Q+yQ/MY51Uzx+fjHr4jaNAziLLzsQiQEOHChVRxULpQTe
	 4i1GDClV1ncnrzIm8zAVk8TzAWIdy27nOlvL+SKyXbcHdXjb5/pWJpv2MmSPM1pzSR
	 Lf7hNM6GMvX+VZp7GoQUcGfuJV7hBXRgx/bPFVdZopBpcsN66FUaFtOVI09f65dkxy
	 590cupVPQEkkZdg6cB+zT9nrfo7g+bR3DxwZ0Crzl8MdsQORplhpoRurQHffXpJAYA
	 18Qkra+Kd3BTp//vz8vElA5iYi3ZqRoAp+6KtBMFZs3l+VpeBKCGC6ViV/BckkEQPu
	 nhxmng/peIj0Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1257999e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 02:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqF4OkEikWNBmXGHy+hy6vLRO6SyK808s8e2Jl/xF3oCpeK4qWypPCKGMB85tK6PHNZrwx5L0suukVgnCXvaZT/@lists.infradead.org
X-Gm-Message-State: AOJu0YykCwFu7SndjbEicAnRAg5K/p5cKSS0zMl0fVlDHKKYJHl2/Ml6
	Ahd/F1sArH5DgX5I+mCegyAwLOzJjqhVv4LYcbkDqGSLwq4RVWz29SmYsR7Di8vsrZn2MjcBHsx
	EhTt/W8QcWgaZEftl2I/p6f47sU/lapc=
X-Received: by 2002:a05:6512:6c3:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b2c1b2ef16mr275541e87.30.1784972642983; Sat, 25 Jul 2026
 02:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260709193927.108105-1-chenyou910331@gmail.com>
In-Reply-To: <20260709193927.108105-1-chenyou910331@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:43:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
X-Gm-Features: AUfX_myp3ksAlUiIcfmHpUh-uA1XaXUKqtDVaCvq7z8kF7LlzbztHb7BNOGJzyo
Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Frank Wunderlich <frank-w@public-files.de>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 9, 2026 at 9:39=E2=80=AFPM Chen-Yu Yeh <chenyou910331@gmail.com=
> wrote:

> Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
> name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
> follow the GPIO hog naming convention, but the mt7622 pinctrl binding
> only allows child nodes matching '-pins(-[a-z]+)?$', causing a
> dtbs_check warning:
>
>   mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl)=
:
>   'asm-sel-hog' does not match any of the regexes:
>   '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
>
> Allow gpio-hog nodes in the pinctrl node, following the same pattern
> as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
> gpio-hogs").
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Patch applied.

Yours,
Linus Walleij

