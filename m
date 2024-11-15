Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B6BD68BC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEafRjM9IWWfFCvBUry05pVj1A8yYFWrnbi6Fe6UClU=; b=Fo2Nstd61OYygE+kjuL7jzC9PO
	Lx+XxRSv3DryoA2la5D9r/mnzx5lbzyZSnbjDON+X4XJSM20bBVfIVJLaD7GGG3QeMobqVGArGA7T
	OSlct8LiQHG0Hei+5jsBmgluAUQhxrARkBZMYwwX6ZOgqfGXOym/bzz6991VYoWroHn/GLufgDeuM
	8sbHIsRlgdz6S/uMaOYxDJd23Zo/fRqjX/08UuB6iv7cHFrPeQwtUN9XlHbDgCR1xN0IA0855d1oI
	lLN1KMB/lhc3c/CgPUad4NdSjn/WoyMiwGfbtjdwI5Y+FcAYfA2Pze06Hf8YhpilgZKFlmVJ1/Pik
	l8Vclgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxcY-000000032NM-0krO;
	Fri, 15 Nov 2024 14:48:26 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxbb-0000000327n-2BCw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:47:29 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 069631FABF;
	Fri, 15 Nov 2024 15:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1731682040;
	bh=dEafRjM9IWWfFCvBUry05pVj1A8yYFWrnbi6Fe6UClU=;
	h=Received:From:To:Subject;
	b=qhmIrwRVvBxbRBpDh+0Cndd7H7nsHSH1iQwB+RU1HjFWFGA/ccBxUuSpSLWYs4lX/
	 GtRu+OmFXYLqXpsOG4rNgzvkA/EAa6NIlgK1qro/Gq/wAIvwjXJi1AomDpEtzrvX4W
	 NlSpqSreFmjXDIm4wqKcY6OnJSmUlNL4Bk8Dvf5Q7L8bx9/D5qE8IgtNbrByFg75zq
	 2qq8R8fa7Q49KMMFFdDL001NvzWZQafkiqV5bTLgYfP0eMBgJO14za7ofXy5RII266
	 tXHayEA+eydm1jiFD35vxDy5eQ11sL/HwxHsFByit33wmpYpKDjJ9p4c9jH0j1sxLi
	 K+rTZenRyeg/Q==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id A6EFC7F9AA; Fri, 15 Nov 2024 15:47:19 +0100 (CET)
Date: Fri, 15 Nov 2024 15:47:19 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, ulf.hansson@linaro.org
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on
 v6.12
Message-ID: <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it>
References: <20241007132555.GA53279@francesco-nb>
 <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb>
 <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_064728_447334_40486469 
X-CRM114-Status: GOOD (  24.48  )
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

On Fri, Nov 15, 2024 at 11:13:58AM +0800, Shengjiu Wang wrote:
> On Tue, Nov 12, 2024 at 5:20 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> >
> > On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> > > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > > > it seems that an old regression is back on v6.12, reproduced on -rc2
> > > > (not sure about rc1).
> > > >
> > > > The original report is from https://lore.kernel.org/all/20240424164725.GA18760@francesco-nb/
> > > > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > > >
> > > > Is it now back?
> > >
> > > I was able to reproduce this issue once more, this time with 6.11.7.
> > > As I wrote in another email the issue is not systematic as it used to
> > > be.
> > >
> > > Any idea?
> >
> > Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
> > too short and therefore we have such non-systematic failures?
> >
> 
> Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.
> 
> If it is easy to reproduce on your side, you can try to enlarge the delay
> time to see if there is any improvement.

It's hard also for me to reproduce, we just have a relatively extensive
test farm and 2 times it happened while doing unrelated tests. I was hoping we
could have some idea on what's going on, I'll see if I can put together some
kind of stress test, being able to reproduce it more systematically would
certainly help.

Francesco



