Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED6F8924D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=; b=fDpKnkn3Hl1yOjeawrHTsPhIIL
	4Glb/gMQLtVNO68ta5KqUY/GAOwLgFVJxS5cRkp8/qiu2/XqHssIopQdaem7agQZxP0Ye9DNIZSuh
	ByJ4nmtxIezojrPI9LTU5xW9pykiTB7/vg0ooLorqVXAwLKdAWFyuIvaGVOmyNOhmRTfj6vPcXsrG
	NMx/XTIJmY6cfJxd7gHnwzoEiKLG7jaxEO42cjL/f/Upe3FHnOh045XlxVxEQ0IcpKslaobhFme0A
	8xtKWE0BR/cKJ7cVNtUWHzagcMgM9uuC2Z3UAJ8Ww0op9bP6/lO1u0VI7tnE3cuaXabbU+p/acKG9
	/NMo7eVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Ix-00000008QAH-0Xka;
	Tue, 21 Apr 2026 10:26:07 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Iu-00000008Q9a-2TIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:26:05 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c76d797b180so2827480a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776767164; cv=none;
        d=google.com; s=arc-20240605;
        b=DpDFrWCsm/3aYiYrXnOew+ixw9y5swwUhwtpX88P5TrsHdfbk9eKbso5g3+aoCPgZc
         PgQHRragLv+KjUqH8UwFAJ1YGa/Q7Cc6TPBUcQBTAS7O/kHTdOkS2TYiv6NeGegcQgeG
         hYAIdB79OVxqfErW6ye4cJCM7OQSt7K/OZA30lg+KpPtex0T1wd3OdzTQszKoKxOvlw6
         yxiAVf0RjEMZ9ArzlkCEd00HRaKJkl2SCNjXIwIt0pxM11gXVnYbFVJLZtYOyxhswsIn
         /tsLUg9+p16rJJNbCVNfIr/jyGH30qUvOvA6emXkEJVRjnitC7fmK7yXHtvG/e0llku5
         rMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        fh=D8deqzxDnCwmD8D5gzF2ZTc/VBkbL4Xyf02M5HhRCmU=;
        b=KIW6Y+Q7aK15i5RYRDqgux+Xew9cwuNwQNAj/QfkCkn+6JXtVd5aiztzkMa42SdgOo
         m4dsAMRz60zJZU00gDRcqPKGcJXnhksldpzXii3CBmzxmFEkljANK8gYo34iAP41vy2F
         AXUMX52Ceoe7juHFs77/vsQCan6aOLzD5ecxZaRjmdxP1iQnsFt6QF7WZwGEX6gpHbww
         YqLuv5kgYwrsHB69sXMb+qojy2xoNK7CygEU8+D7AIjEyOlwL8UV4ZHtEt0DOfqJ3npH
         2JGaN1CUCX6EN9KzXLjZIPSTHYqcTDSIuotc5f/Yzf5ZYk5mzLSLDbBbl1coPLCUTOt7
         4Bmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767164; x=1777371964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        b=FseXjuecQDakSqivtS2xRs/gW2EwasumDWk56Db/HKpHOwlXyhTXtVwdaM2IdGFJK6
         p9doIDqWVvFxn3vdZKtQHmz1PFc+oXOrzFx6eJ7gzrQ00k/s1uB0oYe7/eiuOTGN5YsN
         kIsTMja6NcE1x5xfP8orU73UOtdhIAbbRuqD2DUfzBQAlQP+e3oxgFMQDX6ga64kOkfm
         apOGvJTQWoe4E+M2Wbac1h4ht9DyEVd4ABlTONq4z3Cu0O6oyBeLgsz4L3SBfWQII36g
         knCKS+5GMv6907MbZuFUo/DMVJAJsO82vFLXmDJg8YUpbO/xQV3o4GzNEvr6o+5cI6TS
         UONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767164; x=1777371964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        b=Luq0IJxF5fv7Z3lwqq3balJjd3U+/ZDNderyAf9AqKeZoQf1mNYJhZ4cCUvUPoEFsJ
         rfWNe4gPLIuilFEy/Hk8a7e7Vw+NnK+m6d94lZkjnxAIHEtXB31n/TqZlJHH/zYbOwV1
         pTfd9j1L7vgnH55KRuuDuIRI5RmPhERvbE8+MMsQgy2AB8G9rvGiSIidBiQ42nRbVTKC
         wxM7fxfqnNMZNdZoZc/+1DhTVeaJOVgDtqlz2rrGYFoknLcvAJCvHpN4dVWjBsIlrWCm
         UIL2yRB0ZsBauudnkJaeYAEhLl6Y5pWzcw2CCcNo4mY6U+G7o8XwaQJYXzKAjrkeY53I
         KBFA==
X-Forwarded-Encrypted: i=1; AFNElJ/HaNM3BvsOUUNfbYQrABYKNtUVXFfH+7UeNi6c+lvrBFnMDAUP1mmI6mPZxUaFZJAknDVTAyIV937Av+7RnhrW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz07fRQ93HtU37E/TCC3B1T3wNOtsNP30TciuDs0j0lSzkYRXdo
	eJZjRL9N++fd3D6v6vULn8CT6jOwObKe7GUTQBes0/KAcY0tVYRdMAD0jwPOykzh4NezfJVIZlZ
	YoVOxKg0WgcPXeCG7mmnpJIvLdeDabAR16Fwm
X-Gm-Gg: AeBDietfX8eWC5YpasxiHYTEV4h2Z9geHdEopQY9/qZnvuo4yBQCguhsmtJKn9GlXLn
	UHhDE4cKIiP3KnjceJjBJRfJVtzdz5lp7udY1JhOE9aKXocNapcOaV3BcSwl7z7CAhNgRTmJEa/
	duKV3RRe3ryq/B7aTn1bsG5lxvC8l7LL8J0e0EMcxZmKHG84kVJziyHoaHsWE+nhxvYhtxTKgX3
	QNboiKsoHPziF2aFkD1U8cXl/fd1BgTiNq+nGF6fReA5J1FDDEnR3+aIzu6cI6dO1rUBbqgF23m
	GcxIekaeNZblPQVlxw==
X-Received: by 2002:a05:6a20:12c4:b0:398:8026:4811 with SMTP id
 adf61e73a8af0-3a08d8a8814mr21400230637.35.1776767163577; Tue, 21 Apr 2026
 03:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260420100854.2095549-1-shengjiu.wang@nxp.com>
 <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
 <CAA+D8ANwT0GKusZtvo6h8mzVf=xXSEkHXsb6nwHGZ2YQzPm5ZQ@mail.gmail.com> <4xbeeozhngkkc66r3ho523vr45yksbyftdckfzwk72zfvwzgv2@7lodth3abysr>
In-Reply-To: <4xbeeozhngkkc66r3ho523vr45yksbyftdckfzwk72zfvwzgv2@7lodth3abysr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2026 18:25:51 +0800
X-Gm-Features: AQROBzDhXWgla_oCt6bVuib2j48W1hMySGsnPl8g4tOPNfdTT8qGzf6cm0imj8I
Message-ID: <CAA+D8ANwgkzKA2aDja=RTLeJX1s7-SfHS8FVC_cjKcRvbREFcA@mail.gmail.com>
Subject: Re: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on
 multi-SPBA platforms
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_032604_636107_019822E8 
X-CRM114-Status: GOOD (  37.97  )
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

On Tue, Apr 21, 2026 at 5:44=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-04-21, Shengjiu Wang wrote:
> > On Tue, Apr 21, 2026 at 4:57=E2=80=AFPM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 26-04-20, Shengjiu Wang wrote:
> > > > i.MX8M platforms have multiple SPBA buses under different AIPS buse=
s.
> > > > The current code searches the entire device tree and returns the fi=
rst
> > > > SPBA bus found, which may not be under the same AIPS bus as the SDM=
A
> > > > controller.
> > > >
> > > > This breaks SDMA P2P transfers because the SDMA script needs to kno=
w
> > > > if peripherals are on SPBA or AIPS to configure watermark levels
> > > > correctly. Using the wrong SPBA bus causes DMA timeouts and transfe=
r
> > > > failures.
> > > >
> > > > Fix by searching for the SPBA bus under the SDMA's parent node (AIP=
S)
> > > > first, then falling back to a global search for backward compatibil=
ity.
> > > >
> > > > Example device tree showing the issue:
> > > >   aips1 {
> > > >     spba1 { sai@...; };      /* Correct SPBA for sdma1 */
> > > >     sdma1@...;
> > > >   };
> > > >   aips2 {
> > > >     spba2 { uart@...; };     /* Wrong SPBA - found first by old cod=
e */
> > > >   };
> > > >
> > > > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device sup=
port")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > > changs in v3:
> > > > - add fallback to a global search for backward compatibility, which=
 is
> > > >   to address comments from sashiko.dev
> > > > - update commit subject and commit message
> > > > - add comments in code.
> > > > - add Cc stable tag
> > > > - Don't add Frank's RB on v2 as there are several other changes.
> > > >
> > > > changes in v2:
> > > > - add fixes tag
> > > > - use __free(device_node) for auto release.
> > > >
> > > >  drivers/dma/imx-sdma.c | 13 ++++++++++++-
> > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > > > index 3d527883776b..592705af2319 100644
> > > > --- a/drivers/dma/imx-sdma.c
> > > > +++ b/drivers/dma/imx-sdma.c
> > > > @@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device=
 *pdev)
> > > >                       return dev_err_probe(&pdev->dev, ret,
> > > >                                            "failed to register cont=
roller\n");
> > > >
> > > > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl=
,spba-bus");
> > > > +             /*
> > > > +              * On i.MX8M platforms with multiple SPBA buses, we n=
eed to find
> > > > +              * the SPBA bus that's under the same AIPS bus as thi=
s SDMA controller.
> > > > +              * First check the SDMA's parent (AIPS bus) for a chi=
ld SPBA bus.
> > > > +              * If not found, fall back to searching the entire de=
vice tree for
> > > > +              * backward compatibility with older platforms.
> > > > +              */
> > > > +             struct device_node *sdma_parent_np __free(device_node=
) =3D of_get_parent(np);
> > > > +
> > > > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, =
"fsl,spba-bus");
> > > > +             if (!spba_bus)
> > > > +                     spba_bus =3D of_find_compatible_node(NULL, NU=
LL, "fsl,spba-bus");
> > >
> > > And yet the search is still broken for i.MX8MP case since this platfo=
rm
> > > has two sdma engines below the bus@30df0000.
> >
> > I tested on i.MX8MP. It works.  Above line is for backward compatibilit=
y
> >
> > The search has no dependence on the number of sdma engines. It searches=
 the
> > spba-bus, not the sdma node. it will find the aips5 first, then find
> > the spba-bus for
> > sdma2 and sdma3.
>
> And you're abosulte certain that NXP doesn't introduce a 2nd SPBA bus
> below the same AIPS in which case the driver is broken again?

Good question. Currently there are no two SPBA buses in the same AIPS
for all existing i.MX platforms and there is no such plan in the
current roadmap,
SDMA is replaced by EDMA from i.MX9.

>
> Sorry for beeing a bit picky. I do see that NXP decided to drop the SDMA
> for i.MX9, at least I don't find any reference in which case I'm fine
> with the patch.

Thanks.  The change should be safe.

Best regards
Shengjiu Wang

