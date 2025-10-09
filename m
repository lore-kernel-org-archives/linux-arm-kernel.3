Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B678CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=; b=cxYab0cyqYgh2/4+/6CtREau9v
	0yBnsjxEDBgg8CiHNM/Mk9g9ZqJ5nSmQxLu7QHiMLrsOnfX2TXoS6ymj13+Jrh4LQL3+OGf7ZNAbB
	6A9RseEZ961CB+p0rARrZ5U9/wnIRc/gxM0jewiuLtWi9nnxq+d8iKwmkSkly+6ayf7ACRRE85uND
	UWu2hWAuVZgT1O9yH2jJlM55DtUQhz23gh9wvVD1LLhhJBBq6RnbEV8J1uTySwzDRpFwjNQrlAI1h
	69fZ+wKv8LiBD51NAyuNyIcfl8oFotO/aZ+R918n3enSnPnN9JPTtu+FtvAWX119AMfFTLQB+TJ7W
	GGmWfMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lrb-00000005Umh-41mf;
	Thu, 09 Oct 2025 08:19:03 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lrZ-00000005Ult-4BDr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:19:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so1326793a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759997941; x=1760602741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=T6+5cFokQ5i2eJqRgirWDHLVJICiV8kh2zKskkmT6bSriRET2dxVjZppvxxA4tqiev
         fYv0nOwXj92mWJQLs4Ivt2x2eNgB7AC79JyWfTRZI8YFVWoEBuJ9RWLu91rSuRkJYaG+
         n2MfAmDubCOVZTPVwrl0K61R7Ip1NoHDwCxGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997941; x=1760602741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=jNndnS5CLZvNEMAazBV/1JcvvMCSOK6SvysDwVdurAoGlufykcuUTXixFf4/adt+R8
         MURSBw6/kS66E647lJ8vizFOdQGDT9EHnaGn5DhVgWHR4Cofc5MZxLucoqc5/uJXyBt3
         7hrvYpzwUBB0xEAPg2xTC+EW65uVyktlt7/hT9jynCCCLL/+AXc9e5wlOB/gY9j66c5n
         7QxOwgLKWhPXxkOASNmDj+pfSQ9XKjcWC2M/Z+tpjVk+w+fEI3H04+pcTTDfAQIL3HMP
         oId6S04ofv9jcEFolKzkhZCYUi1hY8iFFQdey1SJHTnHvGCxvGI0wSU4BBGQxTajAi4b
         gcgA==
X-Forwarded-Encrypted: i=1; AJvYcCW1VKuDwZ0ghQ9mdOgs4B6+X3uknJcREK0m2rGDjGhrGQE0FtEFLzZJuA3uGH/xRxzzr0hUKzmxAdBZ4puauc08@lists.infradead.org
X-Gm-Message-State: AOJu0YwAEJK+M4XMBNCZNjyrTGWA1A1dxd5mhIZTJI8wamkbFH1Bxrt5
	FiF5siJPPk3ezTvxv0ChXIT8AFKaJ8rW8l1I/AuzcgGd3da1SSYFFVMtv8YCfkXiSnP4jAliORO
	bYNlR2NB4vdFRjVkO1tUEsoP2xvemcr83n/9YAbn7
X-Gm-Gg: ASbGncu67/5Cx3XhBk+hF5BZMUhunlGr9zFn/cmJFaw9S2roTtEITJyNkT55DVNuevc
	Pqqxa+zv2J4ez6ZLrye59SG6vkCVGkEcghcczEyQc//tS+rctU226vYaNdZXJkMmOxSha+11i+i
	CKrEL6ruWbkRAFn7yEK5r6hxZ8IfIDDa9ApFF+jDWO1MUp0XQHgpsowpY89/2BwH4LwHJBelK6s
	2U+6J/PVlEcw7iY/E0qT4fJqCFqnSXhryzBNAqyEI7v//o8zghYe7C/uf0s3g==
X-Google-Smtp-Source: AGHT+IG8hUHTkL+0dXNTRX/4yTjjacHxUhJpfIwq4JvXFm1KYIbTsH15Oh51ajo74tr7nKhGrgMAEZfz3BlrBGqWW9I=
X-Received: by 2002:a17:903:28c:b0:267:8b4f:df36 with SMTP id
 d9443c01a7336-28ec9cd714amr123635935ad.29.1759997941215; Thu, 09 Oct 2025
 01:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com> <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
In-Reply-To: <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:18:42 +0800
X-Gm-Features: AS18NWCTXFo8_XU732GoC_EADGZOvbHUHoSmyBMCpLqt3ZP7mbYJfRNT_Vg0jY8
Message-ID: <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011902_090877_E2205736 
X-CRM114-Status: GOOD (  23.66  )
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

On Thu, Oct 9, 2025 at 4:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> > As it stands, mtk_clk_register_plls takes a struct device_node pointer
> > as its first argument. This is a tragic happenstance, as it's trivial t=
o
> > get the device_node from a struct device, but the opposite not so much.
> > The struct device is a much more useful thing to have passed down.
> >
> > Refactor mtk_clk_register_plls to take a struct device pointer instead
> > of a struct device_node pointer, and fix up all users of this function.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
> >   drivers/clk/mediatek/clk-mt6765.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6779.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6797.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt7629.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
> >   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-pll.c               | 7 ++++---
> >   drivers/clk/mediatek/clk-pll.h               | 6 +++---
> >   24 files changed, 33 insertions(+), 29 deletions(-)
> >
>
> ..snip..
>
> > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-=
pll.h
> > index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b0=
4e9ab24c2526471da 100644
> > --- a/drivers/clk/mediatek/clk-pll.h
> > +++ b/drivers/clk/mediatek/clk-pll.h
> > @@ -78,9 +78,9 @@ struct mtk_clk_pll {
> >       const struct mtk_pll_data *data;
> >   };
> >
>
> There's a forward declaration of struct device_node in this header: with =
this
> change, that becomes unused.
>
> Please change that to a forward declaration of struct device instead.
>
> While at it, I'd appreciate if you could either:
>   A. Remove the forward declaration for `struct clk_hw_onecell_data` and =
for
>      `struct clk_ops` (as both come from clk-provider.h - which this alre=
ady
>       includes);
>     ...or...
>   B. Remove the inclusion of clk-provider.h and keep the forward declarat=
ions.

Prefer (B) since no APIs from clk-provider.h are referenced in the header.
It is up to the implementation to directly include any and all headers it
needs.

ChenYu

> After which:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > -int mtk_clk_register_plls(struct device_node *node,
> > -                       const struct mtk_pll_data *plls, int num_plls,
> > -                       struct clk_hw_onecell_data *clk_data);
> > +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_dat=
a *plls,
> > +                       int num_plls, struct clk_hw_onecell_data *clk_d=
ata);
> > +
> >   void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num=
_plls,
> >                            struct clk_hw_onecell_data *clk_data);
> >
> >
>
>

