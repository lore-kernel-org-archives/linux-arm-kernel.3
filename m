Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1060FE8FDAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=; b=Q/u2P3iuLGZQAJPJYTxD3MzLHq
	1sH+640kwh3D3XaHyeA1riiyQ2dHjUdXwXMQ6Ma8q9MUUMoEUZR2Y+6ZgTY1DDhHx3655orCsXMuv
	IfMhg1sPJ8LjSKcXuxpYvT4lTImzs8MGFXUCs4VdQxgJ9PbJ52hibBdCPiF7WrAkDNM5Ef5WPNrNj
	7+2qC98jt3NYe+cUq2P+q8vVlP07vAo6HvCsg16PFQsfzI7AqXJlq8GEFQuh1f6VcdTNzi3VLGg4v
	8Ab0eUlH5BKc+mok2uZ8KNYsZrG7/gZQwKrmOYkqChCSHWdXsPPgCR7YGeAEroT6S70FrqO111T8i
	0ZQyEFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBtF-00000001LMe-3RZu;
	Fri, 26 Dec 2025 17:46:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBtE-00000001LMH-0s14
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 17:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3019460007
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 17:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC214C116D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766771170;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AmI/6adOPlKtoWCWqKZe5yJ8oG3l7QmB6BbKWw9PHiLE4tV6bO6ppPs6EZc4/Mvo5
	 BjWFzvBn3Qb+2938U+x2In324OewndYjEoiGA/Hw5Lu/asj+hGzh2cw64zgT7fE4/u
	 U/n2g3PR+kAcRcNK7qFD+pdAZr4pwngYfob6YN3eD7/S/ulXVd5Rnl+Sfj+LvhRFSg
	 nGuEoUds1QWt16egeOkTcuQVERlbhN7u/q3mpxsPxTWlCJTsfc/SPGD4dNKcGKsOZI
	 7Sj1/m7i30EuY3YG84OmaMZArKg4RaWE1y6BIuUKyZ7mb/7fl7maX3SxZ/FpXjkRaK
	 IwWMLTZ/mE13w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fdb90b670so36188697b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 09:46:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCS/quF62DqvkhD2yGQx8O+HWWZKgclVB4CUCDaook9hmaYCHWMddHnibnKAWkLTYuJM1cH15F6RMyLCOsED7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FZVh497kED3f/iU4mR9UDEqTveFYbSfX3CwxiF+fQTAG6Fvc
	q4idYUzo9lVAla2iRxtBcoWF2+jTxvdHa41biDnFapQpv6rn9nCOKE8sVQrlnt7rjhQW+9XsEGE
	kfFtUCzABViYw6fvS7j/d3Ydu167rNXY=
X-Google-Smtp-Source: AGHT+IGkQ6XUIR2QS+jzQzwyb+uH06UnhoOZauP500HEuu+uE09VYZhz6TrKU/N7A068s7lGjbjGraZIx3VxSmvZI40=
X-Received: by 2002:a05:690c:680c:b0:78f:9854:2603 with SMTP id
 00721157ae682-78fb406ad93mr234198697b3.28.1766771170211; Fri, 26 Dec 2025
 09:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
In-Reply-To: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 18:45:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
X-Gm-Features: AQt7F2rJr7E3FC3Q9d909t1YtxKsBcuUtJWHcYVrXihmnvhQlQW_9VrzDPk4caM
Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: restore previous register base
 name array order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, Dec 3, 2025 at 12:33=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> In mt8189-pinctrl driver, a previous commit changed the register base
> name array (mt8189_pinctrl_register_base_names) entry name and order to
> align it with the same name and order as the "mediatek,mt8189-pinctrl"
> devicetree bindings. The new order (by ascending register address) now
> causes an issue with MT8189 pinctrl configuration.
>
> MT8189 SoC has multiple base addresses for the pin configuration
> registers. Several constant data structures, declaring each pin
> configuration, are using PIN_FIELD_BASE() macro which i_base parameter
> indicates for a given pin the lookup index in the base register address
> array of the driver internal data for the configuration register
> read/write accesses. But in practice, this parameter is given a
> hardcoded numerical value that corresponds to the expected base
> register entry index in mt8189_pinctrl_register_base_names array.
> Since this array reordering, the i_base index matching is no more
> correct.
>
> So, in order to avoid modifying over a thousand of PIN_FIELD_BASE()
> calls, restore previous mt8189_pinctrl_register_base_names entry order.
>
> Fixes: 518919276c41 ("pinctrl: mediatek: mt8189: align register base name=
s to dt-bindings ones")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

There have not been any comments on this so patch applied for
fixes.

Yours,
Linus Walleij

