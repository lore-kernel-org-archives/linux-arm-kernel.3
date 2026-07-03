Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm11f/zR4qtblmEb9WqIxklnSmRd5ntPO4IgWl784nc=; b=q8OW0QQkO0abvf4fh+zxMs2Dwi
	9LCrSBU+Xne1prKhGiYgoH7aB/7bo44+/1VuyCaAZnYSb/auC6AnI2X3fUhhZEnOruANrep9pJ8FI
	KIhA/PMJu5ty5KkVjYO3mlMa+y0VCvi8+1+/AS+ktbMQjwIcdpsrQJ6t0EFUEnTqc2JfVuJJ/0Ae+
	VfG6Z8oHhDswYcSTLhD1ShpqRA4m/OMyBYVCCacx9B8CFjri4VDdlRLxhsPD9rgTAPs0T/0OZk3S8
	QrzoJadEz0V2xxVqnXwQS7kzxuWqN58LBFhf9j6iHr/y5Lfc5QfRRTLvup6Y/3kj7hPqiJ0hH0ouL
	oiJCXYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcoD-00000006utQ-16yk;
	Fri, 03 Jul 2026 12:15:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcoA-00000006ut1-0glo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:15:52 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260703121542epoutp02c9df1f5c62e097a7a2cfc83a4614cda0~_xquWmM4W0030200302epoutp02u
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:15:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260703121542epoutp02c9df1f5c62e097a7a2cfc83a4614cda0~_xquWmM4W0030200302epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783080942;
	bh=qm11f/zR4qtblmEb9WqIxklnSmRd5ntPO4IgWl784nc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TkPcDkgCOY2B6XOPzI5ryVssnTiJHrpBeVjczbrd3NyYY1J790URp72ZOsSyF03Nf
	 NwV9KWIof+h6Q9yfZmknZXy7T77bwK3lt0ZJaZiHyFdDJ1ipWctulCeyy48Y4clget
	 rNauQ09ZqrmhrS6lH9ByYIBQdw/dK3t76rOrWesA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260703121541epcas2p2b791d0a882a31a404f0259e2df2e1138~_xqtpTVl21760017600epcas2p2F;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.209]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gsCQ54kxqz6B9m6; Fri,  3 Jul
	2026 12:15:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20260703121541epcas2p4408a3bbc4a2f9ff6d018cf9a2f5298d2~_xqs3tG1Y1460114601epcas2p4o;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
Received: from KORCO090186 (unknown [12.80.211.165]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260703121541epsmtip14e82d433e2e957a41fbddb55aa76c1ba~_xqsxJ7j_2740427404epsmtip1U;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
From: =?utf-8?B?64Ko7JiB66+8?= <youngmin.nam@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<semen.protsenko@linaro.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<ryu.real@samsung.com>, <d7271.choe@samsung.com>, <shin.son@samsung.com>,
	<jaewon02.kim@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <youngmin.nam@samsung.com>
In-Reply-To: <0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Fri, 3 Jul 2026 21:15:40 +0900
Message-ID: <000001dd0ae5$aa491e10$fedb5a30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr5xjB9BZkcy1LV54fp2FD5N/QnAF3wuMlAatK81MBmh+d8gGktICKtYrtzGA=
Content-Language: ko
X-CMS-MailID: 20260703121541epcas2p4408a3bbc4a2f9ff6d018cf9a2f5298d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-1-youngmin.nam@samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>
	<CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
	<0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_051550_887407_0BA352FF 
X-CRM114-Status: GOOD (  28.63  )
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

Hi Alim

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Monday, June 29, 2026 6:23 PM
> To: 'Peter Griffin' <peter.griffin@linaro.org>; 'Youngmin Nam'
> <youngmin.nam@samsung.com>
> Cc: krzk@kernel.org; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> semen.protsenko@linaro.org; ivo.ivanov.ivanov1@gmail.com;
> ryu.real@samsung.com; d7271.choe@samsung.com; shin.son@samsung.com;
> jaewon02.kim@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank
> entries on Exynos2200/7885/8890/8895
> 
> Hi Krzysztof, Peter
> 
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Saturday, March 7, 2026 2:47 AM
> > To: Youngmin Nam <youngmin.nam@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> > linus.walleij@linaro.org; semen.protsenko@linaro.org;
> > ivo.ivanov.ivanov1@gmail.com; ryu.real@samsung.com;
> > d7271.choe@samsung.com; shin.son@samsung.com;
> > jaewon02.kim@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank
> > entries on
> > Exynos2200/7885/8890/8895
> >
> > Hi Youngmin,
> >
> > On Tue, 2 Dec 2025 at 09:30, Youngmin Nam <youngmin.nam@samsung.com>
> > wrote:
> > >
> > > This patch corrects wrong pin bank table definitions for 4 SoCs
> > > based on their TRMs.
> > >
> > > Exynos2200
> > > - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
> > >   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> > > - Per the SoC TRM these banks must use the 'alive' layout
> > >   (.fld_width = {4,1,4,4}).
> > > - Switch them to
> > EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> > >
> > > Exynos7885
> > > - etc0, etc1: update bank type to match the SoC TRM.
> > > - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN
> accordingly.
> > >
> > > Exynos8890
> > > - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
> > >   a non-external interrupt bank.
> > > - gpi1, gpi2: update bank type to match the SoC TRM.
> > >   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
> > >   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> > > - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> > > - apply lower case style for hex numbers.
> > >
> > > Exynos8895
> > > - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
> > >   change EINTW -> EINTN. (The bank_type itself was correct and is kept
> > >   unchanged.)
> > > - apply lower case style for hex numbers.
> > >
> > > This aligns the pin-bank tables with the documented bitfield layouts
> > > and wakeup domains. No DT/ABI change.
> > >
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > > Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > ---
> >
> > This patch contains some worthwhile fixes for multiple Exynos SoCs. Do
> > you plan to re-send it? I think it would be good to get this merged
> > (even if there isn't broad agreement around renaming the pinctrl
> > macros to EXYNOS9_)
> >
> Can we relook into this series?
> AFA EXYNOS9_ macro is concern, Exynos990, Exynos9810 etc already support
> available upstream.
> Of course it does not justify why Exynos9, but we can consider all SoCs
> which has come after 2020 have this newer architecture.
> Or Just have SAMSUNG_ prefix for all such newer SoC.
> 
> A unified Macro help in adding new SoC support without much confusion(like
> I am trying with Exynos8855)
> 
> @Youngmin, will you have some time to re-spin these series?
> 

Sure. Let me re visit my patches and will try.


> > Thanks,
> >
> > Peter
> 



