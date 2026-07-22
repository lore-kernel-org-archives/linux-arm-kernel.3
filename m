Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC75C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GCVFozR6/36hQtPeMO4srDIGrlB3Wpr1gIirTgwllo=; b=pdFPO1ipZnBPwi
	Ii/MJnqd0JeJVoeNACbomVJURvRC066VDIK6wEXZ598Co9UsYLpKPm0OMbFgmMPduXAPg4NLfFpjs
	o7/uFIEowjox4s5ZIJsesc8ooWqIi6JlT2J0FQhJ14PmdRx4N709SQqQeclUUc1/afUsUi/qLf284
	G7WaCCo7SNUDBJq3FeVsBfIlw9Cn/zRbyE+MPosrlHL23X/2g/6EcU0sUlsMZKWjW1uR7UISjGlMB
	lDKIZKOhkb1stnbPWsivSS6uBsoobVg5OOpNxmLN2CXkLx+qceoJANPXbnixJfBki9kpcuqCl3nF9
	e41Yq+bewjKnWG0i79Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSX2-0000000BI8A-0hMM;
	Wed, 22 Jul 2026 08:42:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSX1-0000000BI7S-0GD8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 716DB60A67
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282801F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709742;
	bh=3GCVFozR6/36hQtPeMO4srDIGrlB3Wpr1gIirTgwllo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DT+084QDMVKqHEeRnu2hI6oOkT9iXLZ2pd+eCbFbu3QhSzoYr2Ew2yNDwaYHNz/ZO
	 /74q/6ppB41cTB+YcbErz/MafEEIxntA/nBirMOJnEJYGD2ckUjgiTiJaSpr5yfgkf
	 Ic4J6b+Z3RUmO/pWgFKh4WHgwyDaIat4gP9ykHX18s9ilpRMDcINW85XwXS/8aK2As
	 lNDKH0ZHm8LybWToRf8hJusvnHjwZoYmLGgyPME9IDLAf5eTjqKIDZSupFWAsX2eu4
	 Q/0ghcmx0Yr1aKbz0RRCVOcaw4O+CkguU+aIRfOMF5ve5BeQODIXfGguij+zIBU5ZB
	 84JwbX7ofhiKQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b29599b81cso4209423e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzpCErcM3001eCgWzqkZ5YkvQOqEt8580rKB/elo1MikiyK0FBWFLpg+aFpS793E2LpG7M2wCaQxWwh8MJebA9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb1Rp5Z4qP8m0VaSzJHSioXrZUZXyh8R9hW/7U7j91akeL7pQ0
	bvNKq29DgRA31VGqwduFHMmiwkVUhltJoOIzgK5oxl7QyLc++LRM7vVR6kKFd9Dafu3cisoL4yr
	OlZGGPtcJkq4nw4WUZwss0+RI3hfgDrQ=
X-Received: by 2002:a05:6512:68b:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b28f860f54mr4955614e87.13.1784709740582; Wed, 22 Jul 2026
 01:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-4-justin.yeh@mediatek.com> <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
In-Reply-To: <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 16:42:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Sus+p1qPqhAgrc_gYYKvVGkV2CnGHYN70i0zv+BuOkg@mail.gmail.com>
X-Gm-Features: AUfX_mwrltgWgwW5znwwtpoI8YTcDd_8mc2DbQawWOHLvv4LKE280kFlIdLVJos
Message-ID: <CAGb2v64Sus+p1qPqhAgrc_gYYKvVGkV2CnGHYN70i0zv+BuOkg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/13/26 10:37, Justin Yeh wrote:
> > The MediaTek SoC pinctrl drivers link against the shared implementation=
s
> > in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. The=
se
> > were built-in only: their Kconfig symbols were bool, they did not expor=
t
> > their entry points and they carried no MODULE_LICENSE().
> >
> > To let the individual SoC drivers be built as loadable modules (require=
d
> > for Android GKI + vendor_dlkm, where vendor drivers must live outside t=
he
> > GKI vmlinux), the shared code they depend on has to be modular too.
> > Otherwise selecting a SoC driver as =3Dm forces the common symbol to =
=3Dy and
> > the resulting module fails to link against the unexported common entry
> > points.
> >
> > Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> > tristate, export the entry points used by the SoC drivers, and add
> > MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
> >
> > The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() w=
as
> > never exported. It is called directly by SoC drivers such as mt7623, so
> > export it as well to keep those drivers linking once they are modular.
> >
> > Rather than exporting these shared symbols into the global namespace,
> > export them in the "MTK_PINCTRL" symbol namespace with
> > EXPORT_SYMBOL_NS_GPL() so they are only visible to drivers that opt in.
> > Each SoC driver that uses them therefore declares
> > MODULE_IMPORT_NS("MTK_PINCTRL").
> >
> > Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
>
> Some of the pinctrl drivers are missing
>        MODULE_DEVICE_TABLE(of, [match_array])
>
> ...therefore module build will fail.

Would it fail though? IIRC this statement is optional. It will still build
without it, but the module won't be loaded automatically when a matching
device is found.

This is a different kind of failure.

We probably still want to add them right now while we are modifying all
the drivers though.


ChenYu

> Have you tested compiling the kernel with *all of the MediaTek pinctrl dr=
ivers*
> set as module??? :-)
>
> Cheers,
> Angelo
>
> > ---
>

