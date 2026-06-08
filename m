Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F29BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLpibFS+5Lc7VxgiVaeI5cCGVed4eBL/hTebJNldyVA=; b=17cBP1La8x1+kqAFAsLIBT4l2i
	BFFfwLtGncpGkU5axjX5kdfJXuwU64ua+9oIQY9z2ye4vPXcPtrMkhTzBbGcW8e2r/d1BMgjgi349
	i7AsNL3BKbfjZeq62pnlkaiGIcF9Axt65Mc5zLId2J9kgmGK4mPTLk2WoHVo+vMa1y4H2kzS4LcFQ
	HNzWLHcqoEsEt1+/9hsNxzcEuTh4P4heME2nTYiuWdINtMg2N2cAHBaAUOP64tKlfpdYHEt60v6hw
	Kpv3BSZozHQT92rWbsgGW0ZPDJRafPuS0EOFAQj0D1cs1h8v6eyNbkxzJTCy9Sjuj6p4vtd4xlInK
	jRRaQyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfr4-00000004Jdg-0cTX;
	Mon, 08 Jun 2026 19:41:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfr2-00000004JdT-1LaC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 19:41:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4E634441A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829D11F0089F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780947707;
	bh=BLpibFS+5Lc7VxgiVaeI5cCGVed4eBL/hTebJNldyVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WdyC108xzDVINL+da/2skSYY6qEw3rEDX9F/iZr2KPIkJd0KacsRRPH5nm10cpPvj
	 Btt7ftSjxA6UqMh30hUB1MNfcHLikoRoaTONvnqpIVL/tY5xUMberx8kH36VZd506E
	 5htfp2IumiZ5eU3KSvFB08JmHM8mu+U3AG7bWAKQ1iv9P7mSte4+8sQX26vThCy0dX
	 Y/Q1QaRe/H27Vg4XSJj4oSEs9Y23TjBpwll+DgTBOQ+yGIOgUQmsu9u8/AxZVcAdmY
	 mP1R6KQ/IgfZSVY7laWxuOcfHwbzszuNc0lr6NyXpi72YgmnW/ne9kK0Asu5GHMpn1
	 yTQd6Jhz0ckCQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3967620ceabso45492921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 12:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FZyUmQa7znmX3aCHDX4NOq3FxnMa7uy9VwmTCQ8x6Mj/nkF9d7qHf0S77ScoIRaFxD/D7rTcquNCONPj3ZC2P@lists.infradead.org
X-Gm-Message-State: AOJu0YzDa99KsvB7eXkLwyN8rAhz/1vOF4aUhBV+DL6yauHtfRtqASli
	TGRtIWHiqU7TiQQ4qcHL2c1aStECbqRqlwGykDTgOfJGRi3z0EXOJ8KbJNYIxg8LBqzG6Ik1imL
	hiz+xpDu5qHLlniQ+7gHZ/knCH7c4omM=
X-Received: by 2002:a05:651c:890:b0:38e:58c7:cca with SMTP id
 38308e7fff4ca-396d094cf1bmr44352071fa.13.1780947706287; Mon, 08 Jun 2026
 12:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com>
In-Reply-To: <20260530145800.1029920-7-y.oudjana@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:41:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
X-Gm-Features: AVVi8CcfWWYi2fGJNDF5xiud1cjk40ojeeoy7Quaf-aXtvu2im0R8N1WQpdd9og
Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

Hi Yassine,

thanks for your patch!

On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Sashiko has good comments on this driver, look into them!

> +config PINCTRL_MT6735
> +       bool "MediaTek MT6735(M) pin control"
> +       depends on OF
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_PARIS

There are in-flight patches to make MTK drivers tristate for
the Android GKI. Do you want to use tristate for this driver too?

Yours,
Linus Walleij

