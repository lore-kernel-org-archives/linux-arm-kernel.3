Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37CACD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEzkvlBFFvYKUxV+2A69a6nCqpUbqrOObJ/AftXL8E0=; b=sn8dpLikGF3QnN
	TxIiDtgVa84kgmIijNjAp3xm/FGgxaD57NW93mZFqzNuMqnUC0rndKBSZs4t3qZjXitHQENM1J4a0
	BADXunjy1c5SplLWajEK+AjJcNwtnaUuvlexqeYV6k25nAxbY3JJGJBfL9fKRZLgEbA5RCHAifWwr
	hp+lIEgWqMo+fv098GkgjIAuEWhJGPJSpqU+4U39e02MjoAHeWQozA8JI4J1MpFS6sDznbPFwYWD3
	8/hgtcs31238ENkSVVFTiOQUspWJFms+28WuUo3JRx6qZ7GGnqn8uneNandhgWJj8ny9If8eYWRny
	YKJi8SW7oWbxJzhCRXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvjO-00000005WmY-1kE8;
	Tue, 09 Jun 2026 12:38:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvjN-00000005WmR-1Jxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6719D601D6
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 12:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DF21F0089E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781008736;
	bh=JEzkvlBFFvYKUxV+2A69a6nCqpUbqrOObJ/AftXL8E0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=W5AMJ8BXLyS7hYvQYZS2SXfIrXt2JycaIQ+7d9SrPGm9LZxmU08PzNsdnEZbREmSx
	 b6ZgcCmEc+6daNrDyfqEVHTD+mRil0D5+ZB1AnvqC/071ygNFUOUqGLGe2FwBewiZe
	 NdxeG0R1Jm6B1auzzLvww07FBOhGWZlVfCZrSKGo+/cQuVANfL9m62yLAsjak5sF50
	 k0tlF7I5XPYgXE0lOIbKXGrNImOmuELP8rRNHpY7C0F2JKmeUv1q44c6CdM7TS+2ON
	 NlEaimbfcPv2YKgEcFzuZAHaWU1eEgs2YTXml30d+J9Yag0GJpeIYbLidCCHz+iP4d
	 a+NS81M6AigQw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so5084875e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mJxYsTgJg/C9dnilnUTZhi2C9jix339Y9M6i1VHOIdtw+isB+piBpMJHVqgY7lI1659VrumgxuarUzBKjWxtp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7eVxs0ZzqZTME03wv+uBf5eOiCJA+zYigvjRlujcSbUYA2CW/
	qhTXWLTpDiq3zUx/M9dXBVfqSaHsCxI2DyTUSaC0XbuucSFRpdc1RCSr9xGGHdv94ZaJcIdDciw
	v82LL25KXdhY2EQ0Ld/Sl3q3m/Vj2bOc=
X-Received: by 2002:a05:6512:3347:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa87b88f32mr5272366e87.34.1781008734298; Tue, 09 Jun 2026
 05:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com> <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
In-Reply-To: <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 21:38:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccop8L6DDH-VT7ntRT5GDaoDpK71wx4lOBSA8i77A6ck-ulE7QwflSieZw
Message-ID: <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> > On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> >>> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f=
45e731:
> >>>
> >>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tag=
s/sunxi-dt-for-7.2
> >>>
> >>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e56=
5f:
> >>>
> >>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0=
800)
> >>>
> >>>
> >>> As mentioned in the tag, this pull request contains a change that sho=
uld
> >>> be shared between the soc and clk trees. However since I don't have a=
ny
> >>> clk changes to send this cycle, I think it can just go through the so=
c
> >>> tree without any issues.
> >>
> >> But the clock driver change cannot be in the DTS branch. This should g=
o
> >> via clock tree even if it is one change. And definitely not via DTS
> >> branch.
> >
> > It is a shared change, because it moves two symbols from the driver's
> > private header to the public DT binding header. I don't see how this
> > can go through just the clk tree when one of the subsequent patches
> > uses those new symbols.
> >
> > "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header"
> > is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
> > interconnect".
> >
> > The other way to go about this is to use raw numbers first, then
> > another patch in the next cycle to switch the numbers to actual
> > macros. IMHO not worth the churn and headache.
>
> You can have a duplicated define.

I honestly did not know that it worked.

However, splitting what is effectively one logical change (*move*
something) into two patches just to be able to merge them through two
separate trees still seems wrong to me.

Would it help if Stephen gave an ack?


ChenYu

