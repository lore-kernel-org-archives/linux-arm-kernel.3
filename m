Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A953BCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=; b=y5XqvhXRExKltn/DV8g3d9dT5m
	Q5QC1v7EmTAASnntlcQYFj6T/HD3WCDx+vDtaA8pJC7bm/eKwYDIkrpll551oPc/5w/Aem3XwIric
	3z0+afTqqV7knXiuaayAg33P2AwEQmQDGKpXrcuFEkaA1M8jm75oWSgYzlTkkdHT+1QspLqJ/DoN4
	lEGcwqI4GBmE0KV6giTDLZ7dh8dnRceb28Y5tfyWvimmUnHgNqjXdzqizu5gwRf6HZj62zAUpdwId
	g7JF7/DHveI/DIBiUbjAbPaCVspMh5U9oGAsMdbbHd7MMDnKKK7H95uCUCRM9BDxMgbxV7hTyWjbl
	d2nwHIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BHo-00000006Ub5-0WgO;
	Sun, 21 Sep 2025 04:02:52 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BHl-00000006UaH-39jQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 04:02:50 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3357b8aeddaso4988909fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758427368; x=1759032168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=;
        b=awCTuYARRrO7nbsZkyBdt3zzfoxflGe56BZX1IUWUOmD0C373uW7ifZ8QNH6wyjkaO
         vqaxPPvD8bKRdbORjVt0umFqFCFpyiwFCkcGxNo1FamGFO10MA3hmKKxE5d1UGeSMtG/
         dsUbduEQeOwc1lJiQvBTJXWCmIDDh+CijV30Kb1Vq25CO9Nw0cozAsQTXdasPwSY9u95
         46SeWzEthu4HVTKbQEbIB2WZdgoMBv0VlW76mTQ+F7gOKo8GH+Js+9dk5UxmTS11nIY6
         bx4wvOWzfmZCSrZKyysGsJss99cOmXbPxot4UrqRVsPopSGW7h9NsJhLO/BxQr/LnhMi
         p+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758427368; x=1759032168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=;
        b=Xa7WPwfMGqD2KtNYFlf+8xNZRvoTMUqZ070EYYvzolG8HaTyZM8vCpJWImre9A8LKf
         QIxjs3sFMOw+T+1sXtBsUTYIDwQ/4eiCHm7FZt3uKbdOlrRpcivcKsRExXXfeW08No2p
         zJsE8pN70HQ5Igkl+m2sETvvLcGUs9a/MHPaN4IPabx/B3sKruZBRM3zTJMsm+wyBgDY
         tZZbac4ICYTP6ZEllZQzWCar/1vj1vZpWh4svgtDN1VT3FPa9qjsJimkxr+C8jC80dPb
         5RZx4iy31nmZwzW2vlPUTRcHllibM7nYKaoOmFRFBYOC4198iTD1zR68M5yXXgacevl5
         50Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXqsnnsb75vrRsDMtehWgkrOtPv5FB++E+H6Tko+IIxCne1OXQRS6McVoPqq0tUVg+oSFB/vqfO35T9gmzhTxCp@lists.infradead.org
X-Gm-Message-State: AOJu0YwtOEm49KVQbWHC916KuX6Z8Pic0Rj5pY2u3YHxl+SI3UCoVbwP
	39sFGsSBcnJHS4KBP6J/mrR6ZewfQawBRdLrwybtvJqvkJnA43rqV5fmxbn1+rIN/aKkJrc/+At
	SvZm1QGyd28Q0XmuWfukflInMhGnmvvI=
X-Gm-Gg: ASbGnctO0Bn5YLs5uyI0w5QN4Hr/4bM/YsZqDq8KvKBSmDb5Xp1PONQp4pYXT41Ue5T
	ZvcYsq7+URKo1BqRIdmN9cu0DYxy9JK2nRFD0izB51PAHHJVG7UhjircDtOyJnoakWhH1cvSvx/
	tjPv5G6nVZ2IZh7a1CTpjRIbTPl0uE4MtGUXceN8G1WCb46ZOX9vIVEveekradSutZm0sn4mmIj
	KsStntl
X-Google-Smtp-Source: AGHT+IFZLr/xsThdfBtqHXf4ZSYYWdYKPhHyHU+8bF5NmoloZBLoe+bOTD86dgsH7ivu1U7543S8yu2mTI8ezy8bXJU=
X-Received: by 2002:a05:6870:e98c:b0:315:8a2a:3f59 with SMTP id
 586e51a60fabf-33bb46243bbmr4362489fac.21.1758427368277; Sat, 20 Sep 2025
 21:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
 <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com> <5789241.GXAFRqVoOG@workhorse>
In-Reply-To: <5789241.GXAFRqVoOG@workhorse>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 20 Sep 2025 23:02:37 -0500
X-Gm-Features: AS18NWDJ-i7DOGCOG3Z1nAPhjBByGeEhge0EG9gSltw9wqhDLGlBL0w1VItqTxU
Message-ID: <CABb+yY2Ay+KqviJvOQC8X8kfzJN6-fQT04A+TCJAkLnWx+XwZg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, 
	Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_210249_790040_ACEC2AC6 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, Sep 19, 2025 at 2:02=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 19 September 2025 18:32:12 Central European Summer Time Jassi =
Brar wrote:
> > On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gm=
ail.com> wrote:
> > > >
> > > > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@medi=
atek.com> wrote:
> > > >
> > > > .....
> > > >
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +struct mtk_vcp_mbox_priv {
> > > > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> > > >
> > > > > +       void __iomem *base;
> > > > > +       struct device *dev;
> > > > > +       struct mbox_controller mbox;
> > > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > > +       struct mtk_ipi_info ipi_recv;
> > > >
> > > > Maybe also have "struct mbox_chan chan[1]; " so that you don't have=
 to
> > > > allocate one during the probe.
> > >
> > > > Also if you have  "struct mbox_controller mbox;" as the first membe=
r,
> > > > you could simply typecast that to get this structure.
> > > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> > >
> > > I read somewhere that this way of subclassing is not recommended.
> > > Instead the base class should explicitly not be the first member.
> > > And then container_of() should be used.
> > >
> > > I don't remember where I read this though. But I think the explicit
> > > container_of() is easier for understanding the intent.
> > >
> > And how does container_of() work ? :)
> > typcasting the first member to its parent is the simplest form of conta=
iner_of.
> >
> > -j
> >
> >
>
> Which is why it's completely equivalent and since code is supposed
> to communicate meaning to humans, container_of should be used.
>
Nobody is suggesting typecasting cfg, dev or anything else.
Typecasting between mailbox controllers is fine and arguably easier on
the eyes than using a container_of.

-j

