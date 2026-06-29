Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FC1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no4d9D62wGD6q8nT4wtCHAMErmb+Fb5FN/Jb/bKiHW0=; b=lzpGboOvfwYFyTq32ImqbIjfcI
	HOGTZHgrncvbw2hqIG3X55FSdziQ/EqxLd70kgVYMlrXjd68A5r+v+egRaosOpdmWdTtF3CMU0ryN
	LA81H9Fy7kgY1uTSJpvNmsBFC53dqjPp79wxjvuSMtCH9Z/5HMg+BfWXHopBD5RyduEXkeaADzm6A
	I9bX0fgs9G04MS2vDdTaCVet+RUtZRGdcBQrIJPUq8YFXKVBJK9/SvEnFJ5aA+Fcw6NoltuAOeuhq
	yyCyEAeHILBnbDD1btfvJwPDdwFN18xhgYuOd23bj8YxeHXSwGnWW5FGI7J9uwqIcGCWQQn2Gm+Wr
	0L+Q/8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8DD-0000000E9Tu-2sGl;
	Mon, 29 Jun 2026 09:23:31 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8D9-0000000E9SU-3OXL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:23:30 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260629092320epoutp02e16a5b711004024a5899a3aa0555531b~9gvE57Fjj1925519255epoutp02k
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:23:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260629092320epoutp02e16a5b711004024a5899a3aa0555531b~9gvE57Fjj1925519255epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782725000;
	bh=no4d9D62wGD6q8nT4wtCHAMErmb+Fb5FN/Jb/bKiHW0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vOylTQL+lmRoXTIWQQT7soH5X1LGKFOSynlUyEYTQwIiV0wVo7e50wtwfRdLKDkRW
	 qmX/MXulpam1uP4ZKEKFyqpD6H7WyUNKuQYeptK6+FfcoFbHhzTYt//SSIF/MxygrB
	 uL3RoNYcIGA0VLGvWcZ9MnZzKRqdZL5g6sdEu3vQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260629092319epcas5p2c79999ceb939cdcbb9a846c23183d453~9gvEVcFL11996019960epcas5p2O;
	Mon, 29 Jun 2026 09:23:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gpgn21yBlz3hhT7; Mon, 29 Jun
	2026 09:23:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260629092317epcas5p18b01064644f8ce94f638cd8fe906f541~9gvCzuR9O0475904759epcas5p1x;
	Mon, 29 Jun 2026 09:23:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260629092315epsmtip161f615b52140b2ecd44769e198d44f75~9gvAgDcAF1476314763epsmtip1b;
	Mon, 29 Jun 2026 09:23:15 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Youngmin Nam'"
	<youngmin.nam@samsung.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<semen.protsenko@linaro.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<ryu.real@samsung.com>, <d7271.choe@samsung.com>, <shin.son@samsung.com>,
	<jaewon02.kim@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Mon, 29 Jun 2026 14:53:13 +0530
Message-ID: <0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr5xjB9BZkcy1LV54fp2FD5N/QnAF3wuMlAatK81MBmh+d8rWRk0XQ
Content-Language: en-us
X-CMS-MailID: 20260629092317epcas5p18b01064644f8ce94f638cd8fe906f541
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-1-youngmin.nam@samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>
	<CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_022328_173961_8AE16A98 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Krzysztof, Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Saturday, March 7, 2026 2:47 AM
> To: Youngmin Nam <youngmin.nam=40samsung.com>
> Cc: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org; semen.protsenko=40linaro.org;
> ivo.ivanov.ivanov1=40gmail.com; ryu.real=40samsung.com;
> d7271.choe=40samsung.com; shin.son=40samsung.com;
> jaewon02.kim=40samsung.com; linux-arm-kernel=40lists.infradead.org; linux=
-
> samsung-soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v3 2/5=5D pinctrl: samsung: fix incorrect pin-bank =
entries on
> Exynos2200/7885/8890/8895
>=20
> Hi Youngmin,
>=20
> On Tue, 2 Dec 2025 at 09:30, Youngmin Nam
> <youngmin.nam=40samsung.com> wrote:
> >
> > This patch corrects wrong pin bank table definitions for 4 SoCs based
> > on their TRMs.
> >
> > Exynos2200
> > - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
> >   'bank_type_off' layout (.fld_width =3D =7B4,1,2,2,2,2=7D).
> > - Per the SoC TRM these banks must use the 'alive' layout
> >   (.fld_width =3D =7B4,1,4,4=7D).
> > - Switch them to
> EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> >
> > Exynos7885
> > - etc0, etc1: update bank type to match the SoC TRM.
> > - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingl=
y.
> >
> > Exynos8890
> > - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
> >   a non-external interrupt bank.
> > - gpi1, gpi2: update bank type to match the SoC TRM.
> >   exynos8895_bank_type_off (.fld_width =3D =7B4,1,2,3,2,2=7D) ->
> >   exynos5433_bank_type_off (.fld_width =3D =7B4,1,2,4,2,2=7D)
> > - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> > - apply lower case style for hex numbers.
> >
> > Exynos8895
> > - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
> >   change EINTW -> EINTN. (The bank_type itself was correct and is kept
> >   unchanged.)
> > - apply lower case style for hex numbers.
> >
> > This aligns the pin-bank tables with the documented bitfield layouts
> > and wakeup domains. No DT/ABI change.
> >
> > Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> > Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> > Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> > Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> > ---
>=20
> This patch contains some worthwhile fixes for multiple Exynos SoCs. Do yo=
u
> plan to re-send it? I think it would be good to get this merged (even if =
there
> isn't broad agreement around renaming the pinctrl macros to EXYNOS9_)
>=20
Can we relook into this series?=20
AFA EXYNOS9_ macro is concern, Exynos990, Exynos9810 etc already support av=
ailable upstream.
Of course it does not justify why Exynos9, but we can consider all SoCs whi=
ch has come after 2020 have this newer architecture.=20
Or Just have SAMSUNG_ prefix for all such newer SoC.

A unified Macro help in adding new SoC support without much confusion(like =
I am trying with Exynos8855)

=40Youngmin, will you have some time to re-spin these series?

> Thanks,
>=20
> Peter


