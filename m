Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F39CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIZIK8PnwGd41Y19B48/hAerlfXbkRInPJ4vUvQE2jE=; b=lsp3ya6B2GV3B/
	p/r8+zg/fSE6hTvr85/N7OkMogu62va+HT4E0QCG+90fzvTs2H77fVswMvfXzLu/3LG6N51ukSEnU
	62+MqePQMl5WI7Pr66iU/9OErXW7WPp2LNTUZN5bliLaVKNUEaKxmWYwOyuB+CplMrx97sqXVBOGP
	yRzkHTgzwwsOhf1S5mRdTLauj/DpZ1cm2HufwjTCDn4uLuUdTKeqrVAd5vg5tt+/M5i1iSF8f7Mmj
	40Q5JxhzDa6n/BgAKqWGCeEk22OwOy59B+vrgJ5P8rklZQwUggr6Jb30BbO/D2RiYZxJc1tuJpZMM
	9lVlizkqavxNC0S1RbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWx2a-00000005jRD-253t;
	Tue, 09 Jun 2026 14:02:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWx2Y-00000005jQi-2c1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:02:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 137C0434A2
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 14:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8EB1F00899
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781013770;
	bh=DIZIK8PnwGd41Y19B48/hAerlfXbkRInPJ4vUvQE2jE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=T4v6ecYl2+2aDvXhixvZD/qvUEi30CGNHn+AUBZsSv8BJph6Jz+hzZX2Lt2H+dzqb
	 kLW0nb/aKOKWbJpSS1OGmxvKUz1/FoRpy5XlWT90EmYtDscBsRZqIKKhqo+hdW8ewB
	 sAcxfjTkW9luqqMClqJYmw1wAzxm1iDOUfW6rCpMGGQMP5goV3OKUXo2Ksd3YRNIUB
	 lPvo54NG5xDbIZxvU8POi1NM9BbzvwJM1ffRbKvoJXbZH2HHX7opb/e7BA9V8eWTUH
	 VuOYTDzU4gvAfrYeKagBvkilEb1mTCPDTxITi6jkMFpDb3p1ICrx/omRd9x1u5Hhlk
	 pzX4cCb1/BX+Q==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so6176857e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wROYFdWiCEgEJvbs5eOWOmC6BFc7rsjJuptZlSmNR3DypWjUSVLbaI4qX56O5R0Mo6DDFoihlS7CLKOvRKSXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqw447yYpoImLuatGKqM7jMsJ3QHUuvWDPAxTLDp4t4Y65ufAH
	vNSsr9VTmEMZdX/X9cH5vzMo/mTfJts7iF+nvL1ZDNXNhfZ+vEYaY38PErokTVopDxc3mF9Zds7
	SpyMpXxziJD93fFTL2qH0IbrlSBxQ0Z0=
X-Received: by 2002:a05:6512:3b9a:b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5acf6be8927mr979674e87.13.1781013768217; Tue, 09 Jun 2026
 07:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org> <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
 <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org> <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
 <aigZP9W6AWzde2qo@collins>
In-Reply-To: <aigZP9W6AWzde2qo@collins>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 23:02:36 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Qk9uWDiuR3oM5aE5xSi_eC+cVZT3ZUT3JJQUazE6g8w@mail.gmail.com>
X-Gm-Features: AVVi8Cccpi1_OhVw7fhQSEKzKM9A1mVInpapc_87jyD4L-bqqQfD3ViCMlP8kbM
Message-ID: <CAGb2v64Qk9uWDiuR3oM5aE5xSi_eC+cVZT3ZUT3JJQUazE6g8w@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 9, 2026 at 10:46=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi,
>
> Le Tue 09 Jun 26, 22:26, Chen-Yu Tsai a =C3=A9crit :
> > On Tue, Jun 9, 2026 at 10:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> > > > On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > >>
> > > >> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> > > >>> On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > >>>>
> > > >>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> > > >>>>> The following changes since commit 254f49634ee16a731174d2ae34bc=
50bd5f45e731:
> > > >>>>>
> > > >>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> > > >>>>>
> > > >>>>> are available in the Git repository at:
> > > >>>>>
> > > >>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.g=
it tags/sunxi-dt-for-7.2
> > > >>>>>
> > > >>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c=
247e565f:
> > > >>>>>
> > > >>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02=
:58 +0800)
> > > >>>>>
> > > >>>>>
> > > >>>>> As mentioned in the tag, this pull request contains a change th=
at should
> > > >>>>> be shared between the soc and clk trees. However since I don't =
have any
> > > >>>>> clk changes to send this cycle, I think it can just go through =
the soc
> > > >>>>> tree without any issues.
> > > >>>>
> > > >>>> But the clock driver change cannot be in the DTS branch. This sh=
ould go
> > > >>>> via clock tree even if it is one change. And definitely not via =
DTS
> > > >>>> branch.
> > > >>>
> > > >>> It is a shared change, because it moves two symbols from the driv=
er's
> > > >>> private header to the public DT binding header. I don't see how t=
his
> > > >>> can go through just the clk tree when one of the subsequent patch=
es
> > > >>> uses those new symbols.
> > > >>>
> > > >>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public he=
ader"
> > > >>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent th=
e
> > > >>> interconnect".
> > > >>>
> > > >>> The other way to go about this is to use raw numbers first, then
> > > >>> another patch in the next cycle to switch the numbers to actual
> > > >>> macros. IMHO not worth the churn and headache.
> > > >>
> > > >> You can have a duplicated define.
> > > >
> > > > I honestly did not know that it worked.
> > > >
> > > > However, splitting what is effectively one logical change (*move*
> > > > something) into two patches just to be able to merge them through t=
wo
> > > > separate trees still seems wrong to me.
> > >
> > > It is not really one logical change. Defining a new ABI (binding head=
er
> > > define) is considered one change. Merging binding change into driver
> > > commit breaks rule of splitting bindings from implementation.
> > >
> > > Second rule is that DTS branch CANNOT take driver changes. So if you =
do
> > > not want to adhere to the above rule you still cannot combine it into
> > > DTS branch.
> >
> > Very well. I will drop the two changes and send a revised pull request.
> >
> > Paul, can you redo the clk changes as requested in the next cycle?
>
> Sure, so if I understand correctly, commit:
> clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public headersunxi
>
> should be split into two, one adding the definitions to the dt-bindings
> headers first and a second one removing them from the clk driver?

Correct.

> Can it still make it for 7.2?

If you send it out soon, then maybe I can send both in a PR to Stephen.
But the v3s dts patch is not going to make it.


ChenYu

