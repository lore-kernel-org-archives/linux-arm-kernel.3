Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1E0CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jeku2I21phSRJhXNQ/8/k0mAKNel37OuLRjgHhlZjs=; b=JQVMFE+r0EC4tw
	JI1BV4k8xyp77/g/UOfq9sql8RNt4eLTZWVhOynBjoLD0heyzqTzfewI0eiL7wDQmvZvjV8lPxjFv
	irc4lBnEvbbVcIy2ET0dw5Z1kPU8VuWUEbegNzmj/pZsTyXW98SzdKKdnq3rR5fC8bd69GgHsdY9U
	F+Ri7dknu8jt//aSZ9ihATEphv7ER3UggPrqayauEm+2Rwu59hqVakz2IoKDdNSQ82Qnc+Oe1oExE
	u1r6zriILWqjMJNSP8Sh05lF5rOyZzRbhGWymdak6zJwOiiLGwYI0Hr4nsRfNiRMBcmiDujZ9yTHl
	Qm+6/nIObmc5VuNgV8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwTO-00000005ecH-1ynF;
	Tue, 09 Jun 2026 13:26:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwTL-00000005ebf-3JGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:26:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EC326020B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 13:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0C51F0089C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011587;
	bh=7jeku2I21phSRJhXNQ/8/k0mAKNel37OuLRjgHhlZjs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=RQ3oDdmZHC5TFk93Lg0j6zXbL5tW1CT2zIlskDn1t7PvgCutJW8wbDzWiMe1qxU2Y
	 iIBz2DbG5MhRpf7HHsdxoC1NDYP5XDrY6R7SczwReBd6cEkBQUBGcoHu533GEvXdoD
	 nBSXWCiIzSFSeSll71LiUzOTlVVIE0UiiwIq7gnseOUCZU6uiCPEAQX7MMrYaEgdRa
	 BuZh8CkAGzRkKisHeRPfdv0WPVMlat/E/4CY/3s0wCq5GgT1DMj+fJj8O4v7kQ8WQ3
	 4b9PxSMj2KgiENA5SHwZK2Kk3nMBtzaW8osT4N64czn3VtWcMYDrD4mfPnz1ceTCDT
	 UXt1TY2if2PaQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39697a4e16cso52323311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fRDEo+AWJCLNUbSY7kiT6RZzheqvv/PcR4OPjKoOkEohc43dUUWgQkAkdpO37pQ8ONdBVnd/jQketoWWstPU+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7EDKKBMm6qA0J5PwpLSfIohhVeMMAypdUNHLrFZhAqZjQJBbA
	PbVV9XoOKmnqB/D6UpX8X+F+iEEqKl49lnktlZnFkC8MWKymwTtbJ0+hk6HoFL7AK5Df8nGnm9t
	Imr0tQOAJMw6xf0oZ0xkZrmLJgF405y4=
X-Received: by 2002:a2e:bea4:0:b0:396:76f9:ac7e with SMTP id
 38308e7fff4ca-397f77a914fmr7906071fa.18.1781011585140; Tue, 09 Jun 2026
 06:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org> <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
 <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
In-Reply-To: <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 22:26:13 +0900
X-Gmail-Original-Message-ID: <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
X-Gm-Features: AVVi8Cd7Y5SiJ9fLWKz4u9swmJUU4oN4vwJk-SYibMTyRP_3Zg3Vog1ZYd_wLNg
Message-ID: <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paulk@sys-base.io>
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

On Tue, Jun 9, 2026 at 10:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> > On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> >>> On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> >>>>> The following changes since commit 254f49634ee16a731174d2ae34bc50bd=
5f45e731:
> >>>>>
> >>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git t=
ags/sunxi-dt-for-7.2
> >>>>>
> >>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e=
565f:
> >>>>>
> >>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 =
+0800)
> >>>>>
> >>>>>
> >>>>> As mentioned in the tag, this pull request contains a change that s=
hould
> >>>>> be shared between the soc and clk trees. However since I don't have=
 any
> >>>>> clk changes to send this cycle, I think it can just go through the =
soc
> >>>>> tree without any issues.
> >>>>
> >>>> But the clock driver change cannot be in the DTS branch. This should=
 go
> >>>> via clock tree even if it is one change. And definitely not via DTS
> >>>> branch.
> >>>
> >>> It is a shared change, because it moves two symbols from the driver's
> >>> private header to the public DT binding header. I don't see how this
> >>> can go through just the clk tree when one of the subsequent patches
> >>> uses those new symbols.
> >>>
> >>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header=
"
> >>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
> >>> interconnect".
> >>>
> >>> The other way to go about this is to use raw numbers first, then
> >>> another patch in the next cycle to switch the numbers to actual
> >>> macros. IMHO not worth the churn and headache.
> >>
> >> You can have a duplicated define.
> >
> > I honestly did not know that it worked.
> >
> > However, splitting what is effectively one logical change (*move*
> > something) into two patches just to be able to merge them through two
> > separate trees still seems wrong to me.
>
> It is not really one logical change. Defining a new ABI (binding header
> define) is considered one change. Merging binding change into driver
> commit breaks rule of splitting bindings from implementation.
>
> Second rule is that DTS branch CANNOT take driver changes. So if you do
> not want to adhere to the above rule you still cannot combine it into
> DTS branch.

Very well. I will drop the two changes and send a revised pull request.

Paul, can you redo the clk changes as requested in the next cycle?


Thanks
ChenYu

