Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A4BD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQKyQwEsCacCK6jVHuYsDTLB6KsoXH6S+aq/+uz0ago=; b=oEiv5AaWipVLJz
	X7Bky28JmvxkBt4aZA1O0xz4QLhjbP+Z1vxepLLslRTPROxItRK7V0t1QlXQwoOd5bM5IcW8wB9sW
	oGeYR/boXPQtp4X87ExQGp/ILZkiVToZzBF4Zo7EQ+sBLHWv6RlAtjkKpVAfljVhLE79OjjJNZej5
	xUR6jj/10I11MPiI5H5Q8X6a0nI0F2afMSqcbGrkS7cvH7Q2tT4PUIggc7daaWzdSUzZ/AbDHzE3B
	hWn920g78ImopRrgfW/G+hRTf/ehd28MW1IIx+BXSbyaKXM7Kl2s3ytE8Tz4lkNnfYGPQSQjdNJXd
	DEimu02Q7RFNNKVALo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbM6-0000000DRyN-1XW8;
	Mon, 22 Dec 2025 08:33:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbM4-0000000DRyF-0Iuj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BE7E60149
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA139C19425
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766392402;
	bh=rnF5+/PRAEhxUkP81f8iZpYy3Jrx+97OUsmm0ntfnw8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=eB+rBlovTV4ziI+v1LW8ihA/IJbRmMiLRDpXWgTZvqVJ7k1c9UJzT/t31F1fXbqry
	 7icB2etdeKp3B5jnX1RzVFxTX/HeIQ0Y+jw+11KcXbUjdt69Bp5wVgYx74cShp1Fvl
	 Cpl3od/Vf5EyS9G6pUVcc/mM3pSPFACuqz/sGujtbeqFvxUd/jTx6sCwGiiQPk5cjo
	 TeRnkauTyR6w7ajE3ST9bVZ+DdhtliOYPqGCFg7BPUS/PKWzUlVYVz2lDt0lRZYDxe
	 DETKFemgesLM7gfcdX6a0IaJ5sqSY/8B6s4e4qx0ltJERC+hQnK4JAf6u4l7ahTkEk
	 Xvftki4aVXAkw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a2dced861so46872731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCi3rE5A7Vmqq1lKu9HdU9jFytbOBQhMAS2FtoMs7RGWJCdb+T3ZOKRMpBDAeJPKCACVDV06bm5J8V41YGveub@lists.infradead.org
X-Gm-Message-State: AOJu0YxeUMC4RQsNnt6fObkFqrFNK60BcC7XZsJyP5sPGhX0EdJsSQ54
	5wZSjAHhWR6/QBPPCjKeXtxnLT7FAuoLxTLfoSmESOwXaoqX+OyB8BYAafdpRElOVkeGREj2PPG
	Z+OClQOIaGn/FA+O/4hS3RqfP+idO1ls=
X-Google-Smtp-Source: AGHT+IHB6OBorWsfY6+CIhWE8h0rTjrmy8Od+EzD/TbreAn6ZtgHO5Oaa3cC2BPxGnzahO2w6j9LzKizjq6i1v/7zLQ=
X-Received: by 2002:a05:651c:3050:b0:376:3792:1a9b with SMTP id
 38308e7fff4ca-38113295431mr42863951fa.21.1766392401138; Mon, 22 Dec 2025
 00:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20251221110513.1850535-1-wens@kernel.org>
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 22 Dec 2025 16:33:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NbSA8Fq16EL-zY9WKVxnYUosk6z7NrGtAXt6UY8xdMw@mail.gmail.com>
X-Gm-Features: AQt7F2qZlM3p2jvComgFcEXRa14BK_cQ9N8F1hZOpPR9GT9NbbFY1DHlKdoycxY
Message-ID: <CAGb2v67NbSA8Fq16EL-zY9WKVxnYUosk6z7NrGtAXt6UY8xdMw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: allwinner: a523: Support SPI controllers
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, Dec 21, 2025 at 7:05=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> Hi folks,
>
> This series adds support for the SPI controllers found in the Allwinner
> A523 SoC family. The SPI controller is almost the same as the ones in
> previous generations, except that it moved the "RX buffer count"
> register field to a separate register, and that register now reports
> the total count for RX buffer and FIFO.
>
> In practice the driver has never cared about the buffer count, but if
> any implementation were to use it, this counts as a non-backward
> compatible change.
>
> Also, one of the SPI controllers supports DBI mode, acting as a display
> interface. There is no infrastructure for DBI interface controllers in
> the kernel, so only a separate compatible is added for it.
>
> Patch 1 adds compatible strings for the new variants.
>
> Patch 2 adds driver support for the new SPI controller variant.
>
> Patch 3 adds device nodes for the SPI controllers to the dtsi file,
> along with pinmux settings for spi0 on the PC pins, a common usage for
> SPI-NOR flashes to boot from.
>
> Patch 4 enables the SPI-NOR flash found on the Radxa Cubie A5E.

As pointed out to me on IRC, this change targets the Orangepi 4A, not
the Radxa Cubie A5E. The latter has circuits for SPI-NOR, but the whole
block is left unpopulated.

ChenYu

>
> Please take a look and try it out.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (4):
>   spi: dt-bindings: sun6i: Add compatibles for A523's SPI controllers
>   spi: sun6i: Support A523's SPI controllers
>   arm64: dts: allwinner: sun55i: Add SPI controllers
>   arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash
>
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  4 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 94 +++++++++++++++++++
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 15 +++
>  drivers/spi/spi-sun6i.c                       | 11 ++-
>  4 files changed, 120 insertions(+), 4 deletions(-)
>
> --
> 2.47.3
>

