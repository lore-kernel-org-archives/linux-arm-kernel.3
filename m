Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C464D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=; b=WBFZeyEu2GZHPolV7cagcb+nqc
	A1w2v0o5AGWCVg/G8DKVwQYIvzO7in4JUlbCTftZV8f8xZB2+ocN5QMKvhoZC8KfqOojFDBEZBvFg
	SBEUD5hxVRONORz5E4RoZxYkSOq13VIBNG9ho7ks4cgz6OV532RB/6zkaNc6i8i6e/82ONdZHLCYG
	53MxKTbhXljswGwqSR+gNCsCb1gFFtqRSRnTFzZXLFaHfGs+Xb66L5T7QO2fVn2mI82CnyB67kCCf
	qG0xQRlicOvGsU4UD1gJznsQPUZ/KUA2DR6glmQgXqMmRjIUQjoWWivXb+EuU3ZTMOVADrRyFapBE
	6mQdWSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9GB-00000006qMM-2KTB;
	Mon, 02 Dec 2024 16:26:55 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8yM-00000006mgt-0lJN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:08:32 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6e9f8dec3daso33422757b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733155709; x=1733760509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=;
        b=T3kgsCg6QDahtCSItonpPS6bTEZk68G1lXPttvjYN+WNX+NFs+RXMxvmmW3wCIplRk
         9C6VgStJyYbaUPsPJegSKQjgUCpPl8k1K1eYCuZZB32jcLPulz/vlYyyTcVMuSYdwidc
         TTY64Ii7Z/yqYiZ4w08c10OXcf0faGKM/aV9A8YXa0ursnIsYKaPrDE0tPpXPLDiwym2
         7iYg7GzSGhw6XUDna98OFcTh5MfmRrAwsXkhugrPiHL4dJZqZVyKhHLAmg7i4Ddg9jjG
         zr0dE8ZAV2x4H47y0OdnweerPxwcJe7y2Wre1kOejf4w+Ievs1ioPe7jMprV6JpTBrFo
         c0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155709; x=1733760509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=;
        b=gJxjd08KyduaniCcBis00fDWR0S7L7vTTzFxvREMVQKBMxDaxd6YEtEhFSMhHluV1c
         b3GnQCfSfHjXHWMhBbUC8maZYAyCyGMpxJyXgoCWXlpR7/pcYjnNDNVoo9NS6vvs+p4A
         xRjBZiZk8ucbLV3tdn0OjXJUCFBEF/mdBlBRoVHciygsPe94RxDRyPlDYuQPzaulXNoZ
         JyeMSoMEA5L6IqnFEc7+VZ+qXE0Sb+7IoHbSD/L8w/Ghym84HZfIEOeRy6dezFDDVDpr
         uqudQ097QrBPRlFtgjFuqA6KBVp3EF8UmbT7++aYBVFrDYTIl+Z3HY/A3smtZi/5GNuX
         Ud/w==
X-Forwarded-Encrypted: i=1; AJvYcCWiGwK0gl/onQ/iIzKku+xacoxCeQGJUdJpzQi7ZfC2D0U/Pt8yFAuLzVAq4GvTb/lTx1rSAO8EFzrVb/QRjCLn@lists.infradead.org
X-Gm-Message-State: AOJu0YxF1IrV6YzuEDZH8L83dGRn/pMYe+KhaTUfO8NZg636nKHD4Ajy
	H5hDiStmefn1V+cuFQOfeNqyNwDhquIx3AzSWFDquA9LiknBN4K8H5OsAINqGcrR1EhQP+AGhP6
	tXkMMoQ8Vh9Kyx+9aERryzpCxDo6s2rk/T18WxCEL5+RYBdzq
X-Gm-Gg: ASbGnctphseHXvx/aHzCmtaPbzVGF3iJXbuOyRXA/8ZhexU8j4BnalpJgzGkbokJDVK
	medpCUFU/cvHM65UP3vjkae1+Sx3KU7rU
X-Google-Smtp-Source: AGHT+IFz8rX9DRRJ5onEJ67Od7I+D7KR9TNvA59oNfUh6oW0pwLXWng/zcOviJd4aYPyq52DFvFRuuqZBB6m7oAYo2M=
X-Received: by 2002:a05:6902:2b07:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e395b870e93mr21476694276.5.1733155698386; Mon, 02 Dec 2024
 08:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <CAGXv+5E4=dKkUo73x5vCMHawcr9AUd71LyLmDbdyOdJZv0ZBaQ@mail.gmail.com>
In-Reply-To: <CAGXv+5E4=dKkUo73x5vCMHawcr9AUd71LyLmDbdyOdJZv0ZBaQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 17:07:42 +0100
Message-ID: <CAPDyKFor=KyPEfrfLWct0dLa03hj6uawM-R3z4rOEzHSrNCWCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] MT8188 DT and binding fixes
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Fei Shao <fshao@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080830_221368_17BC55C1 
X-CRM114-Status: GOOD (  23.92  )
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

On Mon, 2 Dec 2024 at 05:24, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi,
>
> On Tue, Oct 1, 2024 at 7:31=E2=80=AFPM Fei Shao <fshao@chromium.org> wrot=
e:
> >
> > Hi,
> >
> > This series is split from a previous series[*] to focus on few fixes an=
d
> > improvements around MediaTek MT8188 device tree and associated bindings=
,
> > and addressed comments and carried tags from the previous series.
> >
> > [*]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium=
.org/
> > [v1]: https://lore.kernel.org/all/20240925110044.3678055-1-fshao@chromi=
um.org/
> >
> > Regards,
> > Fei
> >
> > Changes in v2:
> > - new patch to MediaTek jpeg and vcodec bindings
> > - new patch to move MT8188 SPI NOR cell properties
> > - revise commit message of vdec power domain changes
> >
> > Fei Shao (8):
>
> >   dt-bindings: power: mediatek: Add another nested power-domain layer
>
> This one ^
>
> >   dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
>
> >   dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
> >   dt-bindings: media: mediatek,vcodec: Revise description
>
> and these two ^ have not been picked up, and now v6.13-rc1 has DT
> validation errors for MT8188:
>
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> syscon@10006000:
> power-controller:power-domain@15:power-domain@16:power-domain@29:power-do=
main@30:
> Unevaluated properties are not allowed ('power-domain@31',
> 'power-domain@32' were unexpected)
>     from schema $id:
> http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> power-controller:
> power-domain@15:power-domain@16:power-domain@29:power-domain@30:
> Unevaluated properties are not allowed ('power-domain@31',
> 'power-domain@32' were unexpected)
>     from schema $id:
> http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> jpeg-decoder@1a040000: iommus: [[101, 685], [101, 686], [101, 690],
> [101, 691], [101, 692], [101, 693]] is too long
>     from schema $id:
> http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>
>
> Is there any way we can get them into v6.13 as well?

I don't know why I missed picking up the DT power-domain patch for
v6.13. Sorry for the delay. Anyway, I have taken it now and applied it
as a fix for v6.13-rc[n], thanks!

I assume someone else can help to take the DT media patches.

Kind regards
Uffe


>
> ChenYu
>
> >   arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
> >   arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
> >   arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
> >   arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
> >
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
> >  .../bindings/media/mediatek-jpeg-decoder.yaml |   3 +-
> >  .../bindings/media/mediatek-jpeg-encoder.yaml |   2 +-
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      |   5 +-
> >  .../power/mediatek,power-controller.yaml      |   4 +
> >  arch/arm64/boot/dts/mediatek/mt8188-evb.dts   |   2 -
> >  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  33 +++---
> >  7 files changed, 88 insertions(+), 61 deletions(-)
> >
> > --
> > 2.46.1.824.gd892dcdcdd-goog
> >
> >

