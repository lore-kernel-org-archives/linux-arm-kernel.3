Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783ABCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8letKVTX9hNzpm/6EzAg1nRrooRLvfpVgQ+GnYYjMQY=; b=DshvTNeskDSogL
	xKSsrco7Cq/63XYv93EqQcX7xlDLR36sKYqxC6pkwbbzrYgEGur9rbMBSvJY3gZg1CRv2vrdG+Nlo
	p5XtWHi6BltvgeUgeLUNuKaJ5l3vco8mMWKdTCsc3zdoqxw5NH3W9PZ3ZQLv+0eq+nPYCVaqXnI4b
	0u+OgxLAs7OlE7H60t1a+NB7PIqGw/7t7iwykrsh5jxfOqPTYc3tnxROs+cSf3z2e1HO6L4XrUd83
	5x9zdXLJ/pE/sygqSmO0yuqs3u9SyhM2XjWc3asvuG/WF6A7YBq8KjiHVFn6RUq+OvuUCIbZ+BERn
	QOjB4HYQ+7jU+n1oen1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuwc-00000005T4L-1ZYj;
	Tue, 09 Jun 2026 11:48:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuwa-00000005T4E-3fCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:48:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F56B40624
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 11:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F346A1F00898
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005712;
	bh=8letKVTX9hNzpm/6EzAg1nRrooRLvfpVgQ+GnYYjMQY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YebtZ3Rqlnmo/sHNQ0U75sTLrXNbrSWH68R1cGT2QTEARlpoNb4BDCrFpNvVn44N5
	 ybLzDIe/3ee+1E2e3J5UlO/rk9ADqPgAMFyoZlJB36kSmiFIuqFO8qu/1HNGmOBwor
	 /t1VzoGZpZ8XQY2t83DmhDTXhso3bNYMDtfml4S6/6HibdIHIr72tRwhbgtw/Cphcj
	 4DncdCsYWSxPVUDYhkq0bOEoLQXtRpXuxVyZkHLoRpEeyCVIEWa/Yf9ox3fvE+Rt96
	 9XSOSEdyjihJHEicyY8N24bAGT8UA2c3/0mkR8c+jStAQr2CkKzVuEsGDXgpl70ZsZ
	 gG4H/vek+pWtA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-396753f343aso53522171fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:48:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wXb55aNS9Cwrr+NFFac54NQBh/nPUvc2K3S3dT9ktKePIJNTcAAmKzfHUIaLHbZpj9ulsnJ1b68KzKCrddyWH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+G7UHl25y4nB+WYDhn3L+dsju8IhwCup/2nKykvVi25FTvR5b
	EcdX1OPfgby4IwSXAY3sk+bxbCXnAhCrXI1NNw9OGjsx1mTjV7kk7urjsJYdXEmzWz/bkB00KyL
	IqYz9wosDHmjHBxyKHAlthxsH4/XekkY=
X-Received: by 2002:a2e:be2a:0:b0:396:a77d:210d with SMTP id
 38308e7fff4ca-397f76fc095mr6358901fa.7.1781005710235; Tue, 09 Jun 2026
 04:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
In-Reply-To: <20260609-mighty-excellent-shoebill-04d7fa@quoll>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 20:48:14 +0900
X-Gmail-Original-Message-ID: <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
X-Gm-Features: AVVi8CfgpRUT0LSxSlMDKOy2NI7ybB5lvzBRW7huka_cDgtqrOHRbP6ahpPHR0w
Message-ID: <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Stephen Boyd <sboyd@kernel.org>
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

On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45=
e731:
> >
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/=
sunxi-dt-for-7.2
> >
> > for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f=
:
> >
> >   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +080=
0)
> >
> >
> > As mentioned in the tag, this pull request contains a change that shoul=
d
> > be shared between the soc and clk trees. However since I don't have any
> > clk changes to send this cycle, I think it can just go through the soc
> > tree without any issues.
>
> But the clock driver change cannot be in the DTS branch. This should go
> via clock tree even if it is one change. And definitely not via DTS
> branch.

It is a shared change, because it moves two symbols from the driver's
private header to the public DT binding header. I don't see how this
can go through just the clk tree when one of the subsequent patches
uses those new symbols.

"clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header"
is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
interconnect".

The other way to go about this is to use raw numbers first, then
another patch in the next cycle to switch the numbers to actual
macros. IMHO not worth the churn and headache.


ChenYu

