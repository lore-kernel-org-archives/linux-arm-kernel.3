Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68978CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=; b=e740cxo3Ym38Pm
	3HyfFABXdZjMP3+oDQaK6sa21fU9mkCXtFrVXFtQselumpEswW0DHFj8xz0eK+TepG2XgxKduY/f6
	HINEt6gfrt//ISpBtGmEMMbqtKoS3gy8kc9aVwPCRIH1sMqpavZyy9bbjbxfVU0f598FNSt0C+KiK
	mEvyk9UyymQP1IjOe6QTDsssK+4KB5rywV937xwiZwQ5nB6k97xRYSDpGQ3Dj2zZb7PRaeFB1Fmka
	iJzqZ3HjiB4uinthcfG/mazMzMfKVJNptZs1fGEwvpDfao8U0oR5ytJ3o1WpfH+bdkQXuP3aIPpqz
	Ol6u3YKH/ygJ50767xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMmP-00000008wWQ-45Cm;
	Sat, 30 May 2026 16:43:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMmN-00000008wW0-2HpB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:43:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDC7542BB9
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23AF1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159398;
	bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Qtjxk4cTmrxuyYwRg0Gn/54Zo7PflF3XoWSNhJqxxeEtgel+rF9QJydQjc/Gyy8/Y
	 6UkFPGzspzkdMKLOBH/k1c0T5DyaW9JxWEkEeG7gUz2ctFS8oo2JwJJbEBMKl5n/pV
	 JegRUzdxEElfST3kpdXdyi0/ZoPS3Zo1XmRmJBRoam1hX8ajz1BIiKKJA8SdSJ+PW0
	 9rUUUvbLFl6l/hFnHSE7Ck5KMbsS5B9u94sAoU8T0dWR+CNGqovTthKJYdpbMNWO7O
	 puSXtHwRa5FHLCUYaq7kj3TSIYssDZk1MBoo43FU6gCALFJPo5M5KFAX4Q4GLZvAqd
	 /Ib1a1urHIM0w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3967724bed1so285501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 09:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9X5FJCXxtogXFAAx6FvL48tbMWw3IY2nxNpCmO+g0AYGWsz1E4r+PZngWktql+jaOKXKNC7P1/8G/+XzUsIiHU@lists.infradead.org
X-Gm-Message-State: AOJu0YwG85ZEfozEwYc9O6sck4n2Q9mvh6xPneaprgxQBb74g9Y/jLn0
	U3zxkCtr1R1lGMoNNxYMSGV4Jmmd5Ir75joYoQryxK+TirdrefLnDvD4NCMmgwrKK18Uwu+vgk3
	+RLPMG+9tIwYq5q2tBjG4w4/YyxtEUiE=
X-Received: by 2002:a05:651c:20dc:20b0:396:5731:db22 with SMTP id
 38308e7fff4ca-39664edbde0mr9068591fa.23.1780159397154; Sat, 30 May 2026
 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <20260505134812.408316-5-wens@kernel.org>
 <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 30 May 2026 19:43:05 +0300
X-Gmail-Original-Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
X-Gm-Features: AVHnY4JPf-OCVxDr7xF6UmPyet8eqBpmFwZfdZsz7_1mZVTdUTpZyn83IUGk-ro
Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_094319_630019_8C6CFAF4 
X-CRM114-Status: GOOD (  17.99  )
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

On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> > The Allwinner H616 SoC has a video engine hardware block like the one
> > found on previous generations such as the H6. In addition to the
> > currently supported features of the H6, it is also supposed to include
>
> Remove "supposed".

I can't actually verify that, so "supposed" is accurate from my point of
view.

ChenYu

> > a VP9 decoder. However software support for this is currently missing
> > and still needs to be reverse engineered from the vendor BSP.
> >
> > Add the compatible for the H616 variant, using the H6 variant data.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> With that:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
>

